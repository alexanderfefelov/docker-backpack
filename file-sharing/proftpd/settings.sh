readonly MONIKER=proftpd
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

export FTP_USERNAME=ftp_arditerminet
export FTP_PASSWORD=tracdoweigme

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
