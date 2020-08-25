readonly BASE_NAME=backpack-postgresql-test
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly POSTGRES_USERNAME=postgres_nfursongence
readonly POSTGRES_PASSWORD=vitablestudi
readonly POSTGRES_DATABASE=postgres
readonly HEALTHCHECK_USERNAME=healthcheck_nutchurcente
readonly HEALTHCHECK_PASSWORD=ltatintermfu
readonly TELEGRAF_USERNAME=telegraf_orandstristi
readonly TELEGRAF_PASSWORD=erberanitewi

. ../../../common-settings/health.sh
. ../../../common-settings/log.sh
