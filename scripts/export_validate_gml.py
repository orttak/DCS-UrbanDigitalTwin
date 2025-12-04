#!/usr/bin/env python3
"""
One-step CityGML export + validation.
 - Exports CityGML from 3DCityDB via citydb-tool (Docker).
 - Validates the exported GML using citygml-tools (Docker).

Defaults are tuned for local Docker Desktop with the DB reachable on host.docker.internal:5432.
Override via CLI flags or environment variables.
"""
import argparse
import os
import subprocess
import sys
from pathlib import Path


def run(cmd: list[str], **kwargs) -> None:
    print(">>", " ".join(cmd))
    result = subprocess.run(cmd, text=True, **kwargs)
    if result.returncode != 0:
        sys.stderr.write(result.stdout or "")
        sys.stderr.write(result.stderr or "")
        raise SystemExit(result.returncode)


def main() -> None:
    parser = argparse.ArgumentParser(description="Export CityGML from 3DCityDB and validate it.")
    parser.add_argument("--db-host", default=os.getenv("DB_HOST", "host.docker.internal"))
    parser.add_argument("--db-port", default=os.getenv("DB_PORT", "5432"))
    parser.add_argument("--db-name", default=os.getenv("DB_NAME", "citydb"))
    parser.add_argument("--db-user", default=os.getenv("DB_USER", "postgres"))
    parser.add_argument("--db-pass", default=os.getenv("DB_PASS", "postgres"))
    parser.add_argument(
        "--network",
        default=os.getenv("DOCKER_NETWORK", ""),
        help="Optional Docker network for the citydb-tool container.",
    )
    parser.add_argument(
        "--lod",
        default=os.getenv("LOD", ""),
        help="Comma-separated LoDs to export (optional). Example: 2,3",
    )
    parser.add_argument(
        "--output",
        default=os.getenv("OUTPUT", "data/from_db/from_citydb.gml"),
        help="Path to write the CityGML file.",
    )
    args = parser.parse_args()

    out_path = Path(args.output).resolve()
    out_dir = out_path.parent
    out_dir.mkdir(parents=True, exist_ok=True)

    # Export CityGML
    export_cmd = [
        "docker",
        "run",
        "--rm",
        "-v",
        f"{out_dir.as_posix()}:/input",
    ]
    if args.network:
        export_cmd.extend(["--network", args.network])
    export_cmd.extend(
        [
            "3dcitydb/citydb-tool:latest",
            "export",
            "citygml",
            "-H",
            args.db_host,
            "-P",
            str(args.db_port),
            "-d",
            args.db_name,
            "-u",
            args.db_user,
        ]
    )
    if args.db_pass:
        export_cmd.extend(["-p", args.db_pass])
    if args.lod:
        export_cmd.extend(["-l", args.lod])
    export_cmd.extend(["-o", f"/input/{out_path.name}"])

    run(export_cmd)

    # Validate with citygml-tools (Docker image)
    validate_cmd = [
        "docker",
        "run",
        "--rm",
        "-v",
        f"{out_dir.as_posix()}:/input",
        "ghcr.io/citygml4j/citygml-tools:latest",
        "validate",
        "--input",
        f"/input/{out_path.name}",
    ]
    run(validate_cmd)
    print(f"Validation succeeded: {out_path}")


if __name__ == "__main__":
    main()
