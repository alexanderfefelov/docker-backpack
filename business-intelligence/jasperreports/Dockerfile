FROM tomcat:9.0.43

ARG VERSION
ARG JASPERREPORTS_STUFF=TIB_js-jrs-cp_${VERSION}_bin.zip

WORKDIR /

RUN wget --quiet https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20edition%20$VERSION/$JASPERREPORTS_STUFF \
  && unzip --qq $JASPERREPORTS_STUFF \
  && mv jasperreports-server-cp-$VERSION-bin dist

COPY container/ /

RUN cd dist/buildomatic \
  && BUILDOMATIC_ENV=dev ./js-ant deploy-webapp-ce \
  && cd / \
  && rm --force $JASPERREPORTS_STUFF \
  && rm --recursive --force dist

WORKDIR $CATALINA_HOME
