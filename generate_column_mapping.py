import re
from pathlib import Path
REPO_ROOT = Path(__file__).resolve().parent
LEGACY_DDL = REPO_ROOT / "ddl.sql"
REFACTORED_DDL = REPO_ROOT / "refactored_ddl.sql"
MAPPING_SCRIPT = REPO_ROOT / "refactored_ddl.sh"
OUTPUT = REPO_ROOT / "refactored_column_mapping.md"


def parse_tables_from_ddl(path: Path):
    tables = {}
    current_table = None
    columns = []
    with path.open() as fh:
        for raw_line in fh:
            line = raw_line.strip()
            if not line:
                continue
            if line.startswith("--"):
                continue
            create_match = re.match(r"CREATE TABLE\s+(?:IF NOT EXISTS\s+)?`?(\w+)`? \(", line, re.IGNORECASE)
            if create_match:
                current_table = create_match.group(1)
                columns = []
                continue
            if current_table:
                if line.startswith(")"):
                    tables[current_table] = columns
                    current_table = None
                    columns = []
                    continue
                # remove trailing comment
                line_no_comment = line.split("--", 1)[0].rstrip(",")
                line_no_comment = line_no_comment.rstrip(",")
                if not line_no_comment:
                    continue
                # skip constraints
                upper = line_no_comment.upper()
                if upper.startswith("PRIMARY KEY") or upper.startswith("UNIQUE") or upper.startswith("KEY ") or upper.startswith("CONSTRAINT") or upper.startswith("INDEX") or upper.startswith("FOREIGN KEY"):
                    continue
                col_match = re.match(r"`?(\w+)`? ", line_no_comment)
                if col_match:
                    columns.append(col_match.group(1))
    return tables


def parse_mapping_from_script(path: Path):
    mapping = {}
    pattern = re.compile(r"^\s*(\w+) -> (.+)$")
    for raw_line in path.read_text().splitlines():
        raw_line = raw_line.strip().strip("\"")
        if "->" not in raw_line:
            continue
        match = pattern.match(raw_line)
        if not match:
            continue
        legacy = match.group(1)
        targets_str = match.group(2)
        targets = []
        for part in targets_str.split(","):
            clean = part.strip()
            if not clean:
                continue
            clean = clean.split(" (", 1)[0]
            clean = clean.replace("`", "")
            targets.append(clean)
        mapping[legacy] = targets
    return mapping


legacy_tables = parse_tables_from_ddl(LEGACY_DDL)
refactored_tables = parse_tables_from_ddl(REFACTORED_DDL)
legacy_to_targets = parse_mapping_from_script(MAPPING_SCRIPT)

notes_hint = {
    "relationship_links": "Polymorphic join row. Use left/right identifiers according to the relationship semantics documented in refactored_ddl.sh.",
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


def resolve_column_mapping(legacy_table, column):
    targets = legacy_to_targets.get(legacy_table, [])
    direct_hits = []
    for target in targets:
        target_cols = refactored_tables.get(target, [])
        if column in target_cols:
            direct_hits.append(f"{target}.{column}")
    if direct_hits:
        return ", ".join(direct_hits), "Direct column carried forward."
    # Heuristic for polymorphic IDs
    for target in targets:
        target_cols = refactored_tables.get(target, [])
        if column.endswith("_id"):
            if "left_id" in target_cols or "right_id" in target_cols:
                return target, "Map into polymorphic id slots (left/right) per relationship role."
            if "entity_id" in target_cols:
                return f"{target}.entity_id", "Mapped into canonical entity reference."
            if "target_id" in target_cols:
                return f"{target}.target_id", "Mapped into generic target identifier."
            if "owner_id" in target_cols:
                return f"{target}.owner_id", "Mapped into owner identifier."
            if "address_id" in target_cols:
                return f"{target}.address_id", "Linked to shared address row via address_id."
            if "accountable_id" in target_cols:
                return f"{target}.accountable_id", "Use accountable polymorphic reference."
        if column in {"created_at", "updated_at", "deleted_at", "valid_from", "valid_to"}:
            if column in target_cols:
                return f"{target}.{column}", "Timestamp preserved verbatim."
            replacements = {
                "created_at": "started_at",
                "updated_at": "ended_at",
                "deleted_at": "ended_at",
            }
            repl = replacements.get(column)
            if repl and repl in target_cols:
                return f"{target}.{repl}", "Temporal column normalized during refactor."
    if targets:
        hint = notes_hint.get(targets[0], "Use attribute_assignments or related detail tables introduced in the refactored schema.")
        return targets[0], hint
    return "(no target)", "Table not present in mapping narrative; review manually."


lines = []
lines.append("# Comprehensive Legacy-to-Refactored Column Mapping\n")
lines.append("This table enumerates every column defined in the legacy `ddl.sql` schema and captures its default landing zone inside the refactored design. Mappings are derived by cross-referencing `refactored_ddl.sh` with shared column names in `refactored_ddl.sql`. Columns without a direct twin are annotated with the canonical pattern to use during migration.\n")
lines.append("| Legacy table | Legacy column | Target structure | Mapping guidance |")
lines.append("| --- | --- | --- | --- |")

for table in sorted(legacy_tables):
    for column in legacy_tables[table]:
        target, guidance = resolve_column_mapping(table, column)
        target_display = target if isinstance(target, str) else ", ".join(target)
        guidance = guidance.replace("|", "\\|")
        lines.append(f"| `{table}` | `{column}` | {target_display} | {guidance} |")

OUTPUT.write_text("\n".join(lines))
