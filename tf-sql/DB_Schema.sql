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
  `memtype` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
  `updateflag` INT(11) DEFAULT NULL,
  `active_status` TINYINT(1) DEFAULT '1',
  `company_id` INT(11) DEFAULT NULL,
  `companydirector` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,  
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `iduser_UNIQUE` (`iduser`),
  KEY `fk_user_company_idx` (`company_id`),
  CONSTRAINT `fk_user_company` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=INNODB AUTO_INCREMENT=1469 DEFAULT CHARSET=utf8 COMMENT='User table';

ALTER TABLE tf_company ADD OrganisationType VARCHAR(100);
ALTER TABLE tf_company ADD industryclassification VARCHAR(150);
ALTER TABLE tf_company ADD sic_code INT;
ALTER TABLE tf_company ADD company_type VARCHAR(150);
ALTER TABLE tf_user ADD companydirector VARCHAR(10);

CREATE TABLE `tf_company_type` (
  `id` INT(11) NOT NULL ,
   NAME VARCHAR(45) CHARACTER SET utf8 DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id_UNIQUE` (`id`));
   
INSERT INTO tf_company_type VALUES (1,"Primary Investor");
INSERT INTO tf_company_type VALUES (2,"Secondary Investor");
INSERT INTO tf_company_type VALUES (3,"Admin");
INSERT INTO tf_company_type VALUES (4,"Seller");


DROP TABLE IF EXISTS `tf_purchase_order`;
CREATE TABLE `tf_purchase_order` (
  `purchase_order_id` INT(11) NOT NULL AUTO_INCREMENT,
   `seller_id` INT(11)  NOT NULL,
   `debtor_company`  INT(11)  NOT NULL,
   `po_number` VARCHAR(25) CHARACTER SET utf8  NOT NULL,
   `po_date` DATE  ,   
   `po_amount` DECIMAL     ,  
   `po_days`   INT(11) ,
   `po_notes` VARCHAR(45) CHARACTER SET utf8  DEFAULT NULL,
   `finance_amount` DECIMAL, 
   `shipping_date` DATE, 
   `delivery_date` DATE, 
   `is_traded` TINYINT(1) DEFAULT '0',
   PRIMARY KEY (`purchase_order_id`),
   UNIQUE KEY `purchase_order_id_UNIQUE` (`purchase_order_id`),
    UNIQUE KEY `po_number_UNIQUE` (`po_number`)
   );
   
DROP TABLE IF EXISTS `tf_po_documents`;
CREATE TABLE `tf_po_documents` (
   `purchase_order_id` INT(11) NOT NULL,
   `document_id` INT(11)  NOT NULL,   
   `document_type` VARCHAR(30) CHARACTER SET utf8  NOT NULL,
   `document_url` VARCHAR(300) CHARACTER SET utf8  NOT NULL,
   `create_date` DATE  ,    
   PRIMARY KEY (`document_id`),
   UNIQUE KEY `document_id_UNIQUE` (`document_id`)    
   );
   
DROP TABLE IF EXISTS `tf_invoice_company`;
CREATE TABLE `tf_invoice_company` (
    `id` INT(11) NOT NULL,
   `company_name` VARCHAR(40),
   `description` VARCHAR(150) CHARACTER SET utf8  NOT NULL,    
   PRIMARY KEY (`id`),
   UNIQUE KEY `id` (`id`)    
 );
 
INSERT INTO tf_invoice_company VALUES (1,"Tesco","Tesco");
INSERT INTO tf_invoice_company VALUES (2,"Sainsburys","Sainsburys");
INSERT INTO tf_invoice_company VALUES (3,"ASDA","ASDA");
INSERT INTO tf_invoice_company VALUES (4,"Co-OP","Co-OP");