ARG VERSION

FROM quay.io/alexanderfefelov/kkmserver:$VERSION

COPY container/ /

RUN mv /healthcheck.sh /backpack-healthcheck.sh
