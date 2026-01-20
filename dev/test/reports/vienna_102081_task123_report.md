# Task 1–2–3 Report

## Inputs

| File | Declared Version | Notes |
|---|---|---|
| data/Vienna_102081.city.json | 2.0 |  |
| data/Vienna_102081-export.city.json | 1.1 |  |
| data/Vienna_102081-exportwithdoorwindowandblacony.city.json | 1.1 |  |

## Version Normalization (for comparisons)

| File | Comparison Path | Note |
|---|---|---|
| data/Vienna_102081.city.json | data/Vienna_102081.city.json | already v2.0 |
| data/Vienna_102081-export.city.json | dev/test/reports/normalized/Vienna_102081-export.city.v2.json | upgraded v1.1 -> v2.0 (dev/test/reports/normalized/Vienna_102081-export.city.v2.json) |
| data/Vienna_102081-exportwithdoorwindowandblacony.city.json | dev/test/reports/normalized/Vienna_102081-exportwithdoorwindowandblacony.city.v2.json | upgraded v1.1 -> v2.0 (dev/test/reports/normalized/Vienna_102081-exportwithdoorwindowandblacony.city.v2.json) |

Notes:
- Validation always uses the official CityJSON v2.0 schemas; v1.1 inputs are upgraded to a temporary v2.0 copy for schema checks.
- Comparisons can optionally run on v2.0 normalized copies so version differences don't dominate the summary.

## Validation Matrix

| File | Type | Validator | Result | Details | Report |
|---|---|---|---|---|---|
| /mnt/d/DCS/data/Vienna_102081.city.json | CityJSON | cjio validate | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev/test/reports/Vienna_102081.city.cjio_validate.txt |
| /mnt/d/DCS/data/Vienna_102081.city.json | CityJSON | cjvalpy | <span style="color: #1a7f37; font-weight: 600">PASS</span> | ok | dev/test/reports/Vienna_102081.city.cjvalpy_validate.txt |
| /mnt/d/DCS/data/Vienna_102081.city.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |
| /mnt/d/DCS/data/Vienna_102081-export.city.json | CityJSON | cjio validate | <span style="color: #d1242f; font-weight: 600">FAIL</span> | null is not of type "string" [path:/appearance/textures/0/image] (upgraded v2.0 copy) | dev/test/reports/Vienna_102081-export.city.cjio_validate.txt |
| /mnt/d/DCS/data/Vienna_102081-export.city.json | CityJSON | cjvalpy | <span style="color: #d1242f; font-weight: 600">FAIL</span> | null is not of type "string" [path:/appearance/textures/0/image] | dev/test/reports/Vienna_102081-export.city.cjvalpy_validate.txt |
| /mnt/d/DCS/data/Vienna_102081-export.city.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |
| /mnt/d/DCS/data/Vienna_102081-exportwithdoorwindowandblacony.city.json | CityJSON | cjio validate | <span style="color: #d1242f; font-weight: 600">FAIL</span> | "undefined" does not match "^(http\|https)://www.opengis.net/def/crs/" [path:/metadata/referenceSystem] (upgraded v2.0 copy) | dev/test/reports/Vienna_102081-exportwithdoorwindowandblacony.city.cjio_validate.txt |
| /mnt/d/DCS/data/Vienna_102081-exportwithdoorwindowandblacony.city.json | CityJSON | cjvalpy | <span style="color: #d1242f; font-weight: 600">FAIL</span> | "undefined" does not match "^(http\|https)://www.opengis.net/def/crs/" [path:/metadata/referenceSystem] | dev/test/reports/Vienna_102081-exportwithdoorwindowandblacony.city.cjvalpy_validate.txt |
| /mnt/d/DCS/data/Vienna_102081-exportwithdoorwindowandblacony.city.json | CityJSON | CityJSONEditor prep | <span style="color: #9a6700; font-weight: 600">WARN</span> | would modify a copy for Blender import stability |  |

## Comparison Summary

