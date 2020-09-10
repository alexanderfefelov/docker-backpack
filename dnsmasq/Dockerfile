FROM jpillora/dnsmasq:1.1.0

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks` \
      netcat-openbsd `# For health checks`

ENTRYPOINT ["webproc", "--config", "/etc/dnsmasq.d/address.conf.generated", "--", "dnsmasq", "--conf-file=/etc/dnsmasq.conf", "--no-daemon", "--dns-forward-max=1000"]
