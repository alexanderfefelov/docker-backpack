#!/usr/bin/env bash

readonly ACCOUNTS=/accounts

if [ -f $ACCOUNTS ]; then
  while IFS=: read -r username password; do
    echo -n Creating account $username...
    useradd $username --password $(mkpasswd $password) --create-home
    echo done
  done < $ACCOUNTS
  rm --force $ACCOUNTS
fi

exec "$@"
