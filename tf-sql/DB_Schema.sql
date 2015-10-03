DROP TABLE IF EXISTS `tf_company`;
CREATE TABLE `tf_company` (
  `idcompany` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) ,
  `altname` VARCHAR(100) ,
  `regnumber` VARCHAR(100) ,
  `addtrading` VARCHAR(100) ,
  `addregistered` VARCHAR(100) ,
  `dateestablished` date ,
  `website` VARCHAR(100) ,
  `telnumber` VARCHAR(45) ,
  `directors` VARCHAR(200) ,
  `shareholders` VARCHAR(200) ,
 `customers` VARCHAR(200) ,
 `accounts` VARCHAR(45), 
 `jurisdiction` VARCHAR(45) ,
 `bustype` VARCHAR(100) ,
  `active_status` VARCHAR(50) ,
  `company_reference` VARCHAR(50),
  PRIMARY KEY (`idcompany`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `regnumber_UNIQUE` (`regnumber`)
) ENGINE=INNODB AUTO_INCREMENT=1986;


DROP TABLE IF EXISTS `tf_user`;
CREATE TABLE `tf_user` (
  `iduser` INT(11) NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) ,
  `middlename` VARCHAR(45) ,
  `lastname` VARCHAR(45) ,
  `title` VARCHAR(45) ,
  `username` VARCHAR(100) ,
  `password` VARCHAR(45) ,
  `type` VARCHAR(45) ,
  `active` TINYINT(1) NOT NULL,
  `email` VARCHAR(100) ,
  `telwork` VARCHAR(45) ,
  `telmobile` VARCHAR(45) ,
  `level` VARCHAR(45) ,
  `diremail` VARCHAR(100) ,
  `dirname` VARCHAR(100) ,
  `reqdate` DATETIME DEFAULT NULL, 
  `tcagree` VARCHAR(45) ,
  `dirconfirm` VARCHAR(45) ,
  `checksagree` VARCHAR(45) ,
  `memtype` VARCHAR(45) ,
  `updateflag` INT(11) DEFAULT NULL,
  `active_status` TINYINT(1) DEFAULT '1',
  `company_id` INT(11) DEFAULT NULL,
  `companydirector` VARCHAR(45) ,  
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
   NAME VARCHAR(45) ,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id_UNIQUE` (`id`));
   
INSERT INTO tf_company_type VALUES (1,"Primary Investor");
INSERT INTO tf_company_type VALUES (2,"Secondary Investor");
INSERT INTO tf_company_type VALUES (3,"Admin");
INSERT INTO tf_company_type VALUES (4,"Seller");
INSERT INTO tf_company_type VALUES (5,"SCF Company");


DROP TABLE IF EXISTS `tf_purchase_order`;
CREATE TABLE `tf_purchase_order` (
  `purchase_order_id` INT(11) NOT NULL AUTO_INCREMENT,
   `seller_id` INT(11)  NOT NULL,
   `debtor_company`  INT(11)  NOT NULL,
   `po_number` VARCHAR(25) ,
   `po_date` DATE  ,   
   `po_amount` DECIMAL     ,  
   `po_days`   INT(11) ,
   `po_notes` VARCHAR(45) ,
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
   `document_type` VARCHAR(30) ,
   `document_url` VARCHAR(300) ,
   `create_date` DATE  ,    
   PRIMARY KEY (`document_id`),
   UNIQUE KEY `document_id_UNIQUE` (`document_id`)    
   );
   
DROP TABLE IF EXISTS `tf_invoice_company`;
CREATE TABLE `tf_invoice_company` (
    `id` INT(11) NOT NULL,
   `company_name` VARCHAR(40),
   `description` VARCHAR(150) ,    
   PRIMARY KEY (`id`),
   UNIQUE KEY `id` (`id`)    
 );
 
INSERT INTO tf_invoice_company VALUES (1,"Tesco","Tesco");
INSERT INTO tf_invoice_company VALUES (2,"Sainsburys","Sainsburys");
INSERT INTO tf_invoice_company VALUES (3,"ASDA","ASDA");
INSERT INTO tf_invoice_company VALUES (4,"Co-OP","Co-OP");
INSERT INTO tf_invoice_company VALUES (5,"Morrisons","Morrisons");



ALTER TABLE `tf_po_documents` ADD COLUMN document_name VARCHAR(100) AFTER document_type;


DROP TABLE IF EXISTS `tf_trade`;
CREATE TABLE `tf_trade` (
   `trade_id` INT(11) NOT NULL AUTO_INCREMENT,
   `duration` INT(11),
   `closing_date`  DATE,  
   `opening_date`  DATE,  
   `trade_amount` DECIMAL,    
   `status` TINYINT(1) DEFAULT '1',
   `invoive_company_id`    INT(11) NOT NULL,
   `seller_company_id` INT(11) NOT NULL,
   `trade_days` INT(11),
   `trade_description` VARCHAR(300) ,
   `repayment_date` DATE, 
   `trade_settled` TINYINT(1) DEFAULT '0', 
   `is_secondary_allotment` TINYINT(1) DEFAULT '0', 
   `total_value` DECIMAL   ,    
   PRIMARY KEY (`trade_id`),
   UNIQUE KEY `trade_id_UNIQUE` (`trade_id`)  
   );
   
   ALTER TABLE `tf_purchase_order` ADD COLUMN trade_id INT(11) AFTER is_traded;
   
DROP TABLE IF EXISTS `scf_invoice`;
CREATE TABLE `scf_invoice` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
   `invoice_number` INT(11)  NOT NULL,
   `invoice_date`  DATE,
   `seller_company_registration_number` VARCHAR(25) ,
   `seller_company_vat_number` VARCHAR(25)  ,   
   `invoice_amout` DECIMAL     ,  
   `vat_amount`   DECIMAL ,
   `invoice_desc` VARCHAR(45) ,
   `duration` INT(11), 
   `payment_date` DATE, 
   `currency`  VARCHAR(45) ,   
   `scf_company`  VARCHAR(100) ,  
   `due_date`  DATE, 
   `trade_id`  INT(11),  
   PRIMARY KEY (`id`),
   UNIQUE KEY `id_UNIQUE` (`id`),
   UNIQUE KEY `invoice_number_UNIQUE` (`invoice_number`)
   );
   
DROP TABLE IF EXISTS `scf_invoice_document`;
CREATE TABLE `scf_invoice_document` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
   `document_id`  INT(11),    
   `document_name`  VARCHAR(100) , 
   `document_type`  VARCHAR(100) , 
   `document_url`  VARCHAR(800) , 
   `uploadedby`  VARCHAR(30) ,   
   `upload_date`  DATE,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id_UNIQUE` (`id`),
   UNIQUE KEY `document_id_UNIQUE` (`document_id`)
   );
   
