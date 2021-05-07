ARG VERSION

FROM netboxcommunity/netbox:v$VERSION

COPY container/ /

RUN apk add --quiet --no-cache \
      curl `# For health checks`
