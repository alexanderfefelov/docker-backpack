FROM quay.io/alexanderfefelov/graalvm:20.3.0

ARG VERSION

ADD container/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       curl \
       jq \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN /download-server.sh $VERSION
