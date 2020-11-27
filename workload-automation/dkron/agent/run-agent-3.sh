#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. functions.sh

run_agent \
  $AGENT_3_CONTAINER_NAME \
  $AGENT_3_HOST_NAME \
  $AGENT_3_NODE_NAME \
  $AGENT_3_SERF_PORT \
  $AGENT_3_GRPC_PORT
wait_for_all_container_ports $AGENT_3_CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $AGENT_3_CONTAINER_NAME
