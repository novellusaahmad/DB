"""Automated legacy-to-refactored data migration helper.

This module builds a column-level migration plan by combining the
legacy/target DDL snapshots with the curated table mapping captured in
``refactored_ddl.sh``.  When executed with database connection strings,
it can replay every direct column mapping into the refactored schema.

Example usage (plan only)::

    python data_migration.py --plan-only

Execute the auto-migratable portion of the plan (requires SQLAlchemy
connection strings)::

    python data_migration.py \
        --source-dsn postgresql+psycopg://user:pass@legacy-host/legacy_db \
        --target-dsn postgresql+psycopg://user:pass@target-host/refactored_db \
        --execute

The script only performs deterministic column copies where the refactored
schema exposes a column with the same name.  Columns that require
polymorphic joins or attribute fan-out remain in the plan output with
migration guidance so they can be handled by bespoke ETL logic.
"""

from __future__ import annotations

import argparse
import json
import logging
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

from sqlalchemy import create_engine, text
from sqlalchemy.engine import Connection, Engine, Result

REPO_ROOT = Path(__file__).resolve().parent
DEFAULT_LEGACY_DDL = REPO_ROOT / "ddl.sql"
DEFAULT_REFACTORED_DDL = REPO_ROOT / "refactored_ddl.sql"
DEFAULT_MAPPING_SCRIPT = REPO_ROOT / "refactored_ddl.sh"
DEFAULT_COLUMN_MAPPING = REPO_ROOT / "refactored_column_mapping.md"


def parse_tables_from_ddl(path: Path) -> Dict[str, List[str]]:
    """Parse a SQL DDL file into ``table -> [columns]`` mapping."""

    tables: Dict[str, List[str]] = {}
    current_table: Optional[str] = None
    columns: List[str] = []

    with path.open() as fh:
        for raw_line in fh:
            line = raw_line.strip()
            if not line or line.startswith("--"):
                continue

            create_match = re.match(
                r"CREATE TABLE\s+(?:IF NOT EXISTS\s+)?`?(\w+)`? \(", line, re.IGNORECASE
            )
            if create_match:
                current_table = create_match.group(1)
                columns = []
                continue

            if current_table is None:
                continue

            if line.startswith(")"):
                tables[current_table] = columns
                current_table = None
                columns = []
                continue

            line_no_comment = line.split("--", 1)[0].rstrip(",")
            line_no_comment = line_no_comment.rstrip(",")
            if not line_no_comment:
                continue

            upper = line_no_comment.upper()
            if upper.startswith(
                (
                    "PRIMARY KEY",
                    "UNIQUE",
                    "KEY ",
                    "CONSTRAINT",
                    "INDEX",
                    "FOREIGN KEY",
                )
            ):
                continue

            col_match = re.match(r"`?(\w+)`? ", line_no_comment)
            if col_match:
                columns.append(col_match.group(1))

    return tables


def parse_mapping_from_script(path: Path) -> Dict[str, List[str]]:
    """Extract ``legacy_table -> [target tables]`` mapping from the shell script."""

    mapping: Dict[str, List[str]] = {}
    pattern = re.compile(r"^\s*(\w+) -> (.+)$")

    for raw_line in path.read_text().splitlines():
        cleaned = raw_line.strip().strip("\"")
        if "->" not in cleaned:
            continue
        match = pattern.match(cleaned)
        if not match:
            continue
        legacy = match.group(1)
        targets_str = match.group(2)
        targets: List[str] = []
        for part in targets_str.split(","):
            clean_part = part.strip()
            if not clean_part:
                continue
            clean_part = clean_part.split(" (", 1)[0]
            clean_part = clean_part.replace("`", "")
            targets.append(clean_part)
        mapping[legacy] = targets

    return mapping


