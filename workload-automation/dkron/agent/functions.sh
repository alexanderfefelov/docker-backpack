run_instance() {
  local -r INSTANCE_CONTAINER_NAME=$1
  local -r INSTANCE_HOST_NAME=$2
  local -r INSTANCE_NODE_NAME=$3
  local -r INSTANCE_SERF_PORT=$4
  local -r INSTANCE_GRPC_PORT=$5

  docker run \
    --name $INSTANCE_CONTAINER_NAME \
    --hostname $INSTANCE_HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --publish $INSTANCE_SERF_PORT:$INSTANCE_SERF_PORT \
    --publish $INSTANCE_SERF_PORT:$INSTANCE_SERF_PORT/udp \
    --publish $INSTANCE_GRPC_PORT:$INSTANCE_GRPC_PORT \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION \
      agent \
        --rpc-port $INSTANCE_GRPC_PORT \
        --bind-addr $INSTANCE_HOST_NAME:$INSTANCE_SERF_PORT \
        --retry-join dkron-server-1.backpack.test:8901 \
        --retry-join dkron-server-2.backpack.test:8904 \
        --retry-join dkron-server-3.backpack.test:8907 \
        --retry-interval 15s \
        --region test \
        --datacenter backpack \
        --node-name $INSTANCE_NODE_NAME \
        --tag group=agents \
        --tag host=$INSTANCE_HOST_NAME \
        --data-dir /var/lib/dkron/data \
        --statsd-addr graphite-statsd.backpack.test:8125
}
