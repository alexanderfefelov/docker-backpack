FROM grafana/grafana:7.1.4

USER root

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks`

USER grafana
