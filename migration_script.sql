-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: ledappdb_export
-- Source Schemata: ledappdb
-- Created: Sat Apr 16 17:09:02 2016
-- Workbench Version: 6.3.6
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema ledappdb_export
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `ledappdb` ;
CREATE SCHEMA IF NOT EXISTS `ledappdb` ;

-- ----------------------------------------------------------------------------
-- Table ledappdb_export.lamps
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ledappdb`.`lamps` (
  `DIMMING` INT(11) NULL DEFAULT NULL,
  `VOLTAGE` INT(11) NULL DEFAULT NULL,
  `CURRENT` INT(11) NULL DEFAULT NULL,
  `TEMPERATURE` FLOAT NULL DEFAULT NULL,
  `HUMIDITY` FLOAT NULL DEFAULT NULL,
  `SERVER_IP` VARCHAR(50) NULL DEFAULT NULL,
  `SERVER_PORT` VARCHAR(50) NULL DEFAULT NULL,
  `REPORT_CYCLE_TIME` INT(11) NULL DEFAULT NULL,
  `PHOTO` BLOB NULL DEFAULT NULL,
  `LOCATION` VARCHAR(45) NULL DEFAULT NULL,
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `LEDID` INT(11) NULL DEFAULT NULL,
  `GROUPID` INT(11) NULL DEFAULT NULL,
  `logtime` VARCHAR(45) NULL DEFAULT NULL,
  `net` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `lat` VARCHAR(45) NULL DEFAULT NULL,
  `lng` VARCHAR(45) NULL DEFAULT NULL,
  `lampcondition` INT(11) NULL DEFAULT NULL,
  `dustconcentration` FLOAT NULL DEFAULT NULL,
  `ledtype` VARCHAR(45) NULL DEFAULT NULL,
  `lampcontrol` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 33
DEFAULT CHARACTER SET = utf8;
SET FOREIGN_KEY_CHECKS = 1;
