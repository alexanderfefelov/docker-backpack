ARG VERSION

FROM quay.io/influxdb/chronograf:$VERSION

RUN apk add --quiet --no-cache \
      curl `# For health checks`

COPY container/ /
