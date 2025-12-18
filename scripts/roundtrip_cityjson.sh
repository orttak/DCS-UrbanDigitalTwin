#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="${ROOT_DIR}/.env"

if [ -f "${ENV_FILE}" ]; then
  # shellcheck disable=SC1090
  source "${ENV_FILE}"
fi

DATA_DIR="${DATA_DIR:-${ROOT_DIR}/data}"
INPUT_FILE="${INPUT_FILE:-${DATA_DIR}/sample_cityjson_1.1.json}"
OUTPUT_FILE="${OUTPUT_FILE:-${DATA_DIR}/export_roundtrip.json}"
CITYDB_IMAGE="${CITYDB_IMAGE:-3dcitydb/citydb-tool:latest}"
CITYDB_NETWORK="${CITYDB_NETWORK:-docker_default}"
DB_HOST="${DB_HOST:-citydb}"
DB_PORT="${DB_PORT:-5432}"
DB_NAME="${DB_NAME:-citydb}"
DB_SCHEMA="${DB_SCHEMA:-}"
DB_USER="${DB_USER:-postgres}"
DB_PASS="${DB_PASS:-postgres}"
CITYJSON_VERSION="${CITYJSON_VERSION:-2.0}"
FEATURE_ID="${CITYOBJECT_ID:-building-1}"
EXPORT_LODS="${EXPORT_LODS:-}"
CJIO_BIN="${CJIO_BIN:-}"

if [ -z "${DB_SCHEMA}" ]; then
  DB_SCHEMA="citydb"
fi

mkdir -p "${DATA_DIR}"

if [ ! -f "${INPUT_FILE}" ]; then
  echo "Missing input CityJSON: ${INPUT_FILE}" >&2
  exit 1
fi

db_flags=(-H "${DB_HOST}" -P "${DB_PORT}" -d "${DB_NAME}" -u "${DB_USER}" -p "${DB_PASS}" -S "${DB_SCHEMA}")

citydb_cmd() {
  local args=(docker run --rm -v "${DATA_DIR}:/input")
  if [ -n "${CITYDB_NETWORK}" ]; then
    args+=(--network "${CITYDB_NETWORK}")
  fi
  args+=("${CITYDB_IMAGE}" "$@")
  "${args[@]}"
}

detect_cjio() {
  if [ -n "${CJIO_BIN}" ]; then
    return
  fi
  # Prefer a local venv.
  if [ -x "${ROOT_DIR}/.venv/bin/cjio" ]; then
    CJIO_BIN="${ROOT_DIR}/.venv/bin/cjio"
    return
  fi
  # Try PATH.
  if command -v cjio >/dev/null 2>&1; then
    CJIO_BIN="$(command -v cjio)"
    return
  fi
  echo "cjio not found. Install it (e.g., in .venv) or set CJIO_BIN." >&2
  exit 1
}

validate_cityjson() {
  local file="$1"
  detect_cjio
  echo "Validating with cjio: ${file}"
  local tmp status
  rm -f "${file}.cjio.log"
  set +e
  "${CJIO_BIN}" "${file}" validate >"${file}.cjio.log" 2>&1
  status=$?
  set -e
  if [ ${status} -eq 0 ]; then
    rm -f "${file}.cjio.log"
    return 0
  fi
  tmp="$(mktemp)"
  set +e
  "${CJIO_BIN}" "${file}" upgrade save "${tmp}" >/dev/null 2>&1
  "${CJIO_BIN}" "${tmp}" validate >>"${file}.cjio.log" 2>&1
  status=$?
  set -e
  rm -f "${tmp}"
  if [ ${status} -eq 0 ]; then
    echo "cjio validated the upgraded (v2.0) copy of ${file}"
    rm -f "${file}.cjio.log"
    return 0
  fi
  echo "cjio validation failed for ${file}. Log:"
  cat "${file}.cjio.log"
  exit 1
}

check_single_json_object() {
  local file="$1"
  local expected_version="$2"
  python3 - "$file" "$expected_version" <<'PY'
import json, pathlib, sys
path = pathlib.Path(sys.argv[1])
expected = sys.argv[2]
data = path.read_text(encoding="utf-8")
strip = data.lstrip()
if not strip.startswith("{"):
    sys.exit(f"{path}: does not start with a JSON object (possible JSON Lines)")
decoder = json.JSONDecoder()
obj, idx = decoder.raw_decode(data)
tail = data[idx:].strip()
if tail:
    sys.exit(f"{path}: extra data after JSON object (JSON Lines detected)")
if expected and obj.get("version") != expected:
    sys.exit(f"{path}: expected CityJSON version {expected}, found {obj.get('version')}")
print(f"{path}: single CityJSON object with version {obj.get('version')}")
PY
}

SQL_FILTER="select id from ${DB_SCHEMA}.feature where objectid = '${FEATURE_ID}'"

echo "Input:    ${INPUT_FILE}"
echo "Output:   ${OUTPUT_FILE}"
echo "DB host:  ${DB_HOST}:${DB_PORT}/${DB_NAME} (schema ${DB_SCHEMA})"
echo "Network:  ${CITYDB_NETWORK:-<none>}"
echo "Image:    ${CITYDB_IMAGE}"

validate_cityjson "${INPUT_FILE}"

echo "Cleaning previous fixture objects (if any)…"
citydb_cmd delete "${db_flags[@]}" --sql-filter "${SQL_FILTER}" --terminate-all --quiet || true

echo "Importing fixture into 3DCityDB…"
citydb_cmd import cityjson "${db_flags[@]}" /input/"$(basename "${INPUT_FILE}")"

echo "Exporting back to CityJSON v${CITYJSON_VERSION} (no JSON lines)…"
export_flags=(export cityjson "${db_flags[@]}" --cityjson-version "${CITYJSON_VERSION}" --no-json-lines)
if [ -n "${EXPORT_LODS}" ]; then
  export_flags+=(-l "${EXPORT_LODS}" --lod-search-depth all)
fi
export_flags+=(--sql-filter "${SQL_FILTER}" -o /input/"$(basename "${OUTPUT_FILE}")")
citydb_cmd "${export_flags[@]}"

echo "Peeking at exported file:"
head -n 3 "${OUTPUT_FILE}" || true

check_single_json_object "${OUTPUT_FILE}" "${CITYJSON_VERSION}"
validate_cityjson "${OUTPUT_FILE}"

echo "Roundtrip CityJSON check succeeded."
