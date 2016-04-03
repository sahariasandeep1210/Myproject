DROP TABLE IF EXISTS tf_company;
CREATE TABLE tf_company (
  idcompany BIGINT(20) NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(100) ,
  altname VARCHAR(100) ,
  regnumber VARCHAR(100) ,
  addtrading VARCHAR(100) ,
  addregistered VARCHAR(100) ,
  dateestablished DATE ,
  website VARCHAR(100) ,
  telnumber VARCHAR(45) ,
  directors VARCHAR(200) ,
  shareholders VARCHAR(200) ,
 customers VARCHAR(200) ,
 accounts VARCHAR(45), 
 jurisdiction VARCHAR(45) ,
  bustype VARCHAR(100) ,
  active_status VARCHAR(50) ,
  company_reference VARCHAR(50),
  PRIMARY KEY (idcompany),
  UNIQUE KEY name_UNIQUE (NAME),
  UNIQUE KEY regnumber_UNIQUE (regnumber)
) ;


DROP TABLE IF EXISTS tf_user;
CREATE TABLE tf_user (
  iduser BIGINT(20) NOT NULL AUTO_INCREMENT,
  firstname VARCHAR(45) ,
  middlename VARCHAR(45) ,
  lastname VARCHAR(45) ,
  title VARCHAR(45) ,
  username VARCHAR(100) ,
  password VARCHAR(45) ,
  type VARCHAR(45) ,
  active TINYINT(1) NOT NULL,
  email VARCHAR(100) ,
  telwork VARCHAR(45) ,
  telmobile VARCHAR(45) ,
  level VARCHAR(45) ,
  diremail VARCHAR(100) ,
  dirname VARCHAR(100) ,
  reqdate DATETIME DEFAULT NULL, 
  tcagree VARCHAR(45) ,
  dirconfirm VARCHAR(45) ,
  checksagree VARCHAR(45) ,
  memtype VARCHAR(45) ,
  updateflag INT(11) DEFAULT NULL,
  active_status TINYINT(1) DEFAULT '1',
  company_id BIGINT(20) DEFAULT NULL,
  companydirector VARCHAR(45) ,  
  PRIMARY KEY (iduser),
  UNIQUE KEY username_UNIQUE (username),
  UNIQUE KEY iduser_UNIQUE (iduser),
  KEY fk_user_company_idx (company_id),
  CONSTRAINT fk_user_company FOREIGN KEY (company_id) REFERENCES tf_company (idcompany) ON DELETE NO ACTION ON UPDATE NO ACTION
);


ALTER TABLE tf_user ADD liferay_user_id BIGINT(20);

ALTER TABLE tf_company ADD OrganisationType VARCHAR(100);
ALTER TABLE tf_company ADD industryclassification VARCHAR(150);
ALTER TABLE tf_company ADD sic_code BIGINT(20);
ALTER TABLE tf_company ADD company_type VARCHAR(150);

DROP TABLE IF EXISTS tf_company_type;
CREATE TABLE tf_company_type (
  id BIGINT(20) NOT NULL,
   NAME VARCHAR(45) ,
   PRIMARY KEY (id),
   UNIQUE KEY id_UNIQUE (id));
   
INSERT INTO tf_company_type VALUES (1,"Primary Investor");
INSERT INTO tf_company_type VALUES (2,"Secondary Investor");
INSERT INTO tf_company_type VALUES (3,"Admin");
INSERT INTO tf_company_type VALUES (4,"Seller");
INSERT INTO tf_company_type VALUES (5,"SCF Company");


DROP TABLE IF EXISTS tf_purchase_order;
CREATE TABLE tf_purchase_order (
  purchase_order_id BIGINT(20) NOT NULL AUTO_INCREMENT,
   seller_id BIGINT(20)  NOT NULL,
   debtor_company  BIGINT(20)  NOT NULL,
   po_number VARCHAR(25) ,
   po_date DATE  ,   
   po_amount DECIMAL     ,  
   po_days   INT(11) ,
   po_notes VARCHAR(45) ,
   finance_amount DECIMAL, 
   shipping_date DATE, 
   delivery_date DATE, 
   is_traded TINYINT(1) DEFAULT '0',
   PRIMARY KEY (purchase_order_id),
   UNIQUE KEY purchase_order_id_UNIQUE (purchase_order_id),
    UNIQUE KEY po_number_UNIQUE (po_number)
  );
   
