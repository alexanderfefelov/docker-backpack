ARG VERSION

FROM graphiteapp/graphite-statsd:$VERSION

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks` \
      netcat-openbsd `# For health checks` \
  && ln -s /opt/graphite/webapp/manage.py /manage.py
