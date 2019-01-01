---
title: presentations in markdown
author: hertogp
...

## WIP WIP!

Easily create a presentation using:

- pandoc,
- markdown
- html5 template (modified)
- inspire.js


## Dir structure

```
prj-root
  `- prez            - markdown presentations
  `- dist            - html presentations (self contained)
  `- src             - css, js for customization
  `- lib             - compiled sources
      `- inspire.js  - git clone of inspire
  package.json       - npm (dev) modules used for compilation
  prez-it.sh         - shell wrapper around pandoc
```

## Markdown

- Use `meta` for title, author and other meta-data
- Use `#` with only a title, no content
- Use `##` for title slides
- Use `css: path/to/css` to choose a theme