def parse_column_mapping(path: Path) -> Dict[Tuple[str, str], Tuple[List[str], str]]:
    """Read the Markdown table that captures the curated column mapping."""

    column_mapping: Dict[Tuple[str, str], Tuple[List[str], str]] = {}
    if not path.exists():
        return column_mapping

    for raw_line in path.read_text().splitlines():
        line = raw_line.strip()
        if not line.startswith("| `"):
            continue

        cells = [cell.strip() for cell in line.split("|")]
        if len(cells) < 5:
            continue

        legacy_table = cells[1].strip("` ")
        legacy_column = cells[2].strip("` ")
        target_cell = cells[3]
        guidance = cells[4]

        targets: List[str] = []
        for chunk in target_cell.split(","):
            cleaned = chunk.strip()
            if not cleaned:
                continue
            cleaned = cleaned.split(" (", 1)[0]
            cleaned = cleaned.replace("`", "")
            targets.append(cleaned)

        column_mapping[(legacy_table, legacy_column)] = (targets, guidance)

    return column_mapping


@dataclass
class MappingResult:
    direct_targets: List[str]
    fallback_target: str
    guidance: str


@dataclass
class ColumnMapping:
    legacy_table: str
    legacy_column: str
    target_table: str
    target_column: str
    guidance: str = "Direct column copy"


@dataclass
class ManualMapping:
    legacy_table: str
    legacy_column: str
    target_hint: str
    guidance: str


@dataclass
class TablePlan:
    legacy_table: str
    auto_mappings: Dict[str, List[ColumnMapping]] = field(default_factory=dict)
    manual_mappings: List[ManualMapping] = field(default_factory=list)

    @property
    def auto_column_count(self) -> int:
        return sum(len(cols) for cols in self.auto_mappings.values())

    @property
    def manual_column_count(self) -> int:
        return len(self.manual_mappings)


