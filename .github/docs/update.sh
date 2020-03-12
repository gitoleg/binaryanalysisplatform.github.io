#!/usr/bin/env sh

io_commit=/home/opam/commit

eval $(opam env)
ls -l

if [ -f $io_commit ]; then
    bap="bap.master"
    # TODO
    # git clone https://github.com/BinaryAnalysisPlatform/bap --single-branch --branch=master --depth=1 $bap
    git clone https://github.com/gitoleg/bap --single-branch --branch=new-documentation --depth=1 $bap
    cd $bap
    bap_commit=`git rev-parse --short HEAD`

    if [ "$io_commit" != "bap_commit" ]; then
        make doc
        ls
        echo $bap_commit > bap_commit
        `pwd`
        # cp -r  doc/man1/ $DRIVE/ready
        # cp -r  doc/man3/ $DRIVE/ready
        # cp -r  doc/lisp/ $DRIVE/ready
        # cp -rL doc/odoc/ $DRIVE/ready
        # rsync -a  --delete doc/man1/ $DRIVE/bap/api/man1/
        # rsync -a  --delete doc/man3/ $DRIVE/bap/api/man3/
        # rsync -a  --delete doc/lisp/ $DRIVE/bap/api/lisp/
        # rsync -aL --delete doc/odoc/ $DRIVE/bap/api/odoc/

    else
        echo "Nothing we need to do, documentation is up-to-date"
    fi
else
    echo "Can't find a file with commit"
    exit 1
fi
