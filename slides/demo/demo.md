---
author: a. u. thor
title: demo
theme: solarized
...

# Create a presentation

## convert from markdown

```bash
./prezto.sh <format> slides/demo.md
```

will create: `dist/demo-format.html`.

View with `xdg-open dist/demo-<format>.html` in your default browser.


## available formats (WIP!)

- reveal <- `setup.sh reveal`
- impress <- `setup.sh impress`
- inspire <- `setup.sh inspire`
- slidy
- slideous
- dzslides
- s5

# Pandoc

## because:
- it does all the heavy lifting
- uses a (custom or html5) writer
- combined with a template file

## directories used

```bash
├── dist
│   └── <presentaion>-<format>.html
├── lib
│   ├── impress
│   ├── inspire
│   └── reveal
├── slides
│   ├── <presentation>.md
│   └── img
├── src
│   ├── js
│   ├── pandoc
│   ├── pix
│   └── scss
└── tmp
```

## Slide creation

Pandoc uses some rules to slice the presentation into slides:

- slide-level = highest header w/ regular content
- headers at this level are turned into a slide
    + with all the content they have
- usually `#`-headers are empty / sections
    + and contain `##`-headers with some content

