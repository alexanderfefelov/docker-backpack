#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../../lib/lib.sh
. functions.sh

readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL --execute="$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

$MYSQL --execute="use $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  initialize_database
fi

run_node \
  $NODE_1_CONTAINER_NAME \
  $NODE_1_HOST_NAME \
  $NODE_1_BROKER_NAME \
  $NODE_1_MQTT_PORT \
  $NODE_1_AMQP_PORT \
  $NODE_1_HTTP_PORT \
  $NODE_1_STOMP_PORT \
  $NODE_1_WEBSOCKET_PORT \
  $NODE_1_OPENWIRE_PORT
wait_for_all_container_ports $NODE_1_CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $NODE_1_CONTAINER_NAME
