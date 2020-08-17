FROM graphiteapp/graphite-statsd:1.1.7-6

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks` \
  && ln -s /opt/graphite/webapp/manage.py /manage.py
