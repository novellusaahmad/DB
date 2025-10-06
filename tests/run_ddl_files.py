#!/usr/bin/env python3
"""Execute DDL scripts against a PostgreSQL database for smoke testing.

The script creates an isolated schema for every SQL file that is executed so the
existing database contents are not affected. Each SQL file is prefixed with a
``SET search_path`` statement before being sent to ``psql`` which ensures the
objects are created inside the temporary schema. After the script finishes the
schema is dropped again unless ``--keep-schema`` is supplied.
"""

from __future__ import annotations

import argparse
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Iterable

from test_sql_files import find_duplicates, _collect_objects  # type: ignore

SCHEMA_RE = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")


class ExecutionError(RuntimeError):
    """Raised when executing a SQL file fails."""


def _ensure_psql_available() -> None:
    if shutil.which("psql") is None:
        raise ExecutionError(
            "psql is not available on PATH. Install PostgreSQL client tools to execute DDL."
        )


def _validate_schema_name(schema: str) -> None:
    if not SCHEMA_RE.match(schema):
        raise ValueError(
            "Schema names must start with a letter or underscore and contain only "
            "letters, numbers, and underscores."
        )


def _run_psql(database_url: str, *args: str) -> None:
    cmd = ["psql", database_url, "-v", "ON_ERROR_STOP=1", *args]
    subprocess.run(cmd, check=True)


def _prepare_sql_file(sql_path: Path, schema: str) -> Path:
    original_sql = sql_path.read_text()
    prefixed_sql = f"SET search_path TO {schema};\n{original_sql}"
    temp_file = tempfile.NamedTemporaryFile("w", suffix=".sql", delete=False)
    try:
        temp_file.write(prefixed_sql)
    finally:
        temp_file.close()
    return Path(temp_file.name)


def _execute_sql_file(sql_path: Path, database_url: str, schema: str, keep_schema: bool) -> None:
    if not sql_path.exists():
        raise FileNotFoundError(f"SQL file {sql_path} does not exist")

    objects = _collect_objects(sql_path)
    duplicates = find_duplicates(objects)
    if duplicates:
        formatted = "\n        - ".join(duplicates)
        raise ExecutionError(
            f"Refusing to execute {sql_path}: duplicate object names detected:\n        - {formatted}"
        )

    _run_psql(database_url, "-c", f"DROP SCHEMA IF EXISTS {schema} CASCADE;")
    _run_psql(database_url, "-c", f"CREATE SCHEMA {schema};")

    temp_sql = _prepare_sql_file(sql_path, schema)
    try:
        env = os.environ.copy()
        env.setdefault("PGCLIENTENCODING", "UTF8")
        try:
            subprocess.run(
                ["psql", database_url, "-v", "ON_ERROR_STOP=1", "--file", str(temp_sql)],
                check=True,
                env=env,
            )
        except subprocess.CalledProcessError as exc:
            raise ExecutionError(f"Execution failed for {sql_path}: {exc}") from exc
    finally:
        temp_sql.unlink(missing_ok=True)
        if not keep_schema:
            _run_psql(database_url, "-c", f"DROP SCHEMA IF EXISTS {schema} CASCADE;")


def main(argv: Iterable[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "database_url",
        help="SQLAlchemy-style PostgreSQL URL passed directly to psql.",
    )
    parser.add_argument(
        "sql_files",
        nargs="+",
        type=Path,
        help="SQL files to execute for validation.",
    )
    parser.add_argument(
        "--schema",
        default="ddl_validation",
        help="Temporary schema used for executing the DDL (default: %(default)s).",
    )
    parser.add_argument(
        "--keep-schema",
        action="store_true",
        help="Do not drop the temporary schema after execution.",
    )
    args = parser.parse_args(argv)

    try:
        _ensure_psql_available()
        _validate_schema_name(args.schema)
    except (ExecutionError, ValueError) as exc:
        print(f"[ERROR] {exc}", file=sys.stderr)
        return 1

    failures = 0
    for sql_path in args.sql_files:
        schema_name = f"{args.schema}_{sql_path.stem}"
        try:
            _validate_schema_name(schema_name)
        except ValueError:
            # Fallback to base schema if the composed name is invalid (e.g. contains a dot)
            schema_name = args.schema
        try:
            print(f"[INFO] Executing {sql_path} using schema '{schema_name}'...")
            _execute_sql_file(sql_path, args.database_url, schema_name, args.keep_schema)
            print(f"[OK] {sql_path} executed successfully.")
        except (ExecutionError, FileNotFoundError, subprocess.CalledProcessError) as exc:
            failures += 1
            print(f"[FAIL] {exc}", file=sys.stderr)

    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
