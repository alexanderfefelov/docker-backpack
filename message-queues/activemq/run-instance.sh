#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

readonly INSTANCE_NO=${1?Instance number is not specified}
readonly CONTAINER_NAME=NODE_${INSTANCE_NO}_CONTAINER_NAME
readonly HOST_NAME=NODE_${INSTANCE_NO}_HOST_NAME
readonly BROKER_NAME=NODE_${INSTANCE_NO}_BROKER_NAME
readonly MQTT_PORT=NODE_${INSTANCE_NO}_MQTT_PORT
readonly AMQP_PORT=NODE_${INSTANCE_NO}_AMQP_PORT
readonly HTTP_PORT=NODE_${INSTANCE_NO}_HTTP_PORT
readonly STOMP_PORT=NODE_${INSTANCE_NO}_STOMP_PORT
readonly WEBSOCKET_PORT=NODE_${INSTANCE_NO}_WEBSOCKET_PORT
readonly OPENWIRE_PORT=NODE_${INSTANCE_NO}_OPENWIRE_PORT

. settings.sh
. ../../lib/lib.sh
. functions.sh

readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

$MYSQL --execute="USE $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  initialize_database
fi

run_instance \
  ${!CONTAINER_NAME} \
  ${!HOST_NAME} \
  ${!BROKER_NAME} \
  ${!MQTT_PORT} \
  ${!AMQP_PORT} \
  ${!HTTP_PORT} \
  ${!STOMP_PORT} \
  ${!WEBSOCKET_PORT} \
  ${!OPENWIRE_PORT}
print_container_info ${!CONTAINER_NAME}
