#!/usr/bin/env sh

set -eu

sync () {
    if [ -d $1 ]; then
        rsync -a --delete $1 $2
    fi
}


eval $(opam env)

TOKEN=$1

bap="bap.master"

git clone https://github.com/BinaryAnalysisPlatform/bap --single-branch --branch=master --depth=1 $bap
cd $bap
bap_commit=`git rev-parse --short HEAD`

make doc
ls doc

blog=blog

git clone https://github.com/BinaryAnalysisPlatform/binaryanalysisplatform.github.io --single-branch --branch=master --depth=1 $blog

sync ready/man1/ $blog/bap/api/man1/
sync ready/man3/ $blog/bap/api/man3/
sync ready/lisp/ $blog/bap/api/lisp/
sync ready/odoc/ $blog/bap/api/odoc/

cd $blog

repo="https://${GITHUB_ACTOR}:${TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git config --global user.name $GITHUB_ACTOR
git config --global user.email "action-noreply@github.com"

git add bap/api

git commit -m $bap_commit
#  git push $repo master # TODO!
git push $repo add-actions
