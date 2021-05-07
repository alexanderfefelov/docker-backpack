FROM ubuntu:20.04

ARG VERSION
ARG GOBGP_STUFF=gobgp_${VERSION}_linux_amd64.tar.gz
ENV GOBGP_HOME=/gobgp

ADD https://github.com/osrg/gobgp/releases/download/v$VERSION/$GOBGP_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && mkdir --parents $GOBGP_HOME \
  && tar --extract --gzip --file=$GOBGP_STUFF --directory=$GOBGP_HOME \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$GOBGP_STUFF

COPY container/ /

CMD ["/gobgp/gobgpd", "--config-file=/etc/gobgp/gobgp.toml"]
