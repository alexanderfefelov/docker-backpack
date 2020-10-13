readonly MONIKER=dkron-agent
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME

readonly AGENT_1_CONTAINER_NAME=$BASE_NAME-1
readonly AGENT_1_HOST_NAME=$MONIKER-1.backpack.test

readonly AGENT_2_CONTAINER_NAME=$BASE_NAME-2
readonly AGENT_2_HOST_NAME=$MONIKER-2.backpack.test

readonly WAIT_TIMEOUT=600

. ../../../lib/settings/go.sh
. ../../../lib/settings/log.sh
