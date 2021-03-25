# docker-backpack

Before you start, run [check-prerequisites.sh](check-prerequisites.sh) to make sure all the tools required are available.

![Backpack](doc/assets/backpack_2551.png)

## What's inside

- [Bug tracking](bug-tracking)
    - [Redmine](bug-tracking/redmine)
    - [YouTrack](bug-tracking/youtrack)
- [Business intelligence](business-intelligence)
    - [Cubes](business-intelligence/cubes)
      - [Backend](business-intelligence/cubes/backend)
      - [Frontend](business-intelligence/cubes/frontend)
    - [JasperReports](business-intelligence/jasperreports)
    - [Metabase](business-intelligence/metabase)
- [Commerce](commerce)
    - [BGBilling](commerce/bgbilling)
    - [Kill Bill](commerce/killbill)
        - [Kaui](commerce/killbill/kaui)
        - [Kill Bill](commerce/killbill/killbill)
    - [KkmServer](commerce/kkmserver)
- [Databases](databases)
    - [ClickHouse](databases/clickhouse)
    - [H2](databases/h2)
    - [MongoDB](databases/mongodb)
        - [Main instance](databases/mongodb/main)
        - [Test instance](databases/mongodb/test)
    - [MySQL](databases/mysql)
        - [Main instance](databases/mysql/main), with replication
        - [Test instance](databases/mysql/test)
    - [PostgreSQL](databases/postgresql)
        - [Main instance](databases/postgresql/main)
        - [Test instance](databases/postgresql/test)
    - [QuestDB](databases/questdb)
- [DHCP](dhcp)
    - [CoreDHCP](dhcp/coredhcp)
- [DNS](dns)
    - [CoreDNS](dns/coredns)
    - [dnsmasq](dns/dnsmasq)
- [Elastic stack](elastic)
    - [APM](elastic/apm)
    - [Elasticsearch](elastic/elasticsearch)
    - [Kibana](elastic/kibana)
    - [Logstash](elastic/logstash)
- [File sharing](file-sharing)
    - [atftpd](file-sharing/atftpd)
    - [ProFTPD](file-sharing/proftpd)
    - [Samba](file-sharing/samba)
- [Fleet](fleet)
- [Gitea](gitea)
- [Grafana](grafana)
- [Graphite/StatsD](graphite-statsd)
- [Guacamole](guacamole)
    - [Backend](guacamole/backend)
    - [Frontend](guacamole/frontend)
- [InfluxData stack](influxdata)
    - [Chronograf](influxdata/v1/chronograf)
    - [InfluxDB](influxdata/v1/influxdb)
    - [InfluxDB 2](influxdata/influxdb-2)
    - [Kapacitor](influxdata/v1/kapacitor)
    - [Telegraf](influxdata/telegraf)
- [Jenkins](jenkins)
- [LibreSpeed](librespeed)
- [Message queues](message-queues)
    - [ActiveMQ](message-queues/activemq), cluster
    - [RabbitMQ](message-queues/rabbitmq)
- [Messengers](messengers)
    - [Mattermost](messengers/mattermost)
- [Minecraft](minecraft)
- [NetBox](netbox)
- [Netdata](netdata)
- [Network monitoring](network-monitoring)
    - [FastNetMon](network-monitoring/fastnetmon)
    - [NAV](network-monitoring/nav)
        - [Agent](network-monitoring/nav/agent)
        - [Manager](network-monitoring/nav/manager)
    - [nfdump](network-monitoring/nfdump)
    - [SnmpCollector](network-monitoring/snmpcollector)
    - [The Dude](network-monitoring/the-dude)
    - [Zabbix](network-monitoring/zabbix)
        - [Backend](network-monitoring/zabbix/backend)
        - [Frontend](network-monitoring/zabbix/frontend)
- [Portainer](portainer)
- [Prometheus](prometheus)
    - [Alertmanager](prometheus/alertmanager)
    - [Prometheus](prometheus/prometheus)
    - [Pushgateway](prometheus/pushgateway)
- [Redis](redis)
- [Riemann](riemann)
- [Swagger](swagger)
    - [Editor](swagger/editor)
    - [UI](swagger/ui)
- [Typesense](typesense)
- [Workload automation](workload-automation)
    - [Dkron](workload-automation/dkron), cluster
        - [Agents](workload-automation/dkron/agent)
        - [Servers](workload-automation/dkron/server)
    - [Rundeck](workload-automation/rundeck)
- [XWiki](wiki/xwiki)

## Documentation

- [Architecture](doc/architecture.graphml)
- [Feature matrix](doc/feature-matrix.md)
- [TCP port inventory](doc/tcp-port-inventory.csv)
- [UDP port inventory](doc/udp-port-inventory.csv)

---

Copyright (c) 2020-2021 Alexander Fefelov, MIT license (see [LICENSE](LICENSE))
