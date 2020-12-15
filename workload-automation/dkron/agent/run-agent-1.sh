#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. functions.sh

run_agent \
  $AGENT_1_CONTAINER_NAME \
  $AGENT_1_HOST_NAME \
  $AGENT_1_NODE_NAME \
  $AGENT_1_SERF_PORT \
  $AGENT_1_GRPC_PORT
wait_for_all_container_ports $AGENT_1_CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $AGENT_1_CONTAINER_NAME
