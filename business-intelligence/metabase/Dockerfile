ARG VERSION

FROM metabase/metabase:v$VERSION

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks`
