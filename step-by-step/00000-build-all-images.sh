#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

readonly BACKPACK_HOME=$(dirname "$(dirname "$(realpath "$0")")")

pushd() {
  command pushd "$@" > /dev/null
}

popd() {
  command popd "$@" > /dev/null
}

build() {
  echo
  echo ----------------------------------------------------------------------
  echo
  echo $1
  echo
  echo ----------------------------------------------------------------------
  echo
  local -r COMPONENT_HOME=$BACKPACK_HOME/$1
  pushd $COMPONENT_HOME
  ./build.sh
  popd
}

build_all() {
  build dnsmasq
  build netdata
  build portainer

  build grafana
  build graphite-statsd
  build jenkins
  build nav
  build ofelia
  build prometheus
  build redis
  build rundeck

  build business-intelligence/cubes
  build business-intelligence/cubesviewer-server
  build business-intelligence/metabase

  build databases/mysql/main
  build databases/mysql/test
  build databases/postgresql/main
  build databases/postgresql/test

  build elastic/apm
  build elastic/elasticsearch
  build elastic/kibana
  build elastic/logstash

  build file-sharing/proftpd
  build file-sharing/samba

  build influxdata/chronograf
  build influxdata/influxdb
  build influxdata/kapacitor
  build influxdata/telegraf

  build message-queues/activemq
  build message-queues/rabbitmq

  build zabbix/backend
  build zabbix/frontend

  echo -e "\nOK, all done."
}

time build_all
