DROP TABLE IF EXISTS `tf_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf_company` (
  `idcompany` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) CHARACTER SET utf8 NOT NULL,
  `altname` VARCHAR(100) CHARACTER SET utf8 DEFAULT NULL,
  `regnumber` VARCHAR(100) CHARACTER SET utf8 DEFAULT NULL,
  `addtrading` VARCHAR(100) CHARACTER SET utf8 DEFAULT NULL,
  `addregistered` VARCHAR(100) CHARACTER SET utf8 DEFAULT NULL,
  `dateestablished` date CHARACTER SET utf8 DEFAULT NULL,
  `website` VARCHAR(100) CHARACTER SET utf8 DEFAULT NULL,
  `telnumber` VARCHAR(45) CHARACTER SET utf8 DEFAULT NULL,
  `directors` VARCHAR(200) CHARACTER SET utf8 DEFAULT NULL,
  `shareholders` VARCHAR(200) CHARACTER SET utf8 DEFAULT NULL,
 `customers` VARCHAR(200) CHARACTER SET utf8 DEFAULT NULL,
 `accounts` VARCHAR(45) CHARACTER SET utf8 DEFAULT NULL,
 `jurisdiction` VARCHAR(45) CHARACTER SET utf8 DEFAULT NULL,
 `bustype` VARCHAR(100) CHARACTER SET utf8 DEFAULT NULL,
  `active_status` TINYINT(1) DEFAULT '1',
  `company_reference` VARCHAR(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idcompany`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `regnumber_UNIQUE` (`regnumber`)
) ENGINE=INNODB AUTO_INCREMENT=1986 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `tf_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tf_user` (
  `iduser` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) CHARACTER SET utf8 DEFAULT NULL,
  `middlename` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `lastname` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `title` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `username` VARCHAR(100) CHARACTER SET utf8  NOT NULL,
  `password` VARCHAR(45) CHARACTER SET utf8 DEFAULT NULL,
  `type` VARCHAR(45) CHARACTER SET utf8  NOT NULL,
  `active` TINYINT(1) NOT NULL,
  `email` VARCHAR(100) CHARACTER SET utf8 DEFAULT NULL,
  `telwork` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `telmobile` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `level` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `diremail` VARCHAR(100) CHARACTER SET utf8  DEFAULT NULL,
  `dirname` VARCHAR(100) CHARACTER SET utf8  DEFAULT NULL,
  `reqdate` DATETIME DEFAULT NULL, 
  `tcagree` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `dirconfirm` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `checksagree` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
 `company_idcompany` INT(11) DEFAULT NULL,
  `memtype` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `updateflag` INT(11) DEFAULT NULL,
  `active_status` TINYINT(1) DEFAULT '1',
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `iduser_UNIQUE` (`iduser`),
  KEY `fk_user_company_idx` (`company_idcompany`),
  CONSTRAINT `fk_user_company` FOREIGN KEY (`company_idcompany`) REFERENCES `tf_company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=INNODB AUTO_INCREMENT=1469 DEFAULT CHARSET=utf8 COMMENT='User table';

ALTER TABLE tf_company ADD OrganisationType VARCHAR(100);
ALTER TABLE tf_company ADD industryclassification VARCHAR(150);
ALTER TABLE tf_company ADD sic_code INT;
ALTER TABLE tf_company ADD company_type VARCHAR(150);