readonly DEFAULT_VERSION=1.1.0
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=dnsmasq
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly ADMIN_USERNAME=admin_inestorasyno
readonly ADMIN_PASSWORD=impardalwina

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
