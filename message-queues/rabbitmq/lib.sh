run() {
  docker run \
    --name $CONTAINER_NAME \
    --hostname $HOST_NAME \
    --detach \
    --volume /etc/localtime:/etc/localtime:ro --volume /etc/timezone:/etc/timezone:ro \
    --volume $CONTAINER_NAME-conf:/etc/rabbitmq \
    --volume $CONTAINER_NAME-data:/var/lib/rabbitmq \
    --publish 1893:1883 \
    --publish 5673:5672 \
    --publish 5674:5671 \
    --publish 8883:8883 \
    --publish 15672:15672 \
    --publish 15674:15674 \
    --publish 15675:15675 \
    --publish 61623:61613 \
    --publish 61624:61614 \
    --env RABBITMQ_DEFAULT_USER=$ADMIN_USERNAME \
    --env RABBITMQ_DEFAULT_PASS=$ADMIN_PASSWORD \
    $DEFAULT_HEALTH_SETTINGS \
    $DEFAULT_LOG_SETTINGS \
    $IMAGE_NAME:$VERSION
}
