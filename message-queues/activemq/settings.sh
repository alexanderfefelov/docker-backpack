readonly DEFAULT_VERSION=5.16.2
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=activemq
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME

readonly NODE_1_CONTAINER_NAME=$BASE_NAME-node-1
readonly NODE_1_HOST_NAME=$MONIKER-node-1.backpack.test
readonly NODE_1_BROKER_NAME=node-1
readonly NODE_1_MQTT_PORT=1883
readonly NODE_1_AMQP_PORT=5670
readonly NODE_1_HTTP_PORT=8161
readonly NODE_1_STOMP_PORT=61614
readonly NODE_1_WEBSOCKET_PORT=61615
readonly NODE_1_OPENWIRE_PORT=61616

readonly NODE_2_CONTAINER_NAME=$BASE_NAME-node-2
readonly NODE_2_HOST_NAME=$MONIKER-node-2.backpack.test
readonly NODE_2_BROKER_NAME=node-2
readonly NODE_2_MQTT_PORT=1884
readonly NODE_2_AMQP_PORT=5671
readonly NODE_2_HTTP_PORT=8162
readonly NODE_2_STOMP_PORT=61617
readonly NODE_2_WEBSOCKET_PORT=61618
readonly NODE_2_OPENWIRE_PORT=61619

readonly NODE_3_CONTAINER_NAME=$BASE_NAME-node-3
readonly NODE_3_HOST_NAME=$MONIKER-node-3.backpack.test
readonly NODE_3_BROKER_NAME=node-3
readonly NODE_3_MQTT_PORT=1885
readonly NODE_3_AMQP_PORT=5672
readonly NODE_3_HTTP_PORT=8163
readonly NODE_3_STOMP_PORT=61620
readonly NODE_3_WEBSOCKET_PORT=61621
readonly NODE_3_OPENWIRE_PORT=61622

readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=activemq
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=activemq_feizievoudai
readonly DB_PASSWORD=axiechiemoht

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
