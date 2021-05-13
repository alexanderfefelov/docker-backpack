CREATE DATABASE bgbilling DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bgbilling;
SET collation_connection = utf8mb4_unicode_ci;
CREATE TABLE `status_log` (
  `from_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `to_date` datetime DEFAULT NULL,
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `mid` int(10) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(4) DEFAULT NULL,
  `uid` tinyint(4) NOT NULL DEFAULT 0,
  `comment` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `main_from_index` (`from_date`,`cid`,`mid`),
  UNIQUE KEY `main_to_index` (`to_date`,`cid`,`mid`),
  KEY `from_date_index` (`from_date`),
  KEY `to_date_index` (`to_date`),
  KEY `cid_index` (`cid`)
);
CREATE TABLE `periodic_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marker` varchar(250) NOT NULL,
  `calc_date` date DEFAULT NULL,
  `subject` varchar(250) NOT NULL,
  `text` mediumtext DEFAULT NULL,
  `reg_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `domain` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `parentId` INT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `comment` TEXT NOT NULL,
  PRIMARY KEY (`id`));CREATE TABLE `register_group_task_type` (
  `gid` int(11) NOT NULL DEFAULT 0,
  `type_id` int(11) NOT NULL DEFAULT 0,
  KEY `gid` (`gid`)
);
CREATE TABLE `customer` (  
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `data` JSON NOT NULL,
    PRIMARY KEY (`id`)
);CREATE TABLE `customer_link` (
  `customer_id` int(10) unsigned NOT NULL,
  `contract_id` int(10) unsigned NOT NULL,
  `date_from` datetime NOT NULL,
  `date_to` datetime DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `contract_id` (`contract_id`),
  KEY `date_from` (`date_from`),
  KEY `date_to` (`date_to`)
);CREATE TABLE `customer_log` (
  `customer_id` int(10) unsigned NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `field_key` varchar(255) NOT NULL,
  `field_value` varchar(255) NOT NULL,
  KEY `customer_id` (`customer_id`,`field_key`),
  KEY `update_time` (`update_time`)
);CREATE TABLE `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `mid` int(11) NOT NULL DEFAULT 0,
  `parentId` int(11) NOT NULL DEFAULT 0,
  `dateFrom` date DEFAULT NULL,
  `dateTo` date DEFAULT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `lm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isusing` tinyint(1) DEFAULT 1,
  `unit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
);
CREATE TABLE `object_param_value_list_log` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `param_id` (`param_id`,`object_id`)
);
CREATE TABLE `object_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `name_macros` varchar(250) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL,
  `ishidden` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
);
CREATE TABLE `object_param_value_list` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`param_id`,`object_id`)
);
CREATE TABLE `object_param_value_flag_log` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `value` int(2) NOT NULL DEFAULT 0,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `object_id` (`object_id`,`param_id`)
);
CREATE TABLE `object_type_param` (
  `type_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `pos` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`type_id`,`param_id`)
);
CREATE TABLE `object_param_value_date_log` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `value` date DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `param_id` (`param_id`,`object_id`)
);
CREATE TABLE `object_param_value_text_log` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `value` varchar(250) NOT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `param_id` (`param_id`,`object_id`)
);
CREATE TABLE `object_param_value_text` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `value` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`param_id`,`object_id`)
);
CREATE TABLE `object_type_module` (
  `type_id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  UNIQUE KEY `type_mid` (`mid`,`type_id`)
);
CREATE TABLE `object_list_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `param_id` (`param_id`)
);
CREATE TABLE `object_param_value_address_log` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `value` varchar(250) NOT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `object_id` (`object_id`,`param_id`)
);
CREATE TABLE `object_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `comment` varchar(255) NOT NULL,
  `flags` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
);
CREATE TABLE `object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(250) NOT NULL DEFAULT '',
  `type_id` int(11) NOT NULL DEFAULT 0,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `pos` (`pos`)
);
CREATE TABLE `object_param_value_address` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `hid` int(11) NOT NULL DEFAULT 0,
  `flat` varchar(15) NOT NULL DEFAULT '0',
  `room` varchar(20) NOT NULL DEFAULT '',
  `pod` int(11) NOT NULL DEFAULT 0,
  `floor` int(11) NOT NULL DEFAULT 0,
  `address` varchar(250) NOT NULL DEFAULT '',
  `comment` varchar(250) NOT NULL DEFAULT '',
  `format_key` varchar(50) NOT NULL,
  PRIMARY KEY (`object_id`,`param_id`) 
);
CREATE TABLE `object_param_value_flag` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `value` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`param_id`)
);
CREATE TABLE `object_param_value_date` (
  `object_id` int(11) NOT NULL DEFAULT 0,
  `param_id` int(11) NOT NULL DEFAULT 0,
  `value` date DEFAULT NULL,
  PRIMARY KEY (`param_id`,`object_id`)
);
CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(20) NOT NULL DEFAULT '',
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `source_type` tinyint(4) NOT NULL DEFAULT 0,
  `host_or_dir` varchar(250) NOT NULL,
  `user` varchar(15) NOT NULL DEFAULT '',
  `pswd` varchar(15) NOT NULL DEFAULT '',
  `config` mediumtext NOT NULL,
  `lm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `date1` (`date1`),
  KEY `date2` (`date2`)
);
CREATE TABLE `setup` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);
CREATE TABLE `script_lib` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `script` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
);
CREATE TABLE `global_script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `script` mediumtext DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
);
CREATE TABLE `script_classes` (
  `name` varchar(255) NOT NULL,
  `last_mod` bigint(20) NOT NULL,
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`name`)
);
CREATE TABLE `script_function_event_type` (
  `fid` int(11) NOT NULL DEFAULT 0,
  `mid` varchar(100) NOT NULL,
  `event_id` varchar(255) NOT NULL DEFAULT '0',
  KEY `fid` (`fid`)
);
CREATE TABLE `script_classes_ifaces` (
  `name` varchar(255) NOT NULL,
  `iface` varchar(255) NOT NULL,
  PRIMARY KEY (`name`,`iface`) 
);
CREATE TABLE `script_custom_template` (
	`id` INT auto_increment NOT NULL,
	`title` varchar(100) NULL,
	`create_date` datetime NULL,
	`date_last_mod` datetime NULL,
	`user_id` INT NOT NULL,
	`template_data` TEXT NULL,
	`comment` varchar(256) NULL,
	`extension` varchar(24) NULL,
	PRIMARY KEY (`id`)
);
CREATE TABLE `script_event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(100) NOT NULL,
  `event_mode` tinyint(4) NOT NULL DEFAULT 1,
  `event_id` varchar(255) NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mid_event` (`mid`,`event_id`)
);
CREATE TABLE `script_event_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` longblob NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `script_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `script_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) NOT NULL DEFAULT '',
  `code` mediumtext DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `script_id` (`script_id`)
);
CREATE TABLE `script_backup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `script_id` int(11) NOT NULL,
  `script` mediumtext DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `change_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comment` varchar(255) DEFAULT '',
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `script_type` (`script_id`,`type`)
);
CREATE TABLE `event_script_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `event_key` varchar(255) NOT NULL,
  `script_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);
CREATE TABLE `global_script_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `payment_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `pt` int(11) NOT NULL DEFAULT 0,
  `load_time` datetime DEFAULT NULL,
  `count` int(3) NOT NULL DEFAULT 0,
  `errorCount` int(11) NOT NULL DEFAULT 0,
  `summa` decimal(10,2) NOT NULL DEFAULT 0.00,
  `processed` tinyint(2) NOT NULL DEFAULT 0,
  `process_time` datetime DEFAULT NULL,
  `load_log` mediumtext NOT NULL,
  `ptitle` varchar(50) NOT NULL,
  `regtype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `date` (`date`)
);
CREATE TABLE `inv_product_spec_service_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productSpecId` int(11) NOT NULL,
  `serviceSpecId` int(11) NOT NULL,
  `dateFrom` date DEFAULT NULL,
  `dateTo` date DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product` (`productSpecId`),
  KEY `service` (`serviceSpecId`)
);
CREATE TABLE `inv_product_period` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contractId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `productSpecId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `activationTime` datetime NOT NULL,
  `timeFrom` datetime NOT NULL,
  `timeTo` datetime DEFAULT NULL,
  `prolongationTime` datetime NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `version` int(11) NOT NULL DEFAULT 0,
  KEY `id` (`id`),
  KEY `contract` (`contractId`),
  KEY `account` (`accountId`),
  KEY `product` (`productId`),
  KEY `period` (`timeFrom`,`timeTo`)
)
 PARTITION BY HASH (`contractId`)