class MappingResolver:
    """Translate legacy columns into refactored destinations."""

    def __init__(
        self,
        legacy_tables: Dict[str, List[str]],
        refactored_tables: Dict[str, List[str]],
        legacy_to_targets: Dict[str, List[str]],
        column_mapping: Dict[Tuple[str, str], Tuple[List[str], str]] | None = None,
    ) -> None:
        self.legacy_tables = legacy_tables
        self.refactored_tables = refactored_tables
        self.legacy_to_targets = legacy_to_targets
        self.column_mapping = column_mapping or {}
        self.notes_hint: Dict[str, str] = {
            "relationship_links": "Polymorphic join row. Populate left/right identifiers according to the relationship semantics described in refactored_ddl.sh.",
            "note_links": "Polymorphic note attachment. Use notable_type/notable_id with curated role references.",
            "notes": "Centralized note body storage. Preserve note authorship and timestamps.",
            "financial_accounts": "Standardized financial account schema; use attribute assignments for any institution-specific extensions.",
            "postal_addresses": "Normalized address catalog shared via address_links.",
            "address_links": "Associative link between owner and postal address. Use addressable_type/addressable_id for polymorphism.",
            "contact_points": "Polymorphic contact info with contactable_type/contactable_id context.",
            "attribute_assignments": "Reusable attribute fabric that captures governed extensions by data type.",
            "reference_values": "Domain-driven lookup entry stored via shared reference framework.",
            "reference_domains": "Reference domain catalog; columns unchanged.",
            "audit_events": "Audit timeline. Map actor/scope identifiers and persist field-level deltas via audit_event_changes.",
            "system_jobs": "Asynchronous job queue. Persist handler arguments in dedicated columns and optional related-record pointers.",
            "system_settings": "Configuration registry. Typed columns replace generic value blobs for clearer governance.",
            "integration_settings": "Integration configuration. Dedicated columns store endpoint and credential references.",
            "entities": "Canonical party/person/company row. Preserve profile attributes or extend via attribute_assignments.",
            "entity_credentials": "Authentication credentials. Align identifiers with entity_id and credential fields; extend via attribute_assignments when necessary.",
            "workflow_events": "Workflow audit trail. Map timestamps and actor references into normalized event fields.",
            "workflow_definitions": "Workflow definition catalog. Persist structural details through workflow_steps and related tables.",
            "workflow_steps": "Ordered workflow stages. Use step order, automation flags, and dedicated attributes for specialized behavior.",
            "deal_terms": "Deal economics. Normalize numeric thresholds and timing values into standardized columns or deal_settings.",
            "document_links": "Document attachment join. Map owning model via documentable_type/documentable_id.",
            "notifications": "Notification blueprint. Context references live in structured columns or notification_targets rows.",
            "notification_templates": "Notification template library. Port subject/body into template fields; use attribute_assignments for variants.",
            "notification_targets": "Recipient configuration. Map target polymorphism through target_type/target_id with explicit delivery result columns.",
        }

    def resolve(self, legacy_table: str, column: str) -> MappingResult:
        explicit = self.column_mapping.get((legacy_table, column))
        if explicit:
            targets, guidance = explicit
            direct_hits = [target for target in targets if "." in target]
            fallback = ""
            for target in targets:
                if "." not in target:
                    fallback = target
                    break
            if not fallback and targets:
                fallback = targets[0]
            return MappingResult(direct_targets=direct_hits, fallback_target=fallback, guidance=guidance)

        targets = self.legacy_to_targets.get(legacy_table, [])
        direct_hits: List[str] = []

        for target in targets:
            target_cols = self.refactored_tables.get(target, [])
            if column in target_cols:
                direct_hits.append(f"{target}.{column}")

        if direct_hits:
            return MappingResult(direct_hits=direct_hits, fallback_target="", guidance="Direct column carried forward.")

        # Heuristic for polymorphic ID placement
        for target in targets:
            target_cols = self.refactored_tables.get(target, [])
            if column.endswith("_id"):
                if "left_id" in target_cols or "right_id" in target_cols:
                    return MappingResult(
                        direct_targets=[],
                        fallback_target=target,
                        guidance="Map into polymorphic id slots (left/right) per relationship role.",
                    )
                if "entity_id" in target_cols:
                    return MappingResult(
                        direct_targets=[],
                        fallback_target=f"{target}.entity_id",
                        guidance="Map to canonical entity reference (entity_id).",
                    )
                if "target_id" in target_cols:
                    return MappingResult(
                        direct_targets=[],
                        fallback_target=f"{target}.target_id",
                        guidance="Map into generic target identifier.",
                    )
                if "owner_id" in target_cols:
                    return MappingResult(
                        direct_targets=[],
                        fallback_target=f"{target}.owner_id",
                        guidance="Map into owner identifier (owner_id).",
                    )
                if "address_id" in target_cols:
                    return MappingResult(
                        direct_targets=[],
                        fallback_target=f"{target}.address_id",
                        guidance="Link to shared address row via address_id.",
                    )
                if "accountable_id" in target_cols:
                    return MappingResult(
                        direct_targets=[],
                        fallback_target=f"{target}.accountable_id",
                        guidance="Use accountable polymorphic reference.",
                    )

            if column in {"created_at", "updated_at", "deleted_at", "valid_from", "valid_to"}:
                if column in target_cols:
                    return MappingResult(
                        direct_targets=[f"{target}.{column}"],
                        fallback_target="",
                        guidance="Timestamp preserved verbatim.",
                    )
                replacements = {
                    "created_at": "started_at",
                    "updated_at": "ended_at",
                    "deleted_at": "ended_at",
                }
                replacement = replacements.get(column)
                if replacement and replacement in target_cols:
                    return MappingResult(
                        direct_targets=[f"{target}.{replacement}"],
                        fallback_target="",
                        guidance="Temporal column normalized during refactor.",
                    )

        if targets:
            hint = self.notes_hint.get(
                targets[0],
                "Use attribute_assignments or related detail tables introduced in the refactored schema.",
            )
            return MappingResult(direct_targets=[], fallback_target=targets[0], guidance=hint)

        return MappingResult(
            direct_targets=[],
            fallback_target="(no target)",
            guidance="Table not present in mapping narrative; review manually.",
        )


