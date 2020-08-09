BASE_NAME=backpack-kibana
IMAGE_NAME=alexanderfefelov/$BASE_NAME
CONTAINER_NAME=$BASE_NAME
HOST_NAME=$BASE_NAME
WAIT_TIMEOUT=600

. ../../common-settings/health.sh
. ../../common-settings/log.sh
