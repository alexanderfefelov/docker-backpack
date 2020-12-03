FROM ubuntu:20.04 AS builder

ARG IMAGE_NAME
ARG NFDUMP_VERSION

LABEL $IMAGE_NAME-stage=builder

ADD https://github.com/phaag/nfdump/archive/v$NFDUMP_VERSION.tar.gz /

RUN apt-get -qq update \
  && apt-get -qq install --yes --no-install-recommends \
       autoconf \
       automake \
       build-essential \
       byacc \
       flex \
       gcc \
       libbz2-dev \
       libtool \
       make \
       pkg-config \
  && tar --extract --gzip --file=v$NFDUMP_VERSION.tar.gz \
  && rm v$NFDUMP_VERSION.tar.gz \
  && cd nfdump-$NFDUMP_VERSION \
  && ./autogen.sh \
  && ./configure \
         --enable-nsel=yes \
         --enable-shared=no \
  && make \
  && make install

FROM ubuntu:20.04 AS target

COPY --from=builder /usr/local/bin/ /usr/local/bin/

ADD container/target/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["nfcapd", "-T", "all", "-l", "/data", "-S", "1", "-w", "-z", "-p", "9999"]
