readonly DEFAULT_VERSION=1.8.6
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=influxdb
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

. ../../../lib/settings/go.sh
. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
