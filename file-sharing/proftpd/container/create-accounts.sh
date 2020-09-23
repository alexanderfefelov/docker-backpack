#!/usr/bin/env bash

while IFS=: read -r username password; do
  echo -n Creating account $username...
  useradd $username --password $(mkpasswd $password) --create-home
  echo done
done < /create-accounts.data
