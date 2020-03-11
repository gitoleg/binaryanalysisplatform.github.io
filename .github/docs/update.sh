#!/usr/bin/env sh

echo "Ok stage 1"

DRIVE=/drive

if [ -f $DRIVE/commit ]; then
    echo "Ok stage 2"

    io_commit=`cat $DRIVE/commit`
    bap="bap.upstream"
    git clone https://github.com/gitoleg/bap --single-branch --branch=new-documentation --depth=1 $bap
    cd $bap
    bap_commit=`git rev-parse --short HEAD`

    if [ "$io_commit" != "bap_commit" ]; then
        echo "going to build docs"

        make doc -C $bap

        echo bap_commit > $DRIVE/bap_commit

        rsync -av  --delete $bap/doc/man1/ $DRIVE/bap/api/man1/
        rsync -av  --delete $bap/doc/man3/ $DRIVE/$bap/api/man3/
        rsync -av  --delete $bap/doc/lisp/ $DRIVE/bap/api/lisp/
        rsync -avL --delete $bap/doc/odoc/ $DRIVE/bap/api/odoc/

    else
        echo "Nothing we need to do, documentation is up-to-date"
    fi
fi
