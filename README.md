# joelegner.github.io Blog
Welcome to my blog's README.md file. This is where we document the technical aspects of publishing the blog. 

## Original Build Documentation

Visited https://www.getzola.org. Ran `zola init myblog`.

```sh
 % zola init myblog
Welcome to Zola!
Please answer a few questions to get started quickly.
Any choices made can be changed by modifying the `config.toml` file later.
> What is the URL of your site? (https://example.com): https://joelegner.github.io
> Do you want to enable Sass compilation? [Y/n]: 
> Do you want to enable syntax highlighting? [y/N]: y
> Do you want to build a search index of the content? [y/N]: y
```
Navigated to the new blog directory.
```sh
cd myblog
mkdir templates
touch templates.base.html
```
Populated it with this:
```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>MyBlog</title>
</head>

<body>
  <section class="section">
    <div class="container">
      {% block content %} {% endblock %}
    </div>
  </section>
</body>

</html>
```
Created `myblog/templates/index.html` with this content:
```html
{% extends "base.html" %}

{% block content %}
<h1 class="title">
  This is my blog made with Zola.
</h1>
{% endblock content %}
```
Created `myblog/templates/blog.html` with this content:
```html
{% extends "base.html" %}

{% block content %}
<h1 class="title">
  {{ section.title }}
</h1>
<ul>
  <!-- If you are using pagination, section.pages will be empty.
       You need to use the paginator object -->  
  {% for page in section.pages %}
  <li><a href="{{ page.permalink | safe }}">{{ page.title }}</a></li>
  {% endfor %}
</ul>
{% endblock content %}
```
Created `myblog/templates/blog-page.html` with this content:
```html
{% extends "base.html" %}

{% block content %}
<h1 class="title">
  {{ page.title }}
</h1>
<p class="subtitle"><strong>{{ page.date }}</strong></p>
{{ page.content | safe }}
{% endblock content %}
```
Ran the server.
```sh
% zola serve
```
Browsed `http://127.0.0.1:1111` and got "This is my blog made with Zola."

Added `myblog/content/blog/_index.md` with this content:
```markdown
+++
title = "List of blog posts"
sort_by = "date"
template = "blog.html"
page_template = "blog-page.html"
+++
```
Ran the server.
```sh
% zola serve
```
Browsed `http://127.0.0.1:1111/blog` and got "List of blog posts".
