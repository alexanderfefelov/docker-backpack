readonly BASE_NAME=backpack-grafana
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly DB_HOST=master.mysql.backpack.test
readonly DB_DATABASE=grafana
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_GRAFANA_USERNAME=grafana_solenstgalog
readonly DB_GRAFANA_PASSWORD=peritypindol

. ../common-settings/go.sh
. ../common-settings/health.sh
. ../common-settings/log.sh
