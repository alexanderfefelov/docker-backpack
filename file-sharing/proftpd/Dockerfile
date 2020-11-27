FROM ubuntu:20.04

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
       proftpd \
       whois `# Provides mkpasswd utility` \
  && mkdir --parents /var/proftpd \
  && (rm --force /etc/skel/.* 2> /dev/null || true) \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD container/ /

ENTRYPOINT ["/backpack-entrypoint.sh"]
CMD ["/usr/sbin/proftpd", "--nodaemon"]
