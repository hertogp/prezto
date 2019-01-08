<!DOCTYPE html>
<html$if(lang)$ lang="$lang$"$endif$$if(dir)$ dir="$dir$"$endif$>
<head>
  <meta charset="utf-8">
  <meta name="generator" content="pandoc">
$for(author-meta)$
  <meta name="author" content="$author-meta$">
$endfor$
$if(date-meta)$
  <meta name="dcterms.date" content="$date-meta$">
$endif$
$if(keywords)$
  <meta name="keywords" content="$for(keywords)$$keywords$$sep$, $endfor$">
$endif$
  <title>$if(title-prefix)$$title-prefix$ – $endif$$pagetitle$</title>
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">
  <link rel="stylesheet" href="lib/reveal/css/reveal.css">
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
  <!-- highlighting css -->
  <style type="text/css">
$highlighting-css$
  </style>
$endif$
$if(theme)$
  <!-- $theme$.css theme (via yaml's theme variable) -->
  <link rel="stylesheet" href="lib/reveal/css/theme/$theme$.css" id="theme">
$else$
  <!-- black.css theme (default) -->
  <link rel="stylesheet" href="lib/reveal/css/theme/black.css" id="theme">
$endif$
$for(css)$
  <!-- $css$ (via yaml's css single/list of css additions) -->
  <link rel="stylesheet" href="$css$"/>
$endfor$
  <!-- Printing and PDF exports:
  In order to be self-contained, the <script> to dynamically load pdf.css or
  paper.css based on url matching /print-pdf/gi (or not) has been removed.
  To create a pdf version:
  - add css variable to yaml e.g. css: css/print/paper.css
  - convert markdown to html, open the html file & print it from the browser

  Note:
  - there's something funky going on wrt the theme used
  - at the moment all slides turn out blank ...(white theme)
  -->
$if(math)$
  <!-- yaml's math -->
  $math$
$endif$
$for(header-includes)$
  <!-- a header-include -->
  $header-includes$
$endfor$
</head>
<body>
$for(include-before)$
$include-before$
$endfor$
  <div class="reveal">
    <div class="slides">

$if(title)$
<section id="$idprefix$title-slide">
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
</section>
$endif$
$if(toc)$
<section id="$idprefix$TOC">
$table-of-contents$
</section>
$endif$

$body$
    </div>
  </div>

  <script src="lib/reveal/lib/js/head.min.js"></script>
  <script src="lib/reveal/js/reveal.js"></script>

  <script>

      // Full list of configuration options available at:
      // https://github.com/hakimel/reveal.js#configuration
      Reveal.initialize({
$if(controls)$
        // Display controls in the bottom right corner
        controls: $controls$,
$endif$
$if(progress)$
        // Display a presentation progress bar
        progress: $progress$,
$endif$
$if(slideNumber)$
        // Display the page number of the current slide
        slideNumber: $slideNumber$,
$endif$
        // Push each slide change to the browser history
$if(history)$
        history: $history$,
$else$
        history: true,
$endif$
$if(keyboard)$
        // Enable keyboard shortcuts for navigation
        keyboard: $keyboard$,
$endif$
$if(overview)$
        // Enable the slide overview mode
        overview: $overview$,
$endif$
$if(center)$
        // Vertical centering of slides
        center: $center$,
$endif$
$if(touch)$
        // Enables touch navigation on devices with touch input
        touch: $touch$,
$endif$
$if(loop)$
        // Loop the presentation
        loop: $loop$,
$endif$
$if(rtl)$
        // Change the presentation direction to be RTL
        rtl: $rtl$,
$endif$
$if(fragments)$
        // Turns fragments on and off globally
        fragments: $fragments$,
$endif$
$if(embedded)$
        // Flags if the presentation is running in an embedded mode,
        // i.e. contained within a limited portion of the screen
        embedded: $embedded$,
$endif$
$if(help)$
        // Flags if we should show a help overlay when the questionmark
        // key is pressed
        help: $help$,
$endif$
$if(showNotes)$
        // Flags if speaker notes should be visible to all viewers
        showNotes: $showNotes$,
$endif$
$if(autoSlide)$
        // Number of milliseconds between automatically proceeding to the
        // next slide, disabled when set to 0, this value can be overwritten
        // by using a data-autoslide attribute on your slides
        autoSlide: $autoSlide$,
$endif$
$if(autoSlideStoppable)$
        // Stop auto-sliding after user input
        autoSlideStoppable: $autoSlideStoppable$,
$endif$
$if(mouseWheel)$
        // Enable slide navigation via mouse wheel
        mouseWheel: $mouseWheel$,
$endif$
$if(rollingLinks)$
        // Apply a 3D roll to links on hover
        rollingLinks: $rollingLinks$,
$endif$
$if(hideAddressBar)$
        // Hides the address bar on mobile devices
        hideAddressBar: $hideAddressBar$,
$endif$
$if(previewLinks)$
        // Opens links in an iframe preview overlay
        previewLinks: $previewLinks$,
$endif$
$if(transition)$
        // Transition style
        transition: '$transition$', // none/fade/slide/convex/concave/zoom
$endif$
$if(transitionSpeed)$
        // Transition speed
        transitionSpeed: '$transitionSpeed$', // default/fast/slow
$endif$
$if(backgroundTransition)$
        // Transition style for full page slide backgrounds
        backgroundTransition: '$backgroundTransition$', // none/fade/slide/convex/concave/zoom
$endif$
$if(viewDistance)$
        // Number of slides away from the current that are visible
        viewDistance: $viewDistance$,
$endif$
$if(parallaxBackgroundImage)$
        // Parallax background image
        parallaxBackgroundImage: '$parallaxBackgroundImage$', // e.g. "'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'"
$else$
$if(background-image)$
       // Parallax background image
       parallaxBackgroundImage: '$background-image$', // e.g. "'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'"
$endif$
$endif$
$if(parallaxBackgroundSize)$
        // Parallax background size
        parallaxBackgroundSize: '$parallaxBackgroundSize$', // CSS syntax, e.g. "2100px 900px"
$endif$
$if(parallaxBackgroundHorizontal)$
        // Amount to move parallax background (horizontal and vertical) on slide change
        // Number, e.g. 100
        parallaxBackgroundHorizontal: $parallaxBackgroundHorizontal$,
$endif$
$if(parallaxBackgroundVertical)$
        parallaxBackgroundVertical: $parallaxBackgroundVertical$,
$endif$
$if(width)$
        // The "normal" size of the presentation, aspect ratio will be preserved
        // when the presentation is scaled to fit different resolutions. Can be
        // specified using percentage units.
        width: $width$,
$endif$
$if(height)$
        height: $height$,
$endif$
$if(margin)$
        // Factor of the display size that should remain empty around the content
        margin: $margin$,
$endif$
$if(minScale)$
        // Bounds for smallest/largest possible scale to apply to content
        minScale: $minScale$,
$endif$
$if(maxScale)$
        maxScale: $maxScale$,
$endif$
$if(mathjax)$
        math: {
          mathjax: '$mathjaxurl$',
          config: 'TeX-AMS_HTML-full',
          tex2jax: {
            inlineMath: [['\\(','\\)']],
            displayMath: [['\\[','\\]']],
            balanceBraces: true,
            processEscapes: false,
            processRefs: true,
            processEnvironments: true,
            preview: 'TeX',
            skipTags: ['script','noscript','style','textarea','pre','code'],
            ignoreClass: 'tex2jax_ignore',
            processClass: 'tex2jax_process'
          },
        },
$endif$

        // Optional reveal.js plugins
        dependencies: [
          { src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } },
          //{ src: 'lib/reveal/plugin/zoom-js/zoom.js', async: true },
          // { src: 'lib/reveal/plugin/zoom-js/zoom.js', async: false },
$if(notes-server)$
          { src: 'lib/reveal/socket.io/socket.io.js', async: true },
          { src: 'lib/reveal/plugin/notes-server/client.js', async: true },
$endif$
$if(mathjax)$
          { src: 'lib/reveal/plugin/math/math.js', async: true },
$endif$
          // { src: 'lib/reveal/plugin/notes/notes.js'}
        ]
      });
    </script>
    <script>
    // check Reveal is there
    console.log(Reveal);
    </script>
  <!--
    Preload plugins: trying to be self-contained
  -->
  <script src="lib/reveal/plugin/zoom-js/zoom.js"></script>
  <script src="lib/reveal/plugin/notes/notes.js"></script>
  <script>
     Reveal.addKeyBinding({keyCode: 83,
                           key: 'S',
                           description: 'Speaker notes view'
                          }, function() {
                            RevealNotes.open('notes.html');
                          });
  </script>

  $for(include-after)$
  $include-after$
  $endfor$
  </body>
</html>
