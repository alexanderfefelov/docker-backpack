#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

generate_config_files() {
  echo Genarating config files...

  local -r IP_ADDRESS=$(ip route get 1.0.0.0 | awk '{ print $7 }')
  if [ -z $IP_ADDRESS ]; then
    echo Failed to detect IP address >&2
    exit 1
  fi
  export IP_ADDRESS
  envsubst \
    < build/address.template.conf \
    > container/etc/dnsmasq.d/address.conf.generated

  echo ..config files generated
}

generate_config_files
docker build --tag $IMAGE_NAME .
rm --force container/etc/dnsmasq.d/address.conf.generated
