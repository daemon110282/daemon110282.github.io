#!/bin/bash
# scripts/batch-convert.sh - Convert all office documents in a directory to PDF

INPUT_DIR="./docs/input"
OUTPUT_DIR="./docs/output"

mkdir -p "$OUTPUT_DIR"

# Process each supported file format
for file in "$INPUT_DIR"/*.{docx,doc,xlsx,xls,pptx,ppt,odt,ods}; do
  [ -f "$file" ] || continue
  filename=$(basename "$file")

  echo "Converting: $filename"
  docker run --rm \
    -v "$(pwd)/docs:/docs" \
    lo-converter \
    --convert-to pdf \
    --outdir /docs/output \
    "/docs/input/$filename"
done

echo "Batch conversion complete."