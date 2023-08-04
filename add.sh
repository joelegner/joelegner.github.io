#!/bin/zsh

# Step 1: Prompt for page title
read -r "pageTitle?Enter the page title (Title Case with spaces): "

# Step 2: Convert page title to lowercase and replace spaces with hyphens
filename="${pageTitle:l}"
filename="${filename// /-}.md"

# Get today's date in the desired format
date=$(date "+%B %d, %Y")

# Step 3: Create the new markdown file with the additional content
cat << EOF > "$filename"
---
title: $pageTitle
date: $date
author: Joe Legner
---

EOF

# Step 4: Append link to index.md
echo "- [$pageTitle](${filename%.md}.html)" >> index.md

echo "Page '$pageTitle' has been created with the filename '$filename' and added to index.md."
