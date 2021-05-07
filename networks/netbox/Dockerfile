ARG VERSION

FROM netboxcommunity/netbox:v$VERSION

COPY container/ /

RUN apk add --quiet \
      curl `# For health checks`