class MigrationPlanner:
    """Build migration plans using deterministic column copies."""

    def __init__(
        self,
        legacy_ddl: Path = DEFAULT_LEGACY_DDL,
        refactored_ddl: Path = DEFAULT_REFACTORED_DDL,
        mapping_script: Path = DEFAULT_MAPPING_SCRIPT,
        column_mapping: Path = DEFAULT_COLUMN_MAPPING,
    ) -> None:
        if not legacy_ddl.exists() or not refactored_ddl.exists() or not mapping_script.exists():
            raise FileNotFoundError("One or more schema artifacts are missing. Ensure ddl.sql, refactored_ddl.sql, and refactored_ddl.sh are present.")

        self.legacy_tables = parse_tables_from_ddl(legacy_ddl)
        self.refactored_tables = parse_tables_from_ddl(refactored_ddl)
        self.legacy_to_targets = parse_mapping_from_script(mapping_script)
        self.column_mapping = parse_column_mapping(column_mapping)
        self.resolver = MappingResolver(
            self.legacy_tables, self.refactored_tables, self.legacy_to_targets, self.column_mapping
        )

    def build_plan(self) -> List[TablePlan]:
        plans: List[TablePlan] = []
        for legacy_table, columns in sorted(self.legacy_tables.items()):
            plan = TablePlan(legacy_table=legacy_table)
            for column in columns:
                result = self.resolver.resolve(legacy_table, column)
                if len(result.direct_targets) == 1:
                    target_entry = result.direct_targets[0]
                    if "." not in target_entry:
                        # Guard against partial hints such as "workflow_steps"
                        plan.manual_mappings.append(
                            ManualMapping(
                                legacy_table=legacy_table,
                                legacy_column=column,
                                target_hint=result.fallback_target or target_entry,
                                guidance=result.guidance,
                            )
                        )
                        continue
                    target_table, target_column = target_entry.split(".", 1)
                    plan.auto_mappings.setdefault(target_table, []).append(
                        ColumnMapping(
                            legacy_table=legacy_table,
                            legacy_column=column,
                            target_table=target_table,
                            target_column=target_column,
                            guidance=result.guidance,
                        )
                    )
                elif result.direct_targets:
                    # Ambiguous direct target – flag for manual intervention
                    plan.manual_mappings.append(
                        ManualMapping(
                            legacy_table=legacy_table,
                            legacy_column=column,
                            target_hint=", ".join(result.direct_targets),
                            guidance="Multiple possible destinations; choose appropriate target.",
                        )
                    )
                else:
                    plan.manual_mappings.append(
                        ManualMapping(
                            legacy_table=legacy_table,
                            legacy_column=column,
                            target_hint=result.fallback_target,
                            guidance=result.guidance,
                        )
                    )
            plans.append(plan)
        return plans

    @staticmethod
    def summarize_plan(plans: Sequence[TablePlan]) -> Dict[str, int]:
        auto_columns = sum(plan.auto_column_count for plan in plans)
        manual_columns = sum(plan.manual_column_count for plan in plans)
        auto_tables = sum(1 for plan in plans if plan.auto_mappings)
        manual_tables = sum(1 for plan in plans if plan.manual_mappings)
        return {
            "auto_columns": auto_columns,
            "manual_columns": manual_columns,
            "tables_with_auto": auto_tables,
            "tables_with_manual": manual_tables,
        }

    @staticmethod
    def plan_to_dict(plans: Sequence[TablePlan]) -> Dict[str, Dict[str, object]]:
        plan_dict: Dict[str, Dict[str, object]] = {}
        for plan in plans:
            plan_dict[plan.legacy_table] = {
                "auto": {
                    target_table: [
                        {
                            "legacy_column": mapping.legacy_column,
                            "target_column": mapping.target_column,
                            "guidance": mapping.guidance,
                        }
                        for mapping in sorted(
                            mappings, key=lambda item: item.legacy_column
                        )
                    ]
                    for target_table, mappings in sorted(plan.auto_mappings.items())
                },
                "manual": [
                    {
                        "legacy_column": manual.legacy_column,
                        "target_hint": manual.target_hint,
                        "guidance": manual.guidance,
                    }
                    for manual in sorted(
                        plan.manual_mappings, key=lambda item: item.legacy_column
                    )
                ],
            }
        return plan_dict

    @staticmethod
    def pretty_print_plan(plans: Sequence[TablePlan], max_manual: int = 5) -> None:
        for plan in plans:
            logging.info("Legacy table: %s", plan.legacy_table)
            if plan.auto_mappings:
                for target_table, mappings in sorted(plan.auto_mappings.items()):
                    column_list = ", ".join(
                        f"{m.legacy_column}->{m.target_column}" for m in sorted(
                            mappings, key=lambda item: item.legacy_column
                        )
                    )
                    logging.info("  Auto: %-24s %s", target_table, column_list)
            else:
                logging.info("  Auto: (none)")

            if plan.manual_mappings:
                logging.info("  Manual columns (%d total):", len(plan.manual_mappings))
                for manual in plan.manual_mappings[:max_manual]:
                    logging.info(
                        "    %s -> %s | %s",
                        manual.legacy_column,
                        manual.target_hint,
                        manual.guidance,
                    )
                if len(plan.manual_mappings) > max_manual:
                    logging.info(
                        "    ... %d additional manual columns omitted from preview",
                        len(plan.manual_mappings) - max_manual,
                    )
            else:
                logging.info("  Manual: (none)")


