ARG VERSION

FROM swaggerapi/swagger-editor:v$VERSION

COPY container/ /

RUN apk add --quiet \
      curl `# For health checks`
