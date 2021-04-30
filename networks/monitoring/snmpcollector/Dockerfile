FROM ubuntu:20.04

ARG RELEASE
ARG RELEASE_HASH
ARG SNMPCOLLECTOR_STUFF=snmpcollector-$RELEASE-${RELEASE_HASH}_linux_amd64.tar.gz
ENV SNMPCOLLECTOR_HOME=/opt/snmpcollector

ADD https://github.com/toni-moreno/snmpcollector/releases/download/$RELEASE/$SNMPCOLLECTOR_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       curl `# For health checks` \
  && tar --extract --gzip --file=$SNMPCOLLECTOR_STUFF \
  && rm --force $SNMPCOLLECTOR_HOME/conf/sample.config.toml \
  && mkdir --parents $SNMPCOLLECTOR_HOME/data \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force /$SNMPCOLLECTOR_STUFF

ADD container/ /

CMD ["/backpack-entrypoint.sh"]
