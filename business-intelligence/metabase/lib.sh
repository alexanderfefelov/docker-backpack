readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

initialize_metabase() {
  echo Initializing Metabase...
  python3 init/initialize-metabase.py
  echo ...Metabase initialized
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --publish 3042:3000 \
    --publish 3043:8778 \
    --env JAVA_OPTS="$JAVA_OPTS" \
    --env MB_DB_TYPE=mysql \
    --env MB_DB_HOST=$DB_HOST \
    --env MB_DB_PORT=$DB_PORT \
    --env MB_DB_DBNAME=$DB_DATABASE \
    --env MB_DB_USER=$DB_USERNAME \
    --env MB_DB_PASS=$DB_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
