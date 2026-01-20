import json
import argparse
import sys
from pathlib import Path

def list_objects(data, limit=50, filter_type=None):
    """List CityObjects in the file."""
    city_objects = data.get("CityObjects", {})
    print(f"\nFound {len(city_objects)} CityObjects.")
    if filter_type:
        print(f"Filtering by type: {filter_type}")
    
    count = 0
    print("\nID" + " " * 30 + "Type")
    print("-" * 50)
    for obj_id, obj_data in city_objects.items():
        obj_type = obj_data.get("type", "Unknown")
        if filter_type and obj_type != filter_type:
            continue
            
        print(f"{obj_id:<32} {obj_type}")
        count += 1
        if limit and count >= limit:
            print(f"\n... and {len(city_objects) - count} more.")
            break

def extract_object(data, obj_id, output_path):
    """Extract a specific CityObject and save to a new file."""
    if obj_id not in data.get("CityObjects", {}):
        print(f"Error: CityObject '{obj_id}' not found.")
        return False

    print(f"Extracting '{obj_id}'...")
    
    # Create new data structure
    new_data = {
        "type": "CityJSON",
        "version": data.get("version", "2.0"),
        "CityObjects": {},
        "vertices": [],
        "transform": data.get("transform"), # Keep transform if present
        "metadata": data.get("metadata", {}),
        "appearance": data.get("appearance", {}) # Keep appearance/textures
    }

    # Get the object
    source_obj = data["CityObjects"][obj_id]
    
    # We need to remap vertices to keep the file small
    # This is a naive implementation: we just copy ALL vertices for now to be safe and simple
    # A proper implementation would filter used vertices, but that requires parsing all geometry boundaries.
    # Given the user's request for speed, copying all vertices (usually < 20MB file) is instant and safe.
    # If the user wants to minimize file size strictly, we can improve this later.
    new_data["vertices"] = data.get("vertices", [])
    
    new_data["CityObjects"][obj_id] = source_obj

    # Save to file
    try:
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(new_data, f, indent=2)
        print(f"Successfully saved to {output_path}")
        return True
    except Exception as e:
        print(f"Error saving file: {e}")
        return False

def main():
    parser = argparse.ArgumentParser(description="CityJSON Splitter - Extract specific buildings.")
    parser.add_argument("file", help="Path to input CityJSON file")
    parser.add_argument("--list", action="store_true", help="List available CityObjects")
    parser.add_argument("--extract", help="ID of the CityObject to extract")
    parser.add_argument("--filter", help="Filter list by object type (e.g., Building)")
    parser.add_argument("--output", help="Output file path (default: [input]_split.json)")

    args = parser.parse_args()
    
    input_path = Path(args.file)
    if not input_path.exists():
        print(f"Error: File {input_path} not found.")
        sys.exit(1)

    print(f"Loading {input_path}...")
    try:
        with open(input_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
    except Exception as e:
        print(f"Error reading JSON: {e}")
        sys.exit(1)

    if args.list or not args.extract:
        list_objects(data, filter_type=args.filter)
        if not args.extract:
            print("\nUse --extract <ID> to save a specific object.")

    if args.extract:
        output_path = args.output
        if not output_path:
            output_path = input_path.stem + "_" + args.extract + ".json"
        
        extract_object(data, args.extract, output_path)

if __name__ == "__main__":
    main()
