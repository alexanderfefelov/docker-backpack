create_healthcheck_account() {
  echo Creating healthcheck account...
  mysql --user=root --password=$MYSQL_ROOT_PASSWORD --execute=" \
    CREATE USER '$HEALTHCHECK_USERNAME'@'localhost' IDENTIFIED WITH mysql_native_password BY '$HEALTHCHECK_PASSWORD'; \
  "
  echo ...healthcheck account created
}

create_backup_account() {
  echo Creating backup account...
  mysql --user=root --password=$MYSQL_ROOT_PASSWORD --execute=" \
    CREATE USER '$BACKUP_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$BACKUP_PASSWORD'; \
    GRANT EVENT, LOCK TABLES, PROCESS, RELOAD, REPLICATION CLIENT, SELECT, SHOW VIEW, TRIGGER ON *.* TO '$BACKUP_USERNAME'@'%'; \
  "
  echo ...backup account created
}
