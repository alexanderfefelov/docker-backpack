#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

generate_config() {
  cat > container/etc/dnsmasq.conf.generated << EOF
# GENERATED. DO NOT EDIT!

server=8.8.8.8

address=/host.backpack.test/$1

address=/dnsmasq.backpack.test/$1

address=/netdata.backpack.test/$1
address=/portainer.backpack.test/$1

# Elastic stack
#
address=/elasticsearch.backpack.test/$1
address=/kibana.backpack.test/$1
address=/logstash.backpack.test/$1

# InfluxData stack
#
address=/chronograf.backpack.test/$1
address=/influxdb.backpack.test/$1
address=/kapacitor.backpack.test/$1
address=/telegraf.backpack.test/$1

# MySQL
#
address=/backup.mysql.backpack.test/$1
address=/master.mysql.backpack.test/$1
address=/slave.mysql.backpack.test/$1

EOF
}

readonly IP_ADDRESS=$(ip route get 1.0.0.0 | awk '{ print $7 }')
if [ -z $IP_ADDRESS ]; then
  echo Failed to detect IP address >&2
  exit 1
fi

generate_config $IP_ADDRESS
docker build --tag $IMAGE_NAME .
