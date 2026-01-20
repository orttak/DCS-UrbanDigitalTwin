# Task 1–2–3 Report

**Overall Validation Status:** 🔴 4 failures

## Inputs

| File | Declared Version | Notes |
|---|---|---|
| data\\export\\BuildingsLOD3.city.json | 2.0 |  |
| data\\export\\BuildingsLOD3.city-export.json | 2.0 |  |
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | 2.0 |  |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | 2.0.1 | CityJSON files should use X.Y (not X.Y.Z); use 2.0 with spec 2.0.1. |

## Version Normalization (for comparisons)

| File | Comparison Path | Note |
|---|---|---|
| data\\export\\BuildingsLOD3.city.json | data\\export\\BuildingsLOD3.city.json | already v2.0 |
| data\\export\\BuildingsLOD3.city-export.json | data\\export\\BuildingsLOD3.city-export.json | already v2.0 |
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | data\\mert_test_lod0-3_openings_cityjson2.0.city.json | already v2.0 |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | v2 normalize failed: Parsing D:\\DCS\\data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json Error: CityJSON version should be only X.Y (… |

Notes:
- Validation always uses the official CityJSON v2.0 schemas; v1.1 inputs are upgraded to a temporary v2.0 copy for schema checks.
- Comparisons can optionally run on v2.0 normalized copies so version differences don't dominate the summary.

## Validation Matrix

| File | Type | Validator | Result | Details | Report |
|---|---|---|---|---|---|
| data\\export\\BuildingsLOD3.city.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev\\test\\reports\\BuildingsLOD3.city.cjio_validate.txt |
| data\\export\\BuildingsLOD3.city.json | CityJSON | cjvalpy | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev\\test\\reports\\BuildingsLOD3.city.cjvalpy_validate.txt |
| data\\export\\BuildingsLOD3.city.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |
| data\\export\\BuildingsLOD3.city-export.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev\\test\\reports\\BuildingsLOD3.city-export.cjio_validate.txt |
| data\\export\\BuildingsLOD3.city-export.json | CityJSON | cjvalpy | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev\\test\\reports\\BuildingsLOD3.city-export.cjvalpy_validate.txt |
| data\\export\\BuildingsLOD3.city-export.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | CityJSON | cjio validate | <span style="color: #d1242f; font-weight: 600">FAIL</span> | "undefined" does not match "^(http\|https)://www.opengis.net/def/crs/" [path:/metadata/referenceSystem] | dev\\test\\reports\\mert_test_lod0-3_openings_cityjson2.0.city.cjio_validate.txt |
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | CityJSON | cjvalpy | <span style="color: #d1242f; font-weight: 600">FAIL</span> | "undefined" does not match "^(http\|https)://www.opengis.net/def/crs/" [path:/metadata/referenceSystem] | dev\\test\\reports\\mert_test_lod0-3_openings_cityjson2.0.city.cjvalpy_validate.txt |
| data\\mert_test_lod0-3_openings_cityjson2.0.city.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | CityJSON | cjio validate | <span style="color: #d1242f; font-weight: 600">FAIL</span> | cjio upgrade failed: Parsing D:\\DCS\\data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json<br>Error: CityJSON version should be only X.Y (eg '1.0') and not X.Y.Z (eg '1.0.1') |  |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | CityJSON | cjvalpy | <span style="color: #d1242f; font-weight: 600">FAIL</span> | CityJSON version "2.0.1" not supported (or missing) [only "1.0", "1.1", "2.0"] | dev\\test\\reports\\mert_test_lod0-3_openings_cityjson2.0.export.city.cjvalpy_validate.txt |
| data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |

## Comparison Summary

| Pair | Version | LoD | CityObjects | Building | BuildingPart | BuildingInstallation | WinDef | WinFaces | DoorDef | DoorFaces | Holes | Vertices | Surfaces | BBoxΔmax | ID Δ | Diff Report |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| data\\export\\BuildingsLOD3.city.json -> data\\export\\BuildingsLOD3.city-export.json | 2.0->2.0 | 3->3 | 20->20 (0) | 16->16 (0) |  | 4->4 (0) | 480->480 (0) | 480->480 (0) | 16->16 (0) | 16->16 (0) | 509->509 (0) | 4152->4152 (0) | 2577->2577 (0) | 0.0 | -0/+0 | dev\\test\\reports\\BuildingsLOD3.city__vs__BuildingsLOD3.city-export.diff.json |
| data\\export\\BuildingsLOD3.city-export.json -> data\\mert_test_lod0-3_openings_cityjson2.0.city.json | 2.0->2.0 | 3->0 | 20->1 (<span style="color: #d1242f; font-weight: 600">-19</span>) | 16->1 (<span style="color: #d1242f; font-weight: 600">-15</span>) |  | 4->0 (<span style="color: #d1242f; font-weight: 600">-4</span>) | 480->0 (<span style="color: #d1242f; font-weight: 600">-480</span>) | 480->0 (<span style="color: #d1242f; font-weight: 600">-480</span>) | 16->1 (<span style="color: #d1242f; font-weight: 600">-15</span>) | 16->1 (<span style="color: #d1242f; font-weight: 600">-15</span>) | 509->0 (<span style="color: #d1242f; font-weight: 600">-509</span>) | 4152->40 (<span style="color: #d1242f; font-weight: 600">-4112</span>) | 2577->25 (<span style="color: #d1242f; font-weight: 600">-2552</span>) | 61.540000000000006 | -20/+1 | dev\\test\\reports\\BuildingsLOD3.city-export__vs__mert_test_lod0-3_openings_cityjson2.0.city.diff.json |
| data\\export\\BuildingsLOD3.city.json -> data\\mert_test_lod0-3_openings_cityjson2.0.city.json | 2.0->2.0 | 3->0 | 20->1 (<span style="color: #d1242f; font-weight: 600">-19</span>) | 16->1 (<span style="color: #d1242f; font-weight: 600">-15</span>) |  | 4->0 (<span style="color: #d1242f; font-weight: 600">-4</span>) | 480->0 (<span style="color: #d1242f; font-weight: 600">-480</span>) | 480->0 (<span style="color: #d1242f; font-weight: 600">-480</span>) | 16->1 (<span style="color: #d1242f; font-weight: 600">-15</span>) | 16->1 (<span style="color: #d1242f; font-weight: 600">-15</span>) | 509->0 (<span style="color: #d1242f; font-weight: 600">-509</span>) | 4152->40 (<span style="color: #d1242f; font-weight: 600">-4112</span>) | 2577->25 (<span style="color: #d1242f; font-weight: 600">-2552</span>) | 61.540000000000006 | -20/+1 | dev\\test\\reports\\BuildingsLOD3.city__vs__mert_test_lod0-3_openings_cityjson2.0.city.diff.json |
| data\\export\\BuildingsLOD3.city.json -> data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json | 2.0->2.0.1 | 3->3 | 20->1 (<span style="color: #d1242f; font-weight: 600">-19</span>) | 16->1 (<span style="color: #d1242f; font-weight: 600">-15</span>) |  | 4->0 (<span style="color: #d1242f; font-weight: 600">-4</span>) | 480->0 (<span style="color: #d1242f; font-weight: 600">-480</span>) | 480->0 (<span style="color: #d1242f; font-weight: 600">-480</span>) | 16->0 (<span style="color: #d1242f; font-weight: 600">-16</span>) | 16->0 (<span style="color: #d1242f; font-weight: 600">-16</span>) | 509->0 (<span style="color: #d1242f; font-weight: 600">-509</span>) | 4152->40 (<span style="color: #d1242f; font-weight: 600">-4112</span>) | 2577->11 (<span style="color: #d1242f; font-weight: 600">-2566</span>) | 61.540000000000006 | -20/+1 | dev\\test\\reports\\BuildingsLOD3.city__vs__mert_test_lod0-3_openings_cityjson2.0.export.city.diff.json |

## Key Findings

- `data\export\BuildingsLOD3.city-export.json -> data\mert_test_lod0-3_openings_cityjson2.0.city.json`: CityObject IDs do not overlap (not a clean roundtrip / different selection).
- `data\export\BuildingsLOD3.city-export.json -> data\mert_test_lod0-3_openings_cityjson2.0.city.json`: Dominant LoD changed `3` → `0`.
- `data\export\BuildingsLOD3.city.json -> data\mert_test_lod0-3_openings_cityjson2.0.city.json`: CityObject IDs do not overlap (not a clean roundtrip / different selection).
- `data\export\BuildingsLOD3.city.json -> data\mert_test_lod0-3_openings_cityjson2.0.city.json`: Dominant LoD changed `3` → `0`.
- `data\export\BuildingsLOD3.city.json -> data\mert_test_lod0-3_openings_cityjson2.0.export.city.json`: CityObject IDs do not overlap (not a clean roundtrip / different selection).

## Fix Hints

### data\mert_test_lod0-3_openings_cityjson2.0.city.json

- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjio validate`: "undefined" does not match "^(http\|https)://www.opengis.net/def/crs/" [path:/metadata/referenceSystem]
  - Invalid CRS: set `metadata.referenceSystem` to an OGC CRS URI (e.g. `https://www.opengis.net/def/crs/EPSG/0/<code>`) or delete it.
- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjvalpy`: "undefined" does not match "^(http\|https)://www.opengis.net/def/crs/" [path:/metadata/referenceSystem]
  - Invalid CRS: set `metadata.referenceSystem` to an OGC CRS URI (e.g. `https://www.opengis.net/def/crs/EPSG/0/<code>`) or delete it.

### data\mert_test_lod0-3_openings_cityjson2.0.export.city.json

- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjio validate`: cjio upgrade failed: Parsing D:\\DCS\\data\\mert_test_lod0-3_openings_cityjson2.0.export.city.json<br>Error: CityJSON version should be only X.Y (eg '1.0') and not X.Y.Z (eg '1.0.1')
- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjvalpy`: CityJSON version "2.0.1" not supported (or missing) [only "1.0", "1.1", "2.0"]


---

# CityJSON Comparison Report

## Summary

| Metric | Base (A) | Export (B) | Delta | Change % | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| CityObjects | 20 | 1 | -19 | -95.0% | 🔴 |
| Vertices | 4152 | 40 | -4112 | -99.0% | 🔴 |
| Geometries | 17 | 1 | -16 | -94.1% | 🔴 |
| Surface Primitives | 2577 | 11 | -2566 | -99.6% | 🔴 |
| Holes | 509 | 0 | -509 | -100.0% | 🔴 |
| Textures | 0 | 0 | +0 | N/A | ⚪ |

## Object Type Changes

| Type | Base | Export | Delta | Change % |
| :--- | :--- | :--- | :--- | :--- |
| Building | 16 | 1 | -15 | -93.8% |
| BuildingInstallation | 4 | 0 | -4 | -100.0% |

## Semantic Changes

| Semantic | Base | Export | Delta | Change % | Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Window | 480 | 0 | -480 | -100.0% | 🔴 |
| Door | 16 | 0 | -16 | -100.0% | 🔴 |
| RoofSurface | 55 | 0 | -55 | -100.0% | 🔴 |
| WallSurface | 2009 | 0 | -2009 | -100.0% | 🔴 |
| GroundSurface | 16 | 11 | -5 | -31.2% | 🔴 |
| OuterFloorSurface | 1 | 0 | -1 | -100.0% | 🔴 |

### Missing IDs (Data Loss ⚠️)

**Count:** 20

Sample:
`3b3aaa30-44a9-4553-b4ee-a6226b810920`, `962ef8c4-b803-4aee-8b6a-3d38d5ca6b00`, `ID_bb45ed4d-b0b2-4a4a-9f98-91c17c377299`, `9521318f-6228-4eef-ad4a-f61a71ecac3c`, `f5699ab7-6601-4bff-9e14-0148d5a08ddb`, `3663d306-60a4-4f7e-858e-323076841bc1`, `735ac5d1-649b-4667-9081-2baba82db93a`, `49e947c4-a537-44c2-a9c6-e9ee99d36240`, `ID_44cb505f-ab57-4724-92c5-a61c464be55b`, `caf33126-a68b-4f61-a80a-aa52210befb5`, `ID_b824f538-688b-4537-b28c-f2b350e51f31`, `46b1c152-38a7-4ed1-9fd6-659361d4a84d`, `ID_88da906d-6fa7-4e53-942e-7ab8742c04c5`, `8cf64d96-27b6-4a5f-b27d-7c5ab57bd872`, `4f7116cb-1a63-4eae-8951-6715330fcc7c`, `eacf6df5-a50c-45fe-a45b-0da3df779528`, `958a46b6-7be8-485d-bf85-486342db083d`, `6b995b26-b59f-4e89-81ec-6c6aedb26c2b`, `ccf4a866-4080-4093-9a5c-37fb102a9aa8`, `1c94bc05-5633-48c7-9365-81dee85cb22f`