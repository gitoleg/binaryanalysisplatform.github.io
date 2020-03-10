FROM binaryanalysisplatform/bap:latest
WORKDIR /home/opam

RUN eval $(opam env) \
 && opam install odig --yes
#DON'T FORGET '\' && git clone https://github.com/BinaryAnalysisPlatform/bap --single-branch --branch master --depth=1 \
# && cd bap \
# && make doc && ls doc

#ENTRYPOINT ["sh", "/home/opam/update.sh"]
