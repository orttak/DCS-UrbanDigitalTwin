import json
import sys

def fix_lod(file_path):
    print(f"Processing {file_path}...")
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        city_objects = data.get("CityObjects", {})
        count = 0
        
        for obj_id, obj in city_objects.items():
            geometries = obj.get("geometry", [])
            for geom in geometries:
                if "lod" in geom:
                    lod_val = geom["lod"]
                    if isinstance(lod_val, str):
                        try:
                            # Try converting to float first, then int if it's a whole number
                            val = float(lod_val)
                            # If it's like 3.0, make it 3 (int) if you prefer, 
                            # but float is usually safe for "real number". 
                            # The error was "must be real number", math.floor works on float.
                            geom["lod"] = val
                            count += 1
                        except ValueError:
                            print(f"Warning: Could not convert lod '{lod_val}' to number in object {obj_id}")
        
        print(f"Fixed {count} LOD values.")
        
        with open(file_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, separators=(',', ':')) # Minimal whitespace to keep size down
        print("File saved successfully.")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        fix_lod(sys.argv[1])
    else:
        print("Usage: python fix_lod.py <path_to_cityjson>")
