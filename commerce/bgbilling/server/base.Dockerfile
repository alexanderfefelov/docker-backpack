FROM adoptopenjdk/openjdk15:x86_64-ubuntu-jdk-15.0.2_7

ARG RELEASE
ARG SET
ARG COMPONENTS

ENV APP_HOME=/BGBillingServer

COPY build/download-bgbilling-component.sh /

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
       curl `# For health checks` \
       locales \
       netcat `# For health checks` \
       unzip \
       wget \
  && SERVER_STUFF=$(/download-bgbilling-component.sh BGBillingServer $RELEASE $SET) \
  && unzip -qq $SERVER_STUFF \
  && KERNEL_STUFF=$(/download-bgbilling-component.sh kernel $RELEASE $SET) \
  && unzip -qq -o $KERNEL_STUFF -d $APP_HOME \
  && UPDATE_LIB_STUFF=$(/download-bgbilling-component.sh updateLib $RELEASE $SET) \
  && unzip -qq -o $UPDATE_LIB_STUFF -d $APP_HOME \
  && KERNEL_WEB_STUFF=$(/download-bgbilling-component.sh kernelWeb $RELEASE $SET) \
  && unzip -qq -o $KERNEL_WEB_STUFF -d $APP_HOME \
  && echo 0 | $APP_HOME/bin/bg_installer.sh \
  && for component in $COMPONENTS; do \
       echo -n Installing $component...; \
       stuff=$(/download-bgbilling-component.sh $component $RELEASE $SET); \
       unzip -qq $stuff -d $APP_HOME; \
       rm --force $stuff; \
       echo done; \
     done \
  && apt-get -qq clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm --force $SERVER_STUFF dump.sql \
  && rm --force $KERNEL_STUFF \
  && rm --force $UPDATE_LIB_STUFF \
  && rm --force $KERNEL_WEB_STUFF \
  && rm --force download-bgbilling-component.sh

RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8
# https://www.gnu.org/software/libc/manual/html_node/Locale-Categories.html
ENV \
#  LC_COLLATE=C \
#  LC_CTYPE=C \
#  LC_MONETARY=C \
#  LC_NUMERIC=C \
#  LC_TIME=C \
#  LC_MESSAGES=C \
#  LC_ALL=C \
  LANG=ru_RU.utf8

WORKDIR $APP_HOME
