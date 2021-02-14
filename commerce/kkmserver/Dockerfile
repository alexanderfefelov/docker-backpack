ARG VERSION

FROM quay.io/alexanderfefelov/kkmserver:$VERSION

ADD container/ /

RUN mv /healthcheck.sh /backpack-healthcheck.sh
