FROM openjdk:8-jre

ENV ACTIVEMQ_VERSION=5.16.0

ENV ACTIVEMQ_STUFF=apache-activemq-$ACTIVEMQ_VERSION-bin.tar.gz

ADD https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ_STUFF /

RUN tar --extract --gzip --file $ACTIVEMQ_STUFF \
  && mv /apache-activemq-$ACTIVEMQ_VERSION /activemq \
  && rm --force $ACTIVEMQ_STUFF

ADD container/ /

CMD ["/activemq/bin/activemq", "console"]
