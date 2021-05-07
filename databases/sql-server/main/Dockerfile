ARG VERSION

FROM mcr.microsoft.com/mssql/server:$VERSION

COPY container/ /

USER root

RUN mkdir --parents \
      /var/opt/mssql/data \
      /var/opt/mssql/log \
      /var/opt/mssql/secrets \
  && chown --recursive mssql /var/opt/mssql

USER mssql
