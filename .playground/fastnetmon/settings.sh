readonly BASE_NAME=backpack-fastnetmon
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

export IMAGE_NAME
export FASTNETMON_VERSION=1.1.7

readonly GRAPHITE_HOST=influxdb.backpack.test
readonly GRAPHITE_PORT=2013
readonly REDIS_HOST=redis.backpack.test
readonly REDIS_PORT=6379

. ../../lib/settings/health.sh
. ../../lib/settings/log.sh