PARTITIONS 8;
CREATE TABLE `inv_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `productSpecId` int(11) NOT NULL,
  `timeFrom` datetime NOT NULL,
  `timeTo` datetime DEFAULT NULL,
  `activationModeId` int(11) NOT NULL,
  `activationTime` datetime NOT NULL,
  `activationPrice` decimal(10,5) DEFAULT NULL,
  `deactivationTime` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `deviceProductId` varchar(100) DEFAULT NULL,
  `deviceState` tinyint(4) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `contract` (`contractId`)
);
CREATE TABLE `inv_service_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `parentId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `dateFrom` date DEFAULT NULL,
  `dateTo` date DEFAULT NULL,
  `comment` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `moduleId` (`moduleId`),
  KEY `date` (`dateFrom`,`dateTo`),
  KEY `parent` (`parentId`),
  KEY `entity` (`entityId`)
);
CREATE TABLE `inv_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contractId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `serviceSpecId` int(11) NOT NULL,
  `timeFrom` datetime NOT NULL,
  `timeTo` datetime DEFAULT NULL,
  `deviceState` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`,`contractId`),
  KEY `contractId` (`contractId`),
  KEY `accountId` (`accountId`),
  KEY `productId` (`productId`),
  KEY `serviceSpecId` (`serviceSpecId`)
)
 PARTITION BY HASH (`contractId`)
PARTITIONS 16;
CREATE TABLE `inv_product_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entityId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL,
  `parentId` int(11) NOT NULL,
  `periodic` tinyint(4) NOT NULL DEFAULT 1,
  `notRealtime` tinyint(4) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `tariffIds` varchar(255) DEFAULT NULL,
  `contractGroups` varchar(255) DEFAULT NULL,
  `depends` varchar(255) DEFAULT NULL,
  `incompatible` varchar(255) DEFAULT NULL,
  `activationModeIds` varchar(255) DEFAULT NULL,
  `dateFrom` date DEFAULT NULL,
  `dateTo` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `hideForCustomer` tinyint(4) NOT NULL,
  `hideForContractGroups` bigint(20) NOT NULL DEFAULT 0,
  `hideForContractGroupsMode` tinyint(4) NOT NULL DEFAULT 0,
  `activationByCustomer` tinyint(4) NOT NULL,
  `deactivationByCustomer` tinyint(4) NOT NULL,
  `comment` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `moduleId` (`moduleId`),
  KEY `date` (`dateFrom`,`dateTo`),
  KEY `parent` (`parentId`),
  KEY `entity` (`entityId`)
);
CREATE TABLE `inv_product_spec_activation_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productSpecId` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `dateFrom` date DEFAULT NULL,
  `dateTo` date DEFAULT NULL,
  `periodMode` int(11) NOT NULL,
  `periodAmount` int(11) NOT NULL,
  `deactivationMode` int(11) NOT NULL,
  `reactivationMode` int(11) NOT NULL,
  `chargeTypeId` int(11) NOT NULL,
  `chargeAmount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productSpec` (`productSpecId`),
  KEY `period` (`dateFrom`,`dateTo`)
);
CREATE TABLE `mail_list_message` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(255) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `mail_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '0',
  `flag` int(1) unsigned DEFAULT 0,
  `type` tinyint(1) unsigned DEFAULT 0,
  `up` int(11) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `up` (`up`)
);
CREATE TABLE `mail_temp` (
  `id` int(11) NOT NULL DEFAULT 0,
  `eid` int(11) DEFAULT NULL,
  `dt` datetime DEFAULT NULL
);
CREATE TABLE `installed_modules` (
  `name` varchar(100) DEFAULT '0',
  `title` varchar(200) DEFAULT '0',
  `version` varchar(20) DEFAULT '0',
  `pack_server` varchar(200) DEFAULT '0',
  `pack_client` varchar(200) DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '0',
  `client_zip` longblob NOT NULL,
  `init` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `uninstall` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
);
CREATE TABLE `module_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(3) unsigned DEFAULT 0,
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(150) NOT NULL DEFAULT '0',
  `active` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `uid` int(11) unsigned DEFAULT 0,
  `config` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid_active` (`mid`,`active`)
);
CREATE TABLE `module_tariff_tree` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mid` int(10) NOT NULL DEFAULT 0,
  `tree_id` int(10) NOT NULL DEFAULT 0,
  `parent_tree` int(10) NOT NULL DEFAULT 0,
  `lm` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tree_id` (`tree_id`),
  KEY `mid_tree` (`mid`,`tree_id`)
);
CREATE TABLE `module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `name` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
);
CREATE TABLE `scheduled_periodic_run` (
  `description` mediumtext DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
);
CREATE TABLE `task_load` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(200) NOT NULL DEFAULT '',
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `param` int(10) unsigned NOT NULL DEFAULT 0,
  `count` int(10) unsigned NOT NULL DEFAULT 0,
  `le` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `le` (`le`)
);
CREATE TABLE `scheduled_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `start` bigint(20) NOT NULL,
  `finish` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY(`start`),
  KEY(`task_id`,`start`)
);
CREATE TABLE `scheduled_task_run` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `executed` tinyint(2) DEFAULT 0,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `scheduled_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `class` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `task_proccess` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `title` char(200) NOT NULL DEFAULT '',
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `param` int(11) NOT NULL DEFAULT 0,
  `start_process_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spt` (`start_process_time`)
);
CREATE TABLE `scheduled_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mm` bigint(20) NOT NULL DEFAULT 0,
  `dm` int(11) NOT NULL DEFAULT 0,
  `dw` tinyint(4) NOT NULL DEFAULT 0,
  `hh` int(10) NOT NULL DEFAULT 0,
  `min` bigint(20) NOT NULL DEFAULT 0,
  `prior` int(11) NOT NULL DEFAULT 0,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `class_id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `params` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `bgs_user_action` (
  `uid` int(11) NOT NULL DEFAULT 0,
  `mid` varchar(10) NOT NULL,
  `aid` int(11) NOT NULL DEFAULT 0,
  KEY `uid` (`uid`)
);
CREATE TABLE `bgs_group_action` (
  `gid` int(11) NOT NULL DEFAULT 0,
  `mid` varchar(10) NOT NULL,
  `aid` int(11) NOT NULL DEFAULT 0,
  KEY `gid` (`gid`)
);
CREATE TABLE `bgs_group_menu` (
  `gid` int(11) NOT NULL,
  `menu_id` varchar(50) NOT NULL,
  `hidden` tinyint(2) NOT NULL,
  PRIMARY KEY (`gid`,`menu_id`)
);
CREATE TABLE `bgs_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `comment` varchar(250) NOT NULL DEFAULT '',
  `cgr` bigint(20) NOT NULL DEFAULT 0,
  `pids` varchar(120) DEFAULT NULL,
  `opids` varchar(255) DEFAULT NULL,
  `cgr_mode` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
);
CREATE TABLE `bgs_module_action` (
  `module` varchar(100) NOT NULL DEFAULT '',
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`module`)
);
CREATE TABLE `bgs_user_group` (
  `uid` int(11) NOT NULL DEFAULT 0,
  `gid` int(11) NOT NULL DEFAULT 0,
  KEY `uid` (`uid`),
  KEY `gid` (`gid`)
);
CREATE TABLE `updater_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_class` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  `run_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);CREATE TABLE `updater_task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT 0,
  `run_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `data` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);CREATE TABLE `time_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `plugin_config` (
  `pid` int(11) NOT NULL,
  `config` mediumtext DEFAULT NULL,
  PRIMARY KEY (`pid`) 
);
CREATE TABLE `sequential_ids` (
  `mid` varchar(8) NOT NULL COMMENT 'ид модуля/плагина',
  `value` bigint(20) NOT NULL COMMENT 'значение идентификатора',
  PRIMARY KEY (`mid`)
);
CREATE TABLE `entity_attr_house` (
  `entityId` int(11) NOT NULL,
  `entitySpecAttrId` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`entityId`,`entitySpecAttrId`) 
);
CREATE TABLE `entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entitySpecId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `entity_attr_int` (
  `entityId` int(11) NOT NULL,
  `entitySpecAttrId` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`entityId`,`entitySpecAttrId`) 
);
CREATE TABLE `entity_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `entitySpecTypeId` int(11) NOT NULL,
  `comment` mediumtext NOT NULL,
  `hidden` int(11) NOT NULL DEFAULT 0,
  `entityTitleMacros` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `entity_type_id` (`entitySpecTypeId`)
);
CREATE TABLE `entity_attr_list` (
  `entityId` int(11) NOT NULL,
  `entitySpecAttrId` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`entityId`,`entitySpecAttrId`) 
);
CREATE TABLE `entity_spec_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `comment` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `entity_attr_text` (
  `entityId` int(11) NOT NULL,
  `entitySpecAttrId` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`entityId`,`entitySpecAttrId`) 
);
CREATE TABLE `entity_spec_attr_link` (
  `entitySpecId` int(11) NOT NULL,
  `entitySpecAttrId` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  KEY `entity_spec_id` (`entitySpecId`)
);
CREATE TABLE `entity_attr_address` (
  `entityId` int(11) NOT NULL,
  `entitySpecAttrId` int(11) NOT NULL,
  `houseId` int(10) unsigned DEFAULT NULL,
  `flat` varchar(10) DEFAULT NULL,
  `room` varchar(5) NOT NULL DEFAULT '',
  `pod` int(10) DEFAULT 0,
  `floor` int(10) DEFAULT 0,
  `value` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `format_key` varchar(45) DEFAULT '',
  PRIMARY KEY (`entityId`,`entitySpecAttrId`) 
);
CREATE TABLE `entity_spec_attr_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entitySpecAttrId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entity_spec_attr_id` (`entitySpecAttrId`)
);
CREATE TABLE `entity_spec_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `entity_attr_date` (
  `entityId` int(11) NOT NULL,
  `entitySpecAttrId` int(11) NOT NULL,
  `value` date NOT NULL,
  PRIMARY KEY (`entityId`,`entitySpecAttrId`) 
);
CREATE TABLE `log_login_pswd` (
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uid` int(11) NOT NULL DEFAULT 0,
  `mid` int(11) NOT NULL DEFAULT 0,
  `lid` int(11) NOT NULL DEFAULT 0,
  KEY `lid_mid` (`lid`,`mid`)
);
CREATE TABLE `user_group_member` (
  `user_id` smallint(3) unsigned DEFAULT 0,
  `gr_code` smallint(3) unsigned DEFAULT 0,
  KEY `user_id` (`user_id`,`gr_code`)
);
CREATE TABLE `user_tables` (
  `userId` int(11) DEFAULT NULL,
  `table_module` varchar(100) DEFAULT NULL,
  `table_id` varchar(100) DEFAULT NULL,
  `widths` mediumtext DEFAULT NULL,
  `positions` mediumtext DEFAULT NULL,
  `hiddens` mediumtext DEFAULT NULL,
  KEY `userId` (`userId`),
  KEY `table_module` (`table_module`)
);
CREATE TABLE `user_module_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` char(30) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT 0,
  `action` char(40) NOT NULL DEFAULT '0',
  `description` char(120) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `module_action` (`module`,`action`)
);
CREATE TABLE `user_group_access` (
  `gr_code` smallint(3) unsigned NOT NULL DEFAULT 0,
  `ma_id` smallint(3) unsigned NOT NULL DEFAULT 0,
  KEY `gr_code` (`gr_code`,`ma_id`)
);
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` char(15) NOT NULL DEFAULT '',
  `name` char(50) NOT NULL DEFAULT '',
  `email` char(50) NOT NULL,
  `descr` char(255) NOT NULL DEFAULT '',
  `pswd` char(32) DEFAULT NULL,
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gr` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `cgr` bigint(20) NOT NULL DEFAULT 0,
  `pids` varchar(120) DEFAULT NULL,
  `opids` varchar(255) DEFAULT NULL,
  `contract_pid` int(11) NOT NULL DEFAULT 0,
  `contract_cid` int(11) NOT NULL DEFAULT 0,
  `config` mediumtext NOT NULL,
  `crm_user_id` int(11) NOT NULL,
  `cgr_mode` tinyint(4) NOT NULL DEFAULT 1,
  `ch_pswd` tinyint(2) NOT NULL DEFAULT 0,
  `domainIds` VARCHAR(255) NOT NULL DEFAULT '',
  `personal_action` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
);CREATE TABLE `user_user_access` (
  `user_id` smallint(3) unsigned NOT NULL DEFAULT 0,
  `ma_id` smallint(3) unsigned DEFAULT 0,
  KEY `user_id_2` (`user_id`,`ma_id`)
);
CREATE TABLE `user_group` (
  `gr_code` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `gr_name` char(60) DEFAULT '0',
  PRIMARY KEY (`gr_code`)
);
CREATE TABLE `user_group_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT '',
  `module_id` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
);CREATE TABLE `user_right_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT '',
  `module_id` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `rule` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
);CREATE TABLE `user_menu` (
  `uid` int(11) NOT NULL,
  `menu_id` varchar(50) NOT NULL,
  `hidden` tinyint(2) NOT NULL,
  PRIMARY KEY (`uid`,`menu_id`)
);
CREATE TABLE `user_group_entry` (
  `gr_code` smallint(3) unsigned NOT NULL DEFAULT 0,
  `parent_gr_code` smallint(3) unsigned NOT NULL DEFAULT 0,
  KEY `gr_code` (`gr_code`,`parent_gr_code`)
);
CREATE TABLE `payment_register_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  `summa` float(10,2) NOT NULL DEFAULT 0.00,
  `pid` int(11) NOT NULL DEFAULT 0,
  `comment` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
);
CREATE TABLE `subscr_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `name` char(50) NOT NULL DEFAULT '',
  `email` char(50) NOT NULL DEFAULT '',
  `subject` char(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);
CREATE TABLE `web_request_count` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `count` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `cid` (`cid`)
);
CREATE TABLE `web_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `web_request_limit` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `lim` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
);
CREATE TABLE `address_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL DEFAULT 1,
  `title` varchar(150) NOT NULL DEFAULT '0',
  `pos` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
);
CREATE TABLE `address_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '0',
  `cityid` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`)
);
CREATE TABLE `address_quarter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '0',
  `gid` int(11) DEFAULT NULL,
  `cityid` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`)
);
CREATE TABLE `address_house` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `streetid` int(11) NOT NULL DEFAULT 0,
  `house` int(11) NOT NULL DEFAULT 0,
  `frac` varchar(30) DEFAULT NULL,
  `amount` smallint(5) NOT NULL DEFAULT 0,
  `comment` varchar(100) DEFAULT NULL,
  `areaid` int(10) NOT NULL DEFAULT 0,
  `quarterid` int(10) NOT NULL DEFAULT 0,
  `box_index` varchar(10) DEFAULT NULL,
  `dt` date DEFAULT NULL,
  `pod_diapazon` mediumtext NOT NULL DEFAULT '',
  `pod` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `HouseU` (`streetid`,`house`,`frac`)
);
CREATE TABLE `address_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `address_config` (
  `table_id` varchar(50) NOT NULL,
  `record_id` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` mediumtext NOT NULL,
  PRIMARY KEY (`table_id`,`record_id`,`key`) 
);
CREATE TABLE `address_street` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '0',
  `p_index` varchar(6) NOT NULL DEFAULT '',
  `cityid` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`)
);
CREATE TABLE `license` (
  `id` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `count` int(11) NOT NULL DEFAULT 0,
  `hash` varchar(65) NOT NULL DEFAULT '',
  `encryptData` text NOT NULL DEFAULT '',
  `plainData` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `dt` (`dt`)
);CREATE TABLE `publish_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
);CREATE TABLE `publish_event_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
);CREATE TABLE `tariff_label_link` (
  `tariff_id` int(11) NOT NULL DEFAULT 0,
  `label_id` int(11) NOT NULL DEFAULT 0,
  KEY `tariff_id` (`tariff_id`,`label_id`)
);
CREATE TABLE `mtree_node` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_node` int(10) unsigned NOT NULL DEFAULT 0,
  `mtree_id` int(10) unsigned NOT NULL DEFAULT 0,
  `type` varchar(20) NOT NULL DEFAULT '',
  `data` mediumtext NOT NULL,
  `pos` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tree_id` (`mtree_id`)
);
CREATE TABLE `tariff_tree` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_tree` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent_tree`)
);
CREATE TABLE `tariff_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `title_web` varchar(255) DEFAULT NULL,
  `lm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actual` int(11) NOT NULL DEFAULT 0,
  `gr` bigint(20) NOT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `face` tinyint(4) DEFAULT NULL,
  `tree_id` int(10) unsigned NOT NULL,
  `config` mediumtext DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `tariff_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `tm` tinyint(3) NOT NULL DEFAULT 0,
  `df` int(11) NOT NULL DEFAULT 0,
  `beh` int(11) NOT NULL DEFAULT 0,
  `pos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `tariff_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `tariff_ids` mediumtext NOT NULL,
  `comment` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `depends` varchar(255) NOT NULL DEFAULT '',
  `incompatible` varchar(255) NOT NULL DEFAULT '',
  `deactivation_mode` int(11) NOT NULL,
  `contract_groups` bigint(20) NOT NULL DEFAULT 0,
  `hideForWeb` smallint(6) NOT NULL DEFAULT 0,
  `hideForWebContractGroups` bigint(20) NOT NULL DEFAULT 0,
  `hideForWebContractGroupsMode` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);
