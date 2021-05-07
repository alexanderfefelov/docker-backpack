FROM python:3.7.9-buster AS builder

ARG VERSION
ARG ADD_ONS_VERSION
ARG IMAGE_NAME

LABEL $IMAGE_NAME-stage=builder

ENV NAV_HOME=/.build/usr/local/lib/python3.7/site-packages/nav

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       libldap2-dev \
       libsasl2-dev \
       patch \
  && git clone https://github.com/Uninett/nav.git --branch ${VERSION} \
  && ( \
       cd nav; \
       git log -5 > /nav.latest_changes \
     ) \
  && pip3 --quiet wheel --requirement /nav/requirements.txt --wheel-dir /.wheels \
  && pip3 --quiet install --root /.build /nav \
  && git clone https://github.com/alexanderfefelov/nav-add-ons.git \
  && ( \
       cd nav-add-ons; \
       git checkout $ADD_ONS_VERSION; \
       git log -5 > /nav-add-ons.latest_changes \
     ) \
  && cp --recursive --no-target-directory /nav-add-ons/snmp/nav $NAV_HOME \
  && /nav-add-ons/snmp/patches/apply-patches.sh \
  && /nav-add-ons/web/patches/apply-patches.sh \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --recursive --force /.build/usr/local/python

FROM python:3.7.9-slim-buster AS target

ARG TINI_VERSION=0.19.0
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-amd64 /usr/sbin/tini
RUN chmod +x /usr/sbin/tini

COPY --from=builder /nav/requirements/ /requirements/
COPY --from=builder /nav/requirements.txt /
COPY --from=builder /.wheels/ /.wheels/
COPY --from=builder /.build/ /

COPY --from=builder /nav/python/nav/etc/ /etc/nav/
COPY --from=builder /nav-add-ons/web/etc/nav/ /etc/nav/
COPY container/target/ /
COPY --from=builder /*.latest_changes /etc/nav/templates/

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       apache2 \
       cron \
       curl `# For health checks` \
       dhcping \
       exim4 \
       libapache2-mod-wsgi-py3 \
       libjpeg62-turbo \
       libopenjp2-7 \
       libpq5 \
       libsnmp30 \
       libtiff5 \
       nbtscan \
       netcat `# For health checks` \
       postgresql-client \
       python3-gammu \
       python3-requests \
       rsyslog \
       supervisor \
  && chmod +s /usr/sbin/dhcping \
  && pip3 --quiet install --requirement /requirements.txt --find-links=/.wheels --no-index \
  && adduser --system --group nav \
  && /start-cron-services.py \
  && mkdir --parents \
       /usr/local/share/nav/www \
       /var/lib/nav/uploads/images/locations \
       /var/lib/nav/uploads/images/rooms \
       /var/log/cron \
       /var/log/nav \
       /var/run/nav \
  && chown --recursive nav \
       /var/lib/nav \
       /var/log/cron \
       /var/log/nav \
       /var/run/nav \
  && ln --symbolic /usr/local/lib/python3.7/site-packages/nav/web/static /usr/local/share/nav/www/static \
  && a2enconf server-info \
  && a2enconf server-name \
  && a2dissite 000-default \
  && a2ensite nav \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --recursive --force \
       /.wheels \
       /requirements \
  && rm --force /requirements.txt

ENTRYPOINT ["tini", "--", "/backpack-entrypoint.sh"]
CMD ["supervisord", "--nodaemon"]
