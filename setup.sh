#!/bin/bash

# See https://git-scm.com/book/en/v2/Git-Tools-Submodules

# Setup/update 1 or more lib/<framework>

# howto add another repo as submodule:
#
# 1- add REPONAME="url" to '- git repo urls' below
# 2- add reponame to $REPOLIB list below

# howto re-add a submodule after deleting it, using setup.sh
#
# 1- ./setup.sh <framework>
#
# - repoExists checks to see if we're tracking <framework> as a submodule
#   and if so, will checkout the previously committed version of the repo.


# globs
declare -A REPO_URLS
REPO_URLS[reveal]="https://github.com/hakimel/reveal.js.git"
REPO_URLS[impress]="https://github.com/impress/impress.js.git"
REPO_URLS[inspire]="https://github.com/LeaVerou/inspire.js.git"

# REVEAL="https://github.com/hakimel/reveal.js.git"     # repo url
# IMPRESS="https://github.com/impress/impress.js.git"   # repo url
# INSPIRE="https://github.com/LeaVerou/inspire.js.git"  # repo url

REPOLIB="reveal impress inspire"                      # supported frameworks
REPODIR=lib                                           # where the frameworks go

# helpers
usage() {
    echo "Usage:"
    echo
    echo "  setup.sh [<framework> <framework> ...]"
    echo
    echo "  where <framework> is 1 or more of:"
    for REPO in ${!REPO_URLS[*]}
    do
        echo "   - ${REPO}  (${REPO_URLS[$REPO]})"
    done
}

# repoUrl() {
#     # return URL for repo ($1)
#     case ${1} in
#         reveal) echo ${REVEAL};;
#         impress) echo ${IMPRESS};;
#         inspire) echo ${INSPIRE};;
#         *) echo "";;
#     esac
# }

repoExists() {
    # True if REPO is presently being tracked, False otherwise
    if git ls-files --error-unmatch ${REPODIR}/${1} 2>/dev/null 1>&2
    then
        return 0;
    else
        return 1
    fi
}

repoAdd() {
    # add a new public repo as submodule to this repo
    REPO=${1};
    # URL=$(repoUrl ${REPO})
    URL=${REPO_URLS[$REPO]}
    CMD1="git submodule add ${URL} ${REPODIR}/${REPO}"
    echo "repoAdd:"
    echo "> $CMD1"
    $CMD1
    # if repo's .gitmodules is non-zero: add its sub-submodules as well
    if [ -s "$REPODIR/$REPO/.gitmodules" ]
    then
        CMD2="git submodule update --init --recursive ${REPODIR}/${REPO}"
        echo "> $CMD2"
        $CMD2
    fi
}

repoUpdate() {
    # Update an existing submodule (repo)
    REPO=$1
    CMD="git submodule update --remote --recursive ${REPODIR}/${REPO}"
    echo "repoUpdate:"
    echo "> $CMD"
    $CMD
}

# -- MAIN --

# - sanitize cli args (must be valid REPO names)
if [ $# -eq 0 ]; then
    usage
    exit 1
else
    REPOS=""
    for REPO in $@; do
        if [[ -v REPO_URLS[$REPO] ]]
        then
            echo "ACCEPT: $REPO -> ${REPO_URLS[$REPO]}"
            REPOS="${REPOS} $REPO"
        else
            echo "REJECT: $REPO <- not one of: ${!REPO_URLS[*]}"
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

echo "You might want to check git status & commit as needed."
echo "-- Done."

exit 0
