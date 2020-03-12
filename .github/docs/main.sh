#!/usr/bin/env sh

x=`cat .github/docs/bap-digest`
y=`curl -s https://hub.docker.com/v2/repositories/binaryanalysisplatform/bap/tags | jq -r '.results|.[]| select ( .name == "latest") | .images | .[] | .digest'`

if [ "get$x" != "get $y" ]; then
    echo y > .github/docs/bap-digest
    git log --pretty=format:"%s" | head -n 1 > .github/docs/commit
    docker image build .github/docs -t docs
    mkdir ready
    docker run -v `pwd`:/drive --name mycontainer docs
    docker cp    mycontainer:/home/opam/bap.master/doc/lisp ready/
    docker cp    mycontainer:/home/opam/bap.master/doc/man1 ready/
    docker cp    mycontainer:/home/opam/bap.master/doc/man3 ready/
    docker cp -L mycontainer:/home/opam/bap.master/doc/odoc ready/
    docker cp    mycontainer:/home/opam/bap.master/bap_commit .
    docker container stop mycontainer
    docker container rm mycontainer
    docker image rm docs
fi
