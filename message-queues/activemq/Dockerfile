FROM openjdk:8-jre

ARG VERSION
ARG ACTIVEMQ_STUFF=apache-activemq-$VERSION-bin.tar.gz

ADD https://archive.apache.org/dist/activemq/$VERSION/$ACTIVEMQ_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && tar --extract --gzip --file=$ACTIVEMQ_STUFF \
  && mv /apache-activemq-$VERSION /activemq \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $ACTIVEMQ_STUFF

ADD container/ /

CMD ["/activemq/bin/activemq", "console"]
