FROM adoptopenjdk/openjdk15:x86_64-ubuntu-jdk-15.0.2_7

ADD build/download-bgbilling-component.sh /

ARG RELEASE
ARG SET
ARG COMPONENTS

ENV APP_HOME=/BGBillingServer

RUN apt-get -qq update \
  && apt-get -qq install --no-install-recommends \
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
  && rm --force $KERNEL_WEB_STUFF

ADD container/ /

WORKDIR $APP_HOME
CMD ["./start-server.sh"]
