---
title: Markdown Inspired
author: hertogp
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
<style data-slide>
  @keyframes slidein {
    from {
      margin-left: 100%;
      width: 300%; 
    }

    to {
      margin-left: 0%;
      width: 100%;
    }
  }
  @keyframes example {
    from {background-color: red;}
    to {background-color: yellow;}
  }
  .slide {
    background-color: yellow;
    animation-name: slidein, example;
    animation-duration: 2s;
  }
</style>

```python

if True:
    print(False)
```


