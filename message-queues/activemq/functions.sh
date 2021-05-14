run_instance() {
  local -r INSTANCE_CONTAINER_NAME=$1
  local -r INSTANCE_HOST_NAME=$2
  local -r INSTANCE_BROKER_NAME=$3
  local -r INSTANCE_MQTT_PORT=$4
  local -r INSTANCE_AMQP_PORT=$5
  local -r INSTANCE_HTTP_PORT=$6
  local -r INSTANCE_STOMP_PORT=$7
  local -r INSTANCE_WEBSOCKET_PORT=$8
  local -r INSTANCE_OPENWIRE_PORT=$9

  docker run \
    --name $INSTANCE_CONTAINER_NAME \
    --hostname $INSTANCE_HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $INSTANCE_CONTAINER_NAME-conf:/activemq/conf \
    --volume $INSTANCE_CONTAINER_NAME-data:/activemq/data \
    --publish $INSTANCE_MQTT_PORT:1883 \
    --publish $INSTANCE_AMQP_PORT:5672 \
    --publish $INSTANCE_HTTP_PORT:8161 \
    --publish $INSTANCE_STOMP_PORT:61613 \
    --publish $INSTANCE_WEBSOCKET_PORT:61614 \
    --publish $INSTANCE_OPENWIRE_PORT:61616 \
    --env BROKER_NAME=$INSTANCE_BROKER_NAME \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
