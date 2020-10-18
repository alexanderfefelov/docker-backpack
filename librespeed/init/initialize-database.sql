CREATE DATABASE $DB_DATABASE;
USE $DB_DATABASE;
CREATE TABLE speedtest_users( -- https://github.com/librespeed/speedtest-go/blob/master/database/mysql/telemetry_mysql.sql
  id        int(11)   NOT NULL AUTO_INCREMENT,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ip        text      NOT NULL,
  ispinfo   text,
  extra     text,
  ua        text      NOT NULL,
  lang      text      NOT NULL,
  dl        text,
  ul        text,
  ping      text,
  jitter    text,
  log       longtext,
  uuid      text,
  PRIMARY KEY (id)
);
CREATE USER IF NOT EXISTS '$DB_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_PASSWORD';
GRANT INSERT, SELECT ON $DB_DATABASE.speedtest_users TO '$DB_USERNAME'@'%';
