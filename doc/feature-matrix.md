# Feature matrix

| Component | Technology | Storage available | Storage implemented | Metrics available | Metrics implemented | Other required or available | Other implemented
| --------- | ---------- | ----------------- | ------------------- | ----------------- | ------------------- | ------------------------ | -------------------
| [ActiveMQ](../message-queues/activemq) | Java | [JDBC](https://activemq.apache.org/jdbc-support) | MySQL | ? | ? | ? | ?
| [Alertmanager](../prometheus/alertmanager) | Go | ? | ? | ? | ? | ? | ?
| [ClickHouse](../databases/clickhouse) | ? | N/A | N/A | [Graphite, Prometheus](https://clickhouse.tech/docs/en/operations/monitoring/) | ? | ? | ?
| [CoreDNS](../dns/coredns) | Go | N/A | N/A | Prometheus | Prometheus | N/A | N/A
| [Cubes](../business-intelligence/cubes/backend) | ? | ? | ? | ? | ? | ? | ?
| [CubesViewer](../business-intelligence/cubes/frontend) | Django | [MySQL, Oracle, PostgreSQL, SQLite](https://github.com/jjmontesl/cubesviewer/blob/master/doc/guide/cubesviewer-server-installation.md) | MySQL | ? | ? | ? | ?
| [Dkron agent](../workload-automation/dkron/agent) | Go | ? | ? | StatsD | StatsD | ? | ?
| [Dkron server](../workload-automation/dkron/server) | Go | ? | ? | Prometheus, StatsD | Prometheus, StatsD | ? | ?
| [dnsmasq](../dns/dnsmasq) | ? | ? | ? | ? | ? | ? | ?
| [Elastic APM](../elastic/apm) | Go | ? | ? | ? | ? | ? | ?
| [Elastic Elasticsearch](../elastic/elasticsearch) | Java | ? | ? | ? | InfluxDB | ? | ?
| [Elastic Kibana](../elastic/kibana) | Node.js | ? | ? | ? | InfluxDB | ? | ?
| [Elastic Logstash](../elastic/logstash) | Java | ? | ? | ? | InfluxDB | ? | ?
| [FastNetMon](../network-monitoring/fastnetmon) | ? | ? | ? | Graphite | InfluxDB | ? | ?
| [Fleet](../fleet) | Go | MySQL | MySQL | ? | ? | Redis | ?
| [Gitea](../gitea) | ? | [MySQL, PostgreSQL, SQL Server, SQLite](https://docs.gitea.io/en-us/database-prep/) | MySQL | ? | ? | ? | ?
| [Grafana](../grafana) | ? | [MySQL, PostgreSQL, SQLite](https://grafana.com/docs/grafana/latest/installation/requirements/) | MySQL | ? | ? | ? | ?
| [Graphite/StatsD: Graphite-Web](../graphite-statsd) | Django | [Django](https://graphite.readthedocs.io/en/stable/config-database-setup.html) | MySQL | ? | ? | ? | ?
| [Guacamole backend](../guacamole/backend) | ? | ? | ? | ? | ? | ? | ?
| [Guacamole frontend](../guacamole/frontend) | ? | [MariaDB, MySQL, PostgreSQL, SQL Server](https://guacamole.apache.org/doc/gug/jdbc-auth.html) | MySQL | ? | ? | ? | ?
| [InfluxData Chronograf](../influxdata/v1/chronograf) | ? | ? | ? | ? | ? | ? | ?
| [InfluxData InfluxDB](../influxdata/v1/influxdb) | ? | ? | ? | ? | InfluxDB | ? | ?
| [InfluxData InfluxDB 2](../influxdata/influxdb-2) | ? | ? | ? | ? | ? | ? | ?
| [InfluxData Kapacitor](../influxdata/v1/kapacitor)| ? | ? | ? | ? | InfluxDB | ? | ?
| [InfluxData Telegraf](../influxdata/telegraf) | ? | ? | ? | ? | ? | ? | ?
| [Jenkins](../jenkins) | ? | ? | ? | ? | InfluxDB | ? | ?
| [KkmServer](../kkmserver) | .NET | N/A | N/A | N/A | N/A | N/A | N/A
| [LibreSpeed](../librespeed) | ? | [Bolt, MySQL, PostgreSQL](https://github.com/librespeed/speedtest-go) | MySQL | ? | ? | ? | ?
| [Mattermost](../mattermost) | Go | [MySQL, PostgreSQL](https://docs.mattermost.com/install/requirements.html) | MySQL | N/A | N/A | ? | ?
| [Metabase](../business-intelligence/metabase) | Clojure | [H2, MariaDB, MySQL, PostgreSQL](https://www.metabase.com/docs/latest/operations-guide/configuring-application-database.html) | MySQL | ? | ? | ? | ?
| [Minecraft](../minecraft) | Java | N/A | N/A | JMX | Jolokia | N/A | N/A
| [MongoDB main](../databases/mongodb/main) | ? | ? | ? | ? | ? | ? | ?
| [MongoDB test](../databases/mongodb/test) | ? | ? | ? | ? | ? | ? | ?
| [MySQL main](../databases/mysql/main) | ? | N/A | N/A | ? | InfluxDB | ? | ?
| [MySQL test](../databases/mysql/test) | ? | N/A | N/A | ? | InfluxDB | ? | ?
| [NAV](../network-monitoring/nav) | Django | PostgreSQL | PostgreSQL | ? | ? | ? | ?
| [NetBox](../netbox) | Django | PostgreSQL | PostgreSQL | Prometheus | Prometheus | Redis | Redis
| [Netdata](../netdata) | ? | ? | ? | ? | ? | ? | ?
| [nfdump](../network-monitoring/nfdump) | ? | ? | ? | ? | ? | ? | ?
| [Portainer](../portainer) | ? | ? | ? | N/A | N/A | N/A | N/A
| [PostgreSQL main](../databases/postgresql/main) | ? | N/A | N/A | ? | InfluxDB | ? | ?
| [PostgreSQL test](../databases/postgresql/test) | ? | N/A | N/A | ? | InfluxDB | ? | ?
| [ProFTPD](../file-sharing/proftpd) | ? | ? | ? | ? | ? | ? | ?
| [Prometheus](../prometheus/prometheus) | Go | ? | ? | ? | InfluxDB | ? | ?
| [Pushgateway](../prometheus/pushgateway) | Go | ? | ? | ? | ? | ? | ?
| [QuestDB](../databases/questdb) | Java | ? | ? | ? | ? | ? | ?
| [RabbitMQ](../message-queues/rabbitmq) | ? | ? | ? | ? | ? | ? | ?
| [Redis](../redis) | ? | ? | ? | ? | InfluxDB | ? | ?
| [Riemann](../riemann) | Clojure | ? | ? | ? | ? | ? | ?
| [Rundeck](../workload-automation/rundeck) | Java | [JDBC](https://docs.rundeck.com/docs/administration/configuration/database/) | MySQL | JMX | ? | ? | ?
| [Samba](../file-sharing/samba) | ? | ? | ? | ? | ? | ? | ?
| [SnmpCollector](../network-monitoring/snmpcollector) | Go | MySQL, SQLite | ? | ? | ? | ? | ?
| [Swagger Editor](../swagger/editor) | ? | ? | ? | ? | ? | ? | ?
| [Swagger UI](../swagger/ui) | ? | ? | ? | ? | ? | ? | ?
| [The Dude](../network-monitoring/the-dude) | Wine | SQLite | SQLite | ? | ? | ? | ?
| [Typesense](../typesense) | ? | ? | ? | ? | ? | ? | ?
| [Zabbix backend](../network-monitoring/zabbix/backend) | ? | [MySQL, Oracle, PostgreSQL, TimescaleDB](https://www.zabbix.com/documentation/current/manual/installation/requirements) | MySQL | ? | ? | ? | ?
| [Zabbix frontend](../network-monitoring/zabbix/frontend) | ? | [MySQL, Oracle, PostgreSQL, TimescaleDB](https://www.zabbix.com/documentation/current/manual/installation/requirements) | MySQL | ? | ? | ? | ?
| [XWiki](../xwiki) | Java | [Hibernate](https://www.xwiki.org/xwiki/bin/view/Documentation/UserGuide/Features/DatabaseSupport) | MySQL | ? | ? | ? | ?
| [YouTrack](../youtrack) | Java | Xodus | Xodus | ? | ? | ? | ?