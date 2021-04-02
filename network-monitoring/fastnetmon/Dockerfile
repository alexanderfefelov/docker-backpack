FROM ubuntu:20.04

ARG VERSION
ARG FASTNETMON_STUFF=fastnetmon_${VERSION}_amd64.deb

ADD https://community-downloads.fastnetmon.com/releases/$VERSION/ubuntu/20.04/$FASTNETMON_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       ca-certificates \
       gettext-base \
       jq \
       libatomic1 \
       libpcap0.8 \
       mysql-client \
       netcat `# For health checks` \
       python3-pip \
       uuid-runtime \
  && pip3 --quiet install \
       httpie \
  && mkdir --parents /fastnetmon/log \
  && dpkg --install $FASTNETMON_STUFF \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $FASTNETMON_STUFF

ADD container/ /

ENTRYPOINT ["/backpack-entrypoint.sh"]
CMD ["/fastnetmon/bin/fastnetmon.sh"]
