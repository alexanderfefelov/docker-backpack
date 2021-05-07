ARG VERSION

FROM docker.elastic.co/apm/apm-server:$VERSION

COPY container/ /

USER root

RUN chown root:apm-server /usr/share/apm-server/apm-server.yml \
  && chmod go-w /usr/share/apm-server/apm-server.yml

USER apm-server
