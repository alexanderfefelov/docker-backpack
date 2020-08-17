# backpack-graphite-statsd

Hostnames: `graphite.backpack.test`, `statsd.backpack.test`

## Services

| Port | Service | Credentials
| ---- | ------- | -----------
| [81](http://graphite.backpack.test:81) | Graphit management console | -
| [82](http://graphite.backpack.test:82) | Graphit management console behind Nginx | -
| 2003 | Carbon receiver, plaintext | -
| 2004 | Carbon receiver, pickle | -
| 2023 | Carbon aggregator, plaintext | -
| 2024 | Carbon aggregator, pickle | -
| 8125/udp | StatsD | -
| 8126 | [StatsD management](https://github.com/statsd/statsd/blob/master/docs/admin_interface.md) | -
