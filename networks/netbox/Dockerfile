ARG VERSION

FROM netboxcommunity/netbox:v$VERSION

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks`
