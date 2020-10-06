FROM alexanderfefelov/cubesviewer-server

ADD container/ /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       default-libmysqlclient-dev \
       gcc \
       > /dev/null \
  && pip --quiet install \
       mysql-python \
  && mv /healthcheck.sh /backpack-healthcheck.sh \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*
