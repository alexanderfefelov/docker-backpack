create_healthcheck_account() {
  echo Creating healthcheck account...
  PGPASSWORD=$POSTGRES_PASSWORD psql --username=$POSTGRES_USER --command=" \
    CREATE USER $HEALTHCHECK_USERNAME PASSWORD '$HEALTHCHECK_PASSWORD'; \
  " $POSTGRES_DB
  echo ...healthcheck account created
}

create_telegraf_account() {
  echo Creating telegraf account...
  PGPASSWORD=$POSTGRES_PASSWORD psql --username=$POSTGRES_USER --command=" \
    CREATE USER $TELEGRAF_USERNAME PASSWORD '$TELEGRAF_PASSWORD'; \
  " $POSTGRES_DB
  echo ...healthcheck account created
}
