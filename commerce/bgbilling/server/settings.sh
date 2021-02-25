readonly DEFAULT_VERSION=8.2101-2102221508
export VERSION=${VERSION:-$DEFAULT_VERSION}
export RELEASE=${VERSION%-*}
export SET=${VERSION#*-}
export COMPONENTS='
  bill
  card
  inet
  npay
  reports
  rscm
  sorm
  subscription

  bonus
  cladr
  dispatch
  documents
  fias
  helpdesk
'

readonly MONIKER=bgbilling-server
readonly BASE_NAME=backpack-$MONIKER
readonly IMAGE_NAME=alexanderfefelov/$BASE_NAME
readonly CONTAINER_NAME=$BASE_NAME
readonly HOST_NAME=$MONIKER.backpack.test
readonly WAIT_TIMEOUT=600

readonly DB_HOST=mysql-main-master.backpack.test
readonly DB_PORT=3306
readonly DB_DATABASE=bgbilling
readonly DB_ROOT_USERNAME=root
readonly DB_ROOT_PASSWORD=camycorymicu
readonly DB_USERNAME=bgbilling_nah0queithei
readonly DB_PASSWORD=feizudi1xu9h

. ../../../lib/settings/health.sh
. ../../../lib/settings/log.sh
