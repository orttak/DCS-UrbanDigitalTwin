"""Validate and prepare a CityJSON file without Blender.

Usage:
  python scripts/validate_cityjson.py path/to/file.json [--no-textures]
Requires cjio on PATH for full schema validation; otherwise only structural checks run.
"""

import argparse
import importlib.util
import subprocess
import sys
import shutil
import os
from pathlib import Path

# Load validation module directly to avoid importing Blender-dependent __init__.py
ROOT = Path(__file__).resolve().parents[1]
VALIDATION_PATH = ROOT / "CityJSONEditor" / "core" / "validation.py"
spec = importlib.util.spec_from_file_location("validation", VALIDATION_PATH)
if spec is None or spec.loader is None:
    print("Could not load validation module.")
    sys.exit(1)
validation = importlib.util.module_from_spec(spec)
spec.loader.exec_module(validation)
prepare_cityjson_for_import = validation.prepare_cityjson_for_import


def run_cjio(path: Path) -> tuple[bool, str]:
    # Prefer CJIO_BIN env, then local .venv, then PATH
    env_bin = Path(os.environ.get("CJIO_BIN", "")) if os.environ.get("CJIO_BIN") else None
    venv_bin = ROOT / ".venv" / "bin" / "cjio"
    cjio_bin = None
    if env_bin and env_bin.exists():
        cjio_bin = str(env_bin)
    elif venv_bin.exists():
        cjio_bin = str(venv_bin)
    else:
        cjio_bin = shutil.which("cjio")
    if not cjio_bin:
        return False, "cjio not found (set CJIO_BIN or install into .venv)"
    result = subprocess.run([cjio_bin, str(path), "validate"], capture_output=True, text=True)
    if result.returncode != 0:
        return False, result.stderr.strip() or result.stdout.strip() or f"cjio exited {result.returncode}"
    return True, "cjio validation passed"


def main():
    parser = argparse.ArgumentParser(description="Prepare + validate a CityJSON file (no Blender needed)")
    parser.add_argument("filepath", type=Path, help="CityJSON file path")
    parser.add_argument("--no-textures", action="store_true", help="Strip textures during validation")
    args = parser.parse_args()

    ok, msg, _ = prepare_cityjson_for_import(args.filepath, allow_textures=not args.no_textures)
    if not ok:
        print(f"Preparation failed: {msg}")
        sys.exit(1)
    ok, msg = run_cjio(args.filepath)
    if not ok:
        print(f"cjio validation failed: {msg}")
        sys.exit(1)
    print(msg)


if __name__ == "__main__":
    main()
