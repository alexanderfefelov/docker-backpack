readonly DEFAULT_VERSION=5.2.6
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=zabbix-frontend
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=zabbix
readonly DB_USERNAME=zabbix_webarnalastr
readonly DB_PASSWORD=dentinguarne

. ../../../../lib/settings/health.sh
. ../../../../lib/settings/log.sh
