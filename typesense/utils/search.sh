#!/usr/bin/env bash

readonly COLLECTION_NAME=${1:-lorem-ipsum}
readonly Q=${2:-lorem ipsum}
readonly SEARCH_FIELD=text

. lib.sh

execute_get_request collections/$COLLECTION_NAME/documents/search q=="$Q" query_by==$SEARCH_FIELD
