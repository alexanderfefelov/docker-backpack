USE $DB_DATABASE;

-- http://docs.killbill.io/latest/database_migrations.html

CREATE TABLE `schema_version` (
  `installed_rank` INT(11)       NOT NULL,
  `version`        VARCHAR(50)   DEFAULT NULL,
  `description`    VARCHAR(200)  NOT NULL,
  `type`           VARCHAR(20)   NOT NULL,
  `script`         VARCHAR(1000) NOT NULL,
  `checksum`       INT(11)       DEFAULT NULL,
  `installed_by`   VARCHAR(100)  NOT NULL,
  `installed_on`   TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` INT(11)       NOT NULL,
  `success`        TINYINT(1)    NOT NULL,

  PRIMARY KEY (`installed_rank`),
  KEY `schema_version_s_idx` (`success`)
);

INSERT INTO `schema_version` (`installed_rank`, `version`, `description`, `type`, `script`, `installed_by`, `execution_time`, `success`) VALUES
  (1, 1, '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', 'admin', 0, 1);
