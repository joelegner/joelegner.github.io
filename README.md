# joelegner.github.io Blog
Welcome to my blog's README.md file. This is where we document the technical aspects of publishing the blog. 

## Original Build Documentation

On Friday, March 28, 2025, I asked ChatGPT for help. Here is my prompt:

> Give me detailed instructions on how to create a Jekyll blog on github based  the following information.
> 
> Here is what I know:
> Blog url is joelegner.github.io
> Git repository is https://github.com/joelegner/joelegner.github.io
> I like a light, minimal site with an attractive classic printed page kind of look
> I like Times New Roman or a similar old-timey book font
> I like text that is just a bit larger than most people.
> I like when the page width is a comfortable width.
> I would like to be able to search.
> I would like to be able to apply tags.
> Later I will ask for more instructions.
> Give me detailed instructions to follow to publish my first blog post with the infrastructure more or less in place for long-time maintenance.

# **Step 1: Set Up Jekyll Blog on GitHub Pages**

## **1. Installed Jekyll and Dependencies**
Ensured Ruby installed.
```sh
ruby --version
```
Made sure to have an up-to-date JSON gem:
```sh
sudo gem install json -v 2.7.6
```
Installed Jekyll:
```sh
sudo gem install jekyll -v 4.3.4
```
Installed Bundler:
```sh
sudo gem install bundler -v 2.4.22
```
Note the use of `sudo`. We will use `sudo` anytime we run `gem`. Otherwise we get errors.
Verified installation:
```sh
jekyll -v
```
This worked. I got back a lot of messages ending with:
```sh
jekyll 4.3.4
```
This turned out to be needed for pagination. Added this line to Gemfile:
```sh
# This is a line added to GemFile, not a command:
gem "jekyll-paginate"
gem "jekyll-sitemap"
```

## **2. Cloned Repository**
Clone your GitHub repository to your local machine:
```sh
git clone https://github.com/joelegner/joelegner.github.io
cd joelegner.github.io
```

## **3. Initialized Jekyll**
Inside the repository, initialize a Jekyll project:
```sh
jekyll new . --force
```
This sets up a default Jekyll structure.

## **4. Installed Dependencies**
```sh
sudo bundle install
```

# **Step 2: Configured Blog**

## **1. Edited `_config.yml`**
Opened `_config.yml` and updated key settings:
```yaml
title: "Joe Legner's Blog"
author: "Joe Legner"
description: "Thoughts on engineering, philosophy, and music."
baseurl: ""
url: "https://joelegner.github.io"
theme: minima
paginate: 10
paginate_path: "/page:num/"
permalink: /:year/:month/:day/:title/
show_excerpts: true
plugins:
  - jekyll-feed
  - jekyll-seo-tag
  - jekyll-paginate
  - jekyll-sitemap
  - jekyll-archives
```

## **2. Customize Fonts and Styles**
Created `assets/css/style.scss`:
```scss
---
---

@import "minima";

body {
    font-family: "Times New Roman", serif;
    font-size: 20px;  /* Slightly larger text */
    line-height: 1.6;
    max-width: 800px;  /* Comfortable reading width */
    margin: auto;
    background: #fafafa;
    color: #333;
}
```

## **3. Added Tags Support**
In `_config.yml`, add:
```yaml
collections:
  tags:
    output: true
    permalink: /tag/:name/
```
Createed `_layouts/tag.html` file:
```html
---
layout: default
---
<h1>Posts tagged with "{{ page.title }}"</h1>
<ul>
  {% for post in site.posts %}
    {% if post.tags contains page.title %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endif %}
  {% endfor %}
</ul>
```

# **Step 3: Enable Search**
Jekyll does not have built-in search, so use **Lunr.js**.

1. Created `search.html`:
```html
---
layout: default
title: "Search"
---

<h1>Search</h1>
<input type="text" id="search-box" placeholder="Type to search..." />
<ul id="search-results"></ul>

<script src="{{ '/assets/js/search.js' | relative_url }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lunr.js/2.3.9/lunr.min.js"></script>
```

2. Create `assets/js/search.js`:
```js
async function fetchData() {
  const response = await fetch('{{ site.baseurl }}/search.json');
  return await response.json();
}

document.getElementById('search-box').addEventListener('input', async function() {
  let query = this.value.toLowerCase();
  let resultsContainer = document.getElementById('search-results');
  resultsContainer.innerHTML = '';

  if (query.length < 2) return;

  let data = await fetchData();
  let results = data.filter(post => post.title.toLowerCase().includes(query));

  results.forEach(post => {
    let li = document.createElement('li');
    li.innerHTML = `<a href="${post.url}">${post.title}</a>`;
    resultsContainer.appendChild(li);
  });
});
```

3. Create `search.json`:
```liquid
---
layout: null
---
[
  {% for post in site.posts %}
  {
    "title": "{{ post.title | escape }}",
    "url": "{{ post.url | relative_url }}",
    "content": "{{ post.content | strip_html | strip_newlines | escape }}"
  }{% unless forloop.last %},{% endunless %}
  {% endfor %}
]
```

# **Step 4: Published First Blog Post**
1. Create `_posts/2025-03-28-my-first-post.md`:
```yaml
---
layout: post
title: "My First Blog Post"
date: 2025-03-28
tags: [jekyll, github, setup]
---

This is my first blog post on my Jekyll-powered site!
```

2. Ran Jekyll locally:
```sh
bundle exec jekyll serve
```
Visited `http://localhost:4000` to preview.

1. Pushed changes:
```sh
git add .
git commit -m "Initial Jekyll setup and first post"
git push origin main
```

Visited [joelegner.github.io](https://joelegner.github.io) on Safari to confirm it was up. 