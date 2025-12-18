"""Validate and prepare a CityJSON file without Blender.

Usage:
  python3 scripts/validate_cityjson.py path/to/file.json [--no-textures] [--out report.txt] [--strict]

Notes:
  - This script validates the input file against the official CityJSON schemas
    (via `cjvalpy`).
  - It *also* runs the same lightweight preparation as the Blender importer
    (see `CityJSONEditor/core/validation.py`) to catch importer-breaking issues,
    but the prepared in-memory copy is not schema-validated (the importer
    normalizations may change types like `lod`).
  - If the input is not CityJSON v2.0, the script upgrades a temporary copy to
    v2.0 (using `cjio upgrade`) before running schema validation.
"""

import argparse
import importlib.util
import json
import os
import shutil
import subprocess
import sys
import tempfile
import textwrap
from pathlib import Path

# Avoid creating __pycache__ entries in the CityJSONEditor submodule when loading modules dynamically.
sys.dont_write_bytecode = True

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


def _safe_exists(path: Path) -> bool:
    try:
        return path.exists()
    except OSError:
        return False


def _detect_cjio_bin() -> str | None:
    # Prefer CJIO_BIN env, then local venvs, then PATH.
    env_bin = os.environ.get("CJIO_BIN")
    if env_bin and _safe_exists(Path(env_bin)):
        return env_bin
    for candidate in [
        ROOT / ".venv" / "bin" / "cjio",
        ROOT / ".venv" / "Scripts" / "cjio.exe",
        ROOT / ".venv" / "Scripts" / "cjio",
        ROOT / ".venv-cjio" / "bin" / "cjio",
        ROOT / ".venv-cjio" / "Scripts" / "cjio.exe",
        ROOT / ".venv-cjio" / "Scripts" / "cjio",
    ]:
        if _safe_exists(candidate):
            return str(candidate)
    return shutil.which("cjio")


def _detect_cjvalpy_python() -> str | None:
    # Prefer current interpreter (if cjvalpy import works), then CJVALPY_PYTHON env, then local venvs.
    try:
        import cjvalpy  # noqa: F401

        return sys.executable
    except Exception:
        pass
    env_py = os.environ.get("CJVALPY_PYTHON")
    if env_py and _safe_exists(Path(env_py)):
        return env_py
    for candidate in [
        ROOT / ".venv" / "bin" / "python",
        ROOT / ".venv" / "bin" / "python3",
        ROOT / ".venv" / "Scripts" / "python.exe",
        ROOT / ".venv" / "Scripts" / "python",
        ROOT / ".venv-cjio" / "bin" / "python",
        ROOT / ".venv-cjio" / "bin" / "python3",
        ROOT / ".venv-cjio" / "Scripts" / "python.exe",
        ROOT / ".venv-cjio" / "Scripts" / "python",
    ]:
        if _safe_exists(candidate):
            return str(candidate)
    return None


def _classify_cjval_report(report: str) -> str:
    if "File is invalid" in report:
        return "invalid"
    if "File is valid but has warnings" in report:
        return "warnings"
    if "File is valid" in report:
        return "valid"
    return "unknown"


def _run_cjvalpy(python_bin: str, path: Path) -> str:
    code = textwrap.dedent(
        r"""
        import json
        import urllib.request
        from pathlib import Path

        import cjvalpy

        p = Path(__import__("sys").argv[1])
        data = json.loads(p.read_text(encoding="utf-8"))

        js = [json.dumps(data)]
        exts = data.get("extensions")
        if isinstance(exts, dict):
            for ext_name, ext in exts.items():
                if not isinstance(ext, dict):
                    continue
                url = ext.get("url")
                if not url:
                    continue
                with urllib.request.urlopen(url) as f:
                    js.append(f.read().decode("utf-8"))

        v = cjvalpy.CJValidator(js)
        v.validate()
        print(v.get_report())
        """
    ).strip()
    result = subprocess.run([python_bin, "-c", code, str(path)], capture_output=True, text=True)
    if result.returncode != 0:
        raise RuntimeError(result.stderr.strip() or result.stdout.strip() or f"cjvalpy exited {result.returncode}")
    return result.stdout


