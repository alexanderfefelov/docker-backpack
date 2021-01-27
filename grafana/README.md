# backpack-grafana

Hostname `grafana.backpack.test`

## Services

| Port | Service | Credentials
| ---: | :------ | :----------
| [3000](http://grafana.backpack.test:3000) | HTTP [API](https://grafana.com/docs/grafana/latest/http_api/) and management console | `admin_expotizopuro` / `smirespascro`

## Preconfigured data sources

- Elasticsearch @ [backpack-elasticsearch](../elastic/elasticsearch)
- Graphite @ [backpack-graphite-statsd](../graphite-statsd)
- InfluxDB @ [backpack-influxdb](../influxdata/v1/influxdb)
- Prometheus @ [backpack-prometheus](../prometheus/prometheus)
- Redis @ [backpack-redis](../redis)

## Possible data sources

- [MySQL](../databases/mysql)
- [QuestDB](../databases/questdb) via PostgreSQL wire protocol
- [PostgreSQL](../databases/postgresql)
