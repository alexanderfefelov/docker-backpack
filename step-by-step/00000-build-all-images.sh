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
  build elasticsearch/elasticsearch
  build elasticsearch/kibana
  build netdata
  build portainer

  echo -e "\nOK, all done."
}

time build_all
