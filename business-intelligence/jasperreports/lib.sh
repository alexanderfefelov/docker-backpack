readonly MYSQL="mysql --host=$DB_HOST --port=$DB_PORT --user=$DB_ROOT_USERNAME --password=$DB_ROOT_PASSWORD"

initialize_database() {
  echo Initializing database...
  export DB_DATABASE DB_USERNAME DB_PASSWORD
  $MYSQL <<< "$(envsubst < init/initialize-database.sql)"
  echo ...database initialized
}

warm_up_webapp() {
  echo Warming up...
  http --timeout $WAIT_TIMEOUT $HOST_NAME:8097/jasperserver
  echo ...warmed up
}

initialize_jasperreports_1() {
  echo Initializing JasperReports, part 1...
  bash init/initialize-jasperreports.sh $CONTAINER_NAME
  echo ...JasperReports initialized, part 1
}

initialize_jasperreports_2() {
  echo Initializing JasperReports, part 2...
  bash init/configure-accounts.sh
  $MYSQL $DB_DATABASE < init/set-default-theme.sql
  echo ...JasperReports initialized, part 2
}

run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-keystore:/etc/jasperserver/keystore \
    --volume $CONTAINER_NAME-log-jasperreports:/usr/local/tomcat/webapps/jasperserver/WEB-INF/logs \
    --volume $CONTAINER_NAME-log-tomcat:/usr/local/tomcat/logs \
    --publish 8097:8080 \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
