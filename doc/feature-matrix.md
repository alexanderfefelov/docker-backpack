# Feature matrix

| Component | Technology | Storage available | Storage implemented | Metrics available | Metrics implemented | Other required or available | Other implemented
| --------- | ---------- | ----------------- | ------------------- | ----------------- | ------------------- | ------------------------ | -------------------
| [ActiveMQ](../message-queues/activemq) | Java | [JDBC](https://activemq.apache.org/jdbc-support) | MySQL | JMX, Web Console  | Jolokia | N/A | N/A
| [Alertmanager](../prometheus/alertmanager) | Go | ? | ? | Prometheus | Prometheus | ? | ?
| [atftpd](../file-sharing/atftpd) | C | ? | ? | ? | ? | ? | ?
| [BGBilling](../commerce/bgbilling) | Java | MySQL | MySQL | JMX | Jolokia | ActiveMQ | ActiveMQ
| [chrony](../chrony) | C | N/A | N/A | CLI | ? | N/A | N/A
| [ClickHouse](../databases/clickhouse) | C++ | N/A | N/A | [Graphite, Prometheus](https://clickhouse.tech/docs/en/operations/monitoring/) | ? | ? | ?
| [CoreDHCP](../networks/dhcp/coredhcp) | Go | N/A | N/A | N/A | N/A | N/A | N/A
| [CoreDNS](../networks/dns/coredns) | Go | N/A | N/A | Prometheus | Prometheus | N/A | N/A
| [Cubes](../business-intelligence/cubes/backend) | Python | ? | ? | ? | ? | ? | ?
| [CubesViewer](../business-intelligence/cubes/frontend) | Django | [MySQL, Oracle, PostgreSQL, SQLite](https://github.com/jjmontesl/cubesviewer/blob/master/doc/guide/cubesviewer-server-installation.md) | MySQL | ? | ? | ? | ?
| [Dkron agent](../workload-automation/dkron/agent) | Go | ? | ? | StatsD | StatsD | ? | ?
| [Dkron server](../workload-automation/dkron/server) | Go | ? | ? | Prometheus, StatsD | Prometheus, StatsD | ? | ?
| [dnsmasq](../networks/dns/dnsmasq) | C | ? | ? | ? | ? | ? | ?
| [draw.io](../diagramming/drawio) | Tomcat | N/A | N/A | ? | ? | N/A | N/A
| [Elastic APM](../elastic/apm) | Go | ? | ? | ? | ? | ? | ?
| [Elastic Elasticsearch](../elastic/elasticsearch) | Java | ? | ? | ? | InfluxDB | ? | ?
| [Elastic Kibana](../elastic/kibana) | Node.js | ? | ? | ? | InfluxDB | ? | ?
| [Elastic Logstash](../elastic/logstash) | Java | ? | ? | ? | InfluxDB | ? | ?
| [FastNetMon](../networks/monitoring/fastnetmon) | C++ | ? | ? | Graphite, InfluxDB | InfluxDB (thru Graphite wire protocol) | ? | ?
| [Fleet](../fleet) | Go | MySQL | MySQL | ? | ? | Redis | ?
| [FreeRADIUS](../networks/freeradius) | C | ? | ? | ? | ? | ? | ?
| [FRR](../networks/routing/frr) | C | ? | ? | ? | ? | ? | ?
| [Gitea](../gitea) | Go | [MySQL, PostgreSQL, SQL Server, SQLite](https://docs.gitea.io/en-us/database-prep/) | MySQL | ? | ? | ? | ?
| [Grafana](../grafana) | Go | [MySQL, PostgreSQL, SQLite](https://grafana.com/docs/grafana/latest/installation/requirements/) | MySQL | ? | ? | ? | ?
| [Graphite/StatsD: Graphite-Web](../graphite-statsd) | Django | [Django](https://graphite.readthedocs.io/en/stable/config-database-setup.html) | MySQL | ? | ? | ? | ?
| [Guacamole backend](../guacamole/backend) | C | ? | ? | ? | ? | ? | ?
| [Guacamole frontend](../guacamole/frontend) | ? | [MariaDB, MySQL, PostgreSQL, SQL Server](https://guacamole.apache.org/doc/gug/jdbc-auth.html) | MySQL | ? | ? | ? | ?
| [H2](../databases/h2) | Java | N/A | N/A | JMX | Jolokia | N/A | N/A
| [InfluxData Chronograf](../influxdata/v1/chronograf) | Go | ? | ? | ? | ? | ? | ?
| [InfluxData InfluxDB](../influxdata/v1/influxdb) | Go | ? | ? | ? | InfluxDB | ? | ?
| [InfluxData InfluxDB 2](../influxdata/influxdb-2) | Go | ? | ? | ? | ? | ? | ?
| [InfluxData Kapacitor](../influxdata/v1/kapacitor)| Go | ? | ? | ? | InfluxDB | ? | ?
| [InfluxData Telegraf](../influxdata/telegraf) | Go | Go | ? | ? | ? | ? | ?
| [James](../james) | Java | [DB2, Derby, H2, HSQLDB, Informix, MySQL, Oracle, PostgreSQL, SQL Server, Sybase](https://james.apache.org/server/3/config-system.html) | ? | JMX, Glowroot | ? | ? | ?
| [JasperReports Server](../business-intelligence/jasperreports) | Java | MySQL, PostgreSQL | MySQL | JMX | Jolokia | ? | ?
| [Jenkins](../jenkins) | Java | ? | ? | ? | InfluxDB | ? | ?
| [Kaui](../commerce/killbill/kaui) | ? | ? | ? | ? | ? | ? | ?
| [Kill Bill](../commerce/killbill/killbill) | Java | ? | MySQL | ? | ? | ? | ?
| [KkmServer](../commerce/kkmserver) | .NET | N/A | N/A | N/A | N/A | N/A | N/A
| [LibreSpeed](../networks/monitoring/librespeed) | ? | [Bolt, MySQL, PostgreSQL](https://github.com/librespeed/speedtest-go) | MySQL | ? | ? | ? | ?
| [MariaDB main](../databases/mariadb/main) | ? | N/A | N/A | MySQL | InfluxDB | ? | ?
| [Mattermost](../messengers/mattermost) | Go | [MySQL, PostgreSQL](https://docs.mattermost.com/install/requirements.html) | MySQL | N/A | N/A | ? | ?
| [memcached](../memcached) | C | N/A | N/A | ? | ? | ? | ?
| [Metabase](../business-intelligence/metabase) | Clojure | [H2, MariaDB, MySQL, PostgreSQL](https://www.metabase.com/docs/latest/operations-guide/configuring-application-database.html) | MySQL | JMX | Jolokia | ? | ?
| [Minecraft](../minecraft) | Java | N/A | N/A | JMX | Jolokia | N/A | N/A
| [MongoDB main](../databases/mongodb/main) | ? | ? | ? | ? | ? | ? | ?
| [MongoDB test](../databases/mongodb/test) | ? | ? | ? | ? | ? | ? | ?
| [MySQL main](../databases/mysql/main) | ? | N/A | N/A | MySQL | InfluxDB | ? | ?
| [MySQL test](../databases/mysql/test) | ? | N/A | N/A | MySQL | InfluxDB | ? | ?
| [NAV agent](../networks/monitoring/nav/agent) | Python | PostgreSQL | PostgreSQL | ? | ? | ? | ?
| [NAV manager](../networks/monitoring/nav/manager) | Django | PostgreSQL | PostgreSQL | ? | ? | ? | ?
| [NetBox](../networks/netbox) | Django | PostgreSQL | PostgreSQL | Prometheus | Prometheus | Redis | Redis
| [Netdata](../netdata) | ? | ? | ? | ? | ? | ? | ?
| [nfdump](../networks/monitoring/nfdump) | ? | ? | ? | ? | ? | ? | ?
| [PlantUML](../diagramming/plantuml) | Jetty | N/A | N/A | ? | ? | N/A | N/A
| [Portainer](../portainer) | ? | ? | ? | N/A | N/A | N/A | N/A
| [PostgreSQL main](../databases/postgresql/main) | ? | N/A | N/A | PostgreSQL | InfluxDB | ? | ?
| [PostgreSQL test](../databases/postgresql/test) | ? | N/A | N/A | PostgreSQL | InfluxDB | ? | ?
| [ProFTPD](../file-sharing/proftpd) | ? | ? | ? | ? | ? | ? | ?
| [Prometheus](../prometheus/prometheus) | Go | ? | ? | ? | InfluxDB | ? | ?
| [Pushgateway](../prometheus/pushgateway) | Go | ? | ? | Prometheus | Prometheus | ? | ?
| [QuestDB](../databases/questdb) | Java | ? | ? | ? | ? | ? | ?
| [RabbitMQ](../message-queues/rabbitmq) | Erlang | ? | ? | ? | ? | ? | ?
| [Redis](../redis) | ? | ? | ? | Redis | InfluxDB | ? | ?
| [Redmine](../bug-tracking/redmine) | Ruby on Rails | [MySQL, PostgreSQL, SQL Server, SQLite](https://www.redmine.org/projects/redmine/wiki/RedmineInstall) | MySQL | N/A | N/A | N/A | N/A
| [Riemann](../riemann) | Clojure | ? | ? | ? | ? | ? | ?
| [Rundeck](../workload-automation/rundeck) | Java | [JDBC](https://docs.rundeck.com/docs/administration/configuration/database/) | MySQL | JMX | ? | ? | ?
| [Samba](../file-sharing/samba) | ? | ? | ? | ? | ? | ? | ?
| [SnmpCollector](../networks/monitoring/snmpcollector) | Go | MySQL, SQLite | ? | ? | ? | ? | ?
| [SQL Server main](../databases/sql-server/main) | ? | ? | ? | ? | ? | ? | ?
| [Swagger Editor](../swagger/editor) | ? | ? | ? | ? | ? | ? | ?
| [Swagger UI](../swagger/ui) | ? | ? | ? | ? | ? | ? | ?
| [The Dude](../networks/monitoring/the-dude) | Wine | SQLite | SQLite | ? | ? | ? | ?
| [Typesense](../typesense) | C++ | ? | ? | ? | ? | ? | ?
| [Zabbix backend](../networks/monitoring/zabbix/backend) | ? | [MySQL, Oracle, PostgreSQL, TimescaleDB](https://www.zabbix.com/documentation/current/manual/installation/requirements) | MySQL | ? | ? | ? | ?
| [Zabbix frontend](../networks/monitoring/zabbix/frontend) | ? | [MySQL, Oracle, PostgreSQL, TimescaleDB](https://www.zabbix.com/documentation/current/manual/installation/requirements) | MySQL | ? | ? | ? | ?
| [XWiki](../wiki/xwiki) | Java | [Hibernate](https://www.xwiki.org/xwiki/bin/view/Documentation/UserGuide/Features/DatabaseSupport) | MySQL | ? | ? | ? | ?
| [YouTrack](../bug-tracking/youtrack) | Java | Xodus | Xodus | ? | ? | ? | ?
