ARG VERSION

FROM swaggerapi/swagger-editor:v$VERSION

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks`
