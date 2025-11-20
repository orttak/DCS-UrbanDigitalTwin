import json

with open("my_city_cityjson.json") as f:
    cj = json.load(f)

keep = {}
for cid, co in cj["CityObjects"].items():
    geom = co.get("geometry", [])
    # keep only objects that actually have geometry entries
    if geom and any(g.get("boundaries") for g in geom):
        keep[cid] = co

cj["CityObjects"] = keep

with open("my_city_filtered.json", "w") as f:
    json.dump(cj, f)
