FROM binaryanalysisplatform/bap:latest

WORKDIR /home/opam
COPY update.sh /home/opam/update.sh
COPY commit /home/opam/commit

RUN sudo apt-get install emacs-nox man2html \
  && eval $(opam env) && opam install odig --yes && ./update.sh

ENTRYPOINT ["sh"]
