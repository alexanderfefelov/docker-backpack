FROM quay.io/alexanderfefelov/mysql-replication:8.0.22

ENV \
  HEALTHCHECK_USERNAME=healthcheck \
  HEALTHCHECK_PASSWORD=password \
  BACKUP_USERNAME=backup \
  BACKUP_PASSWORD=password \
  TELEGRAF_USERNAME=telegraf \
  TELEGRAF_PASSWORD=password

ADD container/ /
