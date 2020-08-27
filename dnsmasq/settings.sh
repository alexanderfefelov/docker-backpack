readonly BASE_NAME=backpack-dnsmasq
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly ADMIN_USERNAME=admin_inestorasyno
readonly ADMIN_PASSWORD=impardalwina

. ../lib/settings/health.sh
. ../lib/settings/log.sh
