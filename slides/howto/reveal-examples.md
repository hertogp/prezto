---
title: Markdown/Reveal Example Slides
author: hertogp
transition: fade
controls:
css:
  - prezto/css/prezto-reveal.css
  - fa/css/all.min.css
...

# Text

## Font Sizes

[fx20]{.fx20}
[fx30]{.fx30}
[fx40]{.fx40}
[fx50]{.fx50}
[fx80]{.fx80}
[fx100]{.fx100}
[fx160]{.fx160}
[fx100]{.fx100}
[fx80]{.fx80}
[fx50]{.fx50}
[fx40]{.fx40}
[fx30]{.fx30}
[fx20]{.fx20}


## List

::: {.fg-red}
- item 1

  ::: {.fg-green .fx50}
  + item 1.1
  + item 1.2
  :::

- item 2
- item 3
:::

```{.fx40}
Wrap (sub)-lists in `:::` notation to set font, color etc..
Sublists must align to first non-space content of parent li.
```

## Horizontal Rule

```{.fx50}
Mardown's hr syntax is used to start new slides,
hence a horizontal rule requires raw html: <hr>
```

<hr>

`Set a color with <hr class="fg-pumpkin">`{.fx50}
<hr class="bg-pumpkin">

`Set it to fade with <hr class="fade">`{.fx50}
<hr class="fade">

`Or do both with <hr class="fade fg-yellow>`{.fx50}
<hr class="fade fg-yellow">

::: notes

- hr is set to 1px high by default with white color
- background is set to currentcolor (ie color)
- fade sets a background gradient using transparent & currentcolor

:::

## Font style

`use standard markdown`{.fx80}

::: {.fx80}
`*..*` -> *italic*  
`**..**` -> **bold**  
`***..***` -> ***bold italic***  
`~~..~~` -> ~~strike through~~
:::

## Text colors

`use []{.fg-color} or []{.bg-color}`{.fx80}

`[..]{.bg-red}`{.bg-red}

`[..]{.fg-red}`{.fg-red}

`[..]{.fg-yellow .bg-red}`{.fg-yellow .bg-red}

`too`{.fg-green} `much`{.bg-asphalt} `color`{.fg-pumpkin .bg-yellow}

## Custom Text decoration

`(use [..]{.td-..})`{.fx50}

[.td-under]{.td-under} --  [.td-over]{.td-over} --  [.td-both]{.td-both}

[.td-us-red]{.td-us-red} -- [.td-uw-red]{.td-uw-red}
[(or .. `td-us`{.td-us-green}/`uw-green`{.td-uw-green},
 `td-us`{.td-us-yellow}/`uw-yellow`{.td-uw-yellow})]{.fx60}

[Go custom with:]{.fx70}
`.td-under .td-dot .td-pumpkin`{.fx70 .td-under .td-dot .td-pumpkin .fg-pumpkin}

