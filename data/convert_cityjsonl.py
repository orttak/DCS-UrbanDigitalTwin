import json
import sys

def shift_indices(geometry, offset):
    if isinstance(geometry, list):
        return [shift_indices(item, offset) for item in geometry]
    elif isinstance(geometry, int):
        return geometry + offset
    else:
        return geometry

def convert_cityjsonl_to_cityjson(input_path, output_path):
    with open(input_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    if not lines:
        print("File is empty")
        return

    # First line is the header (CityJSON object)
    try:
        cityjson = json.loads(lines[0])
    except json.JSONDecodeError:
        print("Error decoding header line")
        return

    if cityjson.get("type") != "CityJSON":
        print("First line is not a CityJSON object")
        # It might be that the file is just a list of features without a header? 
        # But standard CityJSONL has a header.
        # If it fails, we might need to construct one.
        pass

    if "CityObjects" not in cityjson:
        cityjson["CityObjects"] = {}
    if "vertices" not in cityjson:
        cityjson["vertices"] = []

    main_vertices = cityjson["vertices"]
    
    print(f"Processing {len(lines)-1} features...")

    for i, line in enumerate(lines[1:], start=2):
        line = line.strip()
        if not line:
            continue
        try:
            feature = json.loads(line)
        except json.JSONDecodeError:
            print(f"Error decoding line {i}")
            continue

        if feature.get("type") != "CityJSONFeature":
            print(f"Line {i} is not a CityJSONFeature")
            continue

        # Merge CityObjects
        # A feature usually has "CityObjects" with one or more objects
        feature_objects = feature.get("CityObjects", {})
        feature_vertices = feature.get("vertices", [])
        
        vertex_offset = len(main_vertices)
        
        # Append vertices
        main_vertices.extend(feature_vertices)

        # Update geometry indices in objects and add to main CityObjects
        for obj_id, obj in feature_objects.items():
            # Update geometry
            if "geometry" in obj:
                for geom in obj["geometry"]:
                    if "boundaries" in geom:
                        geom["boundaries"] = shift_indices(geom["boundaries"], vertex_offset)
            
            # Add to main CityObjects
            cityjson["CityObjects"][obj_id] = obj

    # Save the result
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(cityjson, f, separators=(',', ':'))
    
    print(f"Conversion complete. Saved to {output_path}")

if __name__ == "__main__":
    convert_cityjsonl_to_cityjson('d:/Docker/data/my_city.json', 'd:/Docker/data/my_city_converted.json')
