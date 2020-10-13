#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh
. functions.sh

run_server \
  $SERVER_2_CONTAINER_NAME \
  $SERVER_2_HOST_NAME \
  $SERVER_2_HTTP_PORT \
  $SERVER_2_SERF_PORT \
  $SERVER_2_GRPC_PORT \
  $SERVER_2_PEER
wait_for_all_container_ports $SERVER_2_CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $SERVER_2_CONTAINER_NAME
