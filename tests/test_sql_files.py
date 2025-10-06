#!/usr/bin/env python3
"""Validate SQL DDL files and optionally execute them with ``psql``."""

from __future__ import annotations

import argparse
import collections
import re
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Dict, Iterable, List, Tuple

SqlObjects = Dict[str, List[Tuple[str, int]]]

CREATE_TABLE_RE = re.compile(
    r"CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?\"?([A-Za-z0-9_]+)\"?",
    re.IGNORECASE,
)
CREATE_INDEX_RE = re.compile(
    r"CREATE\s+(?:UNIQUE\s+)?INDEX\s+(?:IF\s+NOT\s+EXISTS\s+)?\"?([A-Za-z0-9_]+)\"?",
    re.IGNORECASE,
)
ADD_CONSTRAINT_RE = re.compile(
    r"ALTER\s+TABLE\s+.+\s+ADD\s+CONSTRAINT\s+\"?([A-Za-z0-9_]+)\"?",
    re.IGNORECASE,
)


def _strip_inline_comment(line: str) -> str:
    if "--" not in line:
        return line
    comment_start = line.index("--")
    return line[:comment_start]


def _collect_objects(path: Path) -> SqlObjects:
    objects: SqlObjects = collections.defaultdict(list)
    for line_no, raw_line in enumerate(path.read_text().splitlines(), start=1):
        line = _strip_inline_comment(raw_line).strip()
        if not line:
            continue
        if match := CREATE_TABLE_RE.search(line):
            objects["table"].append((match.group(1), line_no))
        elif match := CREATE_INDEX_RE.search(line):
            objects["index"].append((match.group(1), line_no))
        elif match := ADD_CONSTRAINT_RE.search(line):
            objects["constraint"].append((match.group(1), line_no))
    return objects


def find_duplicates(objects: SqlObjects) -> List[str]:
    duplicates: List[str] = []
    for obj_type, entries in objects.items():
        names = [name for name, _ in entries]
        counter = collections.Counter(names)
        for name, count in counter.items():
            if count > 1:
                line_numbers = [str(line_no) for entry_name, line_no in entries if entry_name == name]
                duplicates.append(
                    f"Duplicate {obj_type} name '{name}' at lines {', '.join(line_numbers)}"
                )
    return duplicates


def execute_with_psql(sql_path: Path, database_url: str) -> None:
    if shutil.which("psql") is None:
        raise RuntimeError("psql is not available on PATH. Install PostgreSQL client tools to execute DDL.")
    cmd = [
        "psql",
        database_url,
        "-v",
        "ON_ERROR_STOP=1",
        "--single-transaction",
        "--file",
        str(sql_path),
    ]
    subprocess.run(cmd, check=True)


def main(argv: Iterable[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "sql_files",
        nargs="+",
        type=Path,
        help="SQL files to validate",
    )
    parser.add_argument(
        "--database-url",
        help="Database URL passed directly to psql for execution.",
    )
    parser.add_argument(
        "--execute",
        action="store_true",
        help="Execute the SQL files using psql after validation.",
    )
    args = parser.parse_args(argv)

    any_errors = False
    for sql_path in args.sql_files:
        if not sql_path.exists():
            print(f"[ERROR] {sql_path} does not exist", file=sys.stderr)
            any_errors = True
            continue
        objects = _collect_objects(sql_path)
        duplicates = find_duplicates(objects)
        if duplicates:
            any_errors = True
            print(f"[FAIL] {sql_path}: found duplicate object names:")
            for message in duplicates:
                print(f"        - {message}")
        else:
            print(f"[OK] {sql_path}: no duplicate object names detected.")

        if args.execute and not duplicates:
            if not args.database_url:
                print("[ERROR] --execute requires --database-url", file=sys.stderr)
                any_errors = True
            else:
                try:
                    execute_with_psql(sql_path, args.database_url)
                except subprocess.CalledProcessError as exc:
                    any_errors = True
                    print(f"[FAIL] Execution failed for {sql_path}: {exc}", file=sys.stderr)
                except RuntimeError as exc:
                    any_errors = True
                    print(f"[FAIL] {exc}", file=sys.stderr)

    return 1 if any_errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