DROP TABLE IF EXISTS tf_po_documents;
CREATE TABLE tf_po_documents (
   purchase_order_id BIGINT(20) NOT NULL AUTO_INCREMENT,
   document_id BIGINT(20) NOT NULL,   
   document_type VARCHAR(30) ,
   document_url VARCHAR(300) ,
   create_date DATE  ,    
   PRIMARY KEY (purchase_order_id),
   UNIQUE KEY document_id_UNIQUE (document_id)    
   );
   
   
DROP TABLE IF EXISTS tf_invoice_company;
CREATE TABLE tf_invoice_company (
    id BIGINT(20) NOT NULL,
   company_name VARCHAR(40),
   description VARCHAR(150) ,    
   PRIMARY KEY (id),
   UNIQUE KEY id (id)    
 );
 
INSERT INTO tf_invoice_company VALUES (1,"Tesco","Tesco");
INSERT INTO tf_invoice_company VALUES (2,"Sainsburys","Sainsburys");
INSERT INTO tf_invoice_company VALUES (3,"ASDA","ASDA");
INSERT INTO tf_invoice_company VALUES (4,"Co-OP","Co-OP");
INSERT INTO tf_invoice_company VALUES (5,"Morrisons","Morrisons");


ALTER TABLE `tf_po_documents` ADD COLUMN document_name VARCHAR(100) AFTER document_type;



DROP TABLE IF EXISTS tf_trade;
CREATE TABLE tf_trade (
   trade_id BIGINT(20) NOT NULL AUTO_INCREMENT,
   duration INT(11),
   closing_date  DATE,  
   opening_date  DATE,  
   trade_amount DECIMAL,    
   STATUS TINYINT(1) DEFAULT '1',
   invoive_company_id    BIGINT(20) NOT NULL,
   seller_company_id BIGINT(20) NOT NULL,
   trade_days INT(11),
   trade_description VARCHAR(300) ,
   repayment_date DATE, 
   trade_settled TINYINT(1) DEFAULT '0', 
   is_secondary_allotment TINYINT(1) DEFAULT '0', 
   total_value DECIMAL   ,    
   PRIMARY KEY (trade_id),
   UNIQUE KEY trade_id_UNIQUE (trade_id)  
   );
   
ALTER TABLE tf_purchase_order ADD COLUMN trade_id BIGINT(20) AFTER is_traded;


DROP TABLE IF EXISTS scf_invoice;
CREATE TABLE scf_invoice (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
   invoice_number BIGINT(20) NOT NULL,
   invoice_date  DATE,
   seller_company_registration_number VARCHAR(25) ,
   seller_company_vat_number VARCHAR(25)  ,   
   invoice_amout DECIMAL     ,  
   vat_amount   DECIMAL ,
   invoice_desc VARCHAR(45) ,
   duration INT(11), 
   payment_date DATE, 
   currency  VARCHAR(45) ,   
   scf_company  BIGINT(20),
   due_date  DATE, 
   trade_id BIGINT(20),  
   PRIMARY KEY (id),
   UNIQUE KEY id_UNIQUE (id),
   UNIQUE KEY invoice_number_UNIQUE (invoice_number)
   );  

   
   ALTER TABLE scf_invoice ADD COLUMN status VARCHAR(100) AFTER due_date;
   
   
 DROP TABLE IF EXISTS scf_invoice_document;
CREATE TABLE scf_invoice_document (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
   document_id  BIGINT(20),    
   document_name  VARCHAR(100) , 
   document_type  VARCHAR(100) , 
   document_url  VARCHAR(800) , 
   uploadedby  VARCHAR(30) ,   
   upload_date  DATE,
   PRIMARY KEY (id),
   UNIQUE KEY id_UNIQUE (id),
   UNIQUE KEY document_id_UNIQUE (document_id)
   );
   
