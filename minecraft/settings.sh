readonly DEFAULT_VERSION=1.16.5
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=minecraft
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

. ../lib/settings/health.sh
. ../lib/settings/log.sh
