#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh
. functions.sh

run_node \
  $NODE_3_CONTAINER_NAME \
  $NODE_3_HOST_NAME \
  $NODE_3_BROKER_NAME \
  $NODE_3_MQTT_PORT \
  $NODE_3_AMQP_PORT \
  $NODE_3_HTTP_PORT \
  $NODE_3_STOMP_PORT \
  $NODE_3_WEBSOCKET_PORT \
  $NODE_3_OPENWIRE_PORT
print_container_info $NODE_3_CONTAINER_NAME
