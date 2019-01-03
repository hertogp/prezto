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
REPOLIB="reveal impress inspire"      # supported frameworks
REPODIR=lib

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

repoUrl() {
    # return URL for repo

    case $1 in
        reveal) echo $REVEAL;;
        impress) echo $IMPRESS;;
        inspire) echo $INSPIRE;;
        *) echo "";;
    esac
}

repoExists() {
    # True REPO ($1) exists, False otherwise

    if [ -d "${REPODIR}/${1}" ]; then
        return 0;
    else
        return 1
    fi
}

repoOpts() {
    # Return options for git submodule command

    case $1 in
        impress) echo "--recursive";;
        *) echo "";;
    esac
}

repoAdd() {
    # add public repo as submodule to this repo

    REPO=$1;
    OPTS=$(repoOpts $REPO)
    URL=$(repoUrl $1)
    CMD1="git submodule add $URL $REPODIR/$REPO"
    CMD2="git submodule update --init --recursive $REPODIR/$REPO"
    echo "repoAdd:"
    echo "- $CMD1"
    $CMD1

    if [ -s "$REPODIR/$REPO/.gitmodules" ]
    then
        echo "- $CMD2"
        $CMD2
    fi
}

repoUpdate() {
    # Update rather than clone a repo
    # $1 = framework name from $LIBS

    REPO=$1
    OPTS=$(repoOpts $REPO)
    CMD="git submodule update --remote --recursive ${REPODIR}/$REPO"

    echo "repoUpdate: $CMD"
    $CMD
}

# -- MAIN --

# - sanitize cli args (must be valid REPO names)
if [ $# -eq 0 ]; then
    echo "Hmm, nothing specified"
    REPOS="impress"
else
    REPOS=""
    for REPO in $@; do
        if [ -z "$(repoUrl $REPO)" ]
        then
            echo "rejecting $REPO: -> must be 1 of [${REPOLIB}]"
        else
            echo "accepting $REPO"
            REPOS="${REPOS} $REPO"
        fi
    done
fi

# - handle all requested REPO's
for REPO in ${REPOS}; do

    if repoExists $REPO
    then
        repoUpdate $REPO
    else
        repoAdd $REPO
    fi

done

exit 0
