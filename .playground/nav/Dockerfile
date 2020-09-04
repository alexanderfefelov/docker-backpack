FROM python:3.7.9-buster AS builder

ARG NAV_VERSION

RUN  apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       libldap2-dev \
       libsasl2-dev \
  && git clone https://github.com/Uninett/nav.git --branch ${NAV_VERSION} --depth 1 \
  && pip3 wheel --requirement /nav/requirements.txt --wheel-dir /.wheels \
  && pip3 install --root /.build /nav \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --recursive --force /.build/usr/local/python/nav/web

FROM python:3.7.9-slim-buster

ARG NAV_VERSION

ENV TINI_VERSION 0.19.0
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-amd64 /usr/sbin/tini
RUN chmod +x /usr/sbin/tini

COPY container/ /
COPY --from=builder /nav/requirements/ /requirements/
COPY --from=builder /nav/requirements.txt /
COPY --from=builder /.wheels/ /.wheels/
COPY --from=builder /.build/ /

RUN  apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       apache2 \
       cron \
       libapache2-mod-wsgi-py3 \
       libjpeg62-turbo \
       libopenjp2-7 \
       libpq5 \
       libsnmp30 \
       libtiff5 \
       nbtscan \
       postgresql-client \
       python3-gammu \
       supervisor \
  && pip3 install --requirement /requirements.txt --find-links=/.wheels --no-index \
  && adduser --system --group --home=/usr/local/nav nav \
  && cat /etc/nav/cron.d/* | crontab -u nav - \
  && mkdir --parents \
       /usr/local/share/nav/www \
       /var/lib/nav/uploads \
       /var/log/cron \
       /var/run/nav \
  && chown nav /var/run/nav \
  && ln --symbolic /usr/local/lib/python3.7/site-packages/nav/web/static /usr/local/share/nav/www/static \
  && a2enconf server-name \
  && a2dissite 000-default \
  && a2ensite nav \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --recursive --force \
       /.wheels \
       /requirements \
  && rm --force /requirements.txt

ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
CMD ["supervisord", "--nodaemon"]