class DataMigrator:
    """Execute deterministic column copies from legacy to refactored schema."""

    def __init__(
        self,
        source_engine: Engine,
        target_engine: Engine,
        batch_size: int = 500,
        truncate_targets: bool = False,
    ) -> None:
        self.source_engine = source_engine
        self.target_engine = target_engine
        self.batch_size = batch_size
        self.truncate_targets = truncate_targets

    def run(self, plans: Sequence[TablePlan]) -> None:
        table_targets: Dict[str, List[Tuple[str, List[ColumnMapping]]]] = {}
        for plan in plans:
            if not plan.auto_mappings:
                continue
            table_targets[plan.legacy_table] = [
                (target, mappings) for target, mappings in plan.auto_mappings.items()
            ]

        if not table_targets:
            logging.warning("No deterministic column mappings available to execute.")
            return

        if self.truncate_targets:
            self._truncate_targets(table_targets)

        with self.source_engine.connect() as source_conn, self.target_engine.begin() as target_conn:
            for legacy_table, targets in table_targets.items():
                for target_table, mappings in targets:
                    self._migrate_table_pair(
                        source_conn, target_conn, legacy_table, target_table, mappings
                    )

    def _truncate_targets(self, table_targets: Dict[str, List[Tuple[str, List[ColumnMapping]]]]) -> None:
        seen: set[str] = set()
        with self.target_engine.begin() as conn:
            for target_entries in table_targets.values():
                for target_table, _ in target_entries:
                    if target_table in seen:
                        continue
                    logging.info("Truncating %s before migration", target_table)
                    conn.execute(text(f"DELETE FROM {target_table}"))
                    seen.add(target_table)

    def _migrate_table_pair(
        self,
        source_conn: Connection,
        target_conn: Connection,
        legacy_table: str,
        target_table: str,
        mappings: Sequence[ColumnMapping],
    ) -> None:
        legacy_columns = [mapping.legacy_column for mapping in mappings]
        target_columns = [mapping.target_column for mapping in mappings]

        select_sql = text(
            f"SELECT {', '.join(legacy_columns)} FROM {legacy_table}"
        )
        insert_sql = text(
            "INSERT INTO {table} ({columns}) VALUES ({placeholders})".format(
                table=target_table,
                columns=", ".join(target_columns),
                placeholders=", ".join(f":{col}" for col in target_columns),
            )
        )

        logging.info(
            "Migrating %s.%s -> %s (%d columns)",
            legacy_table,
            ",".join(legacy_columns),
            target_table,
            len(target_columns),
        )

        result: Result = source_conn.execute(select_sql)
        while True:
            rows = result.fetchmany(self.batch_size)
            if not rows:
                break
            payloads = [
                {target_columns[idx]: row[idx] for idx in range(len(target_columns))}
                for row in rows
            ]
            target_conn.execute(insert_sql, payloads)
        logging.info(
            "Completed %s -> %s copy", legacy_table, target_table
        )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate and optionally execute legacy-to-refactored data migrations.",
    )
    parser.add_argument(
        "--legacy-ddl",
        type=Path,
        default=DEFAULT_LEGACY_DDL,
        help="Path to the legacy schema DDL (defaults to ddl.sql).",
    )
    parser.add_argument(
        "--refactored-ddl",
        type=Path,
        default=DEFAULT_REFACTORED_DDL,
        help="Path to the refactored schema DDL (defaults to refactored_ddl.sql).",
    )
    parser.add_argument(
        "--mapping-script",
        type=Path,
        default=DEFAULT_MAPPING_SCRIPT,
        help="Path to refactored_ddl.sh for table-level mapping hints.",
    )
    parser.add_argument(
        "--column-mapping",
        type=Path,
        default=DEFAULT_COLUMN_MAPPING,
        help="Path to refactored_column_mapping.md for curated column guidance.",
    )
    parser.add_argument(
        "--plan-output",
        type=Path,
        help="Optional path to dump the full migration plan as JSON.",
    )
    parser.add_argument(
        "--source-dsn",
        help="SQLAlchemy DSN for the legacy database (required for --execute).",
    )
    parser.add_argument(
        "--target-dsn",
        help="SQLAlchemy DSN for the refactored database (required for --execute).",
    )
    parser.add_argument(
        "--batch-size",
        type=int,
        default=500,
        help="Number of rows to fetch per batch when executing migration.",
    )
    parser.add_argument(
        "--execute",
        action="store_true",
        help="Execute deterministic column copies using the generated plan.",
    )
    parser.add_argument(
        "--truncate-target",
        action="store_true",
        help="Delete data from auto-migrated target tables before copying rows.",
    )
    parser.add_argument(
        "--log-level",
        default="INFO",
        help="Logging level (DEBUG, INFO, WARNING, ERROR).",
    )
    parser.add_argument(
        "--plan-only",
        action="store_true",
        help="Alias for omitting --execute; retained for readability.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    logging.basicConfig(level=getattr(logging, args.log_level.upper(), logging.INFO))

    planner = MigrationPlanner(
        legacy_ddl=args.legacy_ddl,
        refactored_ddl=args.refactored_ddl,
        mapping_script=args.mapping_script,
        column_mapping=args.column_mapping,
    )
    plans = planner.build_plan()

    summary = MigrationPlanner.summarize_plan(plans)
    logging.info(
        "Auto columns: %s | Manual columns: %s | Tables with auto: %s | Tables with manual: %s",
        summary["auto_columns"],
        summary["manual_columns"],
        summary["tables_with_auto"],
        summary["tables_with_manual"],
    )

    MigrationPlanner.pretty_print_plan(plans)

    if args.plan_output:
        plan_dict = MigrationPlanner.plan_to_dict(plans)
        args.plan_output.write_text(json.dumps(plan_dict, indent=2))
        logging.info("Wrote plan to %s", args.plan_output)

    if args.execute or not args.plan_only:
        if not args.execute:
            logging.info("Execution disabled (plan-only mode).")
            return
        if not args.source_dsn or not args.target_dsn:
            raise ValueError("--source-dsn and --target-dsn are required when using --execute.")
        source_engine = create_engine(args.source_dsn)
        target_engine = create_engine(args.target_dsn)
        migrator = DataMigrator(
            source_engine=source_engine,
            target_engine=target_engine,
            batch_size=args.batch_size,
            truncate_targets=args.truncate_target,
        )
        migrator.run(plans)


if __name__ == "__main__":
    main()