[[line]{.td-under}: `td-under/over/both` --
 [style]{.td-under}: `td-dot/dash/double/wavy` --
 [color]{.td-under}: `td-name` --
 [shorthand]{.td-under}: td-us/uw-red/green/yellow`
]{.fx30}

## Block Quotes {.bg-pumpkin}

> Never argue with stupid people, they will drag you down to their level
   and then beat you with experience
>
> --- Mark Twain

See [block quotations](https://pandoc.org/MANUAL.html#block-quotations).

::: notes

- There is no pandoc syntax to attach attrs to a blockquote

:::


## Custom Quotes {.bg-pumpkin}

<blockquote class="bg-asbestos">
<p> Never argue with stupid people, they will drag you down to their level
   and then beat you with experience</p>
<p> --- Mark Twain</p>

</blockquote>

`pandoc has no syntax to set attributes on a block quote.
 Custom colored quotes, require raw html`{.fx70}

## Line blocks

| | Line blocks are prefixed by '| ' and pandoc will:
| |  - honor newlines and
| |  - indentation
| |
| | Otherwise, it's [**processed**]{.fg-red} as [markdown.]{.td-uw-green}
| |
| | See:
  [Pandoc Line Block Quotations](https://pandoc.org/MANUAL.html#line-blocks)


`pandoc has no syntax to set attributes on a block quote.`{.fx70}

## Code blocks {.flex}

Code Block

Markdown

```{.python .fx30}
def opposite(hmm):
    if hmm:
        return False

    return True
```

````{.markdown .fx30 .bg-black}
```python
def opposite(hmm):
    ...
    return True
```
````

``` {.python .fx30 .bg-pumpkin .fg-sunflower .shadow}
def inverse(mmh):
    if hmm:
        return False

    return True
```

````{.markdown .fx30 .bg-black}
```{.python .bg-pumpkin .fg-sunflower .shadow}
def inverse(mmh):
    ...
    return True
```
````

``` {.sourceCode .bg-midnight .fx30}
Add .sourceCode as a class and no
language -> normal text, no high-
lighting & no shadows
```

````{.sourceCode .bg-midnight .fx30}
```{.sourceCode .bg-midnight .fx30}
Add .sourceCode as a class and no
language -> normal text, no high-
lighting & no shadows
```
````


# Images



## `![](path/to/img.png)`{.fx50} {.bg-pumpkin}

![](img/a.png)

`border, shadow and background were removed`{.fx30}



## `![](path/to/img.png){.bg-white}`{.fx50} {.bg-pumpkin}

![](img/a.png){.bg-white}



## `![](path/to/img.png){.size5}`{.fx50} {.bg-pumpkin}

![](img/a.png){.size5}

Here is ![](img/a.png){.size10}, or ![](img/a.png){.size20}


## {data-background-image="prezto/pix/stormtroopers.jpg" .fg-red}

`## {data-background-image="path/stormtroopers.jpg"}`


## {.flex .fg-yellow}

::: {.bg-green}
Markdown
:::

::: {.bg-pumpkin}
Emoji
:::

::: {.bg-asphalt}
`:+1:`{.fx60}
:::

::: {.bg-asbestos}
:+1:
:::

::: {.bg-asbestos}
[<br>]{.fx10}
`[:smile:]{.fx300 .fg-belize}`{.fx60}
:::

::: {.bg-asphalt}
[:smile:]{.fx300 .fg-wisteria}
:::

::: {.bg-asphalt}

`[:alien:]{.fx200 .fg-neprhitis}`{.fx60}
:::

::: {.bg-asbestos}
[:alien:]{.fx200 .fg-neprhitis}
:::

[See [pandoc's list](https://github.com/jgm/pandoc/blob/master/src/Text/Pandoc/Emoji.hs)]{.fx50}

## Font-awesone size{.flex .bg-midnight}

::: {.bg-asbestos .fg-pumpkin}
Markdown
:::

::: {.bg-asbestos .fg-sunflower}
FA - Icons or SVGS
:::


:::{.bg-asphalt .fg-pumpkin}
```{.sourceCode .fx40 .fg-pumpkin .bg-black .shadow}
<i class="fa fa-dizzy fx150"></i>
<i class="fa fa-thumbs-up fx150"></i>
```
:::

::: {.fg-neprhitis .bg-asphalt}
icons: <i class="fa fa-dizzy fx150 fg-wisteria"></i>
<i class="fa fa-thumbs-up fx150"></i>
:::

:::{.bg-asphalt .fg-pumpkin}
```{.sourceCode .fx40 .fg-pumpkin .bg-black .shadow}
![](fa/svg/fa-dizzy.svg){.size20}
![](fa/svg/fa-thumbs-up.svg){.size20}
```
:::

::: {.fg-neprhitis .bg-asphalt}
svgs: ![](fa/svg/fa-dizzy.svg){.size20}
![](fa/svg/fa-thumbs-up.svg){.size20}
:::


::: {.fx50}
Note: the Font-files (for icons) add ~3MB extra
:::

::: {.fx50}
but the SVG fg-color is fixed
:::



# Slide Layouts

## Centered By default {.fx70}

- lists

```python
# codeblocks
```

> Quote-blocks
>

| Line-blocks not so much


## Header not shown {.fr}

2 panes

````
 2 panes

 ```
 markdown of right column
 ```
````


## {.fr}

::: {.fg-pumpkin .bg-asphalt}
2 panes
:::

````{.fg-midnight .bg-pumpkin}
 ::: {.fg-pumpkin .bg-asphalt}
 2 panes
 :::

 ```{.fg-midnight .bg-pumpkin}
 markdown of right column
 ```
````


## {.fr}

::: {.top .left .fg-pumpkin .bg-asphalt}
2 panes
:::

````{.fg-midnight .bg-pumpkin}
::: {.top .left .fg-pumpkin .bg-asphalt}
2 panes
:::

```{.fg-midnight .bg-pumpkin}
markdown of right column
```
````

## {.fr}

::: {.bot .right .fg-pumpkin .bg-asphalt}
2 panes
:::

````{.fg-midnight .bg-pumpkin}
::: {.bot .right .fg-pumpkin .bg-asphalt}
2 panes
:::

```{.fg-midnight .bg-pumpkin}
markdown of right column
```
````

## {.fr}

::: {.fx130 .top .center .fg-pumpkin .bg-asphalt}
2 panes
:::


```` {.sourceCode .fx40 .fg-midnight .bg-pumpkin}
## {.fr .bg-midnight}

::: {.fx130 .top .left .fg-pumpkin .bg-asphalt}
2 panes
:::


```{.sourceCode .fx40 .bg-pumpkin}
markdown of right column
```

````



## TLS Handshake {.fr}

:::: {.fr}

::: {.bg-emerald}
TLS handshake
:::

::: {.bg-pumpkin}
![](./img/tls-handshake.svg){height="300px"}
:::

::::

:::: {.fr}

::: {.bg-neprhitis}
Explaination
:::

::: {.bg-asphalt .fx60 .fv}
- list item 1
- list item 2
:::

::::

## TLS Handshake

:::: {.fr}

::: {.bg-emerald}
TLS handshake
:::

::: {.bg-neprhitis}
Explaination
:::

::::

:::: {.fr}

::: {.bg-pumpkin}
![](./img/tls-handshake.svg){height="300px"}
:::

::: {.bg-asphalt .fx60 .fv}
- list item 1
- list item 2
:::

::::


## {.flex50}

:::{.bg-pumpkin}
top-left
:::

:::{.bg-asbestos}
top-right
:::

:::{.bg-asbestos}
bot-left
:::

:::{.bg-asphalt}
bot-right
:::

## Quadrants with a Title

:::::{.flex50}

:::{.bg-pumpkin}
top-left
:::

:::{.bg-asbestos}
top-right
:::

:::{.bg-asbestos}
bot-left
:::

:::{.bg-asphalt}
bot-right
:::

:::::

## {.grid50}

:::{.bg-asphalt .fg-pumpkin .fx80}
**Header**
:::

:::{.bg-asbestos}
Body
:::

:::{.bg-asphalt .fg-pumpkin .fx40}
*Footer*
:::

## A double grid layout {.flex50}

::::: {.grid50}

:::{.bg-sunflower}
Header-left
:::

:::{.bg-asphalt}
Body-left
:::

:::{.bg-asbestos}
Footer-left
:::

:::::


::::: {.grid50}

:::{.bg-pumpkin}
Header-right
:::

:::{.bg-asbestos}
Body-right
:::

:::{.bg-asphalt}
Footer-right
:::

:::::

## {.grid50} layout {.grid50}

:::{.bg-pumpkin .fx50 .align-left}
Two panes w/ a header & footer
:::

:::::{.flex50}

:::{.bg-asphalt}
left
:::

:::{.bg-asbestos}
right
:::

:::::

:::{.bg-pumpkin .fx30}
disclaimer here ...
:::



## {.grid50} layout {.grid50}

:::{.bg-pumpkin .fx50 .align-left}
Header
:::

:::::{.flex50}

:::{.bg-asphalt}
top-left
:::

:::{.bg-asbestos}
top-right
:::

:::{.bg-asbestos}
bot-left
:::

:::{.bg-asphalt}
bot-right
:::

:::::

:::{.bg-pumpkin .fx30}
disclaimer here ...
:::

## {.grid50} layout {.grid50}

:::{.bg-pumpkin .fx50 .align-left}
Header
:::

:::::{.flex50}

:::{.bg-asphalt}
top-left
:::

:::{.bg-asbestos}
top-right
:::

:::{.bg-asbestos}
middle-left
:::

:::{.bg-asphalt}
middle-right
:::

:::{.bg-asphalt}
bottom-left
:::

:::{.bg-asbestos}
bottom-right
:::

:::::

:::{.bg-pumpkin .fx30}
disclaimer here ...
:::
