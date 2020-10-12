#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

generate_config() {
  cat > container/etc/dnsmasq.d/address.conf.generated << EOF
# GENERATED. DO NOT EDIT!

address=/host.backpack.test/$1

address=/dnsmasq.backpack.test/$1
address=/netdata.backpack.test/$1
address=/portainer.backpack.test/$1

address=/grafana.backpack.test/$1
address=/graphite-statsd.backpack.test/$1
address=/jenkins.backpack.test/$1
address=/mattermost.backpack.test/$1
address=/ofelia.backpack.test/$1
address=/redis.backpack.test/$1
address=/rundeck.backpack.test/$1

# Business intelligence
#
address=/cubes-backend.backpack.test/$1
address=/cubes-frontend.backpack.test/$1
address=/metabase.backpack.test/$1

# Databases
#
address=/mongodb-main.backpack.test/$1
address=/mongodb-test.backpack.test/$1
address=/mysql-main-backup.backpack.test/$1
address=/mysql-main-master.backpack.test/$1
address=/mysql-main-slave.backpack.test/$1
address=/mysql-test.backpack.test/$1
address=/postgresql-main.backpack.test/$1
address=/postgresql-test.backpack.test/$1

# Dkron
#
address=/dkron-server.backpack.test/$1
address=/dkron-agent-1.backpack.test/$1

# Elastic stack
#
address=/apm.backpack.test/$1
address=/elasticsearch.backpack.test/$1
address=/kibana.backpack.test/$1
address=/logstash.backpack.test/$1

# File sharing
#
address=/proftpd.backpack.test/$1
address=/samba.backpack.test/$1

# Guacamole
#
address=/guacamole-backend.backpack.test/$1
address=/guacamole-frontend.backpack.test/$1

# InfluxData stack
#
address=/chronograf.backpack.test/$1
address=/influxdb.backpack.test/$1
address=/kapacitor.backpack.test/$1
address=/telegraf.backpack.test/$1

# Message queues
#
address=/activemq.backpack.test/$1
address=/rabbitmq.backpack.test/$1

# Network monitoring
#
address=/fastnetmon.backpack.test/$1
address=/nav.backpack.test/$1
address=/zabbix-backend.backpack.test/$1
address=/zabbix-frontend.backpack.test/$1

# Prometheus
#
address=/alertmanager.backpack.test/$1
address=/prometheus.backpack.test/$1
address=/pushgateway.backpack.test/$1

EOF
}

readonly IP_ADDRESS=$(ip route get 1.0.0.0 | awk '{ print $7 }')
if [ -z $IP_ADDRESS ]; then
  echo Failed to detect IP address >&2
  exit 1
fi

generate_config $IP_ADDRESS
docker build --tag $IMAGE_NAME .
