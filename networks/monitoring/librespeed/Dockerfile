FROM ubuntu:20.04

ARG VERSION
ARG LIBRESPEED_STUFF=speedtest-go_${VERSION}_linux_amd64.tar.gz
ENV LIBRESPEED_HOME=/librespeed

ADD https://github.com/librespeed/speedtest-go/releases/download/v$VERSION/$LIBRESPEED_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       curl `# For health checks` \
  && mkdir --parents $LIBRESPEED_HOME /etc/librespeed \
  && tar --extract --gzip --file=$LIBRESPEED_STUFF --directory=$LIBRESPEED_HOME \
  && mv $LIBRESPEED_HOME/assets /etc/librespeed/assets \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$LIBRESPEED_STUFF

ADD container/ /

WORKDIR $LIBRESPEED_HOME
CMD ["/librespeed/speedtest-backend", "-c", "/etc/librespeed/librespeed.toml"]
