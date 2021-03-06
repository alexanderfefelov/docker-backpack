readonly DEFAULT_VERSION=4.4.4
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=mongodb-main
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly ADMIN_USERNAME=admin_shaochohbeix
readonly ADMIN_PASSWORD=naephaesohno

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
