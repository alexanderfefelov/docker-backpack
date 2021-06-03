ARG VERSION

FROM graphiteapp/graphite-statsd:$VERSION

COPY container/ /

RUN apk add --quiet --no-cache \
      curl `# For health checks` \
      netcat-openbsd `# For health checks` \
  && ln -s /opt/graphite/webapp/manage.py /manage.py
