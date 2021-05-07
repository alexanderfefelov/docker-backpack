ARG VERSION

FROM jpillora/dnsmasq:$VERSION

COPY container/ /

RUN apk add --quiet --no-cache \
      curl `# For health checks` \
      netcat-openbsd `# For health checks`

ENTRYPOINT ["webproc", "--config", "/etc/dnsmasq.d/address.conf.generated", "--", "dnsmasq", "--conf-file=/etc/dnsmasq.conf"]
