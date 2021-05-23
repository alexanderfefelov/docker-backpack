ARG VERSION

FROM cznic/knot-resolver:v$VERSION

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY container/ /

ENTRYPOINT ["/usr/sbin/kresd"]
CMD ["--noninteractive", "--config", "/etc/knot-resolver/kresd.conf"]
