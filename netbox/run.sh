#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../lib/lib.sh

export PGPASSWORD=$DB_ROOT_PASSWORD
readonly PSQL="psql --host=$DB_HOST --port=$DB_PORT --username=$DB_ROOT_USERNAME"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $PSQL --dbname=$DB_SYSTEM_DATABASE <<< "$(envsubst < init/initialize-database-1.sql)"
  $PSQL --dbname=$DB_SYSTEM_DATABASE <<< "$(envsubst < init/initialize-database-2.sql)"
  echo ...database initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/netbox \
    --volume $CONTAINER_NAME-data:/opt/netbox/netbox/media \
    --publish 8087:8080 \
    --env SUPERUSER_NAME=admin_aey0doh3deit \
    --env SUPERUSER_EMAIL=admin@backpack.test \
    --env SUPERUSER_PASSWORD=aipahgei4if1 \
    --env SUPERUSER_API_TOKEN=kaeta2ab1foveen4nua0heeh0baiheizaiNgaec9 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}

$PSQL --dbname=$DB_DATABASE --command=''
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
