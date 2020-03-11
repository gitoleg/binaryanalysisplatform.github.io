#FROM binaryanalysisplatform/bap:latest #TODO
FROM gitoleg/bap:latest

WORKDIR /home/opam
RUN eval $(opam env) && opam install odig --yes
COPY update.sh /home/opam/update.sh

ENTRYPOINT ["sh", "/home/opam/update.sh"]
