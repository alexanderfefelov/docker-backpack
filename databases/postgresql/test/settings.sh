readonly MONIKER=postgresql-test
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly POSTGRES_USERNAME=postgres_nfursongence
readonly POSTGRES_PASSWORD=vitablestudi
readonly POSTGRES_DATABASE=postgres
readonly HEALTHCHECK_USERNAME=healthcheck_nutchurcente
readonly HEALTHCHECK_PASSWORD=ltatintermfu
readonly TELEGRAF_USERNAME=telegraf_orandstristi
readonly TELEGRAF_PASSWORD=erberanitewi

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
