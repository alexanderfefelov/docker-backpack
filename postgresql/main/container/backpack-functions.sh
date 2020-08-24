create_healthcheck_account() {
  echo Creating healthcheck account...
  PGPASSWORD=$POSTGRES_PASSWORD psql --username=$POSTGRES_USER --command=" \
    CREATE USER $HEALTHCHECK_USERNAME PASSWORD '$HEALTHCHECK_PASSWORD'; \
  " $POSTGRES_DB
  echo ...healthcheck account created
}
