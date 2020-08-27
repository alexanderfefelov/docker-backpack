readonly BASE_NAME=backpack-grafana
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly DB_HOST=master.mysql.backpack.test
readonly DB_DATABASE=grafana
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=grafana_solenstgalog
readonly DB_PASSWORD=peritypindol

. ../lib/settings/go.sh
. ../lib/settings/health.sh
. ../lib/settings/log.sh
