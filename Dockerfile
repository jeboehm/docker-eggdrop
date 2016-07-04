FROM debian:jessie
MAINTAINER Jeffrey Boehm "jeff@ressourcenkonflikt.de"

ENV EGGDROP_HOME="/home/eggdrop/eggdrop"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    mysqltcl \
    eggdrop && \
    useradd -m eggdrop && \
    mkdir -p $EGGDROP_HOME && \
    chown eggdrop $EGGDROP_HOME

USER eggdrop
WORKDIR $EGGDROP_HOME

RUN zcat /usr/share/doc/eggdrop-data/examples/eggdrop.conf.gz > eggdrop.conf

ENTRYPOINT ["eggdrop", "-n"]
