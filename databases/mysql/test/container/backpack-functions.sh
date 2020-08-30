create_healthcheck_account() {
  echo Creating healthcheck account...
  mysql --user=root --password=$MYSQL_ROOT_PASSWORD --execute="
    CREATE USER '$HEALTHCHECK_USERNAME'@'localhost' IDENTIFIED WITH mysql_native_password BY '$HEALTHCHECK_PASSWORD';
  "
  echo ...healthcheck account created
}

create_telegraf_account() {
  echo Creating telegraf account...
  mysql --user=root --password=$MYSQL_ROOT_PASSWORD --execute="
    CREATE USER '$TELEGRAF_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$TELEGRAF_PASSWORD';
    GRANT SHOW DATABASES ON *.* TO '$TELEGRAF_USERNAME'@'%';
    GRANT SELECT ON performance_schema.* TO '$TELEGRAF_USERNAME'@'%';
  "
  echo ...telegraf account created
}
