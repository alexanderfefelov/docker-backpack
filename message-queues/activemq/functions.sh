run_node() {
  local -r CONTAINER_NAME=$1
  local -r HOST_NAME=$2
  local -r BROKER_NAME=$3
  local -r MQTT_PORT=$4
  local -r AMQP_PORT=$5
  local -r HTTP_PORT=$6
  local -r STOMP_PORT=$7
  local -r WEBSOCKET_PORT=$8
  local -r OPENWIRE_PORT=$9

  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-data:/activemq/data \
    --publish $MQTT_PORT:1883 \
    --publish $AMQP_PORT:5672 \
    --publish $HTTP_PORT:8161 \
    --publish $STOMP_PORT:61613 \
    --publish $WEBSOCKET_PORT:61614 \
    --publish $OPENWIRE_PORT:61616 \
    --env BROKER_NAME=$BROKER_NAME \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME
}
