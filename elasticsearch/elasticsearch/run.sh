#!/usr/bin/env bash

set -e

[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh

check_vm_max_map_count() {
  local -r PARAM=vm.max_map_count
  local -r REQUIRED_MIN=262144
  local -r CURRENT=$(sysctl $PARAM | awk '{ print $3 }')
  if [ $CURRENT -lt $REQUIRED_MIN ]; then
    echo Current value for $PARAM is $CURRENT, minimum required value is $REQUIRED_MIN >&2
    exit 1
  fi
}

print_sse_info() {
  echo Elasticsearch Machine Learning requires CPU with SSE4.2 support
  sse_support=$(cat /proc/cpuinfo | grep flags | grep --only-matching --word-regexp 'sse\S*' | sort | uniq | paste --delimiter=' ' --serial -)
  if [ -z "$sse_support" ]; then
    echo No SSE support detected
  else
    echo Detected CPU with support for $sse_support
  fi
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/usr/share/elasticsearch/data \
    --publish 9200:9200 \
    --publish 9300:9300 \
    --health-cmd $HEALTH_CMD --health-start-period $HEALTH_START_PERIOD --health-interval $HEALTH_INTERVAL --health-timeout $HEALTH_TIMEOUT --health-retries $HEALTH_RETRIES \
    --log-opt max-size=$LOG_MAX_SIZE --log-opt max-file=$LOG_MAX_FILE \
    $IMAGE_NAME
  docker run --rm --link $CONTAINER_NAME:foobar martin/wait -t $WAIT_TIMEOUT
}

check_vm_max_map_count
print_sse_info
run
docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CONTAINER_NAME
