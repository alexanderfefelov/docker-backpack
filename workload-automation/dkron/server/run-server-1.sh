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
  $SERVER_1_CONTAINER_NAME \
  $SERVER_1_HOST_NAME \
  $SERVER_1_HTTP_PORT \
  $SERVER_1_SERF_PORT \
  $SERVER_1_GRPC_PORT \
  $SERVER_1_PEER \
  $(petname) \
  "--bootstrap-expect 1"
wait_for_all_container_ports $SERVER_1_CONTAINER_NAME $WAIT_TIMEOUT
initialize_dkron
print_container_info $SERVER_1_CONTAINER_NAME
