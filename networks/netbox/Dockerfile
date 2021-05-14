ARG VERSION

FROM netboxcommunity/netbox:v$VERSION

COPY container/ /

RUN apk add --quiet --no-cache \
      curl `# For health checks` \
  && chown -R unit:unit \
       /opt/netbox/netbox/media \
       /opt/unit/tmp
