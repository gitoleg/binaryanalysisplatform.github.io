#FROM binaryanalysisplatform/bap:latest #TODO
FROM gitoleg/bap:latest

WORKDIR /home/opam
COPY update.sh /home/opam/update.sh
COPY commit /home/opam/commit

RUN eval $(opam env) && opam install odig --yes && ./update.sh

ENTRYPOINT ["sh"]
