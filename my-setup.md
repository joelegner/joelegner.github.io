---
title: My Setup
date: August 04, 2023
author: Joe Legner
---

# Overview

I'm well aware that people often post a page like this to start their blog and then never write much more after that. I am not to live up to this stereotype!

# Github Pages

My setup uses Github pages for hosting.

<https://github.com/joelegner/joelegner.github.io>

# Pandoc

My setup uses Pandoc to generate HTML files from Markdown source files.

```zsh
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
```

Return to [Index](index.html)
