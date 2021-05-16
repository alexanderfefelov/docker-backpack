readonly DEFAULT_VERSION=4.4.6
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=mongodb-test
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly ADMIN_USERNAME=admin_taivazaiyiew
readonly ADMIN_PASSWORD=holebeehaete

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
