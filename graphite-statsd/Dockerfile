FROM graphiteapp/graphite-statsd:1.1.7-6

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks`
