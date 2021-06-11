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
. functions.sh

check_vm_max_map_count() {
  local -r PARAM=vm.max_map_count
  local -r REQUIRED_MIN=262144
  local -r CURRENT=$(sysctl $PARAM | awk '{ print $3 }')
  if [ $CURRENT -lt $REQUIRED_MIN ]; then
    echo Current value for $PARAM is $CURRENT, minimum required value is $REQUIRED_MIN >&2
    exit 1
  fi
}

readonly SSE_SUPPORT=$(cat /proc/cpuinfo | grep flags | grep --only-matching --word-regexp 'sse\S*' | sort | uniq | paste --delimiters=' ' --serial -)

print_sse_info() {
  echo Elasticsearch Machine Learning requires CPU with SSE4.2 support
  if [ -z "$SSE_SUPPORT" ]; then
    echo No SSE support detected
  else
    echo Detected CPU with support for $SSE_SUPPORT
  fi
}

initialize_elasticsearch() {
  if http --check-status GET http://$NODE_1_HOST_NAME:$NODE_1_HTTP_PORT --auth-type basic --auth installer_uru6oushi7oh:sohsah0oghat > /dev/null 2>&1; then
    echo Initializing Elasticsearch...
    bash init/configure-roles.sh
    bash init/configure-accounts.sh $CONTAINER_NAME
    echo ...Elasticsearch initialized
  fi
}

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
