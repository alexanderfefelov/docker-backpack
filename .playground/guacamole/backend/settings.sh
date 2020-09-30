readonly BASE_NAME=backpack-guacamole-backend
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
