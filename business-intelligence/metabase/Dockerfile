ARG VERSION

FROM metabase/metabase:v$VERSION

COPY container/ /

RUN apk add --quiet --no-cache \
      curl `# For health checks`
