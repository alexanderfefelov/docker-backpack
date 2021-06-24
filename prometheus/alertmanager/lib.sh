run_instance() {
  local -r INSTANCE_CONTAINER_NAME=$1
  local -r INSTANCE_HOST_NAME=$2
  local -r INSTANCE_ALERTMANAGER_PORT=$3
  local -r INSTANCE_CLUSTER_PORT=$4
  local -r INSTANCE_PEERS=$5
  local -r INSTANCE_IP_ADDRESS=$(getent hosts $INSTANCE_HOST_NAME | awk '{ print $1 }')

  docker run \
    --name $INSTANCE_CONTAINER_NAME \
    --hostname $INSTANCE_HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $INSTANCE_CONTAINER_NAME-conf:/etc/alertmanager \
    --volume $INSTANCE_CONTAINER_NAME-data:/alertmanager \
    --publish $INSTANCE_ALERTMANAGER_PORT:9093 \
    --publish $INSTANCE_CLUSTER_PORT:9094 \
    --publish $INSTANCE_CLUSTER_PORT:9094/udp \
    $DEFAULT_GO_SETTINGS \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION \
      --config.file=/etc/alertmanager/alertmanager.yml \
      --cluster.advertise-address=$INSTANCE_IP_ADDRESS:$INSTANCE_CLUSTER_PORT \
      $INSTANCE_PEERS
}
