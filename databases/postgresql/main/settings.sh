readonly DEFAULT_VERSION=13.2
export VERSION=${VERSION:-$DEFAULT_VERSION}

readonly MONIKER=postgresql-main
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly POSTGRES_USERNAME=postgres_ibleabaldine
readonly POSTGRES_PASSWORD=undestrokend
readonly POSTGRES_DATABASE=postgres
readonly HEALTHCHECK_USERNAME=healthcheck_phocincergeo
readonly HEALTHCHECK_PASSWORD=tanionetedio
readonly TELEGRAF_USERNAME=telegraf_viledahloger
readonly TELEGRAF_PASSWORD=atiolusethil

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
