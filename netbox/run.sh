#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../lib/lib.sh

readonly PSQL="PGPASSWORD=$DB_ROOT_PASSWORD psql --host=$DB_HOST --port=$DB_PORT --username=$DB_ROOT_USERNAME"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  eval $PSQL --dbname=$DB_SYSTEM_DATABASE --command=\"$(envsubst < init/initialize-database-1.sql)\"
  eval $PSQL --dbname=$DB_SYSTEM_DATABASE --command=\"$(envsubst < init/initialize-database-2.sql)\"
  echo ...database initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/netbox \
    --publish 8087:8001 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}

eval $PSQL --dbname=$DB_DATABASE --command=''
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  initialize_database
fi

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
print_container_info $CONTAINER_NAME
