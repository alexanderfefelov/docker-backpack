readonly DEFAULT_VERSION=10.5.9
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=mariadb-main
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly MASTER_CONTAINER_NAME=$BASE_NAME-master
readonly BACKUP_CONTAINER_NAME=$BASE_NAME-backup
readonly SLAVE_CONTAINER_NAME=$BASE_NAME-slave
readonly MASTER_HOST_NAME=$MONIKER-master.backpack.test
readonly BACKUP_HOST_NAME=$MONIKER-backup.backpack.test
readonly SLAVE_HOST_NAME=$MONIKER-slave.backpack.test
readonly WAIT_TIMEOUT=600

readonly MASTER_PORT=3310
readonly BACKUP_PORT=3312
readonly SLAVE_PORT=3313

readonly MASTER_SERVER_ID=11
readonly BACKUP_SERVER_ID=12
readonly SLAVE_SERVER_ID=13

readonly MYSQL_ROOT_PASSWORD=ethaiz1op8wi
readonly REPLICATOR_USERNAME=replicator_yae4egie8eex
readonly REPLICATOR_PASSWORD=xahku6ahquoc
readonly HEALTHCHECK_USERNAME=healthcheck_naidix4kaipe
readonly HEALTHCHECK_PASSWORD=poh5phiequie
readonly BACKUP_USERNAME=backup_ohm0ohj7aeng
readonly BACKUP_PASSWORD=zeemei5apai2
readonly TELEGRAF_USERNAME=telegraf_rae5rohgh1ae
readonly TELEGRAF_PASSWORD=ez5te2ohxaa3

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