CREATE TABLE `tariff_tree_config` (
  `module` varchar(20) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`module`)
);
CREATE TABLE `tariff_option_activate_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `charge_type_id` int(11) NOT NULL,
  `charge_summa` decimal(10,2) NOT NULL,
  `period_mode` int(11) NOT NULL,
  `period_col` int(11) NOT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `deactivation_mode` int(11) NOT NULL,
  `reactivation_mode` int(11) NOT NULL,
  `delete_mode` int(11) NOT NULL DEFAULT 0,
  `delete_charge_mode` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `option_id` (`option_id`)
);
CREATE TABLE `tariff_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);
CREATE TABLE `tariff_group_tariff` (
  `tgid` int(11) NOT NULL DEFAULT 0,
  `tpid` int(11) NOT NULL DEFAULT 0,
  `date1` date DEFAULT NULL COMMENT 'начало периода видимости тарифа в группе тарифов',
  `date2` date DEFAULT NULL COMMENT 'конец периода видимости тарифа в группе тарифов',
  `comment` VARCHAR(500) DEFAULT NULL,
  KEY `tgid` (`tgid`)
);
CREATE TABLE `contract_script` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `script_id` int(11) NOT NULL DEFAULT 0,
  `comment` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_module_config` (
  `contract_id` int(11) NOT NULL DEFAULT 0,
  `module_id` int(11) NOT NULL DEFAULT 0,
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text NOT NULL DEFAULT '',
  PRIMARY KEY (`contract_id`,`module_id`,`key`),
  KEY `module_id_key` (`module_id`,`key`)
);
CREATE TABLE `contract_parameter_type_multilist` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `val` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`,`pid`)
);
CREATE TABLE `contract_parameters_pref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pt` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(100) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT 0,
  `script` mediumtext NOT NULL,
  `flags` tinyint(3) NOT NULL DEFAULT 0,
  `lm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
);
CREATE TABLE `contract_parameter_type_4` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val1` int(11) NOT NULL DEFAULT 0,
  `val2` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `cid_pid_val1` (`cid`,`pid`,`val1`)
);
CREATE TABLE `contract_delete_time` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT 0,
  `gr` bigint(20) NOT NULL DEFAULT 0,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `params` MEDIUMTEXT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_parameter_type_3_log` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `val` varchar(255) DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_status_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `uid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(250) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `date1` date NOT NULL,
  `date2` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_logon_error` (
  `lu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cid` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `dt` datetime NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '',
  `error_code` int(11) NOT NULL,
  `request_data` mediumtext NOT NULL,
  KEY `cid_dt` (`cid`,`dt`),
  KEY `login_dt` (`login`,`dt`)
);
CREATE TABLE `contract_parameter_type_3_mail` (
  `mailid` int(11) NOT NULL DEFAULT 0,
  `eid` int(11) NOT NULL DEFAULT 0,
  KEY `mailid` (`mailid`),
  KEY `eid` (`eid`)
);
CREATE TABLE `contract_payment_types` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `up` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(2) NOT NULL DEFAULT 0,
  `flag` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `up` (`up`),
  KEY `type` (`type`),
  KEY `flag` (`flag`)
);
CREATE TABLE `contract_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date1` date NOT NULL,
  `date2` date DEFAULT NULL,
  `comment` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_pattern` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `closesumma` float NOT NULL DEFAULT 0,
  `tpid` varchar(250) NOT NULL,
  `contract_groups` bigint(20) NOT NULL DEFAULT 0,
  `mode` int(11) NOT NULL DEFAULT 0,
  `pgid` int(11) NOT NULL DEFAULT 0,
  `pfid` int(11) NOT NULL DEFAULT 0,
  `fc` tinyint(2) NOT NULL DEFAULT 0,
  `dtl` int(10) unsigned NOT NULL DEFAULT 0,
  `tgid` varchar(250) NOT NULL,
  `scrid` varchar(250) NOT NULL,
  `name_pattern` varchar(200) NOT NULL DEFAULT '',
  `data` blob,
  `patid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `domainId` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_parameter_type_7_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
);
CREATE TABLE `contract_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL DEFAULT 0,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `generate_event` tinyint(4) DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `job_id` bigint(20) DEFAULT 0,
  `lm` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `contract_id_date_from` (`contract_id`,`date_from`),
  KEY `date_to_generate_event` (`date_to`,`generate_event`)
);CREATE TABLE `contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gr` bigint(20) NOT NULL DEFAULT 0,
  `title` varchar(150) NOT NULL DEFAULT '',
  `title_pattern_id` int(11) NOT NULL DEFAULT 0,
  `pswd` varchar(32) NOT NULL DEFAULT '',
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `mode` tinyint(4) NOT NULL DEFAULT 0,
  `closesumma` decimal(10,2) NOT NULL DEFAULT 0,
  `pgid` int(11) NOT NULL DEFAULT 0,
  `pfid` int(11) NOT NULL DEFAULT 0,
  `fc` tinyint(1) NOT NULL DEFAULT 0,
  `comment` varchar(100) NOT NULL DEFAULT '',
  `del` tinyint(1) NOT NULL DEFAULT 0,
  `scid` int(11) NOT NULL DEFAULT 0,
  `sub_list` mediumtext NOT NULL DEFAULT '',
  `sub_mode` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `status_date` date DEFAULT NULL,
  `last_tariff_change` datetime DEFAULT NULL,
  `crm_customer_id` int(11) NOT NULL DEFAULT 0,
  `domainId` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `date1` (`date1`),
  KEY `title` (`title`),
  KEY `del` (`del`),
  KEY `scid` (`scid`),
  KEY `crm_customer_id` (`crm_customer_id`),
  KEY `domainId` (`domainId`)
);
CREATE TABLE `contract_pattern_modules` (
  `pid` int(11) NOT NULL,
  `mid` int(11) NOT NULL
);
CREATE TABLE `contract_tree_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL DEFAULT 0,
  `tree_id` int(10) NOT NULL DEFAULT 0,
  `title` varchar(200) NOT NULL DEFAULT '',
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `emid` int(11) NOT NULL DEFAULT 0,
  `eid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_parameter_type_7` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` int(11) NOT NULL DEFAULT 0,
  `custom_value` varchar(100) NOT NULL,
  UNIQUE KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_autopayment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL DEFAULT 0,
  `module_id` int(11) NOT NULL DEFAULT 0,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `user_from` int(11) NOT NULL DEFAULT -2,
  `user_to` int(11) NOT NULL DEFAULT -2,
  PRIMARY KEY (`id`),
  KEY `cid_mid` (`contract_id`,`module_id`)
);
CREATE TABLE `contract_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_reserve` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sum` decimal(10,2) NOT NULL,
  `dateCreate` datetime NOT NULL,
  `dateTo` datetime DEFAULT NULL,
  `dateClose` datetime DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_history_open_log` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `contract_id` int(11) NOT NULL,
  `last_open` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`contract_id`),
  KEY `user_id_last_open` (`user_id`,`last_open`),
  KEY `last_open` (`last_open`)
);
CREATE TABLE `log_contract_limit_manage_mode` (
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uid` int(11) NOT NULL DEFAULT 0,
  `mode` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_parameter_type_2` (
  `cid` int(10) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `hid` int(10) unsigned DEFAULT NULL,
  `flat` varchar(10) DEFAULT NULL,
  `room` varchar(5) NOT NULL DEFAULT '',
  `pod` int(10) DEFAULT 0,
  `floor` int(10) DEFAULT 0,
  `address` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `format_key` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`,`pid`),
  KEY `hid` (`hid`)
);
CREATE TABLE `contract_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `sid` int(10) unsigned NOT NULL DEFAULT 0,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `lm` date NOT NULL DEFAULT '0000-00-00',
  `emid` int(11) NOT NULL DEFAULT 0,
  `eid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `date1` (`date1`),
  KEY `date2` (`date2`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_account_detail` (
  `contract_id` int(10) unsigned NOT NULL DEFAULT 0,
  `service_id` int(10) unsigned NOT NULL DEFAULT 0,
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `cost` decimal(15,2) DEFAULT 0,
  `amount` decimal(10,2) DEFAULT 0,
  `sum` decimal(15,2) DEFAULT 0,
   KEY `contract_service_period` (`contract_id`,`service_id`,`date_from`,`date_to`)
);CREATE TABLE `contract_tariff_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `gid` int(11) NOT NULL DEFAULT 0,
  `comment` char(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_parameter_type_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `email` varchar(400) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_balance` (
  `yy` smallint(5) unsigned NOT NULL DEFAULT 0,
  `mm` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `summa1` decimal(10,2) NOT NULL,
  `summa2` decimal(10,2) NOT NULL,
  `summa3` decimal(10,2) NOT NULL,
  `summa4` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cid`,`yy`,`mm`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_parameter_type_5_log` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` int(2) DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  KEY `cid_pid` (`cid`,`pid`) 
);
CREATE TABLE `contract_parameter_type_1_log` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` varchar(255) DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_parameter_type_6` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` date NOT NULL,
  PRIMARY KEY (`cid`,`pid`) 
);
CREATE TABLE `contract_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `uid` int(10) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `comment` mediumtext NOT NULL,
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `visibled` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_password_once` (
  `lu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dt` datetime NOT NULL,
  `contract_title` varchar(150) NOT NULL,
  `password` varchar(64) NOT NULL,
  UNIQUE KEY `password` (`password`) 
);
CREATE TABLE `contract_module` (
  `cid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
);
CREATE TABLE `log_contract_pswd` (
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uid` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `hh` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `msg_title` varchar(100) NOT NULL DEFAULT '',
  `msg_data` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dt` (`dt`,`cid`)
);
CREATE TABLE `contract_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `cid` int(11) NOT NULL DEFAULT 0,
  `pt` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0,
  `summa` decimal(10,2) NOT NULL,
  `comment` char(200) NOT NULL DEFAULT '',
  `lm` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payback` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `dt_cid` (`dt`,`cid`),
  KEY `pt` (`pt`),
  KEY `uid` (`uid`),
  KEY `cid_dt` (`cid`,`dt`) ,
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_parameter_type_phone` (
  `pid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`,`cid`)
);
CREATE TABLE `contract_charge_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(50) NOT NULL DEFAULT '',
  `flag` tinyint(2) NOT NULL DEFAULT 0,
  `type` tinyint(2) NOT NULL DEFAULT 0,
  `up` int(11) unsigned NOT NULL DEFAULT 0,
  `payback` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_plugin_config` (
  `contract_id` int(11) NOT NULL DEFAULT 0,
  `plugin_id` int(11) NOT NULL DEFAULT 0,
  `key` varchar(50) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`contract_id`,`plugin_id`,`key`),
  KEY `plugin_id_key` (`plugin_id`,`key`)
);
CREATE TABLE `contract_reserve_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `used` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_parameter_type_8_log` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` int(11) DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_parameter_type_1` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`,`pid`),
  KEY `val` (`val`)
);
CREATE TABLE `contract_notification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `dt` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'прочитано или нет',
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_parameter_type_phone_log` (
  `pid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `val` varchar(255) DEFAULT NULL,
  `data` mediumtext DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `log_contract_face` (
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uid` int(11) NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0
);
CREATE TABLE `contract_parameter_type_multilist_log` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `val` varchar(255) DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_payment_deleted` (
  `id` int(11) NOT NULL DEFAULT 0,
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `pt` int(10) unsigned NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0,
  `summa` decimal(10,2) NOT NULL,
  `comment` varchar(200) NOT NULL DEFAULT '',
  `lm` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `pt_dt` (`pt`,`dt`),
  KEY `dt_cid` (`dt`,`cid`),
  KEY `uid` (`uid`),
  KEY `cid_dt` (`cid`,`dt`),
  KEY `id` (`id`)
);
CREATE TABLE `contract_logon_last` (
  `lu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cid` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  `n` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`cid`)
);
CREATE TABLE `contract_parameter_type_4_log` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `val` varchar(255) DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_parameter_type_7_log` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_label_link` (
  `contract_id` int(11) NOT NULL DEFAULT 0,
  `label_id` int(11) NOT NULL DEFAULT 0,
  KEY `contract_id` (`contract_id`,`label_id`)
);
CREATE TABLE `contract_limit_manage_mode` (
  `cid` int(11) NOT NULL,
  `mode` int(11) NOT NULL DEFAULT 0,
  `cnt` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`)
);
CREATE TABLE `contract_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date NOT NULL DEFAULT '0000-00-00',
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `pt` int(10) unsigned NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0,
  `summa` decimal(10,2) NOT NULL,
  `comment` varchar(200) NOT NULL DEFAULT '',
  `lm` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pt_dt` (`pt`,`dt`),
  KEY `dt_cid` (`dt`,`cid`),
  KEY `uid` (`uid`),
  KEY `cid_dt` (`cid`,`dt`)
);
CREATE TABLE `contract_group` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `title` varchar(100) NOT NULL DEFAULT '',
  `enable` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `editable` tinyint(3) NOT NULL DEFAULT 1,
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `enable` (`enable`)
);
CREATE TABLE `contract_pattern_services` (
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  KEY `pid` (`pid`)
);
CREATE TABLE `log_contract_mode` (
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uid` int(11) NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0
);
CREATE TABLE `contract_logon_ok` (
  `lu` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cid` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  `ip` varchar(40) NOT NULL DEFAULT '',
  `session_id` varchar(32) NOT NULL,
  `user` enum('p','c','a') NOT NULL DEFAULT 'c',
  KEY `new_index` (`cid`,`dt`)
);
CREATE TABLE `contract_tariff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `tpid` int(10) unsigned NOT NULL DEFAULT 0,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `lm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `emid` int(11) NOT NULL DEFAULT 0,
  `eid` int(11) NOT NULL DEFAULT 0,
  `replaced_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_parameter_group` (
  `gid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  KEY `gid` (`gid`)
);
CREATE TABLE `contract_comment_patterns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) NOT NULL,
  `pat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_limit_period` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  `dt` date DEFAULT NULL,
  `value` decimal(10,2) NOT NULL,
  `status` varchar(6) NOT NULL DEFAULT 'on',
  PRIMARY KEY (`id`),
  KEY `dt` (`dt`)
);
CREATE TABLE `contract_parameter_type_5` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cid`,`pid`)
);
CREATE TABLE `contract_limit_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `clp_id` int(11) DEFAULT NULL,
  `summ` decimal(10,2) NOT NULL,
  `date1` datetime NOT NULL,
  `date2` date DEFAULT NULL,
  `pids` varchar(100) DEFAULT NULL,
  `rest` float(10,2) NOT NULL DEFAULT 0.00,
  `status` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `clp_id` (`clp_id`)
);
CREATE TABLE `contract_pattern_named_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `ln` int(10) unsigned NOT NULL,
  `count_number` int(11) DEFAULT -1,
  `comment` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
);
CREATE TABLE `contract_account` (
  `yy` smallint(5) unsigned NOT NULL DEFAULT 0,
  `mm` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `cid` int(10) unsigned NOT NULL DEFAULT 0,
  `sid` int(10) unsigned NOT NULL DEFAULT 0,
  `summa` decimal(15,5) DEFAULT NULL,
  PRIMARY KEY (`yy`,`mm`,`cid`,`sid`),
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_tariff_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `time_from` datetime NOT NULL,
  `time_to` datetime DEFAULT NULL,
  `charge_id` int(11) NOT NULL,
  `summa` decimal(10,2) NOT NULL,
  `activated_mode` int(11) NOT NULL,
  `activated_time` datetime NOT NULL,
  `deactivated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
);
CREATE TABLE `log_contract_limit` (
  `dt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uid` int(11) NOT NULL DEFAULT 0,
  `nvalue` decimal(10,2) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `comment` varchar(250) NOT NULL,
  `days` varchar(4) DEFAULT NULL,
  KEY `cid` (`cid`)
);
CREATE TABLE `contract_parameter_type_8` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_delete_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `money` int(10) unsigned NOT NULL DEFAULT 0,
  `time` int(10) unsigned NOT NULL DEFAULT 0,
  `gr` bigint(20) NOT NULL DEFAULT 0,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_parameter_type_multilist_item` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `val` int(11) NOT NULL,
  `custom_value` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`,`pid`,`val`,`custom_value`)
);
CREATE TABLE `contract_web_menu` (
  `contract_id` int(11) NOT NULL DEFAULT 0,
  `web_menu_id` int(11) NOT NULL DEFAULT 0,
  KEY `contract_id` (`contract_id`),
  KEY `web_menu_id` (`web_menu_id`)
);
CREATE TABLE `contract_parameter_type_6_log` (
  `cid` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `val` date DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_reserve_total` (
  `cid` int(11) NOT NULL,
  `sum` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cid`)
);
CREATE TABLE `contract_parameter_type_phone_item` (
  `pid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `n` tinyint(4) NOT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `format` varchar(2) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`,`cid`,`n`),
  KEY `phone` (`phone`)
);
CREATE TABLE `contract_parameter_type_4_directory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT '0',
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_parameter_group_name` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);
CREATE TABLE `contract_parameter_type_2_log` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `val` varchar(255) DEFAULT NULL,
  `dt_change` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  KEY `cid_pid` (`cid`,`pid`)
);
CREATE TABLE `contract_parameter_type_multilist_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO user (login, name, pswd, config, cgr_mode) VALUES ('admin', 'admin', '21232F297A57A5A743894A0E4A801FC3', '', 0);

INSERT INTO setup VALUES ( "closed_date_1", "00.00.0000" );

INSERT INTO scheduled_class( title, class ) VALUES( "Удаление старых договоров", "bitel.billing.server.contract.CleanerContract");
INSERT INTO scheduled_class( title, class ) VALUES( "Генератор заданий на загрузку логов", "bitel.billing.server.load.TaskGenerator");
INSERT INTO scheduled_class( title, class ) VALUES( "Рассыльщик почты", "bitel.billing.server.mail.MailSender");
INSERT INTO scheduled_class( title, class ) VALUES( "Восстановление лимитов", "bitel.billing.server.contract.LimitRestorer");
INSERT INTO scheduled_class( title, class ) VALUES( "Пользовательские рассылки", "bitel.billing.server.mail.UserDispatchSender");
INSERT INTO scheduled_class( title, class ) VALUES( "Генератор событий таймера", "bitel.billing.server.script.TimerEventGenerate");
INSERT INTO scheduled_class( title, class ) VALUES( "Рассылка о понижении лимита", "bitel.billing.server.contract.DebtMailSender");
INSERT INTO scheduled_class( title, class ) VALUES( "Установка статусов договоров", "bitel.billing.server.contract.ContractStatusSetter");
INSERT INTO scheduled_class( title, class ) VALUES( "Загрузка платежей из файлов", "bitel.billing.server.admin.integration.PaymentLoader");		
INSERT INTO scheduled_class( title, class ) VALUES( "Валидатор", "ru.bitel.bgbilling.kernel.task.server.Validator");
INSERT INTO scheduled_class( title, class ) VALUES( "Выполнение глобальных скриптов по таймеру", "bitel.billing.server.script.global.bean.GlobalScriptTimer");

CREATE USER 'bill'@'localhost' IDENTIFIED BY 'bgbilling';
GRANT ALL PRIVILEGES ON `bgbilling`.* TO 'bill'@'localhost' WITH GRANT OPTION;

CREATE USER 'bill'@'%' IDENTIFIED BY 'bgbilling';
GRANT ALL PRIVILEGES ON `bgbilling`.* TO 'bill'@'%' WITH GRANT OPTION;
-- Аннотация блока нужна только для пакета update.
-- #BLOCK#
DELETE FROM script_event_type WHERE mid='0';

SET @mid=0, @old_event_id=1, @new_event_id='ru.bitel.bgbilling.kernel.contract.balance.server.event.PaymentEvent', @event_title='Приход платежа';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=2, @new_event_id='ru.bitel.bgbilling.kernel.contract.balance.server.event.ChargeEvent', @event_title='Занесение расхода';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=44, @new_event_id='ru.bitel.bgbilling.kernel.contract.balance.server.event.PaymentDeletedEvent', @event_title='Платеж удален';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=45, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractSetStatusLogicEvent', @event_title='Задание логики перетирания статусов';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=18, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractStatusChangingEvent', @event_title='Изменение статуса договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=19, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractStatusChangedEvent', @event_title='Статус договора изменен';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.ContractWebLoginEvent', 1, 'Авторизация в Web');

SET @mid=0, @old_event_id=5, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractCreatedEvent', @event_title='Договор создан';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=9, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractParamChangedEvent', @event_title='Изменен параметр договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=11, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ServiceUpdateEvent', @event_title='Изменение/добавления услуги договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=12, @new_event_id='ru.bitel.bgbilling.kernel.event.events.GetAdditionalWebActionListEvent', @event_title='Получение списка доп. действия для Web статистики';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=15, @new_event_id='ru.bitel.bgbilling.kernel.event.events.GetAdditionalActionListEvent', @event_title='Получение списка доп. действия для договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=16, @new_event_id='ru.bitel.bgbilling.kernel.event.events.AdditionalActionEvent', @event_title='Обработка доп. действия для договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=22, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractAddObjectEvent', @event_title='Объект: Добавление объекта договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=23, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractUpdateObjectEvent', @event_title='Объект: Изменение объекта договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=24, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractDeleteObjectEvent', @event_title='Объект: Удаление объекта договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=27, @new_event_id='ru.bitel.bgbilling.kernel.event.events.OnContractWrapEvent', @event_title='Договор переоформлен';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=29, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractObjectParameterUpdateEvent', @event_title='Объект: Изменен параметр объекта договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=32, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractTariffUpdateEvent', @event_title='Тариф: Изменение тарифа договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=33, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractTariffDeleteEvent', @event_title='Тариф: Удаление тарифа договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=35, @new_event_id='ru.bitel.bgbilling.kernel.event.events.PersonalTariffUpdateEvent', @event_title='Тариф: Добавление/Изменение персонального тарифного плана';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=36, @new_event_id='ru.bitel.bgbilling.kernel.event.events.PersonalTariffDeleteEvent', @event_title='Тариф: Удаление  персонального тарифного плана';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=37, @new_event_id='ru.bitel.bgbilling.kernel.event.events.PersonalTariffTreeUpdateEvent', @event_title='Тариф: Изменение в дереве персонального тарифного плана';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=3, @new_event_id='ru.bitel.bgbilling.kernel.event.events.TimerEvent', @event_title='Таймер';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=4, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ChangeTariffByTaskEvent', @event_title='Тариф: Смена тарифа по заданию пользователя';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=10, @new_event_id='ru.bitel.bgbilling.kernel.event.events.BeforeServiceDeleteEvent', @event_title='Перед удалением услуги договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=20, @new_event_id='ru.bitel.bgbilling.kernel.event.events.GetChangeTariffDatesEvent', @event_title='Тариф: Запрос дат с которых разрешена смена тарифа через Web';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=21, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractParamBeforeChangeEvent', @event_title='Перед изменением параметра договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=25, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractLimitUserLow', @event_title='Лимит: Временное понижение лимита пользователем через Web';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=26, @new_event_id='ru.bitel.bgbilling.kernel.event.events.GetContractCardsList', @event_title='Получение списка карточек регистрации договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=28, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ContractObjectParameterBeforeUpdateEvent', @event_title='Объект: Перед измением параметра объекта договора';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=30, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ActionBeforeEvent', @event_title='Перед действием';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=31, @new_event_id='ru.bitel.bgbilling.kernel.event.events.ActionAfterEvent', @event_title='После действия';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=34, @new_event_id='ru.bitel.bgbilling.kernel.event.events.GetContractStatusChangeDatesEvent', @event_title='Получение списка дат для смены статуса договора в Web';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=38, @new_event_id='ru.bitel.bgbilling.kernel.event.events.CancelTariffEvent', @event_title='Тариф: Отмена перехода на тарифный план (Web)';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=41, @new_event_id='ru.bitel.bgbilling.kernel.tariff.option.server.event.TariffOptionActivatedEvent', @event_title='Тарифная опция: Активирована/реактивирована тарифная опция';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

SET @mid=0, @old_event_id=43, @new_event_id='ru.bitel.bgbilling.kernel.tariff.option.server.event.TariffOptionDeactivatedEvent', @event_title='Тарифная опция: Деактивирована тарифная опция';
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (@mid, @new_event_id, 1, @event_title);
INSERT INTO script_function_event_type(fid, mid, event_id) SELECT sfet1.fid, sfet1.mid, @new_event_id FROM script_function_event_type AS sfet1 LEFT JOIN script_function_event_type AS sfet2 ON sfet1.fid=sfet2.fid AND sfet1.mid=sfet2.mid AND sfet2.event_id=@new_event_id WHERE sfet1.mid=@mid AND sfet1.event_id=@old_event_id AND sfet2.fid IS NULL;

INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.tariff.option.server.event.TariffOptionBeforeActivateEvent', 1, 'Тарифная опция: Перед активацией тарифной опции');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.tariff.option.server.event.TariffOptionListAvailableEvent', 1, 'Тарифная опция: Получение списка доступных тарифных опций');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.ValidateTextParamEvent', 1, 'Валидация текстового параметра');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.ServerStartEvent', 0, 'Старт сервера');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.LimitChangedEvent', 1, 'Лимит:  Изменение лимита договора' );
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.ContractAddingSubEvent', 1, 'Перед добавлением субдоговора');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.ContractServicesChangedEvent', 1, 'Изменение подключенных услуг');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.contract.api.common.event.ContractPasswordChangedEvent', 1, 'Изменение пароля личного кабинета');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.oss.systems.order.product.common.event.ProductOfferingListEvent', 1, 'Продукт: Получение списка доступных продуктов');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.GetTariffListEvent', 1, 'Тариф: Получение списка тарифных планов для смены в Web');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.ChangeContractLimitEvent', 1, 'Лимит: Проверка возможности изменения лимита договора');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.ContractStatusChangingCheck', 1, 'Проверка возможности смены статуса');
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.contract.period.server.event.ContractPeriodCloseEvent', 1, 'Окончание учетного периода' );
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.contract.period.server.event.ContractPeriodUpdateEvent', 1, 'Создание/редактирование учетного периода' );
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.contract.period.server.event.ContractPeriodDeleteEvent', 1, 'Удаление учетного периода' );
INSERT INTO script_event_type (mid, event_id, event_mode, title) VALUES (0, 'ru.bitel.bgbilling.kernel.event.events.ContractCommentPatternEvent', 1, 'Генерация комментария договора по шаблону' );

-- старые события 
INSERT INTO script_event_type ( mid, event_id, title ) VALUES ( 0, 17, "(Устарело) Добавление задания на смену тарифа через Web");
-- #ENDB#
