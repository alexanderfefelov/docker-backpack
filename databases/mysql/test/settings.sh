readonly DEFAULT_VERSION=8.0.25
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=mysql-test
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly MYSQL_ROOT_PASSWORD=ickyligholro
readonly HEALTHCHECK_USERNAME=healthcheck_coloncieurgo
readonly HEALTHCHECK_PASSWORD=roladynorbas
readonly TELEGRAF_USERNAME=telegraf_husaughbleak
readonly TELEGRAF_PASSWORD=siblecitewar

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
