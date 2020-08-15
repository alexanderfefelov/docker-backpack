create_healthcheck_user() {
  echo Creating healthcheck user
  mysql --user=root --password=$MYSQL_ROOT_PASSWORD --execute=" \
    CREATE USER 'healthcheck_tutedojobu'@'localhost' IDENTIFIED WITH mysql_native_password BY 'adqafzubjutk'; \
  "
}

create_backup_user() {
  echo Creating backup user
  mysql --user=root --password=$MYSQL_ROOT_PASSWORD --execute=" \
    CREATE USER 'backup_letocryloite'@'%' IDENTIFIED WITH mysql_native_password BY 'almatramushi'; \
    GRANT EVENT, LOCK TABLES, PROCESS, RELOAD, REPLICATION CLIENT, SELECT, SHOW VIEW, TRIGGER ON *.* TO 'backup_letocryloite'@'%'; \
  "
}
