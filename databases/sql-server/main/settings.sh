readonly DEFAULT_VERSION=2019-CU10-ubuntu-20.04
export VERSION=${VERSION:-$DEFAULT_VERSION}

# Edition or product key:
# - Evaluation
# - Developer
# - Express
# - Web
# - Standard
# - Enterprise
# - A product key
readonly DEFAULT_PID=Developer
readonly PID=${PID:-$DEFAULT_PID}

readonly MONIKER=sql-server-main
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly ADMIN_PASSWORD=om0EquuChi8a

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
