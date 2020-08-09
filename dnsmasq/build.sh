#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

generate_config() {
  cat > container/etc/dnsmasq.conf.generated << EOF

server=8.8.8.8

address=/host.backpack.test/$1

address=/dnsmasq.backpack.test/$1

EOF
}

IP_ADDRESS=$(ip route get 1.0.0.0 | awk '{ print $7 }')
if [ -z $IP_ADDRESS ]; then
  echo Failed to detect IP address >&2
  exit 1
fi

generate_config $IP_ADDRESS
docker build --tag $IMAGE_NAME .