DROP TABLE IF EXISTS scf_trade;
CREATE TABLE scf_trade (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
   scf_trade VARCHAR(10) ,
   duration INT(10), 
   closing_date  DATE,
   opening_date  DATE,
   investor_Payment_date  DATE,
   Seller_Payment_date  DATE,
   trade_amount  DECIMAL,   
   STATUS VARCHAR(50) ,
   company_id BIGINT(20) NOT NULL,
   trade_notes VARCHAR(45) ,
   trade_settled TINYINT(1) DEFAULT '0',
   want_to_insure TINYINT(1) DEFAULT '0',
   insurance_doc_id BIGINT(20),
   insurance_doc_name VARCHAR(70) ,
   insurance_doc_url VARCHAR(800) ,
   insurance_doc_type VARCHAR(50) ,
   promisory_note VARCHAR(300) ,
   create_date  DATE,
   update_date  DATE,
   PRIMARY KEY (id),
   UNIQUE KEY id_UNIQUE (id)
   );


   
DROP TABLE IF EXISTS tf_address;
CREATE TABLE tf_address (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  idcompany BIGINT(20) NOT NULL ,
  address_line_1 VARCHAR(150),
  address_line_2 VARCHAR(150),
  locality VARCHAR(25),
  region VARCHAR(25),
  country VARCHAR(25),
  postal_code VARCHAR(10),  
  PRIMARY KEY (id),
  FOREIGN KEY (idcompany) REFERENCES tf_company(idcompany)
) ;

ALTER TABLE  scf_invoice_document ADD scf_company BIGINT(20);

DROP TABLE IF EXISTS tf_officer;
CREATE TABLE tf_officer (
  officer_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  company_id BIGINT(20) NOT NULL ,
  NAME VARCHAR(100),
  officer_role VARCHAR(70),
  appointed_on DATE,
  resigned_on DATE,
  country_of_residence VARCHAR(50),
  nationality VARCHAR(50),
  occupation VARCHAR(50),  
  updated_on DATE, 
  iduser BIGINT(20) ,
  PRIMARY KEY (officer_id),
  FOREIGN KEY (company_id) REFERENCES tf_company(idcompany)
);

DROP TABLE IF EXISTS tf_officer_address;
CREATE TABLE tf_officer_address (
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  officer_id BIGINT(20) NOT NULL ,
  address_line_1 VARCHAR(150),
  address_line_2 VARCHAR(150),
  locality VARCHAR(25),
  region VARCHAR(25),
  country VARCHAR(25),
  postal_code VARCHAR(10),  
  PRIMARY KEY (id),
  FOREIGN KEY (officer_id) REFERENCES tf_officer(officer_id)
) ;

