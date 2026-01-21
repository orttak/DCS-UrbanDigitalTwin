#!/bin/bash
# Setup script for DCS-UrbanDigitalTwin submodules

set -e

echo "🔄 Initializing Git submodules..."
git submodule update --init --recursive

echo "📦 Setting up cjio for CityJSONEditor..."
if [ -d "cjio" ] && [ ! -d "CityJSONEditor/cjio" ]; then
    cp -r cjio CityJSONEditor/
    echo "✅ cjio copied to CityJSONEditor/"
elif [ -d "CityJSONEditor/cjio" ]; then
    echo "✅ CityJSONEditor/cjio already exists"
else
    echo "❌ Error: cjio submodule not found"
    exit 1
fi

echo "✨ All submodules ready!"
echo ""
echo "Available tools:"
echo "  - citydb-tool/     : 3DCityDB CLI tool"
echo "  - CityJSONEditor/  : CityJSON editor"
echo "  - cjio/            : CityJSON I/O library"
