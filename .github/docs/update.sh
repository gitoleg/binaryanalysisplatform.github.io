#!/usr/bin/env sh

DRIVE=/drive

eval $(opam env)

if [ -f $DRIVE/commit ]; then
    io_commit=`cat $DRIVE/commit`
    bap="bap.upstream"
    # TODO
    # git clone https://github.com/BinaryAnalysisPlatform/bap --single-branch --branch=master --depth=1 $bap
    git clone https://github.com/gitoleg/bap --single-branch --branch=new-documentation --depth=1 $bap
    cd $bap
    bap_commit=`git rev-parse --short HEAD`

    if [ "$io_commit" != "bap_commit" ]; then
        make doc
        echo $bap_commit > $DRIVE/bap_commit
        rsync -a  --delete doc/man1/ $DRIVE/bap/api/man1/
        rsync -a  --delete doc/man3/ $DRIVE/bap/api/man3/
        rsync -a  --delete doc/lisp/ $DRIVE/bap/api/lisp/
        rsync -aL --delete doc/odoc/ $DRIVE/bap/api/odoc/

    else
        echo "Nothing we need to do, documentation is up-to-date"
    fi
fi
