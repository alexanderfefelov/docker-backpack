#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh
. functions.sh

run_node \
  $NODE_2_CONTAINER_NAME \
  $NODE_2_HOST_NAME \
  $NODE_2_BROKER_NAME \
  $NODE_2_MQTT_PORT \
  $NODE_2_AMQP_PORT \
  $NODE_2_HTTP_PORT \
  $NODE_2_STOMP_PORT \
  $NODE_2_WEBSOCKET_PORT \
  $NODE_2_OPENWIRE_PORT
print_container_info $NODE_2_CONTAINER_NAME
