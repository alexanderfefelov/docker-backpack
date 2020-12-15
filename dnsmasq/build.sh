#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh

generate_config_files() {
  echo Generating config files...

  local -r IP_ADDRESS=$(ip route get 1.0.0.0 | awk '{ print $7 }')
  if [ -z $IP_ADDRESS ]; then
    echo Failed to detect IP address >&2
    exit 1
  fi
  export IP_ADDRESS
  envsubst \
    < build/template.address.conf \
    > container/etc/dnsmasq.d/address.conf.generated

  echo ..config files generated
}

generate_config_files
docker build \
  --build-arg VERSION \
  --tag $IMAGE_NAME:$VERSION \
  .
rm --force container/etc/dnsmasq.d/address.conf.generated
