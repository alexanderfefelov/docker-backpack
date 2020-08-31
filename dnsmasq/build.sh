#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

generate_config() {
  cat > container/etc/dnsmasq.conf.generated << EOF
# GENERATED. DO NOT EDIT!

no-hosts
no-resolv

server=8.8.8.8

address=/host.backpack.test/$1

address=/dnsmasq.backpack.test/$1
address=/netdata.backpack.test/$1
address=/portainer.backpack.test/$1

address=/grafana.backpack.test/$1
address=/jenkins.backpack.test/$1
address=/ofelia.backpack.test/$1
address=/prometheus.backpack.test/$1
address=/redis.backpack.test/$1

# Business intelligence
#
address=/cubes.backpack.test/$1
address=/cubesviewer-server.backpack.test/$1
address=/metabase.backpack.test/$1

# Databases
#
address=/backup.mysql.backpack.test/$1
address=/master.mysql.backpack.test/$1
address=/slave.mysql.backpack.test/$1
address=/test.mysql.backpack.test/$1
address=/main.postgresql.backpack.test/$1
address=/test.postgresql.backpack.test/$1

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

# Graphite
#
address=/graphite.backpack.test/$1
address=/statsd.backpack.test/$1

# InfluxData stack
#
address=/chronograf.backpack.test/$1
address=/influxdb.backpack.test/$1
address=/kapacitor.backpack.test/$1
address=/telegraf.backpack.test/$1

# Messaging
#
address=/activemq.backpack.test/$1
address=/rabbitmq.backpack.test/$1

conf-dir=/etc/dnsmasq.d

EOF
}

readonly IP_ADDRESS=$(ip route get 1.0.0.0 | awk '{ print $7 }')
if [ -z $IP_ADDRESS ]; then
  echo Failed to detect IP address >&2
  exit 1
fi

generate_config $IP_ADDRESS
docker build --tag $IMAGE_NAME .
