---
title: Markdown Presents
author: hertogp
...

# Markdown

## Write

- write in markdown
- link to img/.. for images

![img](img/a.png)

## Convert

```bash
pandoc -s -t s5 --template=lib/template.s5 \
       src/file.md -o dist/file.html
```

## Present

```bash
xdg-open dist/file.html
```

