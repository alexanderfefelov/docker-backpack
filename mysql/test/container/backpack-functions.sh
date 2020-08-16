create_healthcheck_account() {
  echo Creating healthcheck account...
  mysql --user=root --password=$MYSQL_ROOT_PASSWORD --execute=" \
    CREATE USER '$HEALTHCHECK_USERNAME'@'localhost' IDENTIFIED WITH mysql_native_password BY '$HEALTHCHECK_PASSWORD'; \
  "
  echo ...healthcheck account created
}
