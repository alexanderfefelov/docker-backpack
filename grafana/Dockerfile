ARG VERSION

FROM grafana/grafana:$VERSION

COPY container/ /

USER root

RUN apk add --quiet --no-cache \
      curl `# For health checks` \
  && grafana-cli plugins install grafana-clock-panel \
  && grafana-cli plugins install grafana-piechart-panel \
  && grafana-cli plugins install grafana-polystat-panel \
  && grafana-cli plugins install grafana-simple-json-datasource \
  && grafana-cli plugins install redis-datasource

USER grafana
