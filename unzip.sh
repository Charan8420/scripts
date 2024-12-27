#!/bin/bash

sourceDir="/path/to/your/zipfiles"
targetDir="/path/to/output/folder"

if [ ! -d "$sourceDir" ]; then
    echo "Source directory does not exist: $sourceDir"
    exit 1
fi

for zipfile in "$sourceDir"/*.zip; do
    if [ -f "$zipfile" ]; then
        unzip -q "$zipfile" -d "$targetDir"
        
        if [ $? -eq 0 ]; then
            echo "Unzipped $zipfile to $targetDir"
        else
            echo "Failed to unzip $zipfile"
        fi
    fi
done

echo "All .zip files are unzipped at $targetDir."
