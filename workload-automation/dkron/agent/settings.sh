readonly DEFAULT_VERSION=3.1.3
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=dkron-agent
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME

readonly AGENT_1_CONTAINER_NAME=$BASE_NAME-1
readonly AGENT_1_HOST_NAME=$MONIKER-1.backpack.test
readonly AGENT_1_NODE_NAME=agent-1
readonly AGENT_1_SERF_PORT=8909
readonly AGENT_1_GRPC_PORT=8910

readonly AGENT_2_CONTAINER_NAME=$BASE_NAME-2
readonly AGENT_2_HOST_NAME=$MONIKER-2.backpack.test
readonly AGENT_2_NODE_NAME=agent-2
readonly AGENT_2_SERF_PORT=8911
readonly AGENT_2_GRPC_PORT=8912

readonly AGENT_3_CONTAINER_NAME=$BASE_NAME-3
readonly AGENT_3_HOST_NAME=$MONIKER-3.backpack.test
readonly AGENT_3_NODE_NAME=agent-3
readonly AGENT_3_SERF_PORT=8913
readonly AGENT_3_GRPC_PORT=8914

readonly WAIT_TIMEOUT=600

. ../../../lib/settings/go.sh
. ../../../lib/settings/log.sh
