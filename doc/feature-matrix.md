# Feature matrix

| Component | Technology | Storage available | Storage implemented | Metrics available | Metrics implemented | Other required/available | Other implemented
| --------- | ---------- | ----------------- | ------------------- | ----------------- | ------------------- | ------------------------ | -------------------
| [ActiveMQ](../message-queues/activemq) | Java | JDBC | MySQL | ? | ? | ? | ?
| [Alertmanager](../prometheus/alertmanager) | Go | ? | ? | ? | ? | ? | ?
| [ClickHouse](../databases/clickhouse) | ? | ? | ? | ? | ? | ? | ?
| [CoreDNS](../dns/coredns) | Go | N/A | N/A | Prometheus | Prometheus | N/A | N/A
| [Cubes](../business-intelligence/cubes/backend) | ? | ? | ? | ? | ? | ? | ?
| [CubesViewer](../business-intelligence/cubes/frontend) | Django | MySQL, Oracle, PostgreSQL, SQLite | MySQL | ? | ? | ? | ?
| [Dkron agent](../workload-automation/dkron/agent) | Go | ? | ? | StatsD | StatsD | ? | ?
| [Dkron server](../workload-automation/dkron/server) | Go | ? | ? | Prometheus, StatsD | Prometheus, StatsD | ? | ?
| [dnsmasq](../dns/dnsmasq) | ? | ? | ? | ? | ? | ? | ?
| [Elastic APM](../elastic/apm) | Go | ? | ? | ? | ? | ? | ?
| [Elastic Elasticsearch](../elastic/elasticsearch) | Java | ? | ? | ? | InfluxDB | ? | ?
| [Elastic Kibana](../elastic/kibana) | Node.js | ? | ? | ? | InfluxDB | ? | ?
| [Elastic Logstash](../elastic/logstash) | Java | ? | ? | ? | InfluxDB | ? | ?
| [FastNetMon](../network-monitoring/fastnetmon) | ? | ? | ? | Graphite | InfluxDB | ? | ?
| [Fleet](../fleet) | Go | MySQL | MySQL | ? | ? | Redis | ?
| [Gitea](../gitea) | ? | MySQL, PostgreSQL, SQL Server, SQLite | MySQL | ? | ? | ? | ?
| [Grafana](../grafana) | ? | MySQL, PostgreSQL, SQLite | MySQL | ? | ? | ? | ?
| [Graphite/StatsD: Graphite-Web](../graphite-statsd) | Django | MySQL, Oracle, PostgreSQL, SQLite | MySQL | ? | ? | ? | ?
| [Guacamole backend](../guacamole/backend) | ? | ? | ? | ? | ? | ? | ?
| [Guacamole frontend](../guacamole/frontend) | ? | ? | MySQL | ? | ? | ? | ?
| [InfluxData Chronograf](../influxdata/v1/chronograf) | ? | ? | ? | ? | ? | ? | ?
| [InfluxData InfluxDB](../influxdata/v1/influxdb) | ? | ? | ? | ? | InfluxDB | ? | ?
| [InfluxData InfluxDB 2](../influxdata/influxdb-2) | ? | ? | ? | ? | ? | ? | ?
| [InfluxData Kapacitor](../influxdata/v1/kapacitor)| ? | ? | ? | ? | InfluxDB | ? | ?
| [InfluxData Telegraf](../influxdata/telegraf) | ? | ? | ? | ? | ? | ? | ?
| [Jenkins](../jenkins) | ? | ? | ? | ? | InfluxDB | ? | ?
| [KkmServer](../kkmserver) | .NET | ? | ? | ? | ? | ? | ?
| [LibreSpeed](../librespeed) | ? | Bolt, MySQL, PostgreSQL | MySQL | ? | ? | ? | ?
| [Mattermost](../mattermost) | ? | ? | MySQL | ? | ? | ? | ?
| [Metabase](../business-intelligence/metabase) | Clojure | H2, MariaDB, MySQL, PostgreSQL | MySQL | ? | ? | ? | ?
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
| [Rundeck](../workload-automation/rundeck) | ? | ? | MySQL | ? | ? | ? | ?
| [Samba](../file-sharing/samba) | ? | ? | ? | ? | ? | ? | ?
| [SnmpCollector](../network-monitoring/snmpcollector) | Go | MySQL, SQLite | ? | ? | ? | ? | ?
| [Swagger Editor](../swagger/editor) | ? | ? | ? | ? | ? | ? | ?
| [Swagger UI](../swagger/ui) | ? | ? | ? | ? | ? | ? | ?
| [The Dude](../network-monitoring/the-dude) | Wine | SQLite | N/A | ? | ? | ? | ?
| [Typesense](../typesense) | ? | ? | ? | ? | ? | ? | ?
| [Zabbix backend](../network-monitoring/zabbix/backend) | ? | MySQL, Oracle, PostgreSQL, TimescaleDB | MySQL | ? | ? | ? | ?
| [Zabbix frontend](../network-monitoring/zabbix/frontend) | ? | MySQL, Oracle, PostgreSQL, TimescaleDB | MySQL | ? | ? | ? | ?
| [XWiki](../xwiki) | Java | JDBC | MySQL | ? | ? | ? | ?
| [YouTrack](../youtrack) | Java | Xodus | N/A | ? | ? | ? | ?
