FROM ubuntu:20.04

ARG VERSION
ARG DKRON_STUFF=dkron_${VERSION}_linux_amd64.tar.gz
ENV DKRON_HOME=/dkron

ADD https://github.com/distribworks/dkron/releases/download/v$VERSION/$DKRON_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       curl \
       tzdata \
  && mkdir --parents $DKRON_HOME \
  && tar --extract --gzip --file=$DKRON_STUFF --directory=$DKRON_HOME \
  && mkdir --parents /var/lib/dkron/backup \
  && mkdir --parents /var/lib/dkron/data \
  && mkdir --parents /var/log/dkron \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$DKRON_STUFF

ADD container/ /

ARG TINI_VERSION=0.19.0
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-amd64 /usr/sbin/tini
RUN chmod +x /usr/sbin/tini

ENTRYPOINT ["tini", "--", "/dkron/dkron"]
CMD ["--help"]
