ARG VERSION

FROM metabase/metabase:v$VERSION

COPY container/ /

RUN apk add --quiet \
      curl `# For health checks`
