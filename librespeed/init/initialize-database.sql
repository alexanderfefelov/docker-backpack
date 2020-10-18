CREATE DATABASE $DB_DATABASE;
USE $DB_DATABASE;
CREATE TABLE speedtest_users( -- Based on https://github.com/librespeed/speedtest-go/blob/master/database/mysql/telemetry_mysql.sql
  id        int(11)     NOT NULL AUTO_INCREMENT,
  timestamp timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ip        varchar(15) NOT NULL,
  ispinfo   text,
  extra     text,
  ua        text,
  lang      tinytext,
  dl        float       NOT NULL,
  ul        float       NOT NULL,
  ping      float       NOT NULL,
  jitter    float       NOT NULL,
  log       text,
  uuid      tinytext    NOT NULL,
  PRIMARY KEY (id),
  KEY idx_speedtest_users_001 (ip)
);
CREATE USER IF NOT EXISTS '$DB_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_PASSWORD';
GRANT INSERT, SELECT ON $DB_DATABASE.speedtest_users TO '$DB_USERNAME'@'%';
