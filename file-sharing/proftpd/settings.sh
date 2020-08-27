readonly BASE_NAME=backpack-proftpd
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

export FTP_USERNAME=ftp_arditerminet
export FTP_PASSWORD=tracdoweigme

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
