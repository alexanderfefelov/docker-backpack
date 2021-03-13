#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. lib.sh

$DOCKER_EXEC \
  ipdevpolld -J topo --netbox $1 --log-stderr
