FROM ubuntu:20.04

ADD container/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       atftpd \
       netcat `# For health checks` \
  && mkdir /tftpboot \
  && chown nobody:nogroup /tftpboot \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/sbin/atftpd", "--daemon", "--no-fork", "--verbose=7", "--logfile", "-", "/tftpboot"]
