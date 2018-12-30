#!/bin/bash

# DIR STRUCTURE
# root
#  + src/          dir containing markdown presentations
#
#  + prez             prez - resources
#    - prez.revealjs  revealjs template file
#    - prez.slidy     slidy template file
#    + sass/          prez - sass files to override those in lib
#       + slidy/
#          - *.scss     to override slidy
#       + revealjs
#          - *.scss     to override revealjs
#       - *.scss    a theme for either framework
#    + js/            prez - js files
#    + pix/           prez - images for all presentations
#
#  + dist   where output html files are placed
#    + css         prez's css
#      + slidy/
#      + revealjs/
#      *.css
#
#    + js          prez's js
#    + lib/        symbolic link to ../lib
#    + pix/        prez's generic images
#
#  + lib
#     + revealjs   the HTML presentation framework
#     + slidy      W3C's slidy tool
#

# make-prez.sh [<format>] <input.md>
#
# - run it from root dir (needs slidy subdir)
# - creates: outp/input.html
# - <format>'s:
#    - revealjs (default),
#    - slidy

usage() {
    echo "Usage:"
    echo
    echo "  make-prez.sh [revealjs|slidy] <input.md>"
    echo
}
# output directory for html files
OUT=dist                        # where all output goes
LIB=lib                         # presentation framework used
FMT=revealjs                    # revealjs or slidy
TPL="prez/prez"                 # finds prez/prez.${FMT}

EXT=""
EXT=${EXT}+fenced_divs          # ::: <class>\n..\n::: => <div class="x">
EXT=${EXT}+pipe_tables          # easy tables
EXT=${EXT}+escaped_line_breaks  # for linebreaks in table cells
EXT=${EXT}+lists_without_preceding_blankline  # doesn't work?

if [ "$#" -eq 1 ]; then
    infile=$1;
elif [ "$#" -eq 2 ]; then
    FMT=$1;
    if [[ ! "${FMT}" =~ revealjs|slidy ]]; then
        usage;
        exit 1;
    fi
    infile=$2
else
    usage;
    exit 1;
fi

outfile=${OUT}/${infile/.md/.html}

# ensure outp directory is there
if [ ! -d ${OUT} ]; then
    echo "Creating ${OUT}"
    mkdir -p ${OUT}
fi

# ensure outp has /slidy links to slidy subdir
if [ ! -d ${OUT}/${FMT} ]; then
    echo "Linking ${OUT}/${FMT}"
    ln -s ../${LIB}/${FMT} ${OUT}/${FMT}
fi

echo "Generating $outfile"
pandoc -s -t ${FMT}${EXT} --template=${TPL} $infile -o $outfile

echo "Done!"

