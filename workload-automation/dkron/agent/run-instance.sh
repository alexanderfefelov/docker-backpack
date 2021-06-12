#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

readonly INSTANCE_NO=${1?Instance number is not specified}
readonly CONTAINER_NAME=AGENT_${INSTANCE_NO}_CONTAINER_NAME
readonly HOST_NAME=AGENT_${INSTANCE_NO}_HOST_NAME
readonly NODE_NAME=AGENT_${INSTANCE_NO}_NODE_NAME
readonly SERF_PORT=AGENT_${INSTANCE_NO}_SERF_PORT
readonly GRPC_PORT=AGENT_${INSTANCE_NO}_GRPC_PORT

. settings.sh
. ../../../lib/lib.sh
. lib.sh

run_instance \
  ${!CONTAINER_NAME} \
  ${!HOST_NAME} \
  ${!NODE_NAME} \
  ${!SERF_PORT} \
  ${!GRPC_PORT}
wait_for_all_container_ports ${!CONTAINER_NAME} $WAIT_TIMEOUT
print_container_info ${!CONTAINER_NAME}
