#!/bin/zsh

# Step 1: Find all files matching the pattern '*.md'
for sourcefile in *.md; do
  # Check if there are any files matching the pattern
  if [[ -e "$sourcefile" ]]; then
    # Step 2: Convert each file to HTML using Pandoc
    echo "$sourcefile -> ${sourcefile%.md}.html"
    pandoc -s -o "${sourcefile%.md}.html" "$sourcefile"
  else
    echo "No files found matching the pattern '*.md'"
    exit 1
  fi
done

# Step 3: Open index.html
open index.html
