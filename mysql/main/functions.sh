run_master() {
  docker run \
    --name $1 \
    --hostname $2 \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro \
    --volume $1-data:/var/lib/mysql \
    --publish 3306:3306 \
    --env SERVER_ID=$3 \
    --env MODE=master \
    --env MYSQL_ROOT_PASSWORD=camycorymicu \
    --env REPLICATOR_USERNAME=replicator_avaternetrai \
    --env REPLICATOR_PASSWORD=ergatecuserb \
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
    --volume /etc/localtime:/etc/localtime:ro \
    --volume $1-data:/var/lib/mysql \
    --publish 1000$3:3306 \
    --env SERVER_ID=$3 \
    --env MODE=slave \
    --env MYSQL_ROOT_PASSWORD=camycorymicu \
    --env MASTER_HOST=master.mysql.backpack.test \
    --env REPLICATOR_USERNAME=replicator_avaternetrai \
    --env REPLICATOR_PASSWORD=ergatecuserb \
    --health-cmd $HEALTH_CMD --health-start-period $HEALTH_START_PERIOD --health-interval $HEALTH_INTERVAL --health-timeout $HEALTH_TIMEOUT --health-retries $HEALTH_RETRIES \
    --log-opt max-size=$LOG_MAX_SIZE --log-opt max-file=$LOG_MAX_FILE \
    $IMAGE_NAME
  docker run --rm --link $1:foobar martin/wait -p 3306 -t $WAIT_TIMEOUT
  docker exec $1 cp /read-only.cnf /etc/mysql/mysql.conf.d/
  docker restart $1
  docker run --rm --link $1:foobar martin/wait -p 3306 -t $WAIT_TIMEOUT
}
