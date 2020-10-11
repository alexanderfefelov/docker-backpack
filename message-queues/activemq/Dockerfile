FROM openjdk:8-jre

ENV ACTIVEMQ_VERSION=5.16.0

ENV ACTIVEMQ_STUFF=apache-activemq-$ACTIVEMQ_VERSION-bin.tar.gz

ADD https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && tar --extract --gzip --file=$ACTIVEMQ_STUFF \
  && mv /apache-activemq-$ACTIVEMQ_VERSION /activemq \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $ACTIVEMQ_STUFF

ADD container/ /

CMD ["/activemq/bin/activemq", "console"]
