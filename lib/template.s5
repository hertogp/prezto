<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="$lang$" xml:lang="$lang$"$if(dir)$ dir="$dir$"$endif$>
<head>
  <meta charset="utf-8" />
  <meta name="generator" content="pandoc" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />

$for(author-meta)$
  <meta name="author" content="$author-meta$" />
$endfor$

$if(date-meta)$
  <meta name="dcterms.date" content="$date-meta$" />
$endif$

$if(keywords)$
  <meta name="keywords" content="$for(keywords)$$keywords$$sep$, $endfor$" />
$endif$

  <title>$if(title-prefix)$$title-prefix$ – $endif$$pagetitle$</title>
  <style type="text/css">
      code{white-space: pre-wrap;}
      span.smallcaps{font-variant: small-caps;}
      span.underline{text-decoration: underline;}
      div.column{display: inline-block; vertical-align: top; width: 50%;}

$if(quotes)$
      q { quotes: "“" "”" "‘" "’"; }
$endif$
  </style>

$if(highlighting-css)$
  <style type="text/css">
$highlighting-css$
  </style>
$endif$

<link href="lib/inspire.js/inspire.css" rel="stylesheet" />
<link href="lib/inspire.js/theme.css" rel="stylesheet" />
<link href="lib/inspire.js/plugins/overview/plugin.css"></script>
<link href="lib/inspire.js/plugins/presenter/plugin.css"></script>
<link href="lib/inspire.js/plugins/slide-style/plugin.css"></script>
<!-- <link href="talk.css" rel="stylesheet" /> -->
$for(css)$
  <link rel="stylesheet" href="$css$" />
$endfor$

$if(math)$
  $math$
$endif$

<!--
  bliss required by inspire, preloading enables `self-contained`
-->
<script src="lib/bliss.shy.min.js"></script>

  <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv-printshiv.min.js"></script>
  <![endif]-->

$for(header-includes)$
  $header-includes$
$endfor$
</head>

<body>
$for(include-before)$
$include-before$
$endfor$

$if(title)$
<header id="title-block-header">
    <h1 class="title">$title$</h1>
$if(subtitle)$
    <p class="subtitle">$subtitle$</p>
$endif$
$for(author)$
    <p class="author">$author$</p>
$endfor$
$if(date)$
    <p class="date">$date$</p>
$endif$
</header>
$endif$

$if(toc)$
<nav id="$idprefix$TOC">
$table-of-contents$
</nav>
$endif$

$body$

$for(include-after)$
$include-after$
$endfor$

<script src="lib/inspire.js/inspire.js"></script>
<!-- 
    how to pre-load the plugins to enable self-containedi ????
-->
<script src="lib/inspire.js/plugins/overview/plugin.js"></script>
<script src="lib/inspire.js/plugins/presenter/plugin.js"></script>
<script src="lib/inspire.js/plugins/slide-style/plugin.js"></script>
    <script>
        console.log("plugins:", Inspire.plugins)
        for(let k in Inspire.pluginTest) {
            console.log('plugin', k);
            Inspire.plugins[k]=Promise.resolve(1);
        }
    </script>
</body>
</html>
