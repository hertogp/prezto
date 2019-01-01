#!/bin/bash

# Simple script to run pandoc conversion consistently
# - run it from its own directory: ./make-prez.sh src/file.md

usage() {
    echo "Usage:"
    echo
    echo "  to-prez.sh path/to/input.md>"
    echo
}

# Directories used
OUT=dist                        # where all output goes
LIB=lib                         # presentation framework used
FMT=s5                          # pandoc's html/slide writer

EXT=""                          # pandoc extensions to use:
EXT=${EXT}+fenced_divs          # ::: <class>\n..\n::: => <div class="x">
EXT=${EXT}+pipe_tables          # easy tables
EXT=${EXT}+escaped_line_breaks  # for linebreaks in table cells
EXT=${EXT}+lists_without_preceding_blankline  # doesn't work?

# So no network connectivity is required when viewing
OPT="--self-contained"
OPT="${OPT} --section-divs"

# check input argument
if [ "$#" -eq 1 ]; then
    infile=$1;
else
    usage;
    exit 1;
fi

# build --resource-path to include lib and md's source directory
RES=".:..:$(pwd):$(pwd)/${LIB}:$(dirname $(pwd)/${infile})"
echo "RES $RES"

outfile="${OUT}/$(basename ${infile/.md/.html})"

# ensure outp directory is there
if [ ! -d ${OUT} ]; then
    echo "Creating ${OUT}"
    mkdir -p ${OUT}
fi

# ensure OUT-dir has local symlink to ../lib
# - maybe some OUT/file.html is not self-contained
if [ ! -d ${OUT}/${LIB} ]; then
    echo "Linking ${OUT}/${LIB}"
    ln -s ../${LIB} ${OUT}/${LIB}
fi

echo "Generating $outfile"

# Note: --template needs ./path/to/template-file, pandoc won't find
#         it via ${RES} resource path (not used for template files?)

cmd="pandoc -s -t ${FMT}${EXT} --template=./lib/template.$FMT --resource-path $RES $OPT $infile -o $outfile"

echo "cmd: $cmd"

$cmd

echo "Done!"
