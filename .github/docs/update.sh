#!/usr/bin/env sh

TOKEN=$1
io_commit=`git log --pretty=format:"%s" | head -n 1`

x=`which docker`
echo "docker ?$x"

echo "let's look what do we have"
ls -la

bap="bap.upstream"
git clone https://github.com/BinaryAnalysisPlatform/bap --single-branch --branch=master --depth=1 $bap
cd $bap
bap_commit=`git rev-parse --short HEAD`

if [ "$io_commit" != "bap_commit" ]; then
    make doc -C $bap

    remote_repo="https://${GITHUB_ACTOR}:${TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
    git config --global user.name $GITHUB_ACTOR
    git config --global user.email "action-noreply@github.com"

    rsync -av  --delete $bap/doc/man1/ bap/api/man1/
    rsync -av  --delete $bap/doc/man3/ bap/api/man3/
    rsync -av  --delete $bap/doc/lisp/ bap/api/lisp/
    rsync -avL --delete $bap/doc/odoc/ bap/api/odoc/

    git add bap/api
    git commit -m "$bap_commit"
    git push $remote_repo master
else
    echo "Nothing we need to do, documentation is up-to-date"
fi
