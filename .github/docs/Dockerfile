#FROM binaryanalysisplatform/bap:latest #TODO
FROM gitoleg/bap:latest

WORKDIR /home/opam
RUN eval $(opam env) && opam install odig --yes
COPY update.sh /home/opam/update.sh

RUN sudo groupadd docker && sudo useradd runner -g docker

ENTRYPOINT ["sh", "/home/opam/update.sh"]
