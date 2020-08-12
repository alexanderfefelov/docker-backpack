FROM jpillora/dnsmasq:1.1.0

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks` \
      netcat-openbsd `# For health checks`

ENTRYPOINT ["webproc","--config","/etc/dnsmasq.conf.generated","--","dnsmasq", "--conf-file=/etc/dnsmasq.conf.generated", "--no-daemon", "--dns-forward-max=1000"]
