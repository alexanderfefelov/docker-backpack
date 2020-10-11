FROM ubuntu:20.04

ENV GOBGP_VERSION=2.20.0

ENV GOBGP_STUFF=gobgp_${GOBGP_VERSION}_linux_amd64.tar.gz

ENV GOBGP_HOME=/gobgp

ADD https://github.com/osrg/gobgp/releases/download/v$GOBGP_VERSION/$GOBGP_STUFF /

RUN mkdir --parents $GOBGP_HOME \
  && tar --extract --gzip --file=$GOBGP_STUFF --directory=$GOBGP_HOME \
  && rm --force /$GOBGP_STUFF \
&& ls -la $GOBGP_HOME

ADD container/ /

CMD ["/gobgp/gobgpd", "--config-file=/etc/gobgp/gobgp.toml"]
