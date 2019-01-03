#!/bin/bash

# Setup 1 or more lib/<framework>
# - adds external git repo's as submodules
# - or updates them

# globs
# - git repos
REVEAL="https://github.com/hakimel/reveal.js.git"
IMPRESS="https://github.com/impress/impress.js.git"  # includes submodules
INSPIRE="https://github.com/LeaVerou/inspire.js.git"

# - local dirs used
LIBS="reveal impress inspire"      # supported frameworks
LIBS="reveal" # tmp for testing setup.sh (later we'll test with impress)
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

repo() {
    # return URL for repo
}

isLocalRepo() {
    # check if $1 repo is present ($1 = reveal impress etc..)
    echo "Testing for ${1}"
    if [ -d "${LIBDIR}/${1}/.git" ]; then
        return 0;
    else
        return 1
    fi
}

gitAdd() {
    # add public repo as submodule to this repo

    LIB=$1;
    OPT=${2:-"opt"};
    URL=${3:-"url"};

    echo "git submodule add ${OPT} ${URL} ${LIBDIR}/${LIB}"
}


gitUpdate() {
    # Update rather than clone a repo
    # $1 = framework name from $LIBS
    echo "git pull ${LIBDIR}/${1}"

}

if [ $# -eq 0 ]; then
    echo "Hmm, nothing specified"
    LIBS="reveal"
fi

for LIB in ${LIBS}; do

    if isLocalRepo $LIB
    then
        echo "${REPO} exists!"
    else
        echo "${REPO} not seen!"
    fi

done

exit 0