DROP TABLE IF EXISTS tf_investor;
CREATE TABLE tf_investor (
  investor_id  BIGINT(20) NOT NULL AUTO_INCREMENT,  
  company_id BIGINT(20) DEFAULT NULL,   
  create_date  DATE,  
  PRIMARY KEY (investor_id),  
  UNIQUE KEY investor_id_UNIQUE (investor_id),
  KEY fk_investor_company_idx (company_id),  
  CONSTRAINT fk_investor_company FOREIGN KEY (company_id) REFERENCES tf_company (idcompany) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ;


DROP TABLE IF EXISTS tf_investor_portfolio ;
CREATE TABLE tf_investor_portfolio (
  investor_portfolio_id  BIGINT(20) NOT NULL AUTO_INCREMENT, 
  investor_id  BIGINT(20) NOT NULL,
  investment_discount_rate  INT(11) DEFAULT NULL,
  investor_status  TINYINT(1) DEFAULT '0', 
  investor_type VARCHAR(45) ,  
  max_dicsount_rate INT(11) DEFAULT NULL,
  min_discount_rate INT(11) DEFAULT NULL,
  company_id BIGINT(20) DEFAULT NULL,
  start_date DATETIME ,
  end_date DATETIME ,
  updated_by VARCHAR(100) ,  
  available_to_invest DECIMAL,  
  amount_invested  DECIMAL, 
  my_credit_line  DECIMAL,    
  current_credit_line  DECIMAL,  
  PRIMARY KEY (investor_portfolio_id),  
  UNIQUE KEY investor_portfolio_id_UNIQUE (investor_portfolio_id),
  KEY fk_tf_investor_portfolio_investor_id (investor_id),  
  CONSTRAINT fk_investor_portfolio_investor_id FOREIGN KEY (investor_id) REFERENCES tf_investor (investor_id),
  KEY fk_investor_portfolio_company_idx (company_id),  
  CONSTRAINT fk_investor_portfolio_company FOREIGN KEY (company_id) REFERENCES tf_company (idcompany) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ;

DROP TABLE IF EXISTS tf_investor_portfolio_history ;
CREATE TABLE tf_investor_portfolio_history (
  id  BIGINT(20) NOT NULL AUTO_INCREMENT, 
  investor_portfolio_id  BIGINT(20) NOT NULL, 
  investment_discount_rate  INT(11) DEFAULT NULL, 
  current_credit_line  DECIMAL,  
  my_credit_line  DECIMAL, 
  start_date DATETIME ,
  end_date DATETIME ,
  updated_by VARCHAR(100) ,   
  PRIMARY KEY (id), 
  KEY fk_investor_portfolio_id (investor_portfolio_id),  
  CONSTRAINT fk_investor_portfolio FOREIGN KEY (investor_portfolio_id) REFERENCES tf_investor_portfolio (investor_portfolio_id) 
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ;

DROP TABLE IF EXISTS tf_allotments;
CREATE TABLE tf_allotments(
  allotment_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  trade_id BIGINT(20) DEFAULT NULL,
  investor_portfolio_id BIGINT(20) DEFAULT NULL,
  allotment_amount DECIMAL(10,4) DEFAULT NULL,
  noofdays INT(11) DEFAULT NULL,
  is_primary TINYINT(1) DEFAULT '1',
  user_id BIGINT(20) DEFAULT NULL,
  market_discount INT(11) DEFAULT NULL,
  investor_gross_profit  DECIMAL(10,4), 
  whitehall_profit_share  DECIMAL(10,4),    
  investor_net_profit  DECIMAL(10,4),     
  allotment_date DATETIME DEFAULT NULL,
  PRIMARY KEY (`allotment_id`),
  UNIQUE KEY `allotment_id_UNIQUE` (`allotment_id`),
  KEY `fk_allotment_trade_id` (`trade_id`),
  KEY `fk_allotment_investor_portfolio_id` (`investor_portfolio_id`),
  KEY `fk_allotment_user_id` (`user_id`),
  CONSTRAINT `tf_allotments_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`),
  CONSTRAINT `tf_allotments_ibfk_2` FOREIGN KEY (`investor_portfolio_id`) REFERENCES `tf_investor_portfolio` (`investor_portfolio_id`),
  CONSTRAINT `tf_allotments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tf_user` (`iduser`)
);

DROP TABLE IF EXISTS tf_investor_portfolio_setting;
CREATE TABLE tf_investor_portfolio_setting (
  id  BIGINT(20) NOT NULL AUTO_INCREMENT,  
  max_dicsount_rate INT(11) DEFAULT NULL,
  min_discount_rate INT(11) DEFAULT NULL, 
  create_date  DATE,  
  PRIMARY KEY (id),  
  UNIQUE KEY id_UNIQUE (id) 
) ;


DROP TABLE IF EXISTS tf_bank_holiday;
CREATE TABLE tf_bank_holiday (
  id  BIGINT(20) NOT NULL AUTO_INCREMENT,   
  date  DATE,  
  day   VARCHAR(100) DEFAULT NULL,
  Description   VARCHAR(100) DEFAULT NULL,
  Year INT(11) DEFAULT NULL,  
  PRIMARY KEY (id),  
  UNIQUE KEY id_UNIQUE (id) 
) ;

ALTER TABLE tf_investor
ADD whitehall_share DECIMAL;
ALTER TABLE tf_investor
ADD update_date DATE;


DROP TABLE IF EXISTS tf_seller_setting;
CREATE TABLE tf_seller_setting (
  id  BIGINT(20) NOT NULL AUTO_INCREMENT,
  company_Id BIGINT(20) NOT NULL ,  
  seller_transaction_fee  DECIMAL(10,2),  
  seller_finance_fee  DECIMAL(10,4),   
  create_date DATE,
  update_date DATE, 
  PRIMARY KEY (id),  
  UNIQUE KEY id_UNIQUE (id) 
) ;


ALTER TABLE tf_seller_setting
ADD company_Id BIGINT(20) NOT NULL AFTER id,
ADD create_date DATE,
ADD update_date DATE;

ALTER TABLE tf_seller_setting
MODIFY COLUMN company_Id BIGINT(20) NOT NULL,
MODIFY COLUMN create_date DATE,
MODIFY COLUMN update_date DATE;

ALTER TABLE scf_trade
   ADD investor_total_gross_profit  DECIMAL(10,4),
   ADD whitehall_total_share  DECIMAL(10,4),
   ADD investor_total_net_profit  DECIMAL(10,4),
   ADD seller_fees  DECIMAL(10,4),
   ADD whitehall_total_profit DECIMAL(10,4),
   ADD whitehall_net_receivable DECIMAL(10,4),
   ADD seller_net_allotment   DECIMAL(10,4);

   
ALTER TABLE scf_trade
   MODIFY COLUMN investor_total_gross_profit  DECIMAL(10,4),
   MODIFY COLUMN whitehall_total_share  DECIMAL(10,4),
   MODIFY COLUMN investor_total_net_profit  DECIMAL(10,4),
   MODIFY COLUMN seller_fees  DECIMAL(10,4),
   MODIFY COLUMN whitehall_total_profit DECIMAL(10,4),
   MODIFY COLUMN whitehall_net_receivable DECIMAL(10,4),
   MODIFY COLUMN seller_net_allotment   DECIMAL(10,4);
   
   
   ALTER TABLE scf_trade
   ADD seller_transaction_fee  DECIMAL(10,2) AFTER seller_fees;
   
   ALTER TABLE scf_trade
   MODIFY COLUMN investor_total_gross_profit  DECIMAL(10,2),
   MODIFY COLUMN whitehall_total_share  DECIMAL(10,2),
   MODIFY COLUMN investor_total_net_profit  DECIMAL(10,2),
   MODIFY COLUMN seller_fees  DECIMAL(10,2),
   MODIFY COLUMN whitehall_total_profit DECIMAL(10,2),
   MODIFY COLUMN whitehall_net_receivable DECIMAL(10,2),
   MODIFY COLUMN seller_net_allotment   DECIMAL(10,2);
   
      
DROP TABLE IF EXISTS tf_trade_audit;
CREATE TABLE tf_trade_audit(
  id BIGINT(20) NOT NULL AUTO_INCREMENT,
  trade_id BIGINT(20) DEFAULT NULL,  
  user_id BIGINT(20) DEFAULT NULL,
  seller_finance_fee  DECIMAL(10,4),
  seller_transaction_fee  DECIMAL(10,2),
  COMMENT   VARCHAR(500) DEFAULT NULL,
  create_date DATETIME DEFAULT NULL,
  update_date DATETIME DEFAULT NULL, 
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_trade_audit_trade_id` (`trade_id`), 
  KEY `fk_trade_audit_user_id` (`user_id`),
  CONSTRAINT `tf_trade_audit_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`), 
  CONSTRAINT `tf_trade_audit_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tf_user` (`iduser`)
  );
  
  ALTER TABLE tf_allotments
  MODIFY COLUMN  allotment_amount  DECIMAL(10,2),
  MODIFY COLUMN  investor_gross_profit  DECIMAL(10,2), 
  MODIFY COLUMN  whitehall_profit_share  DECIMAL(10,2),    
  MODIFY COLUMN  investor_net_profit  DECIMAL(10,2);
  
  
DROP TABLE IF EXISTS tf_general_setting;
CREATE TABLE tf_general_setting (
  id  BIGINT(20) NOT NULL AUTO_INCREMENT,
  whitehall_share  DECIMAL(10,2), 
  vat  DECIMAL(10,2), 
  seller_transaction_fee  DECIMAL(10,2),  
  seller_finance_fee  DECIMAL(10,4),   
  create_date DATE,
  update_date DATE, 
  PRIMARY KEY (id),  
  UNIQUE KEY id_UNIQUE (id) 
) ;


DROP TABLE IF EXISTS tf_investor_transaction;
CREATE TABLE tf_investor_transaction (
  id  BIGINT(20) NOT NULL AUTO_INCREMENT,
  investor_id  BIGINT(20) NOT NULL,  
  amount  DECIMAL(10,2),  
  transcation_type  VARCHAR(100) DEFAULT NULL,  
  transcation_date DATETIME DEFAULT NULL,  
  trade_id BIGINT(20), 
  reference VARCHAR(250) DEFAULT NULL,  
  PRIMARY KEY (id),  
  UNIQUE KEY id_UNIQUE (id),
  KEY fk_tf_investor_transaction_investor_id (investor_id),  
  CONSTRAINT fk_investor_transaction_investor_id FOREIGN KEY (investor_id) REFERENCES tf_investor (investor_id),
  KEY `fk_investor_transaction_trade_id` (`trade_id`),
  CONSTRAINT `tf_investor_transaction_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`)
) ;

ALTER TABLE tf_allotments
  ADD status    VARCHAR(100) DEFAULT NULL;
  
  ALTER TABLE scf_trade
  ADD scf_id    VARCHAR(100) DEFAULT NULL;
  
ALTER TABLE  tf_investor
ADD cash_position  DECIMAL(10,2) AFTER update_date; 
  
ALTER TABLE scf_invoice CHANGE due_date finance_date Date;

DROP TABLE IF EXISTS tf_whitehall_transaction;
CREATE TABLE tf_whitehall_transaction (
  id  BIGINT(20) NOT NULL AUTO_INCREMENT,  
  amount  DECIMAL(10,2),  
  transcation_type  VARCHAR(100) DEFAULT NULL,  
  transcation_date DATETIME DEFAULT NULL,  
  trade_id BIGINT(20), 
  reference VARCHAR(250) DEFAULT NULL,  
  company_id BIGINT(20), 
  company_type VARCHAR(100) DEFAULT NULL, 
  PRIMARY KEY (id),  
  UNIQUE KEY id_UNIQUE (id), 
  KEY `fk_whitehall_transaction_trade_id` (`trade_id`),
  CONSTRAINT `tf_whitehall_transaction_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`),
  KEY `fk_whitehall_transaction_company_id` (`company_id`),
  CONSTRAINT `tf_whitehall_transaction_cmpIDfk_1` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`)
) ;

ALTER TABLE tf_allotments ADD investor_id BIGINT(20) DEFAULT NULL after trade_id;
ALTER TABLE tf_allotments ADD CONSTRAINT fk_investor_id FOREIGN KEY (investor_id) REFERENCES tf_investor(investor_id);

ALTER TABLE scf_invoice DROP INDEX `invoice_number_UNIQUE`;



DROP TABLE IF EXISTS tf_seller_scfcompany_mapping;
CREATE TABLE tf_seller_scfcompany_mapping (
  id  BIGINT(20) NOT NULL AUTO_INCREMENT, 
  scf_company BIGINT(20), 
  seller_company BIGINT(20),
  PRIMARY KEY (id),  
  UNIQUE KEY id_UNIQUE (id), 

) ;



ALTER TABLE tf_seller_scfcompany_mapping  ADD status    VARCHAR(100) DEFAULT NULL;
ALTER TABLE tf_seller_scfcompany_mapping  ADD update_date    DATETIME DEFAULT NULL;
ALTER TABLE tf_seller_scfcompany_mapping  ADD comment     VARCHAR(300) DEFAULT NULL;

ALTER TABLE tf_whitehall_transaction  ADD scf_trade_id VARCHAR(50) DEFAULT NULL;