DROP TABLE IF EXISTS `scf_trade`;
CREATE TABLE `scf_trade` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
   `scf_trade` VARCHAR(10) ,
   `duration` INT(10), 
   `closing_date`  DATE,
   `opening_date`  DATE,
   `investor_Payment_date`  DATE,
   `Seller_Payment_date`  DATE,
   `trade_amount`  DECIMAL,
   `status` VARCHAR(50) ,
   `company_id` INT(11) NOT NULL,
   `trade_notes` VARCHAR(45) ,
   `trade_settled` TINYINT(1) DEFAULT '0',
   `want_to_insure` TINYINT(1) DEFAULT '0',
   `insurance_doc_id` INT(11),
   `insurance_doc_name` VARCHAR(70) ,
   `insurance_doc_url` VARCHAR(800) ,
   `insurance_doc_type` VARCHAR(50) ,
   `promisory_note` VARCHAR(300) ,
   `create_date`  DATE,
   `update_date`  DATE,
   PRIMARY KEY (`id`),
   UNIQUE KEY `id_UNIQUE` (`id`)
   );

   
DROP TABLE IF EXISTS `tf_address`;
CREATE TABLE `tf_address` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `idcompany` INT(11) NOT NULL ,
  `address_line_1` VARCHAR(150),
  `address_line_2` VARCHAR(150),
  `locality` VARCHAR(25),
  `region` VARCHAR(25),
  `country` VARCHAR(25),
  `postal_code` VARCHAR(10),  
  PRIMARY KEY (`id`),
  FOREIGN KEY (idcompany) REFERENCES tf_company(idcompany)
) ENGINE=INNODB AUTO_INCREMENT=1986;

   
