readonly DEFAULT_VERSION=7.13.3
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=elasticsearch
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME

readonly NODE_1_CONTAINER_NAME=$BASE_NAME-node-1
readonly NODE_1_HOST_NAME=$MONIKER-node-1.backpack.test
readonly NODE_1_NODE_NAME=node-1
readonly NODE_1_HTTP_PORT=9200
readonly NODE_1_TRANSPORT_PORT=9300

readonly NODE_2_CONTAINER_NAME=$BASE_NAME-node-2
readonly NODE_2_HOST_NAME=$MONIKER-node-2.backpack.test
readonly NODE_2_NODE_NAME=node-2
readonly NODE_2_HTTP_PORT=9201
readonly NODE_2_TRANSPORT_PORT=9301

readonly NODE_3_CONTAINER_NAME=$BASE_NAME-node-3
readonly NODE_3_HOST_NAME=$MONIKER-node-3.backpack.test
readonly NODE_3_NODE_NAME=node-3
readonly NODE_3_HTTP_PORT=9202
readonly NODE_3_TRANSPORT_PORT=9302

readonly WAIT_TIMEOUT=600

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
