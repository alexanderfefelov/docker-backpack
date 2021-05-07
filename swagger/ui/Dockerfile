ARG VERSION

FROM swaggerapi/swagger-ui:v$VERSION

COPY container/ /

RUN apk add --quiet --no-cache \
      curl `# For health checks`
