FROM grafana/grafana:7.2.2

USER root

ADD container/ /

RUN apk add --quiet \
      curl `# For health checks` \
  && grafana-cli plugins install grafana-clock-panel \
  && grafana-cli plugins install grafana-piechart-panel \
  && grafana-cli plugins install grafana-polystat-panel \
  && grafana-cli plugins install grafana-simple-json-datasource \
  && grafana-cli plugins install redis-datasource

USER grafana
