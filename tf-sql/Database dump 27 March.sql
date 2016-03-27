/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.5.40 : Database - whitehall_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`whitehall_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `whitehall_db`;

/*Table structure for table `account_` */

DROP TABLE IF EXISTS `account_`;

CREATE TABLE `account_` (
  `accountId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentAccountId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `legalName` varchar(75) DEFAULT NULL,
  `legalId` varchar(75) DEFAULT NULL,
  `legalType` varchar(75) DEFAULT NULL,
  `sicCode` varchar(75) DEFAULT NULL,
  `tickerSymbol` varchar(75) DEFAULT NULL,
  `industry` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `size_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `account_` */

insert  into `account_`(`accountId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`parentAccountId`,`name`,`legalName`,`legalId`,`legalType`,`sicCode`,`tickerSymbol`,`industry`,`type_`,`size_`) values (10157,10155,0,'','2016-03-15 19:16:25','2016-03-16 19:51:09',0,'WhiteHall Finance','','','','','','','','');

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `uuid_` varchar(75) DEFAULT NULL,
  `addressId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `street1` varchar(75) DEFAULT NULL,
  `street2` varchar(75) DEFAULT NULL,
  `street3` varchar(75) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `zip` varchar(75) DEFAULT NULL,
  `regionId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `mailing` tinyint(4) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `IX_93D5AD4E` (`companyId`),
  KEY `IX_ABD7DAC0` (`companyId`,`classNameId`),
  KEY `IX_71CB1123` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_923BD178` (`companyId`,`classNameId`,`classPK`,`mailing`),
  KEY `IX_9226DBB4` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_5BC8B0D4` (`userId`),
  KEY `IX_381E55DA` (`uuid_`),
  KEY `IX_8FCB620E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `address` */

/*Table structure for table `announcementsdelivery` */

DROP TABLE IF EXISTS `announcementsdelivery`;

CREATE TABLE `announcementsdelivery` (
  `deliveryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `email` tinyint(4) DEFAULT NULL,
  `sms` tinyint(4) DEFAULT NULL,
  `website` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`deliveryId`),
  UNIQUE KEY `IX_BA4413D5` (`userId`,`type_`),
  KEY `IX_6EDB9600` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `announcementsdelivery` */

insert  into `announcementsdelivery`(`deliveryId`,`companyId`,`userId`,`type_`,`email`,`sms`,`website`) values (11402,10155,11308,'general',0,0,1),(11403,10155,11308,'news',0,0,1),(11404,10155,11308,'test',0,0,1),(11428,10155,10199,'general',0,0,1),(11429,10155,10199,'news',0,0,1),(11430,10155,10199,'test',0,0,1),(11431,10155,11336,'general',0,0,1),(11432,10155,11336,'news',0,0,1),(11433,10155,11336,'test',0,0,1),(11434,10155,11407,'general',0,0,1),(11435,10155,11407,'news',0,0,1),(11436,10155,11407,'test',0,0,1);

/*Table structure for table `announcementsentry` */

DROP TABLE IF EXISTS `announcementsentry`;

CREATE TABLE `announcementsentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `content` longtext,
  `url` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `displayDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `alert` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  KEY `IX_A6EF0B81` (`classNameId`,`classPK`),
  KEY `IX_14F06A6B` (`classNameId`,`classPK`,`alert`),
  KEY `IX_D49C2E66` (`userId`),
  KEY `IX_1AFBDE08` (`uuid_`),
  KEY `IX_F2949120` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `announcementsentry` */

/*Table structure for table `announcementsflag` */

DROP TABLE IF EXISTS `announcementsflag`;

CREATE TABLE `announcementsflag` (
  `flagId` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `entryId` bigint(20) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  PRIMARY KEY (`flagId`),
  UNIQUE KEY `IX_4539A99C` (`userId`,`entryId`,`value`),
  KEY `IX_9C7EB9F` (`entryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `announcementsflag` */

/*Table structure for table `assetcategory` */

DROP TABLE IF EXISTS `assetcategory`;

CREATE TABLE `assetcategory` (
  `uuid_` varchar(75) DEFAULT NULL,
  `categoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentCategoryId` bigint(20) DEFAULT NULL,
  `leftCategoryId` bigint(20) DEFAULT NULL,
  `rightCategoryId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `vocabularyId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `IX_BE4DF2BF` (`parentCategoryId`,`name`,`vocabularyId`),
  UNIQUE KEY `IX_E8D019AA` (`uuid_`,`groupId`),
  KEY `IX_E639E2F6` (`groupId`),
  KEY `IX_C7F39FCA` (`groupId`,`name`,`vocabularyId`),
  KEY `IX_852EA801` (`groupId`,`parentCategoryId`,`name`,`vocabularyId`),
  KEY `IX_87603842` (`groupId`,`parentCategoryId`,`vocabularyId`),
  KEY `IX_2008FACB` (`groupId`,`vocabularyId`),
  KEY `IX_D61ABE08` (`name`,`vocabularyId`),
  KEY `IX_7BB1826B` (`parentCategoryId`),
  KEY `IX_9DDD15EA` (`parentCategoryId`,`name`),
  KEY `IX_B185E980` (`parentCategoryId`,`vocabularyId`),
  KEY `IX_4D37BB00` (`uuid_`),
  KEY `IX_BBAF6928` (`uuid_`,`companyId`),
  KEY `IX_287B1F89` (`vocabularyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assetcategory` */

/*Table structure for table `assetcategoryproperty` */

DROP TABLE IF EXISTS `assetcategoryproperty`;

CREATE TABLE `assetcategoryproperty` (
  `categoryPropertyId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `key_` varchar(75) DEFAULT NULL,
  `value` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`categoryPropertyId`),
  UNIQUE KEY `IX_DBD111AA` (`categoryId`,`key_`),
  KEY `IX_99DA856` (`categoryId`),
  KEY `IX_8654719F` (`companyId`),
  KEY `IX_52340033` (`companyId`,`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assetcategoryproperty` */

/*Table structure for table `assetentries_assetcategories` */

DROP TABLE IF EXISTS `assetentries_assetcategories`;

CREATE TABLE `assetentries_assetcategories` (
  `categoryId` bigint(20) NOT NULL,
  `entryId` bigint(20) NOT NULL,
  PRIMARY KEY (`categoryId`,`entryId`),
  KEY `IX_A188F560` (`categoryId`),
  KEY `IX_E119938A` (`entryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assetentries_assetcategories` */

/*Table structure for table `assetentries_assettags` */

DROP TABLE IF EXISTS `assetentries_assettags`;

CREATE TABLE `assetentries_assettags` (
  `entryId` bigint(20) NOT NULL,
  `tagId` bigint(20) NOT NULL,
  PRIMARY KEY (`entryId`,`tagId`),
  KEY `IX_2ED82CAD` (`entryId`),
  KEY `IX_B2A61B55` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assetentries_assettags` */

/*Table structure for table `assetentry` */

DROP TABLE IF EXISTS `assetentry`;

CREATE TABLE `assetentry` (
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `classUuid` varchar(75) DEFAULT NULL,
  `classTypeId` bigint(20) DEFAULT NULL,
  `visible` tinyint(4) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `publishDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `summary` longtext,
  `url` longtext,
  `layoutUuid` varchar(75) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `viewCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_1E9D371D` (`classNameId`,`classPK`),
  KEY `IX_FC1F9C7B` (`classUuid`),
  KEY `IX_7306C60` (`companyId`),
  KEY `IX_75D42FF9` (`expirationDate`),
  KEY `IX_1EBA6821` (`groupId`,`classUuid`),
  KEY `IX_FEC4A201` (`layoutUuid`),
  KEY `IX_2E4E3885` (`publishDate`),
  KEY `IX_9029E15A` (`visible`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assetentry` */

insert  into `assetentry`(`entryId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`classUuid`,`classTypeId`,`visible`,`startDate`,`endDate`,`publishDate`,`expirationDate`,`mimeType`,`title`,`description`,`summary`,`url`,`layoutUuid`,`height`,`width`,`priority`,`viewCount`) values (10180,10173,10155,10159,'','2016-03-15 19:16:29','2016-03-15 19:16:29',10116,10178,'33bf4f21-2b77-4ab2-add3-087be757fd8b',0,0,NULL,NULL,NULL,NULL,'text/html','10176','','','','',0,0,0,0),(10205,10195,10155,10199,'Test Test','2016-03-15 19:16:30','2016-03-21 19:53:29',10005,10199,'ef9bba04-0e53-4973-aa55-7737d676ae5f',0,0,NULL,NULL,NULL,NULL,'','Whitehall Admin','','','','',0,0,0,0),(10326,10318,10155,10159,'','2016-03-15 19:16:36','2016-03-15 19:16:36',10116,10323,'17e6fae1-709c-465f-8669-2f39a4cb0524',0,0,NULL,NULL,NULL,NULL,'text/html','10321','','','','',0,0,0,0),(10337,10330,10155,10159,'','2016-03-15 19:16:37','2016-03-15 19:16:37',10116,10335,'213787ae-278a-44a7-b6fa-02d0b413358a',0,0,NULL,NULL,NULL,NULL,'text/html','10333','','','','',0,0,0,0),(10347,10340,10155,10159,'','2016-03-15 19:16:38','2016-03-15 19:16:38',10116,10345,'8bb9f24b-942c-44a8-b6db-61698c108e49',0,0,NULL,NULL,NULL,NULL,'text/html','10343','','','','',0,0,0,0),(10366,10351,10155,10159,'','2016-03-15 19:16:41','2016-03-15 19:16:41',10116,10364,'7a6ede7b-19d6-4474-bc24-65ae3571b3a2',0,0,NULL,NULL,NULL,NULL,'text/html','10362','','','','',0,0,0,0),(10374,10351,10155,10159,'','2016-03-15 19:16:42','2016-03-15 19:16:42',10116,10372,'09b40a6f-5621-4ff4-81df-109b8b0f5742',0,0,NULL,NULL,NULL,NULL,'text/html','10370','','','','',0,0,0,0),(10392,10377,10155,10159,'','2016-03-15 19:16:43','2016-03-15 19:16:43',10116,10390,'2236a30d-11ad-4d32-8d9a-97e715daf6df',0,0,NULL,NULL,NULL,NULL,'text/html','10388','','','','',0,0,0,0),(10401,10377,10155,10159,'','2016-03-15 19:16:45','2016-03-15 19:16:45',10116,10399,'5b7d3909-7bf0-47a1-acda-98a81284f111',0,0,NULL,NULL,NULL,NULL,'text/html','10397','','','','',0,0,0,0),(10409,10377,10155,10159,'','2016-03-15 19:16:46','2016-03-15 19:16:46',10116,10407,'53840070-809d-4281-ab27-97a5fdc042f4',0,0,NULL,NULL,NULL,NULL,'text/html','10405','','','','',0,0,0,0),(10528,10182,10155,10159,'','2016-03-15 19:18:20','2016-03-15 19:18:20',10011,10526,'83d7c5c3-2105-401e-ad48-fe23dc42e474',0,1,NULL,NULL,NULL,NULL,'image/png','welcome_tools','','','','',0,0,0,2),(10531,10182,10155,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',10116,10529,'12db7bda-3810-42b5-9ab9-237bd90d88e3',0,0,NULL,NULL,NULL,NULL,'text/html','10526','','','','',0,0,0,0),(10537,10182,10155,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',10011,10535,'49654d32-5414-4a3c-8704-a071853a5106',0,1,NULL,NULL,NULL,NULL,'image/png','welcome_learn','','','','',0,0,0,2),(10540,10182,10155,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',10116,10538,'8e54ef5e-f024-4a9c-8acd-b60055cbfab8',0,0,NULL,NULL,NULL,NULL,'text/html','10535','','','','',0,0,0,0),(10547,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10545,'deb8b437-3868-46db-a037-ed1392b35a18',0,1,NULL,NULL,NULL,NULL,'image/png','welcome_cube','','','','',0,0,0,2),(10550,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10116,10548,'20ecfcd8-b59f-43f7-bf25-d083ad494b88',0,0,NULL,NULL,NULL,NULL,'text/html','10545','','','','',0,0,0,0),(10557,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10554,'729f117f-5c83-4fbf-853f-a36459a3b20d',0,1,NULL,NULL,NULL,NULL,'application/pdf','helpful_links_for_using_liferay_portal','','','','',0,0,0,0),(10560,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10116,10558,'c364fa81-4157-44b7-a767-b39721d3d4d5',0,0,NULL,NULL,NULL,NULL,'text/html','10554','','','','',0,0,0,0),(10568,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10566,'808048bd-865f-4076-8681-1f88c6b8b520',0,1,NULL,NULL,NULL,NULL,'image/png','welcome_ee','','','','',0,0,0,2),(10571,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10116,10569,'f7362a62-efa1-43e3-b21c-6fee395d14bb',0,0,NULL,NULL,NULL,NULL,'text/html','10566','','','','',0,0,0,0),(10578,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10576,'8bf62a24-50c9-421b-b069-891f5d14df21',0,1,NULL,NULL,NULL,NULL,'image/png','welcome_community','','','','',0,0,0,2),(10582,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10116,10579,'b015cb9e-1427-4951-9558-3a59c1ab5f5a',0,0,NULL,NULL,NULL,NULL,'text/html','10576','','','','',0,0,0,0),(10642,10202,10155,10199,'Test Test','2016-03-15 19:19:28','2016-03-15 19:19:28',10116,10640,'02de9b62-d939-44a5-b59e-bc727dd36525',0,0,NULL,NULL,NULL,NULL,'text/html','10638','','','','',0,0,0,0),(10648,10202,10155,10199,'Test Test','2016-03-15 19:19:29','2016-03-15 19:19:29',10116,10646,'a7052c0d-43bc-4655-ac30-d9479161cfea',0,0,NULL,NULL,NULL,NULL,'text/html','10644','','','','',0,0,0,0),(10714,10182,10155,10199,'Test Test','2015-08-29 14:06:00','2015-08-29 14:06:00',10012,10713,'c2672da9-7afe-45a3-a442-1ec31cd56bdb',0,1,NULL,NULL,NULL,NULL,'','Invoices','Invoices','','','',0,0,0,0),(10718,10182,10155,10199,'Test Test','2015-10-22 17:39:55','2015-10-22 17:39:55',10012,10717,'0d2c49d1-6c21-4f8f-bfef-d284949fdcc7',0,1,NULL,NULL,NULL,NULL,'','Insurance','Insurance','','','',0,0,0,0),(10722,10182,10155,10199,'Test Test','2015-10-22 19:29:05','2015-10-22 19:29:05',10012,10721,'377dd1cc-4c75-4d30-8295-b987640ab475',0,1,NULL,NULL,NULL,NULL,'','10','Trade Insurance Folder','','','',0,0,0,0),(10726,10182,10155,10199,'Test Test','2015-10-22 19:58:55','2015-10-22 19:58:55',10012,10725,'cc8dbc70-da56-4c54-abd4-13ad1b7de62a',0,1,NULL,NULL,NULL,NULL,'','11','Trade Insurance Folder','','','',0,0,0,0),(10730,10182,10155,10199,'Test Test','2015-11-02 17:54:21','2015-11-02 17:54:21',10012,10729,'930f8558-2eb8-4b3d-867d-59a39753364a',0,1,NULL,NULL,NULL,NULL,'','12','Trade Insurance Folder','','','',0,0,0,0),(10734,10182,10155,10199,'Test Test','2015-11-02 18:08:28','2015-11-02 18:08:28',10012,10733,'4d377d4f-aac6-4698-88bb-e6fcb641ed77',0,1,NULL,NULL,NULL,NULL,'','13','Trade Insurance Folder','','','',0,0,0,0),(10738,10182,10155,10199,'Test Test','2015-11-02 18:17:34','2015-11-02 18:17:34',10012,10737,'e7088430-15e2-4c76-8cb4-e2384b8e145e',0,1,NULL,NULL,NULL,NULL,'','14','Trade Insurance Folder','','','',0,0,0,0),(10742,10182,10155,10199,'Test Test','2015-11-02 18:50:15','2015-11-02 18:50:15',10012,10741,'7e2440c2-ef73-45cc-ae3d-3465313ab952',0,1,NULL,NULL,NULL,NULL,'','15','Trade Insurance Folder','','','',0,0,0,0),(10746,10182,10155,10199,'Test Test','2015-12-27 17:31:39','2015-12-27 17:31:39',10012,10745,'fe61fea1-a8de-44e6-bbdb-0dc460b92a2a',0,1,NULL,NULL,NULL,NULL,'','0','Invoices Document Folder','','','',0,0,0,0),(10750,10182,10155,10199,'Test Test','2015-12-27 17:41:25','2015-12-27 17:41:25',10012,10749,'31aa124f-713c-4439-aab2-a765a20fe8b6',0,1,NULL,NULL,NULL,NULL,'','1','Invoices Document Folder','','','',0,0,0,0),(10754,10182,10155,10199,'Test Test','2015-12-27 17:57:04','2015-12-27 17:57:04',10012,10753,'e40620ff-83a9-4fd2-9c42-760bbb35b015',0,1,NULL,NULL,NULL,NULL,'','2','Invoices Document Folder','','','',0,0,0,0),(10758,10182,10155,10199,'Test Test','2015-12-27 20:22:37','2015-12-27 20:22:37',10012,10757,'832642d5-9261-4104-b28e-92ea383fc7a3',0,1,NULL,NULL,NULL,NULL,'','3','Invoices Document Folder','','','',0,0,0,0),(10762,10182,10155,10199,'Test Test','2015-12-27 20:35:39','2015-12-27 20:35:39',10012,10761,'9036ac98-7ebb-453f-b718-8b77e23b5167',0,1,NULL,NULL,NULL,NULL,'','4','Invoices Document Folder','','','',0,0,0,0),(10767,10182,10155,10199,'Test Test','2015-10-22 19:29:07','2015-10-22 19:29:07',10011,10765,'f0f9261c-f936-4d55-8bd7-c439181af63b',0,1,NULL,NULL,NULL,NULL,'text/plain','faq_page (1).txt','faq_page (1).txt','','','',0,0,0,0),(10770,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10116,10768,'8ed6ae3f-cdea-451d-986f-62595afa570e',0,0,NULL,NULL,NULL,NULL,'text/html','10765','','','','',0,0,0,0),(10776,10182,10155,10199,'Test Test','2015-10-22 19:58:55','2015-10-22 19:58:55',10011,10774,'2f1c5ccf-9a97-4064-9582-95f72f57800b',0,1,NULL,NULL,NULL,NULL,'text/plain','faq_page.txt','faq_page.txt','','','',0,0,0,0),(10779,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10116,10777,'2b154e5a-bbd3-44d8-a2b1-dbefe6bc9567',0,0,NULL,NULL,NULL,NULL,'text/html','10774','','','','',0,0,0,0),(10785,10182,10155,10199,'Test Test','2015-11-02 17:54:21','2015-11-02 17:54:21',10011,10783,'59eba706-a80e-4067-a8b9-37a83f24aa3a',0,1,NULL,NULL,NULL,NULL,'application/pdf','Covering Letter.pdf','Covering Letter.pdf','','','',0,0,0,0),(10788,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10116,10786,'963f6eeb-4f53-4a0c-b7a3-3837af80632b',0,0,NULL,NULL,NULL,NULL,'text/html','10783','','','','',0,0,0,0),(10794,10182,10155,10199,'Test Test','2015-11-02 18:08:28','2015-11-02 18:08:28',10011,10792,'8f61a626-4e3b-4e06-ae6e-b16475d819c9',0,1,NULL,NULL,NULL,NULL,'application/pdf','Covering Letter.pdf','Covering Letter.pdf','','','',0,0,0,0),(10797,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10116,10795,'a9763657-c9cc-4a3c-bafc-dc6cc2d13053',0,0,NULL,NULL,NULL,NULL,'text/html','10792','','','','',0,0,0,0),(10803,10182,10155,10199,'Test Test','2015-11-02 18:17:34','2015-11-02 18:17:34',10011,10801,'7c49521f-b4af-4ee4-a8c7-0f715212f9c0',0,1,NULL,NULL,NULL,NULL,'application/pdf','Covering Letter.pdf','Covering Letter.pdf','','','',0,0,0,0),(10806,10182,10155,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',10116,10804,'49dfeb16-9ba3-4d7a-b1e7-87b464bd79d5',0,0,NULL,NULL,NULL,NULL,'text/html','10801','','','','',0,0,0,0),(10812,10182,10155,10199,'Test Test','2015-11-02 18:50:15','2015-11-02 18:50:15',10011,10810,'4f099e3d-4255-4f58-83e4-a8daa0c33afc',0,1,NULL,NULL,NULL,NULL,'application/pdf','Covering Letter.pdf','Covering Letter.pdf','','','',0,0,0,0),(10815,10182,10155,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',10116,10813,'efc87aca-a336-4763-826f-bfc0d677f694',0,0,NULL,NULL,NULL,NULL,'text/html','10810','','','','',0,0,0,0),(10821,10182,10155,10199,'Test Test','2015-12-27 17:31:40','2015-12-27 17:31:40',10011,10819,'4976b1d8-0731-4404-9ce1-5ec520a71252',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','','','',0,0,0,0),(10824,10182,10155,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',10116,10822,'2b52d739-2de3-4127-a47c-1a45e0606d02',0,0,NULL,NULL,NULL,NULL,'text/html','10819','','','','',0,0,0,0),(10830,10182,10155,10199,'Test Test','2015-12-27 17:41:25','2015-12-27 17:41:25',10011,10828,'1aa05a74-a0f8-4801-b3c1-967d3cb7c99d',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','','','',0,0,0,0),(10833,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10116,10831,'f9f37226-2370-4269-b5f1-66bea4d1380b',0,0,NULL,NULL,NULL,NULL,'text/html','10828','','','','',0,0,0,0),(10839,10182,10155,10199,'Test Test','2015-12-27 17:57:05','2015-12-27 17:57:05',10011,10837,'372ebab2-d19d-4ecd-890b-524d47e80668',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','','','',0,0,0,0),(10842,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10116,10840,'775ac69c-c65c-4f7d-a965-3d246446f7e9',0,0,NULL,NULL,NULL,NULL,'text/html','10837','','','','',0,0,0,0),(10848,10182,10155,10199,'Test Test','2015-12-27 20:22:37','2015-12-27 20:22:37',10011,10846,'026b9efb-b044-456c-b3b9-129746e700d6',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','','','',0,0,0,0),(10851,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10116,10849,'edd405d9-1483-483e-a454-0a8437412f6a',0,0,NULL,NULL,NULL,NULL,'text/html','10846','','','','',0,0,0,0),(10857,10182,10155,10199,'Test Test','2015-12-27 20:35:39','2015-12-27 20:35:39',10011,10855,'0d4ec121-4f11-4cba-94cb-7dfaf9e1a4f9',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','','','',0,0,0,0),(10860,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10116,10858,'73178664-9eb7-45e9-a7e6-eeefe3da8101',0,0,NULL,NULL,NULL,NULL,'text/html','10855','','','','',0,0,0,0),(10873,10182,10155,10199,'Test Test','2015-07-17 20:44:10','2015-07-17 20:44:10',10443,10871,'0b7de103-7134-436d-8691-b27a2dfaec34',0,1,NULL,NULL,NULL,NULL,'text','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Liferay</Name></root>','','','','',0,0,0,0),(11165,11148,10155,10159,'','2016-03-15 21:10:38','2016-03-15 21:10:38',10109,11163,'a4b204a8-8477-4ddf-9d5f-445636e9c804',11159,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Main Carousel</Title></root>','','','','',0,0,0,0),(11168,11148,10155,10159,'','2016-03-15 21:10:38','2016-03-15 21:10:38',10116,11166,'c4fc4dcf-6742-4fae-9b64-e020c53c9794',0,0,NULL,NULL,NULL,NULL,'text/html','11163','','','','',0,0,0,0),(11174,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',10109,11172,'3508241e-4e1a-40cc-80ef-b6277591b447',0,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Customize it</Title></root>','','','','',0,0,0,0),(11177,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',10116,11175,'3d5a86b9-23dc-4066-b6e0-4c932629278f',0,0,NULL,NULL,NULL,NULL,'text/html','11172','','','','',0,0,0,0),(11182,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',10109,11180,'ae5da936-7e32-4b89-8250-290055aa6400',0,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Did you know</Title></root>','','','','',0,0,0,0),(11185,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',10116,11183,'bf11b8cb-63ce-492e-9118-87db5c61d76b',0,0,NULL,NULL,NULL,NULL,'text/html','11180','','','','',0,0,0,0),(11193,11148,10155,10159,'','2016-03-15 21:10:40','2016-03-15 21:10:40',10116,11191,'a164d911-eed4-4302-b8f2-270a011653fe',0,0,NULL,NULL,NULL,NULL,'text/html','11189','','','','',0,0,0,0),(11314,10195,10155,10159,'','2016-03-16 04:54:01','2016-03-21 18:11:52',10005,11308,'945d6f81-aab4-4205-aa45-0c35a5300b35',0,0,NULL,NULL,NULL,NULL,'','Gautam Sharma','','','','',0,0,0,0),(11319,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:16','2016-03-16 04:54:16',10116,11317,'98233578-124c-4e81-91a4-b2116f0726de',0,0,NULL,NULL,NULL,NULL,'text/html','11315','','','','',0,0,0,0),(11325,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:17','2016-03-16 04:54:17',10116,11323,'cb0ebcbb-baac-4d52-a406-848a6a4d2ae8',0,0,NULL,NULL,NULL,NULL,'text/html','11321','','','','',0,0,0,0),(11342,10195,10155,10199,'Test Test','2016-03-16 05:02:06','2016-03-16 19:51:41',10005,11336,'2f084273-be47-4e02-a15d-d851c651c7b5',0,0,NULL,NULL,NULL,NULL,'','dhanush kodi','','','','',0,0,0,0),(11413,10195,10155,10159,'','2016-03-16 19:40:53','2016-03-16 19:40:53',10005,11407,'97369875-4f29-45b5-b491-e28ecc3d4265',0,0,NULL,NULL,NULL,NULL,'','Primarry Investor1','','','','',0,0,0,0),(11418,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:06','2016-03-16 19:41:06',10116,11416,'2e0a7f58-dec6-4dcc-b05c-7dc1b04f1f6e',0,0,NULL,NULL,NULL,NULL,'text/html','11414','','','','',0,0,0,0),(11424,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:07','2016-03-16 19:41:07',10116,11422,'1f6b8232-12fe-41b7-b79e-3ecd1be3ac74',0,0,NULL,NULL,NULL,NULL,'text/html','11420','','','','',0,0,0,0),(11443,10195,10155,10159,'','2016-03-16 20:05:15','2016-03-16 20:05:15',10005,11437,'56859c18-0b15-42a4-be73-983d0ad65b1e',0,0,NULL,NULL,NULL,NULL,'','Primary  Investor2','','','','',0,0,0,0),(11448,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:45','2016-03-16 20:05:45',10116,11446,'cdf476a0-64ff-480f-8f64-0bc625d0fc91',0,0,NULL,NULL,NULL,NULL,'text/html','11444','','','','',0,0,0,0),(11454,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:46','2016-03-16 20:05:46',10116,11452,'e78e0b12-2e95-4285-80c9-4efdf47c2a39',0,0,NULL,NULL,NULL,NULL,'text/html','11450','','','','',0,0,0,0),(11463,10195,10155,10159,'','2016-03-16 20:32:10','2016-03-16 20:32:10',10005,11457,'d0623694-6ea8-4817-b28c-9db467ca7772',0,0,NULL,NULL,NULL,NULL,'','seller whitehall2','','','','',0,0,0,0),(11468,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',10116,11466,'a23fc466-6910-4d6a-8888-704eb13034e5',0,0,NULL,NULL,NULL,NULL,'text/html','11464','','','','',0,0,0,0),(11474,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',10116,11472,'44e23dee-4d26-4d45-bdbb-8a86408ceb2d',0,0,NULL,NULL,NULL,NULL,'text/html','11470','','','','',0,0,0,0),(11483,10195,10155,10159,'','2016-03-16 20:35:20','2016-03-16 20:35:20',10005,11477,'5fde664e-4e92-4be1-9405-7c566a13e53a',0,0,NULL,NULL,NULL,NULL,'','Pr Investor3','','','','',0,0,0,0),(11488,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',10116,11486,'831f386a-bf87-4cdc-aa7d-d3d71f39a063',0,0,NULL,NULL,NULL,NULL,'text/html','11484','','','','',0,0,0,0),(11494,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',10116,11492,'067e8e10-76d1-42b4-867f-74a2d0bbd3db',0,0,NULL,NULL,NULL,NULL,'text/html','11490','','','','',0,0,0,0),(11503,10195,10155,10159,'','2016-03-16 20:52:31','2016-03-16 20:52:31',10005,11497,'4f620401-6be9-4192-8dd7-6f9dacea789c',0,0,NULL,NULL,NULL,NULL,'','Pr Investor4','','','','',0,0,0,0),(11508,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:49','2016-03-16 20:52:49',10116,11506,'0b745cf7-3624-4835-ba2e-38a59a91f3bb',0,0,NULL,NULL,NULL,NULL,'text/html','11504','','','','',0,0,0,0),(11514,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:50','2016-03-16 20:52:50',10116,11512,'ddcba205-be7a-472f-876c-16705ce77cad',0,0,NULL,NULL,NULL,NULL,'text/html','11510','','','','',0,0,0,0),(11523,10195,10155,10159,'','2016-03-16 20:56:48','2016-03-16 20:56:48',10005,11517,'6629a562-c93c-49b2-bfbe-e97fe0ae9732',0,0,NULL,NULL,NULL,NULL,'','seller whitehall3','','','','',0,0,0,0),(11528,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',10116,11526,'a7693cde-b646-4f6a-8d40-c805b09f53ec',0,0,NULL,NULL,NULL,NULL,'text/html','11524','','','','',0,0,0,0),(11534,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',10116,11532,'08780dfa-2f6e-4250-bb47-7d9de39be670',0,0,NULL,NULL,NULL,NULL,'text/html','11530','','','','',0,0,0,0),(11543,10195,10155,10159,'','2016-03-16 21:00:32','2016-03-16 21:00:32',10005,11537,'4eb2f146-0730-4d5d-bbd2-319c68d9b52a',0,0,NULL,NULL,NULL,NULL,'','scf company2','','','','',0,0,0,0),(11548,11540,10155,11537,'scf company2','2016-03-16 21:00:43','2016-03-16 21:00:43',10116,11546,'0aaf9bfe-f395-4092-804f-fc837ec7434f',0,0,NULL,NULL,NULL,NULL,'text/html','11544','','','','',0,0,0,0),(11554,11540,10155,11537,'scf company2','2016-03-16 21:00:44','2016-03-16 21:00:44',10116,11552,'9f6bda41-5419-4598-8af9-291ae16ef58e',0,0,NULL,NULL,NULL,NULL,'text/html','11550','','','','',0,0,0,0),(11711,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:08','2016-03-19 14:00:08',10116,11709,'259ee396-891e-49d0-bf7d-0e242a04b96a',0,0,NULL,NULL,NULL,NULL,'text/html','11707','','','','',0,0,0,0),(11717,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:09','2016-03-19 14:00:09',10116,11715,'f3627f0f-4ae2-4103-85a5-e1e4a67a7054',0,0,NULL,NULL,NULL,NULL,'text/html','11713','','','','',0,0,0,0),(11816,10182,10155,10199,'Whitehall Admin','2016-03-16 08:26:30','2016-03-16 08:26:30',10109,11639,'c7cd3e6e-0768-4c59-baf6-9170617d408c',0,0,NULL,NULL,NULL,NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By WhitehallAdmin</Title></root>','','','','',0,0,0,0),(11826,10182,10155,10199,'Whitehall Admin','2016-03-19 20:21:28','2016-03-19 20:21:28',10012,11825,'dd4f97d9-e656-41e5-9acb-4787a6307801',0,1,NULL,NULL,NULL,NULL,'','5','Invoices Document Folder','','','',0,0,0,0),(11831,10182,10155,10199,'Whitehall Admin','2016-03-19 20:21:29','2016-03-19 20:21:29',10011,11829,'1ec7e94c-d063-4e35-9c77-8c79709936f1',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','','','',0,0,0,0),(11834,10182,10155,10199,'Whitehall Admin','2016-03-19 20:21:29','2016-03-19 20:21:29',10116,11832,'ce72dc07-8cf8-4e20-9ca6-d86b2ee236e4',0,0,NULL,NULL,NULL,NULL,'text/html','11829','','','','',0,0,0,0),(12169,10182,10155,10199,'Whitehall Admin','2016-03-16 08:03:06','2016-03-18 11:47:34',10109,12167,'cc25373e-b7a0-4c29-9408-8419d3b2678c',0,1,NULL,NULL,'2016-03-16 08:02:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By SCF Company</Title></root>','','','','',0,0,0,0),(12172,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:51','2016-03-21 21:13:51',10116,12170,'fa19e74f-86ae-4e4c-99fa-dc098275c0d1',0,0,NULL,NULL,NULL,NULL,'text/html','12167','','','','',0,0,0,0),(12195,10182,10155,10199,'Whitehall Admin','2016-03-16 08:05:03','2016-03-18 11:47:53',10109,12193,'1715a17d-f9d8-42ec-bf20-ccfe6f23162f',0,1,NULL,NULL,'2016-03-16 08:04:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By WhitehallAdmin</Title></root>','','','','',0,0,0,0),(12198,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:53','2016-03-21 21:13:53',10116,12196,'b0c7cd62-395a-4761-a376-40c1eccefc12',0,0,NULL,NULL,NULL,NULL,'text/html','12193','','','','',0,0,0,0),(12221,10182,10155,10199,'Whitehall Admin','2016-03-16 08:06:00','2016-03-18 11:47:45',10109,12219,'063eae7f-5ff8-465b-a87b-93101cb1c26e',0,1,NULL,NULL,'2016-03-16 08:05:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Request For Finanace</Title></root>','','','','',0,0,0,0),(12224,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',10116,12222,'1e71f3e6-f2ba-4528-8022-47da22231a66',0,0,NULL,NULL,NULL,NULL,'text/html','12219','','','','',0,0,0,0),(12243,10182,10155,10199,'Whitehall Admin','2016-03-16 08:09:42','2016-03-18 11:48:01',10109,12241,'267bb055-cb16-4107-98e0-ac8551b76e20',0,1,NULL,NULL,'2016-03-16 08:09:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Allotment Made</Title></root>','','','','',0,0,0,0),(12246,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',10116,12244,'804047ac-2c8e-4e97-bf5d-e39d9ae865c0',0,0,NULL,NULL,NULL,NULL,'text/html','12241','','','','',0,0,0,0),(12261,10182,10155,10199,'Whitehall Admin','2016-03-16 08:10:15','2016-03-18 11:48:08',10109,12259,'29b095dc-091f-4144-b0eb-50f2e368b4e3',0,1,NULL,NULL,'2016-03-16 08:09:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Paid</Title></root>','','','','',0,0,0,0),(12264,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',10116,12262,'556a582a-566a-4bfb-ad04-d39f567db159',0,0,NULL,NULL,NULL,NULL,'text/html','12259','','','','',0,0,0,0),(12283,10182,10155,10199,'Whitehall Admin','2016-03-16 08:11:10','2016-03-18 11:48:17',10109,12281,'908973fe-3beb-4949-979c-eee17184a082',0,1,NULL,NULL,'2016-03-16 08:10:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Invoice Payment Date Due</Title></root>','','','','',0,0,0,0),(12286,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:55','2016-03-21 21:13:55',10116,12284,'d5bb5efb-427d-4d48-9aba-e97f5eddb963',0,0,NULL,NULL,NULL,NULL,'text/html','12281','','','','',0,0,0,0),(12505,10182,10155,10199,'Whitehall Admin','2016-03-24 11:27:24','2016-03-24 11:27:24',10116,12503,'27868ea2-009d-4bac-96ea-29eb4c57683a',0,0,NULL,NULL,NULL,NULL,'text/html','12501','','','','',0,0,0,0);

/*Table structure for table `assetlink` */

DROP TABLE IF EXISTS `assetlink`;

CREATE TABLE `assetlink` (
  `linkId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `entryId1` bigint(20) DEFAULT NULL,
  `entryId2` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`linkId`),
  UNIQUE KEY `IX_8F542794` (`entryId1`,`entryId2`,`type_`),
  KEY `IX_128516C8` (`entryId1`),
  KEY `IX_56E0AB21` (`entryId1`,`entryId2`),
  KEY `IX_14D5A20D` (`entryId1`,`type_`),
  KEY `IX_12851A89` (`entryId2`),
  KEY `IX_91F132C` (`entryId2`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assetlink` */

/*Table structure for table `assettag` */

DROP TABLE IF EXISTS `assettag`;

CREATE TABLE `assettag` (
  `tagId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `assetCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`tagId`),
  KEY `IX_7C9E46BA` (`groupId`),
  KEY `IX_D63322F9` (`groupId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assettag` */

/*Table structure for table `assettagproperty` */

DROP TABLE IF EXISTS `assettagproperty`;

CREATE TABLE `assettagproperty` (
  `tagPropertyId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `tagId` bigint(20) DEFAULT NULL,
  `key_` varchar(75) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tagPropertyId`),
  UNIQUE KEY `IX_2C944354` (`tagId`,`key_`),
  KEY `IX_DFF1F063` (`companyId`),
  KEY `IX_13805BF7` (`companyId`,`key_`),
  KEY `IX_3269E180` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assettagproperty` */

/*Table structure for table `assettagstats` */

DROP TABLE IF EXISTS `assettagstats`;

CREATE TABLE `assettagstats` (
  `tagStatsId` bigint(20) NOT NULL,
  `tagId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `assetCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`tagStatsId`),
  UNIQUE KEY `IX_56682CC4` (`tagId`,`classNameId`),
  KEY `IX_50702693` (`classNameId`),
  KEY `IX_9464CA` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assettagstats` */

/*Table structure for table `assetvocabulary` */

DROP TABLE IF EXISTS `assetvocabulary`;

CREATE TABLE `assetvocabulary` (
  `uuid_` varchar(75) DEFAULT NULL,
  `vocabularyId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `settings_` longtext,
  PRIMARY KEY (`vocabularyId`),
  UNIQUE KEY `IX_1B2B8792` (`uuid_`,`groupId`),
  KEY `IX_B22D908C` (`companyId`),
  KEY `IX_B6B8CA0E` (`groupId`),
  KEY `IX_C0AAD74D` (`groupId`,`name`),
  KEY `IX_55F58818` (`uuid_`),
  KEY `IX_C4E6FD10` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assetvocabulary` */

insert  into `assetvocabulary`(`uuid_`,`vocabularyId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`title`,`description`,`settings_`) values ('ebab05eb-8270-4855-9c0a-6826eb1dc8dd',10325,10195,10155,10159,'','2016-03-15 19:16:36','2016-03-15 19:16:36','Topic','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic</Title></root>','',''),('3626f241-1afc-42e7-bbfa-bd8b371afad2',10692,10182,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:55:02','Topic','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic</Title></root>','',''),('b8c13a99-9288-4798-8477-caee12ecf06d',10693,10182,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:55:02','Topic (2)','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic (2)</Title></root>','','');

/*Table structure for table `backgroundtask` */

DROP TABLE IF EXISTS `backgroundtask`;

CREATE TABLE `backgroundtask` (
  `backgroundTaskId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `servletContextNames` varchar(255) DEFAULT NULL,
  `taskExecutorClassName` varchar(200) DEFAULT NULL,
  `taskContext` longtext,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusMessage` longtext,
  PRIMARY KEY (`backgroundTaskId`),
  KEY `IX_C5A6C78F` (`companyId`),
  KEY `IX_5A09E5D1` (`groupId`),
  KEY `IX_98CC0AAB` (`groupId`,`name`,`taskExecutorClassName`),
  KEY `IX_579C63B0` (`groupId`,`name`,`taskExecutorClassName`,`completed`),
  KEY `IX_C71C3B7` (`groupId`,`status`),
  KEY `IX_A73B688A` (`groupId`,`taskExecutorClassName`),
  KEY `IX_7A9FF471` (`groupId`,`taskExecutorClassName`,`completed`),
  KEY `IX_7E757D70` (`groupId`,`taskExecutorClassName`,`status`),
  KEY `IX_C07CC7F8` (`name`),
  KEY `IX_75638CDF` (`status`),
  KEY `IX_2FCFE748` (`taskExecutorClassName`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `backgroundtask` */

insert  into `backgroundtask`(`backgroundTaskId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`servletContextNames`,`taskExecutorClassName`,`taskContext`,`completed`,`completionDate`,`status`,`statusMessage`) values (10673,10182,10155,10199,'Test Test','2016-03-15 20:50:46','2016-03-15 20:51:00','Public_Pages-201601250453.lar','','com.liferay.portal.lar.backgroundtask.LayoutImportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"import\",\"parameterMap\":{\"map\":{\"PORTLET_USER_PREFERENCES_1_WAR_calendarportletCheckbox\":[\"true\"],\"PORTLET_SETUP_58Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_183\":[\"true\"],\"PORTLET_USER_PREFERENCES_183Checkbox\":[\"true\"],\"DELETE_MISSING_LAYOUTS\":[\"false\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_58Checkbox\":[\"true\"],\"PORTLET_DATA_183Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_15Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_36\":[\"true\"],\"PORTLET_USER_PREFERENCES_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_33\":[\"true\"],\"PORTLET_USER_PREFERENCES_25Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_178\":[\"true\"],\"PORTLET_CONFIGURATION_178Checkbox\":[\"true\"],\"COMMENTS\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_USER_PREFERENCES_161Checkbox\":[\"true\"],\"cmd\":[\"import\"],\"RATINGSCheckbox\":[\"true\"],\"PORTLET_SETUP_178Checkbox\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_19Checkbox\":[\"true\"],\"PORTLET_SETUP_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_161\":[\"true\"],\"PORTLET_CONFIGURATION_19\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_162\":[\"true\"],\"DELETE_PORTLET_DATA\":[\"false\"],\"PORTLET_CONFIGURATION_15\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"USER_ID_STRATEGY\":[\"CURRENT_USER_ID\"],\"LOGOCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_162Checkbox\":[\"true\"],\"PORTLET_SETUP_28Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_58\":[\"true\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_167Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_154Checkbox\":[\"true\"],\"PORTLET_SETUP_161Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_28Checkbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_1_WAR_calendarportlet\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_20Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_1_WAR_calendarportlet\":[\"true\"],\"PORTLET_SETUP_25Checkbox\":[\"true\"],\"PORTLET_DATA_1_WAR_calendarportletCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_15Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_1_WAR_calendarportletCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_167\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_20\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"_journal_structures\":[\"true\"],\"THEME_REFERENCE\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"PORTLET_SETUP_20Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_28\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"PORTLET_USER_PREFERENCES_25\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"_portlet_display_templates_application-display-templates\":[\"true\"],\"PORTLET_USER_PREFERENCES_33\":[\"true\"],\"PORTLET_SETUP_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_183\":[\"true\"],\"PORTLET_USER_PREFERENCES_19Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_154Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_36\":[\"true\"],\"_document_library_documents\":[\"true\"],\"PORTLET_DATA_167Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_20Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_178Checkbox\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"PORTLET_USER_PREFERENCES_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_178\":[\"true\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_20Checkbox\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_178Checkbox\":[\"true\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=GgVUvL1x&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=10620&controlPanelCategory=sites&_156_groupId=10182&_156_tabs2=current-and-previous&_156_struts_action=%2Fgroup_pages%2Fimport_layouts&_156_privateLayout=false\"],\"PORTLET_CONFIGURATION_167\":[\"true\"],\"PORTLET_CONFIGURATION_58Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_161\":[\"true\"],\"PORTLET_CONFIGURATION_162\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_15Checkbox\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_58\":[\"true\"],\"PORTLET_CONFIGURATION_161Checkbox\":[\"true\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_162Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_1_WAR_calendarportletCheckbox\":[\"true\"],\"privateLayout\":[\"false\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_154\":[\"true\"],\"PORTLET_USER_PREFERENCES_154\":[\"true\"],\"PORTLET_CONFIGURATION_33Checkbox\":[\"true\"],\"PORTLET_SETUP_183\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"PORTLET_SETUP_183Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_28Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_161Checkbox\":[\"true\"],\"LOGO\":[\"true\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"true\"],\"PORTLET_SETUP_178\":[\"true\"],\"PORTLET_SETUP_58\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_USER_PREFERENCES_58Checkbox\":[\"true\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"CATEGORIESCheckbox\":[\"true\"],\"PORTLET_SETUP_167\":[\"true\"],\"PORTLET_SETUP_1_WAR_calendarportlet\":[\"true\"],\"PERMISSIONSCheckbox\":[\"false\"],\"PORTLET_SETUP_19Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_1_WAR_calendarportlet\":[\"true\"],\"PORTLET_SETUP_162Checkbox\":[\"true\"],\"PORTLET_SETUP_161\":[\"true\"],\"PORTLET_SETUP_162\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"PORTLET_USER_PREFERENCES_19\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"PORTLET_USER_PREFERENCES_15\":[\"true\"],\"PORTLET_SETUP_15Checkbox\":[\"true\"],\"PORTLET_SETUP_154\":[\"true\"],\"PORTLET_SETUP_167Checkbox\":[\"true\"],\"PORTLET_DATA_183\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_183Checkbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"PORTLET_CONFIGURATION_167Checkbox\":[\"true\"],\"groupId\":[\"10182\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"PORTLET_SETUP_25\":[\"true\"],\"PORTLET_CONFIGURATION_20\":[\"true\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"PORTLET_SETUP_28\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_25\":[\"true\"],\"PORTLET_USER_PREFERENCES_36Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_28\":[\"true\"],\"PORTLET_SETUP_20\":[\"true\"],\"formDate\":[\"1458075035071\"],\"PORTLET_USER_PREFERENCES_154Checkbox\":[\"true\"],\"RATINGS\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_20\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_36Checkbox\":[\"true\"],\"PORTLET_DATA_167\":[\"true\"],\"PORTLET_CONFIGURATION_28\":[\"true\"],\"PORTLET_SETUP_36Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"PORTLET_CONFIGURATION_25\":[\"true\"],\"PORTLET_DATA_15\":[\"true\"],\"PORTLET_CONFIGURATION_33\":[\"true\"],\"PORTLET_SETUP_15\":[\"true\"],\"PORTLET_USER_PREFERENCES_183\":[\"true\"],\"PORTLET_SETUP_19\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_19\":[\"true\"],\"PORTLET_CONFIGURATION_25Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_15\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_25Checkbox\":[\"true\"],\"PORTLET_SETUP_154Checkbox\":[\"true\"],\"PORTLET_SETUP_33Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_167Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_154\":[\"true\"],\"struts_action\":[\"/group_pages/import_layouts\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_33Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_36\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_178\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"PORTLET_CONFIGURATION_183Checkbox\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"DATA_STRATEGY\":[\"DATA_STRATEGY_MIRROR\"],\"PORTLET_CONFIGURATION_36Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_162\":[\"true\"],\"PORTLET_USER_PREFERENCES_161\":[\"true\"],\"PORTLET_USER_PREFERENCES_28Checkbox\":[\"true\"],\"PORTLET_SETUP_36\":[\"true\"],\"PORTLET_SETUP_33\":[\"true\"],\"PORTLET_SETUP_1_WAR_calendarportletCheckbox\":[\"true\"],\"_journal_web-contentCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_167\":[\"true\"],\"PORTLET_CONFIGURATION_162Checkbox\":[\"true\"],\"CATEGORIES\":[\"true\"],\"PORTLET_CONFIGURATION_58\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_19Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_33Checkbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"20160315205046603GNUERLEH.lar\",\"privateLayout\":false},\"javaClass\":\"java.util.HashMap\"}',1,'2016-03-15 20:51:00',3,''),(10956,10182,10155,10199,'Test Test','2016-03-15 20:55:01','2016-03-15 20:55:06','Private_Pages-201601250454.lar','','com.liferay.portal.lar.backgroundtask.LayoutImportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"import\",\"parameterMap\":{\"map\":{\"PORTLET_USER_PREFERENCES_154\":[\"true\"],\"PORTLET_USER_PREFERENCES_1_WAR_calendarportletCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_183\":[\"true\"],\"PORTLET_CONFIGURATION_33Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_183Checkbox\":[\"true\"],\"PORTLET_SETUP_183\":[\"true\"],\"DELETE_MISSING_LAYOUTS\":[\"false\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"PORTLET_SETUP_183Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_28Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_161Checkbox\":[\"true\"],\"LOGO\":[\"true\"],\"PORTLET_DATA_183Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_36\":[\"true\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"true\"],\"PORTLET_CONFIGURATION_15Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_33\":[\"true\"],\"PORTLET_USER_PREFERENCES_25Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_178\":[\"true\"],\"PORTLET_CONFIGURATION_178Checkbox\":[\"true\"],\"PORTLET_SETUP_178\":[\"true\"],\"COMMENTS\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_1_WAR_opensocialportlet\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_USER_PREFERENCES_161Checkbox\":[\"true\"],\"cmd\":[\"import\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"PORTLET_SETUP_178Checkbox\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"CATEGORIESCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_19Checkbox\":[\"true\"],\"PORTLET_SETUP_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_161\":[\"true\"],\"PORTLET_SETUP_1_WAR_calendarportlet\":[\"true\"],\"PORTLET_SETUP_167\":[\"true\"],\"PORTLET_CONFIGURATION_19\":[\"true\"],\"PERMISSIONSCheckbox\":[\"false\"],\"PORTLET_SETUP_19Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_162\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_1_WAR_calendarportlet\":[\"true\"],\"DELETE_PORTLET_DATA\":[\"false\"],\"PORTLET_CONFIGURATION_15\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"USER_ID_STRATEGY\":[\"ALWAYS_CURRENT_USER_ID\"],\"PORTLET_SETUP_162Checkbox\":[\"true\"],\"PORTLET_SETUP_161\":[\"true\"],\"PORTLET_SETUP_162\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"PORTLET_USER_PREFERENCES_19\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_15\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_162Checkbox\":[\"true\"],\"PORTLET_SETUP_28Checkbox\":[\"true\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_SETUP_15Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_167Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_154Checkbox\":[\"true\"],\"PORTLET_SETUP_161Checkbox\":[\"true\"],\"PORTLET_SETUP_154\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PORTLET_CONFIGURATION_28Checkbox\":[\"true\"],\"PORTLET_SETUP_167Checkbox\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"PORTLET_DATA_183\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_183Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_1_WAR_calendarportlet\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"PORTLET_CONFIGURATION_167Checkbox\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_20Checkbox\":[\"true\"],\"groupId\":[\"10182\"],\"PORTLET_CONFIGURATION_1_WAR_calendarportlet\":[\"true\"],\"PORTLET_SETUP_25Checkbox\":[\"true\"],\"PORTLET_DATA_1_WAR_calendarportletCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_15Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_1_WAR_calendarportletCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_167\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"PORTLET_CONFIGURATION_20\":[\"true\"],\"PORTLET_SETUP_25\":[\"true\"],\"PORTLET_USER_PREFERENCES_20\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"_journal_structures\":[\"true\"],\"THEME_REFERENCE\":[\"true\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"PORTLET_SETUP_28\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_SETUP_20Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_25\":[\"true\"],\"PORTLET_USER_PREFERENCES_36Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_28\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_28\":[\"true\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"PORTLET_SETUP_20\":[\"true\"],\"formDate\":[\"1458075284633\"],\"PORTLET_USER_PREFERENCES_25\":[\"true\"],\"PORTLET_USER_PREFERENCES_154Checkbox\":[\"true\"],\"RATINGS\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_20\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_36Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_167\":[\"true\"],\"PORTLET_CONFIGURATION_28\":[\"true\"],\"_portlet_display_templates_application-display-templates\":[\"true\"],\"PORTLET_SETUP_36Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"PORTLET_CONFIGURATION_25\":[\"true\"],\"PORTLET_DATA_15\":[\"true\"],\"PORTLET_CONFIGURATION_33\":[\"true\"],\"PORTLET_SETUP_15\":[\"true\"],\"PORTLET_USER_PREFERENCES_33\":[\"true\"],\"PORTLET_SETUP_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_183\":[\"true\"],\"PORTLET_USER_PREFERENCES_19Checkbox\":[\"true\"],\"PORTLET_SETUP_19\":[\"true\"],\"PORTLET_CONFIGURATION_183\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_19\":[\"true\"],\"PORTLET_CONFIGURATION_25Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_15\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_25Checkbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_154Checkbox\":[\"true\"],\"PORTLET_SETUP_154Checkbox\":[\"true\"],\"PORTLET_SETUP_33Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_USER_PREFERENCES_36\":[\"true\"],\"_document_library_documents\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_167Checkbox\":[\"true\"],\"PORTLET_DATA_167Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_20Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_178Checkbox\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_154\":[\"true\"],\"struts_action\":[\"/group_pages/import_layouts\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_33Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_178\":[\"true\"],\"PORTLET_CONFIGURATION_36\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_20Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_178\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"PORTLET_CONFIGURATION_183Checkbox\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_178Checkbox\":[\"true\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=GgVUvL1x&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=10703&controlPanelCategory=sites&_156_groupId=10182&_156_tabs2=current-and-previous&_156_struts_action=%2Fgroup_pages%2Fimport_layouts&_156_privateLayout=true\"],\"DATA_STRATEGY\":[\"DATA_STRATEGY_MIRROR\"],\"PORTLET_CONFIGURATION_167\":[\"true\"],\"PORTLET_CONFIGURATION_36Checkbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_162\":[\"true\"],\"PORTLET_USER_PREFERENCES_161\":[\"true\"],\"PORTLET_CONFIGURATION_161\":[\"true\"],\"PORTLET_CONFIGURATION_162\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_15Checkbox\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"PORTLET_USER_PREFERENCES_28Checkbox\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"PORTLET_SETUP_36\":[\"true\"],\"PORTLET_CONFIGURATION_161Checkbox\":[\"true\"],\"PORTLET_SETUP_33\":[\"true\"],\"PORTLET_SETUP_1_WAR_calendarportletCheckbox\":[\"true\"],\"_journal_web-contentCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_167\":[\"true\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_162Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_162Checkbox\":[\"true\"],\"CATEGORIES\":[\"true\"],\"PORTLET_CONFIGURATION_1_WAR_calendarportletCheckbox\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_19Checkbox\":[\"true\"],\"privateLayout\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_USER_PREFERENCES_33Checkbox\":[\"true\"],\"PORTLET_CONFIGURATION_154\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"20160315205501829URCUEJRI.lar\",\"privateLayout\":true},\"javaClass\":\"java.util.HashMap\"}',1,'2016-03-15 20:55:06',3,''),(11014,10182,10155,10199,'Test Test','2016-03-15 20:59:19','2016-03-15 20:59:22','15','','com.liferay.portal.lar.backgroundtask.PortletImportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"import\",\"parameterMap\":{\"map\":{\"_journal_structures\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"PERMISSIONSCheckbox\":[\"false\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_CONFIGURATION_15\":[\"true\"],\"DELETE_PORTLET_DATA\":[\"false\"],\"_journal_referenced-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"USER_ID_STRATEGY\":[\"ALWAYS_CURRENT_USER_ID\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"formDate\":[\"1458075549145\"],\"_journal_version-historyCheckbox\":[\"true\"],\"_journal_version-history\":[\"true\"],\"RATINGS\":[\"true\"],\"PORTLET_CONFIGURATION_15Checkbox\":[\"true\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_id=86&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=10703&controlPanelCategory=sites&_86_tabs3=current-and-previous&_86_tabs2=import&_86_portletResource=15&_86_redirect=%2Fgroup%2Fcontrol_panel%2Fmanage%3Fp_p_auth%3D1tINeGuv%26p_p_id%3D15%26p_p_lifecycle%3D0%26p_p_state%3Dmaximized%26p_p_mode%3Dview%26doAsGroupId%3D10182%26refererPlid%3D10703%26controlPanelCategory%3Dsites&_86_struts_action=%2Fportlet_configuration%2Fexport_import\"],\"DATA_STRATEGY\":[\"DATA_STRATEGY_MIRROR\"],\"PORTLET_DATA_15\":[\"true\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_SETUP_15Checkbox\":[\"true\"],\"tabs1\":[\"export_import\"],\"PORTLET_SETUP_15\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"tabs2\":[\"import\"],\"portletResource\":[\"15\"],\"COMMENTS\":[\"true\"],\"_journal_web-contentCheckbox\":[\"true\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"groupId\":[\"10182\"],\"cmd\":[\"import\"],\"permissionsAssignedToRoles\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"plid\":[\"10965\"],\"struts_action\":[\"/portlet_configuration/export_import\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"false\"]},\"javaClass\":\"java.util.HashMap\"},\"plid\":10965,\"userId\":10199,\"fileName\":\"20160315205919135ZNNSMSTF.lar\",\"portletId\":\"15\"},\"javaClass\":\"java.util.HashMap\"}',1,'2016-03-15 20:59:22',3,''),(11606,10182,10155,10199,'Whitehall Admin','2016-03-17 19:35:46','2016-03-17 19:35:51','15','','com.liferay.portal.lar.backgroundtask.PortletImportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"import\",\"parameterMap\":{\"map\":{\"_journal_structures\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"PERMISSIONSCheckbox\":[\"false\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_CONFIGURATION_15\":[\"true\"],\"DELETE_PORTLET_DATA\":[\"false\"],\"_journal_referenced-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"USER_ID_STRATEGY\":[\"ALWAYS_CURRENT_USER_ID\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"formDate\":[\"1458243320128\"],\"_journal_version-historyCheckbox\":[\"true\"],\"_journal_version-history\":[\"true\"],\"RATINGS\":[\"true\"],\"PORTLET_CONFIGURATION_15Checkbox\":[\"true\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_id=86&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=10967&controlPanelCategory=sites&_86_tabs3=current-and-previous&_86_tabs2=import&_86_portletResource=15&_86_redirect=%2Fgroup%2Fcontrol_panel%2Fmanage%3Fp_p_auth%3DflrIGDwZ%26p_p_id%3D15%26p_p_lifecycle%3D0%26p_p_state%3Dmaximized%26p_p_mode%3Dview%26doAsGroupId%3D10182%26refererPlid%3D10967%26controlPanelCategory%3Dsites&_86_struts_action=%2Fportlet_configuration%2Fexport_import\"],\"DATA_STRATEGY\":[\"DATA_STRATEGY_MIRROR\"],\"PORTLET_DATA_15\":[\"true\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_SETUP_15Checkbox\":[\"true\"],\"tabs1\":[\"export_import\"],\"PORTLET_SETUP_15\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"tabs2\":[\"import\"],\"portletResource\":[\"15\"],\"COMMENTS\":[\"true\"],\"_journal_web-contentCheckbox\":[\"true\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"groupId\":[\"10182\"],\"cmd\":[\"import\"],\"permissionsAssignedToRoles\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"plid\":[\"10965\"],\"struts_action\":[\"/portlet_configuration/export_import\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"false\"]},\"javaClass\":\"java.util.HashMap\"},\"plid\":10965,\"userId\":10199,\"fileName\":\"20160317193546930WPCJZTHQ.lar\",\"portletId\":\"15\"},\"javaClass\":\"java.util.HashMap\"}',1,'2016-03-17 19:35:51',3,''),(11804,10182,10155,10199,'Whitehall Admin','2016-03-19 19:16:29','2016-03-19 19:16:32','15','','com.liferay.portal.lar.backgroundtask.PortletImportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"import\",\"parameterMap\":{\"map\":{\"_journal_structures\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"PERMISSIONSCheckbox\":[\"false\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_CONFIGURATION_15\":[\"true\"],\"DELETE_PORTLET_DATA\":[\"false\"],\"_journal_referenced-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"USER_ID_STRATEGY\":[\"CURRENT_USER_ID\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"formDate\":[\"1458414981331\"],\"_journal_version-historyCheckbox\":[\"true\"],\"_journal_version-history\":[\"true\"],\"RATINGS\":[\"true\"],\"PORTLET_CONFIGURATION_15Checkbox\":[\"true\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_id=86&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=10971&controlPanelCategory=sites&_86_tabs3=current-and-previous&_86_tabs2=import&_86_portletResource=15&_86_redirect=%2Fgroup%2Fcontrol_panel%2Fmanage%3Fp_p_auth%3DDJEulMOA%26p_p_id%3D15%26p_p_lifecycle%3D0%26p_p_state%3Dmaximized%26p_p_mode%3Dview%26doAsGroupId%3D10182%26refererPlid%3D10971%26controlPanelCategory%3Dsites&_86_struts_action=%2Fportlet_configuration%2Fexport_import\"],\"DATA_STRATEGY\":[\"DATA_STRATEGY_MIRROR_OVERWRITE\"],\"PORTLET_DATA_15\":[\"true\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_SETUP_15Checkbox\":[\"true\"],\"tabs1\":[\"export_import\"],\"PORTLET_SETUP_15\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"tabs2\":[\"import\"],\"portletResource\":[\"15\"],\"COMMENTS\":[\"true\"],\"_journal_web-contentCheckbox\":[\"true\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"groupId\":[\"10182\"],\"cmd\":[\"import\"],\"permissionsAssignedToRoles\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"plid\":[\"10965\"],\"struts_action\":[\"/portlet_configuration/export_import\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"false\"]},\"javaClass\":\"java.util.HashMap\"},\"plid\":10965,\"userId\":10199,\"fileName\":\"20160319191629726LPGJTHWD.lar\",\"portletId\":\"15\"},\"javaClass\":\"java.util.HashMap\"}',1,'2016-03-19 19:16:32',3,''),(12156,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:50','2016-03-21 21:13:56','15','','com.liferay.portal.lar.backgroundtask.PortletImportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"import\",\"parameterMap\":{\"map\":{\"_journal_structures\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"PERMISSIONSCheckbox\":[\"false\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_CONFIGURATION_15\":[\"true\"],\"DELETE_PORTLET_DATA\":[\"false\"],\"_journal_referenced-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"USER_ID_STRATEGY\":[\"ALWAYS_CURRENT_USER_ID\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"formDate\":[\"1458594820718\"],\"_journal_version-historyCheckbox\":[\"true\"],\"_journal_version-history\":[\"true\"],\"RATINGS\":[\"true\"],\"PORTLET_CONFIGURATION_15Checkbox\":[\"true\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_id=86&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=10965&controlPanelCategory=sites&_86_tabs3=current-and-previous&_86_tabs2=import&_86_portletResource=15&_86_redirect=%2Fgroup%2Fcontrol_panel%2Fmanage%3Fp_p_auth%3DW9AQcEyq%26p_p_id%3D15%26p_p_lifecycle%3D0%26p_p_state%3Dmaximized%26p_p_mode%3Dview%26doAsGroupId%3D10182%26refererPlid%3D10965%26controlPanelCategory%3Dsites&_86_struts_action=%2Fportlet_configuration%2Fexport_import\"],\"DATA_STRATEGY\":[\"DATA_STRATEGY_MIRROR_OVERWRITE\"],\"PORTLET_DATA_15\":[\"true\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_SETUP_15Checkbox\":[\"true\"],\"tabs1\":[\"export_import\"],\"PORTLET_SETUP_15\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"tabs2\":[\"import\"],\"portletResource\":[\"15\"],\"COMMENTS\":[\"true\"],\"_journal_web-contentCheckbox\":[\"true\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"groupId\":[\"10182\"],\"cmd\":[\"import\"],\"permissionsAssignedToRoles\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"plid\":[\"10965\"],\"struts_action\":[\"/portlet_configuration/export_import\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"false\"]},\"javaClass\":\"java.util.HashMap\"},\"plid\":10965,\"userId\":10199,\"fileName\":\"20160321211350511EMTMIJYU.lar\",\"portletId\":\"15\"},\"javaClass\":\"java.util.HashMap\"}',1,'2016-03-21 21:13:56',3,'');

/*Table structure for table `blogsentry` */

DROP TABLE IF EXISTS `blogsentry`;

CREATE TABLE `blogsentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `urlTitle` varchar(150) DEFAULT NULL,
  `description` longtext,
  `content` longtext,
  `displayDate` datetime DEFAULT NULL,
  `allowPingbacks` tinyint(4) DEFAULT NULL,
  `allowTrackbacks` tinyint(4) DEFAULT NULL,
  `trackbacks` longtext,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_DB780A20` (`groupId`,`urlTitle`),
  UNIQUE KEY `IX_1B1040FD` (`uuid_`,`groupId`),
  KEY `IX_72EF6041` (`companyId`),
  KEY `IX_430D791F` (`companyId`,`displayDate`),
  KEY `IX_BB0C2905` (`companyId`,`displayDate`,`status`),
  KEY `IX_EB2DCE27` (`companyId`,`status`),
  KEY `IX_8CACE77B` (`companyId`,`userId`),
  KEY `IX_A5F57B61` (`companyId`,`userId`,`status`),
  KEY `IX_2672F77F` (`displayDate`,`status`),
  KEY `IX_81A50303` (`groupId`),
  KEY `IX_621E19D` (`groupId`,`displayDate`),
  KEY `IX_F0E73383` (`groupId`,`displayDate`,`status`),
  KEY `IX_1EFD8EE9` (`groupId`,`status`),
  KEY `IX_FBDE0AA3` (`groupId`,`userId`,`displayDate`),
  KEY `IX_DA04F689` (`groupId`,`userId`,`displayDate`,`status`),
  KEY `IX_49E15A23` (`groupId`,`userId`,`status`),
  KEY `IX_69157A4D` (`uuid_`),
  KEY `IX_5E8307BB` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blogsentry` */

/*Table structure for table `blogsstatsuser` */

DROP TABLE IF EXISTS `blogsstatsuser`;

CREATE TABLE `blogsstatsuser` (
  `statsUserId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `entryCount` int(11) DEFAULT NULL,
  `lastPostDate` datetime DEFAULT NULL,
  `ratingsTotalEntries` int(11) DEFAULT NULL,
  `ratingsTotalScore` double DEFAULT NULL,
  `ratingsAverageScore` double DEFAULT NULL,
  PRIMARY KEY (`statsUserId`),
  UNIQUE KEY `IX_82254C25` (`groupId`,`userId`),
  KEY `IX_90CDA39A` (`companyId`,`entryCount`),
  KEY `IX_43840EEB` (`groupId`),
  KEY `IX_28C78D5C` (`groupId`,`entryCount`),
  KEY `IX_BB51F1D9` (`userId`),
  KEY `IX_507BA031` (`userId`,`lastPostDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blogsstatsuser` */

/*Table structure for table `bookmarksentry` */

DROP TABLE IF EXISTS `bookmarksentry`;

CREATE TABLE `bookmarksentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `description` longtext,
  `visits` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_EAA02A91` (`uuid_`,`groupId`),
  KEY `IX_1F90CA2D` (`companyId`),
  KEY `IX_276C8C13` (`companyId`,`status`),
  KEY `IX_5200100C` (`groupId`,`folderId`),
  KEY `IX_146382F2` (`groupId`,`folderId`,`status`),
  KEY `IX_416AD7D5` (`groupId`,`status`),
  KEY `IX_C78B61AC` (`groupId`,`userId`,`folderId`,`status`),
  KEY `IX_9D9CF70F` (`groupId`,`userId`,`status`),
  KEY `IX_E848278F` (`resourceBlockId`),
  KEY `IX_B670BA39` (`uuid_`),
  KEY `IX_89BEDC4F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookmarksentry` */

/*Table structure for table `bookmarksfolder` */

DROP TABLE IF EXISTS `bookmarksfolder`;

CREATE TABLE `bookmarksfolder` (
  `uuid_` varchar(75) DEFAULT NULL,
  `folderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `IX_DC2F8927` (`uuid_`,`groupId`),
  KEY `IX_2ABA25D7` (`companyId`),
  KEY `IX_C27C9DBD` (`companyId`,`status`),
  KEY `IX_7F703619` (`groupId`),
  KEY `IX_967799C0` (`groupId`,`parentFolderId`),
  KEY `IX_D16018A6` (`groupId`,`parentFolderId`,`status`),
  KEY `IX_28A49BB9` (`resourceBlockId`),
  KEY `IX_451E7AE3` (`uuid_`),
  KEY `IX_54F0ED65` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookmarksfolder` */

/*Table structure for table `browsertracker` */

DROP TABLE IF EXISTS `browsertracker`;

CREATE TABLE `browsertracker` (
  `browserTrackerId` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `browserKey` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`browserTrackerId`),
  UNIQUE KEY `IX_E7B95510` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `browsertracker` */

insert  into `browsertracker`(`browserTrackerId`,`userId`,`browserKey`) values (10657,10199,379051262460),(11328,11308,861300535956),(11427,11407,22717629652),(12301,11336,66543840397);

/*Table structure for table `calendar` */

DROP TABLE IF EXISTS `calendar`;

CREATE TABLE `calendar` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `calendarResourceId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `color` int(11) DEFAULT NULL,
  `defaultCalendar` tinyint(4) DEFAULT NULL,
  `enableComments` tinyint(4) DEFAULT NULL,
  `enableRatings` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`calendarId`),
  UNIQUE KEY `IX_3AE311A` (`uuid_`,`groupId`),
  KEY `IX_B53EB0E1` (`groupId`,`calendarResourceId`),
  KEY `IX_97FC174E` (`groupId`,`calendarResourceId`,`defaultCalendar`),
  KEY `IX_F0FAF226` (`resourceBlockId`),
  KEY `IX_96C8590` (`uuid_`),
  KEY `IX_97656498` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calendar` */

insert  into `calendar`(`uuid_`,`calendarId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`resourceBlockId`,`calendarResourceId`,`name`,`description`,`color`,`defaultCalendar`,`enableComments`,`enableRatings`) values ('4d0086b9-8e2c-4fcd-8ba1-dabc5142b65b',10864,10182,10155,10199,'Test Test','2015-07-17 20:44:11','2015-07-17 20:44:11',3,10871,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Liferay</Name></root>','',14247526,1,0,0);

/*Table structure for table `calendarbooking` */

DROP TABLE IF EXISTS `calendarbooking`;

CREATE TABLE `calendarbooking` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarBookingId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `calendarId` bigint(20) DEFAULT NULL,
  `calendarResourceId` bigint(20) DEFAULT NULL,
  `parentCalendarBookingId` bigint(20) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `location` longtext,
  `startTime` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `allDay` tinyint(4) DEFAULT NULL,
  `recurrence` longtext,
  `firstReminder` bigint(20) DEFAULT NULL,
  `firstReminderType` varchar(75) DEFAULT NULL,
  `secondReminder` bigint(20) DEFAULT NULL,
  `secondReminderType` varchar(75) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`calendarBookingId`),
  UNIQUE KEY `IX_113A264E` (`calendarId`,`parentCalendarBookingId`),
  UNIQUE KEY `IX_F4C61797` (`uuid_`,`groupId`),
  KEY `IX_D300DFCE` (`calendarId`),
  KEY `IX_470170B4` (`calendarId`,`status`),
  KEY `IX_B198FFC` (`calendarResourceId`),
  KEY `IX_57EBF55B` (`parentCalendarBookingId`),
  KEY `IX_F7B8A941` (`parentCalendarBookingId`,`status`),
  KEY `IX_22DFDB49` (`resourceBlockId`),
  KEY `IX_F6E8EE73` (`uuid_`),
  KEY `IX_A21D9FD5` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calendarbooking` */

/*Table structure for table `calendarnotificationtemplate` */

DROP TABLE IF EXISTS `calendarnotificationtemplate`;

CREATE TABLE `calendarnotificationtemplate` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarNotificationTemplateId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `calendarId` bigint(20) DEFAULT NULL,
  `notificationType` varchar(75) DEFAULT NULL,
  `notificationTypeSettings` varchar(75) DEFAULT NULL,
  `notificationTemplateType` varchar(75) DEFAULT NULL,
  `subject` varchar(75) DEFAULT NULL,
  `body` longtext,
  PRIMARY KEY (`calendarNotificationTemplateId`),
  UNIQUE KEY `IX_4012E97F` (`uuid_`,`groupId`),
  KEY `IX_A412E5B6` (`calendarId`),
  KEY `IX_7727A482` (`calendarId`,`notificationType`,`notificationTemplateType`),
  KEY `IX_A2D4D78B` (`uuid_`),
  KEY `IX_4D7D97BD` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calendarnotificationtemplate` */

/*Table structure for table `calendarresource` */

DROP TABLE IF EXISTS `calendarresource`;

CREATE TABLE `calendarresource` (
  `uuid_` varchar(75) DEFAULT NULL,
  `calendarResourceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `classUuid` varchar(75) DEFAULT NULL,
  `code_` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`calendarResourceId`),
  UNIQUE KEY `IX_16A12327` (`classNameId`,`classPK`),
  UNIQUE KEY `IX_4ABD2BC8` (`uuid_`,`groupId`),
  KEY `IX_76DDD0F7` (`active_`),
  KEY `IX_4470A59D` (`companyId`,`code_`,`active_`),
  KEY `IX_1243D698` (`groupId`),
  KEY `IX_40678371` (`groupId`,`active_`),
  KEY `IX_55C2F8AA` (`groupId`,`code_`),
  KEY `IX_8BCB4D38` (`resourceBlockId`),
  KEY `IX_150E2F22` (`uuid_`),
  KEY `IX_56A06BC6` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calendarresource` */

insert  into `calendarresource`(`uuid_`,`calendarResourceId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`resourceBlockId`,`classNameId`,`classPK`,`classUuid`,`code_`,`name`,`description`,`active_`) values ('0b7de103-7134-436d-8691-b27a2dfaec34',10871,10182,10155,10199,'Test Test','2015-07-17 20:44:10','2015-07-17 20:44:10',4,10001,10182,'','10871','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Liferay</Name></root>','',1);

/*Table structure for table `calevent` */

DROP TABLE IF EXISTS `calevent`;

CREATE TABLE `calevent` (
  `uuid_` varchar(75) DEFAULT NULL,
  `eventId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `description` longtext,
  `location` longtext,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `durationHour` int(11) DEFAULT NULL,
  `durationMinute` int(11) DEFAULT NULL,
  `allDay` tinyint(4) DEFAULT NULL,
  `timeZoneSensitive` tinyint(4) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `repeating` tinyint(4) DEFAULT NULL,
  `recurrence` longtext,
  `remindBy` int(11) DEFAULT NULL,
  `firstReminder` int(11) DEFAULT NULL,
  `secondReminder` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventId`),
  UNIQUE KEY `IX_5CCE79C8` (`uuid_`,`groupId`),
  KEY `IX_D6FD9496` (`companyId`),
  KEY `IX_12EE4898` (`groupId`),
  KEY `IX_4FDDD2BF` (`groupId`,`repeating`),
  KEY `IX_FCD7C63D` (`groupId`,`type_`),
  KEY `IX_FD93CBFA` (`groupId`,`type_`,`repeating`),
  KEY `IX_F6006202` (`remindBy`),
  KEY `IX_C1AD2122` (`uuid_`),
  KEY `IX_299639C6` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `calevent` */

/*Table structure for table `classname_` */

DROP TABLE IF EXISTS `classname_`;

CREATE TABLE `classname_` (
  `classNameId` bigint(20) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`classNameId`),
  UNIQUE KEY `IX_B27A301F` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `classname_` */

insert  into `classname_`(`classNameId`,`value`) values (10440,'com.liferay.calendar.model.Calendar'),(10441,'com.liferay.calendar.model.CalendarBooking'),(10442,'com.liferay.calendar.model.CalendarNotificationTemplate'),(10443,'com.liferay.calendar.model.CalendarResource'),(10017,'com.liferay.counter.model.Counter'),(10434,'com.liferay.marketplace.model.App'),(10435,'com.liferay.marketplace.model.Module'),(10494,'com.liferay.notifications.model.UserNotificationEvent'),(10498,'com.liferay.opensocial.model.Gadget'),(10499,'com.liferay.opensocial.model.OAuthConsumer'),(10500,'com.liferay.opensocial.model.OAuthToken'),(10423,'com.liferay.portal.kernel.repository.model.FileEntry'),(11602,'com.liferay.portal.kernel.repository.model.Folder'),(10018,'com.liferay.portal.kernel.workflow.WorkflowTask'),(10019,'com.liferay.portal.model.Account'),(10020,'com.liferay.portal.model.Address'),(10021,'com.liferay.portal.model.BackgroundTask'),(10022,'com.liferay.portal.model.BrowserTracker'),(10023,'com.liferay.portal.model.ClassName'),(10024,'com.liferay.portal.model.ClusterGroup'),(10025,'com.liferay.portal.model.Company'),(10026,'com.liferay.portal.model.Contact'),(10027,'com.liferay.portal.model.Country'),(10028,'com.liferay.portal.model.EmailAddress'),(10001,'com.liferay.portal.model.Group'),(10029,'com.liferay.portal.model.Image'),(10002,'com.liferay.portal.model.Layout'),(10030,'com.liferay.portal.model.LayoutBranch'),(10031,'com.liferay.portal.model.LayoutFriendlyURL'),(10032,'com.liferay.portal.model.LayoutPrototype'),(10033,'com.liferay.portal.model.LayoutRevision'),(10034,'com.liferay.portal.model.LayoutSet'),(10035,'com.liferay.portal.model.LayoutSetBranch'),(10036,'com.liferay.portal.model.LayoutSetPrototype'),(10037,'com.liferay.portal.model.ListType'),(10038,'com.liferay.portal.model.Lock'),(10039,'com.liferay.portal.model.MembershipRequest'),(10003,'com.liferay.portal.model.Organization'),(10040,'com.liferay.portal.model.OrgGroupRole'),(10041,'com.liferay.portal.model.OrgLabor'),(10042,'com.liferay.portal.model.PasswordPolicy'),(10043,'com.liferay.portal.model.PasswordPolicyRel'),(10044,'com.liferay.portal.model.PasswordTracker'),(10045,'com.liferay.portal.model.Phone'),(10046,'com.liferay.portal.model.PluginSetting'),(10047,'com.liferay.portal.model.PortalPreferences'),(10048,'com.liferay.portal.model.Portlet'),(10049,'com.liferay.portal.model.PortletItem'),(10050,'com.liferay.portal.model.PortletPreferences'),(10051,'com.liferay.portal.model.Region'),(10052,'com.liferay.portal.model.Release'),(10053,'com.liferay.portal.model.Repository'),(10054,'com.liferay.portal.model.RepositoryEntry'),(10055,'com.liferay.portal.model.ResourceAction'),(10056,'com.liferay.portal.model.ResourceBlock'),(10057,'com.liferay.portal.model.ResourceBlockPermission'),(10058,'com.liferay.portal.model.ResourcePermission'),(10059,'com.liferay.portal.model.ResourceTypePermission'),(10004,'com.liferay.portal.model.Role'),(10060,'com.liferay.portal.model.ServiceComponent'),(10061,'com.liferay.portal.model.Shard'),(10062,'com.liferay.portal.model.Subscription'),(10063,'com.liferay.portal.model.SystemEvent'),(10064,'com.liferay.portal.model.Team'),(10065,'com.liferay.portal.model.Ticket'),(10005,'com.liferay.portal.model.User'),(10006,'com.liferay.portal.model.UserGroup'),(10066,'com.liferay.portal.model.UserGroupGroupRole'),(10067,'com.liferay.portal.model.UserGroupRole'),(10068,'com.liferay.portal.model.UserIdMapper'),(10069,'com.liferay.portal.model.UserNotificationDelivery'),(10070,'com.liferay.portal.model.UserNotificationEvent'),(10191,'com.liferay.portal.model.UserPersonalSite'),(10071,'com.liferay.portal.model.UserTracker'),(10072,'com.liferay.portal.model.UserTrackerPath'),(10073,'com.liferay.portal.model.VirtualHost'),(10074,'com.liferay.portal.model.WebDAVProps'),(10075,'com.liferay.portal.model.Website'),(10076,'com.liferay.portal.model.WorkflowDefinitionLink'),(10077,'com.liferay.portal.model.WorkflowInstanceLink'),(10525,'com.liferay.portal.repository.liferayrepository.LiferayRepository'),(10447,'com.liferay.portal.workflow.kaleo.model.KaleoAction'),(10448,'com.liferay.portal.workflow.kaleo.model.KaleoCondition'),(10449,'com.liferay.portal.workflow.kaleo.model.KaleoDefinition'),(10450,'com.liferay.portal.workflow.kaleo.model.KaleoInstance'),(10451,'com.liferay.portal.workflow.kaleo.model.KaleoInstanceToken'),(10452,'com.liferay.portal.workflow.kaleo.model.KaleoLog'),(10453,'com.liferay.portal.workflow.kaleo.model.KaleoNode'),(10454,'com.liferay.portal.workflow.kaleo.model.KaleoNotification'),(10455,'com.liferay.portal.workflow.kaleo.model.KaleoNotificationRecipient'),(10456,'com.liferay.portal.workflow.kaleo.model.KaleoTask'),(10457,'com.liferay.portal.workflow.kaleo.model.KaleoTaskAssignment'),(10458,'com.liferay.portal.workflow.kaleo.model.KaleoTaskAssignmentInstance'),(10459,'com.liferay.portal.workflow.kaleo.model.KaleoTaskInstanceToken'),(10460,'com.liferay.portal.workflow.kaleo.model.KaleoTimer'),(10461,'com.liferay.portal.workflow.kaleo.model.KaleoTimerInstanceToken'),(10462,'com.liferay.portal.workflow.kaleo.model.KaleoTransition'),(10078,'com.liferay.portlet.announcements.model.AnnouncementsDelivery'),(10079,'com.liferay.portlet.announcements.model.AnnouncementsEntry'),(10080,'com.liferay.portlet.announcements.model.AnnouncementsFlag'),(10081,'com.liferay.portlet.asset.model.AssetCategory'),(10082,'com.liferay.portlet.asset.model.AssetCategoryProperty'),(10083,'com.liferay.portlet.asset.model.AssetEntry'),(10084,'com.liferay.portlet.asset.model.AssetLink'),(10085,'com.liferay.portlet.asset.model.AssetTag'),(10086,'com.liferay.portlet.asset.model.AssetTagProperty'),(10087,'com.liferay.portlet.asset.model.AssetTagStats'),(10088,'com.liferay.portlet.asset.model.AssetVocabulary'),(10007,'com.liferay.portlet.blogs.model.BlogsEntry'),(10089,'com.liferay.portlet.blogs.model.BlogsStatsUser'),(10008,'com.liferay.portlet.bookmarks.model.BookmarksEntry'),(10009,'com.liferay.portlet.bookmarks.model.BookmarksFolder'),(10010,'com.liferay.portlet.calendar.model.CalEvent'),(10090,'com.liferay.portlet.documentlibrary.model.DLContent'),(10011,'com.liferay.portlet.documentlibrary.model.DLFileEntry'),(10091,'com.liferay.portlet.documentlibrary.model.DLFileEntryMetadata'),(10092,'com.liferay.portlet.documentlibrary.model.DLFileEntryType'),(10093,'com.liferay.portlet.documentlibrary.model.DLFileRank'),(10094,'com.liferay.portlet.documentlibrary.model.DLFileShortcut'),(10095,'com.liferay.portlet.documentlibrary.model.DLFileVersion'),(10012,'com.liferay.portlet.documentlibrary.model.DLFolder'),(10096,'com.liferay.portlet.documentlibrary.model.DLSyncEvent'),(10315,'com.liferay.portlet.documentlibrary.util.RawMetadataProcessor'),(10097,'com.liferay.portlet.dynamicdatalists.model.DDLRecord'),(10098,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet'),(10099,'com.liferay.portlet.dynamicdatalists.model.DDLRecordVersion'),(10100,'com.liferay.portlet.dynamicdatamapping.model.DDMContent'),(10101,'com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink'),(10102,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure'),(10103,'com.liferay.portlet.dynamicdatamapping.model.DDMStructureLink'),(10104,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate'),(10105,'com.liferay.portlet.expando.model.ExpandoColumn'),(10106,'com.liferay.portlet.expando.model.ExpandoRow'),(10107,'com.liferay.portlet.expando.model.ExpandoTable'),(10108,'com.liferay.portlet.expando.model.ExpandoValue'),(10109,'com.liferay.portlet.journal.model.JournalArticle'),(10110,'com.liferay.portlet.journal.model.JournalArticleImage'),(10111,'com.liferay.portlet.journal.model.JournalArticleResource'),(10112,'com.liferay.portlet.journal.model.JournalContentSearch'),(10113,'com.liferay.portlet.journal.model.JournalFeed'),(10013,'com.liferay.portlet.journal.model.JournalFolder'),(10114,'com.liferay.portlet.messageboards.model.MBBan'),(10115,'com.liferay.portlet.messageboards.model.MBCategory'),(10116,'com.liferay.portlet.messageboards.model.MBDiscussion'),(10117,'com.liferay.portlet.messageboards.model.MBMailingList'),(10014,'com.liferay.portlet.messageboards.model.MBMessage'),(10118,'com.liferay.portlet.messageboards.model.MBStatsUser'),(10015,'com.liferay.portlet.messageboards.model.MBThread'),(10119,'com.liferay.portlet.messageboards.model.MBThreadFlag'),(10120,'com.liferay.portlet.mobiledevicerules.model.MDRAction'),(10121,'com.liferay.portlet.mobiledevicerules.model.MDRRule'),(10122,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup'),(10123,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance'),(10124,'com.liferay.portlet.polls.model.PollsChoice'),(10125,'com.liferay.portlet.polls.model.PollsQuestion'),(10126,'com.liferay.portlet.polls.model.PollsVote'),(10127,'com.liferay.portlet.ratings.model.RatingsEntry'),(10128,'com.liferay.portlet.ratings.model.RatingsStats'),(10129,'com.liferay.portlet.shopping.model.ShoppingCart'),(10130,'com.liferay.portlet.shopping.model.ShoppingCategory'),(10131,'com.liferay.portlet.shopping.model.ShoppingCoupon'),(10132,'com.liferay.portlet.shopping.model.ShoppingItem'),(10133,'com.liferay.portlet.shopping.model.ShoppingItemField'),(10134,'com.liferay.portlet.shopping.model.ShoppingItemPrice'),(10135,'com.liferay.portlet.shopping.model.ShoppingOrder'),(10136,'com.liferay.portlet.shopping.model.ShoppingOrderItem'),(10137,'com.liferay.portlet.social.model.SocialActivity'),(10138,'com.liferay.portlet.social.model.SocialActivityAchievement'),(10139,'com.liferay.portlet.social.model.SocialActivityCounter'),(10140,'com.liferay.portlet.social.model.SocialActivityLimit'),(10141,'com.liferay.portlet.social.model.SocialActivitySet'),(10142,'com.liferay.portlet.social.model.SocialActivitySetting'),(10143,'com.liferay.portlet.social.model.SocialRelation'),(10144,'com.liferay.portlet.social.model.SocialRequest'),(10145,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion'),(10146,'com.liferay.portlet.softwarecatalog.model.SCLicense'),(10147,'com.liferay.portlet.softwarecatalog.model.SCProductEntry'),(10148,'com.liferay.portlet.softwarecatalog.model.SCProductScreenshot'),(10149,'com.liferay.portlet.softwarecatalog.model.SCProductVersion'),(10150,'com.liferay.portlet.trash.model.TrashEntry'),(10151,'com.liferay.portlet.trash.model.TrashVersion'),(10152,'com.liferay.portlet.wiki.model.WikiNode'),(10016,'com.liferay.portlet.wiki.model.WikiPage'),(10153,'com.liferay.portlet.wiki.model.WikiPageResource'),(10508,'com.liferay.sync.model.SyncDLObject');

/*Table structure for table `clustergroup` */

DROP TABLE IF EXISTS `clustergroup`;

CREATE TABLE `clustergroup` (
  `clusterGroupId` bigint(20) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `clusterNodeIds` varchar(75) DEFAULT NULL,
  `wholeCluster` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`clusterGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clustergroup` */

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `companyId` bigint(20) NOT NULL,
  `accountId` bigint(20) DEFAULT NULL,
  `webId` varchar(75) DEFAULT NULL,
  `key_` longtext,
  `mx` varchar(75) DEFAULT NULL,
  `homeURL` longtext,
  `logoId` bigint(20) DEFAULT NULL,
  `system` tinyint(4) DEFAULT NULL,
  `maxUsers` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`companyId`),
  UNIQUE KEY `IX_EC00543C` (`webId`),
  KEY `IX_38EFE3FD` (`logoId`),
  KEY `IX_12566EC2` (`mx`),
  KEY `IX_35E3E7C6` (`system`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `company` */

insert  into `company`(`companyId`,`accountId`,`webId`,`key_`,`mx`,`homeURL`,`logoId`,`system`,`maxUsers`,`active_`) values (10155,10157,'liferay.com','rO0ABXNyAB9qYXZheC5jcnlwdG8uc3BlYy5TZWNyZXRLZXlTcGVjW0cLZuIwYU0CAAJMAAlhbGdvcml0aG10ABJMamF2YS9sYW5nL1N0cmluZztbAANrZXl0AAJbQnhwdAADQUVTdXIAAltCrPMX+AYIVOACAAB4cAAAABDze6fjSr3kO2nhu3CRdtYs','liferay.com','/web/guest/home',0,0,0,1);

/*Table structure for table `contact_` */

DROP TABLE IF EXISTS `contact_`;

CREATE TABLE `contact_` (
  `contactId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `accountId` bigint(20) DEFAULT NULL,
  `parentContactId` bigint(20) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `firstName` varchar(75) DEFAULT NULL,
  `middleName` varchar(75) DEFAULT NULL,
  `lastName` varchar(75) DEFAULT NULL,
  `prefixId` int(11) DEFAULT NULL,
  `suffixId` int(11) DEFAULT NULL,
  `male` tinyint(4) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `smsSn` varchar(75) DEFAULT NULL,
  `aimSn` varchar(75) DEFAULT NULL,
  `facebookSn` varchar(75) DEFAULT NULL,
  `icqSn` varchar(75) DEFAULT NULL,
  `jabberSn` varchar(75) DEFAULT NULL,
  `msnSn` varchar(75) DEFAULT NULL,
  `mySpaceSn` varchar(75) DEFAULT NULL,
  `skypeSn` varchar(75) DEFAULT NULL,
  `twitterSn` varchar(75) DEFAULT NULL,
  `ymSn` varchar(75) DEFAULT NULL,
  `employeeStatusId` varchar(75) DEFAULT NULL,
  `employeeNumber` varchar(75) DEFAULT NULL,
  `jobTitle` varchar(100) DEFAULT NULL,
  `jobClass` varchar(75) DEFAULT NULL,
  `hoursOfOperation` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`contactId`),
  KEY `IX_B8C28C53` (`accountId`),
  KEY `IX_791914FA` (`classNameId`,`classPK`),
  KEY `IX_66D496A3` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contact_` */

insert  into `contact_`(`contactId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`accountId`,`parentContactId`,`emailAddress`,`firstName`,`middleName`,`lastName`,`prefixId`,`suffixId`,`male`,`birthday`,`smsSn`,`aimSn`,`facebookSn`,`icqSn`,`jabberSn`,`msnSn`,`mySpaceSn`,`skypeSn`,`twitterSn`,`ymSn`,`employeeStatusId`,`employeeNumber`,`jobTitle`,`jobClass`,`hoursOfOperation`) values (10160,10155,10159,'','2016-03-15 19:16:25','2016-03-15 19:16:25',10005,10159,10157,0,'default@liferay.com','','','',0,0,1,'2016-03-15 19:16:25','','','','','','','','','','','','','','',''),(10200,10155,10199,'','2016-03-15 19:16:30','2016-03-21 19:53:29',10005,10199,10157,0,'gautam.tf2016@gmail.com','Whitehall','','Admin',0,0,1,'1970-01-01 00:00:00','','','','','','','','','','','','','','',''),(11309,10155,10159,'','2016-03-16 04:54:01','2016-03-21 18:11:52',10005,11308,10157,0,'gautam.kct1988@gmail.com','Gautam','','Sharma',0,0,1,'1989-03-02 00:00:00','','','','','','','','','','','','','','',''),(11337,10155,10199,'Test Test','2016-03-16 05:02:06','2016-03-16 19:51:41',10005,11336,10157,0,'dhanush.kodi@knowarth.com','dhanush','','kodi',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','','',''),(11408,10155,10159,'','2016-03-16 19:40:53','2016-03-16 19:40:53',10005,11407,10157,0,'pawankct91@gmail.com','Primarry','','Investor1',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','','',''),(11438,10155,10159,'','2016-03-16 20:05:15','2016-03-16 20:05:15',10005,11437,10157,0,'prinvestor2@yahoo.in','Primary ','','Investor2',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','','',''),(11458,10155,10159,'','2016-03-16 20:32:10','2016-03-16 20:32:10',10005,11457,10157,0,'sellerwhitehall2@outlook.com','seller','','whitehall2',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','','',''),(11478,10155,10159,'','2016-03-16 20:35:20','2016-03-16 20:35:20',10005,11477,10157,0,'prinvestor3@whitehall.com','Pr','','Investor3',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','','',''),(11498,10155,10159,'','2016-03-16 20:52:31','2016-03-16 20:52:31',10005,11497,10157,0,'prinvestor4@whitehall.com','Pr','','Investor4',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','','',''),(11518,10155,10159,'','2016-03-16 20:56:48','2016-03-16 20:56:48',10005,11517,10157,0,'sellerwhitehall2@whitehall.com','seller','','whitehall3',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','','',''),(11538,10155,10159,'','2016-03-16 21:00:32','2016-03-16 21:00:32',10005,11537,10157,0,'scfcompany2@whitehall.com','scf','','company2',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','','','');

/*Table structure for table `counter` */

DROP TABLE IF EXISTS `counter`;

CREATE TABLE `counter` (
  `name` varchar(75) NOT NULL,
  `currentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `counter` */

insert  into `counter`(`name`,`currentId`) values ('com.liferay.counter.model.Counter',12600),('com.liferay.portal.model.Layout#10173#true',1),('com.liferay.portal.model.Layout#10182#false',3),('com.liferay.portal.model.Layout#10182#true',8),('com.liferay.portal.model.Layout#10202#false',1),('com.liferay.portal.model.Layout#10202#true',1),('com.liferay.portal.model.Layout#10318#true',1),('com.liferay.portal.model.Layout#10330#true',1),('com.liferay.portal.model.Layout#10340#true',1),('com.liferay.portal.model.Layout#10351#true',2),('com.liferay.portal.model.Layout#10377#true',3),('com.liferay.portal.model.Layout#11148#true',1),('com.liferay.portal.model.Layout#11311#false',1),('com.liferay.portal.model.Layout#11311#true',1),('com.liferay.portal.model.Layout#11339#false',1),('com.liferay.portal.model.Layout#11339#true',1),('com.liferay.portal.model.Layout#11410#false',1),('com.liferay.portal.model.Layout#11410#true',1),('com.liferay.portal.model.Layout#11440#false',1),('com.liferay.portal.model.Layout#11440#true',1),('com.liferay.portal.model.Layout#11460#false',1),('com.liferay.portal.model.Layout#11460#true',1),('com.liferay.portal.model.Layout#11480#false',1),('com.liferay.portal.model.Layout#11480#true',1),('com.liferay.portal.model.Layout#11500#false',1),('com.liferay.portal.model.Layout#11500#true',1),('com.liferay.portal.model.Layout#11520#false',1),('com.liferay.portal.model.Layout#11520#true',1),('com.liferay.portal.model.Layout#11540#false',1),('com.liferay.portal.model.Layout#11540#true',1),('com.liferay.portal.model.ResourceAction',1400),('com.liferay.portal.model.ResourceBlock',100),('com.liferay.portal.model.ResourcePermission',1800),('com.liferay.portlet.documentlibrary.model.DLFileEntry',400),('com.liferay.portlet.social.model.SocialActivity',300);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryId` bigint(20) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `a2` varchar(75) DEFAULT NULL,
  `a3` varchar(75) DEFAULT NULL,
  `number_` varchar(75) DEFAULT NULL,
  `idd_` varchar(75) DEFAULT NULL,
  `zipRequired` tinyint(4) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`countryId`),
  UNIQUE KEY `IX_717B97E1` (`a2`),
  UNIQUE KEY `IX_717B9BA2` (`a3`),
  UNIQUE KEY `IX_19DA007B` (`name`),
  KEY `IX_25D734CD` (`active_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `country` */

insert  into `country`(`countryId`,`name`,`a2`,`a3`,`number_`,`idd_`,`zipRequired`,`active_`) values (1,'canada','CA','CAN','124','001',1,1),(2,'china','CN','CHN','156','086',1,1),(3,'france','FR','FRA','250','033',1,1),(4,'germany','DE','DEU','276','049',1,1),(5,'hong-kong','HK','HKG','344','852',1,1),(6,'hungary','HU','HUN','348','036',1,1),(7,'israel','IL','ISR','376','972',1,1),(8,'italy','IT','ITA','380','039',1,1),(9,'japan','JP','JPN','392','081',0,1),(10,'south-korea','KR','KOR','410','082',1,1),(11,'netherlands','NL','NLD','528','031',1,1),(12,'portugal','PT','PRT','620','351',1,1),(13,'russia','RU','RUS','643','007',1,1),(14,'singapore','SG','SGP','702','065',1,1),(15,'spain','ES','ESP','724','034',1,1),(16,'turkey','TR','TUR','792','090',1,1),(17,'vietnam','VN','VNM','704','084',1,1),(18,'united-kingdom','GB','GBR','826','044',1,1),(19,'united-states','US','USA','840','001',1,1),(20,'afghanistan','AF','AFG','4','093',1,1),(21,'albania','AL','ALB','8','355',1,1),(22,'algeria','DZ','DZA','12','213',1,1),(23,'american-samoa','AS','ASM','16','684',1,1),(24,'andorra','AD','AND','20','376',1,1),(25,'angola','AO','AGO','24','244',0,1),(26,'anguilla','AI','AIA','660','264',1,1),(27,'antarctica','AQ','ATA','10','672',1,1),(28,'antigua-barbuda','AG','ATG','28','268',0,1),(29,'argentina','AR','ARG','32','054',1,1),(30,'armenia','AM','ARM','51','374',1,1),(31,'aruba','AW','ABW','533','297',0,1),(32,'australia','AU','AUS','36','061',1,1),(33,'austria','AT','AUT','40','043',1,1),(34,'azerbaijan','AZ','AZE','31','994',1,1),(35,'bahamas','BS','BHS','44','242',0,1),(36,'bahrain','BH','BHR','48','973',1,1),(37,'bangladesh','BD','BGD','50','880',1,1),(38,'barbados','BB','BRB','52','246',1,1),(39,'belarus','BY','BLR','112','375',1,1),(40,'belgium','BE','BEL','56','032',1,1),(41,'belize','BZ','BLZ','84','501',0,1),(42,'benin','BJ','BEN','204','229',0,1),(43,'bermuda','BM','BMU','60','441',1,1),(44,'bhutan','BT','BTN','64','975',1,1),(45,'bolivia','BO','BOL','68','591',1,1),(46,'bosnia-herzegovina','BA','BIH','70','387',1,1),(47,'botswana','BW','BWA','72','267',0,1),(48,'brazil','BR','BRA','76','055',1,1),(49,'british-virgin-islands','VG','VGB','92','284',1,1),(50,'brunei','BN','BRN','96','673',1,1),(51,'bulgaria','BG','BGR','100','359',1,1),(52,'burkina-faso','BF','BFA','854','226',0,1),(53,'burma-myanmar','MM','MMR','104','095',1,1),(54,'burundi','BI','BDI','108','257',0,1),(55,'cambodia','KH','KHM','116','855',1,1),(56,'cameroon','CM','CMR','120','237',1,1),(57,'cape-verde-island','CV','CPV','132','238',1,1),(58,'cayman-islands','KY','CYM','136','345',1,1),(59,'central-african-republic','CF','CAF','140','236',0,1),(60,'chad','TD','TCD','148','235',1,1),(61,'chile','CL','CHL','152','056',1,1),(62,'christmas-island','CX','CXR','162','061',1,1),(63,'cocos-islands','CC','CCK','166','061',1,1),(64,'colombia','CO','COL','170','057',1,1),(65,'comoros','KM','COM','174','269',0,1),(66,'republic-of-congo','CD','COD','180','242',0,1),(67,'democratic-republic-of-congo','CG','COG','178','243',0,1),(68,'cook-islands','CK','COK','184','682',0,1),(69,'costa-rica','CR','CRI','188','506',1,1),(70,'croatia','HR','HRV','191','385',1,1),(71,'cuba','CU','CUB','192','053',1,1),(72,'cyprus','CY','CYP','196','357',1,1),(73,'czech-republic','CZ','CZE','203','420',1,1),(74,'denmark','DK','DNK','208','045',1,1),(75,'djibouti','DJ','DJI','262','253',0,1),(76,'dominica','DM','DMA','212','767',0,1),(77,'dominican-republic','DO','DOM','214','809',1,1),(78,'ecuador','EC','ECU','218','593',1,1),(79,'egypt','EG','EGY','818','020',1,1),(80,'el-salvador','SV','SLV','222','503',1,1),(81,'equatorial-guinea','GQ','GNQ','226','240',0,1),(82,'eritrea','ER','ERI','232','291',0,1),(83,'estonia','EE','EST','233','372',1,1),(84,'ethiopia','ET','ETH','231','251',1,1),(85,'faeroe-islands','FO','FRO','234','298',1,1),(86,'falkland-islands','FK','FLK','238','500',1,1),(87,'fiji-islands','FJ','FJI','242','679',0,1),(88,'finland','FI','FIN','246','358',1,1),(89,'french-guiana','GF','GUF','254','594',1,1),(90,'french-polynesia','PF','PYF','258','689',1,1),(91,'gabon','GA','GAB','266','241',1,1),(92,'gambia','GM','GMB','270','220',0,1),(93,'georgia','GE','GEO','268','995',1,1),(94,'ghana','GH','GHA','288','233',0,1),(95,'gibraltar','GI','GIB','292','350',1,1),(96,'greece','GR','GRC','300','030',1,1),(97,'greenland','GL','GRL','304','299',1,1),(98,'grenada','GD','GRD','308','473',0,1),(99,'guadeloupe','GP','GLP','312','590',1,1),(100,'guam','GU','GUM','316','671',1,1),(101,'guatemala','GT','GTM','320','502',1,1),(102,'guinea','GN','GIN','324','224',0,1),(103,'guinea-bissau','GW','GNB','624','245',1,1),(104,'guyana','GY','GUY','328','592',0,1),(105,'haiti','HT','HTI','332','509',1,1),(106,'honduras','HN','HND','340','504',1,1),(107,'iceland','IS','ISL','352','354',1,1),(108,'india','IN','IND','356','091',1,1),(109,'indonesia','ID','IDN','360','062',1,1),(110,'iran','IR','IRN','364','098',1,1),(111,'iraq','IQ','IRQ','368','964',1,1),(112,'ireland','IE','IRL','372','353',0,1),(113,'ivory-coast','CI','CIV','384','225',1,1),(114,'jamaica','JM','JAM','388','876',1,1),(115,'jordan','JO','JOR','400','962',1,1),(116,'kazakhstan','KZ','KAZ','398','007',1,1),(117,'kenya','KE','KEN','404','254',1,1),(118,'kiribati','KI','KIR','408','686',0,1),(119,'kuwait','KW','KWT','414','965',1,1),(120,'north-korea','KP','PRK','408','850',0,1),(121,'kyrgyzstan','KG','KGZ','471','996',1,1),(122,'laos','LA','LAO','418','856',1,1),(123,'latvia','LV','LVA','428','371',1,1),(124,'lebanon','LB','LBN','422','961',1,1),(125,'lesotho','LS','LSO','426','266',1,1),(126,'liberia','LR','LBR','430','231',1,1),(127,'libya','LY','LBY','434','218',1,1),(128,'liechtenstein','LI','LIE','438','423',1,1),(129,'lithuania','LT','LTU','440','370',1,1),(130,'luxembourg','LU','LUX','442','352',1,1),(131,'macau','MO','MAC','446','853',0,1),(132,'macedonia','MK','MKD','807','389',1,1),(133,'madagascar','MG','MDG','450','261',1,1),(134,'malawi','MW','MWI','454','265',0,1),(135,'malaysia','MY','MYS','458','060',1,1),(136,'maldives','MV','MDV','462','960',1,1),(137,'mali','ML','MLI','466','223',0,1),(138,'malta','MT','MLT','470','356',1,1),(139,'marshall-islands','MH','MHL','584','692',1,1),(140,'martinique','MQ','MTQ','474','596',1,1),(141,'mauritania','MR','MRT','478','222',0,1),(142,'mauritius','MU','MUS','480','230',0,1),(143,'mayotte-island','YT','MYT','175','269',1,1),(144,'mexico','MX','MEX','484','052',1,1),(145,'micronesia','FM','FSM','583','691',1,1),(146,'moldova','MD','MDA','498','373',1,1),(147,'monaco','MC','MCO','492','377',1,1),(148,'mongolia','MN','MNG','496','976',1,1),(149,'montenegro','ME','MNE','499','382',1,1),(150,'montserrat','MS','MSR','500','664',0,1),(151,'morocco','MA','MAR','504','212',1,1),(152,'mozambique','MZ','MOZ','508','258',1,1),(153,'namibia','NA','NAM','516','264',1,1),(154,'nauru','NR','NRU','520','674',0,1),(155,'nepal','NP','NPL','524','977',1,1),(156,'netherlands-antilles','AN','ANT','530','599',1,1),(157,'new-caledonia','NC','NCL','540','687',1,1),(158,'new-zealand','NZ','NZL','554','064',1,1),(159,'nicaragua','NI','NIC','558','505',1,1),(160,'niger','NE','NER','562','227',1,1),(161,'nigeria','NG','NGA','566','234',1,1),(162,'niue','NU','NIU','570','683',0,1),(163,'norfolk-island','NF','NFK','574','672',1,1),(164,'norway','NO','NOR','578','047',1,1),(165,'oman','OM','OMN','512','968',1,1),(166,'pakistan','PK','PAK','586','092',1,1),(167,'palau','PW','PLW','585','680',1,1),(168,'palestine','PS','PSE','275','970',1,1),(169,'panama','PA','PAN','591','507',1,1),(170,'papua-new-guinea','PG','PNG','598','675',1,1),(171,'paraguay','PY','PRY','600','595',1,1),(172,'peru','PE','PER','604','051',1,1),(173,'philippines','PH','PHL','608','063',1,1),(174,'poland','PL','POL','616','048',1,1),(175,'puerto-rico','PR','PRI','630','787',1,1),(176,'qatar','QA','QAT','634','974',0,1),(177,'reunion-island','RE','REU','638','262',1,1),(178,'romania','RO','ROU','642','040',1,1),(179,'rwanda','RW','RWA','646','250',0,1),(180,'st-helena','SH','SHN','654','290',1,1),(181,'st-kitts','KN','KNA','659','869',0,1),(182,'st-lucia','LC','LCA','662','758',0,1),(183,'st-pierre-miquelon','PM','SPM','666','508',1,1),(184,'st-vincent','VC','VCT','670','784',1,1),(185,'san-marino','SM','SMR','674','378',1,1),(186,'sao-tome-principe','ST','STP','678','239',0,1),(187,'saudi-arabia','SA','SAU','682','966',1,1),(188,'senegal','SN','SEN','686','221',1,1),(189,'serbia','RS','SRB','688','381',1,1),(190,'seychelles','SC','SYC','690','248',0,1),(191,'sierra-leone','SL','SLE','694','249',0,1),(192,'slovakia','SK','SVK','703','421',1,1),(193,'slovenia','SI','SVN','705','386',1,1),(194,'solomon-islands','SB','SLB','90','677',0,1),(195,'somalia','SO','SOM','706','252',0,1),(196,'south-africa','ZA','ZAF','710','027',1,1),(197,'sri-lanka','LK','LKA','144','094',1,1),(198,'sudan','SD','SDN','736','095',1,1),(199,'suriname','SR','SUR','740','597',0,1),(200,'swaziland','SZ','SWZ','748','268',1,1),(201,'sweden','SE','SWE','752','046',1,1),(202,'switzerland','CH','CHE','756','041',1,1),(203,'syria','SY','SYR','760','963',0,1),(204,'taiwan','TW','TWN','158','886',1,1),(205,'tajikistan','TJ','TJK','762','992',1,1),(206,'tanzania','TZ','TZA','834','255',0,1),(207,'thailand','TH','THA','764','066',1,1),(208,'togo','TG','TGO','768','228',1,1),(209,'tonga','TO','TON','776','676',0,1),(210,'trinidad-tobago','TT','TTO','780','868',0,1),(211,'tunisia','TN','TUN','788','216',1,1),(212,'turkmenistan','TM','TKM','795','993',1,1),(213,'turks-caicos','TC','TCA','796','649',1,1),(214,'tuvalu','TV','TUV','798','688',0,1),(215,'uganda','UG','UGA','800','256',0,1),(216,'ukraine','UA','UKR','804','380',1,1),(217,'united-arab-emirates','AE','ARE','784','971',0,1),(218,'uruguay','UY','URY','858','598',1,1),(219,'uzbekistan','UZ','UZB','860','998',1,1),(220,'vanuatu','VU','VUT','548','678',0,1),(221,'vatican-city','VA','VAT','336','039',1,1),(222,'venezuela','VE','VEN','862','058',1,1),(223,'wallis-futuna','WF','WLF','876','681',1,1),(224,'western-samoa','WS','WSM','882','685',1,1),(225,'yemen','YE','YEM','887','967',0,1),(226,'zambia','ZM','ZMB','894','260',1,1),(227,'zimbabwe','ZW','ZWE','716','263',0,1),(228,'aland-islands','AX','ALA','248','359',1,1),(229,'bonaire-st-eustatius-saba','BQ','BES','535','599',1,1),(230,'bouvet-island','BV','BVT','74','047',1,1),(231,'british-indian-ocean-territory','IO','IOT','86','246',1,1),(232,'curacao','CW','CUW','531','599',1,1),(233,'french-southern-territories','TF','ATF','260','033',0,1),(234,'guernsey','GG','GGY','831','044',1,1),(235,'heard-island-mcdonald-islands','HM','HMD','334','061',1,1),(236,'isle-of-man','IM','IMN','833','044',1,1),(237,'jersey','JE','JEY','832','044',1,1),(238,'northern-mariana-islands','MP','MNP','580','670',1,1),(239,'pitcairn','PN','PCN','612','649',1,1),(240,'south-georgia-south-sandwich-islands','GS','SGS','239','044',1,1),(241,'south-sudan','SS','SSD','728','211',1,1),(242,'sint-maarten','SX','SXM','534','721',1,1),(243,'st-barthelemy','BL','BLM','652','590',1,1),(244,'st-martin','MF','MAF','663','590',1,1),(245,'tokelau','TK','TKL','772','690',0,1),(246,'timor-leste','TL','TLS','626','670',1,1),(247,'united-states-minor-outlying-islands','UM','UMI','581','699',1,1),(248,'united-states-virgin-islands','VI','VIR','850','340',1,1),(249,'western-sahara','EH','ESH','732','212',1,1);

/*Table structure for table `cyrususer` */

DROP TABLE IF EXISTS `cyrususer`;

CREATE TABLE `cyrususer` (
  `userId` varchar(75) NOT NULL,
  `password_` varchar(75) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cyrususer` */

/*Table structure for table `cyrusvirtual` */

DROP TABLE IF EXISTS `cyrusvirtual`;

CREATE TABLE `cyrusvirtual` (
  `emailAddress` varchar(75) NOT NULL,
  `userId` varchar(75) NOT NULL,
  PRIMARY KEY (`emailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cyrusvirtual` */

/*Table structure for table `ddlrecord` */

DROP TABLE IF EXISTS `ddlrecord`;

CREATE TABLE `ddlrecord` (
  `uuid_` varchar(75) DEFAULT NULL,
  `recordId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `versionUserId` bigint(20) DEFAULT NULL,
  `versionUserName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `DDMStorageId` bigint(20) DEFAULT NULL,
  `recordSetId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `displayIndex` int(11) DEFAULT NULL,
  PRIMARY KEY (`recordId`),
  UNIQUE KEY `IX_B4328F39` (`uuid_`,`groupId`),
  KEY `IX_6A6C1C85` (`companyId`),
  KEY `IX_87A6B599` (`recordSetId`),
  KEY `IX_AAC564D3` (`recordSetId`,`userId`),
  KEY `IX_8BC2F891` (`uuid_`),
  KEY `IX_384AB6F7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ddlrecord` */

/*Table structure for table `ddlrecordset` */

DROP TABLE IF EXISTS `ddlrecordset`;

CREATE TABLE `ddlrecordset` (
  `uuid_` varchar(75) DEFAULT NULL,
  `recordSetId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `DDMStructureId` bigint(20) DEFAULT NULL,
  `recordSetKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `minDisplayRows` int(11) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  PRIMARY KEY (`recordSetId`),
  UNIQUE KEY `IX_56DAB121` (`groupId`,`recordSetKey`),
  UNIQUE KEY `IX_270BA5E1` (`uuid_`,`groupId`),
  KEY `IX_4FA5969F` (`groupId`),
  KEY `IX_561E44E9` (`uuid_`),
  KEY `IX_5938C39F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ddlrecordset` */

/*Table structure for table `ddlrecordversion` */

DROP TABLE IF EXISTS `ddlrecordversion`;

CREATE TABLE `ddlrecordversion` (
  `recordVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `DDMStorageId` bigint(20) DEFAULT NULL,
  `recordSetId` bigint(20) DEFAULT NULL,
  `recordId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `displayIndex` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`recordVersionId`),
  UNIQUE KEY `IX_C79E347` (`recordId`,`version`),
  KEY `IX_2F4DDFE1` (`recordId`),
  KEY `IX_762ADC7` (`recordId`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ddlrecordversion` */

/*Table structure for table `ddmcontent` */

DROP TABLE IF EXISTS `ddmcontent`;

CREATE TABLE `ddmcontent` (
  `uuid_` varchar(75) DEFAULT NULL,
  `contentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `xml` longtext,
  PRIMARY KEY (`contentId`),
  UNIQUE KEY `IX_EB9BDE28` (`uuid_`,`groupId`),
  KEY `IX_E3BAF436` (`companyId`),
  KEY `IX_50BF1038` (`groupId`),
  KEY `IX_AE4B50C2` (`uuid_`),
  KEY `IX_3A9C0626` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ddmcontent` */

insert  into `ddmcontent`(`uuid_`,`contentId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`description`,`xml`) values ('187e549d-d3bd-4e43-bb59-db2ecbe6604c',10563,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/png]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8 8 8 8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('66188f79-16af-4b0d-9b19-c2ff228581a5',10584,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/png]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8 8 8 8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('256bf8ae-8517-413f-8478-02e1ad373cf9',10590,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/png]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8 8 8 8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('1fd12392-c35e-49d2-8d21-407181273841',10609,10182,10155,10159,'','2016-03-15 19:18:24','2016-03-15 19:18:24','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2013-08-28T22:33:19Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2013-08-28T22:33:19Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2013-08-28T22:30:43Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/pdf]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2013-08-28T22:33:19Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2013-08-28T22:30:43Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('983c898a-17e8-49ea-93c3-f69ae6df4122',10613,10182,10155,10159,'','2016-03-15 19:18:24','2016-03-15 19:18:24','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/png]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8 8 8 8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('bebe7b64-bea7-4427-ab12-8db30ced4afc',10617,10182,10155,10159,'','2016-03-15 19:18:24','2016-03-15 19:18:24','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/png]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[50]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8 8 8 8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('995a5455-f628-48cc-80d0-f227fa0ffb88',10876,10182,10155,10199,'Test Test','2016-03-15 20:50:59','2016-03-15 20:50:59','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[text/plain; charset=ISO-8859-1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_ENCODING\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[ISO-8859-1]]></dynamic-content>\n	</dynamic-element>\n</root>'),('27d957a8-09c7-4001-aa6c-b385e8083f6a',10880,10182,10155,10199,'Test Test','2016-03-15 20:50:59','2016-03-15 20:50:59','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[text/plain; charset=ISO-8859-1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_ENCODING\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[ISO-8859-1]]></dynamic-content>\n	</dynamic-element>\n</root>'),('bef548c2-e265-4908-8aa4-f1a782d1d64b',10884,10182,10155,10199,'Test Test','2016-03-15 20:50:59','2016-03-15 20:50:59','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_AUTHOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/pdf]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_TITLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('f6ff9bc7-5f06-465e-90e3-07cf34f3a48c',10888,10182,10155,10199,'Test Test','2016-03-15 20:51:00','2016-03-15 20:51:00','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_AUTHOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/pdf]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_TITLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('eee51a8b-81e0-40a4-a079-52a4d0061470',10892,10182,10155,10199,'Test Test','2016-03-15 20:51:00','2016-03-15 20:51:00','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_AUTHOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/pdf]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_TITLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('606d4759-2bec-4dbc-8064-60979654585f',10896,10182,10155,10199,'Test Test','2016-03-15 20:51:00','2016-03-15 20:51:00','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_AUTHOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/pdf]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_TITLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('5c341fba-b203-4921-99b2-7c4ea9bbab92',10903,10182,10155,10199,'Test Test','2016-03-15 20:51:00','2016-03-15 20:51:00','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('febc2ee3-e2a2-478d-a9bc-c34915f65359',10907,10182,10155,10199,'Test Test','2016-03-15 20:51:00','2016-03-15 20:51:00','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('3aeb12e8-44a1-4940-abcc-818fb7e21df3',10914,10182,10155,10199,'Test Test','2016-03-15 20:51:01','2016-03-15 20:51:01','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('c52da545-2d3e-44c0-87cd-6eca0e388cb0',10920,10182,10155,10199,'Test Test','2016-03-15 20:51:01','2016-03-15 20:51:01','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('d1d92587-5e76-4c93-90fc-271f36b05f28',10927,10182,10155,10199,'Test Test','2016-03-15 20:51:01','2016-03-15 20:51:01','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('f4a6dc54-cdb3-43f2-8e2e-5e7a6d5ba9a9',11840,10182,10155,10199,'Whitehall Admin','2016-03-19 20:21:32','2016-03-19 20:21:32','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2016-03-19T20:20:51Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2016-03-19T20:20:51Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2016-03-19T20:20:51Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>');

/*Table structure for table `ddmstoragelink` */

DROP TABLE IF EXISTS `ddmstoragelink`;

CREATE TABLE `ddmstoragelink` (
  `uuid_` varchar(75) DEFAULT NULL,
  `storageLinkId` bigint(20) NOT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `structureId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`storageLinkId`),
  UNIQUE KEY `IX_702D1AD5` (`classPK`),
  KEY `IX_81776090` (`structureId`),
  KEY `IX_32A18526` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ddmstoragelink` */

insert  into `ddmstoragelink`(`uuid_`,`storageLinkId`,`classNameId`,`classPK`,`structureId`) values ('e6b37948-bfca-4c78-8ff3-4220061ccef6',10564,10100,10563,10316),('02c33307-07c3-4df4-95a4-f55056939085',10585,10100,10584,10316),('b7ba9a70-1791-4446-91b8-57c341734f91',10591,10100,10590,10316),('20b669eb-727f-414c-8ee7-faac5dda9ed3',10610,10100,10609,10316),('eca3b3c3-c495-45c9-9ab5-83b6ac436613',10614,10100,10613,10316),('2e52af60-34bc-4866-acd9-caaea61e36db',10618,10100,10617,10316),('b6dd4d0f-e4bb-4339-94b3-466feb3dea94',10877,10100,10876,10316),('0ba556e0-71e0-4422-994d-a72d944250c6',10881,10100,10880,10316),('f6546d09-c9db-4936-9b13-db8d2522db6e',10885,10100,10884,10316),('1ffa1782-e26e-462f-b341-1a3548c60306',10889,10100,10888,10316),('db2670d1-0fd4-4729-aff1-033d4a53a202',10893,10100,10892,10316),('bf2b0e46-b06c-4cdb-9872-96a8712d4685',10897,10100,10896,10316),('8d4b312f-df8e-4045-b0e3-7e06d28d668a',10904,10100,10903,10316),('ae173a44-9d98-4864-b98b-42b2e47a034c',10908,10100,10907,10316),('a2afd2ea-dc8e-4df1-9f99-49a7b7c24466',10915,10100,10914,10316),('1f5624d5-97c2-4283-aacf-f38d023735e5',10921,10100,10920,10316),('78adab7a-195e-4047-bc5c-19728a9b21fe',10928,10100,10927,10316),('8c64b57a-a91c-4787-84da-65f4b31ecec2',11841,10100,11840,10316);

/*Table structure for table `ddmstructure` */

DROP TABLE IF EXISTS `ddmstructure`;

CREATE TABLE `ddmstructure` (
  `uuid_` varchar(75) DEFAULT NULL,
  `structureId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentStructureId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `structureKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `xsd` longtext,
  `storageType` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  PRIMARY KEY (`structureId`),
  UNIQUE KEY `IX_C8785130` (`groupId`,`classNameId`,`structureKey`),
  UNIQUE KEY `IX_85C7EBE2` (`uuid_`,`groupId`),
  KEY `IX_31817A62` (`classNameId`),
  KEY `IX_4FBAC092` (`companyId`,`classNameId`),
  KEY `IX_C8419FBE` (`groupId`),
  KEY `IX_B6ED5E50` (`groupId`,`classNameId`),
  KEY `IX_43395316` (`groupId`,`parentStructureId`),
  KEY `IX_657899A8` (`parentStructureId`),
  KEY `IX_20FDE04C` (`structureKey`),
  KEY `IX_E61809C8` (`uuid_`),
  KEY `IX_F9FB8D60` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ddmstructure` */

insert  into `ddmstructure`(`uuid_`,`structureId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`parentStructureId`,`classNameId`,`structureKey`,`name`,`description`,`xsd`,`storageType`,`type_`) values ('ebd0e696-3ffb-4406-b83c-ea6b023a84c5',10304,10195,10155,10159,'','2016-03-15 19:16:33','2016-03-15 19:16:33',0,10091,'LEARNING MODULE METADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Learning Module Metadata</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Learning Module Metadata</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select2235\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"home_edition\" type=\"option\" value=\"HE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Home Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"business_edition\" type=\"option\" value=\"BE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Business Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"enterprise_edition\" type=\"option\" value=\"EE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Enterprise Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Product]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select3212\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"1_0\" type=\"option\" value=\"1\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[1.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"2_0\" type=\"option\" value=\"2\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[2.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"3_0\" type=\"option\" value=\"3\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[3.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Version]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select4115\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"administration\" type=\"option\" value=\"admin\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Administration]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"installation\" type=\"option\" value=\"install\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Installation]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"configuration\" type=\"option\" value=\"config\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Configuration]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Topics]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select5069\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"beginner\" type=\"option\" value=\"beginner\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Beginner]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"intermediate\" type=\"option\" value=\"intermediate\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Intermediate]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"advanced\" type=\"option\" value=\"advanced\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Advanced]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Level]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('cb1aa291-ad2b-4d25-a92e-ac23c5e9f2ed',10305,10195,10155,10159,'','2016-03-15 19:16:34','2016-03-15 19:16:34',0,10091,'MARKETING CAMPAIGN THEME METADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Marketing Campaign Theme Metadata</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Marketing Campaign Theme Metadata</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select2305\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"strong_company\" type=\"option\" value=\"strong\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Strong Company]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"new_product_launch\" type=\"option\" value=\"product\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[New Product Launch]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"company_philosophy\" type=\"option\" value=\"philosophy\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Company Philosophy]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Select]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select3229\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"your_trusted_advisor\" type=\"option\" value=\"advisor\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Your Trusted Advisor]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"10_years_of_customer_solutions\" type=\"option\" value=\"solutions\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[10 Years of Customer Solutions]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"making_a_difference\" type=\"option\" value=\"difference\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Making a Difference]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Campaign Theme]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select4282\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"awareness\" type=\"option\" value=\"awareness\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Awareness]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"lead_generation\" type=\"option\" value=\"leads\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Lead Generation]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"customer_service\" type=\"option\" value=\"service\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Customer Service]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Business Goal]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('24f7df6c-4002-4bed-8361-a547918e71c5',10306,10195,10155,10159,'','2016-03-15 19:16:34','2016-03-15 19:16:34',0,10091,'MEETING METADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Meeting Metadata</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Metadata for meeting</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"ddm-date3054\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2217\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Meeting Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text4569\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Time]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text5638\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Location]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"text\" name=\"textarea6584\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"text\" name=\"textarea7502\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Participants]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('2dc5c043-3f43-4b0e-8601-4cc974890fc6',10308,10195,10155,10159,'','2016-03-15 19:16:34','2016-03-15 19:16:34',0,10091,'AUTO_04E314FD-6284-4B8C-9789-5C2F8B87B442','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contract</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Contract</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"ddm-date18949\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Effective Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"ddm-date20127\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Expiration Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select10264\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"nda\" type=\"option\" value=\"NDA\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[NDA]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"msa\" type=\"option\" value=\"MSA\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[MSA]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"license_agreement\" type=\"option\" value=\"License\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[License Agreement]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Contract Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select4893\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"draft\" type=\"option\" value=\"Draft\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Draft]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"in_review\" type=\"option\" value=\"Review\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[In Review]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"suspended\" type=\"option\" value=\"Suspended\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Suspended]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"signed\" type=\"option\" value=\"Signed\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Signed]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Status]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text14822\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Legal Reviewer]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text17700\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Signing Authority]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2087\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Deal Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('a0c11d4a-2530-4669-bf14-ed5959512898',10310,10195,10155,10159,'','2016-03-15 19:16:35','2016-03-15 19:16:35',0,10091,'AUTO_EC3EB506-8B69-41C4-BC7B-59F76D2C9952','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Marketing Banner</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Marketing Banner</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"radio5547\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"radio\">\n		<dynamic-element name=\"yes\" type=\"option\" value=\"yes\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Yes]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"no\" type=\"option\" value=\"no\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[No]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Needs Legal Review]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2033\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Banner Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"text\" name=\"textarea2873\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('8561a40c-0ae7-4267-a7c5-e3efb837d4a2',10312,10195,10155,10159,'','2016-03-15 19:16:35','2016-03-15 19:16:35',0,10091,'AUTO_246D9414-74BC-4C47-9EE7-7CE3F8D94A35','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Online Training</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Online Training</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2082\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Lesson Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2979\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Author]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('90ea3b9d-3cb6-46b9-9aaa-27ef7726edf1',10314,10195,10155,10159,'','2016-03-15 19:16:35','2016-03-15 19:16:35',0,10091,'AUTO_4A15916F-15CF-4B07-9282-98768B96750B','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Sales Presentation</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Sales Presentation</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select2890\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"home_edition\" type=\"option\" value=\"HE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Home Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"business_edition\" type=\"option\" value=\"BE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Business Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"enterprise_edition\" type=\"option\" value=\"EE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Enterprise Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Product]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select3864\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"1_0\" type=\"option\" value=\"1\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[1.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"2_0\" type=\"option\" value=\"2\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[2.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"3_0\" type=\"option\" value=\"3\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[3.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Version]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select4831\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"website\" type=\"option\" value=\"website\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Website]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"collaboration\" type=\"option\" value=\"collaboration\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Collaboration]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"intranet\" type=\"option\" value=\"intranet\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Intranet]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Areas of Interest]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select5929\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"acme\" type=\"option\" value=\"acme\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[ACME]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"sevencogs\" type=\"option\" value=\"sevencogs\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[SevenCogs]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"freeplus\" type=\"option\" value=\"freeplus\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[FreePlus]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Competitors]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text1993\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Prospect Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('09dc2b63-6fda-42d7-8ae1-9d2b44272340',10316,10195,10155,10159,'','2016-03-15 19:16:35','2016-03-15 19:16:35',0,10315,'TIKARAWMETADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">TIKARAWMETADATA</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">TIKARAWMETADATA</Description></root>','<root available-locales=\"en_US\" default-locale=\"en_US\"><dynamic-element dataType=\"string\" name=\"ClimateForcast_PROGRAM_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.PROGRAM_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_COMMAND_LINE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.COMMAND_LINE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_HISTORY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.HISTORY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_TABLE_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.TABLE_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_INSTITUTION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.INSTITUTION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_SOURCE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.SOURCE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_CONTACT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.CONTACT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_PROJECT_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.PROJECT_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_CONVENTIONS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.CONVENTIONS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_REFERENCES\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.REFERENCES]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_ACKNOWLEDGEMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.ACKNOWLEDGEMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_REALIZATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.REALIZATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_EXPERIMENT_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.EXPERIMENT_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_COMMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.COMMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_MODEL_NAME_ENGLISH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.MODEL_NAME_ENGLISH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"CreativeCommons_LICENSE_URL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.CreativeCommons.LICENSE_URL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"CreativeCommons_LICENSE_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.CreativeCommons.LICENSE_LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"CreativeCommons_WORK_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.CreativeCommons.WORK_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_NAMESPACE_URI_DC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.NAMESPACE_URI_DC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_NAMESPACE_URI_DC_TERMS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.NAMESPACE_URI_DC_TERMS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_PREFIX_DC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.PREFIX_DC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_PREFIX_DC_TERMS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.PREFIX_DC_TERMS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_FORMAT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.FORMAT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_IDENTIFIER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.IDENTIFIER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_MODIFIED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.MODIFIED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_CONTRIBUTOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.CONTRIBUTOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_COVERAGE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.COVERAGE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_CREATOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.CREATOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_CREATED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.CREATED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_DESCRIPTION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.DESCRIPTION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_LANGUAGE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.LANGUAGE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_PUBLISHER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.PUBLISHER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_RELATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.RELATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_RIGHTS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.RIGHTS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_SOURCE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.SOURCE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_SUBJECT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.SUBJECT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_TITLE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.TITLE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Geographic_LATITUDE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Geographic.LATITUDE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Geographic_LONGITUDE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Geographic.LONGITUDE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Geographic_ALTITUDE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Geographic.ALTITUDE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_ENCODING\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_ENCODING]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_LANGUAGE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_LANGUAGE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_LENGTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_LENGTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_DISPOSITION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_DISPOSITION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_MD5\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_MD5]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_LAST_MODIFIED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.LAST_MODIFIED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_RECIPIENT_ADDRESS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_RECIPIENT_ADDRESS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_FROM\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_FROM]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_TO\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_TO]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_CC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_CC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_BCC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_BCC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_KEYWORDS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.KEYWORDS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_COMMENTS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.COMMENTS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LAST_AUTHOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LAST_AUTHOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_AUTHOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.AUTHOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_APPLICATION_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.APPLICATION_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_REVISION_NUMBER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.REVISION_NUMBER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_TEMPLATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.TEMPLATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_TOTAL_TIME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.TOTAL_TIME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_PRESENTATION_FORMAT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.PRESENTATION_FORMAT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_NOTES\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.NOTES]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_MANAGER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.MANAGER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_APPLICATION_VERSION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.APPLICATION_VERSION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_VERSION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.VERSION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CONTENT_STATUS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CONTENT_STATUS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CATEGORY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CATEGORY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_COMPANY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.COMPANY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_SECURITY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.SECURITY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_SLIDE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.SLIDE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_PAGE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.PAGE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_PARAGRAPH_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.PARAGRAPH_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LINE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LINE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_WORD_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.WORD_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CHARACTER_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CHARACTER_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CHARACTER_COUNT_WITH_SPACES\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CHARACTER_COUNT_WITH_SPACES]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_TABLE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.TABLE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_IMAGE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.IMAGE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_OBJECT_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.OBJECT_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_EDIT_TIME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.EDIT_TIME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CREATION_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CREATION_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LAST_SAVED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LAST_SAVED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LAST_PRINTED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LAST_PRINTED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_USER_DEFINED_METADATA_NAME_PREFIX\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.USER_DEFINED_METADATA_NAME_PREFIX]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_BITS_PER_SAMPLE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.BITS_PER_SAMPLE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_IMAGE_LENGTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.IMAGE_LENGTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_IMAGE_WIDTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.IMAGE_WIDTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_SAMPLES_PER_PIXEL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.SAMPLES_PER_PIXEL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_FLASH_FIRED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.FLASH_FIRED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_EXPOSURE_TIME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.EXPOSURE_TIME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_F_NUMBER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.F_NUMBER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_FOCAL_LENGTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.FOCAL_LENGTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_ISO_SPEED_RATINGS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.ISO_SPEED_RATINGS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_EQUIPMENT_MAKE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.EQUIPMENT_MAKE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_EQUIPMENT_MODEL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.EQUIPMENT_MODEL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_SOFTWARE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.SOFTWARE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_ORIENTATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.ORIENTATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_RESOLUTION_HORIZONTAL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.RESOLUTION_HORIZONTAL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_RESOLUTION_VERTICAL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.RESOLUTION_VERTICAL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_RESOLUTION_UNIT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.RESOLUTION_UNIT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_ORIGINAL_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.ORIGINAL_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMetadataKeys_RESOURCE_NAME_KEY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMetadataKeys.RESOURCE_NAME_KEY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMetadataKeys_PROTECTED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMetadataKeys.PROTECTED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMetadataKeys_EMBEDDED_RELATIONSHIP_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMetadataKeys.EMBEDDED_RELATIONSHIP_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMimeKeys_TIKA_MIME_FILE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMimeKeys.TIKA_MIME_FILE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMimeKeys_MIME_TYPE_MAGIC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMimeKeys.MIME_TYPE_MAGIC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_DURATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.DURATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ABS_PEAK_AUDIO_FILE_PATH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ABS_PEAK_AUDIO_FILE_PATH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ALBUM\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ALBUM]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ALT_TAPE_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ALT_TAPE_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ARTIST\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ARTIST]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_MOD_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_MOD_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_SAMPLE_RATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_SAMPLE_RATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_SAMPLE_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_SAMPLE_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_CHANNEL_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_CHANNEL_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_COMPRESSOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_COMPRESSOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_COMPOSER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.COMPOSER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_COPYRIGHT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.COPYRIGHT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ENGINEER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ENGINEER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_FILE_DATA_RATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.FILE_DATA_RATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_GENRE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.GENRE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_INSTRUMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.INSTRUMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_KEY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.KEY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_LOG_COMMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.LOG_COMMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_LOOP\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.LOOP]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_NUMBER_OF_BEATS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.NUMBER_OF_BEATS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_METADATA_MOD_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.METADATA_MOD_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_PULL_DOWN\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.PULL_DOWN]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_RELATIVE_PEAK_AUDIO_FILE_PATH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.RELATIVE_PEAK_AUDIO_FILE_PATH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_RELEASE_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.RELEASE_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SCALE_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SCALE_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SCENE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SCENE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SHOT_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SHOT_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SHOT_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SHOT_LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SHOT_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SHOT_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SPEAKER_PLACEMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SPEAKER_PLACEMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_STRETCH_MODE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.STRETCH_MODE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TAPE_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TAPE_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TEMPO\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TEMPO]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TIME_SIGNATURE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TIME_SIGNATURE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TRACK_NUMBER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TRACK_NUMBER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_ALPHA_MODE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_ALPHA_MODE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_ALPHA_UNITY_IS_TRANSPARENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_ALPHA_UNITY_IS_TRANSPARENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_COLOR_SPACE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_COLOR_SPACE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_COMPRESSOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_COMPRESSOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_FIELD_ORDER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_FIELD_ORDER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_FRAME_RATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_FRAME_RATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_MOD_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_MOD_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_PIXEL_DEPTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_PIXEL_DEPTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_PIXEL_ASPECT_RATIO\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_PIXEL_ASPECT_RATIO]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element></root>','xml',0),('85ae61a9-5789-4d2f-adac-b6966f2080f2',10594,10182,10155,10159,'','2016-03-15 19:18:23','2015-07-17 19:16:45',0,10109,'BASIC-WEB-CONTENT-6.2.2.1','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Basic Web Content - 6.2.2.1</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"html\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"content\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-text-html\" width=\"small\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Content]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('a0f83fd4-0fd6-4ef9-993a-489db0efde30',10707,10182,10155,10199,'Test Test','2015-07-17 20:50:48','2015-07-17 20:50:48',0,10098,'CONTACTS','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contacts</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Contacts</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"company\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Company]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"email\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Email]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"firstName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[First Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"imService\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"aol\" type=\"option\" value=\"aol\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[AOL]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"yahoo\" type=\"option\" value=\"yahoo\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Yahoo]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"gtalk\" type=\"option\" value=\"gtalk\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[GTalk]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Instant Messenger Service]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"gtalk\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"imUserName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Instant Messenger]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"jobTitle\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Job Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"lastName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Last Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"notes\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Notes]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"phoneMobile\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Phone (Mobile)]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"phoneOffice\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Phone (Office)]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('7ab18a9f-ce47-44ee-bd6c-49a1a6183265',10708,10182,10155,10199,'Test Test','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'EVENTS','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Events</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Events</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"double\" fieldNamespace=\"ddm\" name=\"cost\" required=\"false\" showLabel=\"true\" type=\"ddm-number\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Cost]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"eventDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"eventName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Event Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"eventTime\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Time]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"location\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Location]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('dd59073a-a5ca-4a5e-8036-327bcf568254',10709,10182,10155,10199,'Test Test','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'INVENTORY','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Inventory</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Inventory</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"item\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Item]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"location\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Location]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"purchaseDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Purchase Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"double\" fieldNamespace=\"ddm\" name=\"purchasePrice\" required=\"false\" showLabel=\"true\" type=\"ddm-number\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Purchase Price]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"double\" fieldNamespace=\"ddm\" name=\"quantity\" required=\"false\" showLabel=\"true\" type=\"ddm-number\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Quantity]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('ff28b286-df52-4141-b063-f7d99b80a69f',10710,10182,10155,10199,'Test Test','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'ISSUES TRACKING','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Issues Tracking</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Issue Tracking</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"assignedTo\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Assigned To]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"comments\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Comments]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"dueDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Due Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"issueId\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Issue ID]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"severity\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"critical\" type=\"option\" value=\"critical\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Critical]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"major\" type=\"option\" value=\"major\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Major]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"minor\" type=\"option\" value=\"minor\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Minor]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"trivial\" type=\"option\" value=\"trivial\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Trivial]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Severity]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"minor\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"status\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"open\" type=\"option\" value=\"open\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Open]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"pending\" type=\"option\" value=\"pending\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Pending]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"completed\" type=\"option\" value=\"completed\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Completed]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Status]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"open\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"title\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('6cb566df-6640-4231-9963-8fafc0ce0891',10711,10182,10155,10199,'Test Test','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'MEETING MINUTES','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Meeting Minutes</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Meeting Minutes</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"author\" required=\"false\" showLabel=\"true\" type=\"text\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Author]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"duration\" required=\"false\" showLabel=\"true\" type=\"text\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Meeting Duration]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"meetingDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Meeting Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"minutes\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Minutes]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"title\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('97907290-6b20-427c-bc59-6807aef6263c',10712,10182,10155,10199,'Test Test','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'TO DO','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">To Do</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">To Do</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"assignedTo\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Assigned To]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"comments\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Comments]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"endDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[End Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"integer\" fieldNamespace=\"ddm\" name=\"percentComplete\" required=\"false\" showLabel=\"true\" type=\"ddm-integer\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[% Complete]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"severity\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"critical\" type=\"option\" value=\"critical\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Critical]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"major\" type=\"option\" value=\"major\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Major]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"minor\" type=\"option\" value=\"minor\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Minor]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"trivial\" type=\"option\" value=\"trivial\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Trivial]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Severity]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"minor\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"startDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Start Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"status\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"open\" type=\"option\" value=\"open\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Open]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"pending\" type=\"option\" value=\"pending\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Pending]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"completed\" type=\"option\" value=\"completed\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Completed]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Status]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"open\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"title\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('9ba2f1d4-bb3e-4c68-8d0f-ffb6a4b4c36f',11159,11148,10155,10159,'','2016-03-15 21:10:38','2016-03-15 21:10:38',0,10109,'CAROUSEL-1.0-SNAPSHOT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel - 1.0-SNAPSHOT</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"\" name=\"height\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"25\" type=\"text\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Carousel Height]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[320]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"\" multiple=\"false\" name=\"duration\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"\" type=\"select\">\n		<dynamic-element name=\"optionqual\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[1]]></entry>\n				<entry name=\"label\"><![CDATA[option1]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionousk\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[2]]></entry>\n				<entry name=\"label\"><![CDATA[option2]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionrrge\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[3]]></entry>\n				<entry name=\"label\"><![CDATA[option3]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionvyow\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[4]]></entry>\n				<entry name=\"label\"><![CDATA[option4]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionyhym\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[5]]></entry>\n				<entry name=\"label\"><![CDATA[option5]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optiongnnm\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[6]]></entry>\n				<entry name=\"label\"><![CDATA[option6]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optiongyrb\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[7]]></entry>\n				<entry name=\"label\"><![CDATA[option7]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionyyqw\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[8]]></entry>\n				<entry name=\"label\"><![CDATA[option8]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionjsfj\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[9]]></entry>\n				<entry name=\"label\"><![CDATA[option9]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optiononkh\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[10]]></entry>\n				<entry name=\"label\"><![CDATA[option10]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Transition Duration]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"5\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"\" name=\"carousel-item\" readOnly=\"false\" repeatable=\"true\" required=\"false\" showLabel=\"true\" width=\"25\" type=\"text\">\n		<dynamic-element dataType=\"string\" indexType=\"\" name=\"tagline\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"25\" type=\"text\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Item Tagline]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element dataType=\"string\" fieldNamespace=\"ddm\" indexType=\"\" name=\"image\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"\" type=\"ddm-documentlibrary\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Item Image]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element dataType=\"string\" fieldNamespace=\"ddm\" indexType=\"\" name=\"url-location\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"25\" type=\"ddm-link-to-page\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Item Url]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Carousel Item]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0);

/*Table structure for table `ddmstructurelink` */

DROP TABLE IF EXISTS `ddmstructurelink`;

CREATE TABLE `ddmstructurelink` (
  `structureLinkId` bigint(20) NOT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `structureId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`structureLinkId`),
  UNIQUE KEY `IX_C803899D` (`classPK`),
  KEY `IX_D43E4208` (`classNameId`),
  KEY `IX_17692B58` (`structureId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ddmstructurelink` */

insert  into `ddmstructurelink`(`structureLinkId`,`classNameId`,`classPK`,`structureId`) values (10574,10091,10556,10316),(10586,10091,10581,10316),(10592,10091,10589,10316),(10611,10091,10608,10316),(10615,10091,10612,10316),(10619,10091,10616,10316),(10878,10091,10875,10316),(10882,10091,10879,10316),(10886,10091,10883,10316),(10890,10091,10887,10316),(10894,10091,10891,10316),(10898,10091,10895,10316),(10905,10091,10902,10316),(10909,10091,10906,10316),(10916,10091,10913,10316),(10922,10091,10919,10316),(10929,10091,10926,10316),(11842,10091,11839,10316);

/*Table structure for table `ddmtemplate` */

DROP TABLE IF EXISTS `ddmtemplate`;

CREATE TABLE `ddmtemplate` (
  `uuid_` varchar(75) DEFAULT NULL,
  `templateId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `templateKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `mode_` varchar(75) DEFAULT NULL,
  `language` varchar(75) DEFAULT NULL,
  `script` longtext,
  `cacheable` tinyint(4) DEFAULT NULL,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`templateId`),
  UNIQUE KEY `IX_E6DFAB84` (`groupId`,`classNameId`,`templateKey`),
  UNIQUE KEY `IX_1AA75CE3` (`uuid_`,`groupId`),
  KEY `IX_B6356F93` (`classNameId`,`classPK`,`type_`),
  KEY `IX_32F83D16` (`classPK`),
  KEY `IX_DB24DDDD` (`groupId`),
  KEY `IX_BD9A4A91` (`groupId`,`classNameId`),
  KEY `IX_824ADC72` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_90800923` (`groupId`,`classNameId`,`classPK`,`type_`),
  KEY `IX_F0C3449` (`groupId`,`classNameId`,`classPK`,`type_`,`mode_`),
  KEY `IX_B1C33EA6` (`groupId`,`classPK`),
  KEY `IX_33BEF579` (`language`),
  KEY `IX_127A35B0` (`smallImageId`),
  KEY `IX_CAE41A28` (`templateKey`),
  KEY `IX_C4F283C8` (`type_`),
  KEY `IX_F2A243A7` (`uuid_`),
  KEY `IX_D4C2C221` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ddmtemplate` */

insert  into `ddmtemplate`(`uuid_`,`templateId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`templateKey`,`name`,`description`,`type_`,`mode_`,`language`,`script`,`cacheable`,`smallImage`,`smallImageId`,`smallImageURL`) values ('0247b892-a07b-4b6f-bfac-def683abfd64',10419,10195,10155,10159,'','2016-03-15 19:16:48','2016-03-15 19:16:48',10016,0,'WIKI-SOCIAL-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Social</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays social bookmarks and ratings for wiki pages and their child pages.</Description></root>','display','','ftl','<#assign liferay_ui = taglibLiferayHash[\"/WEB-INF/tld/liferay-ui.tld\"] />\n\n<#assign wikiPageClassName = \"com.liferay.portlet.wiki.model.WikiPage\" />\n\n<#assign assetRenderer = assetEntry.getAssetRenderer() />\n\n<div class=\"taglib-header\">\n	<h1 class=\"header-title\">${entry.getTitle()}</h1>\n</div>\n\n<div style=\"float: right;\">\n	<@getEditIcon />\n\n	<@getPageDetailsIcon />\n\n	<@getPrintIcon />\n</div>\n\n<div class=\"wiki-body\">\n	<div class=\"wiki-info\">\n		<span class=\"stats\">${assetEntry.getViewCount()} <@liferay.language key=\"views\" /></span> |\n\n		<span class=\"date\"><@liferay.language key=\"last-modified\" /> ${dateUtil.getDate(entry.getModifiedDate(), \"dd MMM yyyy - HH:mm:ss\", locale)}</span>\n\n		<span class=\"author\"><@liferay.language key=\"by\" /> ${htmlUtil.escape(portalUtil.getUserName(entry.getUserId(), entry.getUserName()))}</span>\n	</div>\n\n	<div class=\"wiki-content\">\n		<@liferay_ui[\"social-bookmarks\"]\n			displayStyle=\"normal\"\n			target=\"_blank\"\n			title=entry.getTitle()\n			url=viewURL\n		/>\n\n		${formattedContent}\n	</div>\n\n	<div class=\"page-actions\">\n		<div class=\"article-actions\">\n			<@getAddChildPageIcon />\n\n			<@getAttatchmentsIcon />\n		</div>\n	</div>\n\n	 <br />\n\n	<@getRatings cssClass=\"page-ratings\" entry=entry />\n\n	<@getRelatedAssets />\n</div>\n\n<div class=\"page-categorization\">\n	<div class=\"page-categories\">\n		<#assign viewCategorizedPagesURL = renderResponse.createRenderURL() />\n\n		${viewCategorizedPagesURL.setParameter(\"struts_action\", \"/wiki/view_categorized_pages\")}\n		${viewCategorizedPagesURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n\n		<@liferay_ui[\"asset-categories-summary\"]\n			className=wikiPageClassName\n			classPK=entry.getResourcePrimKey()\n			portletURL=viewCategorizedPagesURL\n		/>\n	</div>\n\n	<div class=\"page-tags\">\n		<#assign viewTaggedPagesURL = renderResponse.createRenderURL() />\n\n		${viewTaggedPagesURL.setParameter(\"struts_action\", \"/wiki/view_tagged_pages\")}\n		${viewTaggedPagesURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n\n		<@liferay_ui[\"asset-tags-summary\"]\n			className=wikiPageClassName\n			classPK=entry.getResourcePrimKey()\n			portletURL=viewTaggedPagesURL\n		/>\n	</div>\n</div>\n\n<#assign childPages = entry.getChildPages() />\n\n<#if (childPages?has_content)>\n	<div class=\"child-pages\">\n		<h2><@liferay.language key=\"children-pages\" /></h2>\n\n		<table class=\"taglib-search-iterator\">\n			<tr class=\"portlet-section-header results-header\">\n				<th>\n					<@liferay.language key=\"page\" />\n				</th>\n				<th>\n					<@liferay.language key=\"last-modified\" />\n				</th>\n				<th>\n					<@liferay.language key=\"ratings\" />\n				</th>\n			</tr>\n\n			<#list childPages as childPage>\n				<tr class=\"results-row\">\n					<#assign viewPageURL = renderResponse.createRenderURL() />\n\n					${viewPageURL.setParameter(\"struts_action\", \"/wiki/view\")}\n\n					<#assign childNode = childPage.getNode() />\n\n					${viewPageURL.setParameter(\"nodeName\", childNode.getName())}\n					${viewPageURL.setParameter(\"title\", childPage.getTitle())}\n\n					<td>\n						<a href=\"${viewPageURL}\">${childPage.getTitle()}</a>\n					</td>\n					<td>\n						<a href=\"${viewPageURL}\">${dateUtil.getDate(childPage.getModifiedDate(),\"dd MMM yyyy - HH:mm:ss\", locale)} <@liferay.language key=\"by\" /> ${htmlUtil.escape(portalUtil.getUserName(childPage.getUserId(), childPage.getUserName()))}</a>\n					</td>\n					<td>\n						<@getRatings cssClass=\"child-ratings\" entry=childPage />\n					</td>\n				</tr>\n			</#list>\n		</table>\n	</div>\n</#if>\n\n<@getDiscussion />\n\n<#macro getAddChildPageIcon>\n	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>\n		<#assign addPageURL = renderResponse.createRenderURL() />\n\n		${addPageURL.setParameter(\"struts_action\", \"/wiki/edit_page\")}\n		${addPageURL.setParameter(\"redirect\", currentURL)}\n		${addPageURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n		${addPageURL.setParameter(\"title\", \"\")}\n		${addPageURL.setParameter(\"editTitle\", \"1\")}\n		${addPageURL.setParameter(\"parentTitle\", entry.getTitle())}\n\n		<@liferay_ui[\"icon\"]\n			image=\"add_article\"\n			label=true\n			message=\"add-child-page\"\n			url=addPageURL?string\n		/>\n	</#if>\n</#macro>\n\n<#macro getAttatchmentsIcon>\n	<#assign viewPageAttachmentsURL = renderResponse.createRenderURL() />\n\n	${viewPageAttachmentsURL.setParameter(\"struts_action\", \"/wiki/view_page_attachments\") }\n\n	<@liferay_ui[\"icon\"]\n		image=\"clip\"\n		label=true\n		message=\'${entry.getAttachmentsFileEntriesCount() + languageUtil.get(locale, \"attachments\")}\'\n		url=viewPageAttachmentsURL?string\n	/>\n</#macro>\n\n<#macro getDiscussion>\n	<#if validator.isNotNull(assetRenderer.getDiscussionPath()) && (enableComments == \"true\")>\n		<br />\n\n		<#assign discussionURL = renderResponse.createActionURL() />\n\n		${discussionURL.setParameter(\"struts_action\", \"/wiki/\" + assetRenderer.getDiscussionPath())}\n\n		<@liferay_ui[\"discussion\"]\n			className=wikiPageClassName\n			classPK=entry.getResourcePrimKey()\n			formAction=discussionURL?string\n			formName=\"fm2\"\n			ratingsEnabled=enableCommentRatings == \"true\"\n			redirect=currentURL\n			subject=assetRenderer.getTitle(locale)\n			userId=assetRenderer.getUserId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getEditIcon>\n	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>\n		<#assign editPageURL = renderResponse.createRenderURL() />\n\n		${editPageURL.setParameter(\"struts_action\", \"/wiki/edit_page\")}\n		${editPageURL.setParameter(\"redirect\", currentURL)}\n		${editPageURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n		${editPageURL.setParameter(\"title\", entry.getTitle())}\n\n		<@liferay_ui[\"icon\"]\n			image=\"edit\"\n			message=entry.getTitle()\n			url=editPageURL?string\n		/>\n	</#if>\n</#macro>\n\n<#macro getPageDetailsIcon>\n	<#assign viewPageDetailsURL = renderResponse.createRenderURL() />\n\n	${viewPageDetailsURL.setParameter(\"struts_action\", \"/wiki/view_page_details\")}\n	${viewPageDetailsURL.setParameter(\"redirect\", currentURL)}\n\n	<@liferay_ui[\"icon\"]\n		image=\"history\"\n		message=\"details\"\n		url=viewPageDetailsURL?string\n	/>\n</#macro>\n\n<#macro getPrintIcon>\n	<#assign printURL = renderResponse.createRenderURL() />\n\n	${printURL.setParameter(\"viewMode\", \"print\")}\n	${printURL.setWindowState(\"pop_up\")}\n\n	<#assign title = languageUtil.format(locale, \"print-x-x\", [\"hide-accessible\", htmlUtil.escape(assetRenderer.getTitle(locale))]) />\n	<#assign taglibPrintURL = \"javascript:Liferay.Util.openWindow({dialog: {width: 960}, id:\'\" + renderResponse.getNamespace() + \"printAsset\', title: \'\" + title + \"\', uri: \'\" + htmlUtil.escapeURL(printURL.toString()) + \"\'});\" />\n\n	<@liferay_ui[\"icon\"]\n		image=\"print\"\n		message=\"print\"\n		url=taglibPrintURL\n	/>\n</#macro>\n\n<#macro getRatings\n	cssClass\n	entry\n>\n	<#if enablePageRatings == \"true\">\n		<div class=\"${cssClass}\">\n			<@liferay_ui[\"ratings\"]\n				className=wikiPageClassName\n				classPK=entry.getResourcePrimKey()\n			/>\n		</div>\n	</#if>\n</#macro>\n\n<#macro getRelatedAssets>\n	<#if assetEntry?? && (enableRelatedAssets == \"true\")>\n		<@liferay_ui[\"asset-links\"]\n			assetEntryId=assetEntry.getEntryId()\n		/>\n	</#if>\n</#macro>',0,0,10420,''),('1e035435-11e0-42ba-b7fd-e0e1099520e0',10421,10195,10155,10159,'','2016-03-15 19:16:48','2016-03-15 19:16:48',10081,0,'ASSET-CATEGORIES-NAVIGATION-MULTI-COLUMN-LAYOUT-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Multi Column Layout</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays a column for each vocabulary. Each column includes the name of a vocabulary with the vocabulary\'s top level categories listed underneath.</Description></root>','display','','ftl','<#assign aui = taglibLiferayHash[\"/WEB-INF/tld/aui.tld\"] />\n\n<#if entries?has_content>\n	<@aui.layout>\n		<#list entries as entry>\n			<@aui.column columnWidth=25>\n				<div class=\"results-header\">\n					<h3>\n						${entry.getName()}\n					</h3>\n				</div>\n\n				<#assign categories = entry.getCategories()>\n\n				<@displayCategories categories=categories />\n			</@aui.column>\n		</#list>\n	</@aui.layout>\n</#if>\n\n<#macro displayCategories\n	categories\n>\n	<#if categories?has_content>\n		<ul class=\"categories\">\n			<#list categories as category>\n				<li>\n					<#assign categoryURL = renderResponse.createRenderURL()>\n\n					${categoryURL.setParameter(\"resetCur\", \"true\")}\n					${categoryURL.setParameter(\"categoryId\", category.getCategoryId()?string)}\n\n					<a href=\"${categoryURL}\">${category.getName()}</a>\n\n					<#if serviceLocator??>\n						<#assign assetCategoryService = serviceLocator.findService(\"com.liferay.portlet.asset.service.AssetCategoryService\")>\n\n						<#assign childCategories = assetCategoryService.getChildCategories(category.getCategoryId())>\n\n						<@displayCategories categories=childCategories />\n					</#if>\n				</li>\n			</#list>\n		</ul>\n	</#if>\n</#macro>',0,0,10422,''),('7928491e-8562-4352-b149-2b9946a406f1',10424,10195,10155,10159,'','2016-03-15 19:16:48','2016-03-15 19:16:48',10423,0,'DOCUMENTLIBRARY-CAROUSEL-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays images in a carousel.</Description></root>','display','','ftl','<#assign aui = taglibLiferayHash[\"/WEB-INF/tld/aui.tld\"] />\n<#assign liferay_portlet = taglibLiferayHash[\"/WEB-INF/tld/liferay-portlet.tld\"] />\n\n<#if entries?has_content>\n	<style>\n		#<@liferay_portlet.namespace />carousel .carousel-item {\n			background-color: #000;\n			height: 250px;\n			overflow: hidden;\n			text-align: center;\n			width: 700px;\n		}\n\n		#<@liferay_portlet.namespace />carousel .carousel-item img {\n			max-height: 250px;\n			max-width: 700px;\n		}\n	</style>\n\n	<div id=\"<@liferay_portlet.namespace />carousel\">\n		<#assign imageMimeTypes = propsUtil.getArray(\"dl.file.entry.preview.image.mime.types\") />\n\n		<#list entries as entry>\n			<#if imageMimeTypes?seq_contains(entry.getMimeType()) >\n				<div class=\"carousel-item\">\n					<img src=\"${dlUtil.getPreviewURL(entry, entry.getFileVersion(), themeDisplay, \"\")}\" />\n				</div>\n			</#if>\n		</#list>\n	</div>\n\n	<@aui.script use=\"aui-carousel\">\n		new A.Carousel(\n			{\n				contentBox: \'#<@liferay_portlet.namespace />carousel\',\n				height: 250,\n				intervalTime: 2,\n				width: 700\n			}\n		).render();\n	</@aui.script>\n</#if>',0,0,10425,''),('784580bb-24b1-4abe-aa2d-b36013212b4b',10426,10195,10155,10159,'','2016-03-15 19:16:48','2016-03-15 19:16:48',10083,0,'ASSET-PUBLISHER-RICH-SUMMARY-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Rich Summary</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays abstracts, icons, related assets, and print/edit actions for assets. Optionally include asset bookmarks and ratings.</Description></root>','display','','ftl','<#assign liferay_ui = taglibLiferayHash[\"/WEB-INF/tld/liferay-ui.tld\"] />\n\n<#list entries as entry>\n	<#assign entry = entry />\n\n	<#assign assetRenderer = entry.getAssetRenderer() />\n\n	<#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />\n\n	<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />\n\n	<#if assetLinkBehavior != \"showFullContent\">\n		<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />\n	</#if>\n\n	<div class=\"asset-abstract\">\n		<div class=\"lfr-meta-actions asset-actions\">\n			<@getPrintIcon />\n\n			<@getFlagsIcon />\n\n			<@getEditIcon />\n		</div>\n\n		<h3 class=\"asset-title\">\n			<a href=\"${viewURL}\"><img alt=\"\" src=\"${assetRenderer.getIconPath(renderRequest)}\" />${entryTitle}</a>\n		</h3>\n\n		<@getMetadataField fieldName=\"tags\" />\n\n		<@getMetadataField fieldName=\"create-date\" />\n\n		<@getMetadataField fieldName=\"view-count\" />\n\n		<div class=\"asset-content\">\n			<@getSocialBookmarks />\n\n			<div class=\"asset-summary\">\n				<@getMetadataField fieldName=\"author\" />\n\n				${htmlUtil.escape(assetRenderer.getSummary(locale))}\n\n				<a href=\"${viewURL}\"><@liferay.language key=\"read-more\" /><span class=\"hide-accessible\"><@liferay.language key=\"about\" />${entryTitle}</span> &raquo;</a>\n			</div>\n\n			<@getRatings />\n\n			<@getRelatedAssets />\n\n			<@getDiscussion />\n		</div>\n	</div>\n\n</#list>\n\n<#macro getDiscussion>\n	<#if validator.isNotNull(assetRenderer.getDiscussionPath()) && (enableComments == \"true\")>\n		<br />\n\n		<#assign discussionURL = renderResponse.createActionURL() />\n\n		${discussionURL.setParameter(\"struts_action\", \"/asset_publisher/\" + assetRenderer.getDiscussionPath())}\n\n		<@liferay_ui[\"discussion\"]\n			className=entry.getClassName()\n			classPK=entry.getClassPK()\n			formAction=discussionURL?string\n			formName=\"fm\" + entry.getClassPK()\n			ratingsEnabled=enableCommentRatings == \"true\"\n			redirect=portalUtil.getCurrentURL(request)\n			userId=assetRenderer.getUserId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getEditIcon>\n	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>\n		<#assign redirectURL = renderResponse.createRenderURL() />\n\n		${redirectURL.setParameter(\"struts_action\", \"/asset_publisher/add_asset_redirect\")}\n		${redirectURL.setWindowState(\"pop_up\")}\n\n		<#assign editPortletURL = assetRenderer.getURLEdit(renderRequest, renderResponse, windowStateFactory.getWindowState(\"pop_up\"), redirectURL)!\"\" />\n\n		<#if validator.isNotNull(editPortletURL)>\n			<#assign title = languageUtil.format(locale, \"edit-x\", entryTitle) />\n\n			<@liferay_ui[\"icon\"]\n				image=\"edit\"\n				message=title\n				url=\"javascript:Liferay.Util.openWindow({dialog: {width: 960}, id:\'\" + renderResponse.getNamespace() + \"editAsset\', title: \'\" + title + \"\', uri:\'\" + htmlUtil.escapeURL(editPortletURL.toString()) + \"\'});\"\n			/>\n		</#if>\n	</#if>\n</#macro>\n\n<#macro getFlagsIcon>\n	<#if enableFlags == \"true\">\n		<@liferay_ui[\"flags\"]\n			className=entry.getClassName()\n			classPK=entry.getClassPK()\n			contentTitle=entry.getTitle(locale)\n			label=false\n			reportedUserId=entry.getUserId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getMetadataField\n	fieldName\n>\n	<#if stringUtil.split(metadataFields)?seq_contains(fieldName)>\n		<span class=\"metadata-entry metadata-\"${fieldName}\">\n			<#assign dateFormat = \"dd MMM yyyy - HH:mm:ss\" />\n\n			<#if fieldName == \"author\">\n				<@liferay.language key=\"by\" /> ${portalUtil.getUserName(assetRenderer.getUserId(), assetRenderer.getUserName())}\n			<#elseif fieldName == \"categories\">\n				<@liferay_ui[\"asset-categories-summary\"]\n					className=entry.getClassName()\n					classPK=entry.getClassPK()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			<#elseif fieldName == \"create-date\">\n				${dateUtil.getDate(entry.getCreateDate(), dateFormat, locale)}\n			<#elseif fieldName == \"expiration-date\">\n				${dateUtil.getDate(entry.getExpirationDate(), dateFormat, locale)}\n			<#elseif fieldName == \"modified-date\">\n				${dateUtil.getDate(entry.getModifiedDate(), dateFormat, locale)}\n			<#elseif fieldName == \"priority\">\n				${entry.getPriority()}\n			<#elseif fieldName == \"publish-date\">\n				${dateUtil.getDate(entry.getPublishDate(), dateFormat, locale)}\n			<#elseif fieldName == \"tags\">\n				<@liferay_ui[\"asset-tags-summary\"]\n					className=entry.getClassName()\n					classPK=entry.getClassPK()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			<#elseif fieldName == \"view-count\">\n				<@liferay_ui[\"icon\"]\n					image=\"history\"\n				/>\n\n				${entry.getViewCount()} <@liferay.language key=\"views\" />\n			</#if>\n		</span>\n	</#if>\n</#macro>\n\n<#macro getPrintIcon>\n	<#if enablePrint == \"true\" >\n		<#assign printURL = renderResponse.createRenderURL() />\n\n		${printURL.setParameter(\"struts_action\", \"/asset_publisher/view_content\")}\n		${printURL.setParameter(\"assetEntryId\", entry.getEntryId()?string)}\n		${printURL.setParameter(\"viewMode\", \"print\")}\n		${printURL.setParameter(\"type\", entry.getAssetRendererFactory().getType())}\n\n		<#if (validator.isNotNull(assetRenderer.getUrlTitle()))>\n			<#if (assetRenderer.getGroupId() != themeDisplay.getScopeGroupId())>\n				${printURL.setParameter(\"groupId\", assetRenderer.getGroupId()?string)}\n			</#if>\n\n			${printURL.setParameter(\"urlTitle\", assetRenderer.getUrlTitle())}\n		</#if>\n\n		${printURL.setWindowState(\"pop_up\")}\n\n		<@liferay_ui[\"icon\"]\n			image=\"print\"\n			message=\"print\"\n			url=\"javascript:Liferay.Util.openWindow({id:\'\" + renderResponse.getNamespace() + \"printAsset\', title: \'\" + languageUtil.format(locale, \"print-x-x\", [\"hide-accessible\", entryTitle]) + \"\', uri: \'\" + htmlUtil.escapeURL(printURL.toString()) + \"\'});\"\n		/>\n	</#if>\n</#macro>\n\n<#macro getRatings>\n	<#if (enableRatings == \"true\")>\n		<div class=\"asset-ratings\">\n			<@liferay_ui[\"ratings\"]\n				className=entry.getClassName()\n				classPK=entry.getClassPK()\n			/>\n		</div>\n	</#if>\n</#macro>\n\n<#macro getRelatedAssets>\n	<#if enableRelatedAssets == \"true\">\n		<@liferay_ui[\"asset-links\"]\n			assetEntryId=entry.getEntryId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getSocialBookmarks>\n	<#if enableSocialBookmarks == \"true\">\n		<@liferay_ui[\"social-bookmarks\"]\n			displayStyle=\"${socialBookmarksDisplayStyle}\"\n			target=\"_blank\"\n			title=entry.getTitle(locale)\n			url=viewURL\n		/>\n	</#if>\n</#macro>',0,0,10427,''),('1a26badf-0332-4c58-a15e-ebdde2236c37',10428,10195,10155,10159,'','2016-03-15 19:16:48','2016-03-15 19:16:48',10034,0,'SITE-MAP-MULTI-COLUMN-LAYOUT-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Multi Column Layout</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays a column for each top level page. Each column includes the name of a top level page with the page\'s immediate children listed underneath.</Description></root>','display','','ftl','<#assign aui = taglibLiferayHash[\"/WEB-INF/tld/aui.tld\"] />\n\n<#if entries?has_content>\n	<@aui.layout>\n		<#list entries as entry>\n		    <@aui.column columnWidth=25>\n				<div class=\"results-header\">\n					<h3>\n						<#assign layoutURL = portalUtil.getLayoutURL(entry, themeDisplay)>\n\n						<a href=\"${layoutURL}\">${entry.getName(locale)}</a>\n					</h3>\n				</div>\n\n				<#assign pages = entry.getChildren()>\n\n				<@displayPages pages = pages />\n		    </@aui.column>\n		</#list>\n	</@aui.layout>\n</#if>\n\n<#macro displayPages\n	pages\n>\n	<#if pages?has_content>\n		<ul class=\"child-pages\">\n			<#list pages as page>\n				<li>\n					<#assign pageLayoutURL = portalUtil.getLayoutURL(page, themeDisplay)>\n\n					<a href=\"${pageLayoutURL}\">${page.getName(locale)}</a>\n\n					<#assign childPages = page.getChildren()>\n\n					<@displayPages pages = childPages />\n				</li>\n			</#list>\n		</ul>\n	</#if>\n</#macro>',0,0,10429,''),('3d3482d0-2ff2-4eef-a333-6b802e950b9d',10430,10195,10155,10159,'','2016-03-15 19:16:48','2016-03-15 19:16:48',10085,0,'ASSET-TAGS-NAVIGATION-COLOR-BY-POPULARITY-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Color by Popularity</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays asset tags colored by popularity: red (high), yellow (medium), and green (low).</Description></root>','display','','ftl','<#if entries?has_content>\n	<ul class=\"tag-items tag-list\">\n		<#assign scopeGroupId = getterUtil.getLong(scopeGroupId, themeDisplay.getScopeGroupId()) />\n		<#assign classNameId = getterUtil.getLong(classNameId, 0) />\n\n		<#assign maxCount = 1 />\n		<#assign minCount = 1 />\n\n		<#list entries as entry>\n			<#assign maxCount = liferay.max(maxCount, entry.getAssetCount()) />\n			<#assign minCount = liferay.min(minCount, entry.getAssetCount()) />\n		</#list>\n\n		<#assign multiplier = 1 />\n\n		<#if maxCount != minCount>\n			<#assign multiplier = 3 / (maxCount - minCount) />\n		</#if>\n\n		<#list entries as entry>\n			<li class=\"taglib-asset-tags-summary\">\n				<#assign popularity = (maxCount - (maxCount - (entry.getAssetCount() - minCount))) * multiplier />\n\n				<#if popularity < 1>\n					<#assign color = \"green\" />\n				<#elseif (popularity >= 1) && (popularity < 2)>\n					<#assign color = \"orange\" />\n				<#else>\n					<#assign color = \"red\" />\n				</#if>\n\n				<#assign tagURL = renderResponse.createRenderURL() />\n\n				${tagURL.setParameter(\"resetCur\", \"true\")}\n				${tagURL.setParameter(\"tag\", entry.getName())}\n\n				<a class =\"tag\" style=\"color: ${color};\" href=\"${tagURL}\">\n					${entry.getName()}\n\n					<#if (showAssetCount == \"true\")>\n						<span class=\"tag-asset-count\">(${count})</span>\n					</#if>\n				</a>\n			</li>\n		</#list>\n	</ul>\n\n	<br style=\"clear: both;\" />\n</#if>',0,0,10431,''),('7639cc50-de51-4959-81e3-1ba832d75a15',10432,10195,10155,10159,'','2016-03-15 19:16:48','2016-03-15 19:16:48',10007,0,'BLOGS-BASIC-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Basic</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays titles, authors, and abstracts compactly for blog entries.</Description></root>','display','','ftl','<#assign liferay_ui = taglibLiferayHash[\"/WEB-INF/tld/liferay-ui.tld\"] />\n\n<#list entries as entry>\n	<div class=\"entry\">\n		<#assign viewURL = renderResponse.createRenderURL() />\n\n		${viewURL.setParameter(\"struts_action\", \"/blogs/view_entry\")}\n		${viewURL.setParameter(\"redirect\", currentURL)}\n		${viewURL.setParameter(\"urlTitle\", entry.getUrlTitle())}\n\n		<div class=\"entry-content\">\n			<div class=\"entry-title\">\n				<h2><a href=\"${viewURL}\">${htmlUtil.escape(entry.getTitle())}</a></h2>\n			</div>\n		</div>\n\n		<div class=\"entry-body\">\n			<div class=\"entry-author\">\n				<@liferay.language key=\"written-by\" /> ${htmlUtil.escape(portalUtil.getUserName(entry.getUserId(), entry.getUserName()))}\n			</div>\n\n			<#assign summary = entry.getDescription() />\n\n			<#if (validator.isNull(summary))>\n				<#assign summary = entry.getContent() />\n			</#if>\n\n			${stringUtil.shorten(htmlUtil.stripHtml(summary), 100)}\n\n			<a href=\"${viewURL}\"><@liferay.language key=\"read-more\" /> <span class=\"hide-accessible\"><@liferay.language key=\"about\"/>${htmlUtil.escape(entry.getTitle())}</span> &raquo;</a>\n		</div>\n\n		<div class=\"entry-footer\">\n			<span class=\"entry-date\">\n				${dateUtil.getDate(entry.getCreateDate(), \"dd MMM yyyy - HH:mm:ss\", locale)}\n			</span>\n\n			<#assign blogsEntryClassName = \"com.liferay.portlet.blogs.model.BlogsEntry\" />\n\n			<#if (enableFlags == \"true\")>\n				<@liferay_ui[\"flags\"]\n					className=blogsEntryClassName\n					classPK=entry.getEntryId()\n					contentTitle=entry.getTitle()\n					reportedUserId=entry.getUserId()\n				/>\n			</#if>\n\n			<span class=\"entry-categories\">\n				<@liferay_ui[\"asset-categories-summary\"]\n					className=blogsEntryClassName\n					classPK=entry.getEntryId()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			</span>\n\n			<span class=\"entry-tags\">\n				<@liferay_ui[\"asset-tags-summary\"]\n					className=blogsEntryClassName\n					classPK=entry.getEntryId()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			</span>\n		</div>\n	</div>\n\n	<div class=\"separator\"><!-- --></div>\n</#list>',0,0,10433,''),('b8f953fb-151f-458f-a514-a6343e4df3b3',10595,10182,10155,10159,'','2016-03-15 19:18:23','2015-07-17 19:16:45',10102,10594,'BASIC-WEB-CONTENT-6.2.2.1','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Basic Web Content - 6.2.2.1</Name></root>','','display','','vm','${content.getData()}',0,0,10596,''),('69002022-6265-4c40-9411-e78d8903b199',11160,11148,10155,10159,'','2016-03-15 21:10:38','2016-03-15 21:10:38',10102,11159,'CAROUSEL-1.0-SNAPSHOT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel - 1.0-SNAPSHOT</Name></root>','','display','','vm','#set ($article_id = $reserved-article-id.getData())\n#set ($content_id = \"carousel-${article_id}\")\n\n<style>\n	.carousel-container .carousel-item {\n		height: 100%;\n		width: 100%;\n	}\n\n	#${content_id} {\n		height: ${height.data}px;\n	}\n</style>\n\n<div class=\"carousel-container\" id=\"$content_id\">\n	<div class=\"carousel\">\n		#foreach ($item in $carousel-item.siblings)\n			#set ($carousel_item_class = \"carousel-item\")\n\n			#if ($velocityCount == 1)\n				#set ($carousel_item_class = \"$carousel_item_class carousel-item-active\")\n			#end\n\n			#if ($item.url-location.friendlyUrl)\n				<a class=\"$carousel_item_class\" href=\"$item.url-location.friendlyUrl\">\n			#end\n\n			<div class=\"$carousel_item_class\" style=\"background-image: url(${item.image.data});\">\n				#if ($item.tagline.data != \"\")\n					<span class=\"tagline\">\n						<h2>$item.data</h2>\n						$item.tagline.data\n					</span>\n				#end\n			</div>\n\n			#if ($item.url-location.friendlyUrl)\n				</a>\n			#end\n		#end\n	</div>\n</div>\n\n<script type=\"text/javascript\">\n	AUI().ready(\n		\'aui-carousel\',\n		function(A) {\n			new A.Carousel(\n				{\n					contentBox: \'#${content_id} .carousel\',\n					height: $height.data,\n					intervalTime: $duration.data,\n					height: \'100%\',\n					width: \'100%\'\n				}\n			).render();\n		}\n	);\n</script>',0,0,11161,'');

/*Table structure for table `dlcontent` */

DROP TABLE IF EXISTS `dlcontent`;

CREATE TABLE `dlcontent` (
  `contentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `path_` varchar(255) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `data_` longblob,
  `size_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`contentId`),
  UNIQUE KEY `IX_FDD1AAA8` (`companyId`,`repositoryId`,`path_`,`version`),
  KEY `IX_6A83A66A` (`companyId`,`repositoryId`),
  KEY `IX_EB531760` (`companyId`,`repositoryId`,`path_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlcontent` */

/*Table structure for table `dlfileentry` */

DROP TABLE IF EXISTS `dlfileentry`;

CREATE TABLE `dlfileentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileEntryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(255) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `extraSettings` longtext,
  `fileEntryTypeId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `readCount` int(11) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `largeImageId` bigint(20) DEFAULT NULL,
  `custom1ImageId` bigint(20) DEFAULT NULL,
  `custom2ImageId` bigint(20) DEFAULT NULL,
  `manualCheckInRequired` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`fileEntryId`),
  UNIQUE KEY `IX_5391712` (`groupId`,`folderId`,`name`),
  UNIQUE KEY `IX_ED5CA615` (`groupId`,`folderId`,`title`),
  UNIQUE KEY `IX_BC2E7E6A` (`uuid_`,`groupId`),
  KEY `IX_4CB1B2B4` (`companyId`),
  KEY `IX_772ECDE7` (`fileEntryTypeId`),
  KEY `IX_8F6C75D0` (`folderId`,`name`),
  KEY `IX_F4AF5636` (`groupId`),
  KEY `IX_93CF8193` (`groupId`,`folderId`),
  KEY `IX_29D0AF28` (`groupId`,`folderId`,`fileEntryTypeId`),
  KEY `IX_43261870` (`groupId`,`userId`),
  KEY `IX_D20C434D` (`groupId`,`userId`,`folderId`),
  KEY `IX_D9492CF6` (`mimeType`),
  KEY `IX_64F0FE40` (`uuid_`),
  KEY `IX_31079DE8` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlfileentry` */

insert  into `dlfileentry`(`uuid_`,`fileEntryId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`repositoryId`,`folderId`,`treePath`,`name`,`extension`,`mimeType`,`title`,`description`,`extraSettings`,`fileEntryTypeId`,`version`,`size_`,`readCount`,`smallImageId`,`largeImageId`,`custom1ImageId`,`custom2ImageId`,`manualCheckInRequired`) values ('83d7c5c3-2105-401e-ad48-fe23dc42e474',10526,10182,10155,10159,'','2016-03-15 19:18:20','2016-03-15 19:18:20',0,0,10182,0,'/0/','1','png','image/png','welcome_tools','','',0,'1.0',528,2,0,0,0,0,0),('49654d32-5414-4a3c-8704-a071853a5106',10535,10182,10155,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',0,0,10182,0,'/0/','2','png','image/png','welcome_learn','','',0,'1.0',565,2,0,0,0,0,0),('deb8b437-3868-46db-a037-ed1392b35a18',10545,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',0,0,10182,0,'/0/','3','png','image/png','welcome_cube','','',0,'1.0',452,2,0,0,0,0,0),('729f117f-5c83-4fbf-853f-a36459a3b20d',10554,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',0,0,10182,0,'/0/','4','pdf','application/pdf','helpful_links_for_using_liferay_portal','','',0,'1.0',148065,0,0,0,0,0,0),('808048bd-865f-4076-8681-1f88c6b8b520',10566,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',0,0,10182,0,'/0/','5','png','image/png','welcome_ee','','',0,'1.0',218,2,0,0,0,0,0),('8bf62a24-50c9-421b-b069-891f5d14df21',10576,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',0,0,10182,0,'/0/','6','png','image/png','welcome_community','','',0,'1.0',435,2,0,0,0,0,0),('3a9cebce-3496-43d5-a9b6-1be9900dd416',10677,10182,10155,10199,'Test Test','2016-03-15 20:50:46','2016-03-15 20:50:46',10021,10673,10674,10676,'/10675/10676/','8','lar','application/zip','20160315205046603GNUERLEH.lar','','',0,'1.0',941190,1,0,0,0,0,0),('f0f9261c-f936-4d55-8bd7-c439181af63b',10765,10182,10155,10199,'Test Test','2015-10-22 19:29:07','2015-10-22 19:29:07',0,0,10182,10721,'/10717/10721/','9','txt','text/plain','faq_page (1).txt','faq_page (1).txt','',0,'1.0',85,0,0,0,0,0,0),('2f1c5ccf-9a97-4064-9582-95f72f57800b',10774,10182,10155,10199,'Test Test','2015-10-22 19:58:55','2015-10-22 19:58:55',0,0,10182,10725,'/10717/10725/','10','txt','text/plain','faq_page.txt','faq_page.txt','',0,'1.0',85,0,0,0,0,0,0),('59eba706-a80e-4067-a8b9-37a83f24aa3a',10783,10182,10155,10199,'Test Test','2015-11-02 17:54:21','2015-11-02 17:54:21',0,0,10182,10729,'/10717/10729/','11','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','',0,'1.0',57939,0,0,0,0,0,0),('8f61a626-4e3b-4e06-ae6e-b16475d819c9',10792,10182,10155,10199,'Test Test','2015-11-02 18:08:28','2015-11-02 18:08:28',0,0,10182,10733,'/10717/10733/','12','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','',0,'1.0',57939,0,0,0,0,0,0),('7c49521f-b4af-4ee4-a8c7-0f715212f9c0',10801,10182,10155,10199,'Test Test','2015-11-02 18:17:34','2015-11-02 18:17:34',0,0,10182,10737,'/10717/10737/','13','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','',0,'1.0',57939,0,0,0,0,0,0),('4f099e3d-4255-4f58-83e4-a8daa0c33afc',10810,10182,10155,10199,'Test Test','2015-11-02 18:50:15','2015-11-02 18:50:15',0,0,10182,10741,'/10717/10741/','14','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','',0,'1.0',57939,0,0,0,0,0,0),('4976b1d8-0731-4404-9ce1-5ec520a71252',10819,10182,10155,10199,'Test Test','2015-12-27 17:31:40','2015-12-27 17:31:40',0,0,10182,10745,'/10713/10745/','15','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','',0,'1.0',8609,0,0,0,0,0,0),('1aa05a74-a0f8-4801-b3c1-967d3cb7c99d',10828,10182,10155,10199,'Test Test','2015-12-27 17:41:25','2015-12-27 17:41:25',0,0,10182,10749,'/10713/10749/','16','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','',0,'1.0',8609,0,0,0,0,0,0),('372ebab2-d19d-4ecd-890b-524d47e80668',10837,10182,10155,10199,'Test Test','2015-12-27 17:57:05','2015-12-27 17:57:05',0,0,10182,10753,'/10713/10753/','17','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','',0,'1.0',8609,0,0,0,0,0,0),('026b9efb-b044-456c-b3b9-129746e700d6',10846,10182,10155,10199,'Test Test','2015-12-27 20:22:37','2015-12-27 20:22:37',0,0,10182,10757,'/10713/10757/','18','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','',0,'1.0',8670,0,0,0,0,0,0),('0d4ec121-4f11-4cba-94cb-7dfaf9e1a4f9',10855,10182,10155,10199,'Test Test','2015-12-27 20:35:39','2015-12-27 20:35:39',0,0,10182,10761,'/10713/10761/','19','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','',0,'1.0',8670,0,0,0,0,0,0),('637e3435-240f-493b-9aa0-691dc37d4a60',10958,10182,10155,10199,'Test Test','2016-03-15 20:55:01','2016-03-15 20:55:01',10021,10956,10674,10957,'/10675/10957/','22','lar','application/zip','20160315205501829URCUEJRI.lar','','',0,'1.0',958249,1,0,0,0,0,0),('23b2ce63-aba4-4e4e-8531-ddd9a7240c73',11016,10182,10155,10199,'Test Test','2016-03-15 20:59:19','2016-03-15 20:59:19',10021,11014,10674,11015,'/10675/11015/','27','lar','application/zip','20160315205919135ZNNSMSTF.lar','','',0,'1.0',25494,1,0,0,0,0,0),('71d30f61-27e4-4731-8718-714fd8221ae8',11608,10182,10155,10199,'Whitehall Admin','2016-03-17 19:35:47','2016-03-17 19:35:47',10021,11606,10674,11607,'/10675/11607/','102','lar','application/zip','20160317193546930WPCJZTHQ.lar','','',0,'1.0',16993,1,0,0,0,0,0),('8227778b-3586-4a9e-97c9-0ee9b44e5a96',11806,10182,10155,10199,'Whitehall Admin','2016-03-19 19:16:30','2016-03-19 19:16:30',10021,11804,10674,11805,'/10675/11805/','202','lar','application/zip','20160319191629726LPGJTHWD.lar','','',0,'1.0',16993,1,0,0,0,0,0),('1ec7e94c-d063-4e35-9c77-8c79709936f1',11829,10182,10155,10199,'Whitehall Admin','2016-03-19 20:21:29','2016-03-19 20:21:29',0,0,10182,11825,'/10713/11825/','203','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','',0,'1.0',8669,0,0,0,0,0,0),('a8ed9566-73e3-4fc3-aedd-661eb28641ba',12158,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:50','2016-03-21 21:13:50',10021,12156,10674,12157,'/10675/12157/','302','lar','application/zip','20160321211350511EMTMIJYU.lar','','',0,'1.0',40173,1,0,0,0,0,0);

/*Table structure for table `dlfileentrymetadata` */

DROP TABLE IF EXISTS `dlfileentrymetadata`;

CREATE TABLE `dlfileentrymetadata` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileEntryMetadataId` bigint(20) NOT NULL,
  `DDMStorageId` bigint(20) DEFAULT NULL,
  `DDMStructureId` bigint(20) DEFAULT NULL,
  `fileEntryTypeId` bigint(20) DEFAULT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `fileVersionId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`fileEntryMetadataId`),
  UNIQUE KEY `IX_7332B44F` (`DDMStructureId`,`fileVersionId`),
  KEY `IX_4F40FE5E` (`fileEntryId`),
  KEY `IX_A44636C9` (`fileEntryId`,`fileVersionId`),
  KEY `IX_F8E90438` (`fileEntryTypeId`),
  KEY `IX_1FE9C04` (`fileVersionId`),
  KEY `IX_D49AB5D1` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlfileentrymetadata` */

insert  into `dlfileentrymetadata`(`uuid_`,`fileEntryMetadataId`,`DDMStorageId`,`DDMStructureId`,`fileEntryTypeId`,`fileEntryId`,`fileVersionId`) values ('8f383198-9aea-470e-813d-1a6d9d1710bd',10556,10563,10316,0,10526,10527),('ba6d6eb9-b803-46a2-8202-ba271b5ea363',10581,10584,10316,0,10535,10536),('aa2e6164-f821-4d04-bfac-b954fefa886b',10589,10590,10316,0,10545,10546),('d6b412d5-139b-4834-b3cc-a6dacb61e293',10608,10609,10316,0,10554,10555),('f8c54ee4-394d-45d2-86cb-42bc2100b44f',10612,10613,10316,0,10566,10567),('078bf4f4-e94a-4387-8232-d2a9cf9ada1c',10616,10617,10316,0,10576,10577),('55503267-5b32-4384-91e0-1e97c78b7565',10875,10876,10316,0,10765,10766),('09500e97-1108-4861-b5b8-63f1e443eb60',10879,10880,10316,0,10774,10775),('ee87ce8f-ad0c-4282-bdd5-9db18d52e9ab',10883,10884,10316,0,10783,10784),('77f53009-ad01-4e84-9090-38d9bc7f9d87',10887,10888,10316,0,10792,10793),('bbd2d1fa-ec69-46f0-a290-35de8e0c401d',10891,10892,10316,0,10801,10802),('d802eff6-feee-4485-8ef1-59ed4dbd0fc0',10895,10896,10316,0,10810,10811),('75aa7686-4b7b-4a0e-9763-d1a22abe5bb4',10902,10903,10316,0,10819,10820),('21945981-4c08-4005-801b-a3837e0ffa61',10906,10907,10316,0,10828,10829),('e3fb8d04-1c5a-4141-99f3-47875fb3c7c8',10913,10914,10316,0,10837,10838),('645d6b4c-17ec-4a7b-8ca2-82084b32fda0',10919,10920,10316,0,10846,10847),('dbf5cb66-0e1b-401f-b0ea-bb24c00d36b7',10926,10927,10316,0,10855,10856),('d33ee7ed-12d2-4613-b9da-85752d093cde',11839,11840,10316,0,11829,11830);

/*Table structure for table `dlfileentrytype` */

DROP TABLE IF EXISTS `dlfileentrytype`;

CREATE TABLE `dlfileentrytype` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileEntryTypeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `fileEntryTypeKey` varchar(75) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  PRIMARY KEY (`fileEntryTypeId`),
  UNIQUE KEY `IX_5B6BEF5F` (`groupId`,`fileEntryTypeKey`),
  UNIQUE KEY `IX_1399D844` (`uuid_`,`groupId`),
  KEY `IX_4501FD9C` (`groupId`),
  KEY `IX_90724726` (`uuid_`),
  KEY `IX_5B03E942` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlfileentrytype` */

insert  into `dlfileentrytype`(`uuid_`,`fileEntryTypeId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`fileEntryTypeKey`,`name`,`description`) values ('61dbfa22-e7fe-4ba6-80e0-c03943a79fab',0,0,0,0,'','2016-03-15 19:16:03','2016-03-15 19:16:03','BASIC-DOCUMENT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">basic-document</Name></root>',''),('04e314fd-6284-4b8c-9789-5c2f8b87b442',10307,10195,10155,10159,'','2016-03-15 19:16:35','2016-03-15 19:16:35','CONTRACT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contract</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Contract</Description></root>'),('ec3eb506-8b69-41c4-bc7b-59f76d2c9952',10309,10195,10155,10159,'','2016-03-15 19:16:35','2016-03-15 19:16:35','MARKETING BANNER','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Marketing Banner</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Marketing Banner</Description></root>'),('246d9414-74bc-4c47-9ee7-7ce3f8d94a35',10311,10195,10155,10159,'','2016-03-15 19:16:35','2016-03-15 19:16:35','ONLINE TRAINING','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Online Training</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Online Training</Description></root>'),('4a15916f-15cf-4b07-9282-98768b96750b',10313,10195,10155,10159,'','2016-03-15 19:16:35','2016-03-15 19:16:35','SALES PRESENTATION','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Sales Presentation</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Sales Presentation</Description></root>');

/*Table structure for table `dlfileentrytypes_ddmstructures` */

DROP TABLE IF EXISTS `dlfileentrytypes_ddmstructures`;

CREATE TABLE `dlfileentrytypes_ddmstructures` (
  `structureId` bigint(20) NOT NULL,
  `fileEntryTypeId` bigint(20) NOT NULL,
  PRIMARY KEY (`structureId`,`fileEntryTypeId`),
  KEY `IX_8373EC7C` (`fileEntryTypeId`),
  KEY `IX_F147CF3F` (`structureId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlfileentrytypes_ddmstructures` */

insert  into `dlfileentrytypes_ddmstructures`(`structureId`,`fileEntryTypeId`) values (10308,10307),(10305,10309),(10310,10309),(10304,10311),(10312,10311),(10306,10313),(10314,10313);

/*Table structure for table `dlfileentrytypes_dlfolders` */

DROP TABLE IF EXISTS `dlfileentrytypes_dlfolders`;

CREATE TABLE `dlfileentrytypes_dlfolders` (
  `fileEntryTypeId` bigint(20) NOT NULL,
  `folderId` bigint(20) NOT NULL,
  PRIMARY KEY (`fileEntryTypeId`,`folderId`),
  KEY `IX_5BB6AD6C` (`fileEntryTypeId`),
  KEY `IX_6E00A2EC` (`folderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlfileentrytypes_dlfolders` */

/*Table structure for table `dlfilerank` */

DROP TABLE IF EXISTS `dlfilerank`;

CREATE TABLE `dlfilerank` (
  `fileRankId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`fileRankId`),
  UNIQUE KEY `IX_38F0315` (`companyId`,`userId`,`fileEntryId`),
  KEY `IX_A65A1F8B` (`fileEntryId`),
  KEY `IX_BAFB116E` (`groupId`,`userId`),
  KEY `IX_4E96195B` (`groupId`,`userId`,`active_`),
  KEY `IX_EED06670` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlfilerank` */

insert  into `dlfilerank`(`fileRankId`,`groupId`,`companyId`,`userId`,`createDate`,`fileEntryId`,`active_`) values (10652,10182,10155,10199,'2016-03-15 20:48:28',10545,1),(10653,10182,10155,10199,'2016-03-15 20:48:28',10535,1),(10654,10182,10155,10199,'2016-03-15 20:48:28',10576,1),(10655,10182,10155,10199,'2016-03-15 20:48:28',10566,1),(10656,10182,10155,10199,'2016-03-15 20:48:28',10526,1),(10683,10182,10155,10199,'2016-03-15 20:50:47',10677,1),(10963,10182,10155,10199,'2016-03-15 20:55:02',10958,1),(11021,10182,10155,10199,'2016-03-15 20:59:19',11016,1),(11613,10182,10155,10199,'2016-03-17 19:35:47',11608,1),(11811,10182,10155,10199,'2016-03-19 19:16:30',11806,1),(12163,10182,10155,10199,'2016-03-21 21:13:51',12158,1);

/*Table structure for table `dlfileshortcut` */

DROP TABLE IF EXISTS `dlfileshortcut`;

CREATE TABLE `dlfileshortcut` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileShortcutId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `toFileEntryId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`fileShortcutId`),
  UNIQUE KEY `IX_FDB4A946` (`uuid_`,`groupId`),
  KEY `IX_A4BB2E58` (`companyId`),
  KEY `IX_8571953E` (`companyId`,`status`),
  KEY `IX_B0051937` (`groupId`,`folderId`),
  KEY `IX_348DC3B2` (`groupId`,`folderId`,`active_`),
  KEY `IX_17EE3098` (`groupId`,`folderId`,`active_`,`status`),
  KEY `IX_4B7247F6` (`toFileEntryId`),
  KEY `IX_4831EBE4` (`uuid_`),
  KEY `IX_29AE81C4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlfileshortcut` */

/*Table structure for table `dlfileversion` */

DROP TABLE IF EXISTS `dlfileversion`;

CREATE TABLE `dlfileversion` (
  `uuid_` varchar(75) DEFAULT NULL,
  `fileVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `fileEntryId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `extension` varchar(75) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `changeLog` varchar(75) DEFAULT NULL,
  `extraSettings` longtext,
  `fileEntryTypeId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `checksum` varchar(75) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`fileVersionId`),
  UNIQUE KEY `IX_E2815081` (`fileEntryId`,`version`),
  UNIQUE KEY `IX_C99B2650` (`uuid_`,`groupId`),
  KEY `IX_F389330E` (`companyId`),
  KEY `IX_A0A283F4` (`companyId`,`status`),
  KEY `IX_C68DC967` (`fileEntryId`),
  KEY `IX_D47BB14D` (`fileEntryId`,`status`),
  KEY `IX_DFD809D3` (`groupId`,`folderId`,`status`),
  KEY `IX_9BE769ED` (`groupId`,`folderId`,`title`,`version`),
  KEY `IX_FFB3395C` (`mimeType`),
  KEY `IX_4BFABB9A` (`uuid_`),
  KEY `IX_95E9E44E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlfileversion` */

insert  into `dlfileversion`(`uuid_`,`fileVersionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`repositoryId`,`folderId`,`fileEntryId`,`treePath`,`extension`,`mimeType`,`title`,`description`,`changeLog`,`extraSettings`,`fileEntryTypeId`,`version`,`size_`,`checksum`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('6ce55efd-978e-4bed-8d46-fbaf9f5a060d',10527,10182,10155,10159,'','2016-03-15 19:18:20','2016-03-15 19:18:20',10182,0,10526,'/0/','png','image/png','welcome_tools','','','',0,'1.0',528,'',0,10159,'','2016-03-15 19:18:21'),('6127ac82-cd2d-4a4f-ad84-1cb8c4714bf4',10536,10182,10155,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',10182,0,10535,'/0/','png','image/png','welcome_learn','','','',0,'1.0',565,'',0,10159,'','2016-03-15 19:18:21'),('2331aea2-b65e-4891-85dc-ad26d7c44519',10546,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10182,0,10545,'/0/','png','image/png','welcome_cube','','','',0,'1.0',452,'',0,10159,'','2016-03-15 19:18:22'),('1079bbd5-eaff-4973-87d2-f23151ecf2fd',10555,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10182,0,10554,'/0/','pdf','application/pdf','helpful_links_for_using_liferay_portal','','','',0,'1.0',148065,'',0,10159,'','2016-03-15 19:18:22'),('9423c454-b8c5-4908-8da6-5f2bf7396e36',10567,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10182,0,10566,'/0/','png','image/png','welcome_ee','','','',0,'1.0',218,'',0,10159,'','2016-03-15 19:18:22'),('159a4c9f-111b-4e29-b307-7f421b295112',10577,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10182,0,10576,'/0/','png','image/png','welcome_community','','','',0,'1.0',435,'',0,10159,'','2016-03-15 19:18:22'),('6cef0353-c560-47d3-ad6d-34cb4e320fb1',10678,10182,10155,10199,'Test Test','2016-03-15 20:50:46','2016-03-15 20:50:46',10674,10676,10677,'/10675/10676/','lar','application/zip','20160315205046603GNUERLEH.lar','','','',0,'1.0',941190,'',0,10199,'Test Test','2016-03-15 20:50:46'),('1b952763-0e5c-4f6f-82c8-695327582d20',10766,10182,10155,10199,'Test Test','2015-10-22 19:29:07','2015-10-22 19:29:07',10182,10721,10765,'/10717/10721/','txt','text/plain','faq_page (1).txt','faq_page (1).txt','','',0,'1.0',85,'',0,10199,'Test Test','2016-03-15 20:50:49'),('2a3ad969-d63e-4ee1-af88-c3e953ce3e8c',10775,10182,10155,10199,'Test Test','2015-10-22 19:58:55','2015-10-22 19:58:55',10182,10725,10774,'/10717/10725/','txt','text/plain','faq_page.txt','faq_page.txt','','',0,'1.0',85,'',0,10199,'Test Test','2016-03-15 20:50:49'),('9921b1e2-2021-4572-8dd2-c6b4708ca3cd',10784,10182,10155,10199,'Test Test','2015-11-02 17:54:21','2015-11-02 17:54:21',10182,10729,10783,'/10717/10729/','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','','',0,'1.0',57939,'',0,10199,'Test Test','2016-03-15 20:50:49'),('1346fc08-ae7b-4bc9-bb48-67677ce84dfe',10793,10182,10155,10199,'Test Test','2015-11-02 18:08:28','2015-11-02 18:08:28',10182,10733,10792,'/10717/10733/','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','','',0,'1.0',57939,'',0,10199,'Test Test','2016-03-15 20:50:49'),('88b2b993-c509-464c-9a44-f71446d6117d',10802,10182,10155,10199,'Test Test','2015-11-02 18:17:34','2015-11-02 18:17:34',10182,10737,10801,'/10717/10737/','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','','',0,'1.0',57939,'',0,10199,'Test Test','2016-03-15 20:50:50'),('ee4c19e1-3b3f-43d2-aa71-24ead9617155',10811,10182,10155,10199,'Test Test','2015-11-02 18:50:15','2015-11-02 18:50:15',10182,10741,10810,'/10717/10741/','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','','',0,'1.0',57939,'',0,10199,'Test Test','2016-03-15 20:50:50'),('9b5ce668-653e-49ee-b64a-87b737a763f8',10820,10182,10155,10199,'Test Test','2015-12-27 17:31:40','2015-12-27 17:31:40',10182,10745,10819,'/10713/10745/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','','',0,'1.0',8609,'',0,10199,'Test Test','2016-03-15 20:50:50'),('b83e338b-ea2b-47d8-bb74-23d76c00d00b',10829,10182,10155,10199,'Test Test','2015-12-27 17:41:25','2015-12-27 17:41:25',10182,10749,10828,'/10713/10749/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','','',0,'1.0',8609,'',0,10199,'Test Test','2016-03-15 20:50:53'),('6a58300c-ce36-433c-848e-67f75c200132',10838,10182,10155,10199,'Test Test','2015-12-27 17:57:05','2015-12-27 17:57:05',10182,10753,10837,'/10713/10753/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','','',0,'1.0',8609,'',0,10199,'Test Test','2016-03-15 20:50:53'),('49c5703c-4d5a-45fa-95fb-cd767c1a9bcd',10847,10182,10155,10199,'Test Test','2015-12-27 20:22:37','2015-12-27 20:22:37',10182,10757,10846,'/10713/10757/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','','',0,'1.0',8670,'',0,10199,'Test Test','2016-03-15 20:50:53'),('d52b4a0a-fcc7-4e0f-804f-b6208250b8ff',10856,10182,10155,10199,'Test Test','2015-12-27 20:35:39','2015-12-27 20:35:39',10182,10761,10855,'/10713/10761/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','','',0,'1.0',8670,'',0,10199,'Test Test','2016-03-15 20:50:53'),('314855c0-501b-49db-899c-cc7e3056b8a4',10959,10182,10155,10199,'Test Test','2016-03-15 20:55:01','2016-03-15 20:55:01',10674,10957,10958,'/10675/10957/','lar','application/zip','20160315205501829URCUEJRI.lar','','','',0,'1.0',958249,'',0,10199,'Test Test','2016-03-15 20:55:01'),('36dee864-63a5-42e8-b09c-136745b277d0',11017,10182,10155,10199,'Test Test','2016-03-15 20:59:19','2016-03-15 20:59:19',10674,11015,11016,'/10675/11015/','lar','application/zip','20160315205919135ZNNSMSTF.lar','','','',0,'1.0',25494,'',0,10199,'Test Test','2016-03-15 20:59:19'),('44393e5f-4aa7-4e29-8277-cf8745140c27',11609,10182,10155,10199,'Whitehall Admin','2016-03-17 19:35:47','2016-03-17 19:35:47',10674,11607,11608,'/10675/11607/','lar','application/zip','20160317193546930WPCJZTHQ.lar','','','',0,'1.0',16993,'',0,10199,'Whitehall Admin','2016-03-17 19:35:47'),('5e22c1e8-6399-47eb-b859-4f62e87f406d',11807,10182,10155,10199,'Whitehall Admin','2016-03-19 19:16:30','2016-03-19 19:16:30',10674,11805,11806,'/10675/11805/','lar','application/zip','20160319191629726LPGJTHWD.lar','','','',0,'1.0',16993,'',0,10199,'Whitehall Admin','2016-03-19 19:16:30'),('8443abdd-d99e-4451-9749-ef5b75a5cc2d',11830,10182,10155,10199,'Whitehall Admin','2016-03-19 20:21:29','2016-03-19 20:21:29',10182,11825,11829,'/10713/11825/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','upload','',0,'1.0',8669,'',0,10199,'Whitehall Admin','2016-03-19 20:21:29'),('54809553-ba62-47a9-a9aa-17a1d4562ba4',12159,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:50','2016-03-21 21:13:50',10674,12157,12158,'/10675/12157/','lar','application/zip','20160321211350511EMTMIJYU.lar','','','',0,'1.0',40173,'',0,10199,'Whitehall Admin','2016-03-21 21:13:50');

/*Table structure for table `dlfolder` */

DROP TABLE IF EXISTS `dlfolder`;

CREATE TABLE `dlfolder` (
  `uuid_` varchar(75) DEFAULT NULL,
  `folderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `mountPoint` tinyint(4) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `lastPostDate` datetime DEFAULT NULL,
  `defaultFileEntryTypeId` bigint(20) DEFAULT NULL,
  `hidden_` tinyint(4) DEFAULT NULL,
  `overrideFileEntryTypes` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `IX_902FD874` (`groupId`,`parentFolderId`,`name`),
  UNIQUE KEY `IX_3CC1DED2` (`uuid_`,`groupId`),
  KEY `IX_A74DB14C` (`companyId`),
  KEY `IX_E79BE432` (`companyId`,`status`),
  KEY `IX_F2EA1ACE` (`groupId`),
  KEY `IX_F78286C5` (`groupId`,`mountPoint`,`parentFolderId`,`hidden_`),
  KEY `IX_C88430AB` (`groupId`,`mountPoint`,`parentFolderId`,`hidden_`,`status`),
  KEY `IX_49C37475` (`groupId`,`parentFolderId`),
  KEY `IX_CE360BF6` (`groupId`,`parentFolderId`,`hidden_`,`status`),
  KEY `IX_51556082` (`parentFolderId`,`name`),
  KEY `IX_EE29C715` (`repositoryId`),
  KEY `IX_CBC408D8` (`uuid_`),
  KEY `IX_DA448450` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlfolder` */

insert  into `dlfolder`(`uuid_`,`folderId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`repositoryId`,`mountPoint`,`parentFolderId`,`treePath`,`name`,`description`,`lastPostDate`,`defaultFileEntryTypeId`,`hidden_`,`overrideFileEntryTypes`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('0c83956f-1256-42cd-bb66-82cdebed7d65',10666,10182,10155,10159,'','2016-03-15 20:49:46','2016-03-15 20:49:46',10665,1,0,'/10666/','20','','2016-03-15 20:49:46',0,1,0,0,0,'',NULL),('8d88c39a-c802-4080-b54a-3ff9f54de284',10667,10182,10155,10199,'Test Test','2016-03-15 20:49:46','2016-03-15 20:49:46',10665,0,10666,'/10666/10667/','10199','','2016-03-15 20:59:01',0,0,0,0,0,'',NULL),('3c0ef99d-ab27-4a99-b90f-bb7cfb7974cb',10668,10182,10155,10199,'Test Test','2016-03-15 20:49:46','2016-03-15 20:49:46',10665,0,10667,'/10666/10667/10668/','com.liferay.portal.kernel.lar.ExportImportHelper','','2016-03-15 20:56:42',0,0,0,0,0,'',NULL),('a8554af5-e1c5-4118-98af-1802bd07cd36',10675,10182,10155,10159,'','2016-03-15 20:50:46','2016-03-15 20:50:46',10674,1,0,'/10675/','189','','2016-03-21 21:13:50',0,1,0,0,0,'',NULL),('052a0245-0295-4eb2-96c2-566d7d6e6ef3',10676,10182,10155,10199,'Test Test','2016-03-15 20:50:46','2016-03-15 20:50:46',10674,0,10675,'/10675/10676/','10673','','2016-03-15 20:50:46',0,0,0,0,0,'',NULL),('c2672da9-7afe-45a3-a442-1ec31cd56bdb',10713,10182,10155,10199,'Test Test','2015-08-29 14:06:00','2015-08-29 14:06:00',10182,0,0,'/10713/','Invoices','Invoices','2016-03-19 20:21:28',0,0,0,0,0,'',NULL),('0d2c49d1-6c21-4f8f-bfef-d284949fdcc7',10717,10182,10155,10199,'Test Test','2015-10-22 17:39:55','2015-10-22 17:39:55',10182,0,0,'/10717/','Insurance','Insurance','2016-03-15 20:50:48',0,0,0,0,0,'',NULL),('377dd1cc-4c75-4d30-8295-b987640ab475',10721,10182,10155,10199,'Test Test','2015-10-22 19:29:05','2015-10-22 19:29:05',10182,0,10717,'/10717/10721/','10','Trade Insurance Folder','2015-10-22 19:29:07',0,0,0,0,0,'',NULL),('cc8dbc70-da56-4c54-abd4-13ad1b7de62a',10725,10182,10155,10199,'Test Test','2015-10-22 19:58:55','2015-10-22 19:58:55',10182,0,10717,'/10717/10725/','11','Trade Insurance Folder','2015-10-22 19:58:55',0,0,0,0,0,'',NULL),('930f8558-2eb8-4b3d-867d-59a39753364a',10729,10182,10155,10199,'Test Test','2015-11-02 17:54:21','2015-11-02 17:54:21',10182,0,10717,'/10717/10729/','12','Trade Insurance Folder','2015-11-02 17:54:21',0,0,0,0,0,'',NULL),('4d377d4f-aac6-4698-88bb-e6fcb641ed77',10733,10182,10155,10199,'Test Test','2015-11-02 18:08:28','2015-11-02 18:08:28',10182,0,10717,'/10717/10733/','13','Trade Insurance Folder','2015-11-02 18:08:28',0,0,0,0,0,'',NULL),('e7088430-15e2-4c76-8cb4-e2384b8e145e',10737,10182,10155,10199,'Test Test','2015-11-02 18:17:34','2015-11-02 18:17:34',10182,0,10717,'/10717/10737/','14','Trade Insurance Folder','2015-11-02 18:17:34',0,0,0,0,0,'',NULL),('7e2440c2-ef73-45cc-ae3d-3465313ab952',10741,10182,10155,10199,'Test Test','2015-11-02 18:50:15','2015-11-02 18:50:15',10182,0,10717,'/10717/10741/','15','Trade Insurance Folder','2015-11-02 18:50:15',0,0,0,0,0,'',NULL),('fe61fea1-a8de-44e6-bbdb-0dc460b92a2a',10745,10182,10155,10199,'Test Test','2015-12-27 17:31:39','2015-12-27 17:31:39',10182,0,10713,'/10713/10745/','0','Invoices Document Folder','2015-12-27 17:31:40',0,0,0,0,0,'',NULL),('31aa124f-713c-4439-aab2-a765a20fe8b6',10749,10182,10155,10199,'Test Test','2015-12-27 17:41:25','2015-12-27 17:41:25',10182,0,10713,'/10713/10749/','1','Invoices Document Folder','2015-12-27 17:41:25',0,0,0,0,0,'',NULL),('e40620ff-83a9-4fd2-9c42-760bbb35b015',10753,10182,10155,10199,'Test Test','2015-12-27 17:57:04','2015-12-27 17:57:04',10182,0,10713,'/10713/10753/','2','Invoices Document Folder','2015-12-27 17:57:05',0,0,0,0,0,'',NULL),('832642d5-9261-4104-b28e-92ea383fc7a3',10757,10182,10155,10199,'Test Test','2015-12-27 20:22:37','2015-12-27 20:22:37',10182,0,10713,'/10713/10757/','3','Invoices Document Folder','2015-12-27 20:22:37',0,0,0,0,0,'',NULL),('9036ac98-7ebb-453f-b718-8b77e23b5167',10761,10182,10155,10199,'Test Test','2015-12-27 20:35:39','2015-12-27 20:35:39',10182,0,10713,'/10713/10761/','4','Invoices Document Folder','2015-12-27 20:35:39',0,0,0,0,0,'',NULL),('949d0644-c617-44f2-a38b-a6cf1db97260',10957,10182,10155,10199,'Test Test','2016-03-15 20:55:01','2016-03-15 20:55:01',10674,0,10675,'/10675/10957/','10956','','2016-03-15 20:55:01',0,0,0,0,0,'',NULL),('3b8e1733-b667-47da-a772-a7f8d1cd1d5b',11008,10182,10155,10199,'Test Test','2016-03-15 20:59:00','2016-03-15 20:59:00',10665,0,10667,'/10666/10667/11008/','com.liferay.portal.kernel.lar.ExportImportHelper86','','2016-03-15 20:59:00',0,0,0,0,0,'',NULL),('9189f814-7ab6-4fa1-8d63-4201620b53ad',11009,10182,10155,10199,'Test Test','2016-03-15 20:59:01','2016-03-15 20:59:01',10665,0,10667,'/10666/10667/11009/','com.liferay.portal.kernel.lar.ExportImportHelper15','','2016-03-21 21:13:37',0,0,0,0,0,'',NULL),('abcc5dcb-a5aa-4394-aa9f-51e6ea0e93bf',11015,10182,10155,10199,'Test Test','2016-03-15 20:59:19','2016-03-15 20:59:19',10674,0,10675,'/10675/11015/','11014','','2016-03-15 20:59:19',0,0,0,0,0,'',NULL),('6fa2836e-34bd-488e-a735-672b8f5e6391',11607,10182,10155,10199,'Whitehall Admin','2016-03-17 19:35:46','2016-03-17 19:35:46',10674,0,10675,'/10675/11607/','11606','','2016-03-17 19:35:47',0,0,0,0,0,'',NULL),('cd1c72e9-d326-46e6-9b6a-0b90a1596645',11805,10182,10155,10199,'Whitehall Admin','2016-03-19 19:16:29','2016-03-19 19:16:29',10674,0,10675,'/10675/11805/','11804','','2016-03-19 19:16:30',0,0,0,0,0,'',NULL),('dd4f97d9-e656-41e5-9acb-4787a6307801',11825,10182,10155,10199,'Whitehall Admin','2016-03-19 20:21:28','2016-03-19 20:21:28',10182,0,10713,'/10713/11825/','5','Invoices Document Folder','2016-03-19 20:21:29',0,0,0,0,0,'',NULL),('0d18a4eb-2dfb-44f9-bec2-ba6d94824e26',12157,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:50','2016-03-21 21:13:50',10674,0,10675,'/10675/12157/','12156','','2016-03-21 21:13:50',0,0,0,0,0,'',NULL);

/*Table structure for table `dlsyncevent` */

DROP TABLE IF EXISTS `dlsyncevent`;

CREATE TABLE `dlsyncevent` (
  `syncEventId` bigint(20) NOT NULL,
  `modifiedTime` bigint(20) DEFAULT NULL,
  `event` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `typePK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`syncEventId`),
  UNIQUE KEY `IX_57D82B06` (`typePK`),
  KEY `IX_3D8E1607` (`modifiedTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dlsyncevent` */

/*Table structure for table `emailaddress` */

DROP TABLE IF EXISTS `emailaddress`;

CREATE TABLE `emailaddress` (
  `uuid_` varchar(75) DEFAULT NULL,
  `emailAddressId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`emailAddressId`),
  KEY `IX_1BB072CA` (`companyId`),
  KEY `IX_49D2DEC4` (`companyId`,`classNameId`),
  KEY `IX_551A519F` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_2A2CB130` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_7B43CD8` (`userId`),
  KEY `IX_D24F3956` (`uuid_`),
  KEY `IX_F74AB912` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `emailaddress` */

/*Table structure for table `expandocolumn` */

DROP TABLE IF EXISTS `expandocolumn`;

CREATE TABLE `expandocolumn` (
  `columnId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `tableId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `defaultData` longtext,
  `typeSettings` longtext,
  PRIMARY KEY (`columnId`),
  UNIQUE KEY `IX_FEFC8DA7` (`tableId`,`name`),
  KEY `IX_A8C0CBE8` (`tableId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `expandocolumn` */

insert  into `expandocolumn`(`columnId`,`companyId`,`tableId`,`name`,`type_`,`defaultData`,`typeSettings`) values (10439,10155,10438,'clientId',15,'','');

/*Table structure for table `expandorow` */

DROP TABLE IF EXISTS `expandorow`;

CREATE TABLE `expandorow` (
  `rowId_` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `tableId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rowId_`),
  UNIQUE KEY `IX_81EFBFF5` (`tableId`,`classPK`),
  KEY `IX_49EB3118` (`classPK`),
  KEY `IX_D3F5D7AE` (`tableId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `expandorow` */

/*Table structure for table `expandotable` */

DROP TABLE IF EXISTS `expandotable`;

CREATE TABLE `expandotable` (
  `tableId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`tableId`),
  UNIQUE KEY `IX_37562284` (`companyId`,`classNameId`,`name`),
  KEY `IX_B5AE8A85` (`companyId`,`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `expandotable` */

insert  into `expandotable`(`tableId`,`companyId`,`classNameId`,`name`) values (10697,10155,10002,'CUSTOM_FIELDS'),(10506,10155,10002,'OPEN_SOCIAL_DATA_'),(10438,10155,10005,'MP'),(10507,10155,10005,'OPEN_SOCIAL_DATA_'),(10701,10155,10011,'CUSTOM_FIELDS'),(10696,10155,10012,'CUSTOM_FIELDS'),(10700,10155,10031,'CUSTOM_FIELDS'),(10699,10155,10102,'CUSTOM_FIELDS'),(10694,10155,10104,'CUSTOM_FIELDS'),(10698,10155,10109,'CUSTOM_FIELDS'),(10702,10155,10440,'CUSTOM_FIELDS'),(10695,10155,10443,'CUSTOM_FIELDS');

/*Table structure for table `expandovalue` */

DROP TABLE IF EXISTS `expandovalue`;

CREATE TABLE `expandovalue` (
  `valueId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `tableId` bigint(20) DEFAULT NULL,
  `columnId` bigint(20) DEFAULT NULL,
  `rowId_` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `data_` longtext,
  PRIMARY KEY (`valueId`),
  UNIQUE KEY `IX_9DDD21E5` (`columnId`,`rowId_`),
  UNIQUE KEY `IX_D27B03E7` (`tableId`,`columnId`,`classPK`),
  KEY `IX_B29FEF17` (`classNameId`,`classPK`),
  KEY `IX_F7DD0987` (`columnId`),
  KEY `IX_9112A7A0` (`rowId_`),
  KEY `IX_F0566A77` (`tableId`),
  KEY `IX_1BD3F4C` (`tableId`,`classPK`),
  KEY `IX_CA9AFB7C` (`tableId`,`columnId`),
  KEY `IX_B71E92D5` (`tableId`,`rowId_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `expandovalue` */

/*Table structure for table `group_` */

DROP TABLE IF EXISTS `group_`;

CREATE TABLE `group_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `groupId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `creatorUserId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `parentGroupId` bigint(20) DEFAULT NULL,
  `liveGroupId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(150) DEFAULT NULL,
  `description` longtext,
  `type_` int(11) DEFAULT NULL,
  `typeSettings` longtext,
  `manualMembership` tinyint(4) DEFAULT NULL,
  `membershipRestriction` int(11) DEFAULT NULL,
  `friendlyURL` varchar(255) DEFAULT NULL,
  `site` tinyint(4) DEFAULT NULL,
  `remoteStagingGroupCount` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`groupId`),
  UNIQUE KEY `IX_D0D5E397` (`companyId`,`classNameId`,`classPK`),
  UNIQUE KEY `IX_5DE0BE11` (`companyId`,`classNameId`,`liveGroupId`,`name`),
  UNIQUE KEY `IX_5BDDB872` (`companyId`,`friendlyURL`),
  UNIQUE KEY `IX_BBCA55B` (`companyId`,`liveGroupId`,`name`),
  UNIQUE KEY `IX_5AA68501` (`companyId`,`name`),
  UNIQUE KEY `IX_754FBB1C` (`uuid_`,`groupId`),
  KEY `IX_ABA5CEC2` (`companyId`),
  KEY `IX_B584B5CC` (`companyId`,`classNameId`),
  KEY `IX_ABE2D54` (`companyId`,`classNameId`,`parentGroupId`),
  KEY `IX_5D75499E` (`companyId`,`parentGroupId`),
  KEY `IX_6C499099` (`companyId`,`parentGroupId`,`site`),
  KEY `IX_63A2AABD` (`companyId`,`site`),
  KEY `IX_16218A38` (`liveGroupId`),
  KEY `IX_7B590A7A` (`type_`,`active_`),
  KEY `IX_F981514E` (`uuid_`),
  KEY `IX_26CC761A` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `group_` */

insert  into `group_`(`uuid_`,`groupId`,`companyId`,`creatorUserId`,`classNameId`,`classPK`,`parentGroupId`,`liveGroupId`,`treePath`,`name`,`description`,`type_`,`typeSettings`,`manualMembership`,`membershipRestriction`,`friendlyURL`,`site`,`remoteStagingGroupCount`,`active_`) values ('7ea0a109-b43c-48d3-b786-46b0c0eee7b7',10173,10155,10159,10001,10173,0,0,'/10173/','Control Panel','',3,'',1,0,'/control_panel',0,0,1),('a3aad41b-aa9d-473f-8638-030e75bd081c',10182,10155,10159,10001,10182,0,0,'/10182/','Guest','',1,'',1,0,'/guest',1,0,1),('775092f2-a6d1-49ac-a585-8f6dcae66e46',10192,10155,10159,10191,10159,0,0,'/10192/','User Personal Site','',3,'',1,0,'/personal_site',0,0,1),('856dbb43-cef4-4f12-ac2f-811c0de9346b',10195,10155,10159,10025,10155,0,0,'/10195/','10155','',0,'',1,0,'/global',1,0,1),('6956bfb4-d4ec-4f4a-8597-2fdc0793f130',10202,10155,10199,10005,10199,0,0,'/10202/','10199','',0,'',1,0,'/whitehalladmin',0,0,1),('c15c99ab-2cd3-426b-bc45-22ab4a2c2dc0',10318,10155,10159,10032,10317,0,0,'/10318/','10317','',0,'',1,0,'/template-10317',0,0,1),('bbd294cc-a1bd-4f0e-8ef3-9c3d57a7d78d',10330,10155,10159,10032,10329,0,0,'/10330/','10329','',0,'',1,0,'/template-10329',0,0,1),('238eaeef-0a85-48db-baca-a23c28c1456d',10340,10155,10159,10032,10339,0,0,'/10340/','10339','',0,'',1,0,'/template-10339',0,0,1),('397ea523-ecf6-4035-a95f-91224c6b38c0',10351,10155,10159,10036,10350,0,0,'/10351/','10350','',0,'',1,0,'/template-10350',0,0,1),('012fdfd0-ecc0-45aa-b2d9-1f291766dc79',10377,10155,10159,10036,10376,0,0,'/10377/','10376','',0,'',1,0,'/template-10376',0,0,1),('a7a0f0b0-9ed4-48d0-8e81-85c3e6d3800e',11148,10155,10159,10036,11147,0,0,'/11148/','11147','',0,'',1,0,'/template-11147',0,0,1),('1af53074-667c-4cd1-8fb6-b9c36d18cd66',11311,10155,11308,10005,11308,0,0,'/11311/','11308','',0,'',1,0,'/gautamkct',0,0,1),('57e1dd91-f859-4d8c-bc17-c8c30ec18481',11339,10155,11336,10005,11336,0,0,'/11339/','11336','',0,'',1,0,'/dhanushahm',0,0,1),('6a4d6649-dac7-4ecd-9b8a-d1220db8e9a5',11410,10155,11407,10005,11407,0,0,'/11410/','11407','',0,'',1,0,'/prinvestor1',0,0,1),('8dc10b7c-589e-4dc5-92b2-e9356d0ad915',11440,10155,11437,10005,11437,0,0,'/11440/','11437','',0,'',1,0,'/prinvestor2',0,0,1),('300ae20f-6005-4625-8aaf-12517e01143d',11460,10155,11457,10005,11457,0,0,'/11460/','11457','',0,'',1,0,'/sellerwhitehall2',0,0,1),('74a0df3d-63bb-4ed2-9b27-7b23b77296ee',11480,10155,11477,10005,11477,0,0,'/11480/','11477','',0,'',1,0,'/prinvestor3',0,0,1),('bbe92a70-98b8-4a2d-a27f-7d0e982e92d7',11500,10155,11497,10005,11497,0,0,'/11500/','11497','',0,'',1,0,'/prinvestor4',0,0,1),('f7558a1d-dac1-400e-ab9e-1d9fa343a570',11520,10155,11517,10005,11517,0,0,'/11520/','11517','',0,'',1,0,'/sellerwhitehall3',0,0,1),('e0efbb66-eaad-45db-9e3e-2effb5372e88',11540,10155,11537,10005,11537,0,0,'/11540/','11537','',0,'',1,0,'/scfcompany2',0,0,1);

/*Table structure for table `groups_orgs` */

DROP TABLE IF EXISTS `groups_orgs`;

CREATE TABLE `groups_orgs` (
  `groupId` bigint(20) NOT NULL,
  `organizationId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`organizationId`),
  KEY `IX_75267DCA` (`groupId`),
  KEY `IX_6BBB7682` (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `groups_orgs` */

/*Table structure for table `groups_roles` */

DROP TABLE IF EXISTS `groups_roles`;

CREATE TABLE `groups_roles` (
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`roleId`),
  KEY `IX_84471FD2` (`groupId`),
  KEY `IX_3103EF3D` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `groups_roles` */

/*Table structure for table `groups_usergroups` */

DROP TABLE IF EXISTS `groups_usergroups`;

CREATE TABLE `groups_usergroups` (
  `groupId` bigint(20) NOT NULL,
  `userGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`userGroupId`),
  KEY `IX_31FB749A` (`groupId`),
  KEY `IX_3B69160F` (`userGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `groups_usergroups` */

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `imageId` bigint(20) NOT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `size_` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageId`),
  KEY `IX_6A925A4D` (`size_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `image` */

/*Table structure for table `journalarticle` */

DROP TABLE IF EXISTS `journalarticle`;

CREATE TABLE `journalarticle` (
  `uuid_` varchar(75) DEFAULT NULL,
  `id_` bigint(20) NOT NULL,
  `resourcePrimKey` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `folderId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `articleId` varchar(75) DEFAULT NULL,
  `version` double DEFAULT NULL,
  `title` longtext,
  `urlTitle` varchar(150) DEFAULT NULL,
  `description` longtext,
  `content` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `structureId` varchar(75) DEFAULT NULL,
  `templateId` varchar(75) DEFAULT NULL,
  `layoutUuid` varchar(75) DEFAULT NULL,
  `displayDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `reviewDate` datetime DEFAULT NULL,
  `indexable` tinyint(4) DEFAULT NULL,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `IX_85C52EEC` (`groupId`,`articleId`,`version`),
  UNIQUE KEY `IX_3463D95B` (`uuid_`,`groupId`),
  KEY `IX_DFF98523` (`companyId`),
  KEY `IX_323DF109` (`companyId`,`status`),
  KEY `IX_3D070845` (`companyId`,`version`),
  KEY `IX_E82F322B` (`companyId`,`version`,`status`),
  KEY `IX_EA05E9E1` (`displayDate`,`status`),
  KEY `IX_9356F865` (`groupId`),
  KEY `IX_68C0F69C` (`groupId`,`articleId`),
  KEY `IX_4D5CD982` (`groupId`,`articleId`,`status`),
  KEY `IX_9CE6E0FA` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_A2534AC2` (`groupId`,`classNameId`,`layoutUuid`),
  KEY `IX_91E78C35` (`groupId`,`classNameId`,`structureId`),
  KEY `IX_F43B9FF2` (`groupId`,`classNameId`,`templateId`),
  KEY `IX_5CD17502` (`groupId`,`folderId`),
  KEY `IX_F35391E8` (`groupId`,`folderId`,`status`),
  KEY `IX_3C028C1E` (`groupId`,`layoutUuid`),
  KEY `IX_301D024B` (`groupId`,`status`),
  KEY `IX_2E207659` (`groupId`,`structureId`),
  KEY `IX_8DEAE14E` (`groupId`,`templateId`),
  KEY `IX_22882D02` (`groupId`,`urlTitle`),
  KEY `IX_D2D249E8` (`groupId`,`urlTitle`,`status`),
  KEY `IX_D19C1B9F` (`groupId`,`userId`),
  KEY `IX_43A0F80F` (`groupId`,`userId`,`classNameId`),
  KEY `IX_3F1EA19E` (`layoutUuid`),
  KEY `IX_33F49D16` (`resourcePrimKey`),
  KEY `IX_89FF8B06` (`resourcePrimKey`,`indexable`),
  KEY `IX_451D63EC` (`resourcePrimKey`,`indexable`,`status`),
  KEY `IX_3E2765FC` (`resourcePrimKey`,`status`),
  KEY `IX_EF9B7028` (`smallImageId`),
  KEY `IX_8E8710D9` (`structureId`),
  KEY `IX_9106F6CE` (`templateId`),
  KEY `IX_F029602F` (`uuid_`),
  KEY `IX_71520099` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `journalarticle` */

insert  into `journalarticle`(`uuid_`,`id_`,`resourcePrimKey`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`folderId`,`classNameId`,`classPK`,`treePath`,`articleId`,`version`,`title`,`urlTitle`,`description`,`content`,`type_`,`structureId`,`templateId`,`layoutUuid`,`displayDate`,`expirationDate`,`reviewDate`,`indexable`,`smallImage`,`smallImageId`,`smallImageURL`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('7e1081c5-bcc0-4c0f-b87f-ec5ffdd4421b',11162,11163,11148,10155,10159,'','2016-03-15 21:10:38','2016-03-15 21:10:38',0,0,0,'/0/','MAIN-CAROUSEL',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Main Carousel</Title></root>','main-carousel','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[]]></static-content>\n</root>','general','CAROUSEL-1.0-SNAPSHOT','CAROUSEL-1.0-SNAPSHOT','','2010-02-01 00:00:00',NULL,NULL,1,0,11164,'',0,10159,'','2016-03-15 21:10:39'),('9879d708-6a21-4bcd-95c5-65df1b695b1f',11171,11172,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',0,0,0,'/0/','CUSTOMIZE-IT',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Customize it</Title></root>','customize-it','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[]]></static-content>\n</root>','general','','','','2010-02-01 00:00:00',NULL,NULL,1,0,11173,'',0,10159,'','2016-03-15 21:10:39'),('4dcc18ca-714b-4443-bbff-03ca5d17a0cd',11179,11180,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',0,0,0,'/0/','DID-YOU-KNOW',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Did you know</Title></root>','did-you-know','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[]]></static-content>\n</root>','general','','','','2010-02-01 00:00:00',NULL,NULL,1,0,11181,'',0,10159,'','2016-03-15 21:10:39'),('746c5e57-9ca0-4c98-aab7-6bb89164b996',12166,12167,10182,10155,10199,'Whitehall Admin','2016-03-16 08:03:06','2016-03-16 08:03:06',0,0,0,'/0/','12165',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By SCF Company</Title></root>','create-invoice-by-scf-company','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi PHNO1,</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\nPHNO10\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>PHNO3</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:02:00',NULL,NULL,1,0,12168,'',0,10199,'Whitehall Admin','2016-03-16 08:03:06'),('a768477d-6088-4e14-84c1-cdfaf0a0d931',12175,12167,10182,10155,10199,'Whitehall Admin','2016-03-16 08:26:12','2016-03-16 08:26:12',0,0,0,'/0/','12165',1.1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By SCF Company</Title></root>','create-invoice-by-scf-company','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi PHNO1,</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n\n<p>PHNO10</p>\n\n<p>Regards,</p>\n\n<p>PHNO3</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:02:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-16 08:26:12'),('8b952859-4064-4c6d-bfd3-676fcb853f43',12179,12167,10182,10155,10199,'Whitehall Admin','2016-03-18 11:30:39','2016-03-18 11:30:39',0,0,0,'/0/','12165',1.2,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By SCF Company</Title></root>','create-invoice-by-scf-company','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:02:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:30:39'),('f27e6ed8-9c30-4c85-ab0f-a75a89d7a142',12183,12167,10182,10155,10199,'Whitehall Admin','2016-03-18 11:41:21','2016-03-18 11:41:21',0,0,0,'/0/','12165',1.3,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By SCF Company</Title></root>','create-invoice-by-scf-company','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [PH-NAME],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[PH-REGARDS]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:02:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:41:21'),('51f7a3a8-77fe-4fd0-a7e9-05163bfd2f6f',12187,12167,10182,10155,10199,'Whitehall Admin','2016-03-18 11:47:34','2016-03-18 11:47:34',0,0,0,'/0/','12165',1.4,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By SCF Company</Title></root>','create-invoice-by-scf-company','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [PH-NAME],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[PH-CONTENT]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[PH-REGARDS]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:02:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:47:34'),('39286f19-31c3-43b8-b0b5-0de37d83aa10',12192,12193,10182,10155,10199,'Whitehall Admin','2016-03-16 08:05:03','2016-03-16 08:05:03',0,0,0,'/0/','12191',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By WhitehallAdmin</Title></root>','create-invoice-by-whitehalladmin','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi PHNO1,</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\nPHNO10\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>PHNO3</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:04:00',NULL,NULL,1,0,12194,'',0,10199,'Whitehall Admin','2016-03-16 08:05:03'),('bffef746-9df3-4cb1-9a2f-d687e9957eaa',12201,12193,10182,10155,10199,'Whitehall Admin','2016-03-16 08:26:30','2016-03-16 08:26:30',0,0,0,'/0/','12191',1.1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By WhitehallAdmin</Title></root>','create-invoice-by-whitehalladmin','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi PHNO1,</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\nPHNO10\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>PHNO3</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:04:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-16 08:26:30'),('8a0b7583-cfdd-450e-b6ae-96376b5fb34e',12205,12193,10182,10155,10199,'Whitehall Admin','2016-03-18 11:31:09','2016-03-18 11:31:09',0,0,0,'/0/','12191',1.2,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By WhitehallAdmin</Title></root>','create-invoice-by-whitehalladmin','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:04:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:31:09'),('ae1f3f4f-6ced-44a7-9dea-f0e81d40a547',12209,12193,10182,10155,10199,'Whitehall Admin','2016-03-18 11:31:35','2016-03-18 11:31:35',0,0,0,'/0/','12191',1.3,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By WhitehallAdmin</Title></root>','create-invoice-by-whitehalladmin','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:04:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:31:35'),('74e5f35b-981a-44fa-962c-4c233cca8124',12213,12193,10182,10155,10199,'Whitehall Admin','2016-03-18 11:47:53','2016-03-18 11:47:53',0,0,0,'/0/','12191',1.4,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Create Invoice By WhitehallAdmin</Title></root>','create-invoice-by-whitehalladmin','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [PH-NAME],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[PH-CONTENT]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[PH-REGARDS]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:04:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:47:53'),('e6a5b8f0-0b10-43ad-ad91-0689bd57ae56',12218,12219,10182,10155,10199,'Whitehall Admin','2016-03-16 08:06:00','2016-03-16 08:06:00',0,0,0,'/0/','12217',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Request For Finanace</Title></root>','seller-request-for-finanace','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi PHNO1,</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\nPHNO10\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>PHNO3</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:05:00',NULL,NULL,1,0,12220,'',0,10199,'Whitehall Admin','2016-03-16 08:06:00'),('d5cdded7-4b64-4837-94e8-3fa198b28991',12227,12219,10182,10155,10199,'Whitehall Admin','2016-03-18 11:30:09','2016-03-18 11:30:09',0,0,0,'/0/','12217',1.1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Request For Finanace</Title></root>','seller-request-for-finanace','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:05:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:30:09'),('05f4cf8d-a268-4af3-9916-2dd4c37143c2',12231,12219,10182,10155,10199,'Whitehall Admin','2016-03-18 11:30:49','2016-03-18 11:30:49',0,0,0,'/0/','12217',1.2,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Request For Finanace</Title></root>','seller-request-for-finanace','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:05:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:30:49'),('2b89f989-9022-401b-8946-89cfaa49beda',12235,12219,10182,10155,10199,'Whitehall Admin','2016-03-18 11:47:45','2016-03-18 11:47:45',0,0,0,'/0/','12217',1.3,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Request For Finanace</Title></root>','seller-request-for-finanace','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [PH-NAME],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[PH-CONTENT]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[PH-REGARDS]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:05:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:47:45'),('5bd14a44-2ef7-4a55-afc0-be02ee655fcf',12240,12241,10182,10155,10199,'Whitehall Admin','2016-03-16 08:09:42','2016-03-16 08:09:42',0,0,0,'/0/','12239',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Allotment Made</Title></root>','allotment-made','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi PHNO1,</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\nPHNO10\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>PHNO3</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:09:00',NULL,NULL,1,0,12242,'',0,10199,'Whitehall Admin','2016-03-16 08:09:42'),('562c76f3-19cf-4562-935a-ef6f42cb13ae',12249,12241,10182,10155,10199,'Whitehall Admin','2016-03-18 11:31:43','2016-03-18 11:31:43',0,0,0,'/0/','12239',1.1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Allotment Made</Title></root>','allotment-made','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:09:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:31:43'),('25a7465a-c895-4bcc-9845-ea8e6728e5de',12253,12241,10182,10155,10199,'Whitehall Admin','2016-03-18 11:48:01','2016-03-18 11:48:01',0,0,0,'/0/','12239',1.2,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Allotment Made</Title></root>','allotment-made','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [PH-NAME],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[PH-CONTENT]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[PH-REGARDS]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:09:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:48:01'),('8a9672c4-b87e-4b3f-9a9d-9537843be3c3',12258,12259,10182,10155,10199,'Whitehall Admin','2016-03-16 08:10:15','2016-03-16 08:10:15',0,0,0,'/0/','12257',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Paid</Title></root>','seller-paid','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi PHNO1,</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\nPHNO10\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>PHNO3</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:09:00',NULL,NULL,1,0,12260,'',0,10199,'Whitehall Admin','2016-03-16 08:10:15'),('93ab33be-aacd-42bf-9ac3-5f4761eb03dc',12267,12259,10182,10155,10199,'Whitehall Admin','2016-03-18 11:30:27','2016-03-18 11:30:27',0,0,0,'/0/','12257',1.1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Paid</Title></root>','seller-paid','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:09:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:30:27'),('fb3b38c7-e0e3-445e-85a3-868cbb85f921',12271,12259,10182,10155,10199,'Whitehall Admin','2016-03-18 11:32:01','2016-03-18 11:32:01',0,0,0,'/0/','12257',1.2,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Paid</Title></root>','seller-paid','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:09:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:32:01'),('05f9471c-a97e-4f90-9246-4eb35d471ad5',12275,12259,10182,10155,10199,'Whitehall Admin','2016-03-18 11:48:08','2016-03-18 11:48:08',0,0,0,'/0/','12257',1.3,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Paid</Title></root>','seller-paid','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [PH-NAME],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[PH-CONTENT]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[PH-REGARDS]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:09:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:48:08'),('5bab7b35-f6dc-4ac9-bc66-a92ac8a070c7',12280,12281,10182,10155,10199,'Whitehall Admin','2016-03-16 08:11:10','2016-03-16 08:11:10',0,0,0,'/0/','12279',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Invoice Payment Date Due</Title></root>','invoice-payment-date-due','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi PHNO1,</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\nPHNO10\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>PHNO3</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:10:00',NULL,NULL,1,0,12282,'',0,10199,'Whitehall Admin','2016-03-16 08:11:10'),('6608c9e8-4b54-45e7-8b80-00550f0673bc',12289,12281,10182,10155,10199,'Whitehall Admin','2016-03-18 11:31:20','2016-03-18 11:31:20',0,0,0,'/0/','12279',1.1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Invoice Payment Date Due</Title></root>','invoice-payment-date-due','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:10:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:31:20'),('887b6da8-f415-4557-803a-2636e581d5da',12293,12281,10182,10155,10199,'Whitehall Admin','2016-03-18 11:32:10','2016-03-18 11:32:10',0,0,0,'/0/','12279',1.2,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Invoice Payment Date Due</Title></root>','invoice-payment-date-due','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [&amp;PH-NAME&amp;],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[&amp;PH-CONTENT&amp;]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[&amp;PH-REGARDS&amp;]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:10:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:32:10'),('f9eddadc-1cdc-44e0-b844-c1d0ff0247d5',12297,12281,10182,10155,10199,'Whitehall Admin','2016-03-18 11:48:17','2016-03-18 11:48:17',0,0,0,'/0/','12279',1.3,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Invoice Payment Date Due</Title></root>','invoice-payment-date-due','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<p>Hi [PH-NAME],</p>\n\n<p>&nbsp; &nbsp; &nbsp;You has been&nbsp;created invoce with following details&nbsp;in white hall.</p>\n[PH-CONTENT]\n\n<p>&nbsp;</p>\n\n<p>Regards,</p>\n\n<p>[PH-REGARDS]</p>]]></static-content>\n</root>','general','','','','2016-03-16 08:10:00',NULL,NULL,1,0,0,'',0,10199,'Whitehall Admin','2016-03-18 11:48:17');

/*Table structure for table `journalarticleimage` */

DROP TABLE IF EXISTS `journalarticleimage`;

CREATE TABLE `journalarticleimage` (
  `articleImageId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `articleId` varchar(75) DEFAULT NULL,
  `version` double DEFAULT NULL,
  `elInstanceId` varchar(75) DEFAULT NULL,
  `elName` varchar(75) DEFAULT NULL,
  `languageId` varchar(75) DEFAULT NULL,
  `tempImage` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`articleImageId`),
  UNIQUE KEY `IX_103D6207` (`groupId`,`articleId`,`version`,`elInstanceId`,`elName`,`languageId`),
  KEY `IX_3B51BB68` (`groupId`),
  KEY `IX_158B526F` (`groupId`,`articleId`,`version`),
  KEY `IX_D4121315` (`tempImage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `journalarticleimage` */

/*Table structure for table `journalarticleresource` */

DROP TABLE IF EXISTS `journalarticleresource`;

CREATE TABLE `journalarticleresource` (
  `uuid_` varchar(75) DEFAULT NULL,
  `resourcePrimKey` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `articleId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`resourcePrimKey`),
  UNIQUE KEY `IX_88DF994A` (`groupId`,`articleId`),
  UNIQUE KEY `IX_84AB0309` (`uuid_`,`groupId`),
  KEY `IX_F8433677` (`groupId`),
  KEY `IX_DCD1FAC1` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `journalarticleresource` */

insert  into `journalarticleresource`(`uuid_`,`resourcePrimKey`,`groupId`,`articleId`) values ('a4b204a8-8477-4ddf-9d5f-445636e9c804',11163,11148,'MAIN-CAROUSEL'),('3508241e-4e1a-40cc-80ef-b6277591b447',11172,11148,'CUSTOMIZE-IT'),('ae5da936-7e32-4b89-8250-290055aa6400',11180,11148,'DID-YOU-KNOW'),('cc25373e-b7a0-4c29-9408-8419d3b2678c',12167,10182,'12165'),('1715a17d-f9d8-42ec-bf20-ccfe6f23162f',12193,10182,'12191'),('063eae7f-5ff8-465b-a87b-93101cb1c26e',12219,10182,'12217'),('267bb055-cb16-4107-98e0-ac8551b76e20',12241,10182,'12239'),('29b095dc-091f-4144-b0eb-50f2e368b4e3',12259,10182,'12257'),('908973fe-3beb-4949-979c-eee17184a082',12281,10182,'12279');

/*Table structure for table `journalcontentsearch` */

DROP TABLE IF EXISTS `journalcontentsearch`;

CREATE TABLE `journalcontentsearch` (
  `contentSearchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `layoutId` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `articleId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`contentSearchId`),
  UNIQUE KEY `IX_C3AA93B8` (`groupId`,`privateLayout`,`layoutId`,`portletId`,`articleId`),
  KEY `IX_9207CB31` (`articleId`),
  KEY `IX_6838E427` (`groupId`,`articleId`),
  KEY `IX_20962903` (`groupId`,`privateLayout`),
  KEY `IX_7CC7D73E` (`groupId`,`privateLayout`,`articleId`),
  KEY `IX_B3B318DC` (`groupId`,`privateLayout`,`layoutId`),
  KEY `IX_7ACC74C9` (`groupId`,`privateLayout`,`layoutId`,`portletId`),
  KEY `IX_8DAF8A35` (`portletId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `journalcontentsearch` */

/*Table structure for table `journalfeed` */

DROP TABLE IF EXISTS `journalfeed`;

CREATE TABLE `journalfeed` (
  `uuid_` varchar(75) DEFAULT NULL,
  `id_` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `feedId` varchar(75) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `structureId` varchar(75) DEFAULT NULL,
  `templateId` varchar(75) DEFAULT NULL,
  `rendererTemplateId` varchar(75) DEFAULT NULL,
  `delta` int(11) DEFAULT NULL,
  `orderByCol` varchar(75) DEFAULT NULL,
  `orderByType` varchar(75) DEFAULT NULL,
  `targetLayoutFriendlyUrl` varchar(255) DEFAULT NULL,
  `targetPortletId` varchar(75) DEFAULT NULL,
  `contentField` varchar(75) DEFAULT NULL,
  `feedFormat` varchar(75) DEFAULT NULL,
  `feedVersion` double DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `IX_65576CBC` (`groupId`,`feedId`),
  UNIQUE KEY `IX_39031F51` (`uuid_`,`groupId`),
  KEY `IX_35A2DB2F` (`groupId`),
  KEY `IX_50C36D79` (`uuid_`),
  KEY `IX_CB37A10F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `journalfeed` */

/*Table structure for table `journalfolder` */

DROP TABLE IF EXISTS `journalfolder`;

CREATE TABLE `journalfolder` (
  `uuid_` varchar(75) DEFAULT NULL,
  `folderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `IX_65026705` (`groupId`,`parentFolderId`,`name`),
  UNIQUE KEY `IX_E002061` (`uuid_`,`groupId`),
  KEY `IX_E6E2725D` (`companyId`),
  KEY `IX_C36B0443` (`companyId`,`status`),
  KEY `IX_742DEC1F` (`groupId`),
  KEY `IX_E988689E` (`groupId`,`name`),
  KEY `IX_190483C6` (`groupId`,`parentFolderId`),
  KEY `IX_EFD9CAC` (`groupId`,`parentFolderId`,`status`),
  KEY `IX_63BDFA69` (`uuid_`),
  KEY `IX_54F89E1F` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `journalfolder` */

/*Table structure for table `kaleoaction` */

DROP TABLE IF EXISTS `kaleoaction`;

CREATE TABLE `kaleoaction` (
  `kaleoActionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeName` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `executionType` varchar(20) DEFAULT NULL,
  `script` longtext,
  `scriptLanguage` varchar(75) DEFAULT NULL,
  `scriptRequiredContexts` longtext,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`kaleoActionId`),
  KEY `IX_50E9112C` (`companyId`),
  KEY `IX_170EFD7A` (`kaleoClassName`,`kaleoClassPK`),
  KEY `IX_4B2545E8` (`kaleoClassName`,`kaleoClassPK`,`executionType`),
  KEY `IX_F95A622` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleoaction` */

insert  into `kaleoaction`(`kaleoActionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoClassName`,`kaleoClassPK`,`kaleoDefinitionId`,`kaleoNodeName`,`name`,`description`,`executionType`,`script`,`scriptLanguage`,`scriptRequiredContexts`,`priority`) values (10467,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53','com.liferay.portal.workflow.kaleo.model.KaleoNode',10466,10465,'update','reject','','onAssignment','\n					\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"denied\"), workflowContext);\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"pending\"), workflowContext);\n					\n				','javascript','',0),(10472,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53','com.liferay.portal.workflow.kaleo.model.KaleoNode',10471,10465,'approved','approve','','onEntry','\n					\n						import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;\n						import com.liferay.portal.kernel.workflow.WorkflowConstants;\n\n						WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.toStatus(\"approved\"), workflowContext);\n					\n				','groovy','',0);

/*Table structure for table `kaleocondition` */

DROP TABLE IF EXISTS `kaleocondition`;

CREATE TABLE `kaleocondition` (
  `kaleoConditionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `script` longtext,
  `scriptLanguage` varchar(75) DEFAULT NULL,
  `scriptRequiredContexts` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`kaleoConditionId`),
  KEY `IX_FEE46067` (`companyId`),
  KEY `IX_DC978A5D` (`kaleoDefinitionId`),
  KEY `IX_86CBD4C` (`kaleoNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleocondition` */

/*Table structure for table `kaleodefinition` */

DROP TABLE IF EXISTS `kaleodefinition`;

CREATE TABLE `kaleodefinition` (
  `kaleoDefinitionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `content` longtext,
  `version` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  `startKaleoNodeId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`kaleoDefinitionId`),
  KEY `IX_40B9112F` (`companyId`),
  KEY `IX_408542BA` (`companyId`,`active_`),
  KEY `IX_76C781AE` (`companyId`,`name`),
  KEY `IX_4C23F11B` (`companyId`,`name`,`active_`),
  KEY `IX_EC14F81A` (`companyId`,`name`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleodefinition` */

insert  into `kaleodefinition`(`kaleoDefinitionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`title`,`description`,`content`,`version`,`active_`,`startKaleoNodeId`) values (10465,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:54','Single Approver','Single Approver','A single approver can approve a workflow content.','<?xml version=\"1.0\"?>\n\n<workflow-definition xmlns=\"urn:liferay.com:liferay-workflow_6.2.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"urn:liferay.com:liferay-workflow_6.2.0 http://www.liferay.com/dtd/liferay-workflow-definition_6_2_0.xsd\">\n	<name>Single Approver</name>\n	<description>A single approver can approve a workflow content.</description>\n	<version>1</version>\n	<state>\n		<name>created</name>\n		<metadata> <![CDATA[{\"xy\":[36,51]}]]> </metadata>\n		<initial>true</initial>\n		<transitions>\n			<transition>\n				<name>review</name>\n				<target>review</target>\n			</transition>\n		</transitions>\n	</state>\n	<task>\n		<name>update</name>\n		<metadata> <![CDATA[{\"transitions\":{\"resubmit\":{\"bendpoints\":[[303,140]]}},\"xy\":[328,199]}]]> </metadata>\n		<actions>\n			<action>\n				<name>reject</name>\n				<script> <![CDATA[\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"denied\"), workflowContext);\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"pending\"), workflowContext);\n					]]> </script>\n				<script-language>javascript</script-language>\n				<execution-type>onAssignment</execution-type>\n			</action>\n			<notification>\n				<name>Creator Modification Notification</name>\n				<template>Your submission was rejected by ${userName}, please modify and resubmit.</template>\n				<template-language>freemarker</template-language>\n				<notification-type>email</notification-type>\n				<notification-type>user-notification</notification-type>\n				<execution-type>onAssignment</execution-type>\n			</notification>\n		</actions>\n		<assignments>\n			<user/>\n		</assignments>\n		<transitions>\n			<transition>\n				<name>resubmit</name>\n				<target>review</target>\n			</transition>\n		</transitions>\n	</task>\n	<task>\n		<name>review</name>\n		<metadata> <![CDATA[{\"xy\":[168,36]}]]> </metadata>\n		<actions>\n			<notification>\n				<name>Review Notification</name>\n				<template>${userName} sent you a ${entryType} for review in the workflow.</template>\n				<template-language>freemarker</template-language>\n				<notification-type>email</notification-type>\n				<notification-type>user-notification</notification-type>\n				<execution-type>onAssignment</execution-type>\n			</notification>\n			<notification>\n				<name>Review Completion Notification</name>\n				<template>Your submission has been reviewed and the reviewer has applied the following ${taskComments}.</template>\n				<template-language>freemarker</template-language>\n				<notification-type>email</notification-type>\n				<recipients>\n					<user/>\n				</recipients>\n				<execution-type>onExit</execution-type>\n			</notification>\n		</actions>\n		<assignments>\n			<roles>\n				<role>\n					<role-type>organization</role-type>\n					<name>Organization Administrator</name>\n				</role>\n				<role>\n					<role-type>organization</role-type>\n					<name>Organization Content Reviewer</name>\n				</role>\n				<role>\n					<role-type>organization</role-type>\n					<name>Organization Owner</name>\n				</role>\n				<role>\n					<role-type>regular</role-type>\n					<name>Administrator</name>\n				</role>\n				<role>\n					<role-type>regular</role-type>\n					<name>Portal Content Reviewer</name>\n				</role>\n				<role>\n					<role-type>site</role-type>\n					<name>Site Administrator</name>\n				</role>\n				<role>\n					<role-type>site</role-type>\n					<name>Site Content Reviewer</name>\n				</role>\n				<role>\n					<role-type>site</role-type>\n					<name>Site Owner</name>\n				</role>\n			</roles>\n		</assignments>\n		<transitions>\n			<transition>\n				<name>approve</name>\n				<target>approved</target>\n			</transition>\n			<transition>\n				<name>reject</name>\n				<target>update</target>\n				<default>false</default>\n			</transition>\n		</transitions>\n	</task>\n	<state>\n		<name>approved</name>\n		<metadata> <![CDATA[\n				{\"xy\":[380,51]}\n			]]> </metadata>\n		<actions>\n			<action>\n				<name>approve</name>\n				<script> <![CDATA[\n						import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;\n						import com.liferay.portal.kernel.workflow.WorkflowConstants;\n\n						WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.toStatus(\"approved\"), workflowContext);\n					]]> </script>\n				<script-language>groovy</script-language>\n				<execution-type>onEntry</execution-type>\n			</action>\n		</actions>\n	</state>\n</workflow-definition>',1,1,10473);

/*Table structure for table `kaleoinstance` */

DROP TABLE IF EXISTS `kaleoinstance`;

CREATE TABLE `kaleoinstance` (
  `kaleoInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoDefinitionName` varchar(200) DEFAULT NULL,
  `kaleoDefinitionVersion` int(11) DEFAULT NULL,
  `rootKaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoInstanceId`),
  KEY `IX_5F2FCD2D` (`companyId`),
  KEY `IX_BF5839F8` (`companyId`,`kaleoDefinitionName`,`kaleoDefinitionVersion`,`completionDate`),
  KEY `IX_4DA4D123` (`kaleoDefinitionId`),
  KEY `IX_ACF16238` (`kaleoDefinitionId`,`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleoinstance` */

/*Table structure for table `kaleoinstancetoken` */

DROP TABLE IF EXISTS `kaleoinstancetoken`;

CREATE TABLE `kaleoinstancetoken` (
  `kaleoInstanceTokenId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `parentKaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `currentKaleoNodeId` bigint(20) DEFAULT NULL,
  `currentKaleoNodeName` varchar(200) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`kaleoInstanceTokenId`),
  KEY `IX_153721BE` (`companyId`),
  KEY `IX_4A86923B` (`companyId`,`parentKaleoInstanceTokenId`),
  KEY `IX_360D34D9` (`companyId`,`parentKaleoInstanceTokenId`,`completionDate`),
  KEY `IX_7BDB04B4` (`kaleoDefinitionId`),
  KEY `IX_F42AAFF6` (`kaleoInstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleoinstancetoken` */

/*Table structure for table `kaleolog` */

DROP TABLE IF EXISTS `kaleolog`;

CREATE TABLE `kaleolog` (
  `kaleoLogId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoNodeName` varchar(200) DEFAULT NULL,
  `terminalKaleoNode` tinyint(4) DEFAULT NULL,
  `kaleoActionId` bigint(20) DEFAULT NULL,
  `kaleoActionName` varchar(200) DEFAULT NULL,
  `kaleoActionDescription` longtext,
  `previousKaleoNodeId` bigint(20) DEFAULT NULL,
  `previousKaleoNodeName` varchar(200) DEFAULT NULL,
  `previousAssigneeClassName` varchar(200) DEFAULT NULL,
  `previousAssigneeClassPK` bigint(20) DEFAULT NULL,
  `currentAssigneeClassName` varchar(200) DEFAULT NULL,
  `currentAssigneeClassPK` bigint(20) DEFAULT NULL,
  `type_` varchar(50) DEFAULT NULL,
  `comment_` longtext,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoLogId`),
  KEY `IX_73B5F4DE` (`companyId`),
  KEY `IX_E66A153A` (`kaleoClassName`,`kaleoClassPK`,`kaleoInstanceTokenId`,`type_`),
  KEY `IX_6C64B7D4` (`kaleoDefinitionId`),
  KEY `IX_5BC6AB16` (`kaleoInstanceId`),
  KEY `IX_470B9FF8` (`kaleoInstanceTokenId`,`type_`),
  KEY `IX_B0CDCA38` (`kaleoTaskInstanceTokenId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleolog` */

/*Table structure for table `kaleonode` */

DROP TABLE IF EXISTS `kaleonode`;

CREATE TABLE `kaleonode` (
  `kaleoNodeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `metadata` longtext,
  `description` longtext,
  `type_` varchar(20) DEFAULT NULL,
  `initial_` tinyint(4) DEFAULT NULL,
  `terminal` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kaleoNodeId`),
  KEY `IX_C4E9ACE0` (`companyId`),
  KEY `IX_F28C443E` (`companyId`,`kaleoDefinitionId`),
  KEY `IX_32E94DD6` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleonode` */

insert  into `kaleonode`(`kaleoNodeId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoDefinitionId`,`name`,`metadata`,`description`,`type_`,`initial_`,`terminal`) values (10466,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53',10465,'update','\n			{\"transitions\":{\"resubmit\":{\"bendpoints\":[[303,140]]}},\"xy\":[328,199]}\n		','','TASK',0,0),(10471,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53',10465,'approved','\n			\n				{\"xy\":[380,51]}\n			\n		','','STATE',0,1),(10473,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53',10465,'created','\n			{\"xy\":[36,51]}\n		','','STATE',1,0),(10474,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53',10465,'review','\n			{\"xy\":[168,36]}\n		','','TASK',0,0);

/*Table structure for table `kaleonotification` */

DROP TABLE IF EXISTS `kaleonotification`;

CREATE TABLE `kaleonotification` (
  `kaleoNotificationId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeName` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `executionType` varchar(20) DEFAULT NULL,
  `template` longtext,
  `templateLanguage` varchar(75) DEFAULT NULL,
  `notificationTypes` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`kaleoNotificationId`),
  KEY `IX_38829497` (`companyId`),
  KEY `IX_902D342F` (`kaleoClassName`,`kaleoClassPK`),
  KEY `IX_F3362E93` (`kaleoClassName`,`kaleoClassPK`,`executionType`),
  KEY `IX_4B968E8D` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleonotification` */

insert  into `kaleonotification`(`kaleoNotificationId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoClassName`,`kaleoClassPK`,`kaleoDefinitionId`,`kaleoNodeName`,`name`,`description`,`executionType`,`template`,`templateLanguage`,`notificationTypes`) values (10468,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53','com.liferay.portal.workflow.kaleo.model.KaleoNode',10466,10465,'update','Creator Modification Notification','','onAssignment','Your submission was rejected by ${userName}, please modify and resubmit.','freemarker','email,user-notification'),(10475,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53','com.liferay.portal.workflow.kaleo.model.KaleoNode',10474,10465,'review','Review Notification','','onAssignment','${userName} sent you a ${entryType} for review in the workflow.','freemarker','email,user-notification'),(10476,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53','com.liferay.portal.workflow.kaleo.model.KaleoNode',10474,10465,'review','Review Completion Notification','','onExit','\n					Your submission has been reviewed and the reviewer has applied the following ${taskComments}.','freemarker','email');

/*Table structure for table `kaleonotificationrecipient` */

DROP TABLE IF EXISTS `kaleonotificationrecipient`;

CREATE TABLE `kaleonotificationrecipient` (
  `kaleoNotificationRecipientId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNotificationId` bigint(20) DEFAULT NULL,
  `recipientClassName` varchar(200) DEFAULT NULL,
  `recipientClassPK` bigint(20) DEFAULT NULL,
  `recipientRoleType` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kaleoNotificationRecipientId`),
  KEY `IX_2C8C4AF4` (`companyId`),
  KEY `IX_AA6697EA` (`kaleoDefinitionId`),
  KEY `IX_7F4FED02` (`kaleoNotificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleonotificationrecipient` */

insert  into `kaleonotificationrecipient`(`kaleoNotificationRecipientId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoDefinitionId`,`kaleoNotificationId`,`recipientClassName`,`recipientClassPK`,`recipientRoleType`,`address`) values (10477,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53',10465,10476,'com.liferay.portal.model.User',0,0,'');

/*Table structure for table `kaleotask` */

DROP TABLE IF EXISTS `kaleotask`;

CREATE TABLE `kaleotask` (
  `kaleoTaskId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`kaleoTaskId`),
  KEY `IX_E1F8B23D` (`companyId`),
  KEY `IX_3FFA633` (`kaleoDefinitionId`),
  KEY `IX_77B3F1A2` (`kaleoNodeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleotask` */

insert  into `kaleotask`(`kaleoTaskId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoDefinitionId`,`kaleoNodeId`,`name`,`description`) values (10469,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53',10465,10466,'update',''),(10478,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53',10465,10474,'review','');

/*Table structure for table `kaleotaskassignment` */

DROP TABLE IF EXISTS `kaleotaskassignment`;

CREATE TABLE `kaleotaskassignment` (
  `kaleoTaskAssignmentId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `assigneeClassName` varchar(200) DEFAULT NULL,
  `assigneeClassPK` bigint(20) DEFAULT NULL,
  `assigneeActionId` varchar(75) DEFAULT NULL,
  `assigneeScript` longtext,
  `assigneeScriptLanguage` varchar(75) DEFAULT NULL,
  `assigneeScriptRequiredContexts` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`kaleoTaskAssignmentId`),
  KEY `IX_611732B0` (`companyId`),
  KEY `IX_D835C576` (`kaleoClassName`,`kaleoClassPK`),
  KEY `IX_1087068E` (`kaleoClassName`,`kaleoClassPK`,`assigneeClassName`),
  KEY `IX_575C03A6` (`kaleoDefinitionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleotaskassignment` */

insert  into `kaleotaskassignment`(`kaleoTaskAssignmentId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoClassName`,`kaleoClassPK`,`kaleoDefinitionId`,`kaleoNodeId`,`assigneeClassName`,`assigneeClassPK`,`assigneeActionId`,`assigneeScript`,`assigneeScriptLanguage`,`assigneeScriptRequiredContexts`) values (10470,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53','com.liferay.portal.workflow.kaleo.model.KaleoTask',10469,10465,0,'com.liferay.portal.model.User',0,'','','',''),(10479,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53','com.liferay.portal.workflow.kaleo.model.KaleoTask',10478,10465,0,'com.liferay.portal.model.Role',10162,'','','',''),(10480,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53','com.liferay.portal.workflow.kaleo.model.KaleoTask',10478,10465,0,'com.liferay.portal.model.Role',10481,'','','',''),(10482,0,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53','com.liferay.portal.workflow.kaleo.model.KaleoTask',10478,10465,0,'com.liferay.portal.model.Role',10483,'','','',''),(10484,0,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54','com.liferay.portal.workflow.kaleo.model.KaleoTask',10478,10465,0,'com.liferay.portal.model.Role',10485,'','','',''),(10486,0,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54','com.liferay.portal.workflow.kaleo.model.KaleoTask',10478,10465,0,'com.liferay.portal.model.Role',10172,'','','',''),(10487,0,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54','com.liferay.portal.workflow.kaleo.model.KaleoTask',10478,10465,0,'com.liferay.portal.model.Role',10170,'','','',''),(10488,0,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54','com.liferay.portal.workflow.kaleo.model.KaleoTask',10478,10465,0,'com.liferay.portal.model.Role',10167,'','','',''),(10489,0,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54','com.liferay.portal.workflow.kaleo.model.KaleoTask',10478,10465,0,'com.liferay.portal.model.Role',10168,'','','','');

/*Table structure for table `kaleotaskassignmentinstance` */

DROP TABLE IF EXISTS `kaleotaskassignmentinstance`;

CREATE TABLE `kaleotaskassignmentinstance` (
  `kaleoTaskAssignmentInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskId` bigint(20) DEFAULT NULL,
  `kaleoTaskName` varchar(200) DEFAULT NULL,
  `assigneeClassName` varchar(200) DEFAULT NULL,
  `assigneeClassPK` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`kaleoTaskAssignmentInstanceId`),
  KEY `IX_6E3CDA1B` (`companyId`),
  KEY `IX_C851011` (`kaleoDefinitionId`),
  KEY `IX_67A9EE93` (`kaleoInstanceId`),
  KEY `IX_D4C2235B` (`kaleoTaskInstanceTokenId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleotaskassignmentinstance` */

/*Table structure for table `kaleotaskinstancetoken` */

DROP TABLE IF EXISTS `kaleotaskinstancetoken`;

CREATE TABLE `kaleotaskinstancetoken` (
  `kaleoTaskInstanceTokenId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskId` bigint(20) DEFAULT NULL,
  `kaleoTaskName` varchar(200) DEFAULT NULL,
  `className` varchar(200) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `completionUserId` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  `dueDate` datetime DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoTaskInstanceTokenId`),
  KEY `IX_997FE723` (`companyId`),
  KEY `IX_608E9519` (`kaleoDefinitionId`),
  KEY `IX_2CE1159B` (`kaleoInstanceId`),
  KEY `IX_B857A115` (`kaleoInstanceId`,`kaleoTaskId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleotaskinstancetoken` */

/*Table structure for table `kaleotimer` */

DROP TABLE IF EXISTS `kaleotimer`;

CREATE TABLE `kaleotimer` (
  `kaleoTimerId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `blocking` tinyint(4) DEFAULT NULL,
  `description` longtext,
  `duration` double DEFAULT NULL,
  `scale` varchar(75) DEFAULT NULL,
  `recurrenceDuration` double DEFAULT NULL,
  `recurrenceScale` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`kaleoTimerId`),
  KEY `IX_4DE6A889` (`kaleoClassName`,`kaleoClassPK`),
  KEY `IX_1A479F32` (`kaleoClassName`,`kaleoClassPK`,`blocking`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleotimer` */

/*Table structure for table `kaleotimerinstancetoken` */

DROP TABLE IF EXISTS `kaleotimerinstancetoken`;

CREATE TABLE `kaleotimerinstancetoken` (
  `kaleoTimerInstanceTokenId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoClassName` varchar(200) DEFAULT NULL,
  `kaleoClassPK` bigint(20) DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoInstanceId` bigint(20) DEFAULT NULL,
  `kaleoInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTaskInstanceTokenId` bigint(20) DEFAULT NULL,
  `kaleoTimerId` bigint(20) DEFAULT NULL,
  `kaleoTimerName` varchar(200) DEFAULT NULL,
  `blocking` tinyint(4) DEFAULT NULL,
  `completionUserId` bigint(20) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `completionDate` datetime DEFAULT NULL,
  `workflowContext` longtext,
  PRIMARY KEY (`kaleoTimerInstanceTokenId`),
  KEY `IX_DB96C55B` (`kaleoInstanceId`),
  KEY `IX_DB279423` (`kaleoInstanceTokenId`,`completed`),
  KEY `IX_9932524C` (`kaleoInstanceTokenId`,`completed`,`blocking`),
  KEY `IX_13A5BA2C` (`kaleoInstanceTokenId`,`kaleoTimerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleotimerinstancetoken` */

/*Table structure for table `kaleotransition` */

DROP TABLE IF EXISTS `kaleotransition`;

CREATE TABLE `kaleotransition` (
  `kaleoTransitionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(200) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `kaleoDefinitionId` bigint(20) DEFAULT NULL,
  `kaleoNodeId` bigint(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `sourceKaleoNodeId` bigint(20) DEFAULT NULL,
  `sourceKaleoNodeName` varchar(200) DEFAULT NULL,
  `targetKaleoNodeId` bigint(20) DEFAULT NULL,
  `targetKaleoNodeName` varchar(200) DEFAULT NULL,
  `defaultTransition` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`kaleoTransitionId`),
  KEY `IX_41D6C6D` (`companyId`),
  KEY `IX_479F3063` (`kaleoDefinitionId`),
  KEY `IX_A392DFD2` (`kaleoNodeId`),
  KEY `IX_A38E2194` (`kaleoNodeId`,`defaultTransition`),
  KEY `IX_85268A11` (`kaleoNodeId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kaleotransition` */

insert  into `kaleotransition`(`kaleoTransitionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoDefinitionId`,`kaleoNodeId`,`name`,`description`,`sourceKaleoNodeId`,`sourceKaleoNodeName`,`targetKaleoNodeId`,`targetKaleoNodeName`,`defaultTransition`) values (10490,0,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54',10465,10466,'resubmit','',10466,'update',10474,'review',1),(10491,0,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54',10465,10473,'review','',10473,'created',10474,'review',1),(10492,0,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54',10465,10474,'approve','',10474,'review',10471,'approved',1),(10493,0,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54',10465,10474,'reject','',10474,'review',10466,'update',0);

/*Table structure for table `layout` */

DROP TABLE IF EXISTS `layout`;

CREATE TABLE `layout` (
  `uuid_` varchar(75) DEFAULT NULL,
  `plid` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `layoutId` bigint(20) DEFAULT NULL,
  `parentLayoutId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `title` longtext,
  `description` longtext,
  `keywords` longtext,
  `robots` longtext,
  `type_` varchar(75) DEFAULT NULL,
  `typeSettings` longtext,
  `hidden_` tinyint(4) DEFAULT NULL,
  `friendlyURL` varchar(255) DEFAULT NULL,
  `iconImage` tinyint(4) DEFAULT NULL,
  `iconImageId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `wapThemeId` varchar(75) DEFAULT NULL,
  `wapColorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `priority` int(11) DEFAULT NULL,
  `layoutPrototypeUuid` varchar(75) DEFAULT NULL,
  `layoutPrototypeLinkEnabled` tinyint(4) DEFAULT NULL,
  `sourcePrototypeLayoutUuid` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`plid`),
  UNIQUE KEY `IX_BC2C4231` (`groupId`,`privateLayout`,`friendlyURL`),
  UNIQUE KEY `IX_7162C27C` (`groupId`,`privateLayout`,`layoutId`),
  UNIQUE KEY `IX_E118C537` (`uuid_`,`groupId`,`privateLayout`),
  KEY `IX_C7FBC998` (`companyId`),
  KEY `IX_C099D61A` (`groupId`),
  KEY `IX_705F5AA3` (`groupId`,`privateLayout`),
  KEY `IX_6DE88B06` (`groupId`,`privateLayout`,`parentLayoutId`),
  KEY `IX_8CE8C0D9` (`groupId`,`privateLayout`,`sourcePrototypeLayoutUuid`),
  KEY `IX_1A1B61D2` (`groupId`,`privateLayout`,`type_`),
  KEY `IX_23922F7D` (`iconImageId`),
  KEY `IX_B529BFD3` (`layoutPrototypeUuid`),
  KEY `IX_39A18ECC` (`sourcePrototypeLayoutUuid`),
  KEY `IX_D0822724` (`uuid_`),
  KEY `IX_2CE4BE84` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `layout` */

insert  into `layout`(`uuid_`,`plid`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`privateLayout`,`layoutId`,`parentLayoutId`,`name`,`title`,`description`,`keywords`,`robots`,`type_`,`typeSettings`,`hidden_`,`friendlyURL`,`iconImage`,`iconImageId`,`themeId`,`colorSchemeId`,`wapThemeId`,`wapColorSchemeId`,`css`,`priority`,`layoutPrototypeUuid`,`layoutPrototypeLinkEnabled`,`sourcePrototypeLayoutUuid`) values ('00d2af40-10b4-489f-8416-20fef7928bdc',10176,10173,10155,10159,'','2016-03-15 19:16:28','2016-03-15 19:16:28',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Control Panel</Name></root>','','','','','control_panel','privateLayout=true\n',0,'/manage',0,0,'','','','','',0,'',0,''),('15fa54a5-46f4-468b-be27-72ac2a248662',10321,10318,10155,10159,'','2016-03-15 19:16:36','2016-03-15 19:16:36',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Blog</Name></root>','','','','','portlet','column-1=33,\ncolumn-2=148_INSTANCE_pKtzmcNTRfdy,114,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/layout',0,0,'','','','','',0,'',0,''),('9c636d48-3c1f-4cd0-b19b-a1042586c8f8',10333,10330,10155,10159,'','2016-03-15 19:16:37','2016-03-15 19:16:37',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Content Display Page</Name></root>','','','','','portlet','column-1=141_INSTANCE_mnJkpO5aZ0hs,122_INSTANCE_yNTrLbgSs43u,\ncolumn-2=3,101_INSTANCE_rwORxcqB7Ttb,\ndefault-asset-publisher-portlet-id=101_INSTANCE_rwORxcqB7Ttb\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/layout',0,0,'','','','','',0,'',0,''),('9209e5b6-d024-4122-8168-dfe1878c49ad',10343,10340,10155,10159,'','2016-03-15 19:16:38','2016-03-15 19:16:39',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Wiki</Name></root>','','','','','portlet','column-1=36,\ncolumn-2=122_INSTANCE_JiwWSHi0Y5yy,141_INSTANCE_ilOVYHsC06a6,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/layout',0,0,'','','','','',0,'',0,''),('601e03fe-491b-4fa4-a7b7-3ac42977297a',10362,10351,10155,10159,'','2016-03-15 19:16:41','2016-03-15 19:16:42',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','','','','','portlet','column-1=19,\ncolumn-2=3,59_INSTANCE_4DSKC9coNNqW,180,101_INSTANCE_WKhV5p60HYwQ,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('2295e5b1-65a7-4cef-b7e1-fb7275857c02',10370,10351,10155,10159,'','2016-03-15 19:16:42','2016-03-15 19:16:43',1,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Wiki</Name></root>','','','','','portlet','column-1=36,\ncolumn-2=122_INSTANCE_20kYZ2iZM7YQ,148_INSTANCE_Z8hUqf6pix0j,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/wiki',0,0,'','','','','',1,'',0,''),('3b0121be-cfdb-4f75-9899-a5a770104045',10388,10377,10155,10159,'','2016-03-15 19:16:43','2016-03-15 19:16:44',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','','','','','portlet','column-1=116,\ncolumn-2=3,82,101_INSTANCE_u3FtbZ8AzOJ9,\nlayout-template-id=2_columns_i\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('d6b7da32-262f-4694-b534-70224508f957',10397,10377,10155,10159,'','2016-03-15 19:16:45','2016-03-15 19:16:46',1,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Documents and Media</Name></root>','','','','','portlet','column-1=20,\ncolumn-2=101_INSTANCE_QnVZlQSSicet,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/documents',0,0,'','','','','',1,'',0,''),('787c43b8-758c-4e17-8733-b5800ee9a01a',10405,10377,10155,10159,'','2016-03-15 19:16:46','2016-03-15 19:16:47',1,3,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">News</Name></root>','','','','','portlet','column-1=39_INSTANCE_98usyrRw7YUm,\ncolumn-2=39_INSTANCE_wWzLD7tqzCQf,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/news',0,0,'','','','','',2,'',0,''),('32eaaf67-d334-4d80-8212-085aff9b7593',10638,10202,10155,10199,'Test Test','2016-03-15 19:19:28','2016-03-15 19:19:28',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('068741c0-d355-4fbe-82db-ecfa88f3dac5',10644,10202,10155,10199,'Test Test','2016-03-15 19:19:29','2016-03-15 19:19:29',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('d90ea964-138f-4179-bb76-b07fa7dfe41c',10703,10182,10155,10199,'','2015-08-13 20:36:13','2015-08-13 21:44:36',0,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','','','','','portlet','column-1=58,\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nlfr-theme:regular:dashboard-view-for-logged-in-users=false\nlfr-theme:regular:hide-dockbar=false\nlfr-theme:regular:portlet-setup-show-borders-default=true\nlfr-theme:regular:show-link-user-personal-menu=false\nlfr-theme:regular:show-search-field=false\nlfr-theme:regular:site-header-icon=icon-camera-retro\nlfr-theme:regular:site-subheading=Welcome to trade Finance!\nlfr-theme:regular:theme-color-highlight=#295780\nlfr-theme:regular:theme-color-main=#295780\nsitemap-changefreq=daily\nsitemap-include=1\n',0,'/home',0,0,'tftheme_WAR_tftheme','01','','','',1,'',0,''),('aad0b1fc-5261-4775-9809-3699692c8085',10705,10182,10155,10199,'','2015-08-16 09:54:22','2016-03-16 04:47:45',0,3,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Registration</Name></root>','','','','','portlet','column-1=tfregistrationportlet_WAR_tfregistrationportlet\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nlfr-theme:regular:dashboard-view-for-logged-in-users=false\nlfr-theme:regular:hide-dockbar=false\nlfr-theme:regular:portlet-setup-show-borders-default=true\nlfr-theme:regular:show-link-user-personal-menu=false\nlfr-theme:regular:show-search-field=false\nlfr-theme:regular:site-header-icon=icon-camera-retro\nlfr-theme:regular:site-subheading=Welcome to trade Finance!\nlfr-theme:regular:theme-color-highlight=#295780\nlfr-theme:regular:theme-color-main=#295780\nsitemap-changefreq=daily\nsitemap-include=1\n',1,'/registration',0,0,'tftheme_WAR_tftheme','01','','','',2,'',0,''),('09de4195-abf2-4f04-8d93-5a5fc6ab51a4',10965,10182,10155,10199,'','2015-08-13 19:58:03','2016-03-21 21:13:55',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Dashboard</Name></root>','','','','','portlet','column-1=tfdashboardportlet_WAR_tfdashboardportlet\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/dashboard',0,0,'','','','','',0,'',0,''),('7dd64fed-1be7-4302-962e-58376941d103',10967,10182,10155,10199,'','2015-08-13 19:57:20','2016-03-16 04:58:22',1,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Company</Name></root>','','','','','portlet','column-1=tfcompanyportlet_WAR_tfadminportlet\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/company',0,0,'','','','','',1,'',0,''),('fe4d0e90-f6cf-4cfe-9120-4d7077e9979a',10969,10182,10155,10199,'','2015-08-13 19:58:29','2015-09-16 21:19:30',1,3,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Purchase Order</Name></root>','','','','','portlet','column-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nprivateLayout=true\n',1,'/purchase-order',0,0,'classic','','','','',2,'',0,''),('337fe27b-1c24-4d93-87c8-82050d7a95f3',10971,10182,10155,10199,'','2015-08-27 18:38:56','2016-03-16 04:55:30',1,4,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Invoices</Name></root>','','','','','portlet','column-1=scfinvoiceportlet_WAR_scfinvoiceportlet\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/invoices',0,0,'','','','','',3,'',0,''),('a8bbadf8-a9a1-4df3-a3e5-0f08bfce480b',10973,10182,10155,10199,'','2015-08-31 17:57:39','2016-03-19 14:25:38',1,5,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">SCF Trade</Name></root>','','','','','portlet','column-1=scftradeportlet_WAR_scftradeportlet\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/scf-trade',0,0,'','','','','',4,'',0,''),('73b16621-56b2-42f2-b7f2-c250eb19381a',10975,10182,10155,10199,'','2015-10-31 19:21:12','2016-03-20 16:02:11',1,6,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Portfolio</Name></root>','','','','','portlet','column-1=scfinvestorportlet_WAR_scfinvestorportlet\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nprivateLayout=true\n',1,'/portfolio',0,0,'classic','','','','',6,'',0,''),('ead0482d-a666-4e94-ae51-712ead7e7aa9',10977,10182,10155,10199,'','2016-01-16 20:46:18','2016-03-19 19:45:13',1,7,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Settings</Name></root>','','','','','portlet','column-1=tfsettingsportlet_WAR_tfsettingsportlet\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nprivateLayout=true\n',1,'/settings',0,0,'classic','','','','',7,'',0,''),('ad9c1aaa-bfcf-4d7b-80d3-8ffb98df97b1',11189,11148,10155,10159,'','2016-03-15 21:10:40','2016-03-15 21:10:40',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','','','','portlet','column-1=56_INSTANCE_0aLHKGqQ3tNo,\ncolumn-2=56_INSTANCE_ODGrax4MoqFN,\ncolumn-3=56_INSTANCE_L1yh1GFJzyJr,\nlayout-template-id=1_2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('cdb79132-8ea8-4d80-bb75-4581fb1e68cf',11315,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:16','2016-03-16 04:54:17',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('f6ac7238-d4c4-4cf4-a580-71a1aca90c24',11321,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:17','2016-03-16 04:54:17',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('a728140e-7536-479e-a9a9-c8b1d5cb02c4',11414,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:06','2016-03-16 19:41:07',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('976b9b73-c172-4207-abb4-e177e46bd2d1',11420,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:07','2016-03-16 19:41:07',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('afa461aa-8fcb-41ec-b78a-a3770f7d2b32',11444,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:45','2016-03-16 20:05:45',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('a31d1c09-0f3a-4cd1-86cf-812b023cbe18',11450,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:46','2016-03-16 20:05:47',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('df61a034-0c93-48e2-ad38-1411b0f4da7b',11464,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('a41e84d7-8f7e-4ae4-99ff-5b5eeb37109d',11470,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('8aee6984-1ed8-40ea-b973-76c738a6abef',11484,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('920f4db5-a3e6-4052-b6b3-2939d9f73784',11490,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:33',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('41cb3ec9-b631-4519-ae88-0588469c82a4',11504,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:49','2016-03-16 20:52:49',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('38620933-272c-4ee2-9253-53cdfe25c078',11510,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:50','2016-03-16 20:52:50',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('a7d9657d-37f9-4899-8b8a-af2dd6758b04',11524,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('20514ffc-d652-45d2-845b-5d8b41ed49ad',11530,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:58',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('9089f46a-e775-4761-b56d-5ceb345f10a9',11544,11540,10155,11537,'scf company2','2016-03-16 21:00:43','2016-03-16 21:00:43',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('fa4d8543-0aaf-4bc1-af36-58d04c2058e3',11550,11540,10155,11537,'scf company2','2016-03-16 21:00:43','2016-03-16 21:00:44',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('85c70eb2-c2ee-47ca-84dd-3cd369b6be92',11707,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:07','2016-03-19 14:00:08',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('1670c294-e549-43dc-a843-a188a1e58172',11713,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:09','2016-03-19 14:00:09',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('da05ecf2-2f10-41ed-942e-f4b5f93dd384',12501,10182,10155,10199,'Whitehall Admin','2016-03-24 11:27:24','2016-03-24 11:27:57',1,8,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">reports</Name></root>','','','','','portlet','column-1=tfreportportlet_WAR_tfreportportlet\nlayout-template-id=1_column\nprivateLayout=true\n',1,'/reports',0,0,'','','','','',8,'',0,'');

/*Table structure for table `layoutbranch` */

DROP TABLE IF EXISTS `layoutbranch`;

CREATE TABLE `layoutbranch` (
  `LayoutBranchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `layoutSetBranchId` bigint(20) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `master` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`LayoutBranchId`),
  UNIQUE KEY `IX_FD57097D` (`layoutSetBranchId`,`plid`,`name`),
  KEY `IX_6C226433` (`layoutSetBranchId`),
  KEY `IX_2C42603E` (`layoutSetBranchId`,`plid`),
  KEY `IX_A705FF94` (`layoutSetBranchId`,`plid`,`master`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `layoutbranch` */

/*Table structure for table `layoutfriendlyurl` */

DROP TABLE IF EXISTS `layoutfriendlyurl`;

CREATE TABLE `layoutfriendlyurl` (
  `uuid_` varchar(75) DEFAULT NULL,
  `layoutFriendlyURLId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `friendlyURL` varchar(255) DEFAULT NULL,
  `languageId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`layoutFriendlyURLId`),
  UNIQUE KEY `IX_A6FC2B28` (`groupId`,`privateLayout`,`friendlyURL`,`languageId`),
  UNIQUE KEY `IX_C5762E72` (`plid`,`languageId`),
  UNIQUE KEY `IX_326525D6` (`uuid_`,`groupId`),
  KEY `IX_EAB317C8` (`companyId`),
  KEY `IX_742EF04A` (`groupId`),
  KEY `IX_CA713461` (`groupId`,`privateLayout`,`friendlyURL`),
  KEY `IX_83AE56AB` (`plid`),
  KEY `IX_59051329` (`plid`,`friendlyURL`),
  KEY `IX_9F80D54` (`uuid_`),
  KEY `IX_F4321A54` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `layoutfriendlyurl` */

insert  into `layoutfriendlyurl`(`uuid_`,`layoutFriendlyURLId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`plid`,`privateLayout`,`friendlyURL`,`languageId`) values ('eb17d783-35d6-44af-bd9e-b7ac2768a1a8',10177,10173,10155,10159,'','2016-03-15 19:16:28','2016-03-15 19:16:28',10176,1,'/manage','en_US'),('5e4f8616-f4e0-44d9-bbfb-299be2cd48a9',10322,10318,10155,10159,'','2016-03-15 19:16:36','2016-03-15 19:16:36',10321,1,'/layout','en_US'),('016edb05-b4fd-479e-86d7-9c03d8f6a1df',10334,10330,10155,10159,'','2016-03-15 19:16:37','2016-03-15 19:16:37',10333,1,'/layout','en_US'),('c17f73db-ff8f-427e-8916-a3f49a71845e',10344,10340,10155,10159,'','2016-03-15 19:16:38','2016-03-15 19:16:38',10343,1,'/layout','en_US'),('c67a4701-5e66-4657-8531-76a934eadbfb',10363,10351,10155,10159,'','2016-03-15 19:16:41','2016-03-15 19:16:41',10362,1,'/home','en_US'),('8192eb4f-9e67-4931-8bdd-480846f68a88',10371,10351,10155,10159,'','2016-03-15 19:16:42','2016-03-15 19:16:42',10370,1,'/wiki','en_US'),('66fb08b5-bb5a-412d-a9b4-7ddd1b81a6c8',10389,10377,10155,10159,'','2016-03-15 19:16:43','2016-03-15 19:16:43',10388,1,'/home','en_US'),('bf16094a-c64e-44ac-851b-d35f2b4e02ca',10398,10377,10155,10159,'','2016-03-15 19:16:45','2016-03-15 19:16:45',10397,1,'/documents','en_US'),('f0dd25bb-7d3e-4007-992a-10376d4e4415',10406,10377,10155,10159,'','2016-03-15 19:16:46','2016-03-15 19:16:46',10405,1,'/news','en_US'),('7404e2fe-463e-4161-a210-6f38f7c4a537',10639,10202,10155,10199,'Test Test','2016-03-15 19:19:28','2016-03-15 19:19:28',10638,1,'/home','en_US'),('eda9b211-7533-436f-913a-386ab97b87f8',10645,10202,10155,10199,'Test Test','2016-03-15 19:19:29','2016-03-15 19:19:29',10644,0,'/home','en_US'),('35f9a3c8-5c33-494a-8b0d-b5cba5bb58ea',10704,10182,10155,10199,'Test Test','2015-08-13 20:36:13','2015-08-13 20:36:13',10703,0,'/home','en_US'),('029469a0-26c5-474b-98cc-d2a13aadd3da',10706,10182,10155,10199,'Test Test','2015-08-16 09:54:22','2015-08-16 09:54:22',10705,0,'/registration','en_US'),('12431917-3a8e-49bc-89fe-a85e04db194c',10966,10182,10155,10199,'Test Test','2015-08-13 19:58:04','2015-08-13 19:58:04',10965,1,'/dashboard','en_US'),('df0d32ab-daa3-4258-8d36-2f8e6e51e3ac',10968,10182,10155,10199,'Test Test','2015-08-13 19:57:20','2015-08-13 19:57:20',10967,1,'/company','en_US'),('6dea7e92-cb52-46b6-929a-7e884cf67461',10970,10182,10155,10199,'Test Test','2015-08-13 19:58:29','2015-08-13 19:58:29',10969,1,'/purchase-order','en_US'),('49136a77-8ef7-4c11-b63e-dc789d885ec6',10972,10182,10155,10199,'Test Test','2015-08-27 18:38:56','2015-08-27 18:38:56',10971,1,'/invoices','en_US'),('74e7fe88-65f2-4493-bded-9e9fc3667914',10974,10182,10155,10199,'Test Test','2015-08-31 17:57:40','2015-08-31 17:57:40',10973,1,'/scf-trade','en_US'),('6021a986-63b9-474e-93d8-de833847a668',10976,10182,10155,10199,'Test Test','2015-10-31 19:21:12','2015-10-31 19:21:12',10975,1,'/portfolio','en_US'),('6febff21-a2f4-4909-89c0-4fe99ffa205f',10978,10182,10155,10199,'Test Test','2016-01-16 20:46:18','2016-01-16 20:46:18',10977,1,'/settings','en_US'),('a5e2c8e8-b97d-4c3c-a2d2-61a1c87139be',11190,11148,10155,10159,'','2016-03-15 21:10:40','2016-03-15 21:10:40',11189,1,'/home','en_US'),('d84adbcb-1561-4ae4-ab60-75333398c002',11316,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:16','2016-03-16 04:54:16',11315,1,'/home','en_US'),('ec071ddb-afe0-4cad-8cfb-de29d6f63c9e',11322,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:17','2016-03-16 04:54:17',11321,0,'/home','en_US'),('dfe5012b-22a8-4446-81fd-5d7d77e0fb7b',11415,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:06','2016-03-16 19:41:06',11414,1,'/home','en_US'),('234cc0f2-f876-438b-b7b5-e40e695e2906',11421,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:07','2016-03-16 19:41:07',11420,0,'/home','en_US'),('8a415ee4-eae1-4055-8209-a5110eb480aa',11445,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:45','2016-03-16 20:05:45',11444,1,'/home','en_US'),('4aab947c-dbb9-418d-94a1-e3ccf10820f5',11451,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:46','2016-03-16 20:05:46',11450,0,'/home','en_US'),('78b19dc4-4b50-46b8-968c-b649472ae98e',11465,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',11464,1,'/home','en_US'),('69343065-d99f-44bc-a1cf-9b4617213946',11471,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',11470,0,'/home','en_US'),('47efa1e1-1a76-4414-bfa5-fbb5fc9d10d6',11485,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',11484,1,'/home','en_US'),('22ef3d8f-7463-470c-90b6-778e44005d96',11491,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',11490,0,'/home','en_US'),('adcd3c10-35b5-4a26-b72c-14bf09df7f9c',11505,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:49','2016-03-16 20:52:49',11504,1,'/home','en_US'),('b28fbd0d-b2c5-422a-ad7a-80495de58f84',11511,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:50','2016-03-16 20:52:50',11510,0,'/home','en_US'),('5bdb91dc-e3e0-4add-aa69-6dcb9b75d39f',11525,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',11524,1,'/home','en_US'),('a01315ae-4f8e-417f-a3a7-0ce76b0a3aff',11531,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',11530,0,'/home','en_US'),('370e2f86-c85b-4df5-88e2-42de2778100b',11545,11540,10155,11537,'scf company2','2016-03-16 21:00:43','2016-03-16 21:00:43',11544,1,'/home','en_US'),('91ee8105-6249-490c-a93b-aef80914221f',11551,11540,10155,11537,'scf company2','2016-03-16 21:00:44','2016-03-16 21:00:44',11550,0,'/home','en_US'),('818be97c-6aea-4d5f-b18c-a94f1a4b2888',11708,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:07','2016-03-19 14:00:07',11707,1,'/home','en_US'),('53bb33f9-990c-44a2-85de-493447c07a23',11714,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:09','2016-03-19 14:00:09',11713,0,'/home','en_US'),('b51ef295-4afc-40be-ad9a-70121f9de4c2',12502,10182,10155,10199,'Whitehall Admin','2016-03-24 11:27:24','2016-03-24 11:27:24',12501,1,'/reports','en_US');

/*Table structure for table `layoutprototype` */

DROP TABLE IF EXISTS `layoutprototype`;

CREATE TABLE `layoutprototype` (
  `uuid_` varchar(75) DEFAULT NULL,
  `layoutPrototypeId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `settings_` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutPrototypeId`),
  KEY `IX_30616AAA` (`companyId`),
  KEY `IX_557A639F` (`companyId`,`active_`),
  KEY `IX_CEF72136` (`uuid_`),
  KEY `IX_63ED2532` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `layoutprototype` */

insert  into `layoutprototype`(`uuid_`,`layoutPrototypeId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`description`,`settings_`,`active_`) values ('458d1b8c-e076-4ce9-87f3-793877a76faa',10317,10155,10159,'','2016-03-15 19:16:35','2016-03-15 19:16:35','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Blog</Name></root>','Create, edit, and view blogs from this page. Explore topics using tags, and connect with other members that blog.','',1),('ea383428-2820-40e4-a290-ac8443d24c4f',10329,10155,10159,'','2016-03-15 19:16:36','2016-03-15 19:16:36','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Content Display Page</Name></root>','Create, edit, and explore web content with this page. Search available content, explore related content with tags, and browse content categories.','',1),('4a233522-56a3-4c6a-a66b-7192f93f62aa',10339,10155,10159,'','2016-03-15 19:16:37','2016-03-15 19:16:37','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Wiki</Name></root>','Collaborate with members through the wiki on this page. Discover related content through tags, and navigate quickly and easily with categories.','',1);

/*Table structure for table `layoutrevision` */

DROP TABLE IF EXISTS `layoutrevision`;

CREATE TABLE `layoutrevision` (
  `layoutRevisionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `layoutSetBranchId` bigint(20) DEFAULT NULL,
  `layoutBranchId` bigint(20) DEFAULT NULL,
  `parentLayoutRevisionId` bigint(20) DEFAULT NULL,
  `head` tinyint(4) DEFAULT NULL,
  `major` tinyint(4) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `name` longtext,
  `title` longtext,
  `description` longtext,
  `keywords` longtext,
  `robots` longtext,
  `typeSettings` longtext,
  `iconImage` tinyint(4) DEFAULT NULL,
  `iconImageId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `wapThemeId` varchar(75) DEFAULT NULL,
  `wapColorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`layoutRevisionId`),
  KEY `IX_43E8286A` (`head`,`plid`),
  KEY `IX_314B621A` (`layoutSetBranchId`),
  KEY `IX_A9AC086E` (`layoutSetBranchId`,`head`),
  KEY `IX_E10AC39` (`layoutSetBranchId`,`head`,`plid`),
  KEY `IX_13984800` (`layoutSetBranchId`,`layoutBranchId`,`plid`),
  KEY `IX_4A84AF43` (`layoutSetBranchId`,`parentLayoutRevisionId`,`plid`),
  KEY `IX_B7B914E5` (`layoutSetBranchId`,`plid`),
  KEY `IX_70DA9ECB` (`layoutSetBranchId`,`plid`,`status`),
  KEY `IX_7FFAE700` (`layoutSetBranchId`,`status`),
  KEY `IX_9329C9D6` (`plid`),
  KEY `IX_8EC3D2BC` (`plid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `layoutrevision` */

/*Table structure for table `layoutset` */

DROP TABLE IF EXISTS `layoutset`;

CREATE TABLE `layoutset` (
  `layoutSetId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `logo` tinyint(4) DEFAULT NULL,
  `logoId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `wapThemeId` varchar(75) DEFAULT NULL,
  `wapColorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `pageCount` int(11) DEFAULT NULL,
  `settings_` longtext,
  `layoutSetPrototypeUuid` varchar(75) DEFAULT NULL,
  `layoutSetPrototypeLinkEnabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutSetId`),
  UNIQUE KEY `IX_48550691` (`groupId`,`privateLayout`),
  KEY `IX_A40B8BEC` (`groupId`),
  KEY `IX_72BBA8B7` (`layoutSetPrototypeUuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `layoutset` */

insert  into `layoutset`(`layoutSetId`,`groupId`,`companyId`,`createDate`,`modifiedDate`,`privateLayout`,`logo`,`logoId`,`themeId`,`colorSchemeId`,`wapThemeId`,`wapColorSchemeId`,`css`,`pageCount`,`settings_`,`layoutSetPrototypeUuid`,`layoutSetPrototypeLinkEnabled`) values (10174,10173,10155,'2016-03-15 19:16:28','2016-03-15 19:16:29',1,0,0,'classic','01','mobile','01','',1,'','',0),(10175,10173,10155,'2016-03-15 19:16:28','2016-03-15 19:16:28',0,0,0,'classic','01','mobile','01','',0,'','',0),(10183,10182,10155,'2016-03-15 19:16:29','2016-03-24 11:27:24',1,0,0,'tftheme_WAR_tftheme','01','mobile','01','',8,'lfr-theme:regular:hide-dockbar=true\nlfr-theme:regular:show-link-user-personal-menu=true\nshowSiteName=true','',0),(10184,10182,10155,'2016-03-15 19:16:29','2016-03-15 20:51:23',0,0,0,'welcome_WAR_welcometheme','01','mobile','01','',2,'','',0),(10193,10192,10155,'2016-03-15 19:16:30','2016-03-15 19:16:30',1,0,0,'classic','01','mobile','01','',0,'','',0),(10194,10192,10155,'2016-03-15 19:16:30','2016-03-15 19:16:30',0,0,0,'classic','01','mobile','01','',0,'','',0),(10196,10195,10155,'2016-03-15 19:16:30','2016-03-15 19:16:30',1,0,0,'classic','01','mobile','01','',0,'','',0),(10197,10195,10155,'2016-03-15 19:16:30','2016-03-15 19:16:30',0,0,0,'classic','01','mobile','01','',0,'','',0),(10203,10202,10155,'2016-03-15 19:16:30','2016-03-15 19:19:28',1,0,0,'classic','01','mobile','01','',1,'','',0),(10204,10202,10155,'2016-03-15 19:16:30','2016-03-15 19:19:29',0,0,0,'classic','01','mobile','01','',1,'','',0),(10319,10318,10155,'2016-03-15 19:16:35','2016-03-15 19:16:36',1,0,0,'classic','01','mobile','01','',1,'','',0),(10320,10318,10155,'2016-03-15 19:16:35','2016-03-15 19:16:35',0,0,0,'classic','01','mobile','01','',0,'','',0),(10331,10330,10155,'2016-03-15 19:16:36','2016-03-15 19:16:37',1,0,0,'classic','01','mobile','01','',1,'','',0),(10332,10330,10155,'2016-03-15 19:16:36','2016-03-15 19:16:36',0,0,0,'classic','01','mobile','01','',0,'','',0),(10341,10340,10155,'2016-03-15 19:16:37','2016-03-15 19:16:38',1,0,0,'classic','01','mobile','01','',1,'','',0),(10342,10340,10155,'2016-03-15 19:16:37','2016-03-15 19:16:37',0,0,0,'classic','01','mobile','01','',0,'','',0),(10352,10351,10155,'2016-03-15 19:16:39','2016-03-15 19:16:43',1,0,0,'classic','01','mobile','01','',2,'','',0),(10353,10351,10155,'2016-03-15 19:16:39','2016-03-15 19:16:39',0,0,0,'classic','01','mobile','01','',0,'','',0),(10378,10377,10155,'2016-03-15 19:16:43','2016-03-15 19:16:47',1,0,0,'classic','01','mobile','01','',3,'','',0),(10379,10377,10155,'2016-03-15 19:16:43','2016-03-15 19:16:43',0,0,0,'classic','01','mobile','01','',0,'','',0),(11149,11148,10155,'2016-03-15 21:10:38','2016-03-15 21:10:40',1,0,0,'classic','01','mobile','01','',1,'','',0),(11150,11148,10155,'2016-03-15 21:10:38','2016-03-15 21:10:39',0,0,0,'classic','01','mobile','01','',0,'','',0),(11312,11311,10155,'2016-03-16 04:54:02','2016-03-16 04:54:16',1,0,0,'classic','01','mobile','01','',1,'','',0),(11313,11311,10155,'2016-03-16 04:54:02','2016-03-16 04:54:17',0,0,0,'classic','01','mobile','01','',1,'','',0),(11340,11339,10155,'2016-03-16 05:02:07','2016-03-19 14:00:07',1,0,0,'classic','01','mobile','01','',1,'','',0),(11341,11339,10155,'2016-03-16 05:02:07','2016-03-19 14:00:09',0,0,0,'classic','01','mobile','01','',1,'','',0),(11411,11410,10155,'2016-03-16 19:40:53','2016-03-16 19:41:06',1,0,0,'classic','01','mobile','01','',1,'','',0),(11412,11410,10155,'2016-03-16 19:40:53','2016-03-16 19:41:07',0,0,0,'classic','01','mobile','01','',1,'','',0),(11441,11440,10155,'2016-03-16 20:05:15','2016-03-16 20:05:45',1,0,0,'classic','01','mobile','01','',1,'','',0),(11442,11440,10155,'2016-03-16 20:05:15','2016-03-16 20:05:46',0,0,0,'classic','01','mobile','01','',1,'','',0),(11461,11460,10155,'2016-03-16 20:32:10','2016-03-16 20:32:23',1,0,0,'classic','01','mobile','01','',1,'','',0),(11462,11460,10155,'2016-03-16 20:32:10','2016-03-16 20:32:23',0,0,0,'classic','01','mobile','01','',1,'','',0),(11481,11480,10155,'2016-03-16 20:35:20','2016-03-16 20:35:32',1,0,0,'classic','01','mobile','01','',1,'','',0),(11482,11480,10155,'2016-03-16 20:35:20','2016-03-16 20:35:32',0,0,0,'classic','01','mobile','01','',1,'','',0),(11501,11500,10155,'2016-03-16 20:52:31','2016-03-16 20:52:49',1,0,0,'classic','01','mobile','01','',1,'','',0),(11502,11500,10155,'2016-03-16 20:52:31','2016-03-16 20:52:50',0,0,0,'classic','01','mobile','01','',1,'','',0),(11521,11520,10155,'2016-03-16 20:56:48','2016-03-16 20:57:57',1,0,0,'classic','01','mobile','01','',1,'','',0),(11522,11520,10155,'2016-03-16 20:56:48','2016-03-16 20:57:57',0,0,0,'classic','01','mobile','01','',1,'','',0),(11541,11540,10155,'2016-03-16 21:00:32','2016-03-16 21:00:43',1,0,0,'classic','01','mobile','01','',1,'','',0),(11542,11540,10155,'2016-03-16 21:00:32','2016-03-16 21:00:44',0,0,0,'classic','01','mobile','01','',1,'','',0);

/*Table structure for table `layoutsetbranch` */

DROP TABLE IF EXISTS `layoutsetbranch`;

CREATE TABLE `layoutsetbranch` (
  `layoutSetBranchId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `privateLayout` tinyint(4) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `master` tinyint(4) DEFAULT NULL,
  `logo` tinyint(4) DEFAULT NULL,
  `logoId` bigint(20) DEFAULT NULL,
  `themeId` varchar(75) DEFAULT NULL,
  `colorSchemeId` varchar(75) DEFAULT NULL,
  `wapThemeId` varchar(75) DEFAULT NULL,
  `wapColorSchemeId` varchar(75) DEFAULT NULL,
  `css` longtext,
  `settings_` longtext,
  `layoutSetPrototypeUuid` varchar(75) DEFAULT NULL,
  `layoutSetPrototypeLinkEnabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutSetBranchId`),
  UNIQUE KEY `IX_5FF18552` (`groupId`,`privateLayout`,`name`),
  KEY `IX_8FF5D6EA` (`groupId`),
  KEY `IX_C4079FD3` (`groupId`,`privateLayout`),
  KEY `IX_CCF0DA29` (`groupId`,`privateLayout`,`master`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `layoutsetbranch` */

/*Table structure for table `layoutsetprototype` */

DROP TABLE IF EXISTS `layoutsetprototype`;

CREATE TABLE `layoutsetprototype` (
  `uuid_` varchar(75) DEFAULT NULL,
  `layoutSetPrototypeId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `settings_` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`layoutSetPrototypeId`),
  KEY `IX_55F63D98` (`companyId`),
  KEY `IX_9178FC71` (`companyId`,`active_`),
  KEY `IX_C5D69B24` (`uuid_`),
  KEY `IX_D9FFCA84` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `layoutsetprototype` */

insert  into `layoutsetprototype`(`uuid_`,`layoutSetPrototypeId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`description`,`settings_`,`active_`) values ('b62be067-4697-4947-ab56-c7e2f4faac0c',10350,10155,10159,'','2016-03-15 19:16:39','2016-03-15 20:49:23','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Community Site</Name></root>','Site with Forums and Wiki','layoutsUpdateable=true\n',1),('e28dfbc9-acf5-4335-83bb-0c137c5d5489',10376,10155,10159,'','2016-03-15 19:16:43','2016-03-15 20:49:23','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Intranet Site</Name></root>','Site with Documents and News','layoutsUpdateable=true\n',1),('e277ac4e-c2f1-4541-a328-b42d932f8a1a',11147,10155,10159,'','2016-03-15 21:10:38','2016-03-15 21:10:40','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Tf Theme</Name></root>','','layoutsUpdateable=true\n',1);

/*Table structure for table `listtype` */

DROP TABLE IF EXISTS `listtype`;

CREATE TABLE `listtype` (
  `listTypeId` int(11) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`listTypeId`),
  KEY `IX_2932DD37` (`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `listtype` */

insert  into `listtype`(`listTypeId`,`name`,`type_`) values (10000,'billing','com.liferay.portal.model.Account.address'),(10001,'other','com.liferay.portal.model.Account.address'),(10002,'p-o-box','com.liferay.portal.model.Account.address'),(10003,'shipping','com.liferay.portal.model.Account.address'),(10004,'email-address','com.liferay.portal.model.Account.emailAddress'),(10005,'email-address-2','com.liferay.portal.model.Account.emailAddress'),(10006,'email-address-3','com.liferay.portal.model.Account.emailAddress'),(10007,'fax','com.liferay.portal.model.Account.phone'),(10008,'local','com.liferay.portal.model.Account.phone'),(10009,'other','com.liferay.portal.model.Account.phone'),(10010,'toll-free','com.liferay.portal.model.Account.phone'),(10011,'tty','com.liferay.portal.model.Account.phone'),(10012,'intranet','com.liferay.portal.model.Account.website'),(10013,'public','com.liferay.portal.model.Account.website'),(11000,'business','com.liferay.portal.model.Contact.address'),(11001,'other','com.liferay.portal.model.Contact.address'),(11002,'personal','com.liferay.portal.model.Contact.address'),(11003,'email-address','com.liferay.portal.model.Contact.emailAddress'),(11004,'email-address-2','com.liferay.portal.model.Contact.emailAddress'),(11005,'email-address-3','com.liferay.portal.model.Contact.emailAddress'),(11006,'business','com.liferay.portal.model.Contact.phone'),(11007,'business-fax','com.liferay.portal.model.Contact.phone'),(11008,'mobile-phone','com.liferay.portal.model.Contact.phone'),(11009,'other','com.liferay.portal.model.Contact.phone'),(11010,'pager','com.liferay.portal.model.Contact.phone'),(11011,'personal','com.liferay.portal.model.Contact.phone'),(11012,'personal-fax','com.liferay.portal.model.Contact.phone'),(11013,'tty','com.liferay.portal.model.Contact.phone'),(11014,'dr','com.liferay.portal.model.Contact.prefix'),(11015,'mr','com.liferay.portal.model.Contact.prefix'),(11016,'mrs','com.liferay.portal.model.Contact.prefix'),(11017,'ms','com.liferay.portal.model.Contact.prefix'),(11020,'ii','com.liferay.portal.model.Contact.suffix'),(11021,'iii','com.liferay.portal.model.Contact.suffix'),(11022,'iv','com.liferay.portal.model.Contact.suffix'),(11023,'jr','com.liferay.portal.model.Contact.suffix'),(11024,'phd','com.liferay.portal.model.Contact.suffix'),(11025,'sr','com.liferay.portal.model.Contact.suffix'),(11026,'blog','com.liferay.portal.model.Contact.website'),(11027,'business','com.liferay.portal.model.Contact.website'),(11028,'other','com.liferay.portal.model.Contact.website'),(11029,'personal','com.liferay.portal.model.Contact.website'),(12000,'billing','com.liferay.portal.model.Organization.address'),(12001,'other','com.liferay.portal.model.Organization.address'),(12002,'p-o-box','com.liferay.portal.model.Organization.address'),(12003,'shipping','com.liferay.portal.model.Organization.address'),(12004,'email-address','com.liferay.portal.model.Organization.emailAddress'),(12005,'email-address-2','com.liferay.portal.model.Organization.emailAddress'),(12006,'email-address-3','com.liferay.portal.model.Organization.emailAddress'),(12007,'fax','com.liferay.portal.model.Organization.phone'),(12008,'local','com.liferay.portal.model.Organization.phone'),(12009,'other','com.liferay.portal.model.Organization.phone'),(12010,'toll-free','com.liferay.portal.model.Organization.phone'),(12011,'tty','com.liferay.portal.model.Organization.phone'),(12012,'administrative','com.liferay.portal.model.Organization.service'),(12013,'contracts','com.liferay.portal.model.Organization.service'),(12014,'donation','com.liferay.portal.model.Organization.service'),(12015,'retail','com.liferay.portal.model.Organization.service'),(12016,'training','com.liferay.portal.model.Organization.service'),(12017,'full-member','com.liferay.portal.model.Organization.status'),(12018,'provisional-member','com.liferay.portal.model.Organization.status'),(12019,'intranet','com.liferay.portal.model.Organization.website'),(12020,'public','com.liferay.portal.model.Organization.website');

/*Table structure for table `lock_` */

DROP TABLE IF EXISTS `lock_`;

CREATE TABLE `lock_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `lockId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `className` varchar(75) DEFAULT NULL,
  `key_` varchar(200) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `inheritable` tinyint(4) DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`lockId`),
  UNIQUE KEY `IX_228562AD` (`className`,`key_`),
  KEY `IX_E3F1286B` (`expirationDate`),
  KEY `IX_13C5CD3A` (`uuid_`),
  KEY `IX_2C418EAE` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lock_` */

/*Table structure for table `marketplace_app` */

DROP TABLE IF EXISTS `marketplace_app`;

CREATE TABLE `marketplace_app` (
  `uuid_` varchar(75) DEFAULT NULL,
  `appId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remoteAppId` bigint(20) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `description` longtext,
  `category` varchar(75) DEFAULT NULL,
  `iconURL` longtext,
  `version` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`appId`),
  KEY `IX_94A7EF25` (`category`),
  KEY `IX_865B7BD5` (`companyId`),
  KEY `IX_20F14D93` (`remoteAppId`),
  KEY `IX_3E667FE1` (`uuid_`),
  KEY `IX_A7807DA7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `marketplace_app` */

/*Table structure for table `marketplace_module` */

DROP TABLE IF EXISTS `marketplace_module`;

CREATE TABLE `marketplace_module` (
  `uuid_` varchar(75) DEFAULT NULL,
  `moduleId` bigint(20) NOT NULL,
  `appId` bigint(20) DEFAULT NULL,
  `contextName` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`moduleId`),
  KEY `IX_7DC16D26` (`appId`),
  KEY `IX_C6938724` (`appId`,`contextName`),
  KEY `IX_F2F1E964` (`contextName`),
  KEY `IX_A7EFD80E` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `marketplace_module` */

/*Table structure for table `mbban` */

DROP TABLE IF EXISTS `mbban`;

CREATE TABLE `mbban` (
  `uuid_` varchar(75) DEFAULT NULL,
  `banId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `banUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`banId`),
  UNIQUE KEY `IX_8ABC4E3B` (`groupId`,`banUserId`),
  UNIQUE KEY `IX_2A3B68F6` (`uuid_`,`groupId`),
  KEY `IX_69951A25` (`banUserId`),
  KEY `IX_5C3FF12A` (`groupId`),
  KEY `IX_48814BBA` (`userId`),
  KEY `IX_8A13C634` (`uuid_`),
  KEY `IX_4F841574` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mbban` */

/*Table structure for table `mbcategory` */

DROP TABLE IF EXISTS `mbcategory`;

CREATE TABLE `mbcategory` (
  `uuid_` varchar(75) DEFAULT NULL,
  `categoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentCategoryId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `displayStyle` varchar(75) DEFAULT NULL,
  `threadCount` int(11) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `lastPostDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  UNIQUE KEY `IX_F7D28C2F` (`uuid_`,`groupId`),
  KEY `IX_BC735DCF` (`companyId`),
  KEY `IX_E15A5DB5` (`companyId`,`status`),
  KEY `IX_BB870C11` (`groupId`),
  KEY `IX_ED292508` (`groupId`,`parentCategoryId`),
  KEY `IX_C295DBEE` (`groupId`,`parentCategoryId`,`status`),
  KEY `IX_DA84A9F7` (`groupId`,`status`),
  KEY `IX_C2626EDB` (`uuid_`),
  KEY `IX_13DF4E6D` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mbcategory` */

/*Table structure for table `mbdiscussion` */

DROP TABLE IF EXISTS `mbdiscussion`;

CREATE TABLE `mbdiscussion` (
  `uuid_` varchar(75) DEFAULT NULL,
  `discussionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `threadId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`discussionId`),
  UNIQUE KEY `IX_33A4DE38` (`classNameId`,`classPK`),
  UNIQUE KEY `IX_B5CA2DC` (`threadId`),
  UNIQUE KEY `IX_F7AAC799` (`uuid_`,`groupId`),
  KEY `IX_79D0120B` (`classNameId`),
  KEY `IX_5477D431` (`uuid_`),
  KEY `IX_7E965757` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mbdiscussion` */

insert  into `mbdiscussion`(`uuid_`,`discussionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`threadId`) values ('3db1fdfb-f371-498c-9822-f38caa055bd8',10181,0,0,10159,'','2016-03-15 19:16:29','2016-03-15 19:16:29',10002,10176,10179),('7a86becf-f8d7-48e9-9011-4b79e7e3409a',10327,0,0,10159,'','2016-03-15 19:16:36','2016-03-15 19:16:36',10002,10321,10324),('9087224a-68b4-492a-9b75-e981b9503cbe',10338,0,0,10159,'','2016-03-15 19:16:37','2016-03-15 19:16:37',10002,10333,10336),('74537420-52d4-4cde-94d4-e021b414e8a8',10348,0,0,10159,'','2016-03-15 19:16:38','2016-03-15 19:16:38',10002,10343,10346),('8230cc46-9a21-45a0-8fec-12677e1d07d5',10367,0,0,10159,'','2016-03-15 19:16:41','2016-03-15 19:16:41',10002,10362,10365),('b1253a71-4169-4ec6-a8a0-0a17404cf536',10375,0,0,10159,'','2016-03-15 19:16:42','2016-03-15 19:16:42',10002,10370,10373),('cb0fb229-5177-47e8-94de-12c6fef1ffd9',10393,0,0,10159,'','2016-03-15 19:16:43','2016-03-15 19:16:43',10002,10388,10391),('ac333d32-d957-4882-bb6e-624fea6cb7f2',10402,0,0,10159,'','2016-03-15 19:16:45','2016-03-15 19:16:45',10002,10397,10400),('dc2a99a0-3254-4e15-afbe-1f2e40a59b90',10410,0,0,10159,'','2016-03-15 19:16:46','2016-03-15 19:16:46',10002,10405,10408),('c4f42a90-0d7f-43aa-bd1e-7a64fe363e26',10532,0,0,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',10011,10526,10530),('59cee6f6-a674-41fe-a616-b9df8e176676',10541,0,0,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',10011,10535,10539),('7d853303-edde-47d7-b943-6acb37c9671e',10551,0,0,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10545,10549),('541d4036-f8d5-414a-a768-541fdb9b91d5',10561,0,0,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10554,10559),('94c7fa57-52aa-4d11-9474-0d7c68801b7a',10572,0,0,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10566,10570),('061aaafb-e8e5-4fa4-a093-47b7e96f5661',10583,0,0,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10576,10580),('a6992b35-3087-4580-afa1-20ceaa1622fc',10643,0,0,10199,'Test Test','2016-03-15 19:19:28','2016-03-15 19:19:28',10002,10638,10641),('e3ff332c-38e8-43c5-82c7-9c6fbebf01a8',10649,0,0,10199,'Test Test','2016-03-15 19:19:29','2016-03-15 19:19:29',10002,10644,10647),('767a7e08-df06-449b-9daa-849bf723e9d8',10771,0,0,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10011,10765,10769),('2e11402e-c260-4e16-9f0a-e97ecaefd015',10780,0,0,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10011,10774,10778),('a717243e-927f-46a1-9755-3ea9147d9bb7',10789,0,0,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10011,10783,10787),('c2047ad8-e618-45a0-bf13-2c9e042486f9',10798,0,0,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10011,10792,10796),('d30564db-18e5-401d-bf7d-2a142de87bc1',10807,0,0,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',10011,10801,10805),('7cd486de-4ac2-4a07-a364-c407d9dea2a9',10816,0,0,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',10011,10810,10814),('a20fd16c-ed47-484e-bb03-51370a411dfe',10825,0,0,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',10011,10819,10823),('90c6184c-277a-4868-be16-50437afcbeeb',10834,0,0,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10011,10828,10832),('b1b71479-7bb5-4835-b392-89e5096f1d0e',10843,0,0,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10011,10837,10841),('d2f21723-286a-4123-8238-29f155774346',10852,0,0,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10011,10846,10850),('110a26c0-1f1b-4d7a-8640-a2fe7c8d81f8',10861,0,0,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10011,10855,10859),('ce3fb455-1dbc-4aad-9b32-dc32df57f101',11169,0,0,10159,'','2016-03-15 21:10:38','2016-03-15 21:10:38',10109,11163,11167),('7ff67f8c-890d-47aa-b2de-14a024c4d3c6',11178,0,0,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',10109,11172,11176),('cff3cbc4-67fe-4a06-88c0-646d296c0eef',11186,0,0,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',10109,11180,11184),('d9479935-6c80-4d73-9a06-b418e1b0a34b',11194,0,0,10159,'','2016-03-15 21:10:40','2016-03-15 21:10:40',10002,11189,11192),('83450f46-8492-4847-b4b8-0dffe67e2412',11320,0,0,11308,'Gautam Sharma','2016-03-16 04:54:17','2016-03-16 04:54:17',10002,11315,11318),('6c60b5e1-b7da-4129-979b-69cb2cdcdff7',11326,0,0,11308,'Gautam Sharma','2016-03-16 04:54:17','2016-03-16 04:54:17',10002,11321,11324),('b18187ec-c8a2-41e4-b19f-572a1dd540e5',11419,0,0,11407,'Primarry Investor1','2016-03-16 19:41:06','2016-03-16 19:41:06',10002,11414,11417),('43620dfe-1917-4c2c-acef-32ef1f26101d',11425,0,0,11407,'Primarry Investor1','2016-03-16 19:41:07','2016-03-16 19:41:07',10002,11420,11423),('e26418c8-882b-4bd7-bb74-0610cab0b3ff',11449,0,0,11437,'Primary  Investor2','2016-03-16 20:05:45','2016-03-16 20:05:45',10002,11444,11447),('5eb06590-3a8b-4de6-827b-d07087cbcd82',11455,0,0,11437,'Primary  Investor2','2016-03-16 20:05:46','2016-03-16 20:05:46',10002,11450,11453),('df5b11f2-a4fd-4510-849f-a7bd657bc17f',11469,0,0,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',10002,11464,11467),('aec850d4-31e7-4f8d-a0b2-b004c0fc258a',11475,0,0,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',10002,11470,11473),('a7db4ec6-98f1-4dfb-a0a5-21904f54a24d',11489,0,0,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',10002,11484,11487),('e28cc996-2d13-46ad-b87b-ad5da343f547',11495,0,0,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',10002,11490,11493),('9879d298-4730-472a-b47f-7f77c7883c5e',11509,0,0,11497,'Pr Investor4','2016-03-16 20:52:49','2016-03-16 20:52:49',10002,11504,11507),('55687d18-e284-4e7e-b09a-4c5df61cf540',11515,0,0,11497,'Pr Investor4','2016-03-16 20:52:50','2016-03-16 20:52:50',10002,11510,11513),('ccc9a6c8-7a68-4934-a605-c9d69910e46c',11529,0,0,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',10002,11524,11527),('b88937c8-3929-4dd9-a070-38124cb8da9a',11535,0,0,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',10002,11530,11533),('0b3e24fa-1c15-4c92-b21b-4223c55414d5',11549,0,0,11537,'scf company2','2016-03-16 21:00:43','2016-03-16 21:00:43',10002,11544,11547),('2a12dcf3-6449-46d1-846a-39cb0457f4fd',11555,0,0,11537,'scf company2','2016-03-16 21:00:44','2016-03-16 21:00:44',10002,11550,11553),('1c89fa02-a4db-4ff7-857a-896a7a1e09e6',11712,0,0,11336,'dhanush kodi','2016-03-19 14:00:08','2016-03-19 14:00:08',10002,11707,11710),('989e0d7f-5529-4ba0-8f22-28322654744a',11718,0,0,11336,'dhanush kodi','2016-03-19 14:00:09','2016-03-19 14:00:09',10002,11713,11716),('257e3bea-d088-458f-90a0-3a46426f4748',11835,0,0,10199,'Whitehall Admin','2016-03-19 20:21:29','2016-03-19 20:21:29',10011,11829,11833),('9c5b479c-2dd0-4743-a216-bfeed3de2b60',12173,0,0,10199,'Whitehall Admin','2016-03-21 21:13:51','2016-03-21 21:13:51',10109,12167,12171),('96a3c862-a6ac-4cb4-b458-74a91b92c1ef',12199,0,0,10199,'Whitehall Admin','2016-03-21 21:13:53','2016-03-21 21:13:53',10109,12193,12197),('6ef898f2-7e6e-4819-8794-c3b656ab11a0',12225,0,0,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',10109,12219,12223),('9265db06-d1d0-4e72-94bb-ea7eda0b733c',12247,0,0,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',10109,12241,12245),('099b31e7-b6b9-46bc-8e1b-d2f4334e9672',12265,0,0,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',10109,12259,12263),('25fa2550-71e9-47cf-b5f0-3b81794544e5',12287,0,0,10199,'Whitehall Admin','2016-03-21 21:13:55','2016-03-21 21:13:55',10109,12281,12285),('8dafb546-1bef-4cdc-ba34-e8f349c97b7b',12506,0,0,10199,'Whitehall Admin','2016-03-24 11:27:25','2016-03-24 11:27:25',10002,12501,12504);

/*Table structure for table `mbmailinglist` */

DROP TABLE IF EXISTS `mbmailinglist`;

CREATE TABLE `mbmailinglist` (
  `uuid_` varchar(75) DEFAULT NULL,
  `mailingListId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `inProtocol` varchar(75) DEFAULT NULL,
  `inServerName` varchar(75) DEFAULT NULL,
  `inServerPort` int(11) DEFAULT NULL,
  `inUseSSL` tinyint(4) DEFAULT NULL,
  `inUserName` varchar(75) DEFAULT NULL,
  `inPassword` varchar(75) DEFAULT NULL,
  `inReadInterval` int(11) DEFAULT NULL,
  `outEmailAddress` varchar(75) DEFAULT NULL,
  `outCustom` tinyint(4) DEFAULT NULL,
  `outServerName` varchar(75) DEFAULT NULL,
  `outServerPort` int(11) DEFAULT NULL,
  `outUseSSL` tinyint(4) DEFAULT NULL,
  `outUserName` varchar(75) DEFAULT NULL,
  `outPassword` varchar(75) DEFAULT NULL,
  `allowAnonymous` tinyint(4) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`mailingListId`),
  UNIQUE KEY `IX_76CE9CDD` (`groupId`,`categoryId`),
  UNIQUE KEY `IX_E858F170` (`uuid_`,`groupId`),
  KEY `IX_BFEB984F` (`active_`),
  KEY `IX_4115EC7A` (`uuid_`),
  KEY `IX_FC61676E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mbmailinglist` */

/*Table structure for table `mbmessage` */

DROP TABLE IF EXISTS `mbmessage`;

CREATE TABLE `mbmessage` (
  `uuid_` varchar(75) DEFAULT NULL,
  `messageId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `threadId` bigint(20) DEFAULT NULL,
  `rootMessageId` bigint(20) DEFAULT NULL,
  `parentMessageId` bigint(20) DEFAULT NULL,
  `subject` varchar(75) DEFAULT NULL,
  `body` longtext,
  `format` varchar(75) DEFAULT NULL,
  `anonymous` tinyint(4) DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `allowPingbacks` tinyint(4) DEFAULT NULL,
  `answer` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`messageId`),
  UNIQUE KEY `IX_8D12316E` (`uuid_`,`groupId`),
  KEY `IX_51A8D44D` (`classNameId`,`classPK`),
  KEY `IX_F6687633` (`classNameId`,`classPK`,`status`),
  KEY `IX_B1432D30` (`companyId`),
  KEY `IX_1AD93C16` (`companyId`,`status`),
  KEY `IX_5B153FB2` (`groupId`),
  KEY `IX_1073AB9F` (`groupId`,`categoryId`),
  KEY `IX_4257DB85` (`groupId`,`categoryId`,`status`),
  KEY `IX_B674AB58` (`groupId`,`categoryId`,`threadId`),
  KEY `IX_CBFDBF0A` (`groupId`,`categoryId`,`threadId`,`answer`),
  KEY `IX_385E123E` (`groupId`,`categoryId`,`threadId`,`status`),
  KEY `IX_ED39AC98` (`groupId`,`status`),
  KEY `IX_8EB8C5EC` (`groupId`,`userId`),
  KEY `IX_377858D2` (`groupId`,`userId`,`status`),
  KEY `IX_75B95071` (`threadId`),
  KEY `IX_9D7C3B23` (`threadId`,`answer`),
  KEY `IX_A7038CD7` (`threadId`,`parentMessageId`),
  KEY `IX_9DC8E57` (`threadId`,`status`),
  KEY `IX_7A040C32` (`userId`),
  KEY `IX_59F9CE5C` (`userId`,`classNameId`),
  KEY `IX_ABEB6D07` (`userId`,`classNameId`,`classPK`),
  KEY `IX_4A4BB4ED` (`userId`,`classNameId`,`classPK`,`status`),
  KEY `IX_3321F142` (`userId`,`classNameId`,`status`),
  KEY `IX_C57B16BC` (`uuid_`),
  KEY `IX_57CA9FEC` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mbmessage` */

insert  into `mbmessage`(`uuid_`,`messageId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`categoryId`,`threadId`,`rootMessageId`,`parentMessageId`,`subject`,`body`,`format`,`anonymous`,`priority`,`allowPingbacks`,`answer`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('33bf4f21-2b77-4ab2-add3-087be757fd8b',10178,10173,10155,10159,'','2016-03-15 19:16:29','2016-03-15 19:16:29',10002,10176,-1,10179,10178,0,'10176','10176','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:16:29'),('17e6fae1-709c-465f-8669-2f39a4cb0524',10323,10318,10155,10159,'','2016-03-15 19:16:36','2016-03-15 19:16:36',10002,10321,-1,10324,10323,0,'10321','10321','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:16:36'),('213787ae-278a-44a7-b6fa-02d0b413358a',10335,10330,10155,10159,'','2016-03-15 19:16:37','2016-03-15 19:16:37',10002,10333,-1,10336,10335,0,'10333','10333','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:16:37'),('8bb9f24b-942c-44a8-b6db-61698c108e49',10345,10340,10155,10159,'','2016-03-15 19:16:38','2016-03-15 19:16:38',10002,10343,-1,10346,10345,0,'10343','10343','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:16:38'),('7a6ede7b-19d6-4474-bc24-65ae3571b3a2',10364,10351,10155,10159,'','2016-03-15 19:16:41','2016-03-15 19:16:41',10002,10362,-1,10365,10364,0,'10362','10362','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:16:41'),('09b40a6f-5621-4ff4-81df-109b8b0f5742',10372,10351,10155,10159,'','2016-03-15 19:16:42','2016-03-15 19:16:42',10002,10370,-1,10373,10372,0,'10370','10370','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:16:42'),('2236a30d-11ad-4d32-8d9a-97e715daf6df',10390,10377,10155,10159,'','2016-03-15 19:16:43','2016-03-15 19:16:43',10002,10388,-1,10391,10390,0,'10388','10388','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:16:43'),('5b7d3909-7bf0-47a1-acda-98a81284f111',10399,10377,10155,10159,'','2016-03-15 19:16:45','2016-03-15 19:16:45',10002,10397,-1,10400,10399,0,'10397','10397','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:16:45'),('53840070-809d-4281-ab27-97a5fdc042f4',10407,10377,10155,10159,'','2016-03-15 19:16:46','2016-03-15 19:16:46',10002,10405,-1,10408,10407,0,'10405','10405','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:16:46'),('12db7bda-3810-42b5-9ab9-237bd90d88e3',10529,10182,10155,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',10011,10526,-1,10530,10529,0,'10526','10526','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:18:21'),('8e54ef5e-f024-4a9c-8acd-b60055cbfab8',10538,10182,10155,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',10011,10535,-1,10539,10538,0,'10535','10535','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:18:21'),('20ecfcd8-b59f-43f7-bf25-d083ad494b88',10548,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10545,-1,10549,10548,0,'10545','10545','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:18:22'),('c364fa81-4157-44b7-a767-b39721d3d4d5',10558,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10554,-1,10559,10558,0,'10554','10554','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:18:22'),('f7362a62-efa1-43e3-b21c-6fee395d14bb',10569,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10566,-1,10570,10569,0,'10566','10566','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:18:22'),('b015cb9e-1427-4951-9558-3a59c1ab5f5a',10579,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',10011,10576,-1,10580,10579,0,'10576','10576','bbcode',1,0,0,0,0,10159,'','2016-03-15 19:18:22'),('02de9b62-d939-44a5-b59e-bc727dd36525',10640,10202,10155,10199,'Test Test','2016-03-15 19:19:28','2016-03-15 19:19:28',10002,10638,-1,10641,10640,0,'10638','10638','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 19:19:28'),('a7052c0d-43bc-4655-ac30-d9479161cfea',10646,10202,10155,10199,'Test Test','2016-03-15 19:19:29','2016-03-15 19:19:29',10002,10644,-1,10647,10646,0,'10644','10644','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 19:19:29'),('8ed6ae3f-cdea-451d-986f-62595afa570e',10768,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10011,10765,-1,10769,10768,0,'10765','10765','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:49'),('2b154e5a-bbd3-44d8-a2b1-dbefe6bc9567',10777,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10011,10774,-1,10778,10777,0,'10774','10774','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:49'),('963f6eeb-4f53-4a0c-b7a3-3837af80632b',10786,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10011,10783,-1,10787,10786,0,'10783','10783','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:49'),('a9763657-c9cc-4a3c-bafc-dc6cc2d13053',10795,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',10011,10792,-1,10796,10795,0,'10792','10792','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:49'),('49dfeb16-9ba3-4d7a-b1e7-87b464bd79d5',10804,10182,10155,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',10011,10801,-1,10805,10804,0,'10801','10801','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:50'),('efc87aca-a336-4763-826f-bfc0d677f694',10813,10182,10155,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',10011,10810,-1,10814,10813,0,'10810','10810','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:50'),('2b52d739-2de3-4127-a47c-1a45e0606d02',10822,10182,10155,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',10011,10819,-1,10823,10822,0,'10819','10819','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:50'),('f9f37226-2370-4269-b5f1-66bea4d1380b',10831,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10011,10828,-1,10832,10831,0,'10828','10828','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:53'),('775ac69c-c65c-4f7d-a965-3d246446f7e9',10840,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10011,10837,-1,10841,10840,0,'10837','10837','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:53'),('edd405d9-1483-483e-a454-0a8437412f6a',10849,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10011,10846,-1,10850,10849,0,'10846','10846','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:53'),('73178664-9eb7-45e9-a7e6-eeefe3da8101',10858,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',10011,10855,-1,10859,10858,0,'10855','10855','bbcode',0,0,0,0,0,10199,'Test Test','2016-03-15 20:50:53'),('c4fc4dcf-6742-4fae-9b64-e020c53c9794',11166,11148,10155,10159,'','2016-03-15 21:10:38','2016-03-15 21:10:38',10109,11163,-1,11167,11166,0,'11163','11163','bbcode',1,0,0,0,0,10159,'','2016-03-15 21:10:38'),('3d5a86b9-23dc-4066-b6e0-4c932629278f',11175,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',10109,11172,-1,11176,11175,0,'11172','11172','bbcode',1,0,0,0,0,10159,'','2016-03-15 21:10:39'),('bf11b8cb-63ce-492e-9118-87db5c61d76b',11183,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',10109,11180,-1,11184,11183,0,'11180','11180','bbcode',1,0,0,0,0,10159,'','2016-03-15 21:10:39'),('a164d911-eed4-4302-b8f2-270a011653fe',11191,11148,10155,10159,'','2016-03-15 21:10:40','2016-03-15 21:10:40',10002,11189,-1,11192,11191,0,'11189','11189','bbcode',1,0,0,0,0,10159,'','2016-03-15 21:10:40'),('98233578-124c-4e81-91a4-b2116f0726de',11317,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:16','2016-03-16 04:54:16',10002,11315,-1,11318,11317,0,'11315','11315','bbcode',0,0,0,0,0,11308,'Gautam Sharma','2016-03-16 04:54:16'),('cb0ebcbb-baac-4d52-a406-848a6a4d2ae8',11323,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:17','2016-03-16 04:54:17',10002,11321,-1,11324,11323,0,'11321','11321','bbcode',0,0,0,0,0,11308,'Gautam Sharma','2016-03-16 04:54:17'),('2e0a7f58-dec6-4dcc-b05c-7dc1b04f1f6e',11416,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:06','2016-03-16 19:41:06',10002,11414,-1,11417,11416,0,'11414','11414','bbcode',0,0,0,0,0,11407,'Primarry Investor1','2016-03-16 19:41:06'),('1f6b8232-12fe-41b7-b79e-3ecd1be3ac74',11422,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:07','2016-03-16 19:41:07',10002,11420,-1,11423,11422,0,'11420','11420','bbcode',0,0,0,0,0,11407,'Primarry Investor1','2016-03-16 19:41:07'),('cdf476a0-64ff-480f-8f64-0bc625d0fc91',11446,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:45','2016-03-16 20:05:45',10002,11444,-1,11447,11446,0,'11444','11444','bbcode',0,0,0,0,0,11437,'Primary  Investor2','2016-03-16 20:05:45'),('e78e0b12-2e95-4285-80c9-4efdf47c2a39',11452,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:46','2016-03-16 20:05:46',10002,11450,-1,11453,11452,0,'11450','11450','bbcode',0,0,0,0,0,11437,'Primary  Investor2','2016-03-16 20:05:46'),('a23fc466-6910-4d6a-8888-704eb13034e5',11466,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',10002,11464,-1,11467,11466,0,'11464','11464','bbcode',0,0,0,0,0,11457,'seller whitehall2','2016-03-16 20:32:23'),('44e23dee-4d26-4d45-bdbb-8a86408ceb2d',11472,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',10002,11470,-1,11473,11472,0,'11470','11470','bbcode',0,0,0,0,0,11457,'seller whitehall2','2016-03-16 20:32:23'),('831f386a-bf87-4cdc-aa7d-d3d71f39a063',11486,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',10002,11484,-1,11487,11486,0,'11484','11484','bbcode',0,0,0,0,0,11477,'Pr Investor3','2016-03-16 20:35:32'),('067e8e10-76d1-42b4-867f-74a2d0bbd3db',11492,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',10002,11490,-1,11493,11492,0,'11490','11490','bbcode',0,0,0,0,0,11477,'Pr Investor3','2016-03-16 20:35:32'),('0b745cf7-3624-4835-ba2e-38a59a91f3bb',11506,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:49','2016-03-16 20:52:49',10002,11504,-1,11507,11506,0,'11504','11504','bbcode',0,0,0,0,0,11497,'Pr Investor4','2016-03-16 20:52:49'),('ddcba205-be7a-472f-876c-16705ce77cad',11512,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:50','2016-03-16 20:52:50',10002,11510,-1,11513,11512,0,'11510','11510','bbcode',0,0,0,0,0,11497,'Pr Investor4','2016-03-16 20:52:50'),('a7693cde-b646-4f6a-8d40-c805b09f53ec',11526,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',10002,11524,-1,11527,11526,0,'11524','11524','bbcode',0,0,0,0,0,11517,'seller whitehall3','2016-03-16 20:57:57'),('08780dfa-2f6e-4250-bb47-7d9de39be670',11532,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',10002,11530,-1,11533,11532,0,'11530','11530','bbcode',0,0,0,0,0,11517,'seller whitehall3','2016-03-16 20:57:57'),('0aaf9bfe-f395-4092-804f-fc837ec7434f',11546,11540,10155,11537,'scf company2','2016-03-16 21:00:43','2016-03-16 21:00:43',10002,11544,-1,11547,11546,0,'11544','11544','bbcode',0,0,0,0,0,11537,'scf company2','2016-03-16 21:00:43'),('9f6bda41-5419-4598-8af9-291ae16ef58e',11552,11540,10155,11537,'scf company2','2016-03-16 21:00:44','2016-03-16 21:00:44',10002,11550,-1,11553,11552,0,'11550','11550','bbcode',0,0,0,0,0,11537,'scf company2','2016-03-16 21:00:44'),('259ee396-891e-49d0-bf7d-0e242a04b96a',11709,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:08','2016-03-19 14:00:08',10002,11707,-1,11710,11709,0,'11707','11707','bbcode',0,0,0,0,0,11336,'dhanush kodi','2016-03-19 14:00:08'),('f3627f0f-4ae2-4103-85a5-e1e4a67a7054',11715,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:09','2016-03-19 14:00:09',10002,11713,-1,11716,11715,0,'11713','11713','bbcode',0,0,0,0,0,11336,'dhanush kodi','2016-03-19 14:00:09'),('ce72dc07-8cf8-4e20-9ca6-d86b2ee236e4',11832,10182,10155,10199,'Whitehall Admin','2016-03-19 20:21:29','2016-03-19 20:21:29',10011,11829,-1,11833,11832,0,'11829','11829','bbcode',0,0,0,0,0,10199,'Whitehall Admin','2016-03-19 20:21:29'),('fa19e74f-86ae-4e4c-99fa-dc098275c0d1',12170,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:51','2016-03-21 21:13:51',10109,12167,-1,12171,12170,0,'12167','12167','bbcode',0,0,0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:51'),('b0c7cd62-395a-4761-a376-40c1eccefc12',12196,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:53','2016-03-21 21:13:53',10109,12193,-1,12197,12196,0,'12193','12193','bbcode',0,0,0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:53'),('1e71f3e6-f2ba-4528-8022-47da22231a66',12222,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',10109,12219,-1,12223,12222,0,'12219','12219','bbcode',0,0,0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:54'),('804047ac-2c8e-4e97-bf5d-e39d9ae865c0',12244,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',10109,12241,-1,12245,12244,0,'12241','12241','bbcode',0,0,0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:54'),('556a582a-566a-4bfb-ad04-d39f567db159',12262,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',10109,12259,-1,12263,12262,0,'12259','12259','bbcode',0,0,0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:54'),('d5bb5efb-427d-4d48-9aba-e97f5eddb963',12284,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:55','2016-03-21 21:13:55',10109,12281,-1,12285,12284,0,'12281','12281','bbcode',0,0,0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:55'),('27868ea2-009d-4bac-96ea-29eb4c57683a',12503,10182,10155,10199,'Whitehall Admin','2016-03-24 11:27:24','2016-03-24 11:27:24',10002,12501,-1,12504,12503,0,'12501','12501','bbcode',0,0,0,0,0,10199,'Whitehall Admin','2016-03-24 11:27:25');

/*Table structure for table `mbstatsuser` */

DROP TABLE IF EXISTS `mbstatsuser`;

CREATE TABLE `mbstatsuser` (
  `statsUserId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `lastPostDate` datetime DEFAULT NULL,
  PRIMARY KEY (`statsUserId`),
  UNIQUE KEY `IX_9168E2C9` (`groupId`,`userId`),
  KEY `IX_A00A898F` (`groupId`),
  KEY `IX_D33A5445` (`groupId`,`userId`,`messageCount`),
  KEY `IX_847F92B5` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mbstatsuser` */

/*Table structure for table `mbthread` */

DROP TABLE IF EXISTS `mbthread`;

CREATE TABLE `mbthread` (
  `uuid_` varchar(75) DEFAULT NULL,
  `threadId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `rootMessageId` bigint(20) DEFAULT NULL,
  `rootMessageUserId` bigint(20) DEFAULT NULL,
  `messageCount` int(11) DEFAULT NULL,
  `viewCount` int(11) DEFAULT NULL,
  `lastPostByUserId` bigint(20) DEFAULT NULL,
  `lastPostDate` datetime DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `question` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`threadId`),
  UNIQUE KEY `IX_3A200B7B` (`uuid_`,`groupId`),
  KEY `IX_41F6DC8A` (`categoryId`,`priority`),
  KEY `IX_95C0EA45` (`groupId`),
  KEY `IX_9A2D11B2` (`groupId`,`categoryId`),
  KEY `IX_50F1904A` (`groupId`,`categoryId`,`lastPostDate`),
  KEY `IX_485F7E98` (`groupId`,`categoryId`,`status`),
  KEY `IX_E1E7142B` (`groupId`,`status`),
  KEY `IX_AEDD9CB5` (`lastPostDate`,`priority`),
  KEY `IX_CC993ECB` (`rootMessageId`),
  KEY `IX_7E264A0F` (`uuid_`),
  KEY `IX_F8CA2AB9` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mbthread` */

insert  into `mbthread`(`uuid_`,`threadId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`categoryId`,`rootMessageId`,`rootMessageUserId`,`messageCount`,`viewCount`,`lastPostByUserId`,`lastPostDate`,`priority`,`question`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('1e6668c1-a09d-4c0e-8955-1e645955024d',10179,10173,10155,10159,'','2016-03-15 19:16:29','2016-03-15 19:16:29',-1,10178,10159,1,0,0,'2016-03-15 19:16:29',0,0,0,10159,'','2016-03-15 19:16:29'),('66f25281-2aa2-44c1-85e3-83b6107c187e',10324,10318,10155,10159,'','2016-03-15 19:16:36','2016-03-15 19:16:36',-1,10323,10159,1,0,0,'2016-03-15 19:16:36',0,0,0,10159,'','2016-03-15 19:16:36'),('8d6f1f31-3edf-483b-8051-8f1e155cdb0e',10336,10330,10155,10159,'','2016-03-15 19:16:37','2016-03-15 19:16:37',-1,10335,10159,1,0,0,'2016-03-15 19:16:37',0,0,0,10159,'','2016-03-15 19:16:37'),('e38bc342-5b0c-49e6-92b2-afbd1ecb1c3c',10346,10340,10155,10159,'','2016-03-15 19:16:38','2016-03-15 19:16:38',-1,10345,10159,1,0,0,'2016-03-15 19:16:38',0,0,0,10159,'','2016-03-15 19:16:38'),('f35cffa5-f9b1-42b6-9da6-7948dcd5e57d',10365,10351,10155,10159,'','2016-03-15 19:16:41','2016-03-15 19:16:41',-1,10364,10159,1,0,0,'2016-03-15 19:16:41',0,0,0,10159,'','2016-03-15 19:16:41'),('f72313ea-d520-4ad6-bcc0-84cc00322fb4',10373,10351,10155,10159,'','2016-03-15 19:16:42','2016-03-15 19:16:42',-1,10372,10159,1,0,0,'2016-03-15 19:16:42',0,0,0,10159,'','2016-03-15 19:16:42'),('2b2f3430-094a-4fa4-ad47-176b0131206b',10391,10377,10155,10159,'','2016-03-15 19:16:43','2016-03-15 19:16:43',-1,10390,10159,1,0,0,'2016-03-15 19:16:43',0,0,0,10159,'','2016-03-15 19:16:43'),('720c0b0c-f5b7-4b58-ab44-1086f7cbba0e',10400,10377,10155,10159,'','2016-03-15 19:16:45','2016-03-15 19:16:45',-1,10399,10159,1,0,0,'2016-03-15 19:16:45',0,0,0,10159,'','2016-03-15 19:16:45'),('2ee858b1-a3e9-463b-be31-dd09e8ed7f51',10408,10377,10155,10159,'','2016-03-15 19:16:46','2016-03-15 19:16:46',-1,10407,10159,1,0,0,'2016-03-15 19:16:46',0,0,0,10159,'','2016-03-15 19:16:46'),('753f2ed7-f7c4-43fd-b9e3-2bd80e6af17f',10530,10182,10155,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',-1,10529,10159,1,0,0,'2016-03-15 19:18:21',0,0,0,10159,'','2016-03-15 19:18:21'),('6d3b0643-0a02-4126-b904-e7718d419c36',10539,10182,10155,10159,'','2016-03-15 19:18:21','2016-03-15 19:18:21',-1,10538,10159,1,0,0,'2016-03-15 19:18:21',0,0,0,10159,'','2016-03-15 19:18:21'),('b21e52ea-55e0-44aa-a307-11162cff6592',10549,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',-1,10548,10159,1,0,0,'2016-03-15 19:18:22',0,0,0,10159,'','2016-03-15 19:18:22'),('0dc8b76d-9038-4763-b0d0-be3342df5ece',10559,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',-1,10558,10159,1,0,0,'2016-03-15 19:18:22',0,0,0,10159,'','2016-03-15 19:18:22'),('d0d4b5ea-2576-4bce-ab9d-06b3eb3bd78b',10570,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',-1,10569,10159,1,0,0,'2016-03-15 19:18:22',0,0,0,10159,'','2016-03-15 19:18:22'),('89e11ba4-fc0f-4504-9489-fe58c109605f',10580,10182,10155,10159,'','2016-03-15 19:18:22','2016-03-15 19:18:22',-1,10579,10159,1,0,0,'2016-03-15 19:18:22',0,0,0,10159,'','2016-03-15 19:18:22'),('00087911-1dd9-45c7-ba92-171d7228e891',10641,10202,10155,10199,'Test Test','2016-03-15 19:19:28','2016-03-15 19:19:28',-1,10640,10199,1,0,10199,'2016-03-15 19:19:28',0,0,0,10199,'Test Test','2016-03-15 19:19:28'),('5d916755-301b-4b83-aade-2c3589fff438',10647,10202,10155,10199,'Test Test','2016-03-15 19:19:29','2016-03-15 19:19:29',-1,10646,10199,1,0,10199,'2016-03-15 19:19:29',0,0,0,10199,'Test Test','2016-03-15 19:19:29'),('c4130205-8c88-4d85-a012-3c1da206758d',10769,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',-1,10768,10199,1,0,10199,'2016-03-15 20:50:49',0,0,0,10199,'Test Test','2016-03-15 20:50:49'),('281f4206-c978-4752-a629-545e21c2a505',10778,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',-1,10777,10199,1,0,10199,'2016-03-15 20:50:49',0,0,0,10199,'Test Test','2016-03-15 20:50:49'),('0e40d894-1585-4cb0-98b8-3ce9fed8b027',10787,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',-1,10786,10199,1,0,10199,'2016-03-15 20:50:49',0,0,0,10199,'Test Test','2016-03-15 20:50:49'),('fae29b07-c71b-4009-abf4-165a7343a02b',10796,10182,10155,10199,'Test Test','2016-03-15 20:50:49','2016-03-15 20:50:49',-1,10795,10199,1,0,10199,'2016-03-15 20:50:49',0,0,0,10199,'Test Test','2016-03-15 20:50:49'),('81640eb1-7cc7-4086-b203-864e63ad286e',10805,10182,10155,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',-1,10804,10199,1,0,10199,'2016-03-15 20:50:50',0,0,0,10199,'Test Test','2016-03-15 20:50:50'),('0c0954c1-c044-4223-a5f3-1b489cd2e01d',10814,10182,10155,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',-1,10813,10199,1,0,10199,'2016-03-15 20:50:50',0,0,0,10199,'Test Test','2016-03-15 20:50:50'),('b9585e75-cf1b-4112-a73f-28f0fe0dfc3d',10823,10182,10155,10199,'Test Test','2016-03-15 20:50:50','2016-03-15 20:50:50',-1,10822,10199,1,0,10199,'2016-03-15 20:50:50',0,0,0,10199,'Test Test','2016-03-15 20:50:50'),('182562e5-85f7-4ab8-a132-48b85671a5aa',10832,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',-1,10831,10199,1,0,10199,'2016-03-15 20:50:53',0,0,0,10199,'Test Test','2016-03-15 20:50:53'),('892cdae3-b063-4a5b-8df4-366306f99e64',10841,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',-1,10840,10199,1,0,10199,'2016-03-15 20:50:53',0,0,0,10199,'Test Test','2016-03-15 20:50:53'),('72550de0-f757-4f56-8db1-49142aa8e4bc',10850,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',-1,10849,10199,1,0,10199,'2016-03-15 20:50:53',0,0,0,10199,'Test Test','2016-03-15 20:50:53'),('847f3416-5f0d-4ac3-9d1e-3eec006c4fc1',10859,10182,10155,10199,'Test Test','2016-03-15 20:50:53','2016-03-15 20:50:53',-1,10858,10199,1,0,10199,'2016-03-15 20:50:53',0,0,0,10199,'Test Test','2016-03-15 20:50:53'),('9afbbb9d-9dd7-4428-b524-7af223852539',11167,11148,10155,10159,'','2016-03-15 21:10:38','2016-03-15 21:10:38',-1,11166,10159,1,0,0,'2016-03-15 21:10:38',0,0,0,10159,'','2016-03-15 21:10:38'),('efac2c16-4a83-498c-8790-fe4cfcef09d9',11176,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',-1,11175,10159,1,0,0,'2016-03-15 21:10:39',0,0,0,10159,'','2016-03-15 21:10:39'),('97e969b8-2f93-40ab-9eab-a969550f40d1',11184,11148,10155,10159,'','2016-03-15 21:10:39','2016-03-15 21:10:39',-1,11183,10159,1,0,0,'2016-03-15 21:10:39',0,0,0,10159,'','2016-03-15 21:10:39'),('170110fc-67ad-4ea1-ba7f-6306aee80465',11192,11148,10155,10159,'','2016-03-15 21:10:40','2016-03-15 21:10:40',-1,11191,10159,1,0,0,'2016-03-15 21:10:40',0,0,0,10159,'','2016-03-15 21:10:40'),('8cf5feb9-42e0-421d-bc58-2162fc254a9b',11318,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:16','2016-03-16 04:54:16',-1,11317,11308,1,0,11308,'2016-03-16 04:54:16',0,0,0,11308,'Gautam Sharma','2016-03-16 04:54:16'),('eba4beb2-d2d0-4a49-a498-d577f7ae430f',11324,11311,10155,11308,'Gautam Sharma','2016-03-16 04:54:17','2016-03-16 04:54:17',-1,11323,11308,1,0,11308,'2016-03-16 04:54:17',0,0,0,11308,'Gautam Sharma','2016-03-16 04:54:17'),('2d386215-97a3-4f3e-bc1f-d4f3fc79487b',11417,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:06','2016-03-16 19:41:06',-1,11416,11407,1,0,11407,'2016-03-16 19:41:06',0,0,0,11407,'Primarry Investor1','2016-03-16 19:41:06'),('a91e1bb3-9fd1-4d10-889b-2b0638077582',11423,11410,10155,11407,'Primarry Investor1','2016-03-16 19:41:07','2016-03-16 19:41:07',-1,11422,11407,1,0,11407,'2016-03-16 19:41:07',0,0,0,11407,'Primarry Investor1','2016-03-16 19:41:07'),('c86f7083-862b-4c3d-bb9d-9393ad734f1e',11447,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:45','2016-03-16 20:05:45',-1,11446,11437,1,0,11437,'2016-03-16 20:05:45',0,0,0,11437,'Primary  Investor2','2016-03-16 20:05:45'),('9c94238d-1ef1-4eb3-8e2d-81403b6ae367',11453,11440,10155,11437,'Primary  Investor2','2016-03-16 20:05:46','2016-03-16 20:05:46',-1,11452,11437,1,0,11437,'2016-03-16 20:05:46',0,0,0,11437,'Primary  Investor2','2016-03-16 20:05:46'),('4edef661-0361-49bd-a465-4dca5814f4db',11467,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',-1,11466,11457,1,0,11457,'2016-03-16 20:32:23',0,0,0,11457,'seller whitehall2','2016-03-16 20:32:23'),('40a4e71a-149b-4854-9a3d-d45b7989777f',11473,11460,10155,11457,'seller whitehall2','2016-03-16 20:32:23','2016-03-16 20:32:23',-1,11472,11457,1,0,11457,'2016-03-16 20:32:23',0,0,0,11457,'seller whitehall2','2016-03-16 20:32:23'),('0bc9febd-9177-4ecc-9830-effe26fe646e',11487,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',-1,11486,11477,1,0,11477,'2016-03-16 20:35:32',0,0,0,11477,'Pr Investor3','2016-03-16 20:35:32'),('0bc3da42-f1f6-4374-beb0-6ed60a15c25f',11493,11480,10155,11477,'Pr Investor3','2016-03-16 20:35:32','2016-03-16 20:35:32',-1,11492,11477,1,0,11477,'2016-03-16 20:35:32',0,0,0,11477,'Pr Investor3','2016-03-16 20:35:32'),('241c9b28-8098-453e-9f44-98591f6c1e32',11507,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:49','2016-03-16 20:52:49',-1,11506,11497,1,0,11497,'2016-03-16 20:52:49',0,0,0,11497,'Pr Investor4','2016-03-16 20:52:49'),('d15623ad-728b-40cf-acf7-4bcef6a55f96',11513,11500,10155,11497,'Pr Investor4','2016-03-16 20:52:50','2016-03-16 20:52:50',-1,11512,11497,1,0,11497,'2016-03-16 20:52:50',0,0,0,11497,'Pr Investor4','2016-03-16 20:52:50'),('b3d3bfef-6eed-42f3-9569-acf2c7a827cf',11527,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',-1,11526,11517,1,0,11517,'2016-03-16 20:57:57',0,0,0,11517,'seller whitehall3','2016-03-16 20:57:57'),('c5bbf988-d121-40a2-b0b7-d558327eab29',11533,11520,10155,11517,'seller whitehall3','2016-03-16 20:57:57','2016-03-16 20:57:57',-1,11532,11517,1,0,11517,'2016-03-16 20:57:57',0,0,0,11517,'seller whitehall3','2016-03-16 20:57:57'),('933ecb97-0222-400c-9860-1a812647e134',11547,11540,10155,11537,'scf company2','2016-03-16 21:00:43','2016-03-16 21:00:43',-1,11546,11537,1,0,11537,'2016-03-16 21:00:43',0,0,0,11537,'scf company2','2016-03-16 21:00:43'),('975ab895-c69e-4f55-b82e-a27ab6721f28',11553,11540,10155,11537,'scf company2','2016-03-16 21:00:44','2016-03-16 21:00:44',-1,11552,11537,1,0,11537,'2016-03-16 21:00:44',0,0,0,11537,'scf company2','2016-03-16 21:00:44'),('9dc9d661-e8ee-4806-9812-dd92fc17d643',11710,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:08','2016-03-19 14:00:08',-1,11709,11336,1,0,11336,'2016-03-19 14:00:08',0,0,0,11336,'dhanush kodi','2016-03-19 14:00:08'),('8a94420d-8628-4776-ba09-af2b8ed67ea6',11716,11339,10155,11336,'dhanush kodi','2016-03-19 14:00:09','2016-03-19 14:00:09',-1,11715,11336,1,0,11336,'2016-03-19 14:00:09',0,0,0,11336,'dhanush kodi','2016-03-19 14:00:09'),('34e7b802-c9d1-4126-97a0-8b0f8f6058c3',11833,10182,10155,10199,'Whitehall Admin','2016-03-19 20:21:29','2016-03-19 20:21:29',-1,11832,10199,1,0,10199,'2016-03-19 20:21:29',0,0,0,10199,'Whitehall Admin','2016-03-19 20:21:29'),('745ec5e6-236d-4ca3-9523-fe3e4b99fec3',12171,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:51','2016-03-21 21:13:51',-1,12170,10199,1,0,10199,'2016-03-21 21:13:51',0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:51'),('66e927cd-e77c-41c5-ae54-bb0fd3bf905f',12197,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:53','2016-03-21 21:13:53',-1,12196,10199,1,0,10199,'2016-03-21 21:13:53',0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:53'),('ba188860-6b00-42bb-97fb-c67d545b9d72',12223,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',-1,12222,10199,1,0,10199,'2016-03-21 21:13:54',0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:54'),('ea2759b0-e6a8-4262-9a01-4871ac1fc418',12245,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',-1,12244,10199,1,0,10199,'2016-03-21 21:13:54',0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:54'),('0201a4fe-db76-42e5-9380-7f9cdc5ed90f',12263,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:54','2016-03-21 21:13:54',-1,12262,10199,1,0,10199,'2016-03-21 21:13:54',0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:54'),('0e68047e-6045-4432-9f18-52e13cd7937d',12285,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:55','2016-03-21 21:13:55',-1,12284,10199,1,0,10199,'2016-03-21 21:13:55',0,0,0,10199,'Whitehall Admin','2016-03-21 21:13:55'),('6eed48b5-f5f0-4902-a3c1-4c1f045a4d9c',12504,10182,10155,10199,'Whitehall Admin','2016-03-24 11:27:24','2016-03-24 11:27:25',-1,12503,10199,1,0,10199,'2016-03-24 11:27:25',0,0,0,10199,'Whitehall Admin','2016-03-24 11:27:25');

/*Table structure for table `mbthreadflag` */

DROP TABLE IF EXISTS `mbthreadflag`;

CREATE TABLE `mbthreadflag` (
  `uuid_` varchar(75) DEFAULT NULL,
  `threadFlagId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `threadId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`threadFlagId`),
  UNIQUE KEY `IX_33781904` (`userId`,`threadId`),
  UNIQUE KEY `IX_FEB0FC87` (`uuid_`,`groupId`),
  KEY `IX_8CB0A24A` (`threadId`),
  KEY `IX_A28004B` (`userId`),
  KEY `IX_F36BBB83` (`uuid_`),
  KEY `IX_DCE308C5` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mbthreadflag` */

/*Table structure for table `mdraction` */

DROP TABLE IF EXISTS `mdraction`;

CREATE TABLE `mdraction` (
  `uuid_` varchar(75) DEFAULT NULL,
  `actionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `ruleGroupInstanceId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` varchar(255) DEFAULT NULL,
  `typeSettings` longtext,
  PRIMARY KEY (`actionId`),
  UNIQUE KEY `IX_75BE36AD` (`uuid_`,`groupId`),
  KEY `IX_FD90786C` (`ruleGroupInstanceId`),
  KEY `IX_77BB5E9D` (`uuid_`),
  KEY `IX_C58A516B` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mdraction` */

/*Table structure for table `mdrrule` */

DROP TABLE IF EXISTS `mdrrule`;

CREATE TABLE `mdrrule` (
  `uuid_` varchar(75) DEFAULT NULL,
  `ruleId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `ruleGroupId` bigint(20) DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  `type_` varchar(255) DEFAULT NULL,
  `typeSettings` longtext,
  PRIMARY KEY (`ruleId`),
  UNIQUE KEY `IX_F3EFDCB3` (`uuid_`,`groupId`),
  KEY `IX_4F4293F1` (`ruleGroupId`),
  KEY `IX_EA63B9D7` (`uuid_`),
  KEY `IX_7DEA8DF1` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mdrrule` */

/*Table structure for table `mdrrulegroup` */

DROP TABLE IF EXISTS `mdrrulegroup`;

CREATE TABLE `mdrrulegroup` (
  `uuid_` varchar(75) DEFAULT NULL,
  `ruleGroupId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` longtext,
  `description` longtext,
  PRIMARY KEY (`ruleGroupId`),
  UNIQUE KEY `IX_46665CC4` (`uuid_`,`groupId`),
  KEY `IX_5849891C` (`groupId`),
  KEY `IX_7F26B2A6` (`uuid_`),
  KEY `IX_CC14DC2` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mdrrulegroup` */

/*Table structure for table `mdrrulegroupinstance` */

DROP TABLE IF EXISTS `mdrrulegroupinstance`;

CREATE TABLE `mdrrulegroupinstance` (
  `uuid_` varchar(75) DEFAULT NULL,
  `ruleGroupInstanceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `ruleGroupId` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`ruleGroupInstanceId`),
  UNIQUE KEY `IX_808A0036` (`classNameId`,`classPK`,`ruleGroupId`),
  UNIQUE KEY `IX_9CBC6A39` (`uuid_`,`groupId`),
  KEY `IX_C95A08D8` (`classNameId`,`classPK`),
  KEY `IX_AFF28547` (`groupId`),
  KEY `IX_22DAB85C` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_BF3E642B` (`ruleGroupId`),
  KEY `IX_B6A6BD91` (`uuid_`),
  KEY `IX_25C9D1F7` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `mdrrulegroupinstance` */

/*Table structure for table `membershiprequest` */

DROP TABLE IF EXISTS `membershiprequest`;

CREATE TABLE `membershiprequest` (
  `membershipRequestId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `comments` longtext,
  `replyComments` longtext,
  `replyDate` datetime DEFAULT NULL,
  `replierUserId` bigint(20) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`membershipRequestId`),
  KEY `IX_8A1CC4B` (`groupId`),
  KEY `IX_C28C72EC` (`groupId`,`statusId`),
  KEY `IX_35AA8FA6` (`groupId`,`userId`,`statusId`),
  KEY `IX_66D70879` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `membershiprequest` */

/*Table structure for table `notifications_usernotificationevent` */

DROP TABLE IF EXISTS `notifications_usernotificationevent`;

CREATE TABLE `notifications_usernotificationevent` (
  `notificationEventId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userNotificationEventId` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `delivered` tinyint(4) DEFAULT NULL,
  `actionRequired` tinyint(4) DEFAULT NULL,
  `archived` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`notificationEventId`),
  UNIQUE KEY `IX_DC9FCEDC` (`userNotificationEventId`),
  KEY `IX_93C52776` (`userId`,`actionRequired`),
  KEY `IX_36E5AE4C` (`userId`,`actionRequired`,`archived`),
  KEY `IX_73C065F0` (`userId`,`delivered`,`actionRequired`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notifications_usernotificationevent` */

/*Table structure for table `opensocial_gadget` */

DROP TABLE IF EXISTS `opensocial_gadget`;

CREATE TABLE `opensocial_gadget` (
  `uuid_` varchar(75) DEFAULT NULL,
  `gadgetId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `url` longtext,
  `portletCategoryNames` longtext,
  PRIMARY KEY (`gadgetId`),
  KEY `IX_729869EE` (`companyId`),
  KEY `IX_E1F8627A` (`uuid_`),
  KEY `IX_3C79316E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `opensocial_gadget` */

/*Table structure for table `opensocial_oauthconsumer` */

DROP TABLE IF EXISTS `opensocial_oauthconsumer`;

CREATE TABLE `opensocial_oauthconsumer` (
  `oAuthConsumerId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `gadgetKey` varchar(75) DEFAULT NULL,
  `serviceName` varchar(75) DEFAULT NULL,
  `consumerKey` varchar(75) DEFAULT NULL,
  `consumerSecret` longtext,
  `keyType` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`oAuthConsumerId`),
  KEY `IX_47206618` (`gadgetKey`),
  KEY `IX_8E715BF8` (`gadgetKey`,`serviceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `opensocial_oauthconsumer` */

/*Table structure for table `opensocial_oauthtoken` */

DROP TABLE IF EXISTS `opensocial_oauthtoken`;

CREATE TABLE `opensocial_oauthtoken` (
  `oAuthTokenId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `gadgetKey` varchar(75) DEFAULT NULL,
  `serviceName` varchar(75) DEFAULT NULL,
  `moduleId` bigint(20) DEFAULT NULL,
  `accessToken` varchar(75) DEFAULT NULL,
  `tokenName` varchar(75) DEFAULT NULL,
  `tokenSecret` varchar(75) DEFAULT NULL,
  `sessionHandle` varchar(75) DEFAULT NULL,
  `expiration` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`oAuthTokenId`),
  KEY `IX_6C8CCC3D` (`gadgetKey`,`serviceName`),
  KEY `IX_CDD35402` (`userId`,`gadgetKey`,`serviceName`,`moduleId`,`tokenName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `opensocial_oauthtoken` */

/*Table structure for table `organization_` */

DROP TABLE IF EXISTS `organization_`;

CREATE TABLE `organization_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `organizationId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentOrganizationId` bigint(20) DEFAULT NULL,
  `treePath` longtext,
  `name` varchar(100) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `recursable` tinyint(4) DEFAULT NULL,
  `regionId` bigint(20) DEFAULT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `statusId` int(11) DEFAULT NULL,
  `comments` longtext,
  PRIMARY KEY (`organizationId`),
  UNIQUE KEY `IX_E301BDF5` (`companyId`,`name`),
  KEY `IX_834BCEB6` (`companyId`),
  KEY `IX_418E4522` (`companyId`,`parentOrganizationId`),
  KEY `IX_396D6B42` (`uuid_`),
  KEY `IX_A9D85BA6` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `organization_` */

/*Table structure for table `orggrouprole` */

DROP TABLE IF EXISTS `orggrouprole`;

CREATE TABLE `orggrouprole` (
  `organizationId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`organizationId`,`groupId`,`roleId`),
  KEY `IX_4A527DD3` (`groupId`),
  KEY `IX_AB044D1C` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orggrouprole` */

/*Table structure for table `orglabor` */

DROP TABLE IF EXISTS `orglabor`;

CREATE TABLE `orglabor` (
  `orgLaborId` bigint(20) NOT NULL,
  `organizationId` bigint(20) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sunOpen` int(11) DEFAULT NULL,
  `sunClose` int(11) DEFAULT NULL,
  `monOpen` int(11) DEFAULT NULL,
  `monClose` int(11) DEFAULT NULL,
  `tueOpen` int(11) DEFAULT NULL,
  `tueClose` int(11) DEFAULT NULL,
  `wedOpen` int(11) DEFAULT NULL,
  `wedClose` int(11) DEFAULT NULL,
  `thuOpen` int(11) DEFAULT NULL,
  `thuClose` int(11) DEFAULT NULL,
  `friOpen` int(11) DEFAULT NULL,
  `friClose` int(11) DEFAULT NULL,
  `satOpen` int(11) DEFAULT NULL,
  `satClose` int(11) DEFAULT NULL,
  PRIMARY KEY (`orgLaborId`),
  KEY `IX_6AF0D434` (`organizationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orglabor` */

/*Table structure for table `passwordpolicy` */

DROP TABLE IF EXISTS `passwordpolicy`;

CREATE TABLE `passwordpolicy` (
  `uuid_` varchar(75) DEFAULT NULL,
  `passwordPolicyId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `defaultPolicy` tinyint(4) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `changeable` tinyint(4) DEFAULT NULL,
  `changeRequired` tinyint(4) DEFAULT NULL,
  `minAge` bigint(20) DEFAULT NULL,
  `checkSyntax` tinyint(4) DEFAULT NULL,
  `allowDictionaryWords` tinyint(4) DEFAULT NULL,
  `minAlphanumeric` int(11) DEFAULT NULL,
  `minLength` int(11) DEFAULT NULL,
  `minLowerCase` int(11) DEFAULT NULL,
  `minNumbers` int(11) DEFAULT NULL,
  `minSymbols` int(11) DEFAULT NULL,
  `minUpperCase` int(11) DEFAULT NULL,
  `regex` varchar(75) DEFAULT NULL,
  `history` tinyint(4) DEFAULT NULL,
  `historyCount` int(11) DEFAULT NULL,
  `expireable` tinyint(4) DEFAULT NULL,
  `maxAge` bigint(20) DEFAULT NULL,
  `warningTime` bigint(20) DEFAULT NULL,
  `graceLimit` int(11) DEFAULT NULL,
  `lockout` tinyint(4) DEFAULT NULL,
  `maxFailure` int(11) DEFAULT NULL,
  `lockoutDuration` bigint(20) DEFAULT NULL,
  `requireUnlock` tinyint(4) DEFAULT NULL,
  `resetFailureCount` bigint(20) DEFAULT NULL,
  `resetTicketMaxAge` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`passwordPolicyId`),
  UNIQUE KEY `IX_3FBFA9F4` (`companyId`,`name`),
  KEY `IX_8FEE65F5` (`companyId`),
  KEY `IX_2C1142E` (`companyId`,`defaultPolicy`),
  KEY `IX_51437A01` (`uuid_`),
  KEY `IX_E4D7EF87` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `passwordpolicy` */

insert  into `passwordpolicy`(`uuid_`,`passwordPolicyId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`defaultPolicy`,`name`,`description`,`changeable`,`changeRequired`,`minAge`,`checkSyntax`,`allowDictionaryWords`,`minAlphanumeric`,`minLength`,`minLowerCase`,`minNumbers`,`minSymbols`,`minUpperCase`,`regex`,`history`,`historyCount`,`expireable`,`maxAge`,`warningTime`,`graceLimit`,`lockout`,`maxFailure`,`lockoutDuration`,`requireUnlock`,`resetFailureCount`,`resetTicketMaxAge`) values ('c5057d75-521f-4cbb-949c-d802b00bbc7a',10198,10155,10159,'','2016-03-15 19:16:30','2016-03-15 19:16:30',1,'Default Password Policy','Default Password Policy',1,1,0,0,1,0,6,0,1,0,1,'(?=.{4})(?:[a-zA-Z0-9]*)',0,6,0,8640000,86400,0,0,3,0,1,600,86400);

/*Table structure for table `passwordpolicyrel` */

DROP TABLE IF EXISTS `passwordpolicyrel`;

CREATE TABLE `passwordpolicyrel` (
  `passwordPolicyRelId` bigint(20) NOT NULL,
  `passwordPolicyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`passwordPolicyRelId`),
  UNIQUE KEY `IX_C3A17327` (`classNameId`,`classPK`),
  KEY `IX_CD25266E` (`passwordPolicyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `passwordpolicyrel` */

insert  into `passwordpolicyrel`(`passwordPolicyRelId`,`passwordPolicyId`,`classNameId`,`classPK`) values (10201,10198,10005,10199),(11310,10198,10005,11308),(11338,10198,10005,11336),(11409,10198,10005,11407),(11439,10198,10005,11437),(11459,10198,10005,11457),(11479,10198,10005,11477),(11499,10198,10005,11497),(11519,10198,10005,11517),(11539,10198,10005,11537);

/*Table structure for table `passwordtracker` */

DROP TABLE IF EXISTS `passwordtracker`;

CREATE TABLE `passwordtracker` (
  `passwordTrackerId` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `password_` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`passwordTrackerId`),
  KEY `IX_326F75BD` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `passwordtracker` */

/*Table structure for table `phone` */

DROP TABLE IF EXISTS `phone`;

CREATE TABLE `phone` (
  `uuid_` varchar(75) DEFAULT NULL,
  `phoneId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `number_` varchar(75) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`phoneId`),
  KEY `IX_9F704A14` (`companyId`),
  KEY `IX_A2E4AFBA` (`companyId`,`classNameId`),
  KEY `IX_9A53569` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_812CE07A` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_F202B9CE` (`userId`),
  KEY `IX_EA6245A0` (`uuid_`),
  KEY `IX_B271FA88` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `phone` */

/*Table structure for table `pluginsetting` */

DROP TABLE IF EXISTS `pluginsetting`;

CREATE TABLE `pluginsetting` (
  `pluginSettingId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `pluginId` varchar(75) DEFAULT NULL,
  `pluginType` varchar(75) DEFAULT NULL,
  `roles` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`pluginSettingId`),
  UNIQUE KEY `IX_7171B2E8` (`companyId`,`pluginId`,`pluginType`),
  KEY `IX_B9746445` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pluginsetting` */

/*Table structure for table `pollschoice` */

DROP TABLE IF EXISTS `pollschoice`;

CREATE TABLE `pollschoice` (
  `uuid_` varchar(75) DEFAULT NULL,
  `choiceId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `questionId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`choiceId`),
  UNIQUE KEY `IX_D76DD2CF` (`questionId`,`name`),
  UNIQUE KEY `IX_C222BD31` (`uuid_`,`groupId`),
  KEY `IX_EC370F10` (`questionId`),
  KEY `IX_6660B399` (`uuid_`),
  KEY `IX_8AE746EF` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pollschoice` */

/*Table structure for table `pollsquestion` */

DROP TABLE IF EXISTS `pollsquestion`;

CREATE TABLE `pollsquestion` (
  `uuid_` varchar(75) DEFAULT NULL,
  `questionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `expirationDate` datetime DEFAULT NULL,
  `lastVoteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`questionId`),
  UNIQUE KEY `IX_F3C9F36` (`uuid_`,`groupId`),
  KEY `IX_9FF342EA` (`groupId`),
  KEY `IX_51F087F4` (`uuid_`),
  KEY `IX_F910BBB4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pollsquestion` */

/*Table structure for table `pollsvote` */

DROP TABLE IF EXISTS `pollsvote`;

CREATE TABLE `pollsvote` (
  `uuid_` varchar(75) DEFAULT NULL,
  `voteId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `questionId` bigint(20) DEFAULT NULL,
  `choiceId` bigint(20) DEFAULT NULL,
  `voteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`voteId`),
  UNIQUE KEY `IX_1BBFD4D3` (`questionId`,`userId`),
  UNIQUE KEY `IX_A88C673A` (`uuid_`,`groupId`),
  KEY `IX_D5DF7B54` (`choiceId`),
  KEY `IX_12112599` (`questionId`),
  KEY `IX_FD32EB70` (`uuid_`),
  KEY `IX_7D8E92B8` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pollsvote` */

/*Table structure for table `portalpreferences` */

DROP TABLE IF EXISTS `portalpreferences`;

CREATE TABLE `portalpreferences` (
  `portalPreferencesId` bigint(20) NOT NULL,
  `ownerId` bigint(20) DEFAULT NULL,
  `ownerType` int(11) DEFAULT NULL,
  `preferences` longtext,
  PRIMARY KEY (`portalPreferencesId`),
  KEY `IX_D1F795F1` (`ownerId`,`ownerType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `portalpreferences` */

insert  into `portalpreferences`(`portalPreferencesId`,`ownerId`,`ownerType`,`preferences`) values (10154,0,1,'<portlet-preferences><preference><name>mail.session.mail</name><value>true</value></preference><preference><name>mail.session.mail.smtp.user</name><value>gautam.tf2015@gmail.com</value></preference><preference><name>mail.session.mail.pop3.host</name><value>localhost</value></preference><preference><name>mail.session.mail.pop3.user</name><value></value></preference><preference><name>mail.session.mail.advanced.properties</name><value></value></preference><preference><name>mail.session.mail.pop3.password</name><value></value></preference><preference><name>mail.session.mail.store.protocol</name><value>pop3</value></preference><preference><name>mail.session.mail.pop3.port</name><value>110</value></preference><preference><name>mail.session.mail.transport.protocol</name><value>smtps</value></preference><preference><name>mail.session.mail.smtp.host</name><value>smtp.gmail.com</value></preference><preference><name>mail.session.mail.smtp.password</name><value>Trade2015</value></preference><preference><name>mail.session.mail.smtp.port</name><value>465</value></preference></portlet-preferences>'),(10161,10155,1,'<portlet-preferences><preference><name>company.security.strangers.verify</name><value>false</value></preference><preference><name>locales</name><value>ca_ES,zh_CN,en_US,fi_FI,fr_FR,de_DE,iw_IL,hu_HU,ja_JP,pt_BR,es_ES</value></preference><preference><name>ldap.server.ids</name><value></value></preference><preference><name>admin.analytics.types</name><value>google[$NEW_LINE$]piwik</value></preference><preference><name>admin.default.group.names</name><value>WhiteHall Finance</value></preference><preference><name>admin.email.password.reset.subject</name><value>[$PORTAL_URL$]: Reset Your Password</value></preference><preference><name>admin.email.user.added.subject</name><value>[$PORTAL_URL$]: Your New Account</value></preference><preference><name>admin.email.password.sent.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Your new password for [$PORTAL_URL$] is [$USER_PASSWORD$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]The request for a new password was made from [$REMOTE_ADDRESS$] / [$REMOTE_HOST$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>admin.email.verification.subject</name><value>[$PORTAL_URL$]: Email Address Verification</value></preference><preference><name>admin.default.role.names</name><value>Power User[$NEW_LINE$]User</value></preference><preference><name>company.security.strangers.with.mx</name><value>true</value></preference><preference><name>company.security.auto.login</name><value>true</value></preference><preference><name>default.landing.page.path</name><value>/group/guest/dashboard</value></preference><preference><name>company.security.site.logo</name><value>true</value></preference><preference><name>admin.email.password.sent.subject</name><value>[$PORTAL_URL$]: Your New Password</value></preference><preference><name>admin.email.password.reset.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]You can reset your password for [$PORTAL_URL$] at [$PASSWORD_RESET_URL$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]The request for a new password was made from [$REMOTE_ADDRESS$] / [$REMOTE_HOST$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>company.security.send.password</name><value>true</value></preference><preference><name>default.logout.page.path</name><value>/web/guest/home</value></preference><preference><name>admin.email.verification.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Please verify your email address for [$PORTAL_URL$] at [$EMAIL_VERIFICATION_URL$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Your verification code is [$EMAIL_VERIFICATION_CODE$] Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>admin.email.user.added.no.password.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Welcome! You recently created an account at [$PORTAL_URL$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>admin.sync.default.associations</name><value>true</value></preference><preference><name>admin.email.user.added.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Welcome! You recently created an account at [$PORTAL_URL$]. Your password is [$USER_PASSWORD$]. Enjoy!&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>company.security.strangers</name><value>true</value></preference><preference><name>company.security.auth.type</name><value>emailAddress</value></preference></portlet-preferences>'),(10588,10159,4,'<portlet-preferences />'),(10650,10199,4,'<portlet-preferences><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.pages</name><value>closed</value></preference><preference><name>125#users-order-by-col</name><value>last-name</value></preference><preference><name>125#entries-order-by-col</name><value>removed-date</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory12</name><value>open</value></preference><preference><name>125#entries-order-by-type</name><value>asc</value></preference><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.content</name><value>open</value></preference><preference><name>com.liferay.portal.util.SessionClicks#liferay_toggle_controls</name><value>hidden</value></preference><preference><name>com.liferay.portal.util.SessionClicks#liferay_addpanel_tab</name><value>applications</value></preference><preference><name>125#users-order-by-type</name><value>asc</value></preference><preference><name>com.liferay.portal.util.SessionClicks#p_auth</name><value>kNU75qAA</value></preference></portlet-preferences>'),(11327,11308,4,'<portlet-preferences />'),(11426,11407,4,'<portlet-preferences />'),(11456,11437,4,'<portlet-preferences />'),(11476,11457,4,'<portlet-preferences />'),(11496,11477,4,'<portlet-preferences />'),(11516,11497,4,'<portlet-preferences />'),(11536,11517,4,'<portlet-preferences />'),(11556,11537,4,'<portlet-preferences />'),(11719,11336,4,'<portlet-preferences />');

/*Table structure for table `portlet` */

DROP TABLE IF EXISTS `portlet`;

CREATE TABLE `portlet` (
  `id_` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `roles` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_`),
  UNIQUE KEY `IX_12B5E51D` (`companyId`,`portletId`),
  KEY `IX_80CC9508` (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `portlet` */

insert  into `portlet`(`id_`,`companyId`,`portletId`,`roles`,`active_`) values (10206,10155,'98','',0),(10207,10155,'183','',1),(10208,10155,'66','',1),(10209,10155,'180','',1),(10210,10155,'27','',1),(10211,10155,'152','',1),(10212,10155,'134','',1),(10213,10155,'130','',1),(10214,10155,'122','',1),(10215,10155,'36','',1),(10216,10155,'26','',1),(10217,10155,'175','',1),(10218,10155,'153','',1),(10219,10155,'64','',1),(10220,10155,'129','',1),(10221,10155,'182','',1),(10222,10155,'179','',1),(10223,10155,'173','',0),(10224,10155,'100','',1),(10225,10155,'19','',1),(10226,10155,'157','',1),(10227,10155,'181','',1),(10228,10155,'128','',1),(10229,10155,'154','',1),(10230,10155,'148','',1),(10231,10155,'11','',1),(10232,10155,'29','',1),(10233,10155,'158','',1),(10234,10155,'178','',1),(10235,10155,'58','',1),(10236,10155,'71','',1),(10237,10155,'97','',1),(10238,10155,'39','',1),(10239,10155,'85','',1),(10240,10155,'118','',1),(10241,10155,'107','',1),(10242,10155,'30','',1),(10243,10155,'184','',1),(10244,10155,'147','',1),(10245,10155,'48','',1),(10246,10155,'125','',1),(10247,10155,'161','',1),(10248,10155,'146','',1),(10249,10155,'62','',0),(10250,10155,'162','',1),(10251,10155,'176','',1),(10252,10155,'108','',1),(10253,10155,'187','',1),(10254,10155,'84','',1),(10255,10155,'101','',1),(10256,10155,'121','',1),(10257,10155,'143','',1),(10258,10155,'77','',1),(10259,10155,'167','',1),(10260,10155,'115','',1),(10261,10155,'56','',1),(10262,10155,'16','',1),(10263,10155,'3','',1),(10264,10155,'20','',1),(10265,10155,'23','',1),(10266,10155,'83','',1),(10267,10155,'99','',1),(10268,10155,'186','',1),(10269,10155,'194','',1),(10270,10155,'70','',1),(10271,10155,'164','',1),(10272,10155,'141','',1),(10273,10155,'9','',1),(10274,10155,'28','',1),(10275,10155,'137','',1),(10276,10155,'15','',1),(10277,10155,'47','',1),(10278,10155,'116','',1),(10279,10155,'82','',1),(10280,10155,'151','',1),(10281,10155,'54','',1),(10282,10155,'34','',1),(10283,10155,'132','',1),(10284,10155,'169','',1),(10285,10155,'61','',1),(10286,10155,'73','',1),(10287,10155,'50','',1),(10288,10155,'127','',1),(10289,10155,'193','',1),(10290,10155,'31','',1),(10291,10155,'25','',1),(10292,10155,'166','',1),(10293,10155,'33','',1),(10294,10155,'150','',1),(10295,10155,'114','',1),(10296,10155,'149','',1),(10297,10155,'67','',1),(10298,10155,'110','',1),(10299,10155,'59','',1),(10300,10155,'135','',1),(10301,10155,'188','',1),(10302,10155,'131','',1),(10303,10155,'102','',1),(10446,10155,'1_WAR_calendarportlet','',1),(10497,10155,'1_WAR_notificationsportlet','',1),(10502,10155,'4_WAR_opensocialportlet','',1),(10503,10155,'2_WAR_opensocialportlet','',1),(10504,10155,'1_WAR_opensocialportlet','',1),(10505,10155,'3_WAR_opensocialportlet','',1),(10510,10155,'1_WAR_webformportlet','',1),(11146,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet','',1),(11201,10155,'scftradeportlet_WAR_scftradeportlet','',1),(11202,10155,'scfinvestorportlet_WAR_scfinvestorportlet','',1),(11203,10155,'tfregistrationportlet_WAR_tfregistrationportlet','',1),(11204,10155,'tfcompanyportlet_WAR_tfadminportlet','',1),(11301,10155,'tfdashboardportlet_WAR_tfdashboardportlet','',1),(11823,10155,'tfsettingsportlet_WAR_tfsettingsportlet','',1),(12401,10155,'tfreportportlet_WAR_tfreportportlet','',1);

/*Table structure for table `portletitem` */

DROP TABLE IF EXISTS `portletitem`;

CREATE TABLE `portletitem` (
  `portletItemId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`portletItemId`),
  KEY `IX_96BDD537` (`groupId`,`classNameId`),
  KEY `IX_D699243F` (`groupId`,`name`,`portletId`,`classNameId`),
  KEY `IX_2C61314E` (`groupId`,`portletId`),
  KEY `IX_E922D6C0` (`groupId`,`portletId`,`classNameId`),
  KEY `IX_8E71167F` (`groupId`,`portletId`,`classNameId`,`name`),
  KEY `IX_33B8CE8D` (`groupId`,`portletId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `portletitem` */

/*Table structure for table `portletpreferences` */

DROP TABLE IF EXISTS `portletpreferences`;

CREATE TABLE `portletpreferences` (
  `portletPreferencesId` bigint(20) NOT NULL,
  `ownerId` bigint(20) DEFAULT NULL,
  `ownerType` int(11) DEFAULT NULL,
  `plid` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `preferences` longtext,
  PRIMARY KEY (`portletPreferencesId`),
  UNIQUE KEY `IX_C7057FF7` (`ownerId`,`ownerType`,`plid`,`portletId`),
  KEY `IX_E4F13E6E` (`ownerId`,`ownerType`,`plid`),
  KEY `IX_C9A3FCE2` (`ownerId`,`ownerType`,`portletId`),
  KEY `IX_D5EDA3A1` (`ownerType`,`plid`,`portletId`),
  KEY `IX_A3B2A80C` (`ownerType`,`portletId`),
  KEY `IX_F15C1C4F` (`plid`),
  KEY `IX_D340DB76` (`plid`,`portletId`),
  KEY `IX_8E6DA3A1` (`portletId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `portletpreferences` */

insert  into `portletpreferences`(`portletPreferencesId`,`ownerId`,`ownerType`,`plid`,`portletId`,`preferences`) values (10328,0,3,10321,'148_INSTANCE_pKtzmcNTRfdy','<portlet-preferences><preference><name>showAssetCount</name><value>true</value></preference><preference><name>showZeroAssetCount</name><value>false</value></preference><preference><name>classNameId</name><value>10007</value></preference><preference><name>displayStyle</name><value>cloud</value></preference><preference><name>maxAssetTags</name><value>10</value></preference></portlet-preferences>'),(10349,0,3,10343,'141_INSTANCE_ilOVYHsC06a6','<portlet-preferences><preference><name>showAssetCount</name><value>true</value></preference><preference><name>classNameId</name><value>10016</value></preference></portlet-preferences>'),(10368,0,3,10362,'3','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(10369,0,3,10362,'101_INSTANCE_WKhV5p60HYwQ','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>anyAssetType</name><value>false</value></preference><preference><name>portletSetupTitle_en_US</name><value>Upcoming Events</value></preference></portlet-preferences>'),(10394,0,3,10388,'3','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(10395,0,3,10388,'82','<portlet-preferences><preference><name>displayStyle</name><value>3</value></preference></portlet-preferences>'),(10396,0,3,10388,'101_INSTANCE_u3FtbZ8AzOJ9','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>portletSetupTitle_en_US</name><value>Recent Content</value></preference></portlet-preferences>'),(10403,0,3,10397,'20','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(10404,0,3,10397,'101_INSTANCE_QnVZlQSSicet','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>anyAssetType</name><value>false</value></preference><preference><name>portletSetupTitle_en_US</name><value>Upcoming Events</value></preference></portlet-preferences>'),(10411,0,3,10405,'39_INSTANCE_98usyrRw7YUm','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>expandedEntriesPerFeed</name><value>3</value></preference><preference><name>urls</name><value>http://partners.userland.com/nytRss/technology.xml</value></preference><preference><name>entriesPerFeed</name><value>4</value></preference><preference><name>portletSetupTitle_en_US</name><value>Technology news</value></preference></portlet-preferences>'),(10412,0,3,10405,'39_INSTANCE_wWzLD7tqzCQf','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>expandedEntriesPerFeed</name><value>0</value></preference><preference><name>urls</name><value>http://www.liferay.com/en/about-us/news/-/blogs/rss</value></preference><preference><name>titles</name><value>Liferay Press Releases</value></preference><preference><name>entriesPerFeed</name><value>4</value></preference><preference><name>portletSetupTitle_en_US</name><value>Liferay news</value></preference></portlet-preferences>'),(10534,10182,2,0,'20','<portlet-preferences><preference><name>displayStyleGroupId</name><value></value></preference></portlet-preferences>'),(10605,10182,2,0,'15','<portlet-preferences><preference><name>displayStyleGroupId</name><value></value></preference></portlet-preferences>'),(10634,0,3,10185,'145','<portlet-preferences />'),(10658,0,3,10176,'190','<portlet-preferences />'),(10659,0,3,10176,'145','<portlet-preferences />'),(10660,0,3,10176,'2_WAR_notificationsportlet','<portlet-preferences />'),(10661,0,3,10176,'134','<portlet-preferences />'),(10662,0,3,10176,'160','<portlet-preferences />'),(10663,0,3,10176,'156','<portlet-preferences />'),(10664,0,3,10176,'130','<portlet-preferences />'),(10874,0,3,10703,'58','<portlet-preferences><preference><name>displayStyleGroupId</name><value></value></preference></portlet-preferences>'),(10992,0,3,10176,'15','<portlet-preferences />'),(11007,0,3,10176,'86','<portlet-preferences />'),(11023,0,3,10965,'15','<portlet-preferences><preference><name>lfrScopeType</name><value></value></preference><preference><name>lfrScopeLayoutUuid</name><value></value></preference><preference><name>displayStyleGroupId</name><value></value></preference></portlet-preferences>'),(11170,11148,2,0,'15','<portlet-preferences />'),(11195,0,3,11189,'56_INSTANCE_0aLHKGqQ3tNo','<portlet-preferences><preference><name>articleId</name><value>MAIN-CAROUSEL</value></preference><preference><name>portletSetupCss</name><value>{&#034;advancedData&#034;:{&#034;customCSSClassName&#034;:&#034;main-carousel&#034;}}</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>11148</value></preference></portlet-preferences>'),(11196,0,3,11189,'56_INSTANCE_ODGrax4MoqFN','<portlet-preferences><preference><name>articleId</name><value>DID-YOU-KNOW</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>11148</value></preference></portlet-preferences>'),(11197,0,3,11189,'56_INSTANCE_L1yh1GFJzyJr','<portlet-preferences><preference><name>articleId</name><value>CUSTOMIZE-IT</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>11148</value></preference></portlet-preferences>'),(11205,0,3,10703,'145','<portlet-preferences />'),(11206,0,3,10703,'2_WAR_notificationsportlet','<portlet-preferences />'),(11302,0,3,10965,'145','<portlet-preferences />'),(11303,0,3,10965,'2_WAR_notificationsportlet','<portlet-preferences />'),(11304,0,3,10965,'tfdashboardportlet_WAR_tfdashboardportlet','<portlet-preferences />'),(11305,0,3,10705,'145','<portlet-preferences />'),(11306,0,3,10705,'2_WAR_notificationsportlet','<portlet-preferences />'),(11307,0,3,10705,'tfregistrationportlet_WAR_tfregistrationportlet','<portlet-preferences />'),(11329,0,3,10971,'145','<portlet-preferences />'),(11330,0,3,10971,'2_WAR_notificationsportlet','<portlet-preferences />'),(11331,0,3,10971,'scfinvoiceportlet_WAR_scfinvoiceportlet','<portlet-preferences />'),(11332,0,3,10176,'137','<portlet-preferences />'),(11333,0,3,10967,'145','<portlet-preferences />'),(11334,0,3,10967,'2_WAR_notificationsportlet','<portlet-preferences />'),(11335,0,3,10967,'tfcompanyportlet_WAR_tfadminportlet','<portlet-preferences />'),(11401,0,3,10176,'125','<portlet-preferences />'),(11405,0,3,10176,'127','<portlet-preferences />'),(11406,0,3,10176,'128','<portlet-preferences />'),(11601,0,3,10176,'20','<portlet-preferences />'),(11701,0,3,11420,'145','<portlet-preferences />'),(11702,0,3,11420,'2_WAR_notificationsportlet','<portlet-preferences />'),(11703,0,3,10176,'2','<portlet-preferences />'),(11704,0,3,10176,'140','<portlet-preferences />'),(11705,0,3,10176,'153','<portlet-preferences />'),(11706,0,3,10176,'158','<portlet-preferences />'),(11720,0,3,10973,'145','<portlet-preferences />'),(11721,0,3,10973,'2_WAR_notificationsportlet','<portlet-preferences />'),(11722,0,3,10973,'scftradeportlet_WAR_scftradeportlet','<portlet-preferences />'),(11821,0,3,10977,'145','<portlet-preferences />'),(11822,0,3,10977,'2_WAR_notificationsportlet','<portlet-preferences />'),(11824,0,3,10977,'tfsettingsportlet_WAR_tfsettingsportlet','<portlet-preferences />'),(11901,0,3,10975,'145','<portlet-preferences />'),(11902,0,3,10975,'2_WAR_notificationsportlet','<portlet-preferences />'),(11903,0,3,10975,'scfinvestorportlet_WAR_scfinvestorportlet','<portlet-preferences />'),(12080,0,3,10176,'182','<portlet-preferences />'),(12507,0,3,12501,'145','<portlet-preferences />'),(12508,0,3,12501,'2_WAR_notificationsportlet','<portlet-preferences />'),(12509,0,3,12501,'tfreportportlet_WAR_tfreportportlet','<portlet-preferences />');

/*Table structure for table `quartz_blob_triggers` */

DROP TABLE IF EXISTS `quartz_blob_triggers`;

CREATE TABLE `quartz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_blob_triggers` */

/*Table structure for table `quartz_calendars` */

DROP TABLE IF EXISTS `quartz_calendars`;

CREATE TABLE `quartz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` longblob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_calendars` */

/*Table structure for table `quartz_cron_triggers` */

DROP TABLE IF EXISTS `quartz_cron_triggers`;

CREATE TABLE `quartz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_cron_triggers` */

/*Table structure for table `quartz_fired_triggers` */

DROP TABLE IF EXISTS `quartz_fired_triggers`;

CREATE TABLE `quartz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(20) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` tinyint(4) DEFAULT NULL,
  `REQUESTS_RECOVERY` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IX_BE3835E5` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IX_4BD722BM` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IX_204D31E8` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IX_339E078M` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IX_5005E3AF` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IX_BC2F03B0` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_fired_triggers` */

/*Table structure for table `quartz_job_details` */

DROP TABLE IF EXISTS `quartz_job_details`;

CREATE TABLE `quartz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` tinyint(4) NOT NULL,
  `IS_NONCONCURRENT` tinyint(4) NOT NULL,
  `IS_UPDATE_DATA` tinyint(4) NOT NULL,
  `REQUESTS_RECOVERY` tinyint(4) NOT NULL,
  `JOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IX_88328984` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IX_779BCA37` (`SCHED_NAME`,`REQUESTS_RECOVERY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_job_details` */

/*Table structure for table `quartz_locks` */

DROP TABLE IF EXISTS `quartz_locks`;

CREATE TABLE `quartz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_locks` */

/*Table structure for table `quartz_paused_trigger_grps` */

DROP TABLE IF EXISTS `quartz_paused_trigger_grps`;

CREATE TABLE `quartz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_paused_trigger_grps` */

/*Table structure for table `quartz_scheduler_state` */

DROP TABLE IF EXISTS `quartz_scheduler_state`;

CREATE TABLE `quartz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(20) NOT NULL,
  `CHECKIN_INTERVAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_scheduler_state` */

/*Table structure for table `quartz_simple_triggers` */

DROP TABLE IF EXISTS `quartz_simple_triggers`;

CREATE TABLE `quartz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(20) NOT NULL,
  `REPEAT_INTERVAL` bigint(20) NOT NULL,
  `TIMES_TRIGGERED` bigint(20) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_simple_triggers` */

/*Table structure for table `quartz_simprop_triggers` */

DROP TABLE IF EXISTS `quartz_simprop_triggers`;

CREATE TABLE `quartz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` tinyint(4) DEFAULT NULL,
  `BOOL_PROP_2` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_simprop_triggers` */

/*Table structure for table `quartz_triggers` */

DROP TABLE IF EXISTS `quartz_triggers`;

CREATE TABLE `quartz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(20) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` int(11) DEFAULT NULL,
  `JOB_DATA` longblob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IX_186442A4` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IX_1BA1F9DC` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IX_91CA7CCE` (`SCHED_NAME`,`TRIGGER_GROUP`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`,`MISFIRE_INSTR`),
  KEY `IX_D219AFDE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IX_A85822A0` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IX_8AA50BE1` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IX_EEFE382A` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IX_F026CF4C` (`SCHED_NAME`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IX_F2DD7C7E` (`SCHED_NAME`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`,`MISFIRE_INSTR`),
  KEY `IX_1F92813C` (`SCHED_NAME`,`NEXT_FIRE_TIME`,`MISFIRE_INSTR`),
  KEY `IX_99108B6E` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IX_CD7132D0` (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quartz_triggers` */

/*Table structure for table `ratingsentry` */

DROP TABLE IF EXISTS `ratingsentry`;

CREATE TABLE `ratingsentry` (
  `entryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_B47E3C11` (`userId`,`classNameId`,`classPK`),
  KEY `IX_16184D57` (`classNameId`,`classPK`),
  KEY `IX_A1A8CB8B` (`classNameId`,`classPK`,`score`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ratingsentry` */

/*Table structure for table `ratingsstats` */

DROP TABLE IF EXISTS `ratingsstats`;

CREATE TABLE `ratingsstats` (
  `statsId` bigint(20) NOT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `totalScore` double DEFAULT NULL,
  `averageScore` double DEFAULT NULL,
  PRIMARY KEY (`statsId`),
  UNIQUE KEY `IX_A6E99284` (`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ratingsstats` */

insert  into `ratingsstats`(`statsId`,`classNameId`,`classPK`,`totalEntries`,`totalScore`,`averageScore`) values (10628,10011,10566,0,0,0),(10629,10011,10545,0,0,0),(10630,10011,10576,0,0,0),(10631,10011,10535,0,0,0),(10632,10011,10554,0,0,0),(10633,10011,10526,0,0,0),(10716,10012,10713,0,0,0),(10720,10012,10717,0,0,0),(10724,10012,10721,0,0,0),(10728,10012,10725,0,0,0),(10732,10012,10729,0,0,0),(10736,10012,10733,0,0,0),(10740,10012,10737,0,0,0),(10744,10012,10741,0,0,0),(10748,10012,10745,0,0,0),(10752,10012,10749,0,0,0),(10756,10012,10753,0,0,0),(10760,10012,10757,0,0,0),(10764,10012,10761,0,0,0),(10773,10011,10765,0,0,0),(10782,10011,10774,0,0,0),(10791,10011,10783,0,0,0),(10800,10011,10792,0,0,0),(10809,10011,10801,0,0,0),(10818,10011,10810,0,0,0),(10827,10011,10819,0,0,0),(10836,10011,10828,0,0,0),(10845,10011,10837,0,0,0),(10854,10011,10846,0,0,0),(10863,10011,10855,0,0,0),(11198,10109,11180,0,0,0),(11199,10109,11163,0,0,0),(11200,10109,11172,0,0,0),(11837,10011,11829,0,0,0),(12174,10109,12167,0,0,0),(12200,10109,12193,0,0,0),(12226,10109,12219,0,0,0),(12248,10109,12241,0,0,0),(12266,10109,12259,0,0,0),(12288,10109,12281,0,0,0);

/*Table structure for table `region` */

DROP TABLE IF EXISTS `region`;

CREATE TABLE `region` (
  `regionId` bigint(20) NOT NULL,
  `countryId` bigint(20) DEFAULT NULL,
  `regionCode` varchar(75) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`regionId`),
  UNIQUE KEY `IX_A2635F5C` (`countryId`,`regionCode`),
  KEY `IX_2D9A426F` (`active_`),
  KEY `IX_16D87CA7` (`countryId`),
  KEY `IX_11FB3E42` (`countryId`,`active_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `region` */

insert  into `region`(`regionId`,`countryId`,`regionCode`,`name`,`active_`) values (1001,1,'AB','Alberta',1),(1002,1,'BC','British Columbia',1),(1003,1,'MB','Manitoba',1),(1004,1,'NB','New Brunswick',1),(1005,1,'NL','Newfoundland and Labrador',1),(1006,1,'NT','Northwest Territories',1),(1007,1,'NS','Nova Scotia',1),(1008,1,'NU','Nunavut',1),(1009,1,'ON','Ontario',1),(1010,1,'PE','Prince Edward Island',1),(1011,1,'QC','Quebec',1),(1012,1,'SK','Saskatchewan',1),(1013,1,'YT','Yukon',1),(2001,2,'CN-34','Anhui',1),(2002,2,'CN-92','Aomen',1),(2003,2,'CN-11','Beijing',1),(2004,2,'CN-50','Chongqing',1),(2005,2,'CN-35','Fujian',1),(2006,2,'CN-62','Gansu',1),(2007,2,'CN-44','Guangdong',1),(2008,2,'CN-45','Guangxi',1),(2009,2,'CN-52','Guizhou',1),(2010,2,'CN-46','Hainan',1),(2011,2,'CN-13','Hebei',1),(2012,2,'CN-23','Heilongjiang',1),(2013,2,'CN-41','Henan',1),(2014,2,'CN-42','Hubei',1),(2015,2,'CN-43','Hunan',1),(2016,2,'CN-32','Jiangsu',1),(2017,2,'CN-36','Jiangxi',1),(2018,2,'CN-22','Jilin',1),(2019,2,'CN-21','Liaoning',1),(2020,2,'CN-15','Nei Mongol',1),(2021,2,'CN-64','Ningxia',1),(2022,2,'CN-63','Qinghai',1),(2023,2,'CN-61','Shaanxi',1),(2024,2,'CN-37','Shandong',1),(2025,2,'CN-31','Shanghai',1),(2026,2,'CN-14','Shanxi',1),(2027,2,'CN-51','Sichuan',1),(2028,2,'CN-71','Taiwan',1),(2029,2,'CN-12','Tianjin',1),(2030,2,'CN-91','Xianggang',1),(2031,2,'CN-65','Xinjiang',1),(2032,2,'CN-54','Xizang',1),(2033,2,'CN-53','Yunnan',1),(2034,2,'CN-33','Zhejiang',1),(3001,3,'A','Alsace',1),(3002,3,'B','Aquitaine',1),(3003,3,'C','Auvergne',1),(3004,3,'P','Basse-Normandie',1),(3005,3,'D','Bourgogne',1),(3006,3,'E','Bretagne',1),(3007,3,'F','Centre',1),(3008,3,'G','Champagne-Ardenne',1),(3009,3,'H','Corse',1),(3010,3,'GF','Guyane',1),(3011,3,'I','Franche Comté',1),(3012,3,'GP','Guadeloupe',1),(3013,3,'Q','Haute-Normandie',1),(3014,3,'J','Île-de-France',1),(3015,3,'K','Languedoc-Roussillon',1),(3016,3,'L','Limousin',1),(3017,3,'M','Lorraine',1),(3018,3,'MQ','Martinique',1),(3019,3,'N','Midi-Pyrénées',1),(3020,3,'O','Nord Pas de Calais',1),(3021,3,'R','Pays de la Loire',1),(3022,3,'S','Picardie',1),(3023,3,'T','Poitou-Charentes',1),(3024,3,'U','Provence-Alpes-Côte-d\'Azur',1),(3025,3,'RE','Réunion',1),(3026,3,'V','Rhône-Alpes',1),(4001,4,'BW','Baden-Württemberg',1),(4002,4,'BY','Bayern',1),(4003,4,'BE','Berlin',1),(4004,4,'BR','Brandenburg',1),(4005,4,'HB','Bremen',1),(4006,4,'HH','Hamburg',1),(4007,4,'HE','Hessen',1),(4008,4,'MV','Mecklenburg-Vorpommern',1),(4009,4,'NI','Niedersachsen',1),(4010,4,'NW','Nordrhein-Westfalen',1),(4011,4,'RP','Rheinland-Pfalz',1),(4012,4,'SL','Saarland',1),(4013,4,'SN','Sachsen',1),(4014,4,'ST','Sachsen-Anhalt',1),(4015,4,'SH','Schleswig-Holstein',1),(4016,4,'TH','Thüringen',1),(8001,8,'AG','Agrigento',1),(8002,8,'AL','Alessandria',1),(8003,8,'AN','Ancona',1),(8004,8,'AO','Aosta',1),(8005,8,'AR','Arezzo',1),(8006,8,'AP','Ascoli Piceno',1),(8007,8,'AT','Asti',1),(8008,8,'AV','Avellino',1),(8009,8,'BA','Bari',1),(8010,8,'BT','Barletta-Andria-Trani',1),(8011,8,'BL','Belluno',1),(8012,8,'BN','Benevento',1),(8013,8,'BG','Bergamo',1),(8014,8,'BI','Biella',1),(8015,8,'BO','Bologna',1),(8016,8,'BZ','Bolzano',1),(8017,8,'BS','Brescia',1),(8018,8,'BR','Brindisi',1),(8019,8,'CA','Cagliari',1),(8020,8,'CL','Caltanissetta',1),(8021,8,'CB','Campobasso',1),(8022,8,'CI','Carbonia-Iglesias',1),(8023,8,'CE','Caserta',1),(8024,8,'CT','Catania',1),(8025,8,'CZ','Catanzaro',1),(8026,8,'CH','Chieti',1),(8027,8,'CO','Como',1),(8028,8,'CS','Cosenza',1),(8029,8,'CR','Cremona',1),(8030,8,'KR','Crotone',1),(8031,8,'CN','Cuneo',1),(8032,8,'EN','Enna',1),(8033,8,'FM','Fermo',1),(8034,8,'FE','Ferrara',1),(8035,8,'FI','Firenze',1),(8036,8,'FG','Foggia',1),(8037,8,'FC','Forli-Cesena',1),(8038,8,'FR','Frosinone',1),(8039,8,'GE','Genova',1),(8040,8,'GO','Gorizia',1),(8041,8,'GR','Grosseto',1),(8042,8,'IM','Imperia',1),(8043,8,'IS','Isernia',1),(8044,8,'AQ','L\'Aquila',1),(8045,8,'SP','La Spezia',1),(8046,8,'LT','Latina',1),(8047,8,'LE','Lecce',1),(8048,8,'LC','Lecco',1),(8049,8,'LI','Livorno',1),(8050,8,'LO','Lodi',1),(8051,8,'LU','Lucca',1),(8052,8,'MC','Macerata',1),(8053,8,'MN','Mantova',1),(8054,8,'MS','Massa-Carrara',1),(8055,8,'MT','Matera',1),(8056,8,'MA','Medio Campidano',1),(8057,8,'ME','Messina',1),(8058,8,'MI','Milano',1),(8059,8,'MO','Modena',1),(8060,8,'MZ','Monza',1),(8061,8,'NA','Napoli',1),(8062,8,'NO','Novara',1),(8063,8,'NU','Nuoro',1),(8064,8,'OG','Ogliastra',1),(8065,8,'OT','Olbia-Tempio',1),(8066,8,'OR','Oristano',1),(8067,8,'PD','Padova',1),(8068,8,'PA','Palermo',1),(8069,8,'PR','Parma',1),(8070,8,'PV','Pavia',1),(8071,8,'PG','Perugia',1),(8072,8,'PU','Pesaro e Urbino',1),(8073,8,'PE','Pescara',1),(8074,8,'PC','Piacenza',1),(8075,8,'PI','Pisa',1),(8076,8,'PT','Pistoia',1),(8077,8,'PN','Pordenone',1),(8078,8,'PZ','Potenza',1),(8079,8,'PO','Prato',1),(8080,8,'RG','Ragusa',1),(8081,8,'RA','Ravenna',1),(8082,8,'RC','Reggio Calabria',1),(8083,8,'RE','Reggio Emilia',1),(8084,8,'RI','Rieti',1),(8085,8,'RN','Rimini',1),(8086,8,'RM','Roma',1),(8087,8,'RO','Rovigo',1),(8088,8,'SA','Salerno',1),(8089,8,'SS','Sassari',1),(8090,8,'SV','Savona',1),(8091,8,'SI','Siena',1),(8092,8,'SR','Siracusa',1),(8093,8,'SO','Sondrio',1),(8094,8,'TA','Taranto',1),(8095,8,'TE','Teramo',1),(8096,8,'TR','Terni',1),(8097,8,'TO','Torino',1),(8098,8,'TP','Trapani',1),(8099,8,'TN','Trento',1),(8100,8,'TV','Treviso',1),(8101,8,'TS','Trieste',1),(8102,8,'UD','Udine',1),(8103,8,'VA','Varese',1),(8104,8,'VE','Venezia',1),(8105,8,'VB','Verbano-Cusio-Ossola',1),(8106,8,'VC','Vercelli',1),(8107,8,'VR','Verona',1),(8108,8,'VV','Vibo Valentia',1),(8109,8,'VI','Vicenza',1),(8110,8,'VT','Viterbo',1),(11001,11,'DR','Drenthe',1),(11002,11,'FL','Flevoland',1),(11003,11,'FR','Friesland',1),(11004,11,'GE','Gelderland',1),(11005,11,'GR','Groningen',1),(11006,11,'LI','Limburg',1),(11007,11,'NB','Noord-Brabant',1),(11008,11,'NH','Noord-Holland',1),(11009,11,'OV','Overijssel',1),(11010,11,'UT','Utrecht',1),(11011,11,'ZE','Zeeland',1),(11012,11,'ZH','Zuid-Holland',1),(15001,15,'AN','Andalusia',1),(15002,15,'AR','Aragon',1),(15003,15,'AS','Asturias',1),(15004,15,'IB','Balearic Islands',1),(15005,15,'PV','Basque Country',1),(15006,15,'CN','Canary Islands',1),(15007,15,'CB','Cantabria',1),(15008,15,'CL','Castile and Leon',1),(15009,15,'CM','Castile-La Mancha',1),(15010,15,'CT','Catalonia',1),(15011,15,'CE','Ceuta',1),(15012,15,'EX','Extremadura',1),(15013,15,'GA','Galicia',1),(15014,15,'LO','La Rioja',1),(15015,15,'M','Madrid',1),(15016,15,'ML','Melilla',1),(15017,15,'MU','Murcia',1),(15018,15,'NA','Navarra',1),(15019,15,'VC','Valencia',1),(19001,19,'AL','Alabama',1),(19002,19,'AK','Alaska',1),(19003,19,'AZ','Arizona',1),(19004,19,'AR','Arkansas',1),(19005,19,'CA','California',1),(19006,19,'CO','Colorado',1),(19007,19,'CT','Connecticut',1),(19008,19,'DC','District of Columbia',1),(19009,19,'DE','Delaware',1),(19010,19,'FL','Florida',1),(19011,19,'GA','Georgia',1),(19012,19,'HI','Hawaii',1),(19013,19,'ID','Idaho',1),(19014,19,'IL','Illinois',1),(19015,19,'IN','Indiana',1),(19016,19,'IA','Iowa',1),(19017,19,'KS','Kansas',1),(19018,19,'KY','Kentucky ',1),(19019,19,'LA','Louisiana ',1),(19020,19,'ME','Maine',1),(19021,19,'MD','Maryland',1),(19022,19,'MA','Massachusetts',1),(19023,19,'MI','Michigan',1),(19024,19,'MN','Minnesota',1),(19025,19,'MS','Mississippi',1),(19026,19,'MO','Missouri',1),(19027,19,'MT','Montana',1),(19028,19,'NE','Nebraska',1),(19029,19,'NV','Nevada',1),(19030,19,'NH','New Hampshire',1),(19031,19,'NJ','New Jersey',1),(19032,19,'NM','New Mexico',1),(19033,19,'NY','New York',1),(19034,19,'NC','North Carolina',1),(19035,19,'ND','North Dakota',1),(19036,19,'OH','Ohio',1),(19037,19,'OK','Oklahoma ',1),(19038,19,'OR','Oregon',1),(19039,19,'PA','Pennsylvania',1),(19040,19,'PR','Puerto Rico',1),(19041,19,'RI','Rhode Island',1),(19042,19,'SC','South Carolina',1),(19043,19,'SD','South Dakota',1),(19044,19,'TN','Tennessee',1),(19045,19,'TX','Texas',1),(19046,19,'UT','Utah',1),(19047,19,'VT','Vermont',1),(19048,19,'VA','Virginia',1),(19049,19,'WA','Washington',1),(19050,19,'WV','West Virginia',1),(19051,19,'WI','Wisconsin',1),(19052,19,'WY','Wyoming',1),(32001,32,'ACT','Australian Capital Territory',1),(32002,32,'NSW','New South Wales',1),(32003,32,'NT','Northern Territory',1),(32004,32,'QLD','Queensland',1),(32005,32,'SA','South Australia',1),(32006,32,'TAS','Tasmania',1),(32007,32,'VIC','Victoria',1),(32008,32,'WA','Western Australia',1),(144001,144,'MX-AGS','Aguascalientes',1),(144002,144,'MX-BCN','Baja California',1),(144003,144,'MX-BCS','Baja California Sur',1),(144004,144,'MX-CAM','Campeche',1),(144005,144,'MX-CHP','Chiapas',1),(144006,144,'MX-CHI','Chihuahua',1),(144007,144,'MX-COA','Coahuila',1),(144008,144,'MX-COL','Colima',1),(144009,144,'MX-DUR','Durango',1),(144010,144,'MX-GTO','Guanajuato',1),(144011,144,'MX-GRO','Guerrero',1),(144012,144,'MX-HGO','Hidalgo',1),(144013,144,'MX-JAL','Jalisco',1),(144014,144,'MX-MEX','Mexico',1),(144015,144,'MX-MIC','Michoacan',1),(144016,144,'MX-MOR','Morelos',1),(144017,144,'MX-NAY','Nayarit',1),(144018,144,'MX-NLE','Nuevo Leon',1),(144019,144,'MX-OAX','Oaxaca',1),(144020,144,'MX-PUE','Puebla',1),(144021,144,'MX-QRO','Queretaro',1),(144023,144,'MX-ROO','Quintana Roo',1),(144024,144,'MX-SLP','San Luis Potosí',1),(144025,144,'MX-SIN','Sinaloa',1),(144026,144,'MX-SON','Sonora',1),(144027,144,'MX-TAB','Tabasco',1),(144028,144,'MX-TAM','Tamaulipas',1),(144029,144,'MX-TLX','Tlaxcala',1),(144030,144,'MX-VER','Veracruz',1),(144031,144,'MX-YUC','Yucatan',1),(144032,144,'MX-ZAC','Zacatecas',1),(164001,164,'01','Østfold',1),(164002,164,'02','Akershus',1),(164003,164,'03','Oslo',1),(164004,164,'04','Hedmark',1),(164005,164,'05','Oppland',1),(164006,164,'06','Buskerud',1),(164007,164,'07','Vestfold',1),(164008,164,'08','Telemark',1),(164009,164,'09','Aust-Agder',1),(164010,164,'10','Vest-Agder',1),(164011,164,'11','Rogaland',1),(164012,164,'12','Hordaland',1),(164013,164,'14','Sogn og Fjordane',1),(164014,164,'15','Møre of Romsdal',1),(164015,164,'16','Sør-Trøndelag',1),(164016,164,'17','Nord-Trøndelag',1),(164017,164,'18','Nordland',1),(164018,164,'19','Troms',1),(164019,164,'20','Finnmark',1),(202001,202,'AG','Aargau',1),(202002,202,'AR','Appenzell Ausserrhoden',1),(202003,202,'AI','Appenzell Innerrhoden',1),(202004,202,'BL','Basel-Landschaft',1),(202005,202,'BS','Basel-Stadt',1),(202006,202,'BE','Bern',1),(202007,202,'FR','Fribourg',1),(202008,202,'GE','Geneva',1),(202009,202,'GL','Glarus',1),(202010,202,'GR','Graubünden',1),(202011,202,'JU','Jura',1),(202012,202,'LU','Lucerne',1),(202013,202,'NE','Neuchâtel',1),(202014,202,'NW','Nidwalden',1),(202015,202,'OW','Obwalden',1),(202016,202,'SH','Schaffhausen',1),(202017,202,'SZ','Schwyz',1),(202018,202,'SO','Solothurn',1),(202019,202,'SG','St. Gallen',1),(202020,202,'TG','Thurgau',1),(202021,202,'TI','Ticino',1),(202022,202,'UR','Uri',1),(202023,202,'VS','Valais',1),(202024,202,'VD','Vaud',1),(202025,202,'ZG','Zug',1),(202026,202,'ZH','Zürich',1);

/*Table structure for table `release_` */

DROP TABLE IF EXISTS `release_`;

CREATE TABLE `release_` (
  `releaseId` bigint(20) NOT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `servletContextName` varchar(75) DEFAULT NULL,
  `buildNumber` int(11) DEFAULT NULL,
  `buildDate` datetime DEFAULT NULL,
  `verified` tinyint(4) DEFAULT NULL,
  `state_` int(11) DEFAULT NULL,
  `testString` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`releaseId`),
  UNIQUE KEY `IX_8BD6BCA7` (`servletContextName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `release_` */

insert  into `release_`(`releaseId`,`createDate`,`modifiedDate`,`servletContextName`,`buildNumber`,`buildDate`,`verified`,`state_`,`testString`) values (1,'2016-03-16 00:43:34','2016-03-24 20:17:08','portal',6202,'2016-03-24 20:17:08',1,0,'You take the blue pill, the story ends, you wake up in your bed and believe whatever you want to believe. You take the red pill, you stay in Wonderland, and I show you how deep the rabbit hole goes.'),(10437,'2016-03-15 19:17:15','2016-03-24 20:17:33','marketplace-portlet',100,NULL,1,0,''),(10445,'2016-03-15 19:17:30','2016-03-24 20:17:35','calendar-portlet',100,NULL,1,0,''),(10464,'2016-03-15 19:17:51','2016-03-24 20:17:41','kaleo-web',110,NULL,1,0,''),(10496,'2016-03-15 19:17:58','2016-03-24 20:17:44','notifications-portlet',110,NULL,1,0,'');

/*Table structure for table `repository` */

DROP TABLE IF EXISTS `repository`;

CREATE TABLE `repository` (
  `uuid_` varchar(75) DEFAULT NULL,
  `repositoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `portletId` varchar(200) DEFAULT NULL,
  `typeSettings` longtext,
  `dlFolderId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`repositoryId`),
  UNIQUE KEY `IX_60C8634C` (`groupId`,`name`,`portletId`),
  UNIQUE KEY `IX_11641E26` (`uuid_`,`groupId`),
  KEY `IX_5253B1FA` (`groupId`),
  KEY `IX_74C17B04` (`uuid_`),
  KEY `IX_F543EA4` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `repository` */

insert  into `repository`(`uuid_`,`repositoryId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`name`,`description`,`portletId`,`typeSettings`,`dlFolderId`) values ('9b76c14f-4932-4b0c-872f-1ffea12eafb5',10665,10182,10155,10159,'','2016-03-15 20:49:46','2016-03-15 20:49:46',10525,'20','','20','',10666),('0141c9ac-1694-47f0-8cff-e6fc2143b1ea',10674,10182,10155,10159,'','2016-03-15 20:50:46','2016-03-15 20:50:46',10525,'189','','189','',10675);

/*Table structure for table `repositoryentry` */

DROP TABLE IF EXISTS `repositoryentry`;

CREATE TABLE `repositoryentry` (
  `uuid_` varchar(75) DEFAULT NULL,
  `repositoryEntryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `mappedId` varchar(75) DEFAULT NULL,
  `manualCheckInRequired` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`repositoryEntryId`),
  UNIQUE KEY `IX_9BDCF489` (`repositoryId`,`mappedId`),
  UNIQUE KEY `IX_354AA664` (`uuid_`,`groupId`),
  KEY `IX_B7034B27` (`repositoryId`),
  KEY `IX_B9B1506` (`uuid_`),
  KEY `IX_D3B9AF62` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `repositoryentry` */

/*Table structure for table `resourceaction` */

DROP TABLE IF EXISTS `resourceaction`;

CREATE TABLE `resourceaction` (
  `resourceActionId` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actionId` varchar(75) DEFAULT NULL,
  `bitwiseValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceActionId`),
  UNIQUE KEY `IX_EDB9986E` (`name`,`actionId`),
  KEY `IX_81F2DB09` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resourceaction` */

insert  into `resourceaction`(`resourceActionId`,`name`,`actionId`,`bitwiseValue`) values (1,'com.liferay.portlet.softwarecatalog','ADD_FRAMEWORK_VERSION',2),(2,'com.liferay.portlet.softwarecatalog','ADD_PRODUCT_ENTRY',4),(3,'com.liferay.portlet.softwarecatalog','PERMISSIONS',8),(4,'com.liferay.portal.model.Team','ASSIGN_MEMBERS',2),(5,'com.liferay.portal.model.Team','DELETE',4),(6,'com.liferay.portal.model.Team','PERMISSIONS',8),(7,'com.liferay.portal.model.Team','UPDATE',16),(8,'com.liferay.portal.model.Team','VIEW',1),(9,'com.liferay.portal.model.PasswordPolicy','ASSIGN_MEMBERS',2),(10,'com.liferay.portal.model.PasswordPolicy','DELETE',4),(11,'com.liferay.portal.model.PasswordPolicy','PERMISSIONS',8),(12,'com.liferay.portal.model.PasswordPolicy','UPDATE',16),(13,'com.liferay.portal.model.PasswordPolicy','VIEW',1),(14,'com.liferay.portlet.blogs.model.BlogsEntry','ADD_DISCUSSION',2),(15,'com.liferay.portlet.blogs.model.BlogsEntry','DELETE',4),(16,'com.liferay.portlet.blogs.model.BlogsEntry','DELETE_DISCUSSION',8),(17,'com.liferay.portlet.blogs.model.BlogsEntry','PERMISSIONS',16),(18,'com.liferay.portlet.blogs.model.BlogsEntry','UPDATE',32),(19,'com.liferay.portlet.blogs.model.BlogsEntry','UPDATE_DISCUSSION',64),(20,'com.liferay.portlet.blogs.model.BlogsEntry','VIEW',1),(21,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','DELETE',2),(22,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','PERMISSIONS',4),(23,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','UPDATE',8),(24,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','VIEW',1),(25,'com.liferay.portlet.journal.model.JournalFeed','DELETE',2),(26,'com.liferay.portlet.journal.model.JournalFeed','PERMISSIONS',4),(27,'com.liferay.portlet.journal.model.JournalFeed','UPDATE',8),(28,'com.liferay.portlet.journal.model.JournalFeed','VIEW',1),(29,'com.liferay.portlet.wiki.model.WikiNode','ADD_ATTACHMENT',2),(30,'com.liferay.portlet.wiki.model.WikiNode','ADD_PAGE',4),(31,'com.liferay.portlet.wiki.model.WikiNode','DELETE',8),(32,'com.liferay.portlet.wiki.model.WikiNode','IMPORT',16),(33,'com.liferay.portlet.wiki.model.WikiNode','PERMISSIONS',32),(34,'com.liferay.portlet.wiki.model.WikiNode','SUBSCRIBE',64),(35,'com.liferay.portlet.wiki.model.WikiNode','UPDATE',128),(36,'com.liferay.portlet.wiki.model.WikiNode','VIEW',1),(37,'com.liferay.portlet.announcements.model.AnnouncementsEntry','DELETE',2),(38,'com.liferay.portlet.announcements.model.AnnouncementsEntry','UPDATE',4),(39,'com.liferay.portlet.announcements.model.AnnouncementsEntry','VIEW',1),(40,'com.liferay.portlet.announcements.model.AnnouncementsEntry','PERMISSIONS',8),(41,'com.liferay.portlet.bookmarks','ADD_ENTRY',2),(42,'com.liferay.portlet.bookmarks','ADD_FOLDER',4),(43,'com.liferay.portlet.bookmarks','PERMISSIONS',8),(44,'com.liferay.portlet.bookmarks','SUBSCRIBE',16),(45,'com.liferay.portlet.bookmarks','VIEW',1),(46,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','DELETE',2),(47,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','PERMISSIONS',4),(48,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','UPDATE',8),(49,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','VIEW',1),(50,'com.liferay.portlet.asset.model.AssetVocabulary','DELETE',2),(51,'com.liferay.portlet.asset.model.AssetVocabulary','PERMISSIONS',4),(52,'com.liferay.portlet.asset.model.AssetVocabulary','UPDATE',8),(53,'com.liferay.portlet.asset.model.AssetVocabulary','VIEW',1),(54,'com.liferay.portlet.documentlibrary.model.DLFolder','ACCESS',2),(55,'com.liferay.portlet.documentlibrary.model.DLFolder','ADD_DOCUMENT',4),(56,'com.liferay.portlet.documentlibrary.model.DLFolder','ADD_SHORTCUT',8),(57,'com.liferay.portlet.documentlibrary.model.DLFolder','ADD_SUBFOLDER',16),(58,'com.liferay.portlet.documentlibrary.model.DLFolder','DELETE',32),(59,'com.liferay.portlet.documentlibrary.model.DLFolder','PERMISSIONS',64),(60,'com.liferay.portlet.documentlibrary.model.DLFolder','UPDATE',128),(61,'com.liferay.portlet.documentlibrary.model.DLFolder','VIEW',1),(62,'com.liferay.portlet.expando.model.ExpandoColumn','DELETE',2),(63,'com.liferay.portlet.expando.model.ExpandoColumn','PERMISSIONS',4),(64,'com.liferay.portlet.expando.model.ExpandoColumn','UPDATE',8),(65,'com.liferay.portlet.expando.model.ExpandoColumn','VIEW',1),(66,'com.liferay.portlet.documentlibrary','ADD_DOCUMENT',2),(67,'com.liferay.portlet.documentlibrary','ADD_DOCUMENT_TYPE',4),(68,'com.liferay.portlet.documentlibrary','ADD_FOLDER',8),(69,'com.liferay.portlet.documentlibrary','ADD_REPOSITORY',16),(70,'com.liferay.portlet.documentlibrary','ADD_STRUCTURE',32),(71,'com.liferay.portlet.documentlibrary','ADD_SHORTCUT',64),(72,'com.liferay.portlet.documentlibrary','PERMISSIONS',128),(73,'com.liferay.portlet.documentlibrary','SUBSCRIBE',256),(74,'com.liferay.portlet.documentlibrary','UPDATE',512),(75,'com.liferay.portlet.documentlibrary','VIEW',1),(76,'com.liferay.portlet.calendar.model.CalEvent','ADD_DISCUSSION',2),(77,'com.liferay.portlet.calendar.model.CalEvent','DELETE',4),(78,'com.liferay.portlet.calendar.model.CalEvent','DELETE_DISCUSSION',8),(79,'com.liferay.portlet.calendar.model.CalEvent','PERMISSIONS',16),(80,'com.liferay.portlet.calendar.model.CalEvent','UPDATE',32),(81,'com.liferay.portlet.calendar.model.CalEvent','UPDATE_DISCUSSION',64),(82,'com.liferay.portlet.calendar.model.CalEvent','VIEW',1),(83,'com.liferay.portlet.shopping.model.ShoppingCategory','ADD_ITEM',2),(84,'com.liferay.portlet.shopping.model.ShoppingCategory','ADD_SUBCATEGORY',4),(85,'com.liferay.portlet.shopping.model.ShoppingCategory','DELETE',8),(86,'com.liferay.portlet.shopping.model.ShoppingCategory','PERMISSIONS',16),(87,'com.liferay.portlet.shopping.model.ShoppingCategory','UPDATE',32),(88,'com.liferay.portlet.shopping.model.ShoppingCategory','VIEW',1),(89,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','DELETE',2),(90,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','PERMISSIONS',4),(91,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','UPDATE',8),(92,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','VIEW',1),(93,'com.liferay.portlet.journal','ADD_ARTICLE',2),(94,'com.liferay.portlet.journal','ADD_FEED',4),(95,'com.liferay.portlet.journal','ADD_FOLDER',8),(96,'com.liferay.portlet.journal','ADD_STRUCTURE',16),(97,'com.liferay.portlet.journal','ADD_TEMPLATE',32),(98,'com.liferay.portlet.journal','SUBSCRIBE',64),(99,'com.liferay.portlet.journal','VIEW',1),(100,'com.liferay.portlet.journal','PERMISSIONS',128),(101,'com.liferay.portlet.calendar','ADD_EVENT',2),(102,'com.liferay.portlet.calendar','EXPORT_ALL_EVENTS',4),(103,'com.liferay.portlet.calendar','PERMISSIONS',8),(104,'com.liferay.portal.model.LayoutPrototype','DELETE',2),(105,'com.liferay.portal.model.LayoutPrototype','PERMISSIONS',4),(106,'com.liferay.portal.model.LayoutPrototype','UPDATE',8),(107,'com.liferay.portal.model.LayoutPrototype','VIEW',1),(108,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','ADD_RECORD',2),(109,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','DELETE',4),(110,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','PERMISSIONS',8),(111,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','UPDATE',16),(112,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','VIEW',1),(113,'com.liferay.portal.model.Organization','ADD_ORGANIZATION',2),(114,'com.liferay.portal.model.Organization','ASSIGN_MEMBERS',4),(115,'com.liferay.portal.model.Organization','ASSIGN_USER_ROLES',8),(116,'com.liferay.portal.model.Organization','DELETE',16),(117,'com.liferay.portal.model.Organization','MANAGE_ANNOUNCEMENTS',32),(118,'com.liferay.portal.model.Organization','MANAGE_SUBORGANIZATIONS',64),(119,'com.liferay.portal.model.Organization','MANAGE_USERS',128),(120,'com.liferay.portal.model.Organization','PERMISSIONS',256),(121,'com.liferay.portal.model.Organization','UPDATE',512),(122,'com.liferay.portal.model.Organization','VIEW',1),(123,'com.liferay.portal.model.Organization','VIEW_MEMBERS',1024),(124,'com.liferay.portlet.softwarecatalog.model.SCLicense','DELETE',2),(125,'com.liferay.portlet.softwarecatalog.model.SCLicense','PERMISSIONS',4),(126,'com.liferay.portlet.softwarecatalog.model.SCLicense','UPDATE',8),(127,'com.liferay.portlet.softwarecatalog.model.SCLicense','VIEW',1),(128,'com.liferay.portlet.journal.model.JournalFolder','ACCESS',2),(129,'com.liferay.portlet.journal.model.JournalFolder','ADD_ARTICLE',4),(130,'com.liferay.portlet.journal.model.JournalFolder','ADD_SUBFOLDER',8),(131,'com.liferay.portlet.journal.model.JournalFolder','DELETE',16),(132,'com.liferay.portlet.journal.model.JournalFolder','PERMISSIONS',32),(133,'com.liferay.portlet.journal.model.JournalFolder','UPDATE',64),(134,'com.liferay.portlet.journal.model.JournalFolder','VIEW',1),(135,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','DELETE',2),(136,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','PERMISSIONS',4),(137,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','UPDATE',8),(138,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','VIEW',1),(139,'com.liferay.portlet.journal.model.JournalTemplate','DELETE',2),(140,'com.liferay.portlet.journal.model.JournalTemplate','PERMISSIONS',4),(141,'com.liferay.portlet.journal.model.JournalTemplate','UPDATE',8),(142,'com.liferay.portlet.journal.model.JournalTemplate','VIEW',1),(143,'com.liferay.portlet.journal.model.JournalArticle','ADD_DISCUSSION',2),(144,'com.liferay.portlet.journal.model.JournalArticle','DELETE',4),(145,'com.liferay.portlet.journal.model.JournalArticle','DELETE_DISCUSSION',8),(146,'com.liferay.portlet.journal.model.JournalArticle','EXPIRE',16),(147,'com.liferay.portlet.journal.model.JournalArticle','PERMISSIONS',32),(148,'com.liferay.portlet.journal.model.JournalArticle','UPDATE',64),(149,'com.liferay.portlet.journal.model.JournalArticle','UPDATE_DISCUSSION',128),(150,'com.liferay.portlet.journal.model.JournalArticle','VIEW',1),(151,'com.liferay.portlet.dynamicdatalists','ADD_RECORD_SET',2),(152,'com.liferay.portlet.dynamicdatalists','ADD_STRUCTURE',4),(153,'com.liferay.portlet.dynamicdatalists','ADD_TEMPLATE',8),(154,'com.liferay.portlet.dynamicdatalists','PERMISSIONS',16),(155,'com.liferay.portlet.bookmarks.model.BookmarksFolder','ACCESS',2),(156,'com.liferay.portlet.bookmarks.model.BookmarksFolder','ADD_ENTRY',4),(157,'com.liferay.portlet.bookmarks.model.BookmarksFolder','ADD_SUBFOLDER',8),(158,'com.liferay.portlet.bookmarks.model.BookmarksFolder','DELETE',16),(159,'com.liferay.portlet.bookmarks.model.BookmarksFolder','PERMISSIONS',32),(160,'com.liferay.portlet.bookmarks.model.BookmarksFolder','SUBSCRIBE',64),(161,'com.liferay.portlet.bookmarks.model.BookmarksFolder','UPDATE',128),(162,'com.liferay.portlet.bookmarks.model.BookmarksFolder','VIEW',1),(163,'com.liferay.portal.model.Group','ADD_COMMUNITY',2),(164,'com.liferay.portal.model.Group','ADD_LAYOUT',4),(165,'com.liferay.portal.model.Group','ADD_LAYOUT_BRANCH',8),(166,'com.liferay.portal.model.Group','ADD_LAYOUT_SET_BRANCH',16),(167,'com.liferay.portal.model.Group','ASSIGN_MEMBERS',32),(168,'com.liferay.portal.model.Group','ASSIGN_USER_ROLES',64),(169,'com.liferay.portal.model.Group','CONFIGURE_PORTLETS',128),(170,'com.liferay.portal.model.Group','DELETE',256),(171,'com.liferay.portal.model.Group','EXPORT_IMPORT_LAYOUTS',512),(172,'com.liferay.portal.model.Group','EXPORT_IMPORT_PORTLET_INFO',1024),(173,'com.liferay.portal.model.Group','MANAGE_ANNOUNCEMENTS',2048),(174,'com.liferay.portal.model.Group','MANAGE_ARCHIVED_SETUPS',4096),(175,'com.liferay.portal.model.Group','MANAGE_LAYOUTS',8192),(176,'com.liferay.portal.model.Group','MANAGE_STAGING',16384),(177,'com.liferay.portal.model.Group','MANAGE_SUBGROUPS',32768),(178,'com.liferay.portal.model.Group','MANAGE_TEAMS',65536),(179,'com.liferay.portal.model.Group','PERMISSIONS',131072),(180,'com.liferay.portal.model.Group','PREVIEW_IN_DEVICE',262144),(181,'com.liferay.portal.model.Group','PUBLISH_STAGING',524288),(182,'com.liferay.portal.model.Group','PUBLISH_TO_REMOTE',1048576),(183,'com.liferay.portal.model.Group','UPDATE',2097152),(184,'com.liferay.portal.model.Group','VIEW',1),(185,'com.liferay.portal.model.Group','VIEW_MEMBERS',4194304),(186,'com.liferay.portal.model.Group','VIEW_SITE_ADMINISTRATION',8388608),(187,'com.liferay.portal.model.Group','VIEW_STAGING',16777216),(188,'com.liferay.portlet.journal.model.JournalStructure','DELETE',2),(189,'com.liferay.portlet.journal.model.JournalStructure','PERMISSIONS',4),(190,'com.liferay.portlet.journal.model.JournalStructure','UPDATE',8),(191,'com.liferay.portlet.journal.model.JournalStructure','VIEW',1),(192,'com.liferay.portlet.asset.model.AssetTag','DELETE',2),(193,'com.liferay.portlet.asset.model.AssetTag','PERMISSIONS',4),(194,'com.liferay.portlet.asset.model.AssetTag','UPDATE',8),(195,'com.liferay.portlet.asset.model.AssetTag','VIEW',1),(196,'com.liferay.portal.model.Layout','ADD_DISCUSSION',2),(197,'com.liferay.portal.model.Layout','ADD_LAYOUT',4),(198,'com.liferay.portal.model.Layout','CONFIGURE_PORTLETS',8),(199,'com.liferay.portal.model.Layout','CUSTOMIZE',16),(200,'com.liferay.portal.model.Layout','DELETE',32),(201,'com.liferay.portal.model.Layout','DELETE_DISCUSSION',64),(202,'com.liferay.portal.model.Layout','PERMISSIONS',128),(203,'com.liferay.portal.model.Layout','UPDATE',256),(204,'com.liferay.portal.model.Layout','UPDATE_DISCUSSION',512),(205,'com.liferay.portal.model.Layout','VIEW',1),(206,'com.liferay.portlet.asset','ADD_TAG',2),(207,'com.liferay.portlet.asset','PERMISSIONS',4),(208,'com.liferay.portlet.asset','ADD_CATEGORY',8),(209,'com.liferay.portlet.asset','ADD_VOCABULARY',16),(210,'com.liferay.portal.model.LayoutBranch','DELETE',2),(211,'com.liferay.portal.model.LayoutBranch','PERMISSIONS',4),(212,'com.liferay.portal.model.LayoutBranch','UPDATE',8),(213,'com.liferay.portal.model.LayoutSetBranch','DELETE',2),(214,'com.liferay.portal.model.LayoutSetBranch','MERGE',4),(215,'com.liferay.portal.model.LayoutSetBranch','PERMISSIONS',8),(216,'com.liferay.portal.model.LayoutSetBranch','UPDATE',16),(217,'com.liferay.portlet.messageboards','ADD_CATEGORY',2),(218,'com.liferay.portlet.messageboards','ADD_FILE',4),(219,'com.liferay.portlet.messageboards','ADD_MESSAGE',8),(220,'com.liferay.portlet.messageboards','BAN_USER',16),(221,'com.liferay.portlet.messageboards','MOVE_THREAD',32),(222,'com.liferay.portlet.messageboards','LOCK_THREAD',64),(223,'com.liferay.portlet.messageboards','PERMISSIONS',128),(224,'com.liferay.portlet.messageboards','REPLY_TO_MESSAGE',256),(225,'com.liferay.portlet.messageboards','SUBSCRIBE',512),(226,'com.liferay.portlet.messageboards','UPDATE_THREAD_PRIORITY',1024),(227,'com.liferay.portlet.messageboards','VIEW',1),(228,'com.liferay.portlet.polls','ADD_QUESTION',2),(229,'com.liferay.portlet.polls','PERMISSIONS',4),(230,'com.liferay.portlet.shopping.model.ShoppingItem','DELETE',2),(231,'com.liferay.portlet.shopping.model.ShoppingItem','PERMISSIONS',4),(232,'com.liferay.portlet.shopping.model.ShoppingItem','UPDATE',8),(233,'com.liferay.portlet.shopping.model.ShoppingItem','VIEW',1),(234,'com.liferay.portlet.bookmarks.model.BookmarksEntry','DELETE',2),(235,'com.liferay.portlet.bookmarks.model.BookmarksEntry','PERMISSIONS',4),(236,'com.liferay.portlet.bookmarks.model.BookmarksEntry','SUBSCRIBE',8),(237,'com.liferay.portlet.bookmarks.model.BookmarksEntry','UPDATE',16),(238,'com.liferay.portlet.bookmarks.model.BookmarksEntry','VIEW',1),(239,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','ADD_DISCUSSION',2),(240,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','DELETE',4),(241,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','DELETE_DISCUSSION',8),(242,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','PERMISSIONS',16),(243,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','UPDATE',32),(244,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','UPDATE_DISCUSSION',64),(245,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','VIEW',1),(246,'com.liferay.portal.model.User','DELETE',2),(247,'com.liferay.portal.model.User','IMPERSONATE',4),(248,'com.liferay.portal.model.User','PERMISSIONS',8),(249,'com.liferay.portal.model.User','UPDATE',16),(250,'com.liferay.portal.model.User','VIEW',1),(251,'com.liferay.portal.model.LayoutSetPrototype','DELETE',2),(252,'com.liferay.portal.model.LayoutSetPrototype','PERMISSIONS',4),(253,'com.liferay.portal.model.LayoutSetPrototype','UPDATE',8),(254,'com.liferay.portal.model.LayoutSetPrototype','VIEW',1),(255,'com.liferay.portlet.shopping','ADD_CATEGORY',2),(256,'com.liferay.portlet.shopping','ADD_ITEM',4),(257,'com.liferay.portlet.shopping','MANAGE_COUPONS',8),(258,'com.liferay.portlet.shopping','MANAGE_ORDERS',16),(259,'com.liferay.portlet.shopping','PERMISSIONS',32),(260,'com.liferay.portlet.shopping','VIEW',1),(261,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion','DELETE',2),(262,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion','PERMISSIONS',4),(263,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion','UPDATE',8),(264,'com.liferay.portlet.wiki','ADD_NODE',2),(265,'com.liferay.portlet.wiki','PERMISSIONS',4),(266,'com.liferay.portlet.polls.model.PollsQuestion','ADD_VOTE',2),(267,'com.liferay.portlet.polls.model.PollsQuestion','DELETE',4),(268,'com.liferay.portlet.polls.model.PollsQuestion','PERMISSIONS',8),(269,'com.liferay.portlet.polls.model.PollsQuestion','UPDATE',16),(270,'com.liferay.portlet.polls.model.PollsQuestion','VIEW',1),(271,'com.liferay.portlet.shopping.model.ShoppingOrder','DELETE',2),(272,'com.liferay.portlet.shopping.model.ShoppingOrder','PERMISSIONS',4),(273,'com.liferay.portlet.shopping.model.ShoppingOrder','UPDATE',8),(274,'com.liferay.portlet.shopping.model.ShoppingOrder','VIEW',1),(275,'com.liferay.portal.model.UserGroup','ASSIGN_MEMBERS',2),(276,'com.liferay.portal.model.UserGroup','DELETE',4),(277,'com.liferay.portal.model.UserGroup','MANAGE_ANNOUNCEMENTS',8),(278,'com.liferay.portal.model.UserGroup','PERMISSIONS',16),(279,'com.liferay.portal.model.UserGroup','UPDATE',32),(280,'com.liferay.portal.model.UserGroup','VIEW',1),(281,'com.liferay.portal.model.UserGroup','VIEW_MEMBERS',64),(282,'com.liferay.portal.model.Role','ASSIGN_MEMBERS',2),(283,'com.liferay.portal.model.Role','DEFINE_PERMISSIONS',4),(284,'com.liferay.portal.model.Role','DELETE',8),(285,'com.liferay.portal.model.Role','MANAGE_ANNOUNCEMENTS',16),(286,'com.liferay.portal.model.Role','PERMISSIONS',32),(287,'com.liferay.portal.model.Role','UPDATE',64),(288,'com.liferay.portal.model.Role','VIEW',1),(289,'com.liferay.portlet.messageboards.model.MBCategory','ADD_FILE',2),(290,'com.liferay.portlet.messageboards.model.MBCategory','ADD_MESSAGE',4),(291,'com.liferay.portlet.messageboards.model.MBCategory','ADD_SUBCATEGORY',8),(292,'com.liferay.portlet.messageboards.model.MBCategory','DELETE',16),(293,'com.liferay.portlet.messageboards.model.MBCategory','LOCK_THREAD',32),(294,'com.liferay.portlet.messageboards.model.MBCategory','MOVE_THREAD',64),(295,'com.liferay.portlet.messageboards.model.MBCategory','PERMISSIONS',128),(296,'com.liferay.portlet.messageboards.model.MBCategory','REPLY_TO_MESSAGE',256),(297,'com.liferay.portlet.messageboards.model.MBCategory','SUBSCRIBE',512),(298,'com.liferay.portlet.messageboards.model.MBCategory','UPDATE',1024),(299,'com.liferay.portlet.messageboards.model.MBCategory','UPDATE_THREAD_PRIORITY',2048),(300,'com.liferay.portlet.messageboards.model.MBCategory','VIEW',1),(301,'com.liferay.portlet.mobiledevicerules','ADD_RULE_GROUP',2),(302,'com.liferay.portlet.mobiledevicerules','ADD_RULE_GROUP_INSTANCE',4),(303,'com.liferay.portlet.mobiledevicerules','CONFIGURATION',8),(304,'com.liferay.portlet.mobiledevicerules','VIEW',1),(305,'com.liferay.portlet.mobiledevicerules','PERMISSIONS',16),(306,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','DELETE',2),(307,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','PERMISSIONS',4),(308,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','UPDATE',8),(309,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','VIEW',1),(310,'com.liferay.portlet.wiki.model.WikiPage','ADD_DISCUSSION',2),(311,'com.liferay.portlet.wiki.model.WikiPage','DELETE',4),(312,'com.liferay.portlet.wiki.model.WikiPage','DELETE_DISCUSSION',8),(313,'com.liferay.portlet.wiki.model.WikiPage','PERMISSIONS',16),(314,'com.liferay.portlet.wiki.model.WikiPage','SUBSCRIBE',32),(315,'com.liferay.portlet.wiki.model.WikiPage','UPDATE',64),(316,'com.liferay.portlet.wiki.model.WikiPage','UPDATE_DISCUSSION',128),(317,'com.liferay.portlet.wiki.model.WikiPage','VIEW',1),(318,'com.liferay.portlet.asset.model.AssetCategory','ADD_CATEGORY',2),(319,'com.liferay.portlet.asset.model.AssetCategory','DELETE',4),(320,'com.liferay.portlet.asset.model.AssetCategory','PERMISSIONS',8),(321,'com.liferay.portlet.asset.model.AssetCategory','UPDATE',16),(322,'com.liferay.portlet.asset.model.AssetCategory','VIEW',1),(323,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','DELETE',2),(324,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','PERMISSIONS',4),(325,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','UPDATE',8),(326,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','VIEW',1),(327,'com.liferay.portlet.messageboards.model.MBMessage','DELETE',2),(328,'com.liferay.portlet.messageboards.model.MBMessage','PERMISSIONS',4),(329,'com.liferay.portlet.messageboards.model.MBMessage','SUBSCRIBE',8),(330,'com.liferay.portlet.messageboards.model.MBMessage','UPDATE',16),(331,'com.liferay.portlet.messageboards.model.MBMessage','VIEW',1),(332,'com.liferay.portlet.messageboards.model.MBThread','SUBSCRIBE',2),(333,'com.liferay.portlet.messageboards.model.MBThread','VIEW',1),(334,'com.liferay.portlet.messageboards.model.MBThread','PERMISSIONS',4),(335,'com.liferay.portlet.blogs','ADD_ENTRY',2),(336,'com.liferay.portlet.blogs','PERMISSIONS',4),(337,'com.liferay.portlet.blogs','SUBSCRIBE',8),(338,'com.liferay.portlet.documentlibrary.model.DLFileEntry','ADD_DISCUSSION',2),(339,'com.liferay.portlet.documentlibrary.model.DLFileEntry','DELETE',4),(340,'com.liferay.portlet.documentlibrary.model.DLFileEntry','DELETE_DISCUSSION',8),(341,'com.liferay.portlet.documentlibrary.model.DLFileEntry','OVERRIDE_CHECKOUT',16),(342,'com.liferay.portlet.documentlibrary.model.DLFileEntry','PERMISSIONS',32),(343,'com.liferay.portlet.documentlibrary.model.DLFileEntry','UPDATE',64),(344,'com.liferay.portlet.documentlibrary.model.DLFileEntry','UPDATE_DISCUSSION',128),(345,'com.liferay.portlet.documentlibrary.model.DLFileEntry','VIEW',1),(346,'134','ACCESS_IN_CONTROL_PANEL',2),(347,'134','CONFIGURATION',4),(348,'134','VIEW',1),(349,'134','PERMISSIONS',8),(350,'59','ADD_TO_PAGE',2),(351,'59','CONFIGURATION',4),(352,'59','PERMISSIONS',8),(353,'59','VIEW',1),(354,'139','ACCESS_IN_CONTROL_PANEL',2),(355,'139','ADD_EXPANDO',4),(356,'139','CONFIGURATION',8),(357,'139','VIEW',1),(358,'139','PERMISSIONS',16),(359,'19','ADD_TO_PAGE',2),(360,'19','CONFIGURATION',4),(361,'19','VIEW',1),(362,'19','PERMISSIONS',8),(363,'110','ADD_TO_PAGE',2),(364,'110','CONFIGURATION',4),(365,'110','PERMISSIONS',8),(366,'110','VIEW',1),(367,'36','ADD_PORTLET_DISPLAY_TEMPLATE',2),(368,'36','ADD_TO_PAGE',4),(369,'36','CONFIGURATION',8),(370,'36','VIEW',1),(371,'36','PERMISSIONS',16),(372,'178','CONFIGURATION',2),(373,'178','VIEW',1),(374,'178','ADD_TO_PAGE',4),(375,'178','PERMISSIONS',8),(376,'15','ACCESS_IN_CONTROL_PANEL',2),(377,'15','ADD_TO_PAGE',4),(378,'15','CONFIGURATION',8),(379,'15','VIEW',1),(380,'15','PERMISSIONS',16),(381,'33','ADD_PORTLET_DISPLAY_TEMPLATE',2),(382,'33','ADD_TO_PAGE',4),(383,'33','CONFIGURATION',8),(384,'33','VIEW',1),(385,'33','PERMISSIONS',16),(386,'34','ADD_TO_PAGE',2),(387,'34','CONFIGURATION',4),(388,'34','VIEW',1),(389,'34','PERMISSIONS',8),(390,'156','ADD_TO_PAGE',2),(391,'156','CONFIGURATION',4),(392,'156','PERMISSIONS',8),(393,'156','VIEW',1),(394,'154','ACCESS_IN_CONTROL_PANEL',2),(395,'154','CONFIGURATION',4),(396,'154','VIEW',1),(397,'154','PERMISSIONS',8),(398,'20','ACCESS_IN_CONTROL_PANEL',2),(399,'20','ADD_PORTLET_DISPLAY_TEMPLATE',4),(400,'20','ADD_TO_PAGE',8),(401,'20','CONFIGURATION',16),(402,'20','VIEW',1),(403,'20','PERMISSIONS',32),(404,'174','ADD_TO_PAGE',2),(405,'174','CONFIGURATION',4),(406,'174','PERMISSIONS',8),(407,'174','VIEW',1),(408,'83','ADD_ENTRY',2),(409,'83','ADD_TO_PAGE',4),(410,'83','CONFIGURATION',8),(411,'83','VIEW',1),(412,'83','PERMISSIONS',16),(413,'99','ACCESS_IN_CONTROL_PANEL',2),(414,'99','CONFIGURATION',4),(415,'99','VIEW',1),(416,'99','PERMISSIONS',8),(417,'84','ADD_ENTRY',2),(418,'84','ADD_TO_PAGE',4),(419,'84','CONFIGURATION',8),(420,'84','VIEW',1),(421,'84','PERMISSIONS',16),(422,'98','ACCESS_IN_CONTROL_PANEL',2),(423,'98','ADD_TO_PAGE',4),(424,'98','CONFIGURATION',8),(425,'98','VIEW',1),(426,'98','PERMISSIONS',16),(427,'125','ACCESS_IN_CONTROL_PANEL',2),(428,'125','CONFIGURATION',4),(429,'125','EXPORT_USER',8),(430,'125','VIEW',1),(431,'125','PERMISSIONS',16),(432,'127','ADD_TO_PAGE',2),(433,'127','CONFIGURATION',4),(434,'127','PERMISSIONS',8),(435,'127','VIEW',1),(436,'128','ACCESS_IN_CONTROL_PANEL',2),(437,'128','CONFIGURATION',4),(438,'128','VIEW',1),(439,'128','PERMISSIONS',8),(440,'146','ACCESS_IN_CONTROL_PANEL',2),(441,'146','CONFIGURATION',4),(442,'146','VIEW',1),(443,'146','PERMISSIONS',8),(444,'147','ACCESS_IN_CONTROL_PANEL',2),(445,'147','CONFIGURATION',4),(446,'147','VIEW',1),(447,'147','PERMISSIONS',8),(448,'149','ACCESS_IN_CONTROL_PANEL',2),(449,'149','CONFIGURATION',4),(450,'149','VIEW',1),(451,'149','PERMISSIONS',8),(452,'169','ADD_TO_PAGE',2),(453,'169','CONFIGURATION',4),(454,'169','PERMISSIONS',8),(455,'169','VIEW',1),(456,'25','ACCESS_IN_CONTROL_PANEL',2),(457,'25','CONFIGURATION',4),(458,'25','VIEW',1),(459,'25','PERMISSIONS',8),(460,'129','ACCESS_IN_CONTROL_PANEL',2),(461,'129','CONFIGURATION',4),(462,'129','VIEW',1),(463,'129','PERMISSIONS',8),(464,'166','ACCESS_IN_CONTROL_PANEL',2),(465,'166','ADD_TO_PAGE',4),(466,'166','CONFIGURATION',8),(467,'166','VIEW',1),(468,'166','PERMISSIONS',16),(469,'165','ADD_TO_PAGE',2),(470,'165','CONFIGURATION',4),(471,'165','PERMISSIONS',8),(472,'165','VIEW',1),(473,'28','ACCESS_IN_CONTROL_PANEL',2),(474,'28','ADD_TO_PAGE',4),(475,'28','CONFIGURATION',8),(476,'28','VIEW',1),(477,'28','PERMISSIONS',16),(478,'167','ACCESS_IN_CONTROL_PANEL',2),(479,'167','ADD_TO_PAGE',4),(480,'167','CONFIGURATION',8),(481,'167','VIEW',1),(482,'167','PERMISSIONS',16),(483,'161','ACCESS_IN_CONTROL_PANEL',2),(484,'161','CONFIGURATION',4),(485,'161','VIEW',1),(486,'161','PERMISSIONS',8),(487,'162','ACCESS_IN_CONTROL_PANEL',2),(488,'162','CONFIGURATION',4),(489,'162','VIEW',1),(490,'162','PERMISSIONS',8),(491,'31','ADD_TO_PAGE',2),(492,'31','CONFIGURATION',4),(493,'31','PERMISSIONS',8),(494,'31','VIEW',1),(495,'8','ACCESS_IN_CONTROL_PANEL',2),(496,'8','ADD_TO_PAGE',4),(497,'8','CONFIGURATION',8),(498,'8','VIEW',1),(499,'8','PERMISSIONS',16),(500,'183','VIEW',1),(501,'183','ADD_TO_PAGE',2),(502,'183','ACCESS_IN_CONTROL_PANEL',4),(503,'183','CONFIGURATION',8),(504,'183','PERMISSIONS',16),(505,'66','VIEW',1),(506,'66','ADD_TO_PAGE',2),(507,'66','ACCESS_IN_CONTROL_PANEL',4),(508,'66','CONFIGURATION',8),(509,'66','PERMISSIONS',16),(510,'156','ACCESS_IN_CONTROL_PANEL',16),(511,'180','VIEW',1),(512,'180','ADD_TO_PAGE',2),(513,'180','ACCESS_IN_CONTROL_PANEL',4),(514,'180','CONFIGURATION',8),(515,'180','PERMISSIONS',16),(516,'152','ACCESS_IN_CONTROL_PANEL',2),(517,'152','CONFIGURATION',4),(518,'152','VIEW',1),(519,'152','PERMISSIONS',8),(520,'27','VIEW',1),(521,'27','ADD_TO_PAGE',2),(522,'27','ACCESS_IN_CONTROL_PANEL',4),(523,'27','CONFIGURATION',8),(524,'27','PERMISSIONS',16),(525,'88','VIEW',1),(526,'88','ADD_TO_PAGE',2),(527,'88','ACCESS_IN_CONTROL_PANEL',4),(528,'88','CONFIGURATION',8),(529,'88','PERMISSIONS',16),(530,'130','ACCESS_IN_CONTROL_PANEL',2),(531,'130','CONFIGURATION',4),(532,'130','VIEW',1),(533,'130','PERMISSIONS',8),(534,'122','ADD_PORTLET_DISPLAY_TEMPLATE',2),(535,'122','CONFIGURATION',4),(536,'122','VIEW',1),(537,'122','ADD_TO_PAGE',8),(538,'122','PERMISSIONS',16),(539,'122','ACCESS_IN_CONTROL_PANEL',32),(540,'36','ACCESS_IN_CONTROL_PANEL',32),(541,'26','VIEW',1),(542,'26','ADD_TO_PAGE',2),(543,'26','ACCESS_IN_CONTROL_PANEL',4),(544,'26','CONFIGURATION',8),(545,'26','PERMISSIONS',16),(546,'190','VIEW',1),(547,'190','ADD_TO_PAGE',2),(548,'190','ACCESS_IN_CONTROL_PANEL',4),(549,'190','CONFIGURATION',8),(550,'190','PERMISSIONS',16),(551,'175','VIEW',1),(552,'175','ADD_TO_PAGE',2),(553,'175','ACCESS_IN_CONTROL_PANEL',4),(554,'175','CONFIGURATION',8),(555,'175','PERMISSIONS',16),(556,'64','VIEW',1),(557,'64','ADD_TO_PAGE',2),(558,'64','ACCESS_IN_CONTROL_PANEL',4),(559,'64','CONFIGURATION',8),(560,'64','PERMISSIONS',16),(561,'153','ACCESS_IN_CONTROL_PANEL',2),(562,'153','ADD_TO_PAGE',4),(563,'153','CONFIGURATION',8),(564,'153','VIEW',1),(565,'153','PERMISSIONS',16),(566,'182','VIEW',1),(567,'182','ADD_TO_PAGE',2),(568,'182','ACCESS_IN_CONTROL_PANEL',4),(569,'182','CONFIGURATION',8),(570,'182','PERMISSIONS',16),(571,'179','ACCESS_IN_CONTROL_PANEL',2),(572,'179','CONFIGURATION',4),(573,'179','VIEW',1),(574,'179','PERMISSIONS',8),(575,'173','VIEW',1),(576,'173','ADD_TO_PAGE',2),(577,'173','ACCESS_IN_CONTROL_PANEL',4),(578,'173','CONFIGURATION',8),(579,'173','PERMISSIONS',16),(580,'100','VIEW',1),(581,'100','ADD_TO_PAGE',2),(582,'100','ACCESS_IN_CONTROL_PANEL',4),(583,'100','CONFIGURATION',8),(584,'100','PERMISSIONS',16),(585,'157','ACCESS_IN_CONTROL_PANEL',2),(586,'157','CONFIGURATION',4),(587,'157','VIEW',1),(588,'157','PERMISSIONS',8),(589,'19','ACCESS_IN_CONTROL_PANEL',16),(590,'160','VIEW',1),(591,'160','ADD_TO_PAGE',2),(592,'160','ACCESS_IN_CONTROL_PANEL',4),(593,'160','CONFIGURATION',8),(594,'160','PERMISSIONS',16),(595,'181','VIEW',1),(596,'181','ADD_TO_PAGE',2),(597,'181','ACCESS_IN_CONTROL_PANEL',4),(598,'181','CONFIGURATION',8),(599,'181','PERMISSIONS',16),(600,'86','VIEW',1),(601,'86','ADD_TO_PAGE',2),(602,'86','ACCESS_IN_CONTROL_PANEL',4),(603,'86','CONFIGURATION',8),(604,'86','PERMISSIONS',16),(605,'148','VIEW',1),(606,'148','ADD_TO_PAGE',2),(607,'148','ACCESS_IN_CONTROL_PANEL',4),(608,'148','CONFIGURATION',8),(609,'148','PERMISSIONS',16),(610,'11','ADD_TO_PAGE',2),(611,'11','CONFIGURATION',4),(612,'11','VIEW',1),(613,'11','PERMISSIONS',8),(614,'11','ACCESS_IN_CONTROL_PANEL',16),(615,'29','ADD_TO_PAGE',2),(616,'29','CONFIGURATION',4),(617,'29','VIEW',1),(618,'29','PERMISSIONS',8),(619,'29','ACCESS_IN_CONTROL_PANEL',16),(620,'174','ACCESS_IN_CONTROL_PANEL',16),(621,'158','ACCESS_IN_CONTROL_PANEL',2),(622,'158','ADD_TO_PAGE',4),(623,'158','CONFIGURATION',8),(624,'158','VIEW',1),(625,'158','PERMISSIONS',16),(626,'178','ACCESS_IN_CONTROL_PANEL',16),(627,'124','VIEW',1),(628,'124','ADD_TO_PAGE',2),(629,'124','ACCESS_IN_CONTROL_PANEL',4),(630,'124','CONFIGURATION',8),(631,'124','PERMISSIONS',16),(632,'58','ADD_TO_PAGE',2),(633,'58','CONFIGURATION',4),(634,'58','VIEW',1),(635,'58','PERMISSIONS',8),(636,'58','ACCESS_IN_CONTROL_PANEL',16),(637,'97','VIEW',1),(638,'97','ADD_TO_PAGE',2),(639,'97','ACCESS_IN_CONTROL_PANEL',4),(640,'97','CONFIGURATION',8),(641,'97','PERMISSIONS',16),(642,'71','ADD_TO_PAGE',2),(643,'71','CONFIGURATION',4),(644,'71','VIEW',1),(645,'71','PERMISSIONS',8),(646,'71','ACCESS_IN_CONTROL_PANEL',16),(647,'39','VIEW',1),(648,'39','ADD_TO_PAGE',2),(649,'39','ACCESS_IN_CONTROL_PANEL',4),(650,'39','CONFIGURATION',8),(651,'39','PERMISSIONS',16),(652,'185','VIEW',1),(653,'185','ADD_TO_PAGE',2),(654,'185','ACCESS_IN_CONTROL_PANEL',4),(655,'185','CONFIGURATION',8),(656,'185','PERMISSIONS',16),(657,'170','VIEW',1),(658,'170','ADD_TO_PAGE',2),(659,'170','ACCESS_IN_CONTROL_PANEL',4),(660,'170','CONFIGURATION',8),(661,'170','PERMISSIONS',16),(662,'85','ADD_TO_PAGE',2),(663,'85','CONFIGURATION',4),(664,'85','VIEW',1),(665,'85','PERMISSIONS',8),(666,'85','ADD_PORTLET_DISPLAY_TEMPLATE',16),(667,'85','ACCESS_IN_CONTROL_PANEL',32),(668,'118','VIEW',1),(669,'118','ADD_TO_PAGE',2),(670,'118','ACCESS_IN_CONTROL_PANEL',4),(671,'118','CONFIGURATION',8),(672,'118','PERMISSIONS',16),(673,'107','VIEW',1),(674,'107','ADD_TO_PAGE',2),(675,'107','ACCESS_IN_CONTROL_PANEL',4),(676,'107','CONFIGURATION',8),(677,'107','PERMISSIONS',16),(678,'30','VIEW',1),(679,'30','ADD_TO_PAGE',2),(680,'30','ACCESS_IN_CONTROL_PANEL',4),(681,'30','CONFIGURATION',8),(682,'30','PERMISSIONS',16),(683,'184','ADD_TO_PAGE',2),(684,'184','CONFIGURATION',4),(685,'184','VIEW',1),(686,'184','PERMISSIONS',8),(687,'184','ACCESS_IN_CONTROL_PANEL',16),(688,'48','VIEW',1),(689,'48','ADD_TO_PAGE',2),(690,'48','ACCESS_IN_CONTROL_PANEL',4),(691,'48','CONFIGURATION',8),(692,'48','PERMISSIONS',16),(693,'62','VIEW',1),(694,'62','ADD_TO_PAGE',2),(695,'62','ACCESS_IN_CONTROL_PANEL',4),(696,'62','CONFIGURATION',8),(697,'62','PERMISSIONS',16),(698,'176','VIEW',1),(699,'176','ADD_TO_PAGE',2),(700,'176','ACCESS_IN_CONTROL_PANEL',4),(701,'176','CONFIGURATION',8),(702,'176','PERMISSIONS',16),(703,'172','VIEW',1),(704,'172','ADD_TO_PAGE',2),(705,'172','ACCESS_IN_CONTROL_PANEL',4),(706,'172','CONFIGURATION',8),(707,'172','PERMISSIONS',16),(708,'187','ADD_TO_PAGE',2),(709,'187','CONFIGURATION',4),(710,'187','VIEW',1),(711,'187','PERMISSIONS',8),(712,'187','ACCESS_IN_CONTROL_PANEL',16),(713,'108','VIEW',1),(714,'108','ADD_TO_PAGE',2),(715,'108','ACCESS_IN_CONTROL_PANEL',4),(716,'108','CONFIGURATION',8),(717,'108','PERMISSIONS',16),(718,'84','ACCESS_IN_CONTROL_PANEL',32),(719,'101','ADD_PORTLET_DISPLAY_TEMPLATE',2),(720,'101','ADD_TO_PAGE',4),(721,'101','CONFIGURATION',8),(722,'101','SUBSCRIBE',16),(723,'101','VIEW',1),(724,'101','PERMISSIONS',32),(725,'101','ACCESS_IN_CONTROL_PANEL',64),(726,'121','VIEW',1),(727,'121','ADD_TO_PAGE',2),(728,'121','ACCESS_IN_CONTROL_PANEL',4),(729,'121','CONFIGURATION',8),(730,'121','PERMISSIONS',16),(731,'49','VIEW',1),(732,'49','ADD_TO_PAGE',2),(733,'49','ACCESS_IN_CONTROL_PANEL',4),(734,'49','CONFIGURATION',8),(735,'49','PERMISSIONS',16),(736,'143','VIEW',1),(737,'143','ADD_TO_PAGE',2),(738,'143','ACCESS_IN_CONTROL_PANEL',4),(739,'143','CONFIGURATION',8),(740,'143','PERMISSIONS',16),(741,'77','VIEW',1),(742,'77','ADD_TO_PAGE',2),(743,'77','ACCESS_IN_CONTROL_PANEL',4),(744,'77','CONFIGURATION',8),(745,'77','PERMISSIONS',16),(746,'115','VIEW',1),(747,'115','ADD_TO_PAGE',2),(748,'115','ACCESS_IN_CONTROL_PANEL',4),(749,'115','CONFIGURATION',8),(750,'115','PERMISSIONS',16),(751,'56','ADD_TO_PAGE',2),(752,'56','CONFIGURATION',4),(753,'56','VIEW',1),(754,'56','PERMISSIONS',8),(755,'56','ACCESS_IN_CONTROL_PANEL',16),(756,'142','VIEW',1),(757,'142','ADD_TO_PAGE',2),(758,'142','ACCESS_IN_CONTROL_PANEL',4),(759,'142','CONFIGURATION',8),(760,'142','PERMISSIONS',16),(761,'16','PREFERENCES',2),(762,'16','GUEST_PREFERENCES',4),(763,'16','VIEW',1),(764,'16','ADD_TO_PAGE',8),(765,'16','ACCESS_IN_CONTROL_PANEL',16),(766,'16','CONFIGURATION',32),(767,'16','PERMISSIONS',64),(768,'3','VIEW',1),(769,'3','ADD_TO_PAGE',2),(770,'3','ACCESS_IN_CONTROL_PANEL',4),(771,'3','CONFIGURATION',8),(772,'3','PERMISSIONS',16),(773,'23','VIEW',1),(774,'23','ADD_TO_PAGE',2),(775,'23','ACCESS_IN_CONTROL_PANEL',4),(776,'23','CONFIGURATION',8),(777,'23','PERMISSIONS',16),(778,'145','VIEW',1),(779,'145','ADD_TO_PAGE',2),(780,'145','ACCESS_IN_CONTROL_PANEL',4),(781,'145','CONFIGURATION',8),(782,'145','PERMISSIONS',16),(783,'83','ACCESS_IN_CONTROL_PANEL',32),(784,'194','VIEW',1),(785,'194','ADD_TO_PAGE',2),(786,'194','ACCESS_IN_CONTROL_PANEL',4),(787,'194','CONFIGURATION',8),(788,'194','PERMISSIONS',16),(789,'186','ADD_TO_PAGE',2),(790,'186','CONFIGURATION',4),(791,'186','VIEW',1),(792,'186','PERMISSIONS',8),(793,'186','ACCESS_IN_CONTROL_PANEL',16),(794,'164','VIEW',1),(795,'164','ADD_TO_PAGE',2),(796,'164','ACCESS_IN_CONTROL_PANEL',4),(797,'164','CONFIGURATION',8),(798,'164','PERMISSIONS',16),(799,'70','VIEW',1),(800,'70','ADD_TO_PAGE',2),(801,'70','ACCESS_IN_CONTROL_PANEL',4),(802,'70','CONFIGURATION',8),(803,'70','PERMISSIONS',16),(804,'141','ADD_PORTLET_DISPLAY_TEMPLATE',2),(805,'141','CONFIGURATION',4),(806,'141','VIEW',1),(807,'141','ADD_TO_PAGE',8),(808,'141','PERMISSIONS',16),(809,'141','ACCESS_IN_CONTROL_PANEL',32),(810,'9','VIEW',1),(811,'9','ADD_TO_PAGE',2),(812,'9','ACCESS_IN_CONTROL_PANEL',4),(813,'9','CONFIGURATION',8),(814,'9','PERMISSIONS',16),(815,'137','ACCESS_IN_CONTROL_PANEL',2),(816,'137','CONFIGURATION',4),(817,'137','VIEW',1),(818,'137','PERMISSIONS',8),(819,'133','VIEW',1),(820,'133','ADD_TO_PAGE',2),(821,'133','ACCESS_IN_CONTROL_PANEL',4),(822,'133','CONFIGURATION',8),(823,'133','PERMISSIONS',16),(824,'116','VIEW',1),(825,'116','ADD_TO_PAGE',2),(826,'116','ACCESS_IN_CONTROL_PANEL',4),(827,'116','CONFIGURATION',8),(828,'116','PERMISSIONS',16),(829,'47','VIEW',1),(830,'47','ADD_TO_PAGE',2),(831,'47','ACCESS_IN_CONTROL_PANEL',4),(832,'47','CONFIGURATION',8),(833,'47','PERMISSIONS',16),(834,'82','VIEW',1),(835,'82','ADD_TO_PAGE',2),(836,'82','ACCESS_IN_CONTROL_PANEL',4),(837,'82','CONFIGURATION',8),(838,'82','PERMISSIONS',16),(839,'103','VIEW',1),(840,'103','ADD_TO_PAGE',2),(841,'103','ACCESS_IN_CONTROL_PANEL',4),(842,'103','CONFIGURATION',8),(843,'103','PERMISSIONS',16),(844,'151','ACCESS_IN_CONTROL_PANEL',2),(845,'151','CONFIGURATION',4),(846,'151','VIEW',1),(847,'151','PERMISSIONS',8),(848,'140','ACCESS_IN_CONTROL_PANEL',2),(849,'140','CONFIGURATION',4),(850,'140','VIEW',1),(851,'140','PERMISSIONS',8),(852,'54','VIEW',1),(853,'54','ADD_TO_PAGE',2),(854,'54','ACCESS_IN_CONTROL_PANEL',4),(855,'54','CONFIGURATION',8),(856,'54','PERMISSIONS',16),(857,'169','ACCESS_IN_CONTROL_PANEL',16),(858,'132','ACCESS_IN_CONTROL_PANEL',2),(859,'132','CONFIGURATION',4),(860,'132','VIEW',1),(861,'132','PERMISSIONS',8),(862,'34','ACCESS_IN_CONTROL_PANEL',16),(863,'61','VIEW',1),(864,'61','ADD_TO_PAGE',2),(865,'61','ACCESS_IN_CONTROL_PANEL',4),(866,'61','CONFIGURATION',8),(867,'61','PERMISSIONS',16),(868,'73','ADD_TO_PAGE',2),(869,'73','CONFIGURATION',4),(870,'73','VIEW',1),(871,'73','PERMISSIONS',8),(872,'73','ACCESS_IN_CONTROL_PANEL',16),(873,'193','VIEW',1),(874,'193','ADD_TO_PAGE',2),(875,'193','ACCESS_IN_CONTROL_PANEL',4),(876,'193','CONFIGURATION',8),(877,'193','PERMISSIONS',16),(878,'127','ACCESS_IN_CONTROL_PANEL',16),(879,'50','VIEW',1),(880,'50','ADD_TO_PAGE',2),(881,'50','ACCESS_IN_CONTROL_PANEL',4),(882,'50','CONFIGURATION',8),(883,'50','PERMISSIONS',16),(884,'31','ACCESS_IN_CONTROL_PANEL',16),(885,'165','ACCESS_IN_CONTROL_PANEL',16),(886,'192','VIEW',1),(887,'192','ADD_TO_PAGE',2),(888,'192','ACCESS_IN_CONTROL_PANEL',4),(889,'192','CONFIGURATION',8),(890,'192','PERMISSIONS',16),(891,'90','ADD_COMMUNITY',2),(892,'90','ADD_GENERAL_ANNOUNCEMENTS',4),(893,'90','ADD_LAYOUT_PROTOTYPE',8),(894,'90','ADD_LAYOUT_SET_PROTOTYPE',16),(895,'90','ADD_LICENSE',32),(896,'90','ADD_ORGANIZATION',64),(897,'90','ADD_PASSWORD_POLICY',128),(898,'90','ADD_ROLE',256),(899,'90','ADD_USER',512),(900,'90','ADD_USER_GROUP',1024),(901,'90','CONFIGURATION',2048),(902,'90','EXPORT_USER',4096),(903,'90','IMPERSONATE',8192),(904,'90','UNLINK_LAYOUT_SET_PROTOTYPE',16384),(905,'90','VIEW_CONTROL_PANEL',32768),(906,'90','ADD_TO_PAGE',65536),(907,'90','ACCESS_IN_CONTROL_PANEL',131072),(908,'90','PERMISSIONS',262144),(909,'90','VIEW',1),(910,'150','ACCESS_IN_CONTROL_PANEL',2),(911,'150','CONFIGURATION',4),(912,'150','VIEW',1),(913,'150','PERMISSIONS',8),(914,'113','VIEW',1),(915,'113','ADD_TO_PAGE',2),(916,'113','ACCESS_IN_CONTROL_PANEL',4),(917,'113','CONFIGURATION',8),(918,'113','PERMISSIONS',16),(919,'33','ACCESS_IN_CONTROL_PANEL',32),(920,'2','ACCESS_IN_CONTROL_PANEL',2),(921,'2','CONFIGURATION',4),(922,'2','VIEW',1),(923,'2','PERMISSIONS',8),(924,'191','VIEW',1),(925,'191','ADD_TO_PAGE',2),(926,'191','ACCESS_IN_CONTROL_PANEL',4),(927,'191','CONFIGURATION',8),(928,'191','PERMISSIONS',16),(929,'119','VIEW',1),(930,'119','ADD_TO_PAGE',2),(931,'119','ACCESS_IN_CONTROL_PANEL',4),(932,'119','CONFIGURATION',8),(933,'119','PERMISSIONS',16),(934,'114','VIEW',1),(935,'114','ADD_TO_PAGE',2),(936,'114','ACCESS_IN_CONTROL_PANEL',4),(937,'114','CONFIGURATION',8),(938,'114','PERMISSIONS',16),(939,'67','VIEW',1),(940,'67','ADD_TO_PAGE',2),(941,'67','ACCESS_IN_CONTROL_PANEL',4),(942,'67','CONFIGURATION',8),(943,'67','PERMISSIONS',16),(944,'110','ACCESS_IN_CONTROL_PANEL',16),(945,'135','ACCESS_IN_CONTROL_PANEL',2),(946,'135','CONFIGURATION',4),(947,'135','VIEW',1),(948,'135','PERMISSIONS',8),(949,'59','ACCESS_IN_CONTROL_PANEL',16),(950,'188','ADD_TO_PAGE',2),(951,'188','CONFIGURATION',4),(952,'188','VIEW',1),(953,'188','PERMISSIONS',8),(954,'188','ACCESS_IN_CONTROL_PANEL',16),(955,'131','ACCESS_IN_CONTROL_PANEL',2),(956,'131','CONFIGURATION',4),(957,'131','VIEW',1),(958,'131','PERMISSIONS',8),(959,'102','VIEW',1),(960,'102','ADD_TO_PAGE',2),(961,'102','CONFIGURATION',4),(962,'102','PERMISSIONS',8),(963,'102','ACCESS_IN_CONTROL_PANEL',16),(964,'1_WAR_marketplaceportlet','VIEW',1),(965,'1_WAR_marketplaceportlet','ADD_TO_PAGE',2),(966,'1_WAR_marketplaceportlet','ACCESS_IN_CONTROL_PANEL',4),(967,'1_WAR_marketplaceportlet','CONFIGURATION',8),(968,'1_WAR_marketplaceportlet','PERMISSIONS',16),(969,'2_WAR_marketplaceportlet','VIEW',1),(970,'2_WAR_marketplaceportlet','ADD_TO_PAGE',2),(971,'2_WAR_marketplaceportlet','ACCESS_IN_CONTROL_PANEL',4),(972,'2_WAR_marketplaceportlet','CONFIGURATION',8),(973,'2_WAR_marketplaceportlet','PERMISSIONS',16),(974,'3_WAR_marketplaceportlet','VIEW',1),(975,'3_WAR_marketplaceportlet','ADD_TO_PAGE',2),(976,'3_WAR_marketplaceportlet','ACCESS_IN_CONTROL_PANEL',4),(977,'3_WAR_marketplaceportlet','CONFIGURATION',8),(978,'3_WAR_marketplaceportlet','PERMISSIONS',16),(979,'1_WAR_calendarportlet','ACCESS_IN_CONTROL_PANEL',2),(980,'1_WAR_calendarportlet','ADD_TO_PAGE',4),(981,'1_WAR_calendarportlet','CONFIGURATION',8),(982,'1_WAR_calendarportlet','VIEW',1),(983,'1_WAR_calendarportlet','PERMISSIONS',16),(984,'com.liferay.calendar.model.CalendarResource','ADD_CALENDAR',2),(985,'com.liferay.calendar.model.CalendarResource','DELETE',4),(986,'com.liferay.calendar.model.CalendarResource','UPDATE',8),(987,'com.liferay.calendar.model.CalendarResource','VIEW',1),(988,'com.liferay.calendar.model.CalendarResource','PERMISSIONS',16),(989,'com.liferay.calendar.model.Calendar','DELETE',2),(990,'com.liferay.calendar.model.Calendar','MANAGE_BOOKINGS',4),(991,'com.liferay.calendar.model.Calendar','PERMISSIONS',8),(992,'com.liferay.calendar.model.Calendar','UPDATE',16),(993,'com.liferay.calendar.model.Calendar','VIEW',1),(994,'com.liferay.calendar.model.Calendar','VIEW_BOOKING_DETAILS',32),(995,'com.liferay.calendar','ADD_RESOURCE',2),(996,'com.liferay.calendar','PERMISSIONS',4),(997,'com.liferay.calendar.model.CalendarBooking','ADD_DISCUSSION',2),(998,'com.liferay.calendar.model.CalendarBooking','DELETE_DISCUSSION',4),(999,'com.liferay.calendar.model.CalendarBooking','PERMISSIONS',8),(1000,'com.liferay.calendar.model.CalendarBooking','UPDATE_DISCUSSION',16),(1001,'2_WAR_notificationsportlet','VIEW',1),(1002,'2_WAR_notificationsportlet','ADD_TO_PAGE',2),(1003,'2_WAR_notificationsportlet','ACCESS_IN_CONTROL_PANEL',4),(1004,'2_WAR_notificationsportlet','CONFIGURATION',8),(1005,'2_WAR_notificationsportlet','PERMISSIONS',16),(1006,'1_WAR_notificationsportlet','VIEW',1),(1007,'1_WAR_notificationsportlet','ADD_TO_PAGE',2),(1008,'1_WAR_notificationsportlet','ACCESS_IN_CONTROL_PANEL',4),(1009,'1_WAR_notificationsportlet','CONFIGURATION',8),(1010,'1_WAR_notificationsportlet','PERMISSIONS',16),(1011,'4_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',2),(1012,'4_WAR_opensocialportlet','CONFIGURATION',4),(1013,'4_WAR_opensocialportlet','VIEW',1),(1014,'4_WAR_opensocialportlet','PERMISSIONS',8),(1015,'2_WAR_opensocialportlet','ADD_TO_PAGE',2),(1016,'2_WAR_opensocialportlet','CONFIGURATION',4),(1017,'2_WAR_opensocialportlet','VIEW',1),(1018,'2_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',8),(1019,'2_WAR_opensocialportlet','PERMISSIONS',16),(1020,'1_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',2),(1021,'1_WAR_opensocialportlet','CONFIGURATION',4),(1022,'1_WAR_opensocialportlet','VIEW',1),(1023,'1_WAR_opensocialportlet','PERMISSIONS',8),(1024,'com.liferay.opensocial.model.Gadget','DELETE',2),(1025,'com.liferay.opensocial.model.Gadget','PERMISSIONS',4),(1026,'com.liferay.opensocial.model.Gadget','UPDATE',8),(1027,'com.liferay.opensocial.model.Gadget','VIEW',1),(1028,'com.liferay.opensocial','PERMISSIONS',2),(1029,'com.liferay.opensocial','PUBLISH_GADGET',4),(1030,'3_WAR_opensocialportlet','ADD_TO_PAGE',2),(1031,'3_WAR_opensocialportlet','CONFIGURATION',4),(1032,'3_WAR_opensocialportlet','VIEW',1),(1033,'3_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',8),(1034,'3_WAR_opensocialportlet','PERMISSIONS',16),(1035,'1_WAR_webformportlet','VIEW',1),(1036,'1_WAR_webformportlet','ADD_TO_PAGE',2),(1037,'1_WAR_webformportlet','ACCESS_IN_CONTROL_PANEL',4),(1038,'1_WAR_webformportlet','CONFIGURATION',8),(1039,'1_WAR_webformportlet','PERMISSIONS',16),(1040,'scfinvoiceportlet_WAR_scfinvoiceportlet','VIEW',1),(1041,'scfinvoiceportlet_WAR_scfinvoiceportlet','ADD_TO_PAGE',2),(1042,'scfinvoiceportlet_WAR_scfinvoiceportlet','ACCESS_IN_CONTROL_PANEL',4),(1043,'scfinvoiceportlet_WAR_scfinvoiceportlet','CONFIGURATION',8),(1044,'scfinvoiceportlet_WAR_scfinvoiceportlet','PERMISSIONS',16),(1045,'scftradeportlet_WAR_scftradeportlet','VIEW',1),(1046,'scftradeportlet_WAR_scftradeportlet','ADD_TO_PAGE',2),(1047,'scftradeportlet_WAR_scftradeportlet','ACCESS_IN_CONTROL_PANEL',4),(1048,'scftradeportlet_WAR_scftradeportlet','CONFIGURATION',8),(1049,'scftradeportlet_WAR_scftradeportlet','PERMISSIONS',16),(1050,'scfinvestorportlet_WAR_scfinvestorportlet','VIEW',1),(1051,'scfinvestorportlet_WAR_scfinvestorportlet','ADD_TO_PAGE',2),(1052,'scfinvestorportlet_WAR_scfinvestorportlet','ACCESS_IN_CONTROL_PANEL',4),(1053,'scfinvestorportlet_WAR_scfinvestorportlet','CONFIGURATION',8),(1054,'scfinvestorportlet_WAR_scfinvestorportlet','PERMISSIONS',16),(1055,'tfregistrationportlet_WAR_tfregistrationportlet','VIEW',1),(1056,'tfregistrationportlet_WAR_tfregistrationportlet','ADD_TO_PAGE',2),(1057,'tfregistrationportlet_WAR_tfregistrationportlet','ACCESS_IN_CONTROL_PANEL',4),(1058,'tfregistrationportlet_WAR_tfregistrationportlet','CONFIGURATION',8),(1059,'tfregistrationportlet_WAR_tfregistrationportlet','PERMISSIONS',16),(1060,'tfcompanyportlet_WAR_tfadminportlet','VIEW',1),(1061,'tfcompanyportlet_WAR_tfadminportlet','ADD_TO_PAGE',2),(1062,'tfcompanyportlet_WAR_tfadminportlet','ACCESS_IN_CONTROL_PANEL',4),(1063,'tfcompanyportlet_WAR_tfadminportlet','CONFIGURATION',8),(1064,'tfcompanyportlet_WAR_tfadminportlet','PERMISSIONS',16),(1101,'tfdashboardportlet_WAR_tfdashboardportlet','VIEW',1),(1102,'tfdashboardportlet_WAR_tfdashboardportlet','ADD_TO_PAGE',2),(1103,'tfdashboardportlet_WAR_tfdashboardportlet','ACCESS_IN_CONTROL_PANEL',4),(1104,'tfdashboardportlet_WAR_tfdashboardportlet','CONFIGURATION',8),(1105,'tfdashboardportlet_WAR_tfdashboardportlet','PERMISSIONS',16),(1201,'tfsettingsportlet_WAR_tfsettingsportlet','VIEW',1),(1202,'tfsettingsportlet_WAR_tfsettingsportlet','ADD_TO_PAGE',2),(1203,'tfsettingsportlet_WAR_tfsettingsportlet','ACCESS_IN_CONTROL_PANEL',4),(1204,'tfsettingsportlet_WAR_tfsettingsportlet','CONFIGURATION',8),(1205,'tfsettingsportlet_WAR_tfsettingsportlet','PERMISSIONS',16),(1301,'tfreportportlet_WAR_tfreportportlet','VIEW',1),(1302,'tfreportportlet_WAR_tfreportportlet','ADD_TO_PAGE',2),(1303,'tfreportportlet_WAR_tfreportportlet','ACCESS_IN_CONTROL_PANEL',4),(1304,'tfreportportlet_WAR_tfreportportlet','CONFIGURATION',8),(1305,'tfreportportlet_WAR_tfreportportlet','PERMISSIONS',16);

/*Table structure for table `resourceblock` */

DROP TABLE IF EXISTS `resourceblock`;

CREATE TABLE `resourceblock` (
  `resourceBlockId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `permissionsHash` varchar(75) DEFAULT NULL,
  `referenceCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceBlockId`),
  UNIQUE KEY `IX_AEEA209C` (`companyId`,`groupId`,`name`,`permissionsHash`),
  KEY `IX_DA30B086` (`companyId`,`groupId`,`name`),
  KEY `IX_2D4CC782` (`companyId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resourceblock` */

insert  into `resourceblock`(`resourceBlockId`,`companyId`,`groupId`,`name`,`permissionsHash`,`referenceCount`) values (3,10155,10182,'com.liferay.calendar.model.Calendar','15b1c38f0777e19af9a6988dae3130a535100e3c',1),(4,10155,10182,'com.liferay.calendar.model.CalendarResource','a4fbfec8150bc3ea4d91841df523ca4f561c8c17',1);

/*Table structure for table `resourceblockpermission` */

DROP TABLE IF EXISTS `resourceblockpermission`;

CREATE TABLE `resourceblockpermission` (
  `resourceBlockPermissionId` bigint(20) NOT NULL,
  `resourceBlockId` bigint(20) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `actionIds` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceBlockPermissionId`),
  UNIQUE KEY `IX_D63D20BB` (`resourceBlockId`,`roleId`),
  KEY `IX_4AB3756` (`resourceBlockId`),
  KEY `IX_20A2E3D9` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resourceblockpermission` */

insert  into `resourceblockpermission`(`resourceBlockPermissionId`,`resourceBlockId`,`roleId`,`actionIds`) values (10865,1,10164,63),(10866,2,10163,1),(10867,2,10164,63),(10868,3,10163,1),(10869,3,10164,63),(10870,3,10171,1),(10872,4,10164,31);

/*Table structure for table `resourcepermission` */

DROP TABLE IF EXISTS `resourcepermission`;

CREATE TABLE `resourcepermission` (
  `resourcePermissionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `primKey` varchar(255) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `ownerId` bigint(20) DEFAULT NULL,
  `actionIds` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourcePermissionId`),
  UNIQUE KEY `IX_8D83D0CE` (`companyId`,`name`,`scope`,`primKey`,`roleId`),
  KEY `IX_60B99860` (`companyId`,`name`,`scope`),
  KEY `IX_2200AA69` (`companyId`,`name`,`scope`,`primKey`),
  KEY `IX_26284944` (`companyId`,`primKey`),
  KEY `IX_A37A0588` (`roleId`),
  KEY `IX_F4555981` (`scope`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resourcepermission` */

insert  into `resourcepermission`(`resourcePermissionId`,`companyId`,`name`,`scope`,`primKey`,`roleId`,`ownerId`,`actionIds`) values (1,10155,'2',1,'10155',10166,0,2),(2,10155,'140',1,'10155',10166,0,2),(3,10155,'158',1,'10155',10166,0,6),(4,10155,'153',1,'10155',10166,0,6),(5,10155,'com.liferay.portal.model.Layout',4,'10176',10164,10159,1023),(6,10155,'com.liferay.portal.model.Layout',4,'10176',10171,0,19),(7,10155,'com.liferay.portal.model.Layout',4,'10176',10163,0,1),(11,10155,'98',2,'10192',10166,0,1),(12,10155,'183',2,'10192',10166,0,1),(13,10155,'66',2,'10192',10166,0,1),(14,10155,'180',2,'10192',10166,0,1),(15,10155,'27',2,'10192',10166,0,1),(16,10155,'152',2,'10192',10166,0,1),(17,10155,'134',2,'10192',10166,0,1),(18,10155,'130',2,'10192',10166,0,1),(19,10155,'122',2,'10192',10166,0,1),(20,10155,'36',2,'10192',10166,0,1),(21,10155,'26',2,'10192',10166,0,1),(22,10155,'175',2,'10192',10166,0,1),(23,10155,'153',2,'10192',10166,0,1),(24,10155,'64',2,'10192',10166,0,1),(25,10155,'129',2,'10192',10166,0,1),(26,10155,'182',2,'10192',10166,0,1),(27,10155,'179',2,'10192',10166,0,1),(28,10155,'173',2,'10192',10166,0,1),(29,10155,'100',2,'10192',10166,0,1),(30,10155,'19',2,'10192',10166,0,1),(31,10155,'157',2,'10192',10166,0,1),(32,10155,'181',2,'10192',10166,0,1),(33,10155,'128',2,'10192',10166,0,1),(34,10155,'154',2,'10192',10166,0,1),(35,10155,'148',2,'10192',10166,0,1),(36,10155,'11',2,'10192',10166,0,1),(37,10155,'29',2,'10192',10166,0,1),(38,10155,'158',2,'10192',10166,0,1),(39,10155,'178',2,'10192',10166,0,1),(40,10155,'58',2,'10192',10166,0,1),(41,10155,'71',2,'10192',10166,0,1),(42,10155,'97',2,'10192',10166,0,1),(43,10155,'39',2,'10192',10166,0,1),(44,10155,'85',2,'10192',10166,0,1),(45,10155,'118',2,'10192',10166,0,1),(46,10155,'107',2,'10192',10166,0,1),(47,10155,'30',2,'10192',10166,0,1),(48,10155,'184',2,'10192',10166,0,1),(49,10155,'147',2,'10192',10166,0,1),(50,10155,'48',2,'10192',10166,0,1),(51,10155,'125',2,'10192',10166,0,1),(52,10155,'161',2,'10192',10166,0,1),(53,10155,'146',2,'10192',10166,0,1),(54,10155,'62',2,'10192',10166,0,1),(55,10155,'162',2,'10192',10166,0,1),(56,10155,'176',2,'10192',10166,0,1),(57,10155,'108',2,'10192',10166,0,1),(58,10155,'187',2,'10192',10166,0,1),(59,10155,'84',2,'10192',10166,0,1),(60,10155,'101',2,'10192',10166,0,1),(61,10155,'121',2,'10192',10166,0,1),(62,10155,'143',2,'10192',10166,0,1),(63,10155,'77',2,'10192',10166,0,1),(64,10155,'167',2,'10192',10166,0,1),(65,10155,'115',2,'10192',10166,0,1),(66,10155,'56',2,'10192',10166,0,1),(67,10155,'16',2,'10192',10166,0,1),(68,10155,'3',2,'10192',10166,0,1),(69,10155,'20',2,'10192',10166,0,1),(70,10155,'23',2,'10192',10166,0,1),(71,10155,'83',2,'10192',10166,0,1),(72,10155,'99',2,'10192',10166,0,1),(73,10155,'186',2,'10192',10166,0,1),(74,10155,'194',2,'10192',10166,0,1),(75,10155,'70',2,'10192',10166,0,1),(76,10155,'164',2,'10192',10166,0,1),(77,10155,'141',2,'10192',10166,0,1),(78,10155,'9',2,'10192',10166,0,1),(79,10155,'28',2,'10192',10166,0,1),(80,10155,'137',2,'10192',10166,0,1),(81,10155,'15',2,'10192',10166,0,1),(82,10155,'47',2,'10192',10166,0,1),(83,10155,'116',2,'10192',10166,0,1),(84,10155,'82',2,'10192',10166,0,1),(85,10155,'151',2,'10192',10166,0,1),(86,10155,'54',2,'10192',10166,0,1),(87,10155,'34',2,'10192',10166,0,1),(88,10155,'132',2,'10192',10166,0,1),(89,10155,'169',2,'10192',10166,0,1),(90,10155,'61',2,'10192',10166,0,1),(91,10155,'73',2,'10192',10166,0,1),(92,10155,'50',2,'10192',10166,0,1),(93,10155,'127',2,'10192',10166,0,1),(94,10155,'193',2,'10192',10166,0,1),(95,10155,'31',2,'10192',10166,0,1),(96,10155,'25',2,'10192',10166,0,1),(97,10155,'166',2,'10192',10166,0,1),(98,10155,'33',2,'10192',10166,0,1),(99,10155,'150',2,'10192',10166,0,1),(100,10155,'114',2,'10192',10166,0,1),(101,10155,'149',2,'10192',10166,0,1),(102,10155,'67',2,'10192',10166,0,1),(103,10155,'110',2,'10192',10166,0,1),(104,10155,'59',2,'10192',10166,0,1),(105,10155,'135',2,'10192',10166,0,1),(106,10155,'188',2,'10192',10166,0,1),(107,10155,'131',2,'10192',10166,0,1),(108,10155,'102',2,'10192',10166,0,1),(109,10155,'com.liferay.portal.model.Layout',2,'10192',10166,0,1),(110,10155,'com.liferay.portlet.blogs',2,'10192',10166,0,14),(111,10155,'98',2,'10192',10165,0,2),(112,10155,'183',2,'10192',10165,0,4),(113,10155,'152',2,'10192',10165,0,2),(114,10155,'182',2,'10192',10165,0,4),(115,10155,'179',2,'10192',10165,0,2),(116,10155,'173',2,'10192',10165,0,4),(117,10155,'154',2,'10192',10165,0,2),(118,10155,'178',2,'10192',10165,0,16),(119,10155,'147',2,'10192',10165,0,2),(120,10155,'161',2,'10192',10165,0,2),(121,10155,'162',2,'10192',10165,0,2),(122,10155,'167',2,'10192',10165,0,2),(123,10155,'20',2,'10192',10165,0,2),(124,10155,'99',2,'10192',10165,0,2),(125,10155,'28',2,'10192',10165,0,2),(126,10155,'15',2,'10192',10165,0,2),(127,10155,'25',2,'10192',10165,0,2),(128,10155,'com.liferay.portal.model.Group',2,'10192',10165,0,8396800),(129,10155,'com.liferay.portlet.asset',2,'10192',10165,0,30),(130,10155,'com.liferay.portlet.blogs',2,'10192',10165,0,14),(131,10155,'com.liferay.portlet.bookmarks',2,'10192',10165,0,31),(132,10155,'com.liferay.portlet.documentlibrary',2,'10192',10165,0,1023),(133,10155,'com.liferay.portlet.journal',2,'10192',10165,0,255),(134,10155,'com.liferay.portlet.messageboards',2,'10192',10165,0,2047),(135,10155,'com.liferay.portlet.polls',2,'10192',10165,0,6),(136,10155,'com.liferay.portlet.wiki',2,'10192',10165,0,6),(137,10155,'com.liferay.portal.model.User',4,'10199',10164,10199,31),(138,10155,'98',1,'10155',10165,0,4),(139,10155,'98',1,'10155',10166,0,4),(140,10155,'183',1,'10155',10162,0,2),(141,10155,'66',1,'10155',10165,0,2),(142,10155,'66',1,'10155',10166,0,2),(143,10155,'180',1,'10155',10163,0,2),(144,10155,'180',1,'10155',10165,0,2),(145,10155,'180',1,'10155',10166,0,2),(146,10155,'27',1,'10155',10165,0,2),(147,10155,'27',1,'10155',10166,0,2),(148,10155,'122',1,'10155',10163,0,8),(149,10155,'122',1,'10155',10165,0,8),(150,10155,'122',1,'10155',10166,0,8),(151,10155,'36',1,'10155',10165,0,4),(152,10155,'36',1,'10155',10166,0,4),(153,10155,'26',1,'10155',10165,0,2),(154,10155,'26',1,'10155',10166,0,2),(155,10155,'175',1,'10155',10163,0,2),(156,10155,'175',1,'10155',10165,0,2),(157,10155,'175',1,'10155',10166,0,2),(158,10155,'153',1,'10155',10165,0,4),(159,10155,'64',1,'10155',10163,0,2),(160,10155,'64',1,'10155',10165,0,2),(161,10155,'64',1,'10155',10166,0,2),(162,10155,'182',1,'10155',10165,0,2),(163,10155,'182',1,'10155',10166,0,2),(164,10155,'173',1,'10155',10163,0,2),(165,10155,'173',1,'10155',10165,0,2),(166,10155,'173',1,'10155',10166,0,2),(167,10155,'100',1,'10155',10165,0,2),(168,10155,'100',1,'10155',10166,0,2),(169,10155,'19',1,'10155',10165,0,2),(170,10155,'19',1,'10155',10166,0,2),(171,10155,'181',1,'10155',10163,0,2),(172,10155,'181',1,'10155',10165,0,2),(173,10155,'181',1,'10155',10166,0,2),(174,10155,'148',1,'10155',10163,0,2),(175,10155,'148',1,'10155',10165,0,2),(176,10155,'148',1,'10155',10166,0,2),(177,10155,'11',1,'10155',10165,0,2),(178,10155,'11',1,'10155',10166,0,2),(179,10155,'29',1,'10155',10165,0,2),(180,10155,'29',1,'10155',10166,0,2),(181,10155,'158',1,'10155',10165,0,4),(182,10155,'178',1,'10155',10165,0,4),(183,10155,'178',1,'10155',10166,0,4),(184,10155,'58',1,'10155',10163,0,2),(185,10155,'58',1,'10155',10165,0,2),(186,10155,'58',1,'10155',10166,0,2),(187,10155,'71',1,'10155',10163,0,2),(188,10155,'71',1,'10155',10165,0,2),(189,10155,'71',1,'10155',10166,0,2),(190,10155,'97',1,'10155',10165,0,2),(191,10155,'97',1,'10155',10166,0,2),(192,10155,'39',1,'10155',10165,0,2),(193,10155,'39',1,'10155',10166,0,2),(194,10155,'85',1,'10155',10163,0,2),(195,10155,'85',1,'10155',10165,0,2),(196,10155,'85',1,'10155',10166,0,2),(197,10155,'118',1,'10155',10163,0,2),(198,10155,'118',1,'10155',10165,0,2),(199,10155,'118',1,'10155',10166,0,2),(200,10155,'107',1,'10155',10165,0,2),(201,10155,'107',1,'10155',10166,0,2),(202,10155,'30',1,'10155',10165,0,2),(203,10155,'30',1,'10155',10166,0,2),(204,10155,'184',1,'10155',10163,0,2),(205,10155,'184',1,'10155',10165,0,2),(206,10155,'184',1,'10155',10166,0,2),(207,10155,'48',1,'10155',10165,0,2),(208,10155,'48',1,'10155',10166,0,2),(209,10155,'62',1,'10155',10165,0,2),(210,10155,'62',1,'10155',10166,0,2),(211,10155,'176',1,'10155',10162,0,2),(212,10155,'108',1,'10155',10165,0,2),(213,10155,'108',1,'10155',10166,0,2),(214,10155,'187',1,'10155',10165,0,2),(215,10155,'187',1,'10155',10166,0,2),(216,10155,'84',1,'10155',10165,0,4),(217,10155,'84',1,'10155',10166,0,4),(218,10155,'101',1,'10155',10163,0,4),(219,10155,'101',1,'10155',10165,0,4),(220,10155,'101',1,'10155',10166,0,4),(221,10155,'121',1,'10155',10163,0,2),(222,10155,'121',1,'10155',10165,0,2),(223,10155,'121',1,'10155',10166,0,2),(224,10155,'143',1,'10155',10163,0,2),(225,10155,'143',1,'10155',10165,0,2),(226,10155,'143',1,'10155',10166,0,2),(227,10155,'77',1,'10155',10163,0,2),(228,10155,'77',1,'10155',10165,0,2),(229,10155,'77',1,'10155',10166,0,2),(230,10155,'167',1,'10155',10165,0,4),(231,10155,'167',1,'10155',10166,0,4),(232,10155,'115',1,'10155',10163,0,2),(233,10155,'115',1,'10155',10165,0,2),(234,10155,'115',1,'10155',10166,0,2),(235,10155,'56',1,'10155',10163,0,2),(236,10155,'56',1,'10155',10165,0,2),(237,10155,'56',1,'10155',10166,0,2),(238,10155,'16',1,'10155',10165,0,8),(239,10155,'16',1,'10155',10166,0,8),(240,10155,'3',1,'10155',10163,0,2),(241,10155,'3',1,'10155',10165,0,2),(242,10155,'3',1,'10155',10166,0,2),(243,10155,'20',1,'10155',10163,0,8),(244,10155,'20',1,'10155',10165,0,8),(245,10155,'20',1,'10155',10166,0,8),(246,10155,'23',1,'10155',10165,0,2),(247,10155,'23',1,'10155',10166,0,2),(248,10155,'83',1,'10155',10165,0,4),(249,10155,'83',1,'10155',10166,0,4),(250,10155,'186',1,'10155',10165,0,2),(251,10155,'186',1,'10155',10166,0,2),(252,10155,'194',1,'10155',10163,0,2),(253,10155,'194',1,'10155',10165,0,2),(254,10155,'194',1,'10155',10166,0,2),(255,10155,'70',1,'10155',10165,0,2),(256,10155,'70',1,'10155',10166,0,2),(257,10155,'164',1,'10155',10163,0,2),(258,10155,'164',1,'10155',10165,0,2),(259,10155,'164',1,'10155',10166,0,2),(260,10155,'141',1,'10155',10163,0,8),(261,10155,'141',1,'10155',10165,0,8),(262,10155,'141',1,'10155',10166,0,8),(263,10155,'9',1,'10155',10162,0,2),(264,10155,'28',1,'10155',10165,0,4),(265,10155,'28',1,'10155',10166,0,4),(266,10155,'15',1,'10155',10165,0,4),(267,10155,'15',1,'10155',10166,0,4),(268,10155,'47',1,'10155',10163,0,2),(269,10155,'47',1,'10155',10165,0,2),(270,10155,'47',1,'10155',10166,0,2),(271,10155,'116',1,'10155',10163,0,2),(272,10155,'116',1,'10155',10165,0,2),(273,10155,'116',1,'10155',10166,0,2),(274,10155,'82',1,'10155',10163,0,2),(275,10155,'82',1,'10155',10165,0,2),(276,10155,'82',1,'10155',10166,0,2),(277,10155,'54',1,'10155',10165,0,2),(278,10155,'54',1,'10155',10166,0,2),(279,10155,'34',1,'10155',10165,0,2),(280,10155,'34',1,'10155',10166,0,2),(281,10155,'169',1,'10155',10165,0,2),(282,10155,'169',1,'10155',10166,0,2),(283,10155,'61',1,'10155',10165,0,2),(284,10155,'61',1,'10155',10166,0,2),(285,10155,'73',1,'10155',10163,0,2),(286,10155,'73',1,'10155',10165,0,2),(287,10155,'73',1,'10155',10166,0,2),(288,10155,'50',1,'10155',10163,0,2),(289,10155,'50',1,'10155',10165,0,2),(290,10155,'50',1,'10155',10166,0,2),(291,10155,'127',1,'10155',10162,0,2),(292,10155,'193',1,'10155',10163,0,2),(293,10155,'193',1,'10155',10165,0,2),(294,10155,'193',1,'10155',10166,0,2),(295,10155,'31',1,'10155',10163,0,2),(296,10155,'31',1,'10155',10165,0,2),(297,10155,'31',1,'10155',10166,0,2),(298,10155,'166',1,'10155',10165,0,4),(299,10155,'166',1,'10155',10166,0,4),(300,10155,'33',1,'10155',10163,0,4),(301,10155,'33',1,'10155',10165,0,4),(302,10155,'33',1,'10155',10166,0,4),(303,10155,'114',1,'10155',10163,0,2),(304,10155,'114',1,'10155',10165,0,2),(305,10155,'114',1,'10155',10166,0,2),(306,10155,'67',1,'10155',10165,0,2),(307,10155,'67',1,'10155',10166,0,2),(308,10155,'110',1,'10155',10165,0,2),(309,10155,'110',1,'10155',10166,0,2),(310,10155,'59',1,'10155',10165,0,2),(311,10155,'59',1,'10155',10166,0,2),(312,10155,'188',1,'10155',10165,0,2),(313,10155,'188',1,'10155',10166,0,2),(314,10155,'102',1,'10155',10163,0,2),(315,10155,'102',1,'10155',10165,0,2),(316,10155,'102',1,'10155',10166,0,2),(317,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10304',10164,10159,15),(318,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10304',10166,0,1),(319,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10304',10163,0,1),(320,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10305',10164,10159,15),(321,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10305',10166,0,1),(322,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10305',10163,0,1),(323,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10306',10164,10159,15),(324,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10306',10166,0,1),(325,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10306',10163,0,1),(326,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10308',10164,10159,15),(327,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10308',10166,0,1),(328,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10308',10163,0,1),(329,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10307',10164,10159,15),(330,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10307',10166,0,1),(331,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10307',10163,0,1),(332,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10310',10164,10159,15),(333,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10310',10166,0,1),(334,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10310',10163,0,1),(335,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10309',10164,10159,15),(336,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10309',10166,0,1),(337,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10309',10163,0,1),(338,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10312',10164,10159,15),(339,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10312',10166,0,1),(340,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10312',10163,0,1),(341,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10311',10164,10159,15),(342,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10311',10166,0,1),(343,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10311',10163,0,1),(344,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10314',10164,10159,15),(345,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10314',10166,0,1),(346,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10314',10163,0,1),(347,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10313',10164,10159,15),(348,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10313',10166,0,1),(349,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10313',10163,0,1),(350,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10316',10164,10159,15),(351,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10316',10166,0,1),(352,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10316',10163,0,1),(353,10155,'com.liferay.portal.model.LayoutPrototype',4,'10317',10164,10159,15),(354,10155,'com.liferay.portal.model.Layout',4,'10321',10164,10159,1023),(355,10155,'com.liferay.portal.model.Layout',4,'10321',10171,0,19),(356,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'10325',10164,10159,15),(357,10155,'33',4,'10321_LAYOUT_33',10164,0,63),(358,10155,'33',4,'10321_LAYOUT_33',10171,0,1),(359,10155,'33',4,'10321_LAYOUT_33',10163,0,1),(360,10155,'com.liferay.portlet.blogs',4,'10318',10164,0,14),(361,10155,'148',4,'10321_LAYOUT_148_INSTANCE_pKtzmcNTRfdy',10164,0,31),(362,10155,'148',4,'10321_LAYOUT_148_INSTANCE_pKtzmcNTRfdy',10171,0,1),(363,10155,'148',4,'10321_LAYOUT_148_INSTANCE_pKtzmcNTRfdy',10163,0,1),(364,10155,'114',4,'10321_LAYOUT_114',10164,0,31),(365,10155,'114',4,'10321_LAYOUT_114',10171,0,1),(366,10155,'114',4,'10321_LAYOUT_114',10163,0,1),(367,10155,'com.liferay.portal.model.LayoutPrototype',4,'10329',10164,10159,15),(368,10155,'com.liferay.portal.model.Layout',4,'10333',10164,10159,1023),(369,10155,'com.liferay.portal.model.Layout',4,'10333',10171,0,19),(370,10155,'141',4,'10333_LAYOUT_141_INSTANCE_mnJkpO5aZ0hs',10164,0,63),(371,10155,'141',4,'10333_LAYOUT_141_INSTANCE_mnJkpO5aZ0hs',10171,0,1),(372,10155,'141',4,'10333_LAYOUT_141_INSTANCE_mnJkpO5aZ0hs',10163,0,1),(373,10155,'122',4,'10333_LAYOUT_122_INSTANCE_yNTrLbgSs43u',10164,0,63),(374,10155,'122',4,'10333_LAYOUT_122_INSTANCE_yNTrLbgSs43u',10171,0,1),(375,10155,'122',4,'10333_LAYOUT_122_INSTANCE_yNTrLbgSs43u',10163,0,1),(376,10155,'3',4,'10333_LAYOUT_3',10164,0,31),(377,10155,'3',4,'10333_LAYOUT_3',10171,0,1),(378,10155,'3',4,'10333_LAYOUT_3',10163,0,1),(379,10155,'101',4,'10333_LAYOUT_101_INSTANCE_rwORxcqB7Ttb',10164,0,127),(380,10155,'101',4,'10333_LAYOUT_101_INSTANCE_rwORxcqB7Ttb',10171,0,17),(381,10155,'101',4,'10333_LAYOUT_101_INSTANCE_rwORxcqB7Ttb',10163,0,1),(382,10155,'com.liferay.portal.model.LayoutPrototype',4,'10339',10164,10159,15),(383,10155,'com.liferay.portal.model.Layout',4,'10343',10164,10159,1023),(384,10155,'com.liferay.portal.model.Layout',4,'10343',10171,0,19),(385,10155,'36',4,'10343_LAYOUT_36',10164,0,63),(386,10155,'36',4,'10343_LAYOUT_36',10171,0,1),(387,10155,'36',4,'10343_LAYOUT_36',10163,0,1),(388,10155,'com.liferay.portlet.wiki',4,'10340',10164,0,6),(389,10155,'122',4,'10343_LAYOUT_122_INSTANCE_JiwWSHi0Y5yy',10164,0,63),(390,10155,'122',4,'10343_LAYOUT_122_INSTANCE_JiwWSHi0Y5yy',10171,0,1),(391,10155,'122',4,'10343_LAYOUT_122_INSTANCE_JiwWSHi0Y5yy',10163,0,1),(392,10155,'141',4,'10343_LAYOUT_141_INSTANCE_ilOVYHsC06a6',10164,0,63),(393,10155,'141',4,'10343_LAYOUT_141_INSTANCE_ilOVYHsC06a6',10171,0,1),(394,10155,'141',4,'10343_LAYOUT_141_INSTANCE_ilOVYHsC06a6',10163,0,1),(395,10155,'com.liferay.portal.model.LayoutSetPrototype',4,'10350',10164,10159,15),(399,10155,'com.liferay.portal.model.Layout',4,'10362',10164,10159,1023),(400,10155,'com.liferay.portal.model.Layout',4,'10362',10171,0,19),(401,10155,'com.liferay.portal.model.Layout',4,'10362',10163,0,1),(402,10155,'19',4,'10362_LAYOUT_19',10164,0,31),(403,10155,'19',4,'10362_LAYOUT_19',10171,0,1),(404,10155,'19',4,'10362_LAYOUT_19',10163,0,1),(405,10155,'com.liferay.portlet.messageboards',4,'10351',10164,0,2047),(406,10155,'com.liferay.portlet.messageboards',4,'10351',10171,0,781),(407,10155,'com.liferay.portlet.messageboards',4,'10351',10163,0,1),(408,10155,'3',4,'10362_LAYOUT_3',10164,0,31),(409,10155,'3',4,'10362_LAYOUT_3',10171,0,1),(410,10155,'3',4,'10362_LAYOUT_3',10163,0,1),(411,10155,'59',4,'10362_LAYOUT_59_INSTANCE_4DSKC9coNNqW',10164,0,31),(412,10155,'59',4,'10362_LAYOUT_59_INSTANCE_4DSKC9coNNqW',10171,0,1),(413,10155,'59',4,'10362_LAYOUT_59_INSTANCE_4DSKC9coNNqW',10163,0,1),(414,10155,'com.liferay.portlet.polls',4,'10351',10164,0,6),(415,10155,'180',4,'10362_LAYOUT_180',10164,0,31),(416,10155,'180',4,'10362_LAYOUT_180',10171,0,1),(417,10155,'180',4,'10362_LAYOUT_180',10163,0,1),(418,10155,'101',4,'10362_LAYOUT_101_INSTANCE_WKhV5p60HYwQ',10164,0,127),(419,10155,'101',4,'10362_LAYOUT_101_INSTANCE_WKhV5p60HYwQ',10171,0,17),(420,10155,'101',4,'10362_LAYOUT_101_INSTANCE_WKhV5p60HYwQ',10163,0,1),(421,10155,'com.liferay.portal.model.Layout',4,'10370',10164,10159,1023),(422,10155,'com.liferay.portal.model.Layout',4,'10370',10171,0,19),(423,10155,'com.liferay.portal.model.Layout',4,'10370',10163,0,1),(424,10155,'36',4,'10370_LAYOUT_36',10164,0,63),(425,10155,'36',4,'10370_LAYOUT_36',10171,0,1),(426,10155,'36',4,'10370_LAYOUT_36',10163,0,1),(427,10155,'com.liferay.portlet.wiki',4,'10351',10164,0,6),(428,10155,'122',4,'10370_LAYOUT_122_INSTANCE_20kYZ2iZM7YQ',10164,0,63),(429,10155,'122',4,'10370_LAYOUT_122_INSTANCE_20kYZ2iZM7YQ',10171,0,1),(430,10155,'122',4,'10370_LAYOUT_122_INSTANCE_20kYZ2iZM7YQ',10163,0,1),(431,10155,'148',4,'10370_LAYOUT_148_INSTANCE_Z8hUqf6pix0j',10164,0,31),(432,10155,'148',4,'10370_LAYOUT_148_INSTANCE_Z8hUqf6pix0j',10171,0,1),(433,10155,'148',4,'10370_LAYOUT_148_INSTANCE_Z8hUqf6pix0j',10163,0,1),(434,10155,'com.liferay.portal.model.LayoutSetPrototype',4,'10376',10164,10159,15),(438,10155,'com.liferay.portal.model.Layout',4,'10388',10164,10159,1023),(439,10155,'com.liferay.portal.model.Layout',4,'10388',10171,0,19),(440,10155,'com.liferay.portal.model.Layout',4,'10388',10163,0,1),(441,10155,'116',4,'10388_LAYOUT_116',10164,0,31),(442,10155,'116',4,'10388_LAYOUT_116',10171,0,1),(443,10155,'116',4,'10388_LAYOUT_116',10163,0,1),(444,10155,'3',4,'10388_LAYOUT_3',10164,0,31),(445,10155,'3',4,'10388_LAYOUT_3',10171,0,1),(446,10155,'3',4,'10388_LAYOUT_3',10163,0,1),(447,10155,'82',4,'10388_LAYOUT_82',10164,0,31),(448,10155,'82',4,'10388_LAYOUT_82',10171,0,1),(449,10155,'82',4,'10388_LAYOUT_82',10163,0,1),(450,10155,'101',4,'10388_LAYOUT_101_INSTANCE_u3FtbZ8AzOJ9',10164,0,127),(451,10155,'101',4,'10388_LAYOUT_101_INSTANCE_u3FtbZ8AzOJ9',10171,0,17),(452,10155,'101',4,'10388_LAYOUT_101_INSTANCE_u3FtbZ8AzOJ9',10163,0,1),(453,10155,'com.liferay.portal.model.Layout',4,'10397',10164,10159,1023),(454,10155,'com.liferay.portal.model.Layout',4,'10397',10171,0,19),(455,10155,'com.liferay.portal.model.Layout',4,'10397',10163,0,1),(456,10155,'20',4,'10397_LAYOUT_20',10164,0,63),(457,10155,'20',4,'10397_LAYOUT_20',10171,0,1),(458,10155,'20',4,'10397_LAYOUT_20',10163,0,1),(459,10155,'com.liferay.portlet.documentlibrary',4,'10377',10164,0,1023),(460,10155,'com.liferay.portlet.documentlibrary',4,'10377',10171,0,331),(461,10155,'com.liferay.portlet.documentlibrary',4,'10377',10163,0,1),(462,10155,'101',4,'10397_LAYOUT_101_INSTANCE_QnVZlQSSicet',10164,0,127),(463,10155,'101',4,'10397_LAYOUT_101_INSTANCE_QnVZlQSSicet',10171,0,17),(464,10155,'101',4,'10397_LAYOUT_101_INSTANCE_QnVZlQSSicet',10163,0,1),(465,10155,'com.liferay.portal.model.Layout',4,'10405',10164,10159,1023),(466,10155,'com.liferay.portal.model.Layout',4,'10405',10171,0,19),(467,10155,'com.liferay.portal.model.Layout',4,'10405',10163,0,1),(468,10155,'39',4,'10405_LAYOUT_39_INSTANCE_98usyrRw7YUm',10164,0,31),(469,10155,'39',4,'10405_LAYOUT_39_INSTANCE_98usyrRw7YUm',10171,0,1),(470,10155,'39',4,'10405_LAYOUT_39_INSTANCE_98usyrRw7YUm',10163,0,1),(471,10155,'39',4,'10405_LAYOUT_39_INSTANCE_wWzLD7tqzCQf',10164,0,31),(472,10155,'39',4,'10405_LAYOUT_39_INSTANCE_wWzLD7tqzCQf',10171,0,1),(473,10155,'39',4,'10405_LAYOUT_39_INSTANCE_wWzLD7tqzCQf',10163,0,1),(480,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10419',10164,10159,15),(481,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10421',10164,10159,15),(482,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10424',10164,10159,15),(483,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10426',10164,10159,15),(484,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10428',10164,10159,15),(485,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10430',10164,10159,15),(486,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10432',10164,10159,15),(487,10155,'com.liferay.portlet.expando.model.ExpandoColumn',4,'10439',10164,0,15),(488,10155,'1_WAR_calendarportlet',1,'10155',10162,0,4),(489,10155,'1_WAR_calendarportlet',1,'10155',10163,0,4),(490,10155,'1_WAR_calendarportlet',1,'10155',10165,0,4),(491,10155,'1_WAR_calendarportlet',1,'10155',10166,0,4),(492,10155,'1_WAR_notificationsportlet',1,'10155',10162,0,2),(493,10155,'1_WAR_notificationsportlet',1,'10155',10163,0,2),(494,10155,'1_WAR_notificationsportlet',1,'10155',10165,0,2),(495,10155,'1_WAR_notificationsportlet',1,'10155',10166,0,2),(496,10155,'2_WAR_opensocialportlet',1,'10155',10162,0,2),(497,10155,'2_WAR_opensocialportlet',1,'10155',10163,0,2),(498,10155,'2_WAR_opensocialportlet',1,'10155',10165,0,2),(499,10155,'2_WAR_opensocialportlet',1,'10155',10166,0,2),(500,10155,'3_WAR_opensocialportlet',1,'10155',10162,0,2),(501,10155,'3_WAR_opensocialportlet',1,'10155',10163,0,2),(502,10155,'3_WAR_opensocialportlet',1,'10155',10165,0,2),(503,10155,'3_WAR_opensocialportlet',1,'10155',10166,0,2),(504,10155,'1_WAR_webformportlet',1,'10155',10162,0,2),(505,10155,'1_WAR_webformportlet',1,'10155',10163,0,2),(506,10155,'1_WAR_webformportlet',1,'10155',10165,0,2),(507,10155,'1_WAR_webformportlet',1,'10155',10166,0,2),(508,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10526',10164,10159,255),(509,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10526',10171,0,3),(510,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10526',10163,0,3),(519,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10535',10164,10159,255),(520,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10535',10171,0,3),(521,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10535',10163,0,3),(522,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10545',10164,10159,255),(523,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10545',10171,0,3),(524,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10545',10163,0,3),(525,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10554',10164,10159,255),(526,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10554',10171,0,3),(527,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10554',10163,0,3),(528,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10566',10164,10159,255),(529,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10566',10171,0,3),(530,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10566',10163,0,3),(531,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10576',10164,10159,255),(532,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10576',10171,0,3),(533,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10576',10163,0,3),(534,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10594',10164,10159,15),(535,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10594',10171,0,1),(536,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10594',10163,0,1),(537,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10595',10164,10159,15),(538,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10595',10171,0,1),(539,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10595',10163,0,1),(546,10155,'145',4,'10185_LAYOUT_145',10164,0,31),(547,10155,'145',4,'10185_LAYOUT_145',10171,0,1),(548,10155,'145',4,'10185_LAYOUT_145',10163,0,1),(549,10155,'com.liferay.portal.model.Layout',4,'10185',10164,0,1023),(550,10155,'com.liferay.portal.model.Layout',4,'10185',10171,0,19),(551,10155,'com.liferay.portal.model.Layout',4,'10185',10163,0,1),(561,10155,'com.liferay.portal.model.Layout',4,'10638',10164,10199,1023),(562,10155,'com.liferay.portal.model.Layout',4,'10644',10164,10199,1023),(563,10155,'com.liferay.portal.model.Layout',4,'10644',10165,0,19),(564,10155,'com.liferay.portal.model.Layout',4,'10644',10163,0,1),(568,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10666',10164,10159,255),(569,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10666',10171,0,29),(570,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10666',10163,0,1),(571,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10667',10164,10199,255),(572,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10667',10171,0,29),(573,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10667',10163,0,1),(574,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10668',10164,10199,255),(575,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10668',10171,0,29),(576,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10668',10163,0,1),(580,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10675',10164,10159,255),(581,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10675',10171,0,29),(582,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10675',10163,0,1),(583,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10676',10164,10199,255),(584,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10676',10171,0,29),(585,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10676',10163,0,1),(586,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10677',10164,10199,255),(587,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10677',10171,0,3),(588,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10677',10163,0,3),(589,10155,'com.liferay.portal.model.Role',4,'10684',10164,10199,127),(590,10155,'com.liferay.portal.model.Role',4,'10685',10164,10199,127),(591,10155,'com.liferay.portal.model.Role',4,'10686',10164,10199,127),(592,10155,'com.liferay.portal.model.Role',4,'10687',10164,10199,127),(593,10155,'com.liferay.portal.model.Role',4,'10688',10164,10199,127),(594,10155,'com.liferay.portal.model.Role',4,'10689',10164,10199,127),(595,10155,'com.liferay.portal.model.Role',4,'10690',10164,10199,127),(596,10155,'com.liferay.portal.model.Role',4,'10691',10164,10199,127),(597,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'10692',10164,10199,15),(598,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'10692',10171,0,0),(599,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'10692',10163,0,0),(600,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'10693',10164,10199,15),(601,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'10693',10171,0,0),(602,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'10693',10163,0,0),(603,10155,'com.liferay.portal.model.Layout',4,'10703',10164,10199,1023),(604,10155,'com.liferay.portal.model.Layout',4,'10703',10171,0,19),(605,10155,'com.liferay.portal.model.Layout',4,'10703',10163,0,1),(606,10155,'com.liferay.portal.model.Layout',4,'10705',10164,10199,1023),(607,10155,'com.liferay.portal.model.Layout',4,'10705',10171,0,19),(608,10155,'com.liferay.portal.model.Layout',4,'10705',10163,0,1),(609,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10707',10164,10199,15),(610,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10708',10164,10199,15),(611,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10709',10164,10199,15),(612,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10710',10164,10199,15),(613,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10711',10164,10199,15),(614,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10712',10164,10199,15),(615,10155,'com.liferay.portlet.documentlibrary',4,'10182',10164,0,1023),(616,10155,'com.liferay.portlet.documentlibrary',4,'10182',10163,0,1),(617,10155,'com.liferay.portlet.documentlibrary',4,'10182',10171,0,331),(618,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10713',10164,10199,255),(619,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10713',10171,0,29),(620,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10717',10164,10199,255),(621,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10717',10171,0,29),(622,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10721',10164,10199,255),(623,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10725',10164,10199,255),(624,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10729',10164,10199,255),(625,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10733',10164,10199,255),(626,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10737',10164,10199,255),(627,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10741',10164,10199,255),(628,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10745',10164,10199,255),(629,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10749',10164,10199,255),(630,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10753',10164,10199,255),(631,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10757',10164,10199,255),(632,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10761',10164,10199,255),(633,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10765',10164,10199,255),(634,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10774',10164,10199,255),(635,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10783',10164,10199,255),(636,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10792',10164,10199,255),(637,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10801',10164,10199,255),(638,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10810',10164,10199,255),(639,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10819',10164,10199,255),(640,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10828',10164,10199,255),(641,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10837',10164,10199,255),(642,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10846',10164,10199,255),(643,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10855',10164,10199,255),(644,10155,'58',4,'10703_LAYOUT_58',10164,0,31),(645,10155,'58',4,'10703_LAYOUT_58',10163,0,1),(646,10155,'58',4,'10703_LAYOUT_58',10171,0,1),(653,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10957',10164,10199,255),(654,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10957',10171,0,29),(655,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'10957',10163,0,1),(656,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10958',10164,10199,255),(657,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10958',10171,0,3),(658,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'10958',10163,0,3),(659,10155,'com.liferay.portal.model.Layout',4,'10965',10164,10199,1023),(660,10155,'com.liferay.portal.model.Layout',4,'10965',10171,0,19),(661,10155,'com.liferay.portal.model.Layout',4,'10967',10164,10199,1023),(662,10155,'com.liferay.portal.model.Layout',4,'10967',10171,0,19),(663,10155,'com.liferay.portal.model.Layout',4,'10969',10164,10199,1023),(664,10155,'com.liferay.portal.model.Layout',4,'10969',10171,0,19),(665,10155,'com.liferay.portal.model.Layout',4,'10971',10164,10199,1023),(666,10155,'com.liferay.portal.model.Layout',4,'10971',10171,0,19),(667,10155,'com.liferay.portal.model.Layout',4,'10973',10164,10199,1023),(668,10155,'com.liferay.portal.model.Layout',4,'10973',10171,0,19),(669,10155,'com.liferay.portal.model.Layout',4,'10975',10164,10199,1023),(670,10155,'com.liferay.portal.model.Layout',4,'10975',10171,0,19),(671,10155,'com.liferay.portal.model.Layout',4,'10977',10164,10199,1023),(672,10155,'com.liferay.portal.model.Layout',4,'10977',10171,0,19),(682,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11008',10164,10199,255),(683,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11008',10171,0,29),(684,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11008',10163,0,1),(685,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11009',10164,10199,255),(686,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11009',10171,0,29),(687,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11009',10163,0,1),(691,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11015',10164,10199,255),(692,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11015',10171,0,29),(693,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11015',10163,0,1),(694,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11016',10164,10199,255),(695,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11016',10171,0,3),(696,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11016',10163,0,3),(730,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',1,'10155',10162,0,2),(731,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',1,'10155',10163,0,2),(732,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',1,'10155',10165,0,2),(733,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',1,'10155',10166,0,2),(734,10155,'com.liferay.portal.model.LayoutSetPrototype',4,'11147',10164,10159,15),(738,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'11159',10164,10159,15),(739,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'11159',10171,0,1),(740,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'11159',10163,0,1),(741,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'11160',10164,10159,15),(742,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'11160',10171,0,1),(743,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'11160',10163,0,1),(744,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11163',10164,10159,255),(745,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11163',10171,0,3),(746,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11163',10163,0,3),(747,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11172',10164,10159,255),(748,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11172',10171,0,3),(749,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11172',10163,0,3),(750,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11180',10164,10159,255),(751,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11180',10171,0,3),(752,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11180',10163,0,3),(753,10155,'com.liferay.portal.model.Layout',4,'11189',10164,10159,1023),(754,10155,'com.liferay.portal.model.Layout',4,'11189',10171,0,19),(755,10155,'com.liferay.portal.model.Layout',4,'11189',10163,0,1),(756,10155,'scftradeportlet_WAR_scftradeportlet',1,'10155',10162,0,2),(757,10155,'scftradeportlet_WAR_scftradeportlet',1,'10155',10163,0,2),(758,10155,'scftradeportlet_WAR_scftradeportlet',1,'10155',10165,0,2),(759,10155,'scftradeportlet_WAR_scftradeportlet',1,'10155',10166,0,2),(760,10155,'scfinvestorportlet_WAR_scfinvestorportlet',1,'10155',10162,0,2),(761,10155,'scfinvestorportlet_WAR_scfinvestorportlet',1,'10155',10163,0,2),(762,10155,'scfinvestorportlet_WAR_scfinvestorportlet',1,'10155',10165,0,2),(763,10155,'scfinvestorportlet_WAR_scfinvestorportlet',1,'10155',10166,0,2),(764,10155,'tfregistrationportlet_WAR_tfregistrationportlet',1,'10155',10162,0,2),(765,10155,'tfregistrationportlet_WAR_tfregistrationportlet',1,'10155',10163,0,2),(766,10155,'tfregistrationportlet_WAR_tfregistrationportlet',1,'10155',10165,0,2),(767,10155,'tfregistrationportlet_WAR_tfregistrationportlet',1,'10155',10166,0,2),(768,10155,'tfcompanyportlet_WAR_tfadminportlet',1,'10155',10162,0,2),(769,10155,'tfcompanyportlet_WAR_tfadminportlet',1,'10155',10163,0,2),(770,10155,'tfcompanyportlet_WAR_tfadminportlet',1,'10155',10165,0,2),(771,10155,'tfcompanyportlet_WAR_tfadminportlet',1,'10155',10166,0,2),(772,10155,'145',4,'10703_LAYOUT_145',10164,0,31),(773,10155,'145',4,'10703_LAYOUT_145',10171,0,1),(774,10155,'145',4,'10703_LAYOUT_145',10163,0,1),(775,10155,'2_WAR_notificationsportlet',4,'10703_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(776,10155,'2_WAR_notificationsportlet',4,'10703_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(777,10155,'2_WAR_notificationsportlet',4,'10703_LAYOUT_2_WAR_notificationsportlet',10163,0,1),(801,10155,'tfdashboardportlet_WAR_tfdashboardportlet',1,'10155',10162,0,2),(802,10155,'tfdashboardportlet_WAR_tfdashboardportlet',1,'10155',10163,0,2),(803,10155,'tfdashboardportlet_WAR_tfdashboardportlet',1,'10155',10165,0,2),(804,10155,'tfdashboardportlet_WAR_tfdashboardportlet',1,'10155',10166,0,2),(805,10155,'145',4,'10965_LAYOUT_145',10164,0,31),(806,10155,'145',4,'10965_LAYOUT_145',10171,0,1),(807,10155,'2_WAR_notificationsportlet',4,'10965_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(808,10155,'2_WAR_notificationsportlet',4,'10965_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(809,10155,'tfdashboardportlet_WAR_tfdashboardportlet',4,'10965_LAYOUT_tfdashboardportlet_WAR_tfdashboardportlet',10164,0,31),(810,10155,'tfdashboardportlet_WAR_tfdashboardportlet',4,'10965_LAYOUT_tfdashboardportlet_WAR_tfdashboardportlet',10171,0,1),(811,10155,'145',4,'10705_LAYOUT_145',10164,0,31),(812,10155,'145',4,'10705_LAYOUT_145',10171,0,1),(813,10155,'145',4,'10705_LAYOUT_145',10163,0,1),(814,10155,'2_WAR_notificationsportlet',4,'10705_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(815,10155,'2_WAR_notificationsportlet',4,'10705_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(816,10155,'2_WAR_notificationsportlet',4,'10705_LAYOUT_2_WAR_notificationsportlet',10163,0,1),(817,10155,'tfregistrationportlet_WAR_tfregistrationportlet',4,'10705_LAYOUT_tfregistrationportlet_WAR_tfregistrationportlet',10164,0,31),(818,10155,'tfregistrationportlet_WAR_tfregistrationportlet',4,'10705_LAYOUT_tfregistrationportlet_WAR_tfregistrationportlet',10171,0,1),(819,10155,'tfregistrationportlet_WAR_tfregistrationportlet',4,'10705_LAYOUT_tfregistrationportlet_WAR_tfregistrationportlet',10163,0,1),(820,10155,'com.liferay.portal.model.User',4,'11308',10164,10159,31),(821,10155,'com.liferay.portal.model.Layout',4,'11315',10164,11308,1023),(822,10155,'com.liferay.portal.model.Layout',4,'11321',10164,11308,1023),(823,10155,'com.liferay.portal.model.Layout',4,'11321',10165,0,19),(824,10155,'com.liferay.portal.model.Layout',4,'11321',10163,0,1),(825,10155,'145',4,'10971_LAYOUT_145',10164,0,31),(826,10155,'145',4,'10971_LAYOUT_145',10171,0,1),(827,10155,'2_WAR_notificationsportlet',4,'10971_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(828,10155,'2_WAR_notificationsportlet',4,'10971_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(829,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',4,'10971_LAYOUT_scfinvoiceportlet_WAR_scfinvoiceportlet',10164,0,31),(830,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',4,'10971_LAYOUT_scfinvoiceportlet_WAR_scfinvoiceportlet',10171,0,1),(831,10155,'145',4,'10967_LAYOUT_145',10164,0,31),(832,10155,'145',4,'10967_LAYOUT_145',10171,0,1),(833,10155,'2_WAR_notificationsportlet',4,'10967_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(834,10155,'2_WAR_notificationsportlet',4,'10967_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(835,10155,'tfcompanyportlet_WAR_tfadminportlet',4,'10967_LAYOUT_tfcompanyportlet_WAR_tfadminportlet',10164,0,31),(836,10155,'tfcompanyportlet_WAR_tfadminportlet',4,'10967_LAYOUT_tfcompanyportlet_WAR_tfadminportlet',10171,0,1),(837,10155,'com.liferay.portal.model.User',4,'11336',10164,10199,31),(901,10155,'com.liferay.portal.model.User',4,'11407',10164,10159,31),(902,10155,'com.liferay.portal.model.Layout',4,'11414',10164,11407,1023),(903,10155,'com.liferay.portal.model.Layout',4,'11420',10164,11407,1023),(904,10155,'com.liferay.portal.model.Layout',4,'11420',10165,0,19),(905,10155,'com.liferay.portal.model.Layout',4,'11420',10163,0,1),(906,10155,'com.liferay.portal.model.User',4,'11437',10164,10159,31),(907,10155,'com.liferay.portal.model.Layout',4,'11444',10164,11437,1023),(908,10155,'com.liferay.portal.model.Layout',4,'11450',10164,11437,1023),(909,10155,'com.liferay.portal.model.Layout',4,'11450',10165,0,19),(910,10155,'com.liferay.portal.model.Layout',4,'11450',10163,0,1),(911,10155,'com.liferay.portal.model.User',4,'11457',10164,10159,31),(912,10155,'com.liferay.portal.model.Layout',4,'11464',10164,11457,1023),(913,10155,'com.liferay.portal.model.Layout',4,'11470',10164,11457,1023),(914,10155,'com.liferay.portal.model.Layout',4,'11470',10165,0,19),(915,10155,'com.liferay.portal.model.Layout',4,'11470',10163,0,1),(916,10155,'com.liferay.portal.model.User',4,'11477',10164,10159,31),(917,10155,'com.liferay.portal.model.Layout',4,'11484',10164,11477,1023),(918,10155,'com.liferay.portal.model.Layout',4,'11490',10164,11477,1023),(919,10155,'com.liferay.portal.model.Layout',4,'11490',10165,0,19),(920,10155,'com.liferay.portal.model.Layout',4,'11490',10163,0,1),(921,10155,'com.liferay.portal.model.User',4,'11497',10164,10159,31),(922,10155,'com.liferay.portal.model.Layout',4,'11504',10164,11497,1023),(923,10155,'com.liferay.portal.model.Layout',4,'11510',10164,11497,1023),(924,10155,'com.liferay.portal.model.Layout',4,'11510',10165,0,19),(925,10155,'com.liferay.portal.model.Layout',4,'11510',10163,0,1),(926,10155,'com.liferay.portal.model.User',4,'11517',10164,10159,31),(927,10155,'com.liferay.portal.model.Layout',4,'11524',10164,11517,1023),(928,10155,'com.liferay.portal.model.Layout',4,'11530',10164,11517,1023),(929,10155,'com.liferay.portal.model.Layout',4,'11530',10165,0,19),(930,10155,'com.liferay.portal.model.Layout',4,'11530',10163,0,1),(931,10155,'com.liferay.portal.model.User',4,'11537',10164,10159,31),(932,10155,'com.liferay.portal.model.Layout',4,'11544',10164,11537,1023),(933,10155,'com.liferay.portal.model.Layout',4,'11550',10164,11537,1023),(934,10155,'com.liferay.portal.model.Layout',4,'11550',10165,0,19),(935,10155,'com.liferay.portal.model.Layout',4,'11550',10163,0,1),(1004,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11607',10164,10199,255),(1005,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11607',10171,0,29),(1006,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11607',10163,0,1),(1007,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11608',10164,10199,255),(1008,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11608',10171,0,3),(1009,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11608',10163,0,3),(1101,10155,'49',4,'10965_LAYOUT_49',10164,0,31),(1102,10155,'49',4,'10965_LAYOUT_49',10171,0,1),(1103,10155,'33',4,'11420_LAYOUT_33',10164,0,63),(1104,10155,'82',4,'11420_LAYOUT_82',10164,0,31),(1105,10155,'33',4,'11420_LAYOUT_33',10165,0,1),(1106,10155,'82',4,'11420_LAYOUT_82',10165,0,1),(1107,10155,'82',4,'11420_LAYOUT_82',10163,0,1),(1108,10155,'33',4,'11420_LAYOUT_33',10163,0,1),(1109,10155,'com.liferay.portlet.blogs',4,'11410',10164,0,14),(1110,10155,'3',4,'11420_LAYOUT_3',10164,0,31),(1111,10155,'3',4,'11420_LAYOUT_3',10165,0,1),(1112,10155,'3',4,'11420_LAYOUT_3',10163,0,1),(1113,10155,'145',4,'11420_LAYOUT_145',10164,0,31),(1114,10155,'145',4,'11420_LAYOUT_145',10165,0,1),(1115,10155,'145',4,'11420_LAYOUT_145',10163,0,1),(1116,10155,'2_WAR_notificationsportlet',4,'11420_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(1117,10155,'2_WAR_notificationsportlet',4,'11420_LAYOUT_2_WAR_notificationsportlet',10165,0,1),(1118,10155,'2_WAR_notificationsportlet',4,'11420_LAYOUT_2_WAR_notificationsportlet',10163,0,1),(1119,10155,'com.liferay.portal.model.Layout',4,'11707',10164,11336,1023),(1120,10155,'com.liferay.portal.model.Layout',4,'11713',10164,11336,1023),(1121,10155,'com.liferay.portal.model.Layout',4,'11713',10165,0,19),(1122,10155,'com.liferay.portal.model.Layout',4,'11713',10163,0,1),(1123,10155,'145',4,'10973_LAYOUT_145',10164,0,31),(1124,10155,'145',4,'10973_LAYOUT_145',10171,0,1),(1125,10155,'2_WAR_notificationsportlet',4,'10973_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(1126,10155,'2_WAR_notificationsportlet',4,'10973_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(1127,10155,'scftradeportlet_WAR_scftradeportlet',4,'10973_LAYOUT_scftradeportlet_WAR_scftradeportlet',10164,0,31),(1128,10155,'scftradeportlet_WAR_scftradeportlet',4,'10973_LAYOUT_scftradeportlet_WAR_scftradeportlet',10171,0,1),(1204,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11805',10164,10199,255),(1205,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11805',10171,0,29),(1206,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11805',10163,0,1),(1207,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11806',10164,10199,255),(1208,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11806',10171,0,3),(1209,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11806',10163,0,3),(1210,10155,'145',4,'10977_LAYOUT_145',10164,0,31),(1211,10155,'145',4,'10977_LAYOUT_145',10171,0,1),(1212,10155,'2_WAR_notificationsportlet',4,'10977_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(1213,10155,'2_WAR_notificationsportlet',4,'10977_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(1214,10155,'tfsettingsportlet_WAR_tfsettingsportlet',1,'10155',10162,0,2),(1215,10155,'tfsettingsportlet_WAR_tfsettingsportlet',1,'10155',10163,0,2),(1216,10155,'tfsettingsportlet_WAR_tfsettingsportlet',1,'10155',10165,0,2),(1217,10155,'tfsettingsportlet_WAR_tfsettingsportlet',1,'10155',10166,0,2),(1218,10155,'tfsettingsportlet_WAR_tfsettingsportlet',4,'10977_LAYOUT_tfsettingsportlet_WAR_tfsettingsportlet',10164,0,31),(1219,10155,'tfsettingsportlet_WAR_tfsettingsportlet',4,'10977_LAYOUT_tfsettingsportlet_WAR_tfsettingsportlet',10171,0,1),(1220,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'11825',10164,10199,255),(1221,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11829',10164,10199,255),(1301,10155,'145',4,'10975_LAYOUT_145',10164,0,31),(1302,10155,'145',4,'10975_LAYOUT_145',10171,0,1),(1303,10155,'2_WAR_notificationsportlet',4,'10975_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(1304,10155,'2_WAR_notificationsportlet',4,'10975_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(1305,10155,'scfinvestorportlet_WAR_scfinvestorportlet',4,'10975_LAYOUT_scfinvestorportlet_WAR_scfinvestorportlet',10164,0,31),(1306,10155,'scfinvestorportlet_WAR_scfinvestorportlet',4,'10975_LAYOUT_scfinvestorportlet_WAR_scfinvestorportlet',10171,0,1),(1404,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'12157',10164,10199,255),(1405,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'12157',10171,0,29),(1406,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'12157',10163,0,1),(1407,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'12158',10164,10199,255),(1408,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'12158',10171,0,3),(1409,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'12158',10163,0,3),(1410,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12167',10164,10199,255),(1411,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12167',10171,0,3),(1412,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12167',10163,0,3),(1413,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12193',10164,10199,255),(1414,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12193',10171,0,3),(1415,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12193',10163,0,3),(1416,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12219',10164,10199,255),(1417,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12219',10171,0,3),(1418,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12219',10163,0,3),(1419,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12241',10164,10199,255),(1420,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12241',10171,0,3),(1421,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12241',10163,0,3),(1422,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12259',10164,10199,255),(1423,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12259',10171,0,3),(1424,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12259',10163,0,3),(1425,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12281',10164,10199,255),(1426,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12281',10171,0,3),(1427,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'12281',10163,0,3),(1501,10155,'tfreportportlet_WAR_tfreportportlet',1,'10155',10162,0,2),(1502,10155,'tfreportportlet_WAR_tfreportportlet',1,'10155',10163,0,2),(1503,10155,'tfreportportlet_WAR_tfreportportlet',1,'10155',10165,0,2),(1504,10155,'tfreportportlet_WAR_tfreportportlet',1,'10155',10166,0,2),(1601,10155,'com.liferay.portal.model.Layout',4,'12501',10164,10199,1023),(1602,10155,'com.liferay.portal.model.Layout',4,'12501',10171,0,19),(1603,10155,'145',4,'12501_LAYOUT_145',10164,0,31),(1604,10155,'145',4,'12501_LAYOUT_145',10171,0,1),(1605,10155,'2_WAR_notificationsportlet',4,'12501_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(1606,10155,'2_WAR_notificationsportlet',4,'12501_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(1607,10155,'tfreportportlet_WAR_tfreportportlet',4,'12501_LAYOUT_tfreportportlet_WAR_tfreportportlet',10164,0,31),(1608,10155,'tfreportportlet_WAR_tfreportportlet',4,'12501_LAYOUT_tfreportportlet_WAR_tfreportportlet',10171,0,1),(1701,10155,'49',4,'10703_LAYOUT_49',10164,0,31),(1702,10155,'49',4,'10703_LAYOUT_49',10171,0,1),(1703,10155,'49',4,'10703_LAYOUT_49',10163,0,1);

/*Table structure for table `resourcetypepermission` */

DROP TABLE IF EXISTS `resourcetypepermission`;

CREATE TABLE `resourcetypepermission` (
  `resourceTypePermissionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `actionIds` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`resourceTypePermissionId`),
  UNIQUE KEY `IX_BA497163` (`companyId`,`groupId`,`name`,`roleId`),
  KEY `IX_7D81F66F` (`companyId`,`name`,`roleId`),
  KEY `IX_A82690E2` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resourcetypepermission` */

/*Table structure for table `role_` */

DROP TABLE IF EXISTS `role_`;

CREATE TABLE `role_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `roleId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `type_` int(11) DEFAULT NULL,
  `subtype` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`roleId`),
  UNIQUE KEY `IX_A88E424E` (`companyId`,`classNameId`,`classPK`),
  UNIQUE KEY `IX_EBC931B8` (`companyId`,`name`),
  KEY `IX_449A10B9` (`companyId`),
  KEY `IX_F3E1C6FC` (`companyId`,`type_`),
  KEY `IX_F436EC8E` (`name`),
  KEY `IX_5EB4E2FB` (`subtype`),
  KEY `IX_F92B66E6` (`type_`),
  KEY `IX_CBE204` (`type_`,`subtype`),
  KEY `IX_26DB26C5` (`uuid_`),
  KEY `IX_B9FF6043` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `role_` */

insert  into `role_`(`uuid_`,`roleId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`name`,`title`,`description`,`type_`,`subtype`) values ('d3cd02ad-dd0b-43a6-9d1e-41352b753be8',10162,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10162,'Administrator','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Administrators are super users who can do anything.</Description></root>',1,''),('0ff9ca23-3d61-4535-ac22-1b61439c1b58',10163,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10163,'Guest','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Unauthenticated users always have this role.</Description></root>',1,''),('c3f98e4d-37c5-453d-8c63-030749e879e6',10164,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10164,'Owner','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">This is an implied role with respect to the objects users create.</Description></root>',1,''),('f3e8b02a-5fdc-4bbc-b55a-88aeb8a008d5',10165,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10165,'Power User','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Power Users have their own personal site.</Description></root>',1,''),('24494fed-c8f2-4d83-a726-7e9790d4040f',10166,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10166,'User','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Authenticated users should be assigned this role.</Description></root>',1,''),('4c339de8-126f-4796-ad01-433795196c59',10167,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10167,'Organization Administrator','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Organization Administrators are super users of their organization but cannot make other users into Organization Administrators.</Description></root>',3,''),('fa86b85b-7c55-4127-9f49-34b4e838a20a',10168,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10168,'Organization Owner','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Organization Owners are super users of their organization and can assign organization roles to users.</Description></root>',3,''),('147f9592-d8b2-4c9e-9f6b-64c00483c5b8',10169,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10169,'Organization User','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">All users who belong to an organization have this role within that organization.</Description></root>',3,''),('65e10b00-8d07-4b48-a2bb-6c62a0eb9cfb',10170,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10170,'Site Administrator','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Site Administrators are super users of their site but cannot make other users into Site Administrators.</Description></root>',2,''),('275da886-5e84-4866-8e30-7846210a63d0',10171,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10171,'Site Member','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">All users who belong to a site have this role within that site.</Description></root>',2,''),('636c7416-58c9-4964-b13c-f68cab97e82b',10172,10155,10159,'','2016-03-15 19:16:26','2016-03-15 19:16:26',10004,10172,'Site Owner','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Site Owners are super users of their site and can assign site roles to users.</Description></root>',2,''),('78aa4cf4-8961-4158-9d0e-57454b755627',10481,10155,10159,'','2016-03-15 19:17:53','2016-03-15 19:17:53',10004,10481,'Organization Content Reviewer','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Autogenerated role from workflow definition</Description></root>',3,''),('0a13e8af-28db-4aee-8cd4-43df231ccff5',10483,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54',10004,10483,'Site Content Reviewer','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Autogenerated role from workflow definition</Description></root>',2,''),('f0e70b16-f4ae-4874-ae23-5b02221d35fe',10485,10155,10159,'','2016-03-15 19:17:54','2016-03-15 19:17:54',10004,10485,'Portal Content Reviewer','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Autogenerated role from workflow definition</Description></root>',1,''),('c9e86503-e7b1-4399-85ad-c52de9fa3dce',10684,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:50:47',10004,10684,'WhiteHall User','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">WhiteHall User</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">WhiteHall User</Description></root>',1,''),('792afcaf-639b-4271-b9af-6a37cf954c84',10685,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:50:47',10004,10685,'Primary Investor Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Primary Investor Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Primary Investor Admin</Description></root>',1,''),('67137b2f-7e96-4d2d-a4fd-28e6d91c7544',10686,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:50:47',10004,10686,'SCF Company Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">SCF Company Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">SCF Company Admin</Description></root>',1,''),('0ab78e69-8180-4015-905c-e8f47573e6b7',10687,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:50:47',10004,10687,'Secondary Investor Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Secondary Investor Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Secondary Investor Admin</Description></root>',1,''),('22966fc0-7d71-477d-81ab-15bdf61e611e',10688,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:50:47',10004,10688,'Seller Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Seller Admin</Description></root>',1,''),('9a8abaa7-8dfd-43d2-9a45-0a82e2e1049a',10689,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:50:47',10004,10689,'SCF Company User','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">SCF Company User</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">SCF Company User</Description></root>',1,''),('961a02f4-596d-4209-a8e7-7a6d6d8adfcd',10690,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:50:47',10004,10690,'WhiteHall Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">WhiteHall Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">WhiteHall Admin</Description></root>',1,''),('3a365759-55e2-49bb-bb1d-4d2bc621dc3d',10691,10155,10199,'Test Test','2016-03-15 20:50:47','2016-03-15 20:50:47',10004,10691,'Seller User','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller User</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Seller User</Description></root>',1,'');

/*Table structure for table `scf_invoice` */

DROP TABLE IF EXISTS `scf_invoice`;

CREATE TABLE `scf_invoice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `invoice_number` bigint(20) NOT NULL,
  `invoice_date` date DEFAULT NULL,
  `seller_company_registration_number` varchar(25) DEFAULT NULL,
  `seller_company_vat_number` varchar(25) DEFAULT NULL,
  `invoice_amout` decimal(10,0) DEFAULT NULL,
  `vat_amount` decimal(10,0) DEFAULT NULL,
  `invoice_desc` varchar(45) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `scf_company` bigint(20) DEFAULT NULL,
  `finance_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `trade_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `invoice_number_UNIQUE` (`invoice_number`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `scf_invoice` */

insert  into `scf_invoice`(`id`,`invoice_number`,`invoice_date`,`seller_company_registration_number`,`seller_company_vat_number`,`invoice_amout`,`vat_amount`,`invoice_desc`,`duration`,`payment_date`,`currency`,`scf_company`,`finance_date`,`status`,`trade_id`) values (4,1001,'2016-03-02','04619040',NULL,'15000',NULL,'Desc1122223333333',36,'2016-05-01','GBP',2,'2016-03-25','TRADE_GENERATED',21),(5,1002,'2016-03-01','04619040',NULL,'15000',NULL,'',47,'2016-05-12','GBP',2,'2016-03-25','TRADE_GENERATED',21),(6,1003,'2016-03-24','04619040',NULL,'15000',NULL,'',60,'2016-05-25','GBP',2,'2016-03-25','TRADE_GENERATED',21),(7,1004,'2016-03-09','04619040',NULL,'15000',NULL,'',67,'2016-06-01','GBP',2,'2016-03-25','TRADE_GENERATED',21),(8,1005,'2016-03-10','04619040',NULL,'15000',NULL,'',35,'2016-04-30','GBP',2,'2016-03-25','TRADE_GENERATED',22),(9,1006,'2016-03-01','04619040',NULL,'15000',NULL,'',35,'2016-04-30','GBP',2,'2016-03-25','TRADE_GENERATED',22),(10,1007,'2016-03-01','04619040',NULL,'15000',NULL,'Decf',36,'2016-05-01','GBP',2,NULL,'New',NULL),(11,1008,'2016-03-02','04619040',NULL,'15000',NULL,'ghfs',67,'2016-06-01','GBP',2,'2016-03-25','TRADE_GENERATED',23),(15,1011,'2016-03-02','04619040',NULL,'15000',NULL,'',54,'2016-05-19','GBP',9,'2016-03-25','TRADE_GENERATED',23),(16,1012,'2016-03-08','04619040',NULL,'15000',NULL,'',67,'2016-06-01','GBP',9,NULL,'New',NULL),(17,10057,'2016-03-09','04619040',NULL,'15000',NULL,'gh',81,'2016-06-15','GBP',2,'2016-03-25','TRADE_GENERATED',24),(18,1055,'2016-03-02','04619040',NULL,'15000',NULL,'dfr',60,'2016-05-25','GBP',2,'2016-03-25','TRADE_GENERATED',24);

/*Table structure for table `scf_invoice_document` */

DROP TABLE IF EXISTS `scf_invoice_document`;

CREATE TABLE `scf_invoice_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) DEFAULT NULL,
  `document_name` varchar(100) DEFAULT NULL,
  `document_type` varchar(100) DEFAULT NULL,
  `document_url` varchar(800) DEFAULT NULL,
  `uploadedby` varchar(30) DEFAULT NULL,
  `upload_date` date DEFAULT NULL,
  `scf_company` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `document_id_UNIQUE` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scf_invoice_document` */

/*Table structure for table `scf_trade` */

DROP TABLE IF EXISTS `scf_trade`;

CREATE TABLE `scf_trade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `scf_trade` varchar(10) DEFAULT NULL,
  `duration` int(10) DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `investor_Payment_date` date DEFAULT NULL,
  `Seller_Payment_date` date DEFAULT NULL,
  `trade_amount` decimal(10,0) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `company_id` bigint(20) NOT NULL,
  `trade_notes` varchar(45) DEFAULT NULL,
  `trade_settled` tinyint(1) DEFAULT '0',
  `want_to_insure` tinyint(1) DEFAULT '0',
  `insurance_doc_id` bigint(20) DEFAULT NULL,
  `insurance_doc_name` varchar(70) DEFAULT NULL,
  `insurance_doc_url` varchar(800) DEFAULT NULL,
  `insurance_doc_type` varchar(50) DEFAULT NULL,
  `promisory_note` varchar(300) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `investor_total_gross_profit` decimal(10,2) DEFAULT NULL,
  `whitehall_total_share` decimal(10,2) DEFAULT NULL,
  `investor_total_net_profit` decimal(10,2) DEFAULT NULL,
  `seller_fees` decimal(10,2) DEFAULT NULL,
  `seller_transaction_fee` decimal(10,2) DEFAULT NULL,
  `whitehall_total_profit` decimal(10,2) DEFAULT NULL,
  `whitehall_net_receivable` decimal(10,2) DEFAULT NULL,
  `seller_net_allotment` decimal(10,2) DEFAULT NULL,
  `scf_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `scf_trade` */

insert  into `scf_trade`(`id`,`scf_trade`,`duration`,`closing_date`,`opening_date`,`investor_Payment_date`,`Seller_Payment_date`,`trade_amount`,`STATUS`,`company_id`,`trade_notes`,`trade_settled`,`want_to_insure`,`insurance_doc_id`,`insurance_doc_name`,`insurance_doc_url`,`insurance_doc_type`,`promisory_note`,`create_date`,`update_date`,`investor_total_gross_profit`,`whitehall_total_share`,`investor_total_net_profit`,`seller_fees`,`seller_transaction_fee`,`whitehall_total_profit`,`whitehall_net_receivable`,`seller_net_allotment`,`scf_id`) values (21,NULL,67,'2016-06-03','2016-03-24','2016-06-02','2016-03-25','60000','Settled',2,'Finance requested by Supplier',0,0,NULL,NULL,NULL,NULL,NULL,'2016-03-24',NULL,'440.55','33.04','407.51','804.00','25.00','862.04','862.04','58730.45','MOR160300001'),(22,NULL,35,'2016-05-03','2016-03-24','2016-05-02','2016-03-25','30000','Settled',2,'Finance requested by Supplier',0,0,NULL,NULL,NULL,NULL,NULL,'2016-03-24',NULL,'115.07','8.63','106.44','210.00','25.00','243.63','243.63','29649.93','MOR160300002'),(23,NULL,54,'2016-05-23','2016-03-24','2016-05-20','2016-03-25','30000','Live',9,'Finance requested by Supplier',0,0,NULL,NULL,NULL,NULL,NULL,'2016-03-24',NULL,'177.53','17.75','159.78','324.00','25.00','366.75','366.75','29473.47','LID160300001'),(24,NULL,60,'2016-05-27','2016-03-24','2016-05-26','2016-03-25','30000','Live',2,'Finance requested by Supplier',0,0,NULL,NULL,NULL,NULL,NULL,'2016-03-24',NULL,'197.26','14.79','182.47','360.00','25.00','399.79','399.79','29417.74','MOR160300003');

/*Table structure for table `scframeworkversi_scproductvers` */

DROP TABLE IF EXISTS `scframeworkversi_scproductvers`;

CREATE TABLE `scframeworkversi_scproductvers` (
  `frameworkVersionId` bigint(20) NOT NULL,
  `productVersionId` bigint(20) NOT NULL,
  PRIMARY KEY (`frameworkVersionId`,`productVersionId`),
  KEY `IX_3BB93ECA` (`frameworkVersionId`),
  KEY `IX_E8D33FF9` (`productVersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scframeworkversi_scproductvers` */

/*Table structure for table `scframeworkversion` */

DROP TABLE IF EXISTS `scframeworkversion`;

CREATE TABLE `scframeworkversion` (
  `frameworkVersionId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `url` longtext,
  `active_` tinyint(4) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`frameworkVersionId`),
  KEY `IX_C98C0D78` (`companyId`),
  KEY `IX_272991FA` (`groupId`),
  KEY `IX_6E1764F` (`groupId`,`active_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scframeworkversion` */

/*Table structure for table `sclicense` */

DROP TABLE IF EXISTS `sclicense`;

CREATE TABLE `sclicense` (
  `licenseId` bigint(20) NOT NULL,
  `name` varchar(75) DEFAULT NULL,
  `url` longtext,
  `openSource` tinyint(4) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  `recommended` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`licenseId`),
  KEY `IX_1C841592` (`active_`),
  KEY `IX_5327BB79` (`active_`,`recommended`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sclicense` */

/*Table structure for table `sclicenses_scproductentries` */

DROP TABLE IF EXISTS `sclicenses_scproductentries`;

CREATE TABLE `sclicenses_scproductentries` (
  `licenseId` bigint(20) NOT NULL,
  `productEntryId` bigint(20) NOT NULL,
  PRIMARY KEY (`licenseId`,`productEntryId`),
  KEY `IX_27006638` (`licenseId`),
  KEY `IX_D7710A66` (`productEntryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sclicenses_scproductentries` */

/*Table structure for table `scproductentry` */

DROP TABLE IF EXISTS `scproductentry`;

CREATE TABLE `scproductentry` (
  `productEntryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `shortDescription` longtext,
  `longDescription` longtext,
  `pageURL` longtext,
  `author` varchar(75) DEFAULT NULL,
  `repoGroupId` varchar(75) DEFAULT NULL,
  `repoArtifactId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`productEntryId`),
  KEY `IX_5D25244F` (`companyId`),
  KEY `IX_72F87291` (`groupId`),
  KEY `IX_98E6A9CB` (`groupId`,`userId`),
  KEY `IX_7311E812` (`repoGroupId`,`repoArtifactId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scproductentry` */

/*Table structure for table `scproductscreenshot` */

DROP TABLE IF EXISTS `scproductscreenshot`;

CREATE TABLE `scproductscreenshot` (
  `productScreenshotId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `productEntryId` bigint(20) DEFAULT NULL,
  `thumbnailId` bigint(20) DEFAULT NULL,
  `fullImageId` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`productScreenshotId`),
  KEY `IX_AE8224CC` (`fullImageId`),
  KEY `IX_467956FD` (`productEntryId`),
  KEY `IX_DA913A55` (`productEntryId`,`priority`),
  KEY `IX_6C572DAC` (`thumbnailId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scproductscreenshot` */

/*Table structure for table `scproductversion` */

DROP TABLE IF EXISTS `scproductversion`;

CREATE TABLE `scproductversion` (
  `productVersionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `productEntryId` bigint(20) DEFAULT NULL,
  `version` varchar(75) DEFAULT NULL,
  `changeLog` longtext,
  `downloadPageURL` longtext,
  `directDownloadURL` varchar(2000) DEFAULT NULL,
  `repoStoreArtifact` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`productVersionId`),
  KEY `IX_7020130F` (`directDownloadURL`(767)),
  KEY `IX_8377A211` (`productEntryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scproductversion` */

/*Table structure for table `servicecomponent` */

DROP TABLE IF EXISTS `servicecomponent`;

CREATE TABLE `servicecomponent` (
  `serviceComponentId` bigint(20) NOT NULL,
  `buildNamespace` varchar(75) DEFAULT NULL,
  `buildNumber` bigint(20) DEFAULT NULL,
  `buildDate` bigint(20) DEFAULT NULL,
  `data_` longtext,
  PRIMARY KEY (`serviceComponentId`),
  UNIQUE KEY `IX_4F0315B8` (`buildNamespace`,`buildNumber`),
  KEY `IX_7338606F` (`buildNamespace`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `servicecomponent` */

insert  into `servicecomponent`(`serviceComponentId`,`buildNamespace`,`buildNumber`,`buildDate`,`data_`) values (10436,'Marketplace',3,1371580382539,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table Marketplace_App (\n	uuid_ VARCHAR(75) null,\n	appId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	remoteAppId LONG,\n	title VARCHAR(75) null,\n	description STRING null,\n	category VARCHAR(75) null,\n	iconURL STRING null,\n	version VARCHAR(75) null\n);\n\ncreate table Marketplace_Module (\n	uuid_ VARCHAR(75) null,\n	moduleId LONG not null primary key,\n	appId LONG,\n	contextName VARCHAR(75) null\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_94A7EF25 on Marketplace_App (category);\ncreate index IX_865B7BD5 on Marketplace_App (companyId);\ncreate index IX_20F14D93 on Marketplace_App (remoteAppId);\ncreate index IX_3E667FE1 on Marketplace_App (uuid_);\ncreate index IX_A7807DA7 on Marketplace_App (uuid_, companyId);\n\ncreate index IX_7DC16D26 on Marketplace_Module (appId);\ncreate index IX_C6938724 on Marketplace_Module (appId, contextName);\ncreate index IX_F2F1E964 on Marketplace_Module (contextName);\ncreate index IX_A7EFD80E on Marketplace_Module (uuid_);]]></indexes-sql>\n</data>'),(10444,'Calendar',2,1397685647889,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table Calendar (\n	uuid_ VARCHAR(75) null,\n	calendarId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	resourceBlockId LONG,\n	calendarResourceId LONG,\n	name STRING null,\n	description STRING null,\n	color INTEGER,\n	defaultCalendar BOOLEAN,\n	enableComments BOOLEAN,\n	enableRatings BOOLEAN\n);\n\ncreate table CalendarBooking (\n	uuid_ VARCHAR(75) null,\n	calendarBookingId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	resourceBlockId LONG,\n	calendarId LONG,\n	calendarResourceId LONG,\n	parentCalendarBookingId LONG,\n	title STRING null,\n	description TEXT null,\n	location STRING null,\n	startTime LONG,\n	endTime LONG,\n	allDay BOOLEAN,\n	recurrence STRING null,\n	firstReminder LONG,\n	firstReminderType VARCHAR(75) null,\n	secondReminder LONG,\n	secondReminderType VARCHAR(75) null,\n	status INTEGER,\n	statusByUserId LONG,\n	statusByUserName VARCHAR(75) null,\n	statusDate DATE null\n);\n\ncreate table CalendarNotificationTemplate (\n	uuid_ VARCHAR(75) null,\n	calendarNotificationTemplateId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	calendarId LONG,\n	notificationType VARCHAR(75) null,\n	notificationTypeSettings VARCHAR(75) null,\n	notificationTemplateType VARCHAR(75) null,\n	subject VARCHAR(75) null,\n	body TEXT null\n);\n\ncreate table CalendarResource (\n	uuid_ VARCHAR(75) null,\n	calendarResourceId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	resourceBlockId LONG,\n	classNameId LONG,\n	classPK LONG,\n	classUuid VARCHAR(75) null,\n	code_ VARCHAR(75) null,\n	name STRING null,\n	description STRING null,\n	active_ BOOLEAN\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_B53EB0E1 on Calendar (groupId, calendarResourceId);\ncreate index IX_97FC174E on Calendar (groupId, calendarResourceId, defaultCalendar);\ncreate index IX_F0FAF226 on Calendar (resourceBlockId);\ncreate index IX_96C8590 on Calendar (uuid_);\ncreate index IX_97656498 on Calendar (uuid_, companyId);\ncreate unique index IX_3AE311A on Calendar (uuid_, groupId);\n\ncreate index IX_D300DFCE on CalendarBooking (calendarId);\ncreate unique index IX_113A264E on CalendarBooking (calendarId, parentCalendarBookingId);\ncreate index IX_470170B4 on CalendarBooking (calendarId, status);\ncreate index IX_B198FFC on CalendarBooking (calendarResourceId);\ncreate index IX_57EBF55B on CalendarBooking (parentCalendarBookingId);\ncreate index IX_F7B8A941 on CalendarBooking (parentCalendarBookingId, status);\ncreate index IX_22DFDB49 on CalendarBooking (resourceBlockId);\ncreate index IX_F6E8EE73 on CalendarBooking (uuid_);\ncreate index IX_A21D9FD5 on CalendarBooking (uuid_, companyId);\ncreate unique index IX_F4C61797 on CalendarBooking (uuid_, groupId);\n\ncreate index IX_A412E5B6 on CalendarNotificationTemplate (calendarId);\ncreate index IX_7727A482 on CalendarNotificationTemplate (calendarId, notificationType, notificationTemplateType);\ncreate index IX_A2D4D78B on CalendarNotificationTemplate (uuid_);\ncreate index IX_4D7D97BD on CalendarNotificationTemplate (uuid_, companyId);\ncreate unique index IX_4012E97F on CalendarNotificationTemplate (uuid_, groupId);\n\ncreate index IX_76DDD0F7 on CalendarResource (active_);\ncreate unique index IX_16A12327 on CalendarResource (classNameId, classPK);\ncreate index IX_4470A59D on CalendarResource (companyId, code_, active_);\ncreate index IX_2C5184D4 on CalendarResource (companyId, name, active_);\ncreate index IX_1243D698 on CalendarResource (groupId);\ncreate index IX_40678371 on CalendarResource (groupId, active_);\ncreate index IX_55C2F8AA on CalendarResource (groupId, code_);\ncreate index IX_B9EA8C92 on CalendarResource (groupId, name, active_);\ncreate index IX_8BCB4D38 on CalendarResource (resourceBlockId);\ncreate index IX_150E2F22 on CalendarResource (uuid_);\ncreate index IX_56A06BC6 on CalendarResource (uuid_, companyId);\ncreate unique index IX_4ABD2BC8 on CalendarResource (uuid_, groupId);]]></indexes-sql>\n</data>'),(10463,'Kaleo',6,1378393571274,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table KaleoAction (\n	kaleoActionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoNodeName VARCHAR(200) null,\n	name VARCHAR(200) null,\n	description STRING null,\n	executionType VARCHAR(20) null,\n	script TEXT null,\n	scriptLanguage VARCHAR(75) null,\n	scriptRequiredContexts STRING null,\n	priority INTEGER\n);\n\ncreate table KaleoCondition (\n	kaleoConditionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	script TEXT null,\n	scriptLanguage VARCHAR(75) null,\n	scriptRequiredContexts VARCHAR(75) null\n);\n\ncreate table KaleoDefinition (\n	kaleoDefinitionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(200) null,\n	title STRING null,\n	description STRING null,\n	content TEXT null,\n	version INTEGER,\n	active_ BOOLEAN,\n	startKaleoNodeId LONG\n);\n\ncreate table KaleoInstance (\n	kaleoInstanceId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoDefinitionName VARCHAR(200) null,\n	kaleoDefinitionVersion INTEGER,\n	rootKaleoInstanceTokenId LONG,\n	className VARCHAR(200) null,\n	classPK LONG,\n	completed BOOLEAN,\n	completionDate DATE null,\n	workflowContext TEXT null\n);\n\ncreate table KaleoInstanceToken (\n	kaleoInstanceTokenId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	parentKaleoInstanceTokenId LONG,\n	currentKaleoNodeId LONG,\n	currentKaleoNodeName VARCHAR(200) null,\n	className VARCHAR(200) null,\n	classPK LONG,\n	completed BOOLEAN,\n	completionDate DATE null\n);\n\ncreate table KaleoLog (\n	kaleoLogId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskInstanceTokenId LONG,\n	kaleoNodeName VARCHAR(200) null,\n	terminalKaleoNode BOOLEAN,\n	kaleoActionId LONG,\n	kaleoActionName VARCHAR(200) null,\n	kaleoActionDescription STRING null,\n	previousKaleoNodeId LONG,\n	previousKaleoNodeName VARCHAR(200) null,\n	previousAssigneeClassName VARCHAR(200) null,\n	previousAssigneeClassPK LONG,\n	currentAssigneeClassName VARCHAR(200) null,\n	currentAssigneeClassPK LONG,\n	type_ VARCHAR(50) null,\n	comment_ TEXT null,\n	startDate DATE null,\n	endDate DATE null,\n	duration LONG,\n	workflowContext TEXT null\n);\n\ncreate table KaleoNode (\n	kaleoNodeId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	name VARCHAR(200) null,\n	metadata STRING null,\n	description STRING null,\n	type_ VARCHAR(20) null,\n	initial_ BOOLEAN,\n	terminal BOOLEAN\n);\n\ncreate table KaleoNotification (\n	kaleoNotificationId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoNodeName VARCHAR(200) null,\n	name VARCHAR(200) null,\n	description STRING null,\n	executionType VARCHAR(20) null,\n	template TEXT null,\n	templateLanguage VARCHAR(75) null,\n	notificationTypes VARCHAR(25) null\n);\n\ncreate table KaleoNotificationRecipient (\n	kaleoNotificationRecipientId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNotificationId LONG,\n	recipientClassName VARCHAR(200) null,\n	recipientClassPK LONG,\n	recipientRoleType INTEGER,\n	address VARCHAR(255) null\n);\n\ncreate table KaleoTask (\n	kaleoTaskId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	name VARCHAR(200) null,\n	description STRING null\n);\n\ncreate table KaleoTaskAssignment (\n	kaleoTaskAssignmentId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	assigneeClassName VARCHAR(200) null,\n	assigneeClassPK LONG,\n	assigneeActionId VARCHAR(75) null,\n	assigneeScript TEXT null,\n	assigneeScriptLanguage VARCHAR(75) null,\n	assigneeScriptRequiredContexts VARCHAR(75) null\n);\n\ncreate table KaleoTaskAssignmentInstance (\n	kaleoTaskAssignmentInstanceId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskInstanceTokenId LONG,\n	kaleoTaskId LONG,\n	kaleoTaskName VARCHAR(200) null,\n	assigneeClassName VARCHAR(200) null,\n	assigneeClassPK LONG,\n	completed BOOLEAN,\n	completionDate DATE null\n);\n\ncreate table KaleoTaskInstanceToken (\n	kaleoTaskInstanceTokenId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskId LONG,\n	kaleoTaskName VARCHAR(200) null,\n	className VARCHAR(200) null,\n	classPK LONG,\n	completionUserId LONG,\n	completed BOOLEAN,\n	completionDate DATE null,\n	dueDate DATE null,\n	workflowContext TEXT null\n);\n\ncreate table KaleoTimer (\n	kaleoTimerId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	name VARCHAR(75) null,\n	blocking BOOLEAN,\n	description STRING null,\n	duration DOUBLE,\n	scale VARCHAR(75) null,\n	recurrenceDuration DOUBLE,\n	recurrenceScale VARCHAR(75) null\n);\n\ncreate table KaleoTimerInstanceToken (\n	kaleoTimerInstanceTokenId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskInstanceTokenId LONG,\n	kaleoTimerId LONG,\n	kaleoTimerName VARCHAR(200) null,\n	blocking BOOLEAN,\n	completionUserId LONG,\n	completed BOOLEAN,\n	completionDate DATE null,\n	workflowContext TEXT null\n);\n\ncreate table KaleoTransition (\n	kaleoTransitionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	name VARCHAR(200) null,\n	description STRING null,\n	sourceKaleoNodeId LONG,\n	sourceKaleoNodeName VARCHAR(200) null,\n	targetKaleoNodeId LONG,\n	targetKaleoNodeName VARCHAR(200) null,\n	defaultTransition BOOLEAN\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_50E9112C on KaleoAction (companyId);\ncreate index IX_170EFD7A on KaleoAction (kaleoClassName, kaleoClassPK);\ncreate index IX_4B2545E8 on KaleoAction (kaleoClassName, kaleoClassPK, executionType);\ncreate index IX_F95A622 on KaleoAction (kaleoDefinitionId);\n\ncreate index IX_FEE46067 on KaleoCondition (companyId);\ncreate index IX_DC978A5D on KaleoCondition (kaleoDefinitionId);\ncreate index IX_86CBD4C on KaleoCondition (kaleoNodeId);\n\ncreate index IX_40B9112F on KaleoDefinition (companyId);\ncreate index IX_408542BA on KaleoDefinition (companyId, active_);\ncreate index IX_76C781AE on KaleoDefinition (companyId, name);\ncreate index IX_4C23F11B on KaleoDefinition (companyId, name, active_);\ncreate index IX_EC14F81A on KaleoDefinition (companyId, name, version);\n\ncreate index IX_5F2FCD2D on KaleoInstance (companyId);\ncreate index IX_BF5839F8 on KaleoInstance (companyId, kaleoDefinitionName, kaleoDefinitionVersion, completionDate);\ncreate index IX_4DA4D123 on KaleoInstance (kaleoDefinitionId);\ncreate index IX_ACF16238 on KaleoInstance (kaleoDefinitionId, completed);\n\ncreate index IX_153721BE on KaleoInstanceToken (companyId);\ncreate index IX_4A86923B on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId);\ncreate index IX_360D34D9 on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId, completionDate);\ncreate index IX_7BDB04B4 on KaleoInstanceToken (kaleoDefinitionId);\ncreate index IX_F42AAFF6 on KaleoInstanceToken (kaleoInstanceId);\n\ncreate index IX_73B5F4DE on KaleoLog (companyId);\ncreate index IX_E66A153A on KaleoLog (kaleoClassName, kaleoClassPK, kaleoInstanceTokenId, type_);\ncreate index IX_6C64B7D4 on KaleoLog (kaleoDefinitionId);\ncreate index IX_5BC6AB16 on KaleoLog (kaleoInstanceId);\ncreate index IX_470B9FF8 on KaleoLog (kaleoInstanceTokenId, type_);\ncreate index IX_B0CDCA38 on KaleoLog (kaleoTaskInstanceTokenId);\n\ncreate index IX_C4E9ACE0 on KaleoNode (companyId);\ncreate index IX_F28C443E on KaleoNode (companyId, kaleoDefinitionId);\ncreate index IX_32E94DD6 on KaleoNode (kaleoDefinitionId);\n\ncreate index IX_38829497 on KaleoNotification (companyId);\ncreate index IX_902D342F on KaleoNotification (kaleoClassName, kaleoClassPK);\ncreate index IX_F3362E93 on KaleoNotification (kaleoClassName, kaleoClassPK, executionType);\ncreate index IX_4B968E8D on KaleoNotification (kaleoDefinitionId);\n\ncreate index IX_2C8C4AF4 on KaleoNotificationRecipient (companyId);\ncreate index IX_AA6697EA on KaleoNotificationRecipient (kaleoDefinitionId);\ncreate index IX_7F4FED02 on KaleoNotificationRecipient (kaleoNotificationId);\n\ncreate index IX_E1F8B23D on KaleoTask (companyId);\ncreate index IX_3FFA633 on KaleoTask (kaleoDefinitionId);\ncreate index IX_77B3F1A2 on KaleoTask (kaleoNodeId);\n\ncreate index IX_611732B0 on KaleoTaskAssignment (companyId);\ncreate index IX_D835C576 on KaleoTaskAssignment (kaleoClassName, kaleoClassPK);\ncreate index IX_1087068E on KaleoTaskAssignment (kaleoClassName, kaleoClassPK, assigneeClassName);\ncreate index IX_575C03A6 on KaleoTaskAssignment (kaleoDefinitionId);\n\ncreate index IX_6E3CDA1B on KaleoTaskAssignmentInstance (companyId);\ncreate index IX_C851011 on KaleoTaskAssignmentInstance (kaleoDefinitionId);\ncreate index IX_67A9EE93 on KaleoTaskAssignmentInstance (kaleoInstanceId);\ncreate index IX_D4C2235B on KaleoTaskAssignmentInstance (kaleoTaskInstanceTokenId);\n\ncreate index IX_997FE723 on KaleoTaskInstanceToken (companyId);\ncreate index IX_608E9519 on KaleoTaskInstanceToken (kaleoDefinitionId);\ncreate index IX_2CE1159B on KaleoTaskInstanceToken (kaleoInstanceId);\ncreate index IX_B857A115 on KaleoTaskInstanceToken (kaleoInstanceId, kaleoTaskId);\n\ncreate index IX_4DE6A889 on KaleoTimer (kaleoClassName, kaleoClassPK);\ncreate index IX_1A479F32 on KaleoTimer (kaleoClassName, kaleoClassPK, blocking);\n\ncreate index IX_DB96C55B on KaleoTimerInstanceToken (kaleoInstanceId);\ncreate index IX_DB279423 on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed);\ncreate index IX_9932524C on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed, blocking);\ncreate index IX_13A5BA2C on KaleoTimerInstanceToken (kaleoInstanceTokenId, kaleoTimerId);\n\ncreate index IX_41D6C6D on KaleoTransition (companyId);\ncreate index IX_479F3063 on KaleoTransition (kaleoDefinitionId);\ncreate index IX_A392DFD2 on KaleoTransition (kaleoNodeId);\ncreate index IX_A38E2194 on KaleoTransition (kaleoNodeId, defaultTransition);\ncreate index IX_85268A11 on KaleoTransition (kaleoNodeId, name);]]></indexes-sql>\n</data>'),(10495,'Notification',1,1409250476826,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table Notifications_UserNotificationEvent (\n	notificationEventId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userNotificationEventId LONG,\n	timestamp LONG,\n	delivered BOOLEAN,\n	actionRequired BOOLEAN,\n	archived BOOLEAN\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_93C52776 on Notifications_UserNotificationEvent (userId, actionRequired);\ncreate index IX_36E5AE4C on Notifications_UserNotificationEvent (userId, actionRequired, archived);\ncreate index IX_73C065F0 on Notifications_UserNotificationEvent (userId, delivered, actionRequired);\ncreate unique index IX_DC9FCEDC on Notifications_UserNotificationEvent (userNotificationEventId);]]></indexes-sql>\n</data>'),(10501,'OpenSocial',4,1343264401607,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table OpenSocial_Gadget (\n	uuid_ VARCHAR(75) null,\n	gadgetId LONG not null primary key,\n	companyId LONG,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(75) null,\n	url STRING null,\n	portletCategoryNames STRING null\n);\n\ncreate table OpenSocial_OAuthConsumer (\n	oAuthConsumerId LONG not null primary key,\n	companyId LONG,\n	createDate DATE null,\n	modifiedDate DATE null,\n	gadgetKey VARCHAR(75) null,\n	serviceName VARCHAR(75) null,\n	consumerKey VARCHAR(75) null,\n	consumerSecret TEXT null,\n	keyType VARCHAR(75) null\n);\n\ncreate table OpenSocial_OAuthToken (\n	oAuthTokenId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	gadgetKey VARCHAR(75) null,\n	serviceName VARCHAR(75) null,\n	moduleId LONG,\n	accessToken VARCHAR(75) null,\n	tokenName VARCHAR(75) null,\n	tokenSecret VARCHAR(75) null,\n	sessionHandle VARCHAR(75) null,\n	expiration LONG\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_729869EE on OpenSocial_Gadget (companyId);\ncreate unique index IX_A6A89EB1 on OpenSocial_Gadget (companyId, url);\ncreate index IX_E1F8627A on OpenSocial_Gadget (uuid_);\ncreate index IX_3C79316E on OpenSocial_Gadget (uuid_, companyId);\n\ncreate index IX_47206618 on OpenSocial_OAuthConsumer (gadgetKey);\ncreate index IX_8E715BF8 on OpenSocial_OAuthConsumer (gadgetKey, serviceName);\n\ncreate index IX_6C8CCC3D on OpenSocial_OAuthToken (gadgetKey, serviceName);\ncreate index IX_CDD35402 on OpenSocial_OAuthToken (userId, gadgetKey, serviceName, moduleId, tokenName);]]></indexes-sql>\n</data>'),(10509,'Sync',1,1368486568278,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table SyncDLObject (\n	objectId LONG not null primary key,\n	companyId LONG,\n	createTime LONG,\n	modifiedTime LONG,\n	repositoryId LONG,\n	parentFolderId LONG,\n	name VARCHAR(255) null,\n	extension VARCHAR(75) null,\n	mimeType VARCHAR(75) null,\n	description STRING null,\n	changeLog VARCHAR(75) null,\n	extraSettings TEXT null,\n	version VARCHAR(75) null,\n	size_ LONG,\n	checksum VARCHAR(75) null,\n	event VARCHAR(75) null,\n	lockExpirationDate DATE null,\n	lockUserId LONG,\n	lockUserName VARCHAR(75) null,\n	type_ VARCHAR(75) null,\n	typePK LONG,\n	typeUuid VARCHAR(75) null\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_7F996123 on SyncDLObject (companyId, modifiedTime, repositoryId);\ncreate unique index IX_69ADEDD1 on SyncDLObject (typePK);]]></indexes-sql>\n</data>');

/*Table structure for table `shard` */

DROP TABLE IF EXISTS `shard`;

CREATE TABLE `shard` (
  `shardId` bigint(20) NOT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`shardId`),
  KEY `IX_DA5F4359` (`classNameId`,`classPK`),
  KEY `IX_941BA8C3` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shard` */

insert  into `shard`(`shardId`,`classNameId`,`classPK`,`name`) values (10156,10025,10155,'default');

/*Table structure for table `shoppingcart` */

DROP TABLE IF EXISTS `shoppingcart`;

CREATE TABLE `shoppingcart` (
  `cartId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `itemIds` longtext,
  `couponCodes` varchar(75) DEFAULT NULL,
  `altShipping` int(11) DEFAULT NULL,
  `insure` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  UNIQUE KEY `IX_FC46FE16` (`groupId`,`userId`),
  KEY `IX_C28B41DC` (`groupId`),
  KEY `IX_54101CC8` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shoppingcart` */

/*Table structure for table `shoppingcategory` */

DROP TABLE IF EXISTS `shoppingcategory`;

CREATE TABLE `shoppingcategory` (
  `categoryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentCategoryId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`categoryId`),
  KEY `IX_5F615D3E` (`groupId`),
  KEY `IX_1E6464F5` (`groupId`,`parentCategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shoppingcategory` */

/*Table structure for table `shoppingcoupon` */

DROP TABLE IF EXISTS `shoppingcoupon`;

CREATE TABLE `shoppingcoupon` (
  `couponId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `code_` varchar(75) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  `limitCategories` longtext,
  `limitSkus` longtext,
  `minOrder` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discountType` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`couponId`),
  UNIQUE KEY `IX_DC60CFAE` (`code_`),
  KEY `IX_3251AF16` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shoppingcoupon` */

/*Table structure for table `shoppingitem` */

DROP TABLE IF EXISTS `shoppingitem`;

CREATE TABLE `shoppingitem` (
  `itemId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `sku` varchar(75) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `properties` longtext,
  `fields_` tinyint(4) DEFAULT NULL,
  `fieldsQuantities` longtext,
  `minQuantity` int(11) DEFAULT NULL,
  `maxQuantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `taxable` tinyint(4) DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `useShippingFormula` tinyint(4) DEFAULT NULL,
  `requiresShipping` tinyint(4) DEFAULT NULL,
  `stockQuantity` int(11) DEFAULT NULL,
  `featured_` tinyint(4) DEFAULT NULL,
  `sale_` tinyint(4) DEFAULT NULL,
  `smallImage` tinyint(4) DEFAULT NULL,
  `smallImageId` bigint(20) DEFAULT NULL,
  `smallImageURL` longtext,
  `mediumImage` tinyint(4) DEFAULT NULL,
  `mediumImageId` bigint(20) DEFAULT NULL,
  `mediumImageURL` longtext,
  `largeImage` tinyint(4) DEFAULT NULL,
  `largeImageId` bigint(20) DEFAULT NULL,
  `largeImageURL` longtext,
  PRIMARY KEY (`itemId`),
  UNIQUE KEY `IX_1C717CA6` (`companyId`,`sku`),
  KEY `IX_FEFE7D76` (`groupId`,`categoryId`),
  KEY `IX_903DC750` (`largeImageId`),
  KEY `IX_D217AB30` (`mediumImageId`),
  KEY `IX_FF203304` (`smallImageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shoppingitem` */

/*Table structure for table `shoppingitemfield` */

DROP TABLE IF EXISTS `shoppingitemfield`;

CREATE TABLE `shoppingitemfield` (
  `itemFieldId` bigint(20) NOT NULL,
  `itemId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `values_` longtext,
  `description` longtext,
  PRIMARY KEY (`itemFieldId`),
  KEY `IX_6D5F9B87` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shoppingitemfield` */

/*Table structure for table `shoppingitemprice` */

DROP TABLE IF EXISTS `shoppingitemprice`;

CREATE TABLE `shoppingitemprice` (
  `itemPriceId` bigint(20) NOT NULL,
  `itemId` bigint(20) DEFAULT NULL,
  `minQuantity` int(11) DEFAULT NULL,
  `maxQuantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `taxable` tinyint(4) DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `useShippingFormula` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemPriceId`),
  KEY `IX_EA6FD516` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shoppingitemprice` */

/*Table structure for table `shoppingorder` */

DROP TABLE IF EXISTS `shoppingorder`;

CREATE TABLE `shoppingorder` (
  `orderId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `number_` varchar(75) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `shipping` double DEFAULT NULL,
  `altShipping` varchar(75) DEFAULT NULL,
  `requiresShipping` tinyint(4) DEFAULT NULL,
  `insure` tinyint(4) DEFAULT NULL,
  `insurance` double DEFAULT NULL,
  `couponCodes` varchar(75) DEFAULT NULL,
  `couponDiscount` double DEFAULT NULL,
  `billingFirstName` varchar(75) DEFAULT NULL,
  `billingLastName` varchar(75) DEFAULT NULL,
  `billingEmailAddress` varchar(75) DEFAULT NULL,
  `billingCompany` varchar(75) DEFAULT NULL,
  `billingStreet` varchar(75) DEFAULT NULL,
  `billingCity` varchar(75) DEFAULT NULL,
  `billingState` varchar(75) DEFAULT NULL,
  `billingZip` varchar(75) DEFAULT NULL,
  `billingCountry` varchar(75) DEFAULT NULL,
  `billingPhone` varchar(75) DEFAULT NULL,
  `shipToBilling` tinyint(4) DEFAULT NULL,
  `shippingFirstName` varchar(75) DEFAULT NULL,
  `shippingLastName` varchar(75) DEFAULT NULL,
  `shippingEmailAddress` varchar(75) DEFAULT NULL,
  `shippingCompany` varchar(75) DEFAULT NULL,
  `shippingStreet` varchar(75) DEFAULT NULL,
  `shippingCity` varchar(75) DEFAULT NULL,
  `shippingState` varchar(75) DEFAULT NULL,
  `shippingZip` varchar(75) DEFAULT NULL,
  `shippingCountry` varchar(75) DEFAULT NULL,
  `shippingPhone` varchar(75) DEFAULT NULL,
  `ccName` varchar(75) DEFAULT NULL,
  `ccType` varchar(75) DEFAULT NULL,
  `ccNumber` varchar(75) DEFAULT NULL,
  `ccExpMonth` int(11) DEFAULT NULL,
  `ccExpYear` int(11) DEFAULT NULL,
  `ccVerNumber` varchar(75) DEFAULT NULL,
  `comments` longtext,
  `ppTxnId` varchar(75) DEFAULT NULL,
  `ppPaymentStatus` varchar(75) DEFAULT NULL,
  `ppPaymentGross` double DEFAULT NULL,
  `ppReceiverEmail` varchar(75) DEFAULT NULL,
  `ppPayerEmail` varchar(75) DEFAULT NULL,
  `sendOrderEmail` tinyint(4) DEFAULT NULL,
  `sendShippingEmail` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `IX_D7D6E87A` (`number_`),
  KEY `IX_1D15553E` (`groupId`),
  KEY `IX_119B5630` (`groupId`,`userId`,`ppPaymentStatus`),
  KEY `IX_F474FD89` (`ppTxnId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shoppingorder` */

/*Table structure for table `shoppingorderitem` */

DROP TABLE IF EXISTS `shoppingorderitem`;

CREATE TABLE `shoppingorderitem` (
  `orderItemId` bigint(20) NOT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  `itemId` varchar(75) DEFAULT NULL,
  `sku` varchar(75) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` longtext,
  `properties` longtext,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `shippedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `IX_B5F82C7A` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shoppingorderitem` */

/*Table structure for table `socialactivity` */

DROP TABLE IF EXISTS `socialactivity`;

CREATE TABLE `socialactivity` (
  `activityId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `activitySetId` bigint(20) DEFAULT NULL,
  `mirrorActivityId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `parentClassNameId` bigint(20) DEFAULT NULL,
  `parentClassPK` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  `receiverUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`activityId`),
  UNIQUE KEY `IX_8F32DEC9` (`groupId`,`userId`,`createDate`,`classNameId`,`classPK`,`type_`,`receiverUserId`),
  KEY `IX_F542E9BC` (`activitySetId`),
  KEY `IX_82E39A0C` (`classNameId`),
  KEY `IX_A853C757` (`classNameId`,`classPK`),
  KEY `IX_D0E9029E` (`classNameId`,`classPK`,`type_`),
  KEY `IX_64B1BC66` (`companyId`),
  KEY `IX_2A2468` (`groupId`),
  KEY `IX_FB604DC7` (`groupId`,`userId`,`classNameId`,`classPK`,`type_`,`receiverUserId`),
  KEY `IX_1271F25F` (`mirrorActivityId`),
  KEY `IX_1F00C374` (`mirrorActivityId`,`classNameId`,`classPK`),
  KEY `IX_121CA3CB` (`receiverUserId`),
  KEY `IX_3504B8BC` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `socialactivity` */

insert  into `socialactivity`(`activityId`,`groupId`,`companyId`,`userId`,`createDate`,`activitySetId`,`mirrorActivityId`,`classNameId`,`classPK`,`parentClassNameId`,`parentClassPK`,`type_`,`extraData`,`receiverUserId`) values (102,10182,10155,10199,1458418889050,0,0,10011,11829,0,0,1,'{\"title\":\"WhiteHallDec.xlsx\"}',0);

/*Table structure for table `socialactivityachievement` */

DROP TABLE IF EXISTS `socialactivityachievement`;

CREATE TABLE `socialactivityachievement` (
  `activityAchievementId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `firstInGroup` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`activityAchievementId`),
  UNIQUE KEY `IX_D4390CAA` (`groupId`,`userId`,`name`),
  KEY `IX_E14B1F1` (`groupId`),
  KEY `IX_83E16F2F` (`groupId`,`firstInGroup`),
  KEY `IX_8F6408F0` (`groupId`,`name`),
  KEY `IX_C8FD892B` (`groupId`,`userId`),
  KEY `IX_AABC18E9` (`groupId`,`userId`,`firstInGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `socialactivityachievement` */

/*Table structure for table `socialactivitycounter` */

DROP TABLE IF EXISTS `socialactivitycounter`;

CREATE TABLE `socialactivitycounter` (
  `activityCounterId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `ownerType` int(11) DEFAULT NULL,
  `currentValue` int(11) DEFAULT NULL,
  `totalValue` int(11) DEFAULT NULL,
  `graceValue` int(11) DEFAULT NULL,
  `startPeriod` int(11) DEFAULT NULL,
  `endPeriod` int(11) DEFAULT NULL,
  `active_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`activityCounterId`),
  UNIQUE KEY `IX_1B7E3B67` (`groupId`,`classNameId`,`classPK`,`name`,`ownerType`,`endPeriod`),
  UNIQUE KEY `IX_374B35AE` (`groupId`,`classNameId`,`classPK`,`name`,`ownerType`,`startPeriod`),
  KEY `IX_A4B9A23B` (`classNameId`,`classPK`),
  KEY `IX_D6666704` (`groupId`),
  KEY `IX_926CDD04` (`groupId`,`classNameId`,`classPK`,`ownerType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `socialactivitycounter` */

/*Table structure for table `socialactivitylimit` */

DROP TABLE IF EXISTS `socialactivitylimit`;

CREATE TABLE `socialactivitylimit` (
  `activityLimitId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `activityType` int(11) DEFAULT NULL,
  `activityCounterName` varchar(75) DEFAULT NULL,
  `value` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`activityLimitId`),
  UNIQUE KEY `IX_F1C1A617` (`groupId`,`userId`,`classNameId`,`classPK`,`activityType`,`activityCounterName`),
  KEY `IX_B15863FA` (`classNameId`,`classPK`),
  KEY `IX_18D4BAE5` (`groupId`),
  KEY `IX_6F9EDE9F` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `socialactivitylimit` */

/*Table structure for table `socialactivityset` */

DROP TABLE IF EXISTS `socialactivityset`;

CREATE TABLE `socialactivityset` (
  `activitySetId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `modifiedDate` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  `activityCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`activitySetId`),
  KEY `IX_4460FA14` (`classNameId`,`classPK`,`type_`),
  KEY `IX_9E13F2DE` (`groupId`),
  KEY `IX_9BE30DDF` (`groupId`,`userId`,`classNameId`,`type_`),
  KEY `IX_F71071BD` (`groupId`,`userId`,`type_`),
  KEY `IX_F80C4386` (`userId`),
  KEY `IX_62AC101A` (`userId`,`classNameId`,`classPK`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `socialactivityset` */

/*Table structure for table `socialactivitysetting` */

DROP TABLE IF EXISTS `socialactivitysetting`;

CREATE TABLE `socialactivitysetting` (
  `activitySettingId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `activityType` int(11) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`activitySettingId`),
  KEY `IX_8BE5F230` (`groupId`),
  KEY `IX_384788CD` (`groupId`,`activityType`),
  KEY `IX_9D22151E` (`groupId`,`classNameId`),
  KEY `IX_1E9CF33B` (`groupId`,`classNameId`,`activityType`),
  KEY `IX_D984AABA` (`groupId`,`classNameId`,`activityType`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `socialactivitysetting` */

/*Table structure for table `socialrelation` */

DROP TABLE IF EXISTS `socialrelation`;

CREATE TABLE `socialrelation` (
  `uuid_` varchar(75) DEFAULT NULL,
  `relationId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `userId1` bigint(20) DEFAULT NULL,
  `userId2` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  PRIMARY KEY (`relationId`),
  UNIQUE KEY `IX_12A92145` (`userId1`,`userId2`,`type_`),
  KEY `IX_61171E99` (`companyId`),
  KEY `IX_95135D1C` (`companyId`,`type_`),
  KEY `IX_C31A64C6` (`type_`),
  KEY `IX_5A40CDCC` (`userId1`),
  KEY `IX_4B52BE89` (`userId1`,`type_`),
  KEY `IX_B5C9C690` (`userId1`,`userId2`),
  KEY `IX_5A40D18D` (`userId2`),
  KEY `IX_3F9C2FA8` (`userId2`,`type_`),
  KEY `IX_F0CA24A5` (`uuid_`),
  KEY `IX_5B30F663` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `socialrelation` */

/*Table structure for table `socialrequest` */

DROP TABLE IF EXISTS `socialrequest`;

CREATE TABLE `socialrequest` (
  `uuid_` varchar(75) DEFAULT NULL,
  `requestId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createDate` bigint(20) DEFAULT NULL,
  `modifiedDate` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  `receiverUserId` bigint(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`requestId`),
  UNIQUE KEY `IX_36A90CA7` (`userId`,`classNameId`,`classPK`,`type_`,`receiverUserId`),
  UNIQUE KEY `IX_4F973EFE` (`uuid_`,`groupId`),
  KEY `IX_D3425487` (`classNameId`,`classPK`,`type_`,`receiverUserId`,`status`),
  KEY `IX_A90FE5A0` (`companyId`),
  KEY `IX_32292ED1` (`receiverUserId`),
  KEY `IX_D9380CB7` (`receiverUserId`,`status`),
  KEY `IX_80F7A9C2` (`userId`),
  KEY `IX_CC86A444` (`userId`,`classNameId`,`classPK`,`type_`,`status`),
  KEY `IX_AB5906A8` (`userId`,`status`),
  KEY `IX_49D5872C` (`uuid_`),
  KEY `IX_8D42897C` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `socialrequest` */

/*Table structure for table `subscription` */

DROP TABLE IF EXISTS `subscription`;

CREATE TABLE `subscription` (
  `subscriptionId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `frequency` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`subscriptionId`),
  UNIQUE KEY `IX_2E1A92D4` (`companyId`,`userId`,`classNameId`,`classPK`),
  KEY `IX_786D171A` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_54243AFD` (`userId`),
  KEY `IX_E8F34171` (`userId`,`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subscription` */

/*Table structure for table `syncdlobject` */

DROP TABLE IF EXISTS `syncdlobject`;

CREATE TABLE `syncdlobject` (
  `objectId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createTime` bigint(20) DEFAULT NULL,
  `modifiedTime` bigint(20) DEFAULT NULL,
  `repositoryId` bigint(20) DEFAULT NULL,
  `parentFolderId` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `extension` varchar(75) DEFAULT NULL,
  `mimeType` varchar(75) DEFAULT NULL,
  `description` longtext,
  `changeLog` varchar(75) DEFAULT NULL,
  `extraSettings` longtext,
  `version` varchar(75) DEFAULT NULL,
  `size_` bigint(20) DEFAULT NULL,
  `checksum` varchar(75) DEFAULT NULL,
  `event` varchar(75) DEFAULT NULL,
  `lockExpirationDate` datetime DEFAULT NULL,
  `lockUserId` bigint(20) DEFAULT NULL,
  `lockUserName` varchar(75) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `typePK` bigint(20) DEFAULT NULL,
  `typeUuid` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`objectId`),
  UNIQUE KEY `IX_69ADEDD1` (`typePK`),
  KEY `IX_7F996123` (`companyId`,`modifiedTime`,`repositoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `syncdlobject` */

insert  into `syncdlobject`(`objectId`,`companyId`,`createTime`,`modifiedTime`,`repositoryId`,`parentFolderId`,`name`,`extension`,`mimeType`,`description`,`changeLog`,`extraSettings`,`version`,`size_`,`checksum`,`event`,`lockExpirationDate`,`lockUserId`,`lockUserName`,`type_`,`typePK`,`typeUuid`) values (10543,10155,1458069501297,1458069501297,10182,0,'welcome_tools','png','image/png','','','','1.0',528,'M0/IPjARFwXLT/FpD6vPuE+zotA=','add',NULL,0,'','file',10526,'83d7c5c3-2105-401e-ad48-fe23dc42e474'),(10544,10155,1458069501697,1458069501697,10182,0,'welcome_learn','png','image/png','','','','1.0',565,'VN9lePxKZwl+N76+bzYB4oeMgg4=','add',NULL,0,'','file',10535,'49654d32-5414-4a3c-8704-a071853a5106'),(10553,10155,1458069502160,1458069502160,10182,0,'welcome_cube','png','image/png','','','','1.0',452,'u7ezbZ5yW4ulWfonrR5PWzJicp4=','add',NULL,0,'','file',10545,'deb8b437-3868-46db-a037-ed1392b35a18'),(10565,10155,1458069502505,1458069502505,10182,0,'helpful_links_for_using_liferay_portal','pdf','application/pdf','','','','1.0',148065,'UMErxgdyPxLp8QXdkDJ75XNBbWA=','add',NULL,0,'','file',10554,'729f117f-5c83-4fbf-853f-a36459a3b20d'),(10575,10155,1458069502655,1458069502655,10182,0,'welcome_ee','png','image/png','','','','1.0',218,'bAZ1F0qHRb1PCB42YiADy/l4ABI=','add',NULL,0,'','file',10566,'808048bd-865f-4076-8681-1f88c6b8b520'),(10593,10155,1458069502879,1458069502879,10182,0,'welcome_community','png','image/png','','','','1.0',435,'MRLiI1X3aES3j3bNEXOaoJK6CbA=','add',NULL,0,'','file',10576,'8bf62a24-50c9-421b-b069-891f5d14df21'),(10899,10155,1458075048728,1458075303534,10182,0,'Invoices','','','Invoices','','','-1',0,'','update',NULL,0,'','folder',10713,'c2672da9-7afe-45a3-a442-1ec31cd56bdb'),(10900,10155,1458075048760,1458075303635,10182,0,'Insurance','','','Insurance','','','-1',0,'','update',NULL,0,'','folder',10717,'0d2c49d1-6c21-4f8f-bfef-d284949fdcc7'),(10901,10155,1458075048802,1458075303698,10182,10717,'10','','','Trade Insurance Folder','','','-1',0,'','update',NULL,0,'','folder',10721,'377dd1cc-4c75-4d30-8295-b987640ab475'),(10910,10155,1458075048836,1458075303724,10182,10717,'11','','','Trade Insurance Folder','','','-1',0,'','update',NULL,0,'','folder',10725,'cc8dbc70-da56-4c54-abd4-13ad1b7de62a'),(10911,10155,1458075048888,1458075303754,10182,10717,'12','','','Trade Insurance Folder','','','-1',0,'','update',NULL,0,'','folder',10729,'930f8558-2eb8-4b3d-867d-59a39753364a'),(10912,10155,1458075048927,1458075303787,10182,10717,'13','','','Trade Insurance Folder','','','-1',0,'','update',NULL,0,'','folder',10733,'4d377d4f-aac6-4698-88bb-e6fcb641ed77'),(10917,10155,1458075048969,1458075303816,10182,10717,'14','','','Trade Insurance Folder','','','-1',0,'','update',NULL,0,'','folder',10737,'e7088430-15e2-4c76-8cb4-e2384b8e145e'),(10918,10155,1458075049017,1458075303844,10182,10717,'15','','','Trade Insurance Folder','','','-1',0,'','update',NULL,0,'','folder',10741,'7e2440c2-ef73-45cc-ae3d-3465313ab952'),(10923,10155,1458075049056,1458075303873,10182,10713,'0','','','Invoices Document Folder','','','-1',0,'','update',NULL,0,'','folder',10745,'fe61fea1-a8de-44e6-bbdb-0dc460b92a2a'),(10924,10155,1458075049091,1458075303903,10182,10713,'1','','','Invoices Document Folder','','','-1',0,'','update',NULL,0,'','folder',10749,'31aa124f-713c-4439-aab2-a765a20fe8b6'),(10925,10155,1458075049128,1458075303933,10182,10713,'2','','','Invoices Document Folder','','','-1',0,'','update',NULL,0,'','folder',10753,'e40620ff-83a9-4fd2-9c42-760bbb35b015'),(10930,10155,1458075049165,1458075303963,10182,10713,'3','','','Invoices Document Folder','','','-1',0,'','update',NULL,0,'','folder',10757,'832642d5-9261-4104-b28e-92ea383fc7a3'),(10931,10155,1458075049199,1458075303993,10182,10713,'4','','','Invoices Document Folder','','','-1',0,'','update',NULL,0,'','folder',10761,'9036ac98-7ebb-453f-b718-8b77e23b5167'),(10932,10155,1458075049318,1458075049318,10182,10721,'faq_page (1).txt','txt','text/plain','faq_page (1).txt','','','1.0',85,'955R4Lwz+06Xquv+649ztGPCeUE=','add',NULL,0,'','file',10765,'f0f9261c-f936-4d55-8bd7-c439181af63b'),(10933,10155,1458075049434,1458075049434,10182,10725,'faq_page.txt','txt','text/plain','faq_page.txt','','','1.0',85,'955R4Lwz+06Xquv+649ztGPCeUE=','add',NULL,0,'','file',10774,'2f1c5ccf-9a97-4064-9582-95f72f57800b'),(10934,10155,1458075049547,1458075049547,10182,10729,'Covering Letter.pdf','pdf','application/pdf','Covering Letter.pdf','','','1.0',57939,'ug39LpzvnrHqiFUdbnmyby/yyUk=','add',NULL,0,'','file',10783,'59eba706-a80e-4067-a8b9-37a83f24aa3a'),(10935,10155,1458075049819,1458075049819,10182,10733,'Covering Letter.pdf','pdf','application/pdf','Covering Letter.pdf','','','1.0',57939,'ug39LpzvnrHqiFUdbnmyby/yyUk=','add',NULL,0,'','file',10792,'8f61a626-4e3b-4e06-ae6e-b16475d819c9'),(10936,10155,1458075050188,1458075050188,10182,10737,'Covering Letter.pdf','pdf','application/pdf','Covering Letter.pdf','','','1.0',57939,'ug39LpzvnrHqiFUdbnmyby/yyUk=','add',NULL,0,'','file',10801,'7c49521f-b4af-4ee4-a8c7-0f715212f9c0'),(10937,10155,1458075050419,1458075050419,10182,10741,'Covering Letter.pdf','pdf','application/pdf','Covering Letter.pdf','','','1.0',57939,'ug39LpzvnrHqiFUdbnmyby/yyUk=','add',NULL,0,'','file',10810,'4f099e3d-4255-4f58-83e4-a8daa0c33afc'),(10938,10155,1458075050639,1458075050639,10182,10745,'WhiteHallOct.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','','','1.0',8609,'092de/9/fXVYIibOHe4D0sESUrc=','add',NULL,0,'','file',10819,'4976b1d8-0731-4404-9ce1-5ec520a71252'),(10939,10155,1458075053145,1458075053145,10182,10749,'WhiteHallOct.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','','','1.0',8609,'092de/9/fXVYIibOHe4D0sESUrc=','add',NULL,0,'','file',10828,'1aa05a74-a0f8-4801-b3c1-967d3cb7c99d'),(10940,10155,1458075053408,1458075053408,10182,10753,'WhiteHallOct.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','','','1.0',8609,'092de/9/fXVYIibOHe4D0sESUrc=','add',NULL,0,'','file',10837,'372ebab2-d19d-4ecd-890b-524d47e80668'),(10941,10155,1458075053660,1458075053660,10182,10757,'WhiteHallDec.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','','','1.0',8670,'lW9v+wDebVWCaEK1ItSHjMUgB74=','add',NULL,0,'','file',10846,'026b9efb-b044-456c-b3b9-129746e700d6'),(10942,10155,1458075053995,1458075053995,10182,10761,'WhiteHallDec.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','','','1.0',8670,'lW9v+wDebVWCaEK1ItSHjMUgB74=','add',NULL,0,'','file',10855,'0d4ec121-4f11-4cba-94cb-7dfaf9e1a4f9'),(11828,10155,1458418888648,1458418888648,10182,10713,'5','','','Invoices Document Folder','','','-1',0,'','add',NULL,0,'','folder',11825,'dd4f97d9-e656-41e5-9acb-4787a6307801'),(11838,10155,1458418889489,1458418889489,10182,11825,'WhiteHallDec.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','upload','','1.0',8669,'4CZIRZhf3qB5Qc+4ldIHN4XvYIw=','add',NULL,0,'','file',11829,'1ec7e94c-d063-4e35-9c77-8c79709936f1');

/*Table structure for table `systemevent` */

DROP TABLE IF EXISTS `systemevent`;

CREATE TABLE `systemevent` (
  `systemEventId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `classUuid` varchar(75) DEFAULT NULL,
  `referrerClassNameId` bigint(20) DEFAULT NULL,
  `parentSystemEventId` bigint(20) DEFAULT NULL,
  `systemEventSetKey` bigint(20) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraData` longtext,
  PRIMARY KEY (`systemEventId`),
  KEY `IX_72D73D39` (`groupId`),
  KEY `IX_7A2F0ECE` (`groupId`,`classNameId`,`classPK`),
  KEY `IX_FFCBB747` (`groupId`,`classNameId`,`classPK`,`type_`),
  KEY `IX_A19C89FF` (`groupId`,`systemEventSetKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `systemevent` */

insert  into `systemevent`(`systemEventId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`classNameId`,`classPK`,`classUuid`,`referrerClassNameId`,`parentSystemEventId`,`systemEventSetKey`,`type_`,`extraData`) values (10513,10182,10155,0,'','2016-03-15 19:18:20',10102,10413,'b7c28b05-1bdb-4ed2-848d-fe78a684987b',10098,0,10514,1,''),(10515,10182,10155,0,'','2016-03-15 19:18:20',10102,10414,'2e26f666-c8db-4ffe-9164-b4d63d1e53b5',10098,0,10516,1,''),(10517,10182,10155,0,'','2016-03-15 19:18:20',10102,10415,'a0493869-6e8f-4667-bfcd-b3174aab1c65',10098,0,10518,1,''),(10519,10182,10155,0,'','2016-03-15 19:18:20',10102,10416,'62f17a8c-4248-4fb6-9aae-d277d3173590',10098,0,10520,1,''),(10521,10182,10155,0,'','2016-03-15 19:18:20',10102,10417,'0db15d78-cfda-4679-90c4-b245458e6c61',10098,0,10522,1,''),(10523,10182,10155,0,'','2016-03-15 19:18:20',10102,10418,'85a17960-02d6-4261-909f-40810144e71b',10098,0,10524,1,''),(10944,10182,10155,10199,'Test Test','2016-03-15 20:51:23',10002,10620,'12b61bfe-d2f3-4015-b78e-871862a269f1',0,0,10945,1,'{\"privateLayout\":\"false\"}'),(12083,10182,10155,10199,'Whitehall Admin','2016-03-21 21:08:24',10109,11631,'1715a17d-f9d8-42ec-bf20-ccfe6f23162f',0,0,12084,1,''),(12087,10182,10155,10199,'Whitehall Admin','2016-03-21 21:08:30',10109,11617,'cc25373e-b7a0-4c29-9408-8419d3b2678c',0,0,12088,1,''),(12091,10182,10155,10199,'Whitehall Admin','2016-03-21 21:08:35',10109,10598,'7ba78974-e76e-4939-aa2d-15cba52793b2',0,0,12092,1,''),(12095,10182,10155,10199,'Whitehall Admin','2016-03-21 21:08:45',10109,11026,'473eb1fa-bb34-454a-b3cc-b42dd1ff75c2',0,0,12096,1,''),(12099,10182,10155,10199,'Whitehall Admin','2016-03-21 21:10:42',10109,11048,'b5821552-5b8d-4f1a-ad8b-9f6f1c392e56',0,0,12100,1,''),(12103,10182,10155,10199,'Whitehall Admin','2016-03-21 21:10:47',10109,11078,'70acdc4b-e084-4ebf-a93c-c2b6f18a00e6',0,0,12104,1,''),(12107,10182,10155,10199,'Whitehall Admin','2016-03-21 21:11:06',10109,11058,'a76fccaf-036b-491b-91a2-775b5f4e71d3',0,0,12108,1,''),(12111,10182,10155,10199,'Whitehall Admin','2016-03-21 21:11:16',10109,11068,'f93a4568-589f-4bb9-b557-27583426d848',0,0,12112,1,''),(12115,10182,10155,10199,'Whitehall Admin','2016-03-21 21:11:44',10109,11088,'be8496fd-4d8e-46d8-8911-4bb40ca44192',0,0,12116,1,''),(12119,10182,10155,10199,'Whitehall Admin','2016-03-21 21:12:04',10109,11098,'6d31a55d-ef9e-4f0f-b53b-8b70614d8763',0,0,12120,1,''),(12123,10182,10155,10199,'Whitehall Admin','2016-03-21 21:12:09',10109,11108,'72cfe874-bf47-4dfc-9748-16af44c5a6ff',0,0,12124,1,''),(12127,10182,10155,10199,'Whitehall Admin','2016-03-21 21:12:25',10109,11655,'267bb055-cb16-4107-98e0-ac8551b76e20',0,0,12128,1,''),(12131,10182,10155,10199,'Whitehall Admin','2016-03-21 21:12:30',10109,11118,'49a1b38e-6fc7-4208-a4c1-7f2553bad155',0,0,12132,1,''),(12135,10182,10155,10199,'Whitehall Admin','2016-03-21 21:12:37',10109,11128,'2894db4b-8219-4e66-b89c-7a97369235e0',0,0,12136,1,''),(12139,10182,10155,10199,'Whitehall Admin','2016-03-21 21:12:44',10109,11138,'8ffbb27b-7b17-4269-a7b1-7f7135fafc17',0,0,12140,1,''),(12143,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:02',10109,11645,'063eae7f-5ff8-465b-a87b-93101cb1c26e',0,0,12144,1,''),(12147,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:06',10109,11665,'29b095dc-091f-4144-b0eb-50f2e368b4e3',0,0,12148,1,''),(12151,10182,10155,10199,'Whitehall Admin','2016-03-21 21:13:10',10109,11675,'908973fe-3beb-4949-979c-eee17184a082',0,0,12152,1,'');

/*Table structure for table `team` */

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `teamId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`teamId`),
  UNIQUE KEY `IX_143DC786` (`groupId`,`name`),
  KEY `IX_AE6E9907` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `team` */

/*Table structure for table `tf_address` */

DROP TABLE IF EXISTS `tf_address`;

CREATE TABLE `tf_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idcompany` bigint(20) NOT NULL,
  `address_line_1` varchar(150) DEFAULT NULL,
  `address_line_2` varchar(150) DEFAULT NULL,
  `locality` varchar(25) DEFAULT NULL,
  `region` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcompany` (`idcompany`),
  CONSTRAINT `tf_address_ibfk_1` FOREIGN KEY (`idcompany`) REFERENCES `tf_company` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tf_address` */

insert  into `tf_address`(`id`,`idcompany`,`address_line_1`,`address_line_2`,`locality`,`region`,`country`,`postal_code`) values (1,1,'123','3','313','London','United Kingdom','132334'),(2,2,'17/20 Commercial Road','Swindon','Wiltshire','London','United Kingdom','SN1 5NR'),(3,3,'Www.Buy-This-Company-Name.Com','Suite B, 29 Harley Street','London','London','United Kingdom','W1G 9QR'),(4,4,'Lovat Bank','Silver Street','Newport Pagnell','Buckinghamshire','United Kingdom','MK16 0EJ'),(5,5,'9 Pantygraigwen Road','','Pontypridd','Mid Glamorgan','United Kingdom','CF37 2RR'),(6,6,'1 Rosemont Road','','London','London','United Kingdom','NW3 6NG'),(7,7,'39 George Raymond Road','','Eastleigh','London','United Kingdom','SO50 5SZ'),(8,8,'6th Floor Grey Friars House','30 Grey Friars Road','Reading','Berkshire','United Kingdom','RG1 1PE'),(9,9,'19 Worple Road','','London','London','United Kingdom','SW19 4JS');

/*Table structure for table `tf_allotments` */

DROP TABLE IF EXISTS `tf_allotments`;

CREATE TABLE `tf_allotments` (
  `allotment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_id` bigint(20) DEFAULT NULL,
  `investor_id` bigint(20) DEFAULT NULL,
  `investor_portfolio_id` bigint(20) DEFAULT NULL,
  `allotment_amount` decimal(10,2) DEFAULT NULL,
  `noofdays` int(11) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '1',
  `user_id` bigint(20) DEFAULT NULL,
  `market_discount` int(11) DEFAULT NULL,
  `investor_gross_profit` decimal(10,2) DEFAULT NULL,
  `whitehall_profit_share` decimal(10,2) DEFAULT NULL,
  `investor_net_profit` decimal(10,2) DEFAULT NULL,
  `allotment_date` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`allotment_id`),
  UNIQUE KEY `allotment_id_UNIQUE` (`allotment_id`),
  KEY `fk_allotment_trade_id` (`trade_id`),
  KEY `fk_allotment_investor_portfolio_id` (`investor_portfolio_id`),
  KEY `fk_allotment_user_id` (`user_id`),
  KEY `fk_investor_id` (`investor_id`),
  CONSTRAINT `fk_investor_id` FOREIGN KEY (`investor_id`) REFERENCES `tf_investor` (`investor_id`),
  CONSTRAINT `tf_allotments_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`),
  CONSTRAINT `tf_allotments_ibfk_2` FOREIGN KEY (`investor_portfolio_id`) REFERENCES `tf_investor_portfolio` (`investor_portfolio_id`),
  CONSTRAINT `tf_allotments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tf_user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;

/*Data for the table `tf_allotments` */

insert  into `tf_allotments`(`allotment_id`,`trade_id`,`investor_id`,`investor_portfolio_id`,`allotment_amount`,`noofdays`,`is_primary`,`user_id`,`market_discount`,`investor_gross_profit`,`whitehall_profit_share`,`investor_net_profit`,`allotment_date`,`status`) values (67,21,3,5,'15000.00',67,0,NULL,400,'110.14','5.51','104.63','2016-03-24 14:14:18','Settled'),(68,21,1,1,'15000.00',67,0,NULL,400,'110.14','11.01','99.12','2016-03-24 14:14:18','Settled'),(69,21,2,3,'15000.00',67,0,NULL,400,'110.14','11.01','99.12','2016-03-24 14:14:18','Settled'),(70,21,4,7,'15000.00',67,0,NULL,400,'110.14','5.51','104.63','2016-03-24 14:14:18','Settled'),(71,22,3,5,'7500.00',35,0,NULL,400,'28.77','1.44','27.33','2016-03-24 15:46:03','Settled'),(72,22,1,1,'7500.00',35,0,NULL,400,'28.77','2.88','25.89','2016-03-24 15:46:03','Settled'),(73,22,2,3,'7500.00',35,0,NULL,400,'28.77','2.88','25.89','2016-03-24 15:46:03','Settled'),(74,22,4,7,'7500.00',35,0,NULL,400,'28.77','1.44','27.33','2016-03-24 15:46:03','Settled'),(75,23,1,2,'30000.00',54,0,NULL,400,'177.53','17.75','159.78','2016-03-24 17:54:04','Alloted'),(76,24,3,5,'7500.00',60,0,NULL,400,'49.32','2.47','46.85','2016-03-24 18:13:41','Alloted'),(77,24,1,1,'7500.00',60,0,NULL,400,'49.32','4.93','44.38','2016-03-24 18:13:41','Alloted'),(78,24,2,3,'7500.00',60,0,NULL,400,'49.32','4.93','44.38','2016-03-24 18:13:41','Alloted'),(79,24,4,7,'7500.00',60,0,NULL,400,'49.32','2.47','46.85','2016-03-24 18:13:41','Alloted');

/*Table structure for table `tf_bank_holiday` */

DROP TABLE IF EXISTS `tf_bank_holiday`;

CREATE TABLE `tf_bank_holiday` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `day` varchar(100) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_bank_holiday` */

/*Table structure for table `tf_company` */

DROP TABLE IF EXISTS `tf_company`;

CREATE TABLE `tf_company` (
  `idcompany` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `altname` varchar(100) DEFAULT NULL,
  `regnumber` varchar(100) DEFAULT NULL,
  `addtrading` varchar(100) DEFAULT NULL,
  `addregistered` varchar(100) DEFAULT NULL,
  `dateestablished` date DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `telnumber` varchar(45) DEFAULT NULL,
  `directors` varchar(200) DEFAULT NULL,
  `shareholders` varchar(200) DEFAULT NULL,
  `customers` varchar(200) DEFAULT NULL,
  `accounts` varchar(45) DEFAULT NULL,
  `jurisdiction` varchar(45) DEFAULT NULL,
  `bustype` varchar(100) DEFAULT NULL,
  `active_status` varchar(50) DEFAULT NULL,
  `company_reference` varchar(50) DEFAULT NULL,
  `OrganisationType` varchar(100) DEFAULT NULL,
  `industryclassification` varchar(150) DEFAULT NULL,
  `sic_code` bigint(20) DEFAULT NULL,
  `company_type` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idcompany`),
  UNIQUE KEY `name_UNIQUE` (`NAME`),
  UNIQUE KEY `regnumber_UNIQUE` (`regnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tf_company` */

insert  into `tf_company`(`idcompany`,`NAME`,`altname`,`regnumber`,`addtrading`,`addregistered`,`dateestablished`,`website`,`telnumber`,`directors`,`shareholders`,`customers`,`accounts`,`jurisdiction`,`bustype`,`active_status`,`company_reference`,`OrganisationType`,`industryclassification`,`sic_code`,`company_type`) values (1,'Tropicana','','04619040',NULL,NULL,'2016-03-09','','523-525-2552','','','',NULL,'','','New','','Company',NULL,NULL,'4'),(2,'MORRISONS LIMITED','','02280567',NULL,NULL,'1988-07-26','','353-252-5525','','','',NULL,'england-wales','','New','','Company',NULL,NULL,'5'),(3,'LLOYDS LTD','','05187659',NULL,NULL,'2004-07-23','','134-134-1341','','','',NULL,'england-wales','','New','','ltd',NULL,NULL,'1'),(4,'CITI LIMITED','','02775249',NULL,NULL,'1993-01-04','','355-322-3525','','','',NULL,'england-wales','','New','','ltd',NULL,NULL,'1'),(5,'LOREAL PARIS A.S LIMITED','','09071230',NULL,NULL,'2014-06-04','','795-795-8058','','','',NULL,'england-wales','','New','','ltd',NULL,NULL,'4'),(6,'BARCLAY LIMITED','','02763982',NULL,NULL,'1992-11-11','','679-689-6896','','','',NULL,'england-wales','','New','','ltd',NULL,NULL,'1'),(7,'TECHNOLOGY-TREND LIMITED','','08179804',NULL,NULL,'2012-08-14','','226-363-6363','','','',NULL,'england-wales','','New','','ltd',NULL,NULL,'1'),(8,'FULCRUM WORLDWIDE (UK) LTD.','','04184442',NULL,NULL,'2001-03-21','','134-141-4141','','','',NULL,'england-wales','','New','','ltd',NULL,NULL,'4'),(9,'LIDL LIMITED','','02816429',NULL,NULL,'1993-05-10','','114-141-3413','','','',NULL,'england-wales','','New','','ltd',NULL,NULL,'5');

/*Table structure for table `tf_company_type` */

DROP TABLE IF EXISTS `tf_company_type`;

CREATE TABLE `tf_company_type` (
  `id` bigint(20) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_company_type` */

insert  into `tf_company_type`(`id`,`NAME`) values (1,'Primary Investor'),(2,'Secondary Investor'),(3,'Admin'),(4,'Seller'),(5,'SCF Company');

/*Table structure for table `tf_general_setting` */

DROP TABLE IF EXISTS `tf_general_setting`;

CREATE TABLE `tf_general_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `whitehall_share` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `seller_transaction_fee` decimal(10,2) DEFAULT NULL,
  `seller_finance_fee` decimal(10,4) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tf_general_setting` */

insert  into `tf_general_setting`(`id`,`whitehall_share`,`vat`,`seller_transaction_fee`,`seller_finance_fee`,`create_date`,`update_date`) values (1,'10.00','10.00','25.00','2.0000',NULL,NULL);

/*Table structure for table `tf_investor` */

DROP TABLE IF EXISTS `tf_investor`;

CREATE TABLE `tf_investor` (
  `investor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `whitehall_share` decimal(10,0) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `cash_position` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`investor_id`),
  UNIQUE KEY `investor_id_UNIQUE` (`investor_id`),
  KEY `fk_investor_company_idx` (`company_id`),
  CONSTRAINT `fk_investor_company` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `tf_investor` */

insert  into `tf_investor`(`investor_id`,`company_id`,`create_date`,`whitehall_share`,`update_date`,`cash_position`) values (1,3,'2016-03-16','10','2016-03-24','500125.01'),(2,4,'2016-03-16','10','2016-03-24','450125.01'),(3,6,'2016-03-16','5','2016-03-24','500131.96'),(4,7,'2016-03-16','5','2016-03-24','700131.96'),(5,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `tf_investor_portfolio` */

DROP TABLE IF EXISTS `tf_investor_portfolio`;

CREATE TABLE `tf_investor_portfolio` (
  `investor_portfolio_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `investor_id` bigint(20) NOT NULL,
  `investment_discount_rate` int(11) DEFAULT NULL,
  `investor_status` tinyint(1) DEFAULT '0',
  `investor_type` varchar(45) DEFAULT NULL,
  `max_dicsount_rate` int(11) DEFAULT NULL,
  `min_discount_rate` int(11) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `available_to_invest` decimal(10,0) DEFAULT NULL,
  `amount_invested` decimal(10,0) DEFAULT NULL,
  `my_credit_line` decimal(10,0) DEFAULT NULL,
  `current_credit_line` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`investor_portfolio_id`),
  UNIQUE KEY `investor_portfolio_id_UNIQUE` (`investor_portfolio_id`),
  KEY `fk_tf_investor_portfolio_investor_id` (`investor_id`),
  KEY `fk_investor_portfolio_company_idx` (`company_id`),
  CONSTRAINT `fk_investor_portfolio_company` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_investor_portfolio_investor_id` FOREIGN KEY (`investor_id`) REFERENCES `tf_investor` (`investor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tf_investor_portfolio` */

insert  into `tf_investor_portfolio`(`investor_portfolio_id`,`investor_id`,`investment_discount_rate`,`investor_status`,`investor_type`,`max_dicsount_rate`,`min_discount_rate`,`company_id`,`start_date`,`end_date`,`updated_by`,`available_to_invest`,`amount_invested`,`my_credit_line`,`current_credit_line`) values (1,1,400,0,NULL,600,400,2,'2016-03-20 16:03:19',NULL,'prinvestor1','470000','30000','500000',NULL),(2,1,400,0,NULL,600,400,9,'2016-03-20 16:03:19',NULL,'prinvestor1','470000','30000','500000',NULL),(3,2,400,0,NULL,600,400,2,'2016-03-20 16:04:21',NULL,'prinvestor2','470000','30000','500000',NULL),(4,2,420,0,NULL,600,400,9,'2016-03-20 16:04:21',NULL,'prinvestor2','500000',NULL,'500000',NULL),(5,3,400,0,NULL,600,400,2,'2016-03-20 16:05:06',NULL,'prinvestor3','220000','30000','250000',NULL),(6,3,420,0,NULL,600,400,9,'2016-03-20 16:05:06',NULL,'prinvestor3','300000',NULL,'300000',NULL),(7,4,400,0,NULL,600,400,2,'2016-03-20 16:05:44',NULL,'prinvestor4','470000','30000','500000',NULL),(8,4,430,0,NULL,600,400,9,'2016-03-20 16:05:44',NULL,'prinvestor4','300000',NULL,'300000',NULL);

/*Table structure for table `tf_investor_portfolio_history` */

DROP TABLE IF EXISTS `tf_investor_portfolio_history`;

CREATE TABLE `tf_investor_portfolio_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `investor_portfolio_id` bigint(20) NOT NULL,
  `investment_discount_rate` int(11) DEFAULT NULL,
  `current_credit_line` decimal(10,0) DEFAULT NULL,
  `my_credit_line` decimal(10,0) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_investor_portfolio_id` (`investor_portfolio_id`),
  CONSTRAINT `fk_investor_portfolio` FOREIGN KEY (`investor_portfolio_id`) REFERENCES `tf_investor_portfolio` (`investor_portfolio_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_investor_portfolio_history` */

/*Table structure for table `tf_investor_portfolio_setting` */

DROP TABLE IF EXISTS `tf_investor_portfolio_setting`;

CREATE TABLE `tf_investor_portfolio_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `max_dicsount_rate` int(11) DEFAULT NULL,
  `min_discount_rate` int(11) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_investor_portfolio_setting` */

/*Table structure for table `tf_investor_transaction` */

DROP TABLE IF EXISTS `tf_investor_transaction`;

CREATE TABLE `tf_investor_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `investor_id` bigint(20) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `transcation_type` varchar(100) DEFAULT NULL,
  `transcation_date` datetime DEFAULT NULL,
  `trade_id` bigint(20) DEFAULT NULL,
  `reference` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_tf_investor_transaction_investor_id` (`investor_id`),
  KEY `fk_investor_transaction_trade_id` (`trade_id`),
  CONSTRAINT `fk_investor_transaction_investor_id` FOREIGN KEY (`investor_id`) REFERENCES `tf_investor` (`investor_id`),
  CONSTRAINT `tf_investor_transaction_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=latin1;

/*Data for the table `tf_investor_transaction` */

insert  into `tf_investor_transaction`(`id`,`investor_id`,`amount`,`transcation_type`,`transcation_date`,`trade_id`,`reference`) values (251,3,'15000.00','Alloted','2016-03-24 14:14:18',21,'Trade Allotment'),(252,1,'15000.00','Alloted','2016-03-24 14:14:18',21,'Trade Allotment'),(253,2,'15000.00','Alloted','2016-03-24 14:14:18',21,'Trade Allotment'),(254,4,'15000.00','Alloted','2016-03-24 14:14:18',21,'Trade Allotment'),(255,3,'15000.00','Invested','2016-03-24 14:14:32',21,'Invested'),(256,1,'15000.00','Invested','2016-03-24 14:14:32',21,'Invested'),(257,2,'15000.00','Invested','2016-03-24 14:14:32',21,'Invested'),(258,4,'15000.00','Invested','2016-03-24 14:14:32',21,'Invested'),(259,3,'15000.00','Repaid','2016-03-24 14:14:42',21,'Repaid'),(260,3,'110.14','Profit','2016-03-24 14:14:42',21,'Profit'),(261,3,'5.51','Whitehall Fee','2016-03-24 14:14:42',21,'Whitehall Fee'),(262,1,'15000.00','Repaid','2016-03-24 14:14:42',21,'Repaid'),(263,1,'110.14','Profit','2016-03-24 14:14:42',21,'Profit'),(264,1,'11.01','Whitehall Fee','2016-03-24 14:14:42',21,'Whitehall Fee'),(265,2,'15000.00','Repaid','2016-03-24 14:14:42',21,'Repaid'),(266,2,'110.14','Profit','2016-03-24 14:14:42',21,'Profit'),(267,2,'11.01','Whitehall Fee','2016-03-24 14:14:42',21,'Whitehall Fee'),(268,4,'15000.00','Repaid','2016-03-24 14:14:42',21,'Repaid'),(269,4,'110.14','Profit','2016-03-24 14:14:42',21,'Profit'),(270,4,'5.51','Whitehall Fee','2016-03-24 14:14:42',21,'Whitehall Fee'),(271,3,'7500.00','Alloted','2016-03-24 15:46:03',22,'Trade Allotment'),(272,1,'7500.00','Alloted','2016-03-24 15:46:03',22,'Trade Allotment'),(273,2,'7500.00','Alloted','2016-03-24 15:46:03',22,'Trade Allotment'),(274,4,'7500.00','Alloted','2016-03-24 15:46:03',22,'Trade Allotment'),(275,3,'7500.00','Invested','2016-03-24 15:46:17',22,'Invested'),(276,1,'7500.00','Invested','2016-03-24 15:46:17',22,'Invested'),(277,2,'7500.00','Invested','2016-03-24 15:46:17',22,'Invested'),(278,4,'7500.00','Invested','2016-03-24 15:46:17',22,'Invested'),(279,3,'7500.00','Repaid','2016-03-24 15:46:30',22,'Repaid'),(280,3,'28.77','Profit','2016-03-24 15:46:30',22,'Profit'),(281,3,'1.44','Whitehall Fee','2016-03-24 15:46:30',22,'Whitehall Fee'),(282,1,'7500.00','Repaid','2016-03-24 15:46:30',22,'Repaid'),(283,1,'28.77','Profit','2016-03-24 15:46:30',22,'Profit'),(284,1,'2.88','Whitehall Fee','2016-03-24 15:46:30',22,'Whitehall Fee'),(285,2,'7500.00','Repaid','2016-03-24 15:46:30',22,'Repaid'),(286,2,'28.77','Profit','2016-03-24 15:46:30',22,'Profit'),(287,2,'2.88','Whitehall Fee','2016-03-24 15:46:30',22,'Whitehall Fee'),(288,4,'7500.00','Repaid','2016-03-24 15:46:30',22,'Repaid'),(289,4,'28.77','Profit','2016-03-24 15:46:30',22,'Profit'),(290,4,'1.44','Whitehall Fee','2016-03-24 15:46:30',22,'Whitehall Fee'),(291,1,'30000.00','Alloted','2016-03-24 17:54:04',23,'Trade Allotment'),(292,3,'7500.00','Alloted','2016-03-24 18:13:41',24,'Trade Allotment'),(293,1,'7500.00','Alloted','2016-03-24 18:13:41',24,'Trade Allotment'),(294,2,'7500.00','Alloted','2016-03-24 18:13:41',24,'Trade Allotment'),(295,4,'7500.00','Alloted','2016-03-24 18:13:41',24,'Trade Allotment');

/*Table structure for table `tf_invoice_company` */

DROP TABLE IF EXISTS `tf_invoice_company`;

CREATE TABLE `tf_invoice_company` (
  `id` bigint(20) NOT NULL,
  `company_name` varchar(40) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_invoice_company` */

insert  into `tf_invoice_company`(`id`,`company_name`,`description`) values (1,'Tesco','Tesco'),(2,'Sainsburys','Sainsburys'),(3,'ASDA','ASDA'),(4,'Co-OP','Co-OP'),(5,'Morrisons','Morrisons');

/*Table structure for table `tf_officer` */

DROP TABLE IF EXISTS `tf_officer`;

CREATE TABLE `tf_officer` (
  `officer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `officer_role` varchar(70) DEFAULT NULL,
  `appointed_on` date DEFAULT NULL,
  `resigned_on` date DEFAULT NULL,
  `country_of_residence` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  `iduser` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`officer_id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `tf_officer_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_officer` */

/*Table structure for table `tf_officer_address` */

DROP TABLE IF EXISTS `tf_officer_address`;

CREATE TABLE `tf_officer_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `officer_id` bigint(20) NOT NULL,
  `address_line_1` varchar(150) DEFAULT NULL,
  `address_line_2` varchar(150) DEFAULT NULL,
  `locality` varchar(25) DEFAULT NULL,
  `region` varchar(25) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `officer_id` (`officer_id`),
  CONSTRAINT `tf_officer_address_ibfk_1` FOREIGN KEY (`officer_id`) REFERENCES `tf_officer` (`officer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_officer_address` */

/*Table structure for table `tf_po_documents` */

DROP TABLE IF EXISTS `tf_po_documents`;

CREATE TABLE `tf_po_documents` (
  `purchase_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) NOT NULL,
  `document_type` varchar(30) DEFAULT NULL,
  `document_name` varchar(100) DEFAULT NULL,
  `document_url` varchar(300) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`purchase_order_id`),
  UNIQUE KEY `document_id_UNIQUE` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_po_documents` */

/*Table structure for table `tf_purchase_order` */

DROP TABLE IF EXISTS `tf_purchase_order`;

CREATE TABLE `tf_purchase_order` (
  `purchase_order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seller_id` bigint(20) NOT NULL,
  `debtor_company` bigint(20) NOT NULL,
  `po_number` varchar(25) DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `po_amount` decimal(10,0) DEFAULT NULL,
  `po_days` int(11) DEFAULT NULL,
  `po_notes` varchar(45) DEFAULT NULL,
  `finance_amount` decimal(10,0) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `is_traded` tinyint(1) DEFAULT '0',
  `trade_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`purchase_order_id`),
  UNIQUE KEY `purchase_order_id_UNIQUE` (`purchase_order_id`),
  UNIQUE KEY `po_number_UNIQUE` (`po_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_purchase_order` */

/*Table structure for table `tf_seller_scfcompany_mapping` */

DROP TABLE IF EXISTS `tf_seller_scfcompany_mapping`;

CREATE TABLE `tf_seller_scfcompany_mapping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `scf_company` bigint(20) DEFAULT NULL,
  `seller_company` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_seller_scfcompany_mapping` */

/*Table structure for table `tf_seller_setting` */

DROP TABLE IF EXISTS `tf_seller_setting`;

CREATE TABLE `tf_seller_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_Id` bigint(20) NOT NULL,
  `seller_transaction_fee` decimal(10,2) DEFAULT NULL,
  `seller_finance_fee` decimal(10,4) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_seller_setting` */

/*Table structure for table `tf_trade` */

DROP TABLE IF EXISTS `tf_trade`;

CREATE TABLE `tf_trade` (
  `trade_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `duration` int(11) DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `trade_amount` decimal(10,0) DEFAULT NULL,
  `STATUS` tinyint(1) DEFAULT '1',
  `invoive_company_id` bigint(20) NOT NULL,
  `seller_company_id` bigint(20) NOT NULL,
  `trade_days` int(11) DEFAULT NULL,
  `trade_description` varchar(300) DEFAULT NULL,
  `repayment_date` date DEFAULT NULL,
  `trade_settled` tinyint(1) DEFAULT '0',
  `is_secondary_allotment` tinyint(1) DEFAULT '0',
  `total_value` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`trade_id`),
  UNIQUE KEY `trade_id_UNIQUE` (`trade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_trade` */

/*Table structure for table `tf_trade_audit` */

DROP TABLE IF EXISTS `tf_trade_audit`;

CREATE TABLE `tf_trade_audit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_finance_fee` decimal(10,4) DEFAULT NULL,
  `seller_transaction_fee` decimal(10,2) DEFAULT NULL,
  `COMMENT` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_trade_audit_trade_id` (`trade_id`),
  KEY `fk_trade_audit_user_id` (`user_id`),
  CONSTRAINT `tf_trade_audit_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`),
  CONSTRAINT `tf_trade_audit_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tf_user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `tf_trade_audit` */

insert  into `tf_trade_audit`(`id`,`trade_id`,`user_id`,`seller_finance_fee`,`seller_transaction_fee`,`COMMENT`,`create_date`,`update_date`) values (19,21,1,'2.0000','25.00',NULL,'2016-03-24 14:14:18',NULL),(20,22,1,'2.0000','25.00',NULL,'2016-03-24 15:46:03',NULL),(21,23,1,'2.0000','25.00',NULL,'2016-03-24 17:54:04',NULL),(22,24,1,'2.0000','25.00',NULL,'2016-03-24 18:13:42',NULL);

/*Table structure for table `tf_user` */

DROP TABLE IF EXISTS `tf_user`;

CREATE TABLE `tf_user` (
  `iduser` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telwork` varchar(45) DEFAULT NULL,
  `telmobile` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `diremail` varchar(100) DEFAULT NULL,
  `dirname` varchar(100) DEFAULT NULL,
  `reqdate` datetime DEFAULT NULL,
  `tcagree` varchar(45) DEFAULT NULL,
  `dirconfirm` varchar(45) DEFAULT NULL,
  `checksagree` varchar(45) DEFAULT NULL,
  `memtype` varchar(45) DEFAULT NULL,
  `updateflag` int(11) DEFAULT NULL,
  `active_status` tinyint(1) DEFAULT '1',
  `company_id` bigint(20) DEFAULT NULL,
  `companydirector` varchar(45) DEFAULT NULL,
  `liferay_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `iduser_UNIQUE` (`iduser`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_company_idx` (`company_id`),
  CONSTRAINT `fk_user_company` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `tf_user` */

insert  into `tf_user`(`iduser`,`firstname`,`middlename`,`lastname`,`title`,`username`,`password`,`type`,`active`,`email`,`telwork`,`telmobile`,`level`,`diremail`,`dirname`,`reqdate`,`tcagree`,`dirconfirm`,`checksagree`,`memtype`,`updateflag`,`active_status`,`company_id`,`companydirector`,`liferay_user_id`) values (1,'Gautam','','Sharma','mr','gautamkct',NULL,'Seller Admin',0,'gautam.kct1988@gmail.com',NULL,'123-214-1441','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,'other',11308),(2,'dhanush','','kodi','Mr','dhanushahm',NULL,'SCF Company Admin',0,'dhanush.kodi@knowarth.com ',NULL,'363-635-6356','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,2,'director',11336),(3,'Primarry','','Investor1','mr','prInvestor1',NULL,'Primary Investor Admin',0,'pawankct91@gmail.com ',NULL,'141-413-4134','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,'Yes',11407),(4,'Primary ','','Investor2','mr','prInvestor2',NULL,'Primary Investor Admin',0,'prInvestor2@yahoo.in',NULL,'135-322-3524','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,'Yes',11437),(5,'seller','','whitehall2','Mr','sellerwhitehall2',NULL,'Seller Admin',0,'sellerwhitehall2@outlook.com',NULL,'579-568-9589','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,5,'Yes',11457),(6,'Pr','','Investor3','Mr','prInvestor3',NULL,'Primary Investor Admin',0,'prInvestor3@whitehall.com ',NULL,'111-341-3444','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,6,'Yes',11477),(7,'Pr','','Investor4','Mr','prInvestor4',NULL,'Primary Investor Admin',0,'prInvestor4@whitehall.com',NULL,'161-896-1868','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,7,'Yes',11497),(8,'seller','','whitehall3','Mr','sellerwhitehall3',NULL,'Seller Admin',0,'sellerwhitehall2@whitehall.com',NULL,'141-411-4141','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,8,NULL,11517),(9,'scf','','company2','Mr','scfcompany2',NULL,'SCF Company Admin',0,'scfcompany2@whitehall.com',NULL,'413-441-4143','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,9,'Yes',11537);

/*Table structure for table `tf_whitehall_transaction` */

DROP TABLE IF EXISTS `tf_whitehall_transaction`;

CREATE TABLE `tf_whitehall_transaction` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `transcation_type` varchar(100) DEFAULT NULL,
  `transcation_date` datetime DEFAULT NULL,
  `trade_id` bigint(20) DEFAULT NULL,
  `reference` varchar(250) DEFAULT NULL,
  `company_id` bigint(20) DEFAULT NULL,
  `company_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_whitehall_transaction_trade_id` (`trade_id`),
  KEY `fk_whitehall_transaction_company_id` (`company_id`),
  CONSTRAINT `tf_whitehall_transaction_cmpIDfk_1` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`),
  CONSTRAINT `tf_whitehall_transaction_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

/*Data for the table `tf_whitehall_transaction` */

insert  into `tf_whitehall_transaction`(`id`,`amount`,`transcation_type`,`transcation_date`,`trade_id`,`reference`,`company_id`,`company_type`) values (42,'60000.00','Investor Paid','2016-03-24 14:14:32',21,'Investors has paid the money to whitehall',NULL,NULL),(43,'58730.45','Supplier Paid','2016-03-24 14:14:35',21,'Supplier paid by Whitehall Admin',NULL,NULL),(44,'60000.00','SCF Repayment','2016-03-24 14:14:39',21,'SCF Company Paid to Whitehall Admin',NULL,NULL),(45,'60000.00','Investor Repaid','2016-03-24 14:14:42',21,'Investor has been repaid by whitehall',NULL,NULL),(46,'407.50','Investor Profit','2016-03-24 14:14:42',21,'Investor profit has been paid  by whitehall',NULL,NULL),(47,'829.00','Whitehall Fee','2016-03-24 14:14:45',21,'WhiteHall Fees from Seller',NULL,NULL),(48,'33.04','Whitehall Fee','2016-03-24 14:14:45',21,'Whitehall profit from Investor',NULL,NULL),(49,'30000.00','Investor Paid','2016-03-24 15:46:17',22,'Investors has paid the money to whitehall',NULL,NULL),(50,'29649.93','Supplier Paid','2016-03-24 15:46:22',22,'Supplier paid by Whitehall Admin',NULL,NULL),(51,'30000.00','SCF Repayment','2016-03-24 15:46:26',22,'SCF Company Paid to Whitehall Admin',NULL,NULL),(52,'30000.00','Investor Repaid','2016-03-24 15:46:30',22,'Investor has been repaid by whitehall',NULL,NULL),(53,'106.44','Investor Profit','2016-03-24 15:46:30',22,'Investor profit has been paid  by whitehall',NULL,NULL),(54,'235.00','Whitehall Fee','2016-03-24 15:46:34',22,'WhiteHall Fees from Seller',NULL,NULL),(55,'8.63','Whitehall Fee','2016-03-24 15:46:34',22,'Whitehall profit from Investor',NULL,NULL);

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `ticketId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `key_` varchar(75) DEFAULT NULL,
  `type_` int(11) DEFAULT NULL,
  `extraInfo` longtext,
  `expirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ticketId`),
  KEY `IX_B2468446` (`key_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ticket` */

insert  into `ticket`(`ticketId`,`companyId`,`createDate`,`classNameId`,`classPK`,`key_`,`type_`,`extraInfo`,`expirationDate`) values (10669,10155,'2016-03-15 20:49:47',10005,10199,'dcc5ade4-8c68-4ec8-b0c5-a0d2dac449a8',2,'','2016-03-15 21:19:47'),(10672,10155,'2016-03-15 20:50:26',10005,10199,'efe3c299-1a6e-42ac-aeb0-943f6081340b',2,'','2016-03-15 21:20:26'),(10682,10155,'2016-03-15 20:50:46',10005,10199,'99bf38f9-4f80-45f9-89d7-8fa3233f7439',2,'','2016-03-15 21:20:46'),(10946,10155,'2016-03-15 20:51:33',10005,10199,'9bc1516e-a103-476c-984a-513f272d6f8c',2,'','2016-03-15 21:21:33'),(10949,10155,'2016-03-15 20:51:43',10005,10199,'dc949acf-606a-48b8-903d-eb397a8d3de2',2,'','2016-03-15 21:21:43'),(10950,10155,'2016-03-15 20:54:32',10005,10199,'e5f331f9-2a31-4558-9624-12cf7fa04140',2,'','2016-03-15 21:24:32'),(10955,10155,'2016-03-15 20:54:42',10005,10199,'6aedb06e-e069-4337-a3e0-31c398cb8844',2,'','2016-03-15 21:24:42'),(10964,10155,'2016-03-15 20:55:02',10005,10199,'54b9dd57-4b82-4189-b296-e8a58fcd8530',2,'','2016-03-15 21:25:02'),(10993,10155,'2016-03-15 20:55:42',10005,10199,'6d87086e-cd2b-4142-b85b-24e1c934264c',2,'','2016-03-15 21:25:42'),(10998,10155,'2016-03-15 20:56:07',10005,10199,'8a4ffa84-7132-49cc-a0fc-246b315efbab',2,'','2016-03-15 21:26:07'),(11010,10155,'2016-03-15 20:59:01',10005,10199,'5e877301-4179-4439-8942-72efe6b3413a',2,'','2016-03-15 21:29:01'),(11011,10155,'2016-03-15 20:59:02',10005,10199,'cdd1d577-8586-4617-92c6-81faa4b3c3d9',2,'','2016-03-15 21:29:02'),(11022,10155,'2016-03-15 20:59:19',10005,10199,'d8d4b95d-309c-41e0-8632-7cc094844f24',2,'','2016-03-15 21:29:19'),(11603,10155,'2016-03-17 19:35:05',10005,10199,'9a9b6fe6-a55d-4b7f-8650-958ef6a2e0db',2,'','2016-03-17 20:05:05'),(11614,10155,'2016-03-17 19:35:47',10005,10199,'b957a0f4-a7c9-4665-8e25-f4f497688e18',2,'','2016-03-17 20:05:47'),(11801,10155,'2016-03-19 19:15:37',10005,10199,'4513aafc-1809-4cfa-89ba-a2af119c0c49',2,'','2016-03-19 19:45:37'),(11812,10155,'2016-03-19 19:16:30',10005,10199,'8ff339ca-e8c7-4545-9c31-5be84726dc33',2,'','2016-03-19 19:46:30'),(12153,10155,'2016-03-21 21:13:25',10005,10199,'8f0a5d69-c090-49db-b8e4-8c836b0187cf',2,'','2016-03-21 21:43:25'),(12164,10155,'2016-03-21 21:13:51',10005,10199,'fb3477b5-d695-49a8-bda2-3888b5ce0700',2,'','2016-03-21 21:43:51');

/*Table structure for table `trashentry` */

DROP TABLE IF EXISTS `trashentry`;

CREATE TABLE `trashentry` (
  `entryId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `systemEventSetKey` bigint(20) DEFAULT NULL,
  `typeSettings` longtext,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`entryId`),
  UNIQUE KEY `IX_B35F73D5` (`classNameId`,`classPK`),
  KEY `IX_2674F2A8` (`companyId`),
  KEY `IX_526A032A` (`groupId`),
  KEY `IX_FC4EEA64` (`groupId`,`classNameId`),
  KEY `IX_6CAAE2E8` (`groupId`,`createDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `trashentry` */

/*Table structure for table `trashversion` */

DROP TABLE IF EXISTS `trashversion`;

CREATE TABLE `trashversion` (
  `versionId` bigint(20) NOT NULL,
  `entryId` bigint(20) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `typeSettings` longtext,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`versionId`),
  UNIQUE KEY `IX_D639348C` (`entryId`,`classNameId`,`classPK`),
  KEY `IX_630A643B` (`classNameId`,`classPK`),
  KEY `IX_55D44577` (`entryId`),
  KEY `IX_72D58D37` (`entryId`,`classNameId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `trashversion` */

/*Table structure for table `user_` */

DROP TABLE IF EXISTS `user_`;

CREATE TABLE `user_` (
  `uuid_` varchar(75) DEFAULT NULL,
  `userId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `defaultUser` tinyint(4) DEFAULT NULL,
  `contactId` bigint(20) DEFAULT NULL,
  `password_` varchar(75) DEFAULT NULL,
  `passwordEncrypted` tinyint(4) DEFAULT NULL,
  `passwordReset` tinyint(4) DEFAULT NULL,
  `passwordModifiedDate` datetime DEFAULT NULL,
  `digest` varchar(255) DEFAULT NULL,
  `reminderQueryQuestion` varchar(75) DEFAULT NULL,
  `reminderQueryAnswer` varchar(75) DEFAULT NULL,
  `graceLoginCount` int(11) DEFAULT NULL,
  `screenName` varchar(75) DEFAULT NULL,
  `emailAddress` varchar(75) DEFAULT NULL,
  `facebookId` bigint(20) DEFAULT NULL,
  `ldapServerId` bigint(20) DEFAULT NULL,
  `openId` varchar(1024) DEFAULT NULL,
  `portraitId` bigint(20) DEFAULT NULL,
  `languageId` varchar(75) DEFAULT NULL,
  `timeZoneId` varchar(75) DEFAULT NULL,
  `greeting` varchar(255) DEFAULT NULL,
  `comments` longtext,
  `firstName` varchar(75) DEFAULT NULL,
  `middleName` varchar(75) DEFAULT NULL,
  `lastName` varchar(75) DEFAULT NULL,
  `jobTitle` varchar(100) DEFAULT NULL,
  `loginDate` datetime DEFAULT NULL,
  `loginIP` varchar(75) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginIP` varchar(75) DEFAULT NULL,
  `lastFailedLoginDate` datetime DEFAULT NULL,
  `failedLoginAttempts` int(11) DEFAULT NULL,
  `lockout` tinyint(4) DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `agreedToTermsOfUse` tinyint(4) DEFAULT NULL,
  `emailAddressVerified` tinyint(4) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `IX_615E9F7A` (`companyId`,`emailAddress`),
  UNIQUE KEY `IX_C5806019` (`companyId`,`screenName`),
  UNIQUE KEY `IX_9782AD88` (`companyId`,`userId`),
  UNIQUE KEY `IX_5ADBE171` (`contactId`),
  KEY `IX_3A1E834E` (`companyId`),
  KEY `IX_740C4D0C` (`companyId`,`createDate`),
  KEY `IX_BCFDA257` (`companyId`,`createDate`,`modifiedDate`),
  KEY `IX_6EF03E4E` (`companyId`,`defaultUser`),
  KEY `IX_1D731F03` (`companyId`,`facebookId`),
  KEY `IX_EE8ABD19` (`companyId`,`modifiedDate`),
  KEY `IX_89509087` (`companyId`,`openId`(767)),
  KEY `IX_F6039434` (`companyId`,`status`),
  KEY `IX_762F63C6` (`emailAddress`),
  KEY `IX_A18034A4` (`portraitId`),
  KEY `IX_E0422BDA` (`uuid_`),
  KEY `IX_405CC0E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_` */

insert  into `user_`(`uuid_`,`userId`,`companyId`,`createDate`,`modifiedDate`,`defaultUser`,`contactId`,`password_`,`passwordEncrypted`,`passwordReset`,`passwordModifiedDate`,`digest`,`reminderQueryQuestion`,`reminderQueryAnswer`,`graceLoginCount`,`screenName`,`emailAddress`,`facebookId`,`ldapServerId`,`openId`,`portraitId`,`languageId`,`timeZoneId`,`greeting`,`comments`,`firstName`,`middleName`,`lastName`,`jobTitle`,`loginDate`,`loginIP`,`lastLoginDate`,`lastLoginIP`,`lastFailedLoginDate`,`failedLoginAttempts`,`lockout`,`lockoutDate`,`agreedToTermsOfUse`,`emailAddressVerified`,`status`) values ('3332019f-3540-4503-86b5-e18a42d867ae',10159,10155,'2016-03-15 19:16:25','2016-03-15 19:16:25',1,10160,'password',0,0,NULL,'5533ed38b5e33c076a804bb4bca644f9,3122172330a991cc1e9575c4f75428d4,3122172330a991cc1e9575c4f75428d4','','',0,'10159','default@liferay.com',0,0,'',0,'en_US','UTC','Welcome!','','','','','','2016-03-15 19:16:25','',NULL,'',NULL,0,0,NULL,1,0,0),('ef9bba04-0e53-4973-aa55-7737d676ae5f',10199,10155,'2016-03-15 19:16:30','2016-03-21 19:53:29',0,10200,'test',1,0,NULL,'4fed12e662adbbbbfa2a0d6940af4675,bca8792cd5cd75e081dce52151f189e2,0d964023b6532e1cb17d96b98642eb31','what-is-your-library-card-number','75',0,'whitehalladmin','gautam.tf2016@gmail.com',0,-1,'',0,'en_US','UTC','Welcome Test Test!','','Whitehall','','Admin','','2016-03-24 19:14:38','127.0.0.1','2016-03-24 19:13:54','127.0.0.1',NULL,0,0,NULL,1,1,0),('945d6f81-aab4-4205-aa45-0c35a5300b35',11308,10155,'2016-03-16 04:54:01','2016-03-21 18:11:52',0,11309,'test',1,0,'2016-03-16 04:54:27','c47cfd26c2966b1cd53168786a1ddf71,e2fc72e84632465601a28ae9d9dafb3f,efc7838f584c5d6ce69222fa0bc0e502','what-is-your-library-card-number','70',0,'gautamkct','gautam.kct1988@gmail.com',0,-1,'',0,'en_US','UTC','Welcome Gautam Sharma!','','Gautam','','Sharma','','2016-03-24 18:13:09','127.0.0.1','2016-03-24 17:53:32','127.0.0.1',NULL,0,0,NULL,1,0,0),('2f084273-be47-4e02-a15d-d851c651c7b5',11336,10155,'2016-03-16 05:02:06','2016-03-16 19:51:41',0,11337,'test',1,0,'2016-03-19 14:00:20','15cf25de99b9107ad94080a54f360701,3caf69e36abf409757edf928ec803ccd,b8a2f57c119ad70fb816622125609ec3','what-is-your-library-card-number','75',0,'dhanushahm','dhanush.kodi@knowarth.com',0,-1,'',0,'en_US','UTC','Welcome dhanush kodi!','','dhanush','','kodi','','2016-03-22 07:09:17','127.0.0.1','2016-03-21 21:14:33','127.0.0.1','2016-03-19 13:58:59',0,0,NULL,1,0,0),('97369875-4f29-45b5-b491-e28ecc3d4265',11407,10155,'2016-03-16 19:40:53','2016-03-16 19:40:53',0,11408,'test',1,0,'2016-03-16 19:41:38','721d1dcc8f0f10f0b8f219d023680ec6,3f5c8f1ebac4191f0e637907ccbeefb5,a00fe25ca30e37dfa6f9855e0dc2a7f7','what-is-your-library-card-number','75',0,'prinvestor1','pawankct91@gmail.com',0,-1,'',0,'en_US','UTC','Welcome Primarry Investor1!','','Primarry','','Investor1','','2016-03-24 19:15:24','127.0.0.1','2016-03-24 19:12:47','127.0.0.1',NULL,0,0,NULL,1,0,0),('56859c18-0b15-42a4-be73-983d0ad65b1e',11437,10155,'2016-03-16 20:05:15','2016-03-16 20:05:15',0,11438,'test',1,0,'2016-03-16 20:06:04','dd136310333170302888389dec4e6038,5624293185ca94d044399ac3112755af,0b8af9ccc7c97d50b81ef4881f595290','what-is-your-library-card-number','75',0,'prinvestor2','prinvestor2@yahoo.in',0,-1,'',0,'en_US','UTC','Welcome Primary  Investor2!','','Primary ','','Investor2','','2016-03-20 16:03:40','127.0.0.1','2016-03-16 20:05:44','127.0.0.1',NULL,0,0,NULL,1,0,0),('d0623694-6ea8-4817-b28c-9db467ca7772',11457,10155,'2016-03-16 20:32:10','2016-03-16 20:32:10',0,11458,'test',1,0,'2016-03-16 20:32:42','','what-is-your-library-card-number','75',0,'sellerwhitehall2','sellerwhitehall2@outlook.com',0,-1,'',0,'en_US','UTC','Welcome seller whitehall2!','','seller','','whitehall2','','2016-03-16 20:32:22','127.0.0.1','2016-03-16 20:32:22','127.0.0.1',NULL,0,0,NULL,1,0,0),('5fde664e-4e92-4be1-9405-7c566a13e53a',11477,10155,'2016-03-16 20:35:20','2016-03-16 20:35:20',0,11478,'test',1,0,'2016-03-16 20:35:58','bf892b166cb2dd926ba9ecfa7fc1b366,672162bec431159b1995f11e98b34baf,75e84953d038f2fcedcfbd11b45dacfa','what-is-your-library-card-number','75',0,'prinvestor3','prinvestor3@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome Pr Investor3!','','Pr','','Investor3','','2016-03-20 16:04:40','127.0.0.1','2016-03-16 20:35:32','127.0.0.1',NULL,0,0,NULL,1,0,0),('4f620401-6be9-4192-8dd7-6f9dacea789c',11497,10155,'2016-03-16 20:52:31','2016-03-16 20:52:31',0,11498,'test',1,0,'2016-03-16 20:53:14','1b765ba670335ee14e93fa50f56cc3eb,47658429b132d170e16539b484388078,58978bcec5fd7cc831ccec90efd8bfbf','what-is-your-library-card-number','75',0,'prinvestor4','prinvestor4@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome Pr Investor4!','','Pr','','Investor4','','2016-03-20 16:05:26','127.0.0.1','2016-03-16 20:52:49','127.0.0.1',NULL,0,0,NULL,1,0,0),('6629a562-c93c-49b2-bfbe-e97fe0ae9732',11517,10155,'2016-03-16 20:56:48','2016-03-16 20:56:48',0,11518,'test',1,0,'2016-03-16 20:58:11','','what-is-your-library-card-number','75',0,'sellerwhitehall3','sellerwhitehall2@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome seller whitehall3!','','seller','','whitehall3','','2016-03-16 20:57:57','127.0.0.1','2016-03-16 20:57:57','127.0.0.1',NULL,0,0,NULL,1,0,0),('4eb2f146-0730-4d5d-bbd2-319c68d9b52a',11537,10155,'2016-03-16 21:00:32','2016-03-16 21:00:32',0,11538,'test',1,0,'2016-03-16 21:00:52','b4be60bd88ca9a23dcc655c8529fd050,c454aafe60a5a423d91aaba34ddcf062,8a1c828ec51a935bd6e8f232c178fe97','what-is-your-library-card-number','75',0,'scfcompany2','scfcompany2@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome scf company2!','','scf','','company2','','2016-03-20 18:13:30','127.0.0.1','2016-03-19 13:53:56','127.0.0.1','2016-03-19 13:59:59',0,0,NULL,1,0,0);

/*Table structure for table `usergroup` */

DROP TABLE IF EXISTS `usergroup`;

CREATE TABLE `usergroup` (
  `uuid_` varchar(75) DEFAULT NULL,
  `userGroupId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `parentUserGroupId` bigint(20) DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `addedByLDAPImport` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userGroupId`),
  UNIQUE KEY `IX_23EAD0D` (`companyId`,`name`),
  KEY `IX_524FEFCE` (`companyId`),
  KEY `IX_69771487` (`companyId`,`parentUserGroupId`),
  KEY `IX_5F1DD85A` (`uuid_`),
  KEY `IX_72394F8E` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usergroup` */

/*Table structure for table `usergroupgrouprole` */

DROP TABLE IF EXISTS `usergroupgrouprole`;

CREATE TABLE `usergroupgrouprole` (
  `userGroupId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`userGroupId`,`groupId`,`roleId`),
  KEY `IX_CCBE4063` (`groupId`),
  KEY `IX_CAB0CCC8` (`groupId`,`roleId`),
  KEY `IX_1CDF88C` (`roleId`),
  KEY `IX_DCDED558` (`userGroupId`),
  KEY `IX_73C52252` (`userGroupId`,`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usergroupgrouprole` */

/*Table structure for table `usergrouprole` */

DROP TABLE IF EXISTS `usergrouprole`;

CREATE TABLE `usergrouprole` (
  `userId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`groupId`,`roleId`),
  KEY `IX_1B988D7A` (`groupId`),
  KEY `IX_871412DF` (`groupId`,`roleId`),
  KEY `IX_887A2C95` (`roleId`),
  KEY `IX_887BE56A` (`userId`),
  KEY `IX_4D040680` (`userId`,`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usergrouprole` */

/*Table structure for table `usergroups_teams` */

DROP TABLE IF EXISTS `usergroups_teams`;

CREATE TABLE `usergroups_teams` (
  `teamId` bigint(20) NOT NULL,
  `userGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`teamId`,`userGroupId`),
  KEY `IX_31FB0B08` (`teamId`),
  KEY `IX_7F187E63` (`userGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usergroups_teams` */

/*Table structure for table `useridmapper` */

DROP TABLE IF EXISTS `useridmapper`;

CREATE TABLE `useridmapper` (
  `userIdMapperId` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `description` varchar(75) DEFAULT NULL,
  `externalUserId` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`userIdMapperId`),
  UNIQUE KEY `IX_41A32E0D` (`type_`,`externalUserId`),
  UNIQUE KEY `IX_D1C44A6E` (`userId`,`type_`),
  KEY `IX_E60EA987` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `useridmapper` */

/*Table structure for table `usernotificationdelivery` */

DROP TABLE IF EXISTS `usernotificationdelivery`;

CREATE TABLE `usernotificationdelivery` (
  `userNotificationDeliveryId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `portletId` varchar(200) DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `notificationType` int(11) DEFAULT NULL,
  `deliveryType` int(11) DEFAULT NULL,
  `deliver` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userNotificationDeliveryId`),
  UNIQUE KEY `IX_8B6E3ACE` (`userId`,`portletId`,`classNameId`,`notificationType`,`deliveryType`),
  KEY `IX_C648700A` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usernotificationdelivery` */

/*Table structure for table `usernotificationevent` */

DROP TABLE IF EXISTS `usernotificationevent`;

CREATE TABLE `usernotificationevent` (
  `uuid_` varchar(75) DEFAULT NULL,
  `userNotificationEventId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `type_` varchar(75) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `deliverBy` bigint(20) DEFAULT NULL,
  `delivered` tinyint(4) DEFAULT NULL,
  `payload` longtext,
  `archived` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userNotificationEventId`),
  KEY `IX_3E5D78C4` (`userId`),
  KEY `IX_3DBB361A` (`userId`,`archived`),
  KEY `IX_24F1BF0` (`userId`,`delivered`),
  KEY `IX_ECD8CFEA` (`uuid_`),
  KEY `IX_A6BAFDFE` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usernotificationevent` */

/*Table structure for table `users_groups` */

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `groupId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`groupId`,`userId`),
  KEY `IX_C4F9E699` (`groupId`),
  KEY `IX_F10B6C6B` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users_groups` */

insert  into `users_groups`(`groupId`,`userId`) values (10182,10199),(10182,11308),(10182,11336),(10182,11407),(10182,11437),(10182,11457),(10182,11477),(10182,11497),(10182,11517),(10182,11537);

/*Table structure for table `users_orgs` */

DROP TABLE IF EXISTS `users_orgs`;

CREATE TABLE `users_orgs` (
  `organizationId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`organizationId`,`userId`),
  KEY `IX_7EF4EC0E` (`organizationId`),
  KEY `IX_FB646CA6` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users_orgs` */

/*Table structure for table `users_roles` */

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `roleId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `IX_C19E5F31` (`roleId`),
  KEY `IX_C1A01806` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users_roles` */

insert  into `users_roles`(`roleId`,`userId`) values (10162,10199),(10163,10159),(10165,10199),(10165,11308),(10165,11336),(10165,11407),(10165,11437),(10165,11457),(10165,11477),(10165,11497),(10165,11517),(10165,11537),(10166,10199),(10166,11308),(10166,11336),(10166,11407),(10166,11437),(10166,11457),(10166,11477),(10166,11497),(10166,11517),(10166,11537),(10685,11407),(10685,11437),(10685,11477),(10685,11497),(10686,11336),(10686,11537),(10688,11308),(10688,11407),(10688,11457),(10688,11517);

/*Table structure for table `users_teams` */

DROP TABLE IF EXISTS `users_teams`;

CREATE TABLE `users_teams` (
  `teamId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`teamId`,`userId`),
  KEY `IX_4D06AD51` (`teamId`),
  KEY `IX_A098EFBF` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users_teams` */

/*Table structure for table `users_usergroups` */

DROP TABLE IF EXISTS `users_usergroups`;

CREATE TABLE `users_usergroups` (
  `userId` bigint(20) NOT NULL,
  `userGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`userGroupId`),
  KEY `IX_66FF2503` (`userGroupId`),
  KEY `IX_BE8102D6` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users_usergroups` */

/*Table structure for table `usertracker` */

DROP TABLE IF EXISTS `usertracker`;

CREATE TABLE `usertracker` (
  `userTrackerId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `sessionId` varchar(200) DEFAULT NULL,
  `remoteAddr` varchar(75) DEFAULT NULL,
  `remoteHost` varchar(75) DEFAULT NULL,
  `userAgent` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userTrackerId`),
  KEY `IX_29BA1CF5` (`companyId`),
  KEY `IX_46B0AE8E` (`sessionId`),
  KEY `IX_E4EFBA8D` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usertracker` */

/*Table structure for table `usertrackerpath` */

DROP TABLE IF EXISTS `usertrackerpath`;

CREATE TABLE `usertrackerpath` (
  `userTrackerPathId` bigint(20) NOT NULL,
  `userTrackerId` bigint(20) DEFAULT NULL,
  `path_` longtext,
  `pathDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userTrackerPathId`),
  KEY `IX_14D8BCC0` (`userTrackerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usertrackerpath` */

/*Table structure for table `virtualhost` */

DROP TABLE IF EXISTS `virtualhost`;

CREATE TABLE `virtualhost` (
  `virtualHostId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `layoutSetId` bigint(20) DEFAULT NULL,
  `hostname` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`virtualHostId`),
  UNIQUE KEY `IX_A083D394` (`companyId`,`layoutSetId`),
  UNIQUE KEY `IX_431A3960` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `virtualhost` */

insert  into `virtualhost`(`virtualHostId`,`companyId`,`layoutSetId`,`hostname`) values (10158,10155,0,'localhost');

/*Table structure for table `webdavprops` */

DROP TABLE IF EXISTS `webdavprops`;

CREATE TABLE `webdavprops` (
  `webDavPropsId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `props` longtext,
  PRIMARY KEY (`webDavPropsId`),
  UNIQUE KEY `IX_97DFA146` (`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `webdavprops` */

/*Table structure for table `website` */

DROP TABLE IF EXISTS `website`;

CREATE TABLE `website` (
  `uuid_` varchar(75) DEFAULT NULL,
  `websiteId` bigint(20) NOT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `url` longtext,
  `typeId` int(11) DEFAULT NULL,
  `primary_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`websiteId`),
  KEY `IX_96F07007` (`companyId`),
  KEY `IX_4F0F0CA7` (`companyId`,`classNameId`),
  KEY `IX_F960131C` (`companyId`,`classNameId`,`classPK`),
  KEY `IX_1AA07A6D` (`companyId`,`classNameId`,`classPK`,`primary_`),
  KEY `IX_F75690BB` (`userId`),
  KEY `IX_76F15D13` (`uuid_`),
  KEY `IX_712BCD35` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `website` */

/*Table structure for table `wikinode` */

DROP TABLE IF EXISTS `wikinode`;

CREATE TABLE `wikinode` (
  `uuid_` varchar(75) DEFAULT NULL,
  `nodeId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `name` varchar(75) DEFAULT NULL,
  `description` longtext,
  `lastPostDate` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`nodeId`),
  UNIQUE KEY `IX_920CD8B1` (`groupId`,`name`),
  UNIQUE KEY `IX_7609B2AE` (`uuid_`,`groupId`),
  KEY `IX_5D6FE3F0` (`companyId`),
  KEY `IX_B54332D6` (`companyId`,`status`),
  KEY `IX_B480A672` (`groupId`),
  KEY `IX_23325358` (`groupId`,`status`),
  KEY `IX_6C112D7C` (`uuid_`),
  KEY `IX_E0E6D12C` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wikinode` */

/*Table structure for table `wikipage` */

DROP TABLE IF EXISTS `wikipage`;

CREATE TABLE `wikipage` (
  `uuid_` varchar(75) DEFAULT NULL,
  `pageId` bigint(20) NOT NULL,
  `resourcePrimKey` bigint(20) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `nodeId` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `version` double DEFAULT NULL,
  `minorEdit` tinyint(4) DEFAULT NULL,
  `content` longtext,
  `summary` longtext,
  `format` varchar(75) DEFAULT NULL,
  `head` tinyint(4) DEFAULT NULL,
  `parentTitle` varchar(255) DEFAULT NULL,
  `redirectTitle` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusByUserId` bigint(20) DEFAULT NULL,
  `statusByUserName` varchar(75) DEFAULT NULL,
  `statusDate` datetime DEFAULT NULL,
  PRIMARY KEY (`pageId`),
  UNIQUE KEY `IX_3D4AF476` (`nodeId`,`title`,`version`),
  UNIQUE KEY `IX_2CD67C81` (`resourcePrimKey`,`nodeId`,`version`),
  UNIQUE KEY `IX_899D3DFB` (`uuid_`,`groupId`),
  KEY `IX_A2001730` (`format`),
  KEY `IX_16E99B0A` (`groupId`,`nodeId`,`head`),
  KEY `IX_BA72B89A` (`groupId`,`nodeId`,`head`,`parentTitle`,`status`),
  KEY `IX_E0092FF0` (`groupId`,`nodeId`,`head`,`status`),
  KEY `IX_941E429C` (`groupId`,`nodeId`,`status`),
  KEY `IX_5FF21CE6` (`groupId`,`nodeId`,`title`,`head`),
  KEY `IX_CAA451D6` (`groupId`,`userId`,`nodeId`,`status`),
  KEY `IX_C8A9C476` (`nodeId`),
  KEY `IX_E7F635CA` (`nodeId`,`head`),
  KEY `IX_65E84AF4` (`nodeId`,`head`,`parentTitle`),
  KEY `IX_9F7655DA` (`nodeId`,`head`,`parentTitle`,`status`),
  KEY `IX_40F94F68` (`nodeId`,`head`,`redirectTitle`,`status`),
  KEY `IX_432F0AB0` (`nodeId`,`head`,`status`),
  KEY `IX_46EEF3C8` (`nodeId`,`parentTitle`),
  KEY `IX_1ECC7656` (`nodeId`,`redirectTitle`),
  KEY `IX_546F2D5C` (`nodeId`,`status`),
  KEY `IX_997EEDD2` (`nodeId`,`title`),
  KEY `IX_E745EA26` (`nodeId`,`title`,`head`),
  KEY `IX_BEA33AB8` (`nodeId`,`title`,`status`),
  KEY `IX_85E7CC76` (`resourcePrimKey`),
  KEY `IX_B771D67` (`resourcePrimKey`,`nodeId`),
  KEY `IX_E1F55FB` (`resourcePrimKey`,`nodeId`,`head`),
  KEY `IX_94D1054D` (`resourcePrimKey`,`nodeId`,`status`),
  KEY `IX_1725355C` (`resourcePrimKey`,`status`),
  KEY `IX_FBBE7C96` (`userId`,`nodeId`,`status`),
  KEY `IX_9C0E478F` (`uuid_`),
  KEY `IX_5DC4BD39` (`uuid_`,`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wikipage` */

/*Table structure for table `wikipageresource` */

DROP TABLE IF EXISTS `wikipageresource`;

CREATE TABLE `wikipageresource` (
  `uuid_` varchar(75) DEFAULT NULL,
  `resourcePrimKey` bigint(20) NOT NULL,
  `nodeId` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resourcePrimKey`),
  UNIQUE KEY `IX_21277664` (`nodeId`,`title`),
  KEY `IX_BE898221` (`uuid_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `wikipageresource` */

/*Table structure for table `workflowdefinitionlink` */

DROP TABLE IF EXISTS `workflowdefinitionlink`;

CREATE TABLE `workflowdefinitionlink` (
  `workflowDefinitionLinkId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `typePK` bigint(20) DEFAULT NULL,
  `workflowDefinitionName` varchar(75) DEFAULT NULL,
  `workflowDefinitionVersion` int(11) DEFAULT NULL,
  PRIMARY KEY (`workflowDefinitionLinkId`),
  KEY `IX_A8B0D276` (`companyId`),
  KEY `IX_A4DB1F0F` (`companyId`,`workflowDefinitionName`,`workflowDefinitionVersion`),
  KEY `IX_B6EE8C9E` (`groupId`,`companyId`,`classNameId`),
  KEY `IX_1E5B9905` (`groupId`,`companyId`,`classNameId`,`classPK`),
  KEY `IX_705B40EE` (`groupId`,`companyId`,`classNameId`,`classPK`,`typePK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `workflowdefinitionlink` */

/*Table structure for table `workflowinstancelink` */

DROP TABLE IF EXISTS `workflowinstancelink`;

CREATE TABLE `workflowinstancelink` (
  `workflowInstanceLinkId` bigint(20) NOT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `companyId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(75) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `classNameId` bigint(20) DEFAULT NULL,
  `classPK` bigint(20) DEFAULT NULL,
  `workflowInstanceId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`workflowInstanceLinkId`),
  KEY `IX_415A7007` (`groupId`,`companyId`,`classNameId`,`classPK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `workflowinstancelink` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
