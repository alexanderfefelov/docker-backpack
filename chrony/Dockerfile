FROM ubuntu:20.04 as builder

ARG VERSION
ARG IMAGE_NAME

LABEL $IMAGE_NAME-stage=builder

ARG CHRONY_STUFF=chrony-$VERSION.tar.gz

ADD https://download.tuxfamily.org/chrony/$CHRONY_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       build-essential \
       gcc \
  && tar --extract --gzip --file=$CHRONY_STUFF \
  && cd chrony-$VERSION \
  && ./configure \
  && make

FROM ubuntu:20.04 AS target

ARG VERSION

COPY --from=builder /chrony-$VERSION/chronyd /usr/sbin
COPY --from=builder /chrony-$VERSION/chronyc /usr/bin
ADD container/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && mkdir --parents /var/lib/chrony

CMD ["chronyd", "-d", "-f", "/etc/chrony/chrony.conf"]
