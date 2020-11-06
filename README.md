# docker-backpack

Before you start, run [utils/check-prerequisites.sh](utils/check-prerequisites.sh) to make sure all the tools required are available.

![Backpack](doc/assets/backpack_2551.png)

## What's inside

- [Business intelligence](business-intelligence)
    - [Cubes](business-intelligence/cubes)
      - [Backend](business-intelligence/cubes/backend)
      - [Frontend](business-intelligence/cubes/frontend)
    - [Metabase](business-intelligence/metabase)
- [Databases](databases)
    - [MongoDB](databases/mongodb)
        - [main instance](databases/mongodb/main)
        - [test instance](databases/mongodb/test)
    - [MySQL](databases/mysql)
        - [main instance](databases/mysql/main), with replication
        - [test instance](databases/mysql/test)
    - [PostgreSQL](databases/postgresql)
        - [main instance](databases/postgresql/main)
        - [test instance](databases/postgresql/test)
- [dnsmasq](dnsmasq)
- [Elastic stack](elastic)
    - [APM](elastic/apm)
    - [Elasticsearch](elastic/elasticsearch)
    - [Kibana](elastic/kibana)
    - [Logstash](elastic/logstash)
- [File sharing](file-sharing)
    - [proftpd](file-sharing/proftpd)
    - [Samba](file-sharing/samba)
- [Gitea](gitea)
- [Grafana](grafana)
- [Graphite/StatsD](graphite-statsd)
- [Guacamole](guacamole)
    - [Backend](guacamole/backend)
    - [Frontend](guacamole/frontend)
- [InfluxData stack](influxdata)
    - [Chronograf](influxdata/chronograf)
    - [InfluxDB](influxdata/influxdb)
    - [Kapacitor](influxdata/kapacitor)
    - [Telegraf](influxdata/telegraf)
- [Jenkins](jenkins)
- [LibreSpeed](librespeed)
- [Mattermost](mattermost)
- [Message queues](message-queues)
    - [ActiveMQ](message-queues/activemq), cluster
    - [RabbitMQ](message-queues/rabbitmq)
- [Netdata](netdata)
- [Network monitoring](network-monitoring)
    - [FastNetMon](network-monitoring/fastnetmon)
    - [NAV](network-monitoring/nav)
    - [Zabbix](network-monitoring/zabbix)
        - [Backend](network-monitoring/zabbix/backend)
        - [Frontend](network-monitoring/zabbix/frontend)
- [Portainer](portainer)
- [Prometheus](prometheus)
    - [Alertmanager](prometheus/alertmanager)
    - [Prometheus](prometheus/prometheus)
    - [Pushgateway](prometheus/pushgateway)
- [Redis](redis)
- [Swagger](swagger)
    - [Editor](swagger/editor)
    - [UI](swagger/ui)
- [Workload automation](workload-automation)
    - [Dkron](workload-automation/dkron), cluster
        - [agents](workload-automation/dkron/agent)
        - [servers](workload-automation/dkron/server)
    - [Rundeck](workload-automation/rundeck)

## Documentation

- [Architecture](doc/architecture.graphml)
- [TCP port inventory](doc/tcp-port-inventory.csv)
- [UDP port inventory](doc/udp-port-inventory.csv)

---

Copyright (c) 2020 Alexander Fefelov, MIT license (see [LICENSE](LICENSE))
