# docker-backpack

![Backpack](doc/assets/backpack_2551.png)

## Components

- Business intelligence
    - [Cubes](business-intelligence/cubes)
    - [CubesViewer Server](business-intelligence/cubesviewer-server)
    - [Metabase](business-intelligence/metabase)
- Databases
    - MySQL
        - [main instance](databases/mysql/main) with replication
        - [test instance](databases/mysql/test)
    - PostgreSQL
        - [main instance](databases/postgresql/main)
        - [test instance](databases/postgresql/test)
- [dnsmasq](dnsmasq)
- Elastic stack
    - [APM](elastic/apm)
    - [Elasticsearch](elastic/elasticsearch)
    - [Kibana](elastic/kibana)
    - [Logstash](elastic/logstash)
- File sharing
    - [proftpd](file-sharing/proftpd)
    - [Samba](file-sharing/samba)
- [Grafana](grafana)
- [Graphite/StatsD](graphite-statsd)
- InfluxData stack
    - [Chronograf](influxdata/chronograf)
    - [InfluxDB](influxdata/influxdb)
    - [Kapacitor](influxdata/kapacitor)
    - [Telegraf](influxdata/telegraf)
- [Jenkins](jenkins)
- Messaging
    - [ActiveMQ](messaging/activemq)
    - [RabbitMQ](messaging/rabbitmq)
- [Netdata](netdata)
- [Ofelia](ofelia)
- [Portainer](portainer)
- [Prometheus](prometheus)
- [Redis](redis)

---

Copyright (c) 2020 Alexander Fefelov, MIT license (see [LICENSE](LICENSE))
