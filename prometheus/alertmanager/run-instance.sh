#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

readonly INSTANCE_NO=${1?Instance number is not specified}
readonly CONTAINER_NAME=NODE_${INSTANCE_NO}_CONTAINER_NAME
readonly HOST_NAME=NODE_${INSTANCE_NO}_HOST_NAME
readonly ALERTMANAGER_PORT=NODE_${INSTANCE_NO}_ALERTMANAGER_PORT
readonly CLUSTER_PORT=NODE_${INSTANCE_NO}_CLUSTER_PORT
readonly PEERS=NODE_${INSTANCE_NO}_PEERS

. settings.sh
. ../../lib/lib.sh
. lib.sh

run_instance \
  ${!CONTAINER_NAME} \
  ${!HOST_NAME} \
  ${!ALERTMANAGER_PORT} \
  ${!CLUSTER_PORT} \
  ${!PEERS}
wait_for_all_container_ports ${!CONTAINER_NAME} $WAIT_TIMEOUT
print_container_info ${!CONTAINER_NAME}
