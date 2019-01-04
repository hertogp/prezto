## WIP WIP!

Easily create a presentation using:

- markdown (and your imagination)
- pandoc (w/ a writer & template)
- a framework (some are `native` to pandoc)
    + reveal
    + slidy
    + slideous
    + dzslides
    + s5
    + beamer (-- for pdf based slides)
    + impress (non-native)
    + inspire (non-native)
    + bespoke (non-naive)
- some custom/theme css-files (optional)

and

`prezto.sh <framework> slides/demo.md` -> `dist/demo-<framework>.html

## Links

- [pandoc for pres.](https://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc)
- [pandoc impress](https://github.com/jgm/pandoc/wiki/Creating-impress.js-slide-shows-with-pandoc)
- [pandoc reveal](https://github.com/jgm/pandoc/wiki/Using-pandoc-to-produce-reveal.js-slides)
- [reveal github](https://github.com/hakimel/reveal.js.git)
- [reveal pandoc](https://github.com/jgm/pandoc/wiki/Using-pandoc-to-produce-reveal.js-slides)
- [impress github](https://github.com/impress/impress.js.git)
- [impress pandoc](https://github.com/jgm/pandoc/wiki/Creating-impress.js-slide-shows-with-pandoc)
- [inspire github](https://github.com/LeaVerou/inspire.js.git)
- [bespoke github](https://github.com/bespokejs/bespoke)

## Dir structure

```
prj-root
  `- slides          - markdown presentations
  `- dist            - html presentations (self contained)
  `- src             - css, js for customization
     `- pandoc       - pandoc's templates
  `- lib             - compiled sources
      `- reveal      - reveal.js as a submodule
      `- impress     - impress.js as a submodule
      `- inspire     - inspire.js as a submodule
  package.json       - npm (dev) modules used for compilation
  setup.sh           - add/update a lib/<module>
  prezto.sh          - convert a md to html-presentation (self-contained)
```

## Markdown

- Use `meta` for title, author and other meta-data
- Use `#` with only a title, no content
- Use `##` for title slides
- Use `css: path/to/css` to choose a theme

# ToDo's

## pandoc
- add `pandoc-imagine` as filter to `prezto.md`
- re-install some of `pandoc-imagine` commands on ubuntu
    + protocol
    + box
    + mermaid
    + etc ..
- add pdf viewer (of x.md) back into nvim

## reveal
- edit `src/pandoc/reveal.tpl`
- create themes
- create reveal-howto.md demo presentation

## add other format(s)
- edit/create `src/pandoc/<format>.tpl`
- create themes

for e.g. bespoke, inspire, 
