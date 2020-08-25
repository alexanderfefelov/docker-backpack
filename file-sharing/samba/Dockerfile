FROM ubuntu:20.04

ARG SAMBA_USERNAME=samba
ARG SAMBA_PASSWORD=password
ARG SAMBA_GID=128
ARG SAMBA_GROUP=sambashare

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       netcat `# For health checks` \
       samba \
  && groupadd --force --gid $SAMBA_GID $SAMBA_GROUP \
  && useradd $SAMBA_USERNAME --password $SAMBA_PASSWORD --groups $SAMBA_GROUP --shell /usr/sbin/nologin --no-create-home \
  && mkdir --parents \
       /var/lib/samba/data/share \
  && chown -R $SAMBA_USERNAME:$SAMBA_GROUP /var/lib/samba/data \
  && (echo $SAMBA_PASSWORD; echo $SAMBA_PASSWORD) | smbpasswd -s -a $SAMBA_USERNAME \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD container/ /

ENTRYPOINT ["smbd", "--foreground", "--no-process-group"]
