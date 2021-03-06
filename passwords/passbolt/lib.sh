readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

initialize_passbolt() {
  echo Initializing Passbolt...
  bash init/initialize-passbolt.sh $CONTAINER_NAME
  echo ...Passbolt initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/passbolt \
    --publish 8101:8080 \
    --env DATASOURCES_DEFAULT_HOST=$DB_HOST \
    --env DATASOURCES_DEFAULT_PORT=$DB_PORT \
    --env DATASOURCES_DEFAULT_DATABASE=$DB_DATABASE \
    --env DATASOURCES_DEFAULT_USERNAME=$DB_USERNAME \
    --env DATASOURCES_DEFAULT_PASSWORD=$DB_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
