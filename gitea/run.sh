#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo bash "$0" "$@"

. settings.sh
. ../lib/lib.sh

readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

initialize_gitea() {
  echo Initializing Gitea...
  bash init/initialize-gitea.sh $CONTAINER_NAME
  echo ...Gitea initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/data \
    --publish 3001:3001 \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}

$MYSQL --execute="USE $DB_DATABASE;"
readonly USE_DB_RETCODE=$?

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

if [ "$USE_DB_RETCODE" -ne 0 ]; then
  readonly FIRST_RUN=true
  initialize_database
fi

run
wait_for_container_ports $CONTAINER_NAME 3001 $WAIT_TIMEOUT
if [ "$FIRST_RUN" == "true" ]; then
  initialize_gitea
fi
print_container_info $CONTAINER_NAME
