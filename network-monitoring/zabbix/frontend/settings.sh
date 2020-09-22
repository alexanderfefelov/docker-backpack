readonly BASE_NAME=backpack-zabbix-frontend
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly DB_HOST=master.mysql.backpack.test
readonly DB_DATABASE=zabbix
readonly DB_USERNAME=zabbix_webarnalastr
readonly DB_PASSWORD=dentinguarne

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
