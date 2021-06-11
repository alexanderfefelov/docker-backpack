#!/usr/bin/env bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh

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
  if http --check-status GET http://elasticsearch.backpack.test:9200 --auth-type basic --auth installer_uru6oushi7oh:sohsah0oghat > /dev/null 2>&1; then
    echo Initializing Elasticsearch...
    bash init/configure-accounts.sh $CONTAINER_NAME
    echo ...Elasticsearch initialized
  fi
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/usr/share/elasticsearch/config \
    --volume $CONTAINER_NAME-data:/usr/share/elasticsearch/data \
    --publish 9200:9200 \
    --publish 9300:9300 \
    $([[ $SSE_SUPPORT != *sse4_2* ]] && echo --env xpack.ml.enabled=false && echo Machine Learning disabled >&2) \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}

check_vm_max_map_count
print_sse_info
run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
initialize_elasticsearch
print_container_info $CONTAINER_NAME
