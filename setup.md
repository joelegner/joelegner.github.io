---
title: Setup
date: August 04, 2023
author: Joe Legner
---

I cannot think of an empowerment promise for this page. For now I am leaving it -- call it using the precautionary principle. I do not think it should survive a culling if it has no practical value for the reader. But I am not convinced yet that it has no value, so I will wait and see.

# My site is hosted on Github Pages.

My setup uses Github pages for hosting, something like this: <https://github.com/joelegner/joelegner.github.io>

# My site is statically generated from Markdown source files using Pandoc.

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

# I wrote a script called `add.sh` that makes it easy to add a page.

This idea removed most of the resistance to writing. It is so damn easy for me to spin up a new idea. It's almost addictive. Of course, this is only the first day. 

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
