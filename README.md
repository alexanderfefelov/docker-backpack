# docker-backpack

![Backpack](assets/backpack_2551.png)

## Components

- [dnsmasq](dnsmasq)
- Elastic stack
    - [APM](elastic/apm)
    - [Elasticsearch](elastic/elasticsearch)
    - [Kibana](elastic/kibana)
    - [Logstash](elastic/logstash)
- InfluxData stack
    - [Chronograf](influxdata/chronograf)
    - [InfluxDB](influxdata/influxdb)
    - [Kapacitor](influxdata/kapacitor)
    - [Telegraf](influxdata/telegraf)
- [Grafana](grafana)
- [Graphite/StatsD](graphite-statsd)
- MySQL
    - [main instance](mysql/main) with replication
    - [test instance](mysql/test)
- [Netdata](netdata)
- [Portainer](portainer)
- [proftpd](proftpd)
- [Samba](samba)

---

Copyright (c) 2020 Alexander Fefelov, MIT license (see [LICENSE](LICENSE))
