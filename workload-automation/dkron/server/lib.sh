run_instance() {
  local -r INSTANCE_CONTAINER_NAME=$1
  local -r INSTANCE_HOST_NAME=$2
  local -r INSTANCE_NODE_NAME=$3
  local -r INSTANCE_HTTP_PORT=$4
  local -r INSTANCE_SERF_PORT=$5
  local -r INSTANCE_GRPC_PORT=$6
  local -r INSTANCE_BOOTSTRAP=$7

  docker run \
    --name $INSTANCE_CONTAINER_NAME \
    --hostname $INSTANCE_HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $INSTANCE_CONTAINER_NAME-backup:/var/lib/dkron/backup \
    --volume $INSTANCE_CONTAINER_NAME-data:/var/lib/dkron/data \
    --volume $INSTANCE_CONTAINER_NAME-log:/var/log/dkron \
    --publish $INSTANCE_HTTP_PORT:8080 \
    --publish $INSTANCE_SERF_PORT:$INSTANCE_SERF_PORT \
    --publish $INSTANCE_SERF_PORT:$INSTANCE_SERF_PORT/udp \
    --publish $INSTANCE_GRPC_PORT:$INSTANCE_GRPC_PORT \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION \
      agent \
        --server \
        --bind-addr "{{ GetPrivateIP }}":$INSTANCE_SERF_PORT \
        --advertise-addr host.backpack.test:$INSTANCE_SERF_PORT \
        --rpc-port $INSTANCE_GRPC_PORT \
        --retry-join $SERVER_1_HOST_NAME:$SERVER_1_SERF_PORT \
        --retry-join $SERVER_2_HOST_NAME:$SERVER_2_SERF_PORT \
        --retry-join $SERVER_3_HOST_NAME:$SERVER_3_SERF_PORT \
        --retry-interval 15s \
        $INSTANCE_BOOTSTRAP \
        --region test \
        --datacenter backpack \
        --node-name $INSTANCE_NODE_NAME \
        --tag group=servers \
        --tag host=$INSTANCE_HOST_NAME \
        --data-dir /var/lib/dkron/data \
        --statsd-addr graphite-statsd.backpack.test:8125 \
        --enable-prometheus
}

initialize_dkron() {
  echo Initializing Dkron...
  bash init/create-server-jobs.sh $SERVER_1_HOST_NAME
  bash init/create-server-jobs.sh $SERVER_2_HOST_NAME
  bash init/create-server-jobs.sh $SERVER_3_HOST_NAME
  echo ...Dkron initialized
}
