ARG VERSION

FROM frrouting/frr:v$VERSION

COPY container/ /

RUN rm -f /etc/frr/*.sample* \
  && mkdir --parents /var/log/frr \
  && chown --recursive frr:frr \
       /etc/frr \
       /var/log/frr
