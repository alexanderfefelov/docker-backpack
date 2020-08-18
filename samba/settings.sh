readonly BASE_NAME=backpack-samba
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$BASE_NAME
readonly WAIT_TIMEOUT=600

export SAMBA_USERNAME=samba_romencosuesc
export SAMBA_PASSWORD=atherfrustra
export SAMBA_GID=128
export SAMBA_GROUP=samba

. ../common-settings/health.sh
. ../common-settings/log.sh
