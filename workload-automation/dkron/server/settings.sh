readonly DEFAULT_VERSION=3.1.5
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=dkron-server
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME

readonly SERVER_1_CONTAINER_NAME=$BASE_NAME-1
readonly SERVER_1_HOST_NAME=$MONIKER-1.backpack.test
readonly SERVER_1_NODE_NAME=server-1
readonly SERVER_1_HTTP_PORT=8900
readonly SERVER_1_SERF_PORT=8901
readonly SERVER_1_GRPC_PORT=8902

readonly SERVER_2_CONTAINER_NAME=$BASE_NAME-2
readonly SERVER_2_HOST_NAME=$MONIKER-2.backpack.test
readonly SERVER_2_NODE_NAME=server-2
readonly SERVER_2_HTTP_PORT=8903
readonly SERVER_2_SERF_PORT=8904
readonly SERVER_2_GRPC_PORT=8905

readonly SERVER_3_CONTAINER_NAME=$BASE_NAME-3
readonly SERVER_3_HOST_NAME=$MONIKER-3.backpack.test
readonly SERVER_3_NODE_NAME=server-3
readonly SERVER_3_HTTP_PORT=8906
readonly SERVER_3_SERF_PORT=8907
readonly SERVER_3_GRPC_PORT=8908

readonly WAIT_TIMEOUT=600

. ../../../lib/settings/go.sh
. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
