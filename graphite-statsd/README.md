# backpack-graphite-statsd

Hostname:

- `graphite-statsd.backpack.test`

## Services

| Port | Service | Credentials
| ---: | :------ | :----------
| [81](http://graphite-statsd.backpack.test:81) | Graphite [HTTP API](https://graphite.readthedocs.io/en/latest/render_api.html) and management console | `admin_blemsturtwin` / `witomerearec`
| [82](http://graphite-statsd.backpack.test:82) | Graphite HTTP API and management console behind Nginx | `admin_blemsturtwin` / `witomerearec`
| 2003, 2003/udp | Carbon receiver, [plaintext](https://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-plaintext-protocol) | -
| 2004 | Carbon receiver, [pickle](https://graphite.readthedocs.io/en/latest/feeding-carbon.html#the-pickle-protocol) | -
| 2023 | Carbon aggregator, plaintext | -
| 2024 | Carbon aggregator, pickle | -
| 8125/udp | StatsD | -
| 8126 | StatsD [management interface](https://github.com/statsd/statsd/blob/master/docs/admin_interface.md) | -
