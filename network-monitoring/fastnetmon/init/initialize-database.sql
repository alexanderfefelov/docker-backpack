CREATE DATABASE $DB_DATABASE;
USE $DB_DATABASE;
CREATE TABLE fact(
  id         INT         NOT NULL AUTO_INCREMENT,
  uuid       CHAR(36)    NOT NULL UNIQUE,
  created_at DATETIME    NOT NULL DEFAULT NOW(),
  actor      VARCHAR(128) NOT NULL,
  action     VARCHAR(32) NOT NULL,
  victim     INT         NOT NULL,
  direction  VARCHAR(16) NOT NULL,
  pps        INT         NOT NULL,
  details    MEDIUMTEXT  NOT NULL,
  PRIMARY KEY (id),
  KEY idx_fact_001 (created_at),
  KEY idx_fact_002 (actor),
  KEY idx_fact_003 (action),
  KEY idx_fact_004 (victim),
  KEY idx_fact_005 (direction)
);
CREATE USER IF NOT EXISTS '$DB_USERNAME'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_PASSWORD';
GRANT INSERT ON $DB_DATABASE.fact TO '$DB_USERNAME'@'%';
