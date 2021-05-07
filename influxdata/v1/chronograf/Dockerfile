ARG VERSION

FROM quay.io/influxdb/chronograf:$VERSION

RUN apk add --quiet \
      curl `# For health checks`

COPY container/ /
