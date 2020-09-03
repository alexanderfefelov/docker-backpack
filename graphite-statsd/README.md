# backpack-graphite-statsd

Hostnames: `graphite.backpack.test`, `statsd.backpack.test`

## Services

| Port | Service | Credentials
| ---: | ------- | -----------
| [81](http://graphite.backpack.test:81) | Graphite API and management console | `admin_blemsturtwin` / `witomerearec`
| [82](http://graphite.backpack.test:82) | Graphite API and management console behind Nginx | `admin_blemsturtwin` / `witomerearec`
| 2003, 2003/udp | Carbon receiver, plaintext | -
| 2004 | Carbon receiver, pickle | -
| 2023 | Carbon aggregator, plaintext | -
| 2024 | Carbon aggregator, pickle | -
| 8125/udp | StatsD | -
| 8126 | [StatsD management interface](https://github.com/statsd/statsd/blob/master/docs/admin_interface.md) | -
