FROM dkron/dkron:v3.0.5

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks` \
  && mkdir -p /var/log/dkron
