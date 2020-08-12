readonly BASE_NAME=backpack-chronograf
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

. ../../common-settings/go.sh
. ../../common-settings/health.sh
. ../../common-settings/log.sh
