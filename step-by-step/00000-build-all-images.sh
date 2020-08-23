#!/usr/bin/env bash

set -e

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
  build grafana
  build graphite-statsd
  build netdata
  build ofelia
  build portainer
  build proftpd
  build redis
  build samba

  build business-intelligence/cubes
  build business-intelligence/cubesviewer-server
  build business-intelligence/metabase

  build elastic/apm
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
