readonly DEFAULT_VERSION=3.8.17
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=rabbitmq
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly ADMIN_USERNAME=admin_peryncrevifu
readonly ADMIN_PASSWORD=tiverbaculsi

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
