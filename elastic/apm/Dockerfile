FROM docker.elastic.co/apm/apm-server:7.10.1

ADD container/ /

USER root

RUN chown root:apm-server /usr/share/apm-server/apm-server.yml \
  && chmod go-w /usr/share/apm-server/apm-server.yml

USER apm-server
