#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

build() {
  echo
  echo ----------------------------------------------------------------------
  echo
  echo $1
  echo
  echo ----------------------------------------------------------------------
  echo
  (cd ../$1 && ./build.sh)
}

build_all() {
  build dnsmasq
  build grafana
  build graphite-statsd
  build netdata
  build portainer
  build samba

  build elastic/elasticsearch
  build elastic/kibana
  build elastic/logstash

  build influxdata/chronograf
  build influxdata/influxdb
  build influxdata/kapacitor
  build influxdata/telegraf

  build mysql/main
  build mysql/test

  echo -e "\nOK, all done."
}

time build_all
