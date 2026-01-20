import json
import sys

def deduplicate_json(input_path, output_path):
    print(f"Reading {input_path}...")
    try:
        # standard json.load will take the last value for a duplicate key
        with open(input_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        print(f"Writing cleaned data to {output_path}...")
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, separators=(',', ':'))
            
        print("Done.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python deduplicate_json.py <input_file> <output_file>")
    else:
        deduplicate_json(sys.argv[1], sys.argv[2])
