FROM binaryanalysisplatform/bap:latest

WORKDIR /home/opam
COPY update.sh /home/opam/update.sh

RUN sudo apt-get install emacs-nox man2html --yes \
  && eval $(opam env) && opam install odig --yes

ENTRYPOINT ["sh", "/home/opam/update.sh"]
