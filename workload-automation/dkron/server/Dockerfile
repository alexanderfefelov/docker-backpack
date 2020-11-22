FROM ubuntu:20.04

ARG DKRON_VERSION=3.0.8
ARG DKRON_STUFF=dkron_${DKRON_VERSION}_linux_amd64.tar.gz
ENV DKRON_HOME=/dkron

ADD https://github.com/distribworks/dkron/releases/download/v$DKRON_VERSION/$DKRON_STUFF /

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

ENTRYPOINT ["/dkron/dkron"]
CMD ["--help"]
