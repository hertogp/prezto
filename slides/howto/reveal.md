---
title: Reveal'ing Markdown
author: hertogp
transition: convex
controls:
css:
  - prezto/css/prezto-reveal.css
  - fa/css/all.min.css
...

# HTML {transition=none}

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


## {.flex}

::: {.pane4 .bg-green}
[Emoji's]{.fg-yellow}
:::

::: {.pane4 .bg-neprhitis .smaller}
Font-Awesome
:::

::: {.pane4 .bg-pumpkin .fg-emerald}
[:+1:]{.iconic}
[:smile:]{.iconic}
:::


::: {.pane4 .fg-neprhitis .bg-asphalt .smaller .smaller}
<i class="fa fa-dizzy iconic"></i>
<i class="fa fa-thumbs-up iconic"></i>
:::

::: {.pane4 .fg-neprhitis .bg-asphalt .smaller .smaller}
![](fa/svg/fa-dizzy.svg){data-fa-transform="shrink-6"}
![](fa/svg/fa-dizzy.svg){style="width:25px; height:25px"}
:::

::: {.pane4 .fg-neprhitis .bg-asphalt .smaller .smaller}
![](fa/svg/fa-thumbs-up.svg){.icon-22 .fg-red}
![](fa/svg/fa-thumbs-up.svg){.icon-32}
![](fa/svg/fa-thumbs-up.svg){.icon-64}
:::

##

[Corners]{.middle .huge}

[topleft]{.topleft}

[topright]{.topright}

[botleft]{.botleft}

[botright]{.botright}

##

::: {.middle .huge}
DIV Corners
:::

::: {.topleft}
topleft
:::

::: {.topright}
topright
:::

::: {.botleft}
botleft
:::

::: {.botright}
botright
:::

##

[Sides]{.middle .huge}

[top]{.top}

[right]{.right}

[left]{.left}

[bot]{.bottom}

## Panes

[left span]{.left .pane style="background:blue;"}

[right span]{.right .pane style="background:darkgrey;"}

## Div Panes

::: {.left .pane .bg-blue}
left div
:::

::: {.right .pane .bg-asphalt}
right div
:::

## {.flex }

::: {.bg-midnight}
Another example of \
[two panes]{.fg-pumpkin .big}
:::

::: {.bg-pumpkin}

    ## {.flex }

    :::
    Another example of
    [two panes]{.fg-pumpkin .big}
    :::

    :::
    ... infinite recursion ahead
    :::
:::


##

[topleft panel]{.topleft .pane .fg-emerald .bg-midnight}

. . .

[topright panel]{.topright .pane .fg-clouds .bg-orange2}

. . .

::: {.botleft .pane .fg-white .bg-pomegranate}
- sync
- ack
- snack
- prack
:::

. . .

[ ![](./img/tls-handshake.svg){style="top=0"} ]{.botright .pane .fg-midnight .bg-sunflower}

## {.flex}

::: {.pane4 .bg-emerald}
TLS handshake
:::

::: {.pane4 .bg-neprhitis .smaller}
Explained finally! [:+1:]{.fg-red style="font-style: bold"}
:::

::: {.pane4 .bg-pumpkin}
![](./img/tls-handshake.svg)
:::


::: {.pane4 .bg-asphalt .smaller .smaller}

<i class="fa fa-user iconic"></i>

- after TCP handshake (56 ms)
- client says hello
- server sends its cert
- client checks
- client sends its choices
- both calc symmetric key
:::



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

```pandoc
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

\-- [self-contained [problematic when using plugins]{.fg-red}]{.small}

## Pandoc Template

- includes plugins:
    - zoom.js
    - notes.js (hit S)

::: notes

- Requires serving notes.html from server ?

:::

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


