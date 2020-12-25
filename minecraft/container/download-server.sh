#!/usr/bin/env bash

readonly VERSION=$1
readonly CURL="curl --silent --fail --show-error"
readonly URL_VERSIONS_MANIFEST=https://launchermeta.mojang.com/mc/game/version_manifest.json
echo Versions manifest URL: $URL_VERSIONS_MANIFEST
readonly URL_RELEASE_MANIFEST=$($CURL $URL_VERSIONS_MANIFEST \
  | jq --raw-output '.versions[] | select(.id == "'$VERSION'") | select(.type == "release") | .url')
echo Release manifest URL: $URL_RELEASE_MANIFEST
readonly URL_SERVER=$($CURL $URL_RELEASE_MANIFEST \
  | jq --raw-output .downloads.server.url)
echo Server URL: $URL_SERVER
$CURL --output server.jar $URL_SERVER
