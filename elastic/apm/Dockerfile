FROM docker.elastic.co/apm/apm-server:7.8.1

ADD container/ /

USER root

RUN chown root:apm-server /usr/share/apm-server/apm-server.yml \
  && chmod go-w /usr/share/apm-server/apm-server.yml

USER apm-server