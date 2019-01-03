#!/bin/bash

# Simple script to run pandoc conversions consistently
# - run it from its own directory

usage() {
    echo "Usage:"
    echo
    echo "  prezto.sh [<framework>] path/to/input.md>"
    echo
}

# globs
OUT=dist                          # where all output goes
LIB=lib                           # html framework presentations live here
TPL=src/pandoc                    # pandoc's templates live here
FMT=reveal                        # default format to use

declare -A WRITER
WRITER[reveal]=revealjs           # has its own pandoc writer!
WRITER[impress]=html5             # use generic writer w/ custom template
WRITER[inspire]=html5             # use generic writer w/ custom template

EXT=""                            # pandoc extensions to use:
EXT="${EXT}+fenced_divs"          # ::: <class>\n..\n::: => <div class="x">
EXT="${EXT}+pipe_tables"          # easy tables
EXT="${EXT}+escaped_line_breaks"  # for linebreaks in table cells
EXT="${EXT}+lists_without_preceding_blankline"  # doesn't work?

OPT=""                            # pandoc options for conversion
OPT="${OPT} --self-contained"     # so offline viewing is possible
OPT="${OPT} --section-divs"       # needed for impress

# MAIN
# - interpret input arguments
if [ $# -eq 1 ]; then
    FMT=reveal
    SRC=$1;

elif [ $# -eq 2 ]; then
    FMT=$1
    SRC=$2
else
    usage
    exit 1;
fi

if [ ! -s ${SRC} ]; then
    echo "${SRC} not found or empty!  Nothing to do.."
    exit 1
fi

if [ ! -d ${LIB}/${FMT} ]; then
    echo "Unknown framework $FMT"
    usage
    exit 1
fi

# build --resource-path to include lib and md's source directory
RES="$(pwd)"                              # current directory
RES="${RES}:$(pwd)/${LIB}/${FMT}"         # lib /framework directory
RES="${RES}:$(dirname $(pwd)/${SRC})"     # src-file's directory

echo "RES $RES"

DST="${OUT}/$(basename ${SRC/.md/-${FMT}.html})"  # include FMT in name

# ensure outp directory is there
if [ ! -d ${OUT} ]; then
    echo "Creating ${OUT}"
    mkdir -p ${OUT}
fi

echo "Generating $DST"

# Note: --template needs ./path/to/template-file, pandoc won't find
#         it via its resource path (not used for template files?)

cmd="pandoc -s -t ${WRITER[${FMT}]}${EXT} --template=./${TPL}/$FMT.tpl --resource-path $RES $OPT $SRC -o $DST"

echo "> $cmd"
$cmd

echo "Done!"
