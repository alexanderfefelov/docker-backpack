run_master() {
  docker run \
    --name $1 \
    --hostname $2 \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $1-data:/var/lib/mysql \
    --publish $4:3306 \
    --env SERVER_ID=$3 \
    --env MODE=master \
    --env MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
    --env REPLICATOR_USERNAME=$REPLICATOR_USERNAME \
    --env REPLICATOR_PASSWORD=$REPLICATOR_PASSWORD \
    --env HEALTHCHECK_USERNAME=$HEALTHCHECK_USERNAME \
    --env HEALTHCHECK_PASSWORD=$HEALTHCHECK_PASSWORD \
    --env BACKUP_USERNAME=$BACKUP_USERNAME \
    --env BACKUP_PASSWORD=$BACKUP_PASSWORD \
    --env TELEGRAF_USERNAME=$TELEGRAF_USERNAME \
    --env TELEGRAF_PASSWORD=$TELEGRAF_PASSWORD \
    --health-cmd $HEALTH_CMD --health-start-period $HEALTH_START_PERIOD --health-interval $HEALTH_INTERVAL --health-timeout $HEALTH_TIMEOUT --health-retries $HEALTH_RETRIES \
    --log-opt max-size=$LOG_MAX_SIZE --log-opt max-file=$LOG_MAX_FILE \
    $IMAGE_NAME
  docker run --rm --link $1:foobar martin/wait -p 3306 -t $WAIT_TIMEOUT
}

run_slave() {
  docker run \
    --name $1 \
    --hostname $2 \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $1-data:/var/lib/mysql \
    --publish $4:3306 \
    --env SERVER_ID=$3 \
    --env MODE=slave \
    --env MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD \
    --env MASTER_HOST=master.mysql.backpack.test \
    --env MASTER_PORT=$5 \
    --env REPLICATOR_USERNAME=$REPLICATOR_USERNAME \
    --env REPLICATOR_PASSWORD=$REPLICATOR_PASSWORD \
    --env HEALTHCHECK_USERNAME=$HEALTHCHECK_USERNAME \
    --env HEALTHCHECK_PASSWORD=$HEALTHCHECK_PASSWORD \
    --health-cmd $HEALTH_CMD --health-start-period $HEALTH_START_PERIOD --health-interval $HEALTH_INTERVAL --health-timeout $HEALTH_TIMEOUT --health-retries $HEALTH_RETRIES \
    --log-opt max-size=$LOG_MAX_SIZE --log-opt max-file=$LOG_MAX_FILE \
    $IMAGE_NAME
  docker run --rm --link $1:foobar martin/wait -p 3306 -t $WAIT_TIMEOUT
  docker exec $1 cp /read-only.cnf /etc/mysql/mysql.conf.d/
  docker restart $1
  docker run --rm --link $1:foobar martin/wait -p 3306 -t $WAIT_TIMEOUT
}
