readonly BASE_NAME=backpack-mysql-main
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly MASTER_CONTAINER_NAME=$BASE_NAME-master
readonly BACKUP_CONTAINER_NAME=$BASE_NAME-backup
readonly SLAVE_CONTAINER_NAME=$BASE_NAME-slave
readonly MASTER_HOST_NAME=$BASE_NAME
readonly BACKUP_HOST_NAME=$BASE_NAME
readonly SLAVE_HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

. ../../common-settings/health.sh
. ../../common-settings/log.sh

readonly MASTER_MYSQL_SERVER_ID=1
readonly BACKUP_MYSQL_SERVER_ID=2
readonly SLAVE_MYSQL_SERVER_ID=3