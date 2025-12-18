import json
from pathlib import Path

def norm(v):
    try:
        return f"{float(v):g}"
    except (ValueError, TypeError):
        return str(v)

path = Path("data/export/BuildingsLOD3.city-export.json")
if not path.exists():
    print(f"File not found: {path}")
    exit(1)

with open(path, "r", encoding="utf-8") as f:
    d = json.load(f)

for co_id, co in d.get("CityObjects", {}).items():
    if "geometry" in co:
        unique_geoms = []
        seen_lods = set()
        for g in co["geometry"]:
            lod_str = norm(g.get("lod"))
            if lod_str not in seen_lods:
                seen_lods.add(lod_str)
                # Also ensure the lod in the dict is the normalized string
                g["lod"] = lod_str
                unique_geoms.append(g)
        co["geometry"] = unique_geoms

with open(path, "w", encoding="utf-8") as f:
    json.dump(d, f, indent=2)

print("Successfully de-duplicated geometries in BuildingsLOD3.city-export.json")
