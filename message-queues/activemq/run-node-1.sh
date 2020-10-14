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
  $NODE_1_CONTAINER_NAME \
  $NODE_1_HOST_NAME \
  $NODE_1_BROKER_NAME \
  $NODE_1_MQTT_PORT \
  $NODE_1_AMQP_PORT \
  $NODE_1_HTTP_PORT \
  $NODE_1_STOMP_PORT \
  $NODE_1_WEBSOCKET_PORT \
  $NODE_1_OPENWIRE_PORT
wait_for_all_container_ports $NODE_1_CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $NODE_1_CONTAINER_NAME
