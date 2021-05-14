#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

readonly INSTANCE_NO=${1?Instance number is not specified}
readonly CONTAINER_NAME=SERVER_${INSTANCE_NO}_CONTAINER_NAME
readonly HOST_NAME=SERVER_${INSTANCE_NO}_HOST_NAME
readonly NODE_NAME=SERVER_${INSTANCE_NO}_NODE_NAME
readonly HTTP_PORT=SERVER_${INSTANCE_NO}_HTTP_PORT
readonly SERF_PORT=SERVER_${INSTANCE_NO}_SERF_PORT
readonly GRPC_PORT=SERVER_${INSTANCE_NO}_GRPC_PORT
readonly BOOTSTRAP=SERVER_${INSTANCE_NO}_BOOTSTRAP

. settings.sh
. ../../../lib/lib.sh
. functions.sh

run_instance \
  ${!CONTAINER_NAME} \
  ${!HOST_NAME} \
  ${!NODE_NAME} \
  ${!HTTP_PORT} \
  ${!SERF_PORT} \
  ${!GRPC_PORT} \
  "${!BOOTSTRAP}"
wait_for_all_container_ports ${!CONTAINER_NAME} $WAIT_TIMEOUT
if [ $INSTANCE_NO -eq 1 ]; then
  initialize_dkron
fi
print_container_info ${!CONTAINER_NAME}
