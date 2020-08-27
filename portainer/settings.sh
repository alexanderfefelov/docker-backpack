readonly BASE_NAME=backpack-portainer
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly ADMIN_USERNAME=admin
readonly ADMIN_PASSWORD=defulobitusc

. ../lib/settings/go.sh
. ../lib/settings/log.sh
