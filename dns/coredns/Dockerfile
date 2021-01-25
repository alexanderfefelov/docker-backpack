FROM ubuntu:20.04

ARG VERSION
ARG COREDNS_STUFF=coredns_${VERSION}_linux_amd64.tgz
ENV COREDNS_HOME=/coredns

ADD https://github.com/coredns/coredns/releases/download/v$VERSION/$COREDNS_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && mkdir --parents $COREDNS_HOME \
  && tar --extract --gzip --file=$COREDNS_STUFF --directory=$COREDNS_HOME \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$COREDNS_STUFF

ADD container/ /

CMD ["/coredns/coredns", "-conf", "/etc/coredns/Corefile"]
