#!/usr/bin/env bash

# Elevate privileges
[ $UID -eq 0 ] || exec sudo --preserve-env=VERSION bash "$0" "$@"

. settings.sh
. ../../../lib/lib.sh

readonly SQLCMD="sqlcmd -S $HOST_NAME,1433 -U sa -P $ADMIN_PASSWORD"

initialize() {
  echo Initializing...
  $SQLCMD -i init/create-accounts.sql
  echo ...initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/var/opt/mssql/data \
    --volume $CONTAINER_NAME-log:/var/opt/mssql/log \
    --volume $CONTAINER_NAME-secret:/var/opt/mssql/secrets \
    --publish 1433:1433 \
    --env ACCEPT_EULA=Y \
    --env MSSQL_PID=$PID \
    --env MSSQL_SA_PASSWORD=$ADMIN_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}

run
wait_for_all_container_ports $CONTAINER_NAME $WAIT_TIMEOUT
$SQLCMD -Q "SELECT name FROM master.sys.server_principals WHERE name = 'healthcheck_sainarao9cha';" | grep healthcheck_sainarao9cha > /dev/null
if [ $? -ne 0 ]; then
  initialize
fi
print_container_info $CONTAINER_NAME
