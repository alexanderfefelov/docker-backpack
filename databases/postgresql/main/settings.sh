readonly BASE_NAME=backpack-postgresql-main
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

readonly POSTGRES_USERNAME=postgres_ibleabaldine
readonly POSTGRES_PASSWORD=undestrokend
readonly POSTGRES_DATABASE=postgres
readonly HEALTHCHECK_USERNAME=healthcheck_phocincergeo
readonly HEALTHCHECK_PASSWORD=tanionetedio
readonly TELEGRAF_USERNAME=telegraf_viledahloger
readonly TELEGRAF_PASSWORD=atiolusethil

. ../../../common-settings/health.sh
. ../../../common-settings/log.sh
