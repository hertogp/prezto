---
title: Reveal'ing Markdown
author: hertogp
transition: none
controls: ""
css: prezto/css/prezto.css
...

# HTML

## HTML Structure

```{.html style="font-size:50%"}
div .reveal

  div .slides
    section #title-slide .ppf                :prez title
    section .stack Tppf                      :H1 stack title
      section .title-slide slide level1 #..  :H2 vert slide
      section .slide level2 .ppf #..         :H2 vert slide

  div .backgrounds                           :for each slide/stack
    div .slide-background stack .ppf         : stack
      div .slide-background-content .ppf     : generic bg
      div .slide-background title-slide slide level1 .ppf : title
      div .slide-background slide level2 .ppf  : vert slide
      ,,  ,,                                   : vert slide


div .progress
aside .controls
div .slide-number
div .speaker-notes
div .pause-overlay
```

[where .ppf is past, present or future]{.south .tiny}

##

[Corners]{.middle .huge}

[topleft]{.topleft}

[topright]{.topright}

[botleft]{.botleft}

[botright]{.botright}


##

[Sides]{.middle .huge}

[top]{.top}

[right]{.right}

[left]{.left}

[bot]{.bottom}

## Panes

[left pane]{.left .pane style="background:blue;"}

[right pane]{.right .pane style="background:darkgrey;"}

##
[topleft panel]{.topleft .pane .bgblue}
[topright panel]{.topright .pane .bgred}
[botleft panel]{.botleft .pane .bggreen}
[botright panel]{.botright .pane .bgyellow}

## {data-background-image="prezto/pix/stormtroopers.jpg"}

[midpoint]{.midpoint .huge}

[north]{.north}

[east]{.east}

[south]{.south}

[west]{.west}


##

[midpoint]{.midpoint}

[north west]{.north-west}

[north east]{.north-east}

[south west]{.south-west}

[south east]{.south-east}


# Markdown

## MD Structure
{transition=convex}
```markdown
# H1-Title1 (starts stack-section)

## topic 1.1 (slide-section)
- item

## topic 1.2 (slide-section)

[image](img/image.png)

# H1-Title2 (starts stack-section)

## topic 2.1 (slide-section)
etc..
```

# Conversion

## Pandoc

```bash
pandoc -s -t <writer> --template=reveal.tpl> \
       --self-contained \
       path/input.md -o dist/path/input.html
```

- self-contained problematic when using plugins

## Pandoc Template

- includes plugins:
    - zoom.js
    - notes.js

## Reveal.js

### Plugin
- reveal/plugin/zoom-js/zoom


# Sample slides

## An image {.fade}

- write in markdown
- link to img/.. for images

![](img/a.png){style="float:right;max-height:100px;"}

- oops

## Code highlight

How to convert markdown to slideshow


## Code highlight 2

```python

if True:
    print(False)
```


