#!/bin/bash

# Setup 1 or more lib/<framework>

# globs
LIBS="reveal impress inspire"      # supported frameworks
LIBDIR=lib

# HELPERS
usage() {
    echo "Usage:"
    echo
    echo "  setup.sh [<framework> <framework> ...]"
    echo
    echo "  where <framework> is 1 or more of:"
    echo "  - reveal"
    echo "  - impress"
    echo "  - inspire"
}

gitclone() {

    LIB=$1;
    OPT=${2:-"opt"};
    URL=${3:-"url"};

    echo "git clone ${OPT} ${URL} ${LIBDIR}/${LIB}"
}

gitexists() {
    # check if $1 refers to a lib/<framework>/.git directory
    echo "Testing for ${1}"
    if [ -d ${1} ]; then
        return 0;
    else
        return 1
    fi
}

gitupdate() {
    # Update rather than clone a repo
    # $1 = framework name from $LIBS
    echo "git pull ${LIBDIR}/${1}"

}
if [ $# -eq 0 ]; then
    echo "Hmm, nothing specified"
    LIBS="reveal impress inspire s5"
fi

for LIB in ${LIBS}; do
    gitclone $LIB "--recursive" "my-url"
    REPO="${LIBDIR}/${LIB}/.git"

    if gitexists $REPO
    then
        echo "${REPO} exists!"
    else
        echo "${REPO} not seen!"
    fi

done

exit 0






