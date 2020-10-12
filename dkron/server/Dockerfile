FROM dkron/dkron:v3.0.5

ADD container/ /

RUN apk add --quiet \
      curl \
  && mkdir -p /var/lib/dkron/backup \
  && mkdir -p /var/lib/dkron/data \
  && mkdir -p /var/log/dkron
