readonly DEFAULT_VERSION=0.22.2
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=alertmanager
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME

readonly NODE_1_CONTAINER_NAME=$BASE_NAME-node-1
readonly NODE_1_HOST_NAME=$MONIKER-node-1.backpack.test
readonly NODE_1_ALERTMANAGER_PORT=9093
readonly NODE_1_CLUSTER_PORT=9094

readonly NODE_2_CONTAINER_NAME=$BASE_NAME-node-2
readonly NODE_2_HOST_NAME=$MONIKER-node-2.backpack.test
readonly NODE_2_ALERTMANAGER_PORT=9095
readonly NODE_2_CLUSTER_PORT=9096

readonly NODE_3_CONTAINER_NAME=$BASE_NAME-node-3
readonly NODE_3_HOST_NAME=$MONIKER-node-3.backpack.test
readonly NODE_3_ALERTMANAGER_PORT=9097
readonly NODE_3_CLUSTER_PORT=9098

readonly NODE_1_PEERS="--cluster.peer=$NODE_2_HOST_NAME:$NODE_2_CLUSTER_PORT --cluster.peer=$NODE_3_HOST_NAME:$NODE_3_CLUSTER_PORT"
readonly NODE_2_PEERS="--cluster.peer=$NODE_1_HOST_NAME:$NODE_1_CLUSTER_PORT --cluster.peer=$NODE_3_HOST_NAME:$NODE_3_CLUSTER_PORT"
readonly NODE_3_PEERS="--cluster.peer=$NODE_1_HOST_NAME:$NODE_1_CLUSTER_PORT --cluster.peer=$NODE_2_HOST_NAME:$NODE_2_CLUSTER_PORT"

readonly WAIT_TIMEOUT=600

. ../../lib/settings/go.sh
. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
