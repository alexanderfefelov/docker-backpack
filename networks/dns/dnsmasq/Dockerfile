ARG VERSION

FROM jpillora/dnsmasq:$VERSION

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks` \
      netcat-openbsd `# For health checks`

ENTRYPOINT ["webproc", "--config", "/etc/dnsmasq.d/address.conf.generated", "--", "dnsmasq", "--conf-file=/etc/dnsmasq.conf"]
