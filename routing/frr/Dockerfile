ARG VERSION

FROM frrouting/frr:v$VERSION

ADD container/ /

RUN mkdir --parents /var/log/frr \
  && chown --recursive frr:frr \
       /etc/frr \
       /var/log/frr
