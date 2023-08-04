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

The script is rather fast, at least now with very few input files. 

```
./make.sh  0.12s user 0.08s system 73% cpu 0.278 total
```

# `add.sh` Script

ChatGPT helped me write a script that makes it easy to add a page to my digital garden. I named the script `add.sh`. Here is what it does:

1. Prompts for page title (assumes Title Case with spaces)
2. Converts page title to lowercase and replace spaces with hyphens
3. Creates a new markdown file some basic Yaml configuration needed by Pandoc
4. Appends a link to the new file to `index.md`

It works perfectly. Here is a usage example:

```zsh
$ ./add.sh
Enter the page title (Title Case with spaces): My Background
Page 'My Background' has been created with the filename 'my-background.md' and added to index.md.
$
```

The listing of the script might be of interest to somebody.

<https://github.com/joelegner/joelegner.github.io/blob/main/add.sh>

Return to [Index](index.html)
