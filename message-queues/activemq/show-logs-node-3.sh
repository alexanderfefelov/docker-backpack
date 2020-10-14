#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

docker logs --follow $NODE_3_CONTAINER_NAME