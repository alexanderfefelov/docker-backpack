ARG VERSION

FROM swaggerapi/swagger-ui:v$VERSION

COPY container/ /

RUN apk add --quiet \
      curl `# For health checks`