def _upgrade_to_v2(cjio_bin: str, src: Path, *, ignore_duplicate_keys: bool) -> Path:
    fd, name = tempfile.mkstemp(prefix="cjio_upgrade_", suffix=".city.v2.json")
    out_path = Path(name)
    os.close(fd)
    cmd = [cjio_bin]
    if ignore_duplicate_keys:
        cmd.append("--ignore_duplicate_keys")
    cmd += [str(src), "upgrade", "save", str(out_path)]
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        out_path.unlink(missing_ok=True)
        raise RuntimeError(result.stderr.strip() or result.stdout.strip() or f"cjio exited {result.returncode}")
    return out_path


def main():
    parser = argparse.ArgumentParser(description="Prepare + validate a CityJSON file (no Blender needed)")
    parser.add_argument("filepath", type=Path, help="CityJSON file path")
    parser.add_argument("--no-textures", action="store_true", help="Strip textures for importer preparation")
    parser.add_argument("--out", type=Path, default=None, help="Write cjvalpy report to this path")
    parser.add_argument(
        "--ignore-duplicate-keys",
        action="store_true",
        help="Allow cjio to load files with duplicate JSON keys when upgrading (can hide data loss; use only for debugging).",
    )
    parser.add_argument(
        "--strict",
        action="store_true",
        help="Treat cjvalpy warnings as failures (non-zero exit code)",
    )
    args = parser.parse_args()

    ok, msg, data, changed = prepare_cityjson_for_import(
        args.filepath, allow_textures=not args.no_textures, write_back=False
    )
    if not ok:
        print(f"Preparation failed: {msg}")
        sys.exit(1)

    tmp_upgrade: Path | None = None

    try:
        py_bin = _detect_cjvalpy_python()
        if not py_bin:
            print("Schema validation skipped: cjvalpy not available (set CJVALPY_PYTHON or create .venv).")
            if changed:
                print("Importer preparation: OK (would modify a copy for Blender stability; original unchanged).")
            else:
                print("Importer preparation: OK (no changes needed).")
            return

        validate_target = args.filepath
        version = None
        if data and isinstance(data, dict):
            version = data.get("version")
        if version != "2.0":
            cjio_bin = _detect_cjio_bin()
            if not cjio_bin:
                print(
                    f"Schema validation skipped: CityJSON version is {version!r} (needs v2.0) and cjio not found for upgrade."
                )
                if changed:
                    print("Importer preparation: OK (would modify a copy for Blender stability; original unchanged).")
                else:
                    print("Importer preparation: OK (no changes needed).")
                return
            try:
                tmp_upgrade = _upgrade_to_v2(
                    cjio_bin, args.filepath, ignore_duplicate_keys=args.ignore_duplicate_keys
                )
            except RuntimeError as exc:
                print(f"Upgrade to CityJSON v2.0 failed: {exc}")
                if "duplicate key" in str(exc) and not args.ignore_duplicate_keys:
                    print("Tip: fix duplicate CityObject IDs at the source (or rerun with --ignore-duplicate-keys).")
                sys.exit(1)
            validate_target = tmp_upgrade

        try:
            report = _run_cjvalpy(py_bin, validate_target)
        except RuntimeError as exc:
            print(f"cjvalpy validation failed: {exc}")
            sys.exit(1)
        status = _classify_cjval_report(report)
        if args.out:
            args.out.parent.mkdir(parents=True, exist_ok=True)
            args.out.write_text(report, encoding="utf-8")
        print(report.rstrip())
        if status == "invalid":
            sys.exit(1)
        if status == "warnings" and args.strict:
            sys.exit(1)
        if changed:
            print("\nImporter preparation: OK (would modify a copy for Blender stability; original unchanged).")
        else:
            print("\nImporter preparation: OK (no changes needed).")
    finally:
        if tmp_upgrade and tmp_upgrade.exists():
            tmp_upgrade.unlink()


if __name__ == "__main__":
    main()
