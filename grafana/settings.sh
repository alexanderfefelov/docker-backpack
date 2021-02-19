readonly DEFAULT_VERSION=7.4.2
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=grafana
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=grafana
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=grafana_solenstgalog
readonly DB_PASSWORD=peritypindol

. ../lib/settings/go.sh
. ../lib/settings/health.sh
. ../lib/settings/log.sh
