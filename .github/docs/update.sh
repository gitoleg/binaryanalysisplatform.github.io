#!/usr/bin/env sh

DRIVE=/drive

eval $(opam env)

if [ -f $DRIVE/commit ]; then
    io_commit=`cat $DRIVE/commit`
    bap="bap.upstream"
    git clone https://github.com/gitoleg/bap --single-branch --branch=new-documentation --depth=1 $bap
    cd $bap
    bap_commit=`git rev-parse --short HEAD`

    if [ "$io_commit" != "bap_commit" ]; then

#        make doc

        echo $bap_commit > bap_commit
        cp bap_commit $DRIVE

#        rsync -av  --delete doc/man1/ $DRIVE/bap/api/man1/
#        rsync -av  --delete doc/man3/ $DRIVE/$bap/api/man3/
#        rsync -av  --delete doc/lisp/ $DRIVE/bap/api/lisp/
#        rsync -avL --delete doc/odoc/ $DRIVE/bap/api/odoc/

    else
        echo "Nothing we need to do, documentation is up-to-date"
    fi
fi
