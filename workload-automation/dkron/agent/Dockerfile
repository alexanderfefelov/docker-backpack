FROM ubuntu:20.04

RUN apt-get -qq update

# General purpose packages
#
RUN DEBIAN_FRONTEND=noninteractive apt-get -qq install --no-install-recommends \
      apache2-utils \
      ca-certificates \
      certbot \
      cifs-utils \
      curl \
      expect \
      git git-lfs \
      jq \
      libtext-lorem-perl \
      netcat \
      openssh-client \
      petname \
      pwgen \
      python3 \
      python3-pip \
      rsync \
      sshpass \
      subversion \
      telnet \
      tzdata \
      uuid-runtime \
      whois
RUN pip3 --quiet install \
      httpie \
      napalm \
      rotate-backups

# MySQL
#
RUN apt-get -qq install --no-install-recommends \
      mysql-client \
      mydumper

# PostgreSQL
#
RUN apt-get -qq install --no-install-recommends \
      postgresql-client

# InfluxDB
#
RUN apt-get -qq install --no-install-recommends \
      influxdb-client

# MongoDB
#
RUN apt-get -qq install --no-install-recommends \
      mongodb-clients

# Redis
#
RUN apt-get -qq install --no-install-recommends \
      redis-tools

# Python
#
RUN apt-get -qq install --no-install-recommends \
      python3-click \
      python3-docker \
      python3-elasticsearch \
      python3-fabric \
      python3-graphite2 \
      python3-influxdb \
      python3-jinja2 \
      python3-librouteros \
      python3-netmiko \
      python3-paramiko \
      python3-prometheus-client \
      python3-psycopg2 \
      python3-pymysql \
      python3-pysnmp4 \
      python3-redis \
      python3-requests \
      python3-sqlalchemy \
      python3-stomp

# Lua
#
RUN apt-get -qq install --no-install-recommends \
      lua5.3

# Tcl
#
RUN apt-get -qq install --no-install-recommends \
      tcl \
      tcl8.6-tdbc \
      tcl8.6-tdbc-mysql \
      tcl8.6-tdbc-postgres \
      tcl8.6-tdbc-sqlite3

# Cleanup
#
RUN apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Dkron
#
ARG VERSION
ARG DKRON_STUFF=dkron_${VERSION}_linux_amd64.tar.gz
ENV DKRON_HOME=/dkron
ADD https://github.com/distribworks/dkron/releases/download/v$VERSION/$DKRON_STUFF /
RUN mkdir --parents $DKRON_HOME \
  && tar --extract --gzip --file=$DKRON_STUFF --directory=$DKRON_HOME \
  && mkdir --parents /var/lib/dkron/data \
  && mkdir --parents /var/log/dkron \
  && rm --force /$DKRON_STUFF

COPY container/ /

ARG TINI_VERSION=0.19.0
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-amd64 /usr/sbin/tini
RUN chmod +x /usr/sbin/tini

ENTRYPOINT ["tini", "--", "/dkron/dkron"]
CMD ["--help"]