| Pair | Version | LoD | CityObjects | Building | BuildingPart | BuildingInstallation | WinDef | WinFaces | DoorDef | DoorFaces | Holes | Vertices | Surfaces | BBoxΔmax | ID Δ | Diff Report |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| data/Vienna_102081.city.json -> data/Vienna_102081-export.city.json | 2.0->2.0 | 2->3 | 1322->379 (<span style="color: #d1242f; font-weight: 600">-943</span>) | 307->55 (<span style="color: #d1242f; font-weight: 600">-252</span>) | 1015->1 (<span style="color: #d1242f; font-weight: 600">-1014</span>) | 0->323 (<span style="color: #1a7f37; font-weight: 600">+323</span>) | 0->1059 (<span style="color: #1a7f37; font-weight: 600">+1059</span>) | 0->31686 (<span style="color: #1a7f37; font-weight: 600">+31686</span>) | 0->61 (<span style="color: #1a7f37; font-weight: 600">+61</span>) | 0->984 (<span style="color: #1a7f37; font-weight: 600">+984</span>) | 344->5938 (<span style="color: #1a7f37; font-weight: 600">+5594</span>) | 47220->62306 (<span style="color: #1a7f37; font-weight: 600">+15086</span>) | 43260->44406 (<span style="color: #1a7f37; font-weight: 600">+1146</span>) | 5063021.889 | -1322/+379 | dev/test/reports/Vienna_102081.city__vs__Vienna_102081-export.city.diff.json |
| data/Vienna_102081-export.city.json -> data/Vienna_102081-exportwithdoorwindowandblacony.city.json | 2.0->2.0 | 3->3 | 379->379 (0) | 55->55 (0) | 1->1 (0) | 323->323 (0) | 1059->1059 (0) | 31686->31686 (0) | 61->61 (0) | 984->984 (0) | 5938->5938 (0) | 62306->62342 (<span style="color: #1a7f37; font-weight: 600">+36</span>) | 44406->44424 (<span style="color: #1a7f37; font-weight: 600">+18</span>) | 0.0 | -0/+0 | dev/test/reports/Vienna_102081-export.city__vs__Vienna_102081-exportwithdoorwindowandblacony.city.diff.json |
| data/Vienna_102081.city.json -> data/Vienna_102081-exportwithdoorwindowandblacony.city.json | 2.0->2.0 | 2->3 | 1322->379 (<span style="color: #d1242f; font-weight: 600">-943</span>) | 307->55 (<span style="color: #d1242f; font-weight: 600">-252</span>) | 1015->1 (<span style="color: #d1242f; font-weight: 600">-1014</span>) | 0->323 (<span style="color: #1a7f37; font-weight: 600">+323</span>) | 0->1059 (<span style="color: #1a7f37; font-weight: 600">+1059</span>) | 0->31686 (<span style="color: #1a7f37; font-weight: 600">+31686</span>) | 0->61 (<span style="color: #1a7f37; font-weight: 600">+61</span>) | 0->984 (<span style="color: #1a7f37; font-weight: 600">+984</span>) | 344->5938 (<span style="color: #1a7f37; font-weight: 600">+5594</span>) | 47220->62342 (<span style="color: #1a7f37; font-weight: 600">+15122</span>) | 43260->44424 (<span style="color: #1a7f37; font-weight: 600">+1164</span>) | 5063021.889 | -1322/+379 | dev/test/reports/Vienna_102081.city__vs__Vienna_102081-exportwithdoorwindowandblacony.city.diff.json |

## Key Findings

- `data/Vienna_102081.city.json -> data/Vienna_102081-export.city.json`: CityObject IDs do not overlap (not a clean roundtrip / different selection).
- `data/Vienna_102081.city.json -> data/Vienna_102081-export.city.json`: Dominant LoD changed `2` → `3`.
- `data/Vienna_102081.city.json -> data/Vienna_102081-export.city.json`: Huge bbox delta (`5063021.889`) suggests different CRS/origin/georeferencing.
- `data/Vienna_102081-export.city.json -> data/Vienna_102081-exportwithdoorwindowandblacony.city.json`: Geometry changed but Window/Door semantics did not; edits may not be saved as semantics (check SurfaceType assignment in Blender).
- `data/Vienna_102081.city.json -> data/Vienna_102081-exportwithdoorwindowandblacony.city.json`: CityObject IDs do not overlap (not a clean roundtrip / different selection).
- `data/Vienna_102081.city.json -> data/Vienna_102081-exportwithdoorwindowandblacony.city.json`: Dominant LoD changed `2` → `3`.
- `data/Vienna_102081.city.json -> data/Vienna_102081-exportwithdoorwindowandblacony.city.json`: Huge bbox delta (`5063021.889`) suggests different CRS/origin/georeferencing.

## Fix Hints

### data/Vienna_102081-export.city.json

- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjio validate`: null is not of type "string" [path:/appearance/textures/0/image] (upgraded v2.0 copy)
  - Invalid texture metadata: try `cjio /mnt/d/DCS/data/Vienna_102081-export.city.json textures_remove save <out.city.json>` (or fix `appearance.textures[].image/type`).
- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjvalpy`: null is not of type "string" [path:/appearance/textures/0/image]
  - Invalid texture metadata: try `cjio /mnt/d/DCS/data/Vienna_102081-export.city.json textures_remove save <out.city.json>` (or fix `appearance.textures[].image/type`).

### data/Vienna_102081-exportwithdoorwindowandblacony.city.json

- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjio validate`: "undefined" does not match "^(http\|https)://www.opengis.net/def/crs/" [path:/metadata/referenceSystem] (upgraded v2.0 copy)
  - Invalid CRS: set `metadata.referenceSystem` to an OGC CRS URI (e.g. `https://www.opengis.net/def/crs/EPSG/0/<code>`) or delete it.
- <span style="color: #d1242f; font-weight: 600">FAIL</span> `cjvalpy`: "undefined" does not match "^(http\|https)://www.opengis.net/def/crs/" [path:/metadata/referenceSystem]
  - Invalid CRS: set `metadata.referenceSystem` to an OGC CRS URI (e.g. `https://www.opengis.net/def/crs/EPSG/0/<code>`) or delete it.
