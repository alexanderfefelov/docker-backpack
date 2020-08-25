FROM postgres:12.4

ENV \
  HEALTHCHECK_USERNAME=healthcheck \
  HEALTHCHECK_PASSWORD=password \
  TELEGRAF_USERNAME=telegraf \
  TELEGRAF_PASSWORD=password

ADD container/ /

RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8
# https://www.gnu.org/software/libc/manual/html_node/Locale-Categories.html
ENV \
#  LC_COLLATE=C \
#  LC_CTYPE=C \
#  LC_MONETARY=C \
#  LC_NUMERIC=C \
#  LC_TIME=C \
  LC_MESSAGES=C \
#  LC_ALL=C \
  LANG=ru_RU.utf8