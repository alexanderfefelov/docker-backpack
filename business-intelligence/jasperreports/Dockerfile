FROM tomcat:9.0.45

ARG VERSION
ARG JASPERREPORTS_STUFF=TIB_js-jrs-cp_${VERSION}_bin.zip

ENV ks=/etc/jasperserver/keystore
ENV ksp=$ks

WORKDIR /

RUN wget --quiet https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20edition%20$VERSION/$JASPERREPORTS_STUFF \
  && unzip --qq $JASPERREPORTS_STUFF \
  && rm --force /$JASPERREPORTS_STUFF \
  && mv jasperreports-server-cp-$VERSION-bin dist

COPY container/ /

RUN mkdir --parents $ks $ksp \
  && cd dist/buildomatic \
  && echo y | ./js-ant deploy-webapp-ce

WORKDIR $CATALINA_HOME
