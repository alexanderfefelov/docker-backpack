FROM openjdk:8-jre

ARG VERSION
ARG ACTIVEMQ_STUFF=apache-activemq-$VERSION-bin.tar.gz

ARG HAWTIO_VERSION=2.13.2
ARG HAWTIO_STUFF=hawtio-default-$HAWTIO_VERSION.war

ADD https://archive.apache.org/dist/activemq/$VERSION/$ACTIVEMQ_STUFF /
ADD https://repo1.maven.org/maven2/io/hawt/hawtio-default/$HAWTIO_VERSION/$HAWTIO_STUFF /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && tar --extract --gzip --file=$ACTIVEMQ_STUFF \
  && mv /apache-activemq-$VERSION /activemq \
  && unzip -qq $HAWTIO_STUFF -d /activemq/webapps/hawtio \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $ACTIVEMQ_STUFF \
  && rm --force $HAWTIO_STUFF

ADD container/ /

CMD ["/activemq/bin/activemq", "console"]
