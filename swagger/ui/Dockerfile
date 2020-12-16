ARG VERSION

FROM swaggerapi/swagger-ui:v$VERSION

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks`
