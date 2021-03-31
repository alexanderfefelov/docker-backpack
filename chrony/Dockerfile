FROM ubuntu:20.04

ARG VERSION

ADD container/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       chrony=$VERSION \
       netcat `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["chronyd", "-d"]
