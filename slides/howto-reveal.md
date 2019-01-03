---
title: Markdown Inspired
author: hertogp
theme: moon
...

# Inspired Markdown

## Easy presentation workflow

- presentation itself in markdown
- convert to self-contained HTML file
- slide show with support for:
    + overview
    + cloned view
    + speaker notes
    + convert to pdf
    + slide transitions
    + themes
    + per-slide customizaions
    + images & multi-media
- currently maintained (some are really old)
- use in combination with pandoc
    + so filters can be applied (eg pandoc-imagine)


# Sample slides

## An image

- write in markdown
- link to img/.. for images

![](img/a.png){style="float:right;max-height:100px;"}

- oops

## Code highlight

How to convert markdown to slideshow

```bash
pandoc -s -t html5 --template=lib/inspire.html5 \
       prez/file.md -o dist/file.html
```

## Code highlight 2

```python

if True:
    print(False)
```


