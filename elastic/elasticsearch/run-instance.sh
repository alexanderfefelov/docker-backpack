#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

readonly INSTANCE_NO=${1?Instance number is not specified}

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=INSTANCE_NO --preserve-env=VERSION bash "$0" "$@"

readonly CONTAINER_NAME=NODE_${INSTANCE_NO}_CONTAINER_NAME
readonly HOST_NAME=NODE_${INSTANCE_NO}_HOST_NAME
readonly NODE_NAME=NODE_${INSTANCE_NO}_NODE_NAME
readonly HTTP_PORT=NODE_${INSTANCE_NO}_HTTP_PORT
readonly TRANSPORT_PORT=NODE_${INSTANCE_NO}_TRANSPORT_PORT

. settings.sh
. ../../lib/lib.sh
. lib.sh

check_vm_max_map_count
print_sse_info
run_instance \
  ${!CONTAINER_NAME} \
  ${!HOST_NAME} \
  ${!NODE_NAME} \
  ${!HTTP_PORT} \
  ${!TRANSPORT_PORT}
wait_for_all_container_ports ${!CONTAINER_NAME} $WAIT_TIMEOUT
initialize_elasticsearch
print_container_info ${!CONTAINER_NAME}
