readonly BASE_NAME=backpack-mysql-main
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly MASTER_CONTAINER_NAME=$BASE_NAME-master
readonly BACKUP_CONTAINER_NAME=$BASE_NAME-backup
readonly SLAVE_CONTAINER_NAME=$BASE_NAME-slave
readonly MASTER_HOST_NAME=$BASE_NAME-master
readonly BACKUP_HOST_NAME=$BASE_NAME-backup
readonly SLAVE_HOST_NAME=$BASE_NAME-slave
readonly WAIT_TIMEOUT=600

readonly MASTER_MYSQL_SERVER_ID=1
readonly BACKUP_MYSQL_SERVER_ID=2
readonly SLAVE_MYSQL_SERVER_ID=3

readonly MYSQL_ROOT_PASSWORD=camycorymicu
readonly REPLICATOR_USERNAME=replicator_avaternetrai
readonly REPLICATOR_PASSWORD=ergatecuserb
readonly HEALTHCHECK_USERNAME=healthcheck_tutedojobu
readonly HEALTHCHECK_PASSWORD=adqafzubjutk
readonly BACKUP_USERNAME=backup_letocryloite
readonly BACKUP_PASSWORD=almatramushi
readonly TELEGRAF_USERNAME=telegraf_resterfigral
readonly TELEGRAF_PASSWORD=mpyrismelort

. ../../common-settings/health.sh
. ../../common-settings/log.sh
