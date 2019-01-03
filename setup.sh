#!/bin/bash

# See https://git-scm.com/book/en/v2/Git-Tools-Submodules

# Setup/update 1 or more lib/<framework>

# howto add another repo as submodule:
# -> add repo's url to REPO_URL assoc array

# howto re-add a submodule after deleting it, using setup.sh
# -- if you get an error after `setup.sh <repo>` about locally present:
# 1. remove relevant dir under .git/modules
# 2. remove relevant lines from .gitmodules
# 3. remove relevant lines from .git/config
# -> ./setup.sh <framework>

# globs
declare -A REPO_URL
REPO_URL[reveal]="https://github.com/hakimel/reveal.js.git"
REPO_URL[impress]="https://github.com/impress/impress.js.git"
REPO_URL[inspire]="https://github.com/LeaVerou/inspire.js.git"
# - add new urls here as needed

REPO_DIR=lib  # where the frameworks go

# helpers

repoExists() {
    # True if REPO is presently being tracked, False otherwise
    if git ls-files --error-unmatch ${REPO_DIR}/${1} 2>/dev/null 1>&2
    then
        return 0
    else
        return 1
    fi
}

repoAdd() {
    # $1 is REPO-name used in REPO_URL
    MOD=${REPO_DIR}/${1}
    URL=${REPO_URL[${1}]}
    CMD="git submodule add ${URL} ${MOD}"
    echo "repoAdd:"
    echo "> $CMD"
    $CMD
    # add any submodules if REPO's .gitmodules is non-zero
    if [ -s "${REPO_DIR}/${REPO}/.gitmodules" ]
    then
        CMD="git submodule update --init --recursive ${MOD}"
        echo "> $CMD"
        $CMD
    fi
}

repoUpdate() {
    # Update an existing submodule (repo)
    MOD=${REPO_DIR}/${1}
    CMD="git submodule update --remote --recursive ${MOD}"
    echo "repoUpdate:"
    echo "> $CMD"
    $CMD
}

usage() {
    echo "Usage:"
    echo
    echo "  setup.sh [<framework> <framework> ...]"
    echo
    echo "  to add/update a known <framework>:"
    echo
    for REPO in ${!REPO_URL[*]}
    do
        STATUS=$(repoExists ${REPO} && echo "" || echo "NOT ")
        echo "     - ${REPO} :${REPO_URL[$REPO]} - ${STATUS}tracked"
    done
    echo
}

# -- MAIN --

# - sanitize cli args (must be valid REPO names)
if [ $# -eq 0 ]; then
    usage
    exit 1
else
    REPOS=""
    for REPO in $@; do
        if [[ -v REPO_URL[$REPO] ]]
        then
            echo "ACCEPT: $REPO -> ${REPO_URL[$REPO]}"
            REPOS="${REPOS} $REPO"
        else
            echo "REJECT: $REPO <- not one of: ${!REPO_URL[*]}"
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

echo "Done."

exit 0
