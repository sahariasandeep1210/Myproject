/*
SQLyog Community v11.1 (64 bit)
MySQL - 5.5.40 : Database - tradedb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tradedb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tradedb`;

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

insert  into `account_`(`accountId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`parentAccountId`,`name`,`legalName`,`legalId`,`legalType`,`sicCode`,`tickerSymbol`,`industry`,`type_`,`size_`) values (10157,10155,0,'','2015-07-17 19:13:38','2015-10-27 20:17:46',0,'WhiteHall Finance','','','','','','','','');

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

insert  into `announcementsdelivery`(`deliveryId`,`companyId`,`userId`,`type_`,`email`,`sms`,`website`) values (11901,10155,10199,'general',0,0,1),(11902,10155,10199,'news',0,0,1),(11903,10155,10199,'test',0,0,1),(20321,10155,20301,'general',0,0,1),(20322,10155,20301,'news',0,0,1),(20323,10155,20301,'test',0,0,1);

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

insert  into `assetentry`(`entryId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`classUuid`,`classTypeId`,`visible`,`startDate`,`endDate`,`publishDate`,`expirationDate`,`mimeType`,`title`,`description`,`summary`,`url`,`layoutUuid`,`height`,`width`,`priority`,`viewCount`) values (10180,10173,10155,10159,'','2015-07-17 19:13:40','2015-07-17 19:13:40',10116,10178,'c2011814-f94b-423b-a667-470e528d2eb6',0,0,NULL,NULL,NULL,NULL,'text/html','10176','','','','',0,0,0,0),(10205,10195,10155,10199,'Test Test','2015-07-17 19:13:41','2016-01-23 20:14:25',10005,10199,'82eb80a1-ba72-4984-b226-90b4cebbe18f',0,0,NULL,NULL,NULL,NULL,'','Gautam Sharma','','','','',0,0,0,0),(10326,10318,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45',10116,10323,'283d4890-03dc-4c34-881c-8e3c0f8bc645',0,0,NULL,NULL,NULL,NULL,'text/html','10321','','','','',0,0,0,0),(10337,10330,10155,10159,'','2015-07-17 19:13:46','2015-07-17 19:13:46',10116,10335,'963669ea-c574-41a0-aa5a-27352d2bcacc',0,0,NULL,NULL,NULL,NULL,'text/html','10333','','','','',0,0,0,0),(10347,10340,10155,10159,'','2015-07-17 19:13:47','2015-07-17 19:13:47',10116,10345,'99206058-1211-45ca-98be-5c3b18fe10af',0,0,NULL,NULL,NULL,NULL,'text/html','10343','','','','',0,0,0,0),(10366,10351,10155,10159,'','2015-07-17 19:13:49','2015-07-17 19:13:49',10116,10364,'204defbe-bf50-44b0-b1e8-2f7bef827c11',0,0,NULL,NULL,NULL,NULL,'text/html','10362','','','','',0,0,0,0),(10374,10351,10155,10159,'','2015-07-17 19:13:51','2015-07-17 19:13:51',10116,10372,'5f7e014c-234c-4204-bc36-fa6829760c89',0,0,NULL,NULL,NULL,NULL,'text/html','10370','','','','',0,0,0,0),(10392,10377,10155,10159,'','2015-07-17 19:13:52','2015-07-17 19:13:52',10116,10390,'7ff28569-38f2-41c2-8670-59beff00050e',0,0,NULL,NULL,NULL,NULL,'text/html','10388','','','','',0,0,0,0),(10401,10377,10155,10159,'','2015-07-17 19:13:54','2015-07-17 19:13:54',10116,10399,'1151d7a5-7fae-4845-b66f-14c1319eade6',0,0,NULL,NULL,NULL,NULL,'text/html','10397','','','','',0,0,0,0),(10409,10377,10155,10159,'','2015-07-17 19:13:55','2015-07-17 19:13:55',10116,10407,'7dc565ac-b31f-42d7-87a9-9790573629b4',0,0,NULL,NULL,NULL,NULL,'text/html','10405','','','','',0,0,0,0),(10619,10182,10155,10159,'','2015-07-17 19:16:45','2015-07-17 19:16:45',10109,10617,'c5983e96-1c3d-4b47-b1dd-1b8551d19973',10613,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','','','','',0,0,0,41),(10622,10182,10155,10159,'','2015-07-17 19:16:46','2015-07-17 19:16:46',10116,10620,'8c7d8b09-85c4-4f68-8da8-87242942a254',0,0,NULL,NULL,NULL,NULL,'text/html','10617','','','','',0,0,0,0),(10641,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',10116,10639,'d9a5e706-9014-4e75-993a-4df8127cab24',0,0,NULL,NULL,NULL,NULL,'text/html','10637','','','','',0,0,0,0),(10647,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',10116,10645,'9a8a729a-6188-4f16-a1c2-59c06b7558a4',0,0,NULL,NULL,NULL,NULL,'text/html','10643','','','','',0,0,0,0),(10667,10195,10155,10199,'Test Test','2015-07-17 19:23:51','2015-07-17 19:23:51',10001,10664,'',0,0,NULL,NULL,NULL,NULL,'','Adm Site','Adm Site','','','',0,0,0,0),(10671,10195,10155,10199,'Test Test','2015-07-17 19:24:15','2015-07-17 19:24:15',10001,10668,'',0,0,NULL,NULL,NULL,NULL,'','Usr Site','Usr Site','','','',0,0,0,0),(10703,10182,10155,10159,'','2015-07-17 20:44:10','2015-07-17 20:44:10',10445,10694,'0b7de103-7134-436d-8691-b27a2dfaec34',0,1,NULL,NULL,NULL,NULL,'text','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Liferay</Name></root>','','','','',0,0,0,0),(11318,11305,10155,10159,'','2015-08-03 19:04:37','2015-08-03 19:04:37',10011,11316,'f26143e4-1fa9-4e30-b484-5fc753f54de8',0,1,NULL,NULL,NULL,NULL,'image/jpeg','morgueFile-1','','','','',0,0,0,0),(11321,11305,10155,10159,'','2015-08-03 19:04:38','2015-08-03 19:04:38',10116,11319,'a2cf3335-6ff7-43bc-aabe-54fc9fde65c5',0,0,NULL,NULL,NULL,NULL,'text/html','11316','','','','',0,0,0,0),(11327,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',10011,11325,'d9f97505-a9ca-463c-9e00-5ddfb60686f8',0,1,NULL,NULL,NULL,NULL,'image/jpeg','morgueFile-3','','','','',0,0,0,0),(11330,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',10116,11328,'e860603f-ee39-48e9-b8ee-9be423b84a69',0,0,NULL,NULL,NULL,NULL,'text/html','11325','','','','',0,0,0,0),(11335,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',10011,11333,'9af34929-943e-48ab-91c6-9e7c4dce3947',0,1,NULL,NULL,NULL,NULL,'image/jpeg','morgueFile-4','','','','',0,0,0,0),(11338,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',10116,11336,'6849e817-29c9-4ef5-8048-6e106d14bd0d',0,0,NULL,NULL,NULL,NULL,'text/html','11333','','','','',0,0,0,0),(11344,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',10011,11341,'0a03c7b0-34e0-40e1-962f-39463d080ecf',0,1,NULL,NULL,NULL,NULL,'image/jpeg','morgueFile-2','','','','',0,0,0,0),(11347,11305,10155,10159,'','2015-08-03 19:04:41','2015-08-03 19:04:41',10116,11345,'bd269170-791b-403b-a7ab-0ae8e3e75b1c',0,0,NULL,NULL,NULL,NULL,'text/html','11341','','','','',0,0,0,0),(11375,11305,10155,10159,'','2015-08-03 19:04:45','2015-08-03 19:04:45',10109,11361,'58a43b7a-fb23-4b95-947e-6df5ba3dfcbf',11354,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Main Carousel</Title></root>','','','','',0,0,0,0),(11378,11305,10155,10159,'','2015-08-03 19:04:47','2015-08-03 19:04:47',10116,11376,'9dc8e01f-57ba-43e6-9642-03abf9bd6bb4',0,0,NULL,NULL,NULL,NULL,'text/html','11361','','','','',0,0,0,0),(11384,11305,10155,10159,'','2015-08-03 19:04:49','2015-08-03 19:04:49',10109,11382,'b01731b1-f44b-429c-9b72-78e7b6c2919c',0,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Customize it</Title></root>','','','','',0,0,0,0),(11387,11305,10155,10159,'','2015-08-03 19:04:49','2015-08-03 19:04:49',10116,11385,'4f46ea4a-c73c-4f4e-b0ee-40d45b726b2b',0,0,NULL,NULL,NULL,NULL,'text/html','11382','','','','',0,0,0,0),(11392,11305,10155,10159,'','2015-08-03 19:04:50','2015-08-03 19:04:50',10109,11390,'1758a440-49c9-47a4-955a-acf7487c2f7e',0,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Did you know</Title></root>','','','','',0,0,0,0),(11395,11305,10155,10159,'','2015-08-03 19:04:50','2015-08-03 19:04:50',10116,11393,'5afed931-d900-4fe0-b38c-35c8fc5302c5',0,0,NULL,NULL,NULL,NULL,'text/html','11390','','','','',0,0,0,0),(11403,11305,10155,10159,'','2015-08-03 19:04:53','2015-08-03 19:04:53',10116,11401,'4496edf6-0187-4394-a19a-cd298eba223b',0,0,NULL,NULL,NULL,NULL,'text/html','11399','','','','',0,0,0,0),(11432,11419,10155,10159,'','2015-08-03 19:34:27','2015-08-03 19:34:27',10011,11430,'5c89cc37-3bf3-4ab6-b198-adc2068635aa',0,1,NULL,NULL,NULL,NULL,'image/jpeg','morgueFile-1','','','','',0,0,0,0),(11435,11419,10155,10159,'','2015-08-03 19:34:28','2015-08-03 19:34:28',10116,11433,'e6cdf81c-008f-4e0c-bde3-b92e5b5fa5da',0,0,NULL,NULL,NULL,NULL,'text/html','11430','','','','',0,0,0,0),(11441,11419,10155,10159,'','2015-08-03 19:34:30','2015-08-03 19:34:30',10011,11439,'205151c9-6e58-4b54-b93a-53b8a2d647ea',0,1,NULL,NULL,NULL,NULL,'image/jpeg','morgueFile-3','','','','',0,0,0,0),(11444,11419,10155,10159,'','2015-08-03 19:34:30','2015-08-03 19:34:30',10116,11442,'1f8ddd4c-c544-4f26-a17b-f882d6af467b',0,0,NULL,NULL,NULL,NULL,'text/html','11439','','','','',0,0,0,0),(11451,11419,10155,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',10011,11448,'6febbec9-0fe4-4b55-b45c-4a8dcbe26572',0,1,NULL,NULL,NULL,NULL,'image/jpeg','morgueFile-4','','','','',0,0,0,0),(11454,11419,10155,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',10116,11452,'aed74637-b8e5-4aa4-92f1-3f398439a5e7',0,0,NULL,NULL,NULL,NULL,'text/html','11448','','','','',0,0,0,0),(11460,11419,10155,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',10011,11458,'5353ab35-d820-4999-a108-4dd57f38c73b',0,1,NULL,NULL,NULL,NULL,'image/jpeg','morgueFile-2','','','','',0,0,0,0),(11463,11419,10155,10159,'','2015-08-03 19:34:32','2015-08-03 19:34:32',10116,11461,'5b94a4ee-8f61-43a9-b21c-fe34aa006f35',0,0,NULL,NULL,NULL,NULL,'text/html','11458','','','','',0,0,0,0),(11489,11419,10155,10159,'','2015-08-03 19:34:34','2015-08-03 19:34:34',10109,11487,'0e2aa021-32f3-48ff-8f2d-8e6ba9dddd26',11471,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Main Carousel</Title></root>','','','','',0,0,0,0),(11492,11419,10155,10159,'','2015-08-03 19:34:36','2015-08-03 19:34:36',10116,11490,'97252eab-ae56-4d95-aed7-8158af886de1',0,0,NULL,NULL,NULL,NULL,'text/html','11487','','','','',0,0,0,0),(11498,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',10109,11496,'aad94e79-accf-4a94-8621-cd2fc621e458',0,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Customize it</Title></root>','','','','',0,0,0,0),(11501,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',10116,11499,'0b5b84bc-7cdb-4044-8424-57032b70fe92',0,0,NULL,NULL,NULL,NULL,'text/html','11496','','','','',0,0,0,0),(11506,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',10109,11504,'f515ca80-72fc-4a94-924e-ad714ec4957b',0,1,NULL,NULL,'2010-02-01 00:00:00',NULL,'text/html','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Did you know</Title></root>','','','','',0,0,0,0),(11509,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',10116,11507,'d17bead8-9d5a-4832-b5d7-d8e0db419206',0,0,NULL,NULL,NULL,NULL,'text/html','11504','','','','',0,0,0,0),(11517,11419,10155,10159,'','2015-08-03 19:34:39','2015-08-03 19:34:39',10116,11515,'d1e93901-9d0f-4e40-8fa1-805c90ba2749',0,0,NULL,NULL,NULL,NULL,'text/html','11513','','','','',0,0,0,0),(12908,10182,10155,10199,'Test Test','2015-08-13 19:57:20','2015-08-13 19:57:20',10116,12906,'8670c626-8fe9-46b0-a1fe-cca394c0d177',0,0,NULL,NULL,NULL,NULL,'text/html','12904','','','','',0,0,0,0),(12926,10182,10155,10199,'Test Test','2015-08-13 19:58:04','2015-08-13 19:58:04',10116,12924,'aa0aef14-d6d8-4498-a019-633358bda040',0,0,NULL,NULL,NULL,NULL,'text/html','12922','','','','',0,0,0,0),(12935,10182,10155,10199,'Test Test','2015-08-13 19:58:29','2015-08-13 19:58:29',10116,12933,'ed11b3e5-7536-460d-bed9-cd39be890df9',0,0,NULL,NULL,NULL,NULL,'text/html','12931','','','','',0,0,0,0),(13005,10182,10155,10199,'Test Test','2015-08-13 20:36:13','2015-08-13 20:36:13',10116,13003,'52ce6064-93cd-47bd-83d3-4f2747626215',0,0,NULL,NULL,NULL,NULL,'text/html','13001','','','','',0,0,0,0),(13219,13202,10155,10159,'','2015-08-13 21:39:00','2015-08-13 21:39:00',10116,13217,'5fc7a4c3-d007-462a-8f0e-dcde33852211',0,0,NULL,NULL,NULL,NULL,'text/html','13215','','','','',0,0,0,0),(13308,10182,10155,10199,'Test Test','2015-08-16 09:54:22','2015-08-16 09:54:22',10116,13306,'390d5ede-b31c-4b9f-a654-3c8e7d27dd67',0,0,NULL,NULL,NULL,NULL,'text/html','13304','','','','',0,0,0,0),(14206,10182,10155,10199,'Test Test','2015-08-27 18:38:56','2015-08-27 18:38:56',10116,14204,'273508f3-a0a9-4820-99b4-ef413411c6e0',0,0,NULL,NULL,NULL,NULL,'text/html','14202','','','','',0,0,0,0),(14302,10182,10155,10199,'Test Test','2015-08-29 14:06:00','2015-08-29 14:06:00',10012,14301,'c2672da9-7afe-45a3-a442-1ec31cd56bdb',0,1,NULL,NULL,NULL,NULL,'','Invoices','Invoices','','','',0,0,0,0),(14605,10182,10155,10199,'Test Test','2015-08-31 17:57:40','2015-08-31 17:57:40',10116,14603,'e472f204-b114-43f5-873e-0a3ef05f40f2',0,0,NULL,NULL,NULL,NULL,'text/html','14601','','','','',0,0,0,0),(15802,10195,10155,10159,'','2015-09-16 18:02:00','2015-09-16 18:46:32',10001,10182,'',0,0,NULL,NULL,NULL,NULL,'','WhiteHall Finance','','','','',0,0,0,0),(17602,10182,10155,10199,'Gautam Sharma','2015-10-22 17:39:55','2015-10-22 17:39:55',10012,17601,'0d2c49d1-6c21-4f8f-bfef-d284949fdcc7',0,1,NULL,NULL,NULL,NULL,'','Insurance','Insurance','','','',0,0,0,0),(17706,10182,10155,10199,'Gautam Sharma','2015-10-22 19:29:05','2015-10-22 19:29:05',10012,17705,'377dd1cc-4c75-4d30-8295-b987640ab475',0,1,NULL,NULL,NULL,NULL,'','10','Trade Insurance Folder','','','',0,0,0,0),(17711,10182,10155,10199,'Gautam Sharma','2015-10-22 19:29:07','2015-10-22 19:29:07',10011,17709,'f0f9261c-f936-4d55-8bd7-c439181af63b',0,1,NULL,NULL,NULL,NULL,'text/plain','faq_page (1).txt','faq_page (1).txt','','','',0,0,0,1),(17714,10182,10155,10199,'Gautam Sharma','2015-10-22 19:29:07','2015-10-22 19:29:07',10116,17712,'573fdf46-681a-4422-b6e6-0bccd6995835',0,0,NULL,NULL,NULL,NULL,'text/html','17709','','','','',0,0,0,0),(17724,10182,10155,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55',10012,17723,'cc8dbc70-da56-4c54-abd4-13ad1b7de62a',0,1,NULL,NULL,NULL,NULL,'','11','Trade Insurance Folder','','','',0,0,0,0),(17729,10182,10155,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55',10011,17727,'2f1c5ccf-9a97-4064-9582-95f72f57800b',0,1,NULL,NULL,NULL,NULL,'text/plain','faq_page.txt','faq_page.txt','','','',0,0,0,0),(17732,10182,10155,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55',10116,17730,'843a9d39-f49c-4ae3-bb11-3ef3141628dc',0,0,NULL,NULL,NULL,NULL,'text/html','17727','','','','',0,0,0,0),(18005,10182,10155,10199,'Gautam Sharma','2015-10-31 19:21:13','2015-10-31 19:21:13',10116,18003,'03ad2941-98f2-4ebe-93f5-56a6583fcd94',0,0,NULL,NULL,NULL,NULL,'text/html','18001','','','','',0,0,0,0),(18325,10182,10155,10199,'Gautam Sharma','2015-11-02 17:54:21','2015-11-02 17:54:21',10012,18324,'930f8558-2eb8-4b3d-867d-59a39753364a',0,1,NULL,NULL,NULL,NULL,'','12','Trade Insurance Folder','','','',0,0,0,0),(18330,10182,10155,10199,'Gautam Sharma','2015-11-02 17:54:21','2015-11-02 17:54:21',10011,18328,'59eba706-a80e-4067-a8b9-37a83f24aa3a',0,1,NULL,NULL,NULL,NULL,'application/pdf','Covering Letter.pdf','Covering Letter.pdf','','','',0,0,0,0),(18333,10182,10155,10199,'Gautam Sharma','2015-11-02 17:54:21','2015-11-02 17:54:21',10116,18331,'20fca4e6-3d7c-466a-9fe4-0948eecdcf0a',0,0,NULL,NULL,NULL,NULL,'text/html','18328','','','','',0,0,0,0),(18343,10182,10155,17001,'Colin LEVINS','2015-11-02 18:08:28','2015-11-02 18:08:28',10012,18342,'4d377d4f-aac6-4698-88bb-e6fcb641ed77',0,1,NULL,NULL,NULL,NULL,'','13','Trade Insurance Folder','','','',0,0,0,0),(18348,10182,10155,17001,'Colin LEVINS','2015-11-02 18:08:28','2015-11-02 18:08:28',10011,18346,'8f61a626-4e3b-4e06-ae6e-b16475d819c9',0,1,NULL,NULL,NULL,NULL,'application/pdf','Covering Letter.pdf','Covering Letter.pdf','','','',0,0,0,0),(18351,10182,10155,17001,'Colin LEVINS','2015-11-02 18:08:28','2015-11-02 18:08:28',10116,18349,'41243804-ebdf-48e7-9f1f-e75de8f16875',0,0,NULL,NULL,NULL,NULL,'text/html','18346','','','','',0,0,0,0),(18361,10182,10155,10199,'Gautam Sharma','2015-11-02 18:17:34','2015-11-02 18:17:34',10012,18360,'e7088430-15e2-4c76-8cb4-e2384b8e145e',0,1,NULL,NULL,NULL,NULL,'','14','Trade Insurance Folder','','','',0,0,0,0),(18366,10182,10155,10199,'Gautam Sharma','2015-11-02 18:17:34','2015-11-02 18:17:34',10011,18364,'7c49521f-b4af-4ee4-a8c7-0f715212f9c0',0,1,NULL,NULL,NULL,NULL,'application/pdf','Covering Letter.pdf','Covering Letter.pdf','','','',0,0,0,0),(18369,10182,10155,10199,'Gautam Sharma','2015-11-02 18:17:34','2015-11-02 18:17:34',10116,18367,'500b2918-e975-41f1-a427-6864d4a5896d',0,0,NULL,NULL,NULL,NULL,'text/html','18364','','','','',0,0,0,0),(18406,10182,10155,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15',10012,18405,'7e2440c2-ef73-45cc-ae3d-3465313ab952',0,1,NULL,NULL,NULL,NULL,'','15','Trade Insurance Folder','','','',0,0,0,0),(18411,10182,10155,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15',10011,18409,'4f099e3d-4255-4f58-83e4-a8daa0c33afc',0,1,NULL,NULL,NULL,NULL,'application/pdf','Covering Letter.pdf','Covering Letter.pdf','','','',0,0,0,3),(18414,10182,10155,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15',10116,18412,'41854380-a640-4942-9526-d7b3f5d164cd',0,0,NULL,NULL,NULL,NULL,'text/html','18409','','','','',0,0,0,0),(19182,10182,10155,17001,'Colin LEVINS','2015-12-27 17:31:39','2015-12-27 17:31:39',10012,19181,'fe61fea1-a8de-44e6-bbdb-0dc460b92a2a',0,1,NULL,NULL,NULL,NULL,'','0','Invoices Document Folder','','','',0,0,0,0),(19187,10182,10155,17001,'Colin LEVINS','2015-12-27 17:31:40','2015-12-27 17:31:40',10011,19185,'4976b1d8-0731-4404-9ce1-5ec520a71252',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','','','',0,0,0,0),(19190,10182,10155,17001,'Colin LEVINS','2015-12-27 17:31:40','2015-12-27 17:31:40',10116,19188,'50d82e18-7e9c-4f69-a665-4fb67a8f1fda',0,0,NULL,NULL,NULL,NULL,'text/html','19185','','','','',0,0,0,0),(19200,10182,10155,17001,'Colin LEVINS','2015-12-27 17:41:25','2015-12-27 17:41:25',10012,19199,'31aa124f-713c-4439-aab2-a765a20fe8b6',0,1,NULL,NULL,NULL,NULL,'','1','Invoices Document Folder','','','',0,0,0,0),(19205,10182,10155,17001,'Colin LEVINS','2015-12-27 17:41:25','2015-12-27 17:41:25',10011,19203,'1aa05a74-a0f8-4801-b3c1-967d3cb7c99d',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','','','',0,0,0,0),(19208,10182,10155,17001,'Colin LEVINS','2015-12-27 17:41:25','2015-12-27 17:41:25',10116,19206,'88daf304-9cf5-483e-b27a-859896230284',0,0,NULL,NULL,NULL,NULL,'text/html','19203','','','','',0,0,0,0),(19218,10182,10155,17001,'Colin LEVINS','2015-12-27 17:57:04','2015-12-27 17:57:04',10012,19217,'e40620ff-83a9-4fd2-9c42-760bbb35b015',0,1,NULL,NULL,NULL,NULL,'','2','Invoices Document Folder','','','',0,0,0,0),(19223,10182,10155,17001,'Colin LEVINS','2015-12-27 17:57:05','2015-12-27 17:57:05',10011,19221,'372ebab2-d19d-4ecd-890b-524d47e80668',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','','','',0,0,0,0),(19226,10182,10155,17001,'Colin LEVINS','2015-12-27 17:57:05','2015-12-27 17:57:05',10116,19224,'41b9b06d-d7a0-4b4f-bb46-53ab83ebfc28',0,0,NULL,NULL,NULL,NULL,'text/html','19221','','','','',0,0,0,0),(19276,10182,10155,17001,'Colin LEVINS','2015-12-27 20:22:37','2015-12-27 20:22:37',10012,19275,'832642d5-9261-4104-b28e-92ea383fc7a3',0,1,NULL,NULL,NULL,NULL,'','3','Invoices Document Folder','','','',0,0,0,0),(19281,10182,10155,17001,'Colin LEVINS','2015-12-27 20:22:37','2015-12-27 20:22:37',10011,19279,'026b9efb-b044-456c-b3b9-129746e700d6',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','','','',0,0,0,1),(19284,10182,10155,17001,'Colin LEVINS','2015-12-27 20:22:37','2015-12-27 20:22:37',10116,19282,'7ad395f5-20f3-4e23-8a52-bac458043336',0,0,NULL,NULL,NULL,NULL,'text/html','19279','','','','',0,0,0,0),(19295,10182,10155,17001,'Colin LEVINS','2015-12-27 20:35:39','2015-12-27 20:35:39',10012,19294,'9036ac98-7ebb-453f-b718-8b77e23b5167',0,1,NULL,NULL,NULL,NULL,'','4','Invoices Document Folder','','','',0,0,0,0),(19300,10182,10155,17001,'Colin LEVINS','2015-12-27 20:35:39','2015-12-27 20:35:39',10011,19298,'0d4ec121-4f11-4cba-94cb-7dfaf9e1a4f9',0,1,NULL,NULL,NULL,NULL,'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','','','',0,0,0,1),(19303,10182,10155,17001,'Colin LEVINS','2015-12-27 20:35:39','2015-12-27 20:35:39',10116,19301,'3fb5e091-7a9f-4d8a-bf55-1f6dc777b465',0,0,NULL,NULL,NULL,NULL,'text/html','19298','','','','',0,0,0,0),(20005,10182,10155,10199,'Gautam Sharma','2016-01-16 20:46:18','2016-01-16 20:46:18',10116,20003,'2954bb0d-e903-4d28-900e-e3794b7647e8',0,0,NULL,NULL,NULL,NULL,'text/html','20001','','','','',0,0,0,0),(20307,10195,10155,10159,'','2016-01-19 21:32:49','2016-01-19 21:32:49',10005,20301,'1b0c36cf-c970-4cdc-9cab-b47b28ad3b2f',0,0,NULL,NULL,NULL,NULL,'','Primary Investor1','','','','',0,0,0,0),(20312,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:27','2016-01-19 21:34:27',10116,20310,'31444a9c-b017-41bc-a9ee-efc33099ff82',0,0,NULL,NULL,NULL,NULL,'text/html','20308','','','','',0,0,0,0),(20318,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:28','2016-01-19 21:34:28',10116,20316,'24be1e7f-0a54-4b5f-a128-8f1864a42547',0,0,NULL,NULL,NULL,NULL,'text/html','20314','','','','',0,0,0,0),(20407,10195,10155,10199,'Gautam Sharma','2016-01-23 18:57:44','2016-01-23 18:57:44',10005,20401,'faae499b-9b16-487a-9ae1-eebef20ed74c',0,0,NULL,NULL,NULL,NULL,'','primary prInvestor2','','','','',0,0,0,0),(20412,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:43','2016-01-23 18:58:43',10116,20410,'a6b2164f-34b1-4d21-8c48-7062024e1a5f',0,0,NULL,NULL,NULL,NULL,'text/html','20408','','','','',0,0,0,0),(20418,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:44','2016-01-23 18:58:44',10116,20416,'68051c63-cf27-4477-8c49-22fbc0528efc',0,0,NULL,NULL,NULL,NULL,'text/html','20414','','','','',0,0,0,0),(20427,10195,10155,10199,'Gautam Sharma','2016-01-23 19:02:23','2016-01-23 19:02:23',10005,20421,'586c10a9-f104-428a-b596-b1f944062bcf',0,0,NULL,NULL,NULL,NULL,'','primary Investor3','','','','',0,0,0,0),(20432,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',10116,20430,'8c45c011-4249-4394-ac02-e628caab5e69',0,0,NULL,NULL,NULL,NULL,'text/html','20428','','','','',0,0,0,0),(20438,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',10116,20436,'cfca73ef-38a5-48b6-86c5-dc4ce7f29589',0,0,NULL,NULL,NULL,NULL,'text/html','20434','','','','',0,0,0,0),(20447,10195,10155,10199,'Gautam Sharma','2016-01-23 19:06:02','2016-01-23 19:06:02',10005,20441,'48c66aff-ab75-448c-81a1-90ad596a255b',0,0,NULL,NULL,NULL,NULL,'','primary Investor4','','','','',0,0,0,0),(20452,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',10116,20450,'0a36d607-7f28-4b5a-a8c8-2c77bafa8bfc',0,0,NULL,NULL,NULL,NULL,'text/html','20448','','','','',0,0,0,0),(20458,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',10116,20456,'e02b3e5d-655b-4dd2-9d08-73a16caac69e',0,0,NULL,NULL,NULL,NULL,'text/html','20454','','','','',0,0,0,0),(20467,10195,10155,10159,'','2016-01-23 19:13:36','2016-01-23 19:13:36',10005,20461,'578969fc-cec6-4a6e-a7f6-4355cd8199b9',0,0,NULL,NULL,NULL,NULL,'','SCF Company1','','','','',0,0,0,0),(20472,20464,10155,20461,'SCF Company1','2016-01-23 19:14:01','2016-01-23 19:14:01',10116,20470,'bd364dcb-212d-4fa7-aa2c-6f67af819667',0,0,NULL,NULL,NULL,NULL,'text/html','20468','','','','',0,0,0,0),(20478,20464,10155,20461,'SCF Company1','2016-01-23 19:14:02','2016-01-23 19:14:02',10116,20476,'b3689d65-6acf-4bad-a2e3-c3248a74dc41',0,0,NULL,NULL,NULL,NULL,'text/html','20474','','','','',0,0,0,0),(20512,10195,10155,10199,'Gautam Sharma','2016-01-23 20:49:59','2016-01-23 20:49:59',10005,20506,'699e7735-35ff-4ac0-83a9-a0f6c8ce7460',0,0,NULL,NULL,NULL,NULL,'','SCF Company2','','','','',0,0,0,0),(20517,20509,10155,20506,'SCF Company2','2016-01-23 20:58:41','2016-01-23 20:58:41',10116,20515,'a03e12da-ca0b-434e-9e8e-60672533d933',0,0,NULL,NULL,NULL,NULL,'text/html','20513','','','','',0,0,0,0),(20523,20509,10155,20506,'SCF Company2','2016-01-23 20:58:42','2016-01-23 20:58:42',10116,20521,'c19c49da-6034-496f-9422-dffe043eeef0',0,0,NULL,NULL,NULL,NULL,'text/html','20519','','','','',0,0,0,0),(20533,10195,10155,10199,'Gautam Sharma','2016-01-23 21:01:29','2016-01-23 21:01:29',10005,20527,'6bfe16a6-ce49-477b-9f04-9cc24d2a1c52',0,0,NULL,NULL,NULL,NULL,'','SCF Company3','','','','',0,0,0,0),(20538,20530,10155,20527,'SCF Company3','2016-01-23 21:01:53','2016-01-23 21:01:53',10116,20536,'8eb99458-688f-41c9-8476-d20a01dccd49',0,0,NULL,NULL,NULL,NULL,'text/html','20534','','','','',0,0,0,0),(20544,20530,10155,20527,'SCF Company3','2016-01-23 21:01:54','2016-01-23 21:01:54',10116,20542,'27490650-928a-47af-835d-bad73fc30039',0,0,NULL,NULL,NULL,NULL,'text/html','20540','','','','',0,0,0,0),(20553,10195,10155,10159,'','2016-01-23 21:09:17','2016-01-23 21:09:17',10005,20547,'26e9d8c4-2fa5-4e35-a0be-b60ec72d8dc0',0,0,NULL,NULL,NULL,NULL,'','seller 1','','','','',0,0,0,0),(20558,20550,10155,20547,'seller 1','2016-01-23 21:09:37','2016-01-23 21:09:37',10116,20556,'879c44de-9d66-4ac4-90b8-7b02d1cbe03a',0,0,NULL,NULL,NULL,NULL,'text/html','20554','','','','',0,0,0,0),(20564,20550,10155,20547,'seller 1','2016-01-23 21:09:38','2016-01-23 21:09:38',10116,20562,'1f3de588-1923-4840-b335-4f5f0ea6fc55',0,0,NULL,NULL,NULL,NULL,'text/html','20560','','','','',0,0,0,0),(20573,10195,10155,10199,'Gautam Sharma','2016-01-23 21:14:10','2016-01-23 21:14:10',10005,20567,'a6d525f7-b79a-4f92-a810-0f1b6f6b149b',0,0,NULL,NULL,NULL,NULL,'','Seller 2','','','','',0,0,0,0),(20578,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',10116,20576,'61b9b44e-4083-4871-a2f0-17be70ac4b52',0,0,NULL,NULL,NULL,NULL,'text/html','20574','','','','',0,0,0,0),(20584,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',10116,20582,'c8e83b4e-78fe-4e65-ac4b-24d4e7586feb',0,0,NULL,NULL,NULL,NULL,'text/html','20580','','','','',0,0,0,0);

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

insert  into `assetvocabulary`(`uuid_`,`vocabularyId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`title`,`description`,`settings_`) values ('5857bd22-e867-4d18-ac33-694238c537f6',10325,10195,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45','Topic','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic</Title></root>','',''),('3626f241-1afc-42e7-bbfa-bd8b371afad2',11415,10182,10155,10159,'','2015-08-03 19:09:28','2015-08-03 19:09:28','Topic','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic</Title></root>','',''),('b8c13a99-9288-4798-8477-caee12ecf06d',11416,10182,10155,10159,'','2015-08-03 19:09:28','2015-08-03 19:09:28','Topic','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Topic</Title></root>','','');

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

insert  into `backgroundtask`(`backgroundTaskId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`servletContextNames`,`taskExecutorClassName`,`taskContext`,`completed`,`completionDate`,`status`,`statusMessage`) values (13222,10182,10155,10199,'Test Test','2015-08-13 21:47:22','2015-08-13 21:47:36','Private_Pages-201508132146.lar','','com.liferay.portal.lar.backgroundtask.LayoutExportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"export\",\"parameterMap\":{\"map\":{\"startDateMinute\":[\"46\"],\"_journal_structures\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"THEME_REFERENCE\":[\"true\"],\"last\":[\"12\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"endDateMonth\":[\"7\"],\"endDate\":[\"08/13/2015\"],\"endTime\":[\"09:46 PM\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"PORTLET_SETUP_tfdashboardportlet_WAR_tfdashboardportlet\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"formDate\":[\"1439502365131\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"startTime\":[\"09:46 PM\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"endDateDay\":[\"13\"],\"endDateMinute\":[\"46\"],\"RATINGS\":[\"true\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"layoutIds\":[\"[]\"],\"LOGO\":[\"true\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_167\":[\"false\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"false\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"endDateYear\":[\"2015\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"PORTLET_DATA_15\":[\"true\"],\"startDateAmPm\":[\"1\"],\"PORTLET_CONFIGURATION_tfdashboardportlet_WAR_tfdashboardportlet\":[\"true\"],\"COMMENTS\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_CONFIGURATION_tfpoportlet_WAR_tfpoportletCheckbox\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"_document_library_documents\":[\"true\"],\"cmd\":[\"export\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"PORTLET_SETUP_tfpoportlet_WAR_tfpoportlet\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_tfpoportlet_WAR_tfpoportlet\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"struts_action\":[\"/group_pages/export_layouts\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"startDateHour\":[\"9\"],\"exportFileName\":[\"Private_Pages-201508132146.lar\"],\"PORTLET_SETUP_tfpoportlet_WAR_tfpoportletCheckbox\":[\"true\"],\"CATEGORIESCheckbox\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"DELETIONS\":[\"false\"],\"startDate\":[\"08/12/2015\"],\"startDateTime\":[\"Wed Aug 12 21:46:07 GMT 2015\",\"Thu Aug 13 21:46:07 GMT 2015\"],\"PERMISSIONSCheckbox\":[\"false\"],\"range\":[\"all\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"exportLAR\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"startDateDay\":[\"12\"],\"startDateYear\":[\"2015\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=TWtp9UMx&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=13001&controlPanelCategory=current_site.pages&_156_struts_action=%2Fgroup_pages%2Fexport_layouts&_156_tabs2=current-and-previous&_156_groupId=10182&_156_liveGroupId=10182&_156_privateLayout=true&_156_rootNodeName=Private+Pages\"],\"_journal_structuresCheckbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"endDateHour\":[\"9\"],\"_journal_web-contentCheckbox\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"startDateMonth\":[\"7\"],\"PORTLET_DATA\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"PORTLET_SETUP_tfdashboardportlet_WAR_tfdashboardportletCheckbox\":[\"true\"],\"groupId\":[\"10182\"],\"PORTLET_CONFIGURATION_tfdashboardportlet_WAR_tfdashboardportletCheckbox\":[\"true\"],\"CATEGORIES\":[\"true\"],\"endDateAmPm\":[\"1\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"privateLayout\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"Private_Pages-201508132146.lar\",\"privateLayout\":true},\"javaClass\":\"java.util.HashMap\"}',1,'2015-08-13 21:47:36',3,''),(13231,10182,10155,10199,'Test Test','2015-08-13 21:47:58','2015-08-13 21:48:00','Public_Pages-201508132147.lar','','com.liferay.portal.lar.backgroundtask.LayoutExportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"export\",\"parameterMap\":{\"map\":{\"startDateMinute\":[\"47\"],\"THEME_REFERENCE\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"_journal_structures\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"PORTLET_SETUP_58Checkbox\":[\"true\"],\"last\":[\"12\"],\"_journal_web-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"endDateMonth\":[\"7\"],\"endDate\":[\"08/13/2015\"],\"endTime\":[\"09:47 PM\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"formDate\":[\"1439502472834\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"startTime\":[\"09:47 PM\"],\"endDateDay\":[\"13\"],\"endDateMinute\":[\"47\"],\"RATINGS\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"layoutIds\":[\"[]\"],\"LOGO\":[\"true\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_167\":[\"false\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"false\"],\"endDateYear\":[\"2015\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"startDateAmPm\":[\"1\"],\"PORTLET_DATA_15\":[\"true\"],\"COMMENTS\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_SETUP_58\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"_document_library_documents\":[\"true\"],\"cmd\":[\"export\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"struts_action\":[\"/group_pages/export_layouts\"],\"startDateHour\":[\"9\"],\"exportFileName\":[\"Public_Pages-201508132147.lar\"],\"CATEGORIESCheckbox\":[\"true\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"DELETIONS\":[\"false\"],\"startDate\":[\"08/12/2015\"],\"range\":[\"all\"],\"PERMISSIONSCheckbox\":[\"false\"],\"startDateTime\":[\"Wed Aug 12 21:47:52 GMT 2015\",\"Thu Aug 13 21:47:52 GMT 2015\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"exportLAR\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"startDateDay\":[\"12\"],\"startDateYear\":[\"2015\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=TWtp9UMx&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=13001&controlPanelCategory=current_site.pages&_156_struts_action=%2Fgroup_pages%2Fexport_layouts&_156_tabs2=current-and-previous&_156_groupId=10182&_156_liveGroupId=10182&_156_privateLayout=false&_156_rootNodeName=Public+Pages\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_58Checkbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"_journal_web-contentCheckbox\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"endDateHour\":[\"9\"],\"startDateMonth\":[\"7\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"groupId\":[\"10182\"],\"CATEGORIES\":[\"true\"],\"endDateAmPm\":[\"1\"],\"PORTLET_CONFIGURATION_58\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"privateLayout\":[\"false\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"Public_Pages-201508132147.lar\",\"privateLayout\":false},\"javaClass\":\"java.util.HashMap\"}',1,'2015-08-13 21:48:00',3,''),(14001,10182,10155,10199,'Test Test','2015-08-23 07:22:23','2015-08-23 07:22:37','Public_Pages-201508230722.lar','','com.liferay.portal.lar.backgroundtask.LayoutExportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"export\",\"parameterMap\":{\"map\":{\"startDateMinute\":[\"22\"],\"THEME_REFERENCE\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"_journal_structures\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"PORTLET_SETUP_58Checkbox\":[\"true\"],\"last\":[\"12\"],\"_journal_web-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"endDateMonth\":[\"7\"],\"endDate\":[\"08/23/2015\"],\"endTime\":[\"07:22 AM\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"formDate\":[\"1440314522890\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"startTime\":[\"07:22 AM\"],\"endDateDay\":[\"23\"],\"endDateMinute\":[\"22\"],\"RATINGS\":[\"true\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"LOGO\":[\"true\"],\"layoutIds\":[\"[]\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_167\":[\"false\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"false\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"endDateYear\":[\"2015\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"startDateAmPm\":[\"0\"],\"PORTLET_DATA_15\":[\"true\"],\"COMMENTS\":[\"true\"],\"PORTLET_SETUP_58\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"_document_library_documents\":[\"true\"],\"cmd\":[\"export\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"struts_action\":[\"/group_pages/export_layouts\"],\"startDateHour\":[\"7\"],\"exportFileName\":[\"Public_Pages-201508230722.lar\"],\"CATEGORIESCheckbox\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"DELETIONS\":[\"false\"],\"startDate\":[\"08/22/2015\"],\"range\":[\"all\"],\"PERMISSIONSCheckbox\":[\"false\"],\"startDateTime\":[\"Sat Aug 22 07:22:07 GMT 2015\",\"Sun Aug 23 07:22:07 GMT 2015\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"exportLAR\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"startDateDay\":[\"22\"],\"startDateYear\":[\"2015\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=iQT0WtY4&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=12922&controlPanelCategory=sites&_156_struts_action=%2Fgroup_pages%2Fexport_layouts&_156_tabs2=current-and-previous&_156_groupId=10182&_156_liveGroupId=10182&_156_privateLayout=false&_156_rootNodeName=Public+Pages\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_58Checkbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"endDateHour\":[\"7\"],\"_journal_web-contentCheckbox\":[\"true\"],\"startDateMonth\":[\"7\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"groupId\":[\"10182\"],\"CATEGORIES\":[\"true\"],\"endDateAmPm\":[\"0\"],\"PORTLET_CONFIGURATION_58\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"privateLayout\":[\"false\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"Public_Pages-201508230722.lar\",\"privateLayout\":false},\"javaClass\":\"java.util.HashMap\"}',1,'2015-08-23 07:22:37',3,''),(14006,10182,10155,10199,'Test Test','2015-08-23 07:23:00','2015-08-23 07:23:02','Public_Pages-201508230722.lar','','com.liferay.portal.lar.backgroundtask.LayoutExportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"export\",\"parameterMap\":{\"map\":{\"startDateMinute\":[\"22\"],\"THEME_REFERENCE\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"_journal_structures\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"PORTLET_SETUP_58Checkbox\":[\"true\"],\"last\":[\"12\"],\"_journal_web-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"endDateMonth\":[\"7\"],\"endDate\":[\"08/23/2015\"],\"endTime\":[\"07:22 AM\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"formDate\":[\"1440314576806\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"startTime\":[\"07:22 AM\"],\"endDateDay\":[\"23\"],\"endDateMinute\":[\"22\"],\"RATINGS\":[\"true\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"LOGO\":[\"true\"],\"layoutIds\":[\"[]\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_167\":[\"false\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"false\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"endDateYear\":[\"2015\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"startDateAmPm\":[\"0\"],\"PORTLET_DATA_15\":[\"true\"],\"COMMENTS\":[\"true\"],\"PORTLET_SETUP_58\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"_document_library_documents\":[\"true\"],\"cmd\":[\"export\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"struts_action\":[\"/group_pages/export_layouts\"],\"startDateHour\":[\"7\"],\"exportFileName\":[\"Public_Pages-201508230722.lar\"],\"CATEGORIESCheckbox\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"DELETIONS\":[\"false\"],\"startDate\":[\"08/22/2015\"],\"range\":[\"all\"],\"PERMISSIONSCheckbox\":[\"false\"],\"startDateTime\":[\"Sat Aug 22 07:22:56 GMT 2015\",\"Sun Aug 23 07:22:56 GMT 2015\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"exportLAR\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"startDateDay\":[\"22\"],\"startDateYear\":[\"2015\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=iQT0WtY4&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=12922&controlPanelCategory=sites&_156_struts_action=%2Fgroup_pages%2Fexport_layouts&_156_tabs2=current-and-previous&_156_groupId=10182&_156_liveGroupId=10182&_156_privateLayout=false&_156_rootNodeName=Public+Pages\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_58Checkbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"endDateHour\":[\"7\"],\"_journal_web-contentCheckbox\":[\"true\"],\"startDateMonth\":[\"7\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"groupId\":[\"10182\"],\"CATEGORIES\":[\"true\"],\"endDateAmPm\":[\"0\"],\"PORTLET_CONFIGURATION_58\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"privateLayout\":[\"false\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"Public_Pages-201508230722.lar\",\"privateLayout\":false},\"javaClass\":\"java.util.HashMap\"}',1,'2015-08-23 07:23:02',3,''),(14012,10182,10155,10199,'Test Test','2015-08-23 07:23:28','2015-08-23 07:23:29','Private_Pages-201508230723.lar','','com.liferay.portal.lar.backgroundtask.LayoutExportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"export\",\"parameterMap\":{\"map\":{\"startDateMinute\":[\"23\"],\"_journal_structures\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"THEME_REFERENCE\":[\"true\"],\"last\":[\"12\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"endDateMonth\":[\"7\"],\"endDate\":[\"08/23/2015\"],\"endTime\":[\"07:23 AM\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"PORTLET_SETUP_tfdashboardportlet_WAR_tfdashboardportlet\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"formDate\":[\"1440314602757\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"startTime\":[\"07:23 AM\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"endDateDay\":[\"23\"],\"endDateMinute\":[\"23\"],\"RATINGS\":[\"true\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"layoutIds\":[\"[]\"],\"LOGO\":[\"true\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_167\":[\"false\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"false\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"endDateYear\":[\"2015\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"PORTLET_DATA_15\":[\"true\"],\"startDateAmPm\":[\"0\"],\"PORTLET_CONFIGURATION_tfdashboardportlet_WAR_tfdashboardportlet\":[\"true\"],\"COMMENTS\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_CONFIGURATION_tfpoportlet_WAR_tfpoportletCheckbox\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"_document_library_documents\":[\"true\"],\"cmd\":[\"export\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"PORTLET_SETUP_tfpoportlet_WAR_tfpoportlet\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_tfpoportlet_WAR_tfpoportlet\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"struts_action\":[\"/group_pages/export_layouts\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"startDateHour\":[\"7\"],\"exportFileName\":[\"Private_Pages-201508230723.lar\"],\"PORTLET_SETUP_tfpoportlet_WAR_tfpoportletCheckbox\":[\"true\"],\"CATEGORIESCheckbox\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"DELETIONS\":[\"false\"],\"startDate\":[\"08/22/2015\"],\"startDateTime\":[\"Sat Aug 22 07:23:23 GMT 2015\",\"Sun Aug 23 07:23:23 GMT 2015\"],\"PERMISSIONSCheckbox\":[\"false\"],\"range\":[\"all\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"exportLAR\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"startDateDay\":[\"22\"],\"startDateYear\":[\"2015\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=iQT0WtY4&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=12922&controlPanelCategory=sites&_156_struts_action=%2Fgroup_pages%2Fexport_layouts&_156_tabs2=current-and-previous&_156_groupId=10182&_156_liveGroupId=10182&_156_privateLayout=true&_156_rootNodeName=Private+Pages\"],\"_journal_structuresCheckbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"endDateHour\":[\"7\"],\"_journal_web-contentCheckbox\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"startDateMonth\":[\"7\"],\"PORTLET_DATA\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"PORTLET_SETUP_tfdashboardportlet_WAR_tfdashboardportletCheckbox\":[\"true\"],\"groupId\":[\"10182\"],\"PORTLET_CONFIGURATION_tfdashboardportlet_WAR_tfdashboardportletCheckbox\":[\"true\"],\"CATEGORIES\":[\"true\"],\"endDateAmPm\":[\"0\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"privateLayout\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"Private_Pages-201508230723.lar\",\"privateLayout\":true},\"javaClass\":\"java.util.HashMap\"}',1,'2015-08-23 07:23:29',3,''),(15601,10182,10155,10199,'Test Test','2015-09-14 19:42:30','2015-09-14 19:42:35','Public_Pages-201509141942.lar','','com.liferay.portal.lar.backgroundtask.LayoutExportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"export\",\"parameterMap\":{\"map\":{\"startDateMinute\":[\"42\"],\"THEME_REFERENCE\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"_journal_structures\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"PORTLET_SETUP_58Checkbox\":[\"true\"],\"last\":[\"12\"],\"_journal_web-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"endDateMonth\":[\"8\"],\"endDate\":[\"09/14/2015\"],\"endTime\":[\"07:42 PM\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"formDate\":[\"1442259738790\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"startTime\":[\"07:42 PM\"],\"endDateDay\":[\"14\"],\"endDateMinute\":[\"42\"],\"RATINGS\":[\"true\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"LOGO\":[\"true\"],\"layoutIds\":[\"[]\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_167\":[\"false\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"false\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"endDateYear\":[\"2015\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"startDateAmPm\":[\"1\"],\"PORTLET_DATA_15\":[\"true\"],\"COMMENTS\":[\"true\"],\"PORTLET_SETUP_58\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"_document_library_documents\":[\"true\"],\"cmd\":[\"export\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"struts_action\":[\"/group_pages/export_layouts\"],\"startDateHour\":[\"7\"],\"exportFileName\":[\"Public_Pages-201509141942.lar\"],\"CATEGORIESCheckbox\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"DELETIONS\":[\"false\"],\"startDate\":[\"09/13/2015\"],\"range\":[\"all\"],\"PERMISSIONSCheckbox\":[\"false\"],\"startDateTime\":[\"Sun Sep 13 19:42:19 GMT 2015\",\"Mon Sep 14 19:42:19 GMT 2015\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"exportLAR\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"startDateDay\":[\"13\"],\"startDateYear\":[\"2015\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=j2KcDyAg&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=12922&controlPanelCategory=sites&_156_struts_action=%2Fgroup_pages%2Fexport_layouts&_156_tabs2=current-and-previous&_156_groupId=10182&_156_liveGroupId=10182&_156_privateLayout=false&_156_rootNodeName=Public+Pages\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_58Checkbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"endDateHour\":[\"7\"],\"_journal_web-contentCheckbox\":[\"true\"],\"startDateMonth\":[\"8\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"groupId\":[\"10182\"],\"CATEGORIES\":[\"true\"],\"endDateAmPm\":[\"1\"],\"PORTLET_CONFIGURATION_58\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"privateLayout\":[\"false\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"Public_Pages-201509141942.lar\",\"privateLayout\":false},\"javaClass\":\"java.util.HashMap\"}',1,'2015-09-14 19:42:35',3,''),(15607,10182,10155,10199,'Test Test','2015-09-14 19:42:54','2015-09-14 19:42:56','Private_Pages-201509141942.lar','','com.liferay.portal.lar.backgroundtask.LayoutExportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"export\",\"parameterMap\":{\"map\":{\"startDateMinute\":[\"42\"],\"PORTLET_CONFIGURATION_scftradeportlet_WAR_scftradeportlet\":[\"true\"],\"endDateMonth\":[\"8\"],\"endDate\":[\"09/14/2015\"],\"PORTLET_SETUP_tfdashboardportlet_WAR_tfdashboardportlet\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"startTime\":[\"07:42 PM\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"LOGO\":[\"true\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"false\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"endDateYear\":[\"2015\"],\"PORTLET_SETUP_scfinvoiceportlet_WAR_scfinvoiceportletCheckbox\":[\"true\"],\"startDateAmPm\":[\"1\"],\"COMMENTS\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_CONFIGURATION_tfpoportlet_WAR_tfpoportletCheckbox\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"cmd\":[\"export\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"PORTLET_SETUP_tfpoportlet_WAR_tfpoportlet\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_tfpoportlet_WAR_tfpoportlet\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_scfinvoiceportlet_WAR_scfinvoiceportletCheckbox\":[\"true\"],\"PORTLET_SETUP_tfpoportlet_WAR_tfpoportletCheckbox\":[\"true\"],\"exportFileName\":[\"Private_Pages-201509141942.lar\"],\"CATEGORIESCheckbox\":[\"true\"],\"startDate\":[\"09/13/2015\"],\"range\":[\"all\"],\"PERMISSIONSCheckbox\":[\"false\"],\"startDateTime\":[\"Sun Sep 13 19:42:48 GMT 2015\",\"Mon Sep 14 19:42:48 GMT 2015\"],\"exportLAR\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"startDateYear\":[\"2015\"],\"_journal_structuresCheckbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"startDateMonth\":[\"8\"],\"PORTLET_SETUP_scftradeportlet_WAR_scftradeportlet\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"groupId\":[\"10182\"],\"PORTLET_SETUP_scfinvoiceportlet_WAR_scfinvoiceportlet\":[\"true\"],\"endDateAmPm\":[\"1\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"_journal_structures\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"THEME_REFERENCE\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"last\":[\"12\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"endTime\":[\"07:42 PM\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"formDate\":[\"1442259767851\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"endDateDay\":[\"14\"],\"endDateMinute\":[\"42\"],\"RATINGS\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"layoutIds\":[\"[]\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_scfinvoiceportlet_WAR_scfinvoiceportlet\":[\"true\"],\"PORTLET_DATA_167\":[\"false\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"PORTLET_DATA_15\":[\"true\"],\"PORTLET_CONFIGURATION_tfdashboardportlet_WAR_tfdashboardportlet\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"_document_library_documents\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"struts_action\":[\"/group_pages/export_layouts\"],\"startDateHour\":[\"7\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"DELETIONS\":[\"false\"],\"PORTLET_CONFIGURATION_scftradeportlet_WAR_scftradeportletCheckbox\":[\"true\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"startDateDay\":[\"13\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=j2KcDyAg&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=12922&controlPanelCategory=sites&_156_struts_action=%2Fgroup_pages%2Fexport_layouts&_156_tabs2=current-and-previous&_156_groupId=10182&_156_liveGroupId=10182&_156_privateLayout=true&_156_rootNodeName=Private+Pages\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"endDateHour\":[\"7\"],\"_journal_web-contentCheckbox\":[\"true\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_SETUP_tfdashboardportlet_WAR_tfdashboardportletCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_tfdashboardportlet_WAR_tfdashboardportletCheckbox\":[\"true\"],\"CATEGORIES\":[\"true\"],\"privateLayout\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_SETUP_scftradeportlet_WAR_scftradeportletCheckbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"Private_Pages-201509141942.lar\",\"privateLayout\":true},\"javaClass\":\"java.util.HashMap\"}',1,'2015-09-14 19:42:56',3,''),(20601,10182,10155,10199,'Gautam Sharma','2016-01-25 04:53:49','2016-01-25 04:53:56','Public_Pages-201601250453.lar','','com.liferay.portal.lar.backgroundtask.LayoutExportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"export\",\"parameterMap\":{\"map\":{\"startDateMinute\":[\"53\"],\"THEME_REFERENCE\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"_journal_structures\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"PORTLET_SETUP_58Checkbox\":[\"true\"],\"last\":[\"12\"],\"_journal_web-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"endDateMonth\":[\"0\"],\"endDate\":[\"01/25/2016\"],\"endTime\":[\"04:53 AM\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"formDate\":[\"1453697615586\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"startTime\":[\"04:53 AM\"],\"endDateDay\":[\"25\"],\"endDateMinute\":[\"53\"],\"RATINGS\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"layoutIds\":[\"[]\"],\"LOGO\":[\"true\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_167\":[\"false\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"false\"],\"endDateYear\":[\"2016\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"startDateAmPm\":[\"0\"],\"PORTLET_DATA_15\":[\"true\"],\"COMMENTS\":[\"true\"],\"PORTLET_SETUP_58\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"_document_library_documents\":[\"true\"],\"PORTLET_SETUP_tfregistrationportlet_WAR_tfregistrationportletCheckbox\":[\"true\"],\"cmd\":[\"export\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"PORTLET_CONFIGURATION_tfregistrationportlet_WAR_tfregistrationportletCheckbox\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"struts_action\":[\"/group_pages/export_layouts\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"startDateHour\":[\"4\"],\"exportFileName\":[\"Public_Pages-201601250453.lar\"],\"CATEGORIESCheckbox\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"DELETIONS\":[\"false\"],\"startDate\":[\"01/24/2016\"],\"PORTLET_CONFIGURATION_tfregistrationportlet_WAR_tfregistrationportlet\":[\"true\"],\"range\":[\"all\"],\"PERMISSIONSCheckbox\":[\"false\"],\"startDateTime\":[\"Sun Jan 24 04:53:35 GMT 2016\",\"Mon Jan 25 04:53:35 GMT 2016\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"exportLAR\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"startDateDay\":[\"24\"],\"startDateYear\":[\"2016\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=bct2K2FK&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=12922&controlPanelCategory=sites&_156_struts_action=%2Fgroup_pages%2Fexport_layouts&_156_tabs2=current-and-previous&_156_groupId=10182&_156_liveGroupId=10182&_156_privateLayout=false&_156_rootNodeName=Public+Pages\"],\"PORTLET_SETUP_tfregistrationportlet_WAR_tfregistrationportlet\":[\"true\"],\"_journal_structuresCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_58Checkbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"endDateHour\":[\"4\"],\"_journal_web-contentCheckbox\":[\"true\"],\"startDateMonth\":[\"0\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"groupId\":[\"10182\"],\"CATEGORIES\":[\"true\"],\"endDateAmPm\":[\"0\"],\"PORTLET_CONFIGURATION_58\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"privateLayout\":[\"false\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"Public_Pages-201601250453.lar\",\"privateLayout\":false},\"javaClass\":\"java.util.HashMap\"}',1,'2016-01-25 04:53:56',3,''),(20607,10182,10155,10199,'Gautam Sharma','2016-01-25 04:54:26','2016-01-25 04:54:30','Private_Pages-201601250454.lar','','com.liferay.portal.lar.backgroundtask.LayoutExportBackgroundTaskExecutor','{\"map\":{\"groupId\":10182,\"cmd\":\"export\",\"parameterMap\":{\"map\":{\"startDateMinute\":[\"54\"],\"PORTLET_SETUP_tfsettingsportlet_WAR_tfsettingsportlet\":[\"true\"],\"PORTLET_CONFIGURATION_scftradeportlet_WAR_scftradeportlet\":[\"true\"],\"endDateMonth\":[\"0\"],\"endDate\":[\"01/25/2016\"],\"PORTLET_SETUP_tfdashboardportlet_WAR_tfdashboardportlet\":[\"true\"],\"PORTLET_ARCHIVED_SETUPS_ALL\":[\"true\"],\"startTime\":[\"04:54 AM\"],\"PORTLET_ARCHIVED_SETUPS_ALLCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"LOGO\":[\"true\"],\"PORTLET_DATA_1_WAR_calendarportlet\":[\"false\"],\"endDateYear\":[\"2016\"],\"PORTLET_CONFIGURATION_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"PORTLET_SETUP_scfinvoiceportlet_WAR_scfinvoiceportletCheckbox\":[\"true\"],\"startDateAmPm\":[\"0\"],\"COMMENTS\":[\"true\"],\"PORTLET_CONFIGURATION_tfpoportlet_WAR_tfpoportletCheckbox\":[\"true\"],\"_calendar_calendars\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportlet\":[\"true\"],\"cmd\":[\"export\"],\"PORTLET_SETUP_ALL\":[\"true\"],\"PORTLET_SETUP_tfpoportlet_WAR_tfpoportlet\":[\"true\"],\"RATINGSCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_tfpoportlet_WAR_tfpoportlet\":[\"true\"],\"_document_library_previews-and-thumbnailsCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_scfinvoiceportlet_WAR_scfinvoiceportletCheckbox\":[\"true\"],\"PORTLET_SETUP_tfpoportlet_WAR_tfpoportletCheckbox\":[\"true\"],\"exportFileName\":[\"Private_Pages-201601250454.lar\"],\"CATEGORIESCheckbox\":[\"true\"],\"startDate\":[\"01/24/2016\"],\"range\":[\"all\"],\"PERMISSIONSCheckbox\":[\"false\"],\"startDateTime\":[\"Sun Jan 24 04:54:17 GMT 2016\",\"Mon Jan 25 04:54:17 GMT 2016\"],\"exportLAR\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportletCheckbox\":[\"true\"],\"THEME_REFERENCECheckbox\":[\"true\"],\"PORTLET_DATA_ALL\":[\"true\"],\"_journal_version-history\":[\"true\"],\"_dynamic_data_lists_data-definitions\":[\"true\"],\"PORTLET_CONFIGURATION_scfinvestorportlet_WAR_scfinvestorportlet\":[\"true\"],\"LOGOCheckbox\":[\"true\"],\"startDateYear\":[\"2016\"],\"_journal_structuresCheckbox\":[\"true\"],\"_document_library_folders\":[\"true\"],\"PORTLET_SETUP_tfsettingsportlet_WAR_tfsettingsportletCheckbox\":[\"true\"],\"PORTLET_DATA_20Checkbox\":[\"true\"],\"PORTLET_DATA_20\":[\"true\"],\"startDateMonth\":[\"0\"],\"PORTLET_SETUP_scftradeportlet_WAR_scftradeportlet\":[\"true\"],\"PORTLET_DATA\":[\"true\"],\"LAYOUT_SET_SETTINGS\":[\"true\"],\"groupId\":[\"10182\"],\"PORTLET_CONFIGURATION_tfsettingsportlet_WAR_tfsettingsportletCheckbox\":[\"true\"],\"PORTLET_SETUP_scfinvoiceportlet_WAR_scfinvoiceportlet\":[\"true\"],\"endDateAmPm\":[\"0\"],\"PORTLET_DATA_CONTROL_DEFAULT\":[\"true\"],\"PORTLET_SETUP_ALLCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_scfinvestorportlet_WAR_scfinvestorportletCheckbox\":[\"true\"],\"THEME_REFERENCE\":[\"true\"],\"_journal_structures\":[\"true\"],\"COMMENTSCheckbox\":[\"true\"],\"_document_library_foldersCheckbox\":[\"true\"],\"last\":[\"12\"],\"_calendar_calendarsCheckbox\":[\"true\"],\"_journal_web-content\":[\"true\"],\"PORTLET_DATA_15Checkbox\":[\"true\"],\"endTime\":[\"04:54 AM\"],\"PORTLET_CONFIGURATION_ALL\":[\"true\"],\"formDate\":[\"1453697657154\"],\"PORTLET_CONFIGURATION\":[\"true\"],\"endDateDay\":[\"25\"],\"endDateMinute\":[\"54\"],\"RATINGS\":[\"true\"],\"_document_library_previews-and-thumbnails\":[\"true\"],\"layoutIds\":[\"[]\"],\"PORTLET_USER_PREFERENCES_ALLCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_scfinvoiceportlet_WAR_scfinvoiceportlet\":[\"true\"],\"PORTLET_DATA_167\":[\"false\"],\"PORTLET_USER_PREFERENCES_ALL\":[\"true\"],\"PORTLET_DATA_15\":[\"true\"],\"PORTLET_CONFIGURATION_tfdashboardportlet_WAR_tfdashboardportlet\":[\"true\"],\"PORTLET_SETUP_tfcompanyportlet_WAR_tfadminportlet\":[\"true\"],\"_document_library_documents\":[\"true\"],\"PORTLET_SETUP_scfinvestorportlet_WAR_scfinvestorportlet\":[\"true\"],\"permissionsAssignedToRoles\":[\"true\"],\"LAYOUT_SET_SETTINGSCheckbox\":[\"true\"],\"struts_action\":[\"/group_pages/export_layouts\"],\"startDateHour\":[\"4\"],\"_dynamic_data_lists_data-definitionsCheckbox\":[\"true\"],\"_document_library_documentsCheckbox\":[\"true\"],\"DELETIONS\":[\"false\"],\"PORTLET_CONFIGURATION_scftradeportlet_WAR_scftradeportletCheckbox\":[\"true\"],\"permissionsAssignedToRolesCheckbox\":[\"true\"],\"_journal_referenced-content\":[\"true\"],\"PORTLET_SETUP_scfinvestorportlet_WAR_scfinvestorportletCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_tfsettingsportlet_WAR_tfsettingsportlet\":[\"true\"],\"_calendar_calendar-resources\":[\"true\"],\"_journal_version-historyCheckbox\":[\"true\"],\"startDateDay\":[\"24\"],\"redirect\":[\"http://localhost:8080/group/control_panel/manage?p_p_auth=bct2K2FK&p_p_id=156&p_p_lifecycle=0&p_p_state=pop_up&p_p_mode=view&doAsGroupId=10182&refererPlid=12922&controlPanelCategory=sites&_156_struts_action=%2Fgroup_pages%2Fexport_layouts&_156_tabs2=current-and-previous&_156_groupId=10182&_156_liveGroupId=10182&_156_privateLayout=true&_156_rootNodeName=Private+Pages\"],\"PERMISSIONS\":[\"true\"],\"_calendar_calendar-resourcesCheckbox\":[\"true\"],\"_journal_web-contentCheckbox\":[\"true\"],\"endDateHour\":[\"4\"],\"_journal_referenced-contentCheckbox\":[\"true\"],\"PORTLET_SETUP_tfdashboardportlet_WAR_tfdashboardportletCheckbox\":[\"true\"],\"PORTLET_CONFIGURATION_tfdashboardportlet_WAR_tfdashboardportletCheckbox\":[\"true\"],\"CATEGORIES\":[\"true\"],\"privateLayout\":[\"true\"],\"PORTLET_DATA_1_WAR_opensocialportletCheckbox\":[\"true\"],\"PORTLET_SETUP_scftradeportlet_WAR_scftradeportletCheckbox\":[\"true\"]},\"javaClass\":\"java.util.HashMap\"},\"userId\":10199,\"fileName\":\"Private_Pages-201601250454.lar\",\"privateLayout\":true},\"javaClass\":\"java.util.HashMap\"}',1,'2016-01-25 04:54:30',3,'');

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

insert  into `browsertracker`(`browserTrackerId`,`userId`,`browserKey`) values (10656,10199,620281155934),(20526,20506,909340672626),(20701,20301,976124383174);

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

insert  into `calendar`(`uuid_`,`calendarId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`resourceBlockId`,`calendarResourceId`,`name`,`description`,`color`,`defaultCalendar`,`enableComments`,`enableRatings`) values ('4d0086b9-8e2c-4fcd-8ba1-dabc5142b65b',10696,10182,10155,10159,'','2015-07-17 20:44:11','2015-07-17 20:44:11',4,10694,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Liferay</Name></root>','',14247526,1,0,0);

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

insert  into `calendarresource`(`uuid_`,`calendarResourceId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`resourceBlockId`,`classNameId`,`classPK`,`classUuid`,`code_`,`name`,`description`,`active_`) values ('0b7de103-7134-436d-8691-b27a2dfaec34',10694,10182,10155,10159,'','2015-07-17 20:44:10','2015-07-17 20:44:10',1,10001,10182,'','10694','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Liferay</Name></root>','',1);

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

insert  into `classname_`(`classNameId`,`value`) values (10442,'com.liferay.calendar.model.Calendar'),(10443,'com.liferay.calendar.model.CalendarBooking'),(10444,'com.liferay.calendar.model.CalendarNotificationTemplate'),(10445,'com.liferay.calendar.model.CalendarResource'),(10017,'com.liferay.counter.model.Counter'),(10436,'com.liferay.marketplace.model.App'),(10437,'com.liferay.marketplace.model.Module'),(10471,'com.liferay.notifications.model.UserNotificationEvent'),(10500,'com.liferay.opensocial.model.Gadget'),(10501,'com.liferay.opensocial.model.OAuthConsumer'),(10502,'com.liferay.opensocial.model.OAuthToken'),(10423,'com.liferay.portal.kernel.repository.model.FileEntry'),(12102,'com.liferay.portal.kernel.repository.model.Folder'),(10018,'com.liferay.portal.kernel.workflow.WorkflowTask'),(10019,'com.liferay.portal.model.Account'),(10020,'com.liferay.portal.model.Address'),(10021,'com.liferay.portal.model.BackgroundTask'),(10022,'com.liferay.portal.model.BrowserTracker'),(10023,'com.liferay.portal.model.ClassName'),(10024,'com.liferay.portal.model.ClusterGroup'),(10025,'com.liferay.portal.model.Company'),(10026,'com.liferay.portal.model.Contact'),(10027,'com.liferay.portal.model.Country'),(10028,'com.liferay.portal.model.EmailAddress'),(10001,'com.liferay.portal.model.Group'),(10029,'com.liferay.portal.model.Image'),(10002,'com.liferay.portal.model.Layout'),(10030,'com.liferay.portal.model.LayoutBranch'),(10031,'com.liferay.portal.model.LayoutFriendlyURL'),(10032,'com.liferay.portal.model.LayoutPrototype'),(10033,'com.liferay.portal.model.LayoutRevision'),(10034,'com.liferay.portal.model.LayoutSet'),(10035,'com.liferay.portal.model.LayoutSetBranch'),(10036,'com.liferay.portal.model.LayoutSetPrototype'),(10037,'com.liferay.portal.model.ListType'),(10038,'com.liferay.portal.model.Lock'),(10039,'com.liferay.portal.model.MembershipRequest'),(10003,'com.liferay.portal.model.Organization'),(10040,'com.liferay.portal.model.OrgGroupRole'),(10041,'com.liferay.portal.model.OrgLabor'),(10042,'com.liferay.portal.model.PasswordPolicy'),(10043,'com.liferay.portal.model.PasswordPolicyRel'),(10044,'com.liferay.portal.model.PasswordTracker'),(10045,'com.liferay.portal.model.Phone'),(10046,'com.liferay.portal.model.PluginSetting'),(10047,'com.liferay.portal.model.PortalPreferences'),(10048,'com.liferay.portal.model.Portlet'),(10049,'com.liferay.portal.model.PortletItem'),(10050,'com.liferay.portal.model.PortletPreferences'),(10051,'com.liferay.portal.model.Region'),(10052,'com.liferay.portal.model.Release'),(10053,'com.liferay.portal.model.Repository'),(10054,'com.liferay.portal.model.RepositoryEntry'),(10055,'com.liferay.portal.model.ResourceAction'),(10056,'com.liferay.portal.model.ResourceBlock'),(10057,'com.liferay.portal.model.ResourceBlockPermission'),(10058,'com.liferay.portal.model.ResourcePermission'),(10059,'com.liferay.portal.model.ResourceTypePermission'),(10004,'com.liferay.portal.model.Role'),(10060,'com.liferay.portal.model.ServiceComponent'),(10061,'com.liferay.portal.model.Shard'),(10062,'com.liferay.portal.model.Subscription'),(10063,'com.liferay.portal.model.SystemEvent'),(10064,'com.liferay.portal.model.Team'),(10065,'com.liferay.portal.model.Ticket'),(10005,'com.liferay.portal.model.User'),(10006,'com.liferay.portal.model.UserGroup'),(10066,'com.liferay.portal.model.UserGroupGroupRole'),(10067,'com.liferay.portal.model.UserGroupRole'),(10068,'com.liferay.portal.model.UserIdMapper'),(10069,'com.liferay.portal.model.UserNotificationDelivery'),(10070,'com.liferay.portal.model.UserNotificationEvent'),(10191,'com.liferay.portal.model.UserPersonalSite'),(10071,'com.liferay.portal.model.UserTracker'),(10072,'com.liferay.portal.model.UserTrackerPath'),(10073,'com.liferay.portal.model.VirtualHost'),(10074,'com.liferay.portal.model.WebDAVProps'),(10075,'com.liferay.portal.model.Website'),(10076,'com.liferay.portal.model.WorkflowDefinitionLink'),(10077,'com.liferay.portal.model.WorkflowInstanceLink'),(15102,'com.liferay.portal.repository.cmis.CMISAtomPubRepository'),(15103,'com.liferay.portal.repository.cmis.CMISWebServicesRepository'),(10527,'com.liferay.portal.repository.liferayrepository.LiferayRepository'),(10449,'com.liferay.portal.workflow.kaleo.model.KaleoAction'),(10450,'com.liferay.portal.workflow.kaleo.model.KaleoCondition'),(10451,'com.liferay.portal.workflow.kaleo.model.KaleoDefinition'),(10452,'com.liferay.portal.workflow.kaleo.model.KaleoInstance'),(10453,'com.liferay.portal.workflow.kaleo.model.KaleoInstanceToken'),(10454,'com.liferay.portal.workflow.kaleo.model.KaleoLog'),(10455,'com.liferay.portal.workflow.kaleo.model.KaleoNode'),(10456,'com.liferay.portal.workflow.kaleo.model.KaleoNotification'),(10457,'com.liferay.portal.workflow.kaleo.model.KaleoNotificationRecipient'),(10458,'com.liferay.portal.workflow.kaleo.model.KaleoTask'),(10459,'com.liferay.portal.workflow.kaleo.model.KaleoTaskAssignment'),(10460,'com.liferay.portal.workflow.kaleo.model.KaleoTaskAssignmentInstance'),(10461,'com.liferay.portal.workflow.kaleo.model.KaleoTaskInstanceToken'),(10462,'com.liferay.portal.workflow.kaleo.model.KaleoTimer'),(10463,'com.liferay.portal.workflow.kaleo.model.KaleoTimerInstanceToken'),(10464,'com.liferay.portal.workflow.kaleo.model.KaleoTransition'),(10078,'com.liferay.portlet.announcements.model.AnnouncementsDelivery'),(10079,'com.liferay.portlet.announcements.model.AnnouncementsEntry'),(10080,'com.liferay.portlet.announcements.model.AnnouncementsFlag'),(10081,'com.liferay.portlet.asset.model.AssetCategory'),(10082,'com.liferay.portlet.asset.model.AssetCategoryProperty'),(10083,'com.liferay.portlet.asset.model.AssetEntry'),(10084,'com.liferay.portlet.asset.model.AssetLink'),(10085,'com.liferay.portlet.asset.model.AssetTag'),(10086,'com.liferay.portlet.asset.model.AssetTagProperty'),(10087,'com.liferay.portlet.asset.model.AssetTagStats'),(10088,'com.liferay.portlet.asset.model.AssetVocabulary'),(10007,'com.liferay.portlet.blogs.model.BlogsEntry'),(10089,'com.liferay.portlet.blogs.model.BlogsStatsUser'),(10008,'com.liferay.portlet.bookmarks.model.BookmarksEntry'),(10009,'com.liferay.portlet.bookmarks.model.BookmarksFolder'),(10010,'com.liferay.portlet.calendar.model.CalEvent'),(10090,'com.liferay.portlet.documentlibrary.model.DLContent'),(10011,'com.liferay.portlet.documentlibrary.model.DLFileEntry'),(10091,'com.liferay.portlet.documentlibrary.model.DLFileEntryMetadata'),(10092,'com.liferay.portlet.documentlibrary.model.DLFileEntryType'),(10093,'com.liferay.portlet.documentlibrary.model.DLFileRank'),(10094,'com.liferay.portlet.documentlibrary.model.DLFileShortcut'),(10095,'com.liferay.portlet.documentlibrary.model.DLFileVersion'),(10012,'com.liferay.portlet.documentlibrary.model.DLFolder'),(10096,'com.liferay.portlet.documentlibrary.model.DLSyncEvent'),(10315,'com.liferay.portlet.documentlibrary.util.RawMetadataProcessor'),(10097,'com.liferay.portlet.dynamicdatalists.model.DDLRecord'),(10098,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet'),(10099,'com.liferay.portlet.dynamicdatalists.model.DDLRecordVersion'),(10100,'com.liferay.portlet.dynamicdatamapping.model.DDMContent'),(10101,'com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink'),(10102,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure'),(10103,'com.liferay.portlet.dynamicdatamapping.model.DDMStructureLink'),(10104,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate'),(10105,'com.liferay.portlet.expando.model.ExpandoColumn'),(10106,'com.liferay.portlet.expando.model.ExpandoRow'),(10107,'com.liferay.portlet.expando.model.ExpandoTable'),(10108,'com.liferay.portlet.expando.model.ExpandoValue'),(10109,'com.liferay.portlet.journal.model.JournalArticle'),(10110,'com.liferay.portlet.journal.model.JournalArticleImage'),(10111,'com.liferay.portlet.journal.model.JournalArticleResource'),(10112,'com.liferay.portlet.journal.model.JournalContentSearch'),(10113,'com.liferay.portlet.journal.model.JournalFeed'),(10013,'com.liferay.portlet.journal.model.JournalFolder'),(13224,'com.liferay.portlet.layoutsadmin.lar.StagedTheme'),(10114,'com.liferay.portlet.messageboards.model.MBBan'),(10115,'com.liferay.portlet.messageboards.model.MBCategory'),(10116,'com.liferay.portlet.messageboards.model.MBDiscussion'),(10117,'com.liferay.portlet.messageboards.model.MBMailingList'),(10014,'com.liferay.portlet.messageboards.model.MBMessage'),(10118,'com.liferay.portlet.messageboards.model.MBStatsUser'),(10015,'com.liferay.portlet.messageboards.model.MBThread'),(10119,'com.liferay.portlet.messageboards.model.MBThreadFlag'),(10120,'com.liferay.portlet.mobiledevicerules.model.MDRAction'),(10121,'com.liferay.portlet.mobiledevicerules.model.MDRRule'),(10122,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup'),(10123,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance'),(10124,'com.liferay.portlet.polls.model.PollsChoice'),(10125,'com.liferay.portlet.polls.model.PollsQuestion'),(10126,'com.liferay.portlet.polls.model.PollsVote'),(10127,'com.liferay.portlet.ratings.model.RatingsEntry'),(10128,'com.liferay.portlet.ratings.model.RatingsStats'),(10129,'com.liferay.portlet.shopping.model.ShoppingCart'),(10130,'com.liferay.portlet.shopping.model.ShoppingCategory'),(10131,'com.liferay.portlet.shopping.model.ShoppingCoupon'),(10132,'com.liferay.portlet.shopping.model.ShoppingItem'),(10133,'com.liferay.portlet.shopping.model.ShoppingItemField'),(10134,'com.liferay.portlet.shopping.model.ShoppingItemPrice'),(10135,'com.liferay.portlet.shopping.model.ShoppingOrder'),(10136,'com.liferay.portlet.shopping.model.ShoppingOrderItem'),(10137,'com.liferay.portlet.social.model.SocialActivity'),(10138,'com.liferay.portlet.social.model.SocialActivityAchievement'),(10139,'com.liferay.portlet.social.model.SocialActivityCounter'),(10140,'com.liferay.portlet.social.model.SocialActivityLimit'),(10141,'com.liferay.portlet.social.model.SocialActivitySet'),(10142,'com.liferay.portlet.social.model.SocialActivitySetting'),(10143,'com.liferay.portlet.social.model.SocialRelation'),(10144,'com.liferay.portlet.social.model.SocialRequest'),(10145,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion'),(10146,'com.liferay.portlet.softwarecatalog.model.SCLicense'),(10147,'com.liferay.portlet.softwarecatalog.model.SCProductEntry'),(10148,'com.liferay.portlet.softwarecatalog.model.SCProductScreenshot'),(10149,'com.liferay.portlet.softwarecatalog.model.SCProductVersion'),(10150,'com.liferay.portlet.trash.model.TrashEntry'),(10151,'com.liferay.portlet.trash.model.TrashVersion'),(10152,'com.liferay.portlet.wiki.model.WikiNode'),(10016,'com.liferay.portlet.wiki.model.WikiPage'),(10153,'com.liferay.portlet.wiki.model.WikiPageResource'),(10510,'com.liferay.sync.model.SyncDLObject');

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

insert  into `company`(`companyId`,`accountId`,`webId`,`key_`,`mx`,`homeURL`,`logoId`,`system`,`maxUsers`,`active_`) values (10155,10157,'liferay.com','rO0ABXNyAB9qYXZheC5jcnlwdG8uc3BlYy5TZWNyZXRLZXlTcGVjW0cLZuIwYU0CAAJMAAlhbGdvcml0aG10ABJMamF2YS9sYW5nL1N0cmluZztbAANrZXl0AAJbQnhwdAADQUVTdXIAAltCrPMX+AYIVOACAAB4cAAAABD3Ko7rgteR+efQJMxjIb4y','liferay.com','/web/guest/home',0,0,0,1);

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

insert  into `contact_`(`contactId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`accountId`,`parentContactId`,`emailAddress`,`firstName`,`middleName`,`lastName`,`prefixId`,`suffixId`,`male`,`birthday`,`smsSn`,`aimSn`,`facebookSn`,`icqSn`,`jabberSn`,`msnSn`,`mySpaceSn`,`skypeSn`,`twitterSn`,`ymSn`,`employeeStatusId`,`employeeNumber`,`jobTitle`,`jobClass`,`hoursOfOperation`) values (10160,10155,10159,'','2015-07-17 19:13:38','2015-07-17 19:13:38',10005,10159,10157,0,'default@liferay.com','','','',0,0,1,'2015-07-17 19:13:38','','','','','','','','','','','','','','',''),(10200,10155,10199,'','2015-07-17 19:13:41','2016-01-23 20:14:25',10005,10199,10157,0,'gautam@liferay.com','Gautam','','Sharma',0,0,1,'1970-01-01 00:00:00','','','','','','','','','','','','','','',''),(20302,10155,10159,'','2016-01-19 21:32:49','2016-01-19 21:32:49',10005,20301,10157,0,'prinvestor1@whitehall.com','Primary','','Investor1',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','Dev','',''),(20402,10155,10199,'Gautam Sharma','2016-01-23 18:57:44','2016-01-23 18:57:44',10005,20401,10157,0,'prinvestor2@whitehall.com','primary','','prInvestor2',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','Admin','',''),(20422,10155,10199,'Gautam Sharma','2016-01-23 19:02:23','2016-01-23 19:02:23',10005,20421,10157,0,'prinvestor3@whitehall.com','primary','','Investor3',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','Company Director','',''),(20442,10155,10199,'Gautam Sharma','2016-01-23 19:06:02','2016-01-23 19:06:02',10005,20441,10157,0,'prinvestor4@whitehall.com','primary','','Investor4',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','Secretary','',''),(20462,10155,10159,'','2016-01-23 19:13:36','2016-01-23 19:13:36',10005,20461,10157,0,'scfcompany1@whitehall.com','SCF','','Company1',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','Dev','',''),(20507,10155,10199,'Gautam Sharma','2016-01-23 20:49:59','2016-01-23 20:49:59',10005,20506,10157,0,'scfcompany2@whitehall.com','SCF','','Company2',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','Admin','',''),(20528,10155,10199,'Gautam Sharma','2016-01-23 21:01:29','2016-01-23 21:01:29',10005,20527,10157,0,'scfcompany3@whitehall.com','SCF','','Company3',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','Admin','',''),(20548,10155,10159,'','2016-01-23 21:09:17','2016-01-23 21:09:17',10005,20547,10157,0,'seller1@whitehall.com','seller','','1',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','Dev','',''),(20568,10155,10199,'Gautam Sharma','2016-01-23 21:14:10','2016-01-23 21:14:10',10005,20567,10157,0,'seller2@whitehall.com','Seller','','2',0,0,1,'1988-03-02 00:00:00','','','','','','','','','','','','','','','');

/*Table structure for table `counter` */

DROP TABLE IF EXISTS `counter`;

CREATE TABLE `counter` (
  `name` varchar(75) NOT NULL,
  `currentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `counter` */

insert  into `counter`(`name`,`currentId`) values ('com.liferay.counter.model.Counter',20800),('com.liferay.portal.model.Layout#10173#true',1),('com.liferay.portal.model.Layout#10182#false',7),('com.liferay.portal.model.Layout#10182#true',9),('com.liferay.portal.model.Layout#10202#false',1),('com.liferay.portal.model.Layout#10202#true',1),('com.liferay.portal.model.Layout#10318#true',1),('com.liferay.portal.model.Layout#10330#true',1),('com.liferay.portal.model.Layout#10340#true',1),('com.liferay.portal.model.Layout#10351#true',2),('com.liferay.portal.model.Layout#10377#true',3),('com.liferay.portal.model.Layout#11305#true',1),('com.liferay.portal.model.Layout#11419#true',1),('com.liferay.portal.model.Layout#13202#true',1),('com.liferay.portal.model.Layout#20304#false',1),('com.liferay.portal.model.Layout#20304#true',1),('com.liferay.portal.model.Layout#20404#false',1),('com.liferay.portal.model.Layout#20404#true',1),('com.liferay.portal.model.Layout#20424#false',1),('com.liferay.portal.model.Layout#20424#true',1),('com.liferay.portal.model.Layout#20444#false',1),('com.liferay.portal.model.Layout#20444#true',1),('com.liferay.portal.model.Layout#20464#false',1),('com.liferay.portal.model.Layout#20464#true',1),('com.liferay.portal.model.Layout#20509#false',1),('com.liferay.portal.model.Layout#20509#true',1),('com.liferay.portal.model.Layout#20530#false',1),('com.liferay.portal.model.Layout#20530#true',1),('com.liferay.portal.model.Layout#20550#false',1),('com.liferay.portal.model.Layout#20550#true',1),('com.liferay.portal.model.Layout#20570#false',1),('com.liferay.portal.model.Layout#20570#true',1),('com.liferay.portal.model.ResourceAction',2100),('com.liferay.portal.model.ResourceBlock',100),('com.liferay.portal.model.ResourcePermission',8000),('com.liferay.portal.model.User',100),('com.liferay.portlet.documentlibrary.model.DLFileEntry',2500),('com.liferay.portlet.social.model.SocialActivity',2200);

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

insert  into `ddmcontent`(`uuid_`,`contentId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`description`,`xml`) values ('7513928f-f5bb-4e00-827f-fe975c532039',11355,11305,10155,10159,'','2015-08-03 19:04:44','2015-08-03 19:04:44','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_COMMENTS\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[770]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"ClimateForcast_COMMENT\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('965ec2d3-1363-466e-81a6-a9778e9df88c',11363,11305,10155,10159,'','2015-08-03 19:04:46','2015-08-03 19:04:46','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2014-10-17T00:03:54]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-10-29T20:01:40]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_F_NUMBER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[13.0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_EXPOSURE_TIME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[0.02]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_ORIGINAL_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-10-29T20:01:40]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_RESOLUTION_HORIZONTAL\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[180.0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_RESOLUTION_UNIT\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Inch]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_EQUIPMENT_MAKE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Canon]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2014-10-17T00:03:54]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[770]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_RESOLUTION_VERTICAL\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[180.0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_FLASH_FIRED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_EQUIPMENT_MODEL\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Canon EOS DIGITAL REBEL]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2014-10-17T00:03:54]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_FOCAL_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[46.0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_ORIENTATION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_ISO_SPEED_RATINGS\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[200]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-10-29T20:01:40]]></dynamic-content>\n	</dynamic-element>\n</root>'),('76c80ff5-b194-4d5b-8791-de0cd29de36b',11367,11305,10155,10159,'','2015-08-03 19:04:46','2015-08-03 19:04:46','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_COMMENTS\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[770]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"ClimateForcast_COMMENT\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('cf83927d-bfb9-4d1a-a715-a9cc26c4e9c1',11371,11305,10155,10159,'','2015-08-03 19:04:46','2015-08-03 19:04:46','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_COMMENTS\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[770]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"ClimateForcast_COMMENT\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('e45a2aeb-39c4-44de-9b93-4bffbb3f21f7',11468,11419,10155,10159,'','2015-08-03 19:34:33','2015-08-03 19:34:33','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_COMMENTS\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[770]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"ClimateForcast_COMMENT\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('4334a96f-0f90-415b-a0db-03adce5e3e85',11475,11419,10155,10159,'','2015-08-03 19:34:34','2015-08-03 19:34:34','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2014-10-17T00:03:54]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-10-29T20:01:40]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_F_NUMBER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[13.0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_EXPOSURE_TIME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[0.02]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_ORIGINAL_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-10-29T20:01:40]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_RESOLUTION_HORIZONTAL\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[180.0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_RESOLUTION_UNIT\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Inch]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_EQUIPMENT_MAKE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Canon]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2014-10-17T00:03:54]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[770]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_RESOLUTION_VERTICAL\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[180.0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_FLASH_FIRED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[true]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_EQUIPMENT_MODEL\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Canon EOS DIGITAL REBEL]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2014-10-17T00:03:54]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_FOCAL_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[46.0]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_ORIENTATION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_ISO_SPEED_RATINGS\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[200]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-10-29T20:01:40]]></dynamic-content>\n	</dynamic-element>\n</root>'),('129a7086-31b4-4a1b-b608-b16ddf81c59f',11479,11419,10155,10159,'','2015-08-03 19:34:34','2015-08-03 19:34:34','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_COMMENTS\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[770]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"ClimateForcast_COMMENT\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('776fa6d9-4404-41b2-89a0-c8d59f0977c3',11483,11419,10155,10159,'','2015-08-03 19:34:34','2015-08-03 19:34:34','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_COMMENTS\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_WIDTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[770]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[image/jpeg]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"ClimateForcast_COMMENT\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[CREATOR: gd-jpeg v1.0 (using IJG JPEG v80), default quality]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_IMAGE_LENGTH\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TIFF_BITS_PER_SAMPLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[8]]></dynamic-content>\n	</dynamic-element>\n</root>'),('f912a936-b32d-48e5-9ae5-581f2f5bd56a',17720,10182,10155,10199,'Gautam Sharma','2015-10-22 19:29:08','2015-10-22 19:29:08','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[text/plain; charset=ISO-8859-1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_ENCODING\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[ISO-8859-1]]></dynamic-content>\n	</dynamic-element>\n</root>'),('2073b5b4-b11e-48a4-8ef3-c54cbbd2d025',17738,10182,10155,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[text/plain; charset=ISO-8859-1]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_ENCODING\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[ISO-8859-1]]></dynamic-content>\n	</dynamic-element>\n</root>'),('31358315-1c7f-4212-a016-5cf40d0e511d',18339,10182,10155,10199,'Gautam Sharma','2015-11-02 17:54:23','2015-11-02 17:54:23','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_AUTHOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/pdf]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_TITLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('c79cc441-57d0-4272-8220-d4cbf325885d',18357,10182,10155,17001,'Colin LEVINS','2015-11-02 18:08:29','2015-11-02 18:08:29','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_AUTHOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/pdf]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_TITLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('41de13c5-84cd-4524-b02b-dac2c5ce3046',18375,10182,10155,10199,'Gautam Sharma','2015-11-02 18:17:36','2015-11-02 18:17:36','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_AUTHOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/pdf]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_TITLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('7a892611-503b-4bef-bf6f-f133f995da46',18420,10182,10155,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_AUTHOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/pdf]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATOR\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[SMPARAB]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_TITLE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2012-05-25T15:47:23Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('0f34cf46-f3c4-4052-a291-b8250faa6690',19196,10182,10155,17001,'Colin LEVINS','2015-12-27 17:31:40','2015-12-27 17:31:40','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('e74318a4-2e30-4355-a58e-3cde92fde881',19214,10182,10155,17001,'Colin LEVINS','2015-12-27 17:41:26','2015-12-27 17:41:26','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('f0efe742-be3c-4e9c-b480-b40524480635',19232,10182,10155,17001,'Colin LEVINS','2015-12-27 17:57:05','2015-12-27 17:57:05','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T16:50:03Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('a7b3ba33-28c6-498a-913a-43a6176f65e3',19290,10182,10155,17001,'Colin LEVINS','2015-12-27 20:22:38','2015-12-27 20:22:38','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>'),('ded6ae5d-64f4-487f-93b0-bb868cbc8844',19309,10182,10155,17001,'Colin LEVINS','2015-12-27 20:35:40','2015-12-27 20:35:40','com.liferay.portlet.dynamicdatamapping.model.DDMStorageLink','','<?xml version=\"1.0\"?>\n\n<root>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_LAST_SAVED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_CREATION_DATE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_VERSION\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[12.0000]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_CONTENT_TYPE\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[application/vnd.openxmlformats-officedocument.spreadsheetml.sheet]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_PUBLISHER\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"HttpHeaders_LAST_MODIFIED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2015-12-27T19:18:07Z]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"TikaMetadataKeys_PROTECTED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[false]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"MSOffice_APPLICATION_NAME\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[Microsoft Excel]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element default-language-id=\"en_US\" name=\"DublinCore_CREATED\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[2006-09-16T00:00:00Z]]></dynamic-content>\n	</dynamic-element>\n</root>');

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

insert  into `ddmstoragelink`(`uuid_`,`storageLinkId`,`classNameId`,`classPK`,`structureId`) values ('94945a8c-d1f2-4619-ba8e-a4f92b66a6bb',11356,10100,11355,10316),('83a3f929-f59c-4020-a6ee-38171348bd27',11364,10100,11363,10316),('d27a6057-ee31-4172-bb05-dcc7c225ccf1',11368,10100,11367,10316),('4939f1f5-0196-4d8e-9d6a-0fd730086f35',11372,10100,11371,10316),('962ec468-5787-4a79-928a-50ebb5d3f8cd',11469,10100,11468,10316),('78628681-c59e-458e-aa98-7c4a60af7939',11476,10100,11475,10316),('264cef69-b5a1-43b6-b217-c2a1e55bb878',11480,10100,11479,10316),('151acc3a-62e7-4e15-ab7d-38d8eb669ae3',11484,10100,11483,10316),('770d590e-0835-4010-8aee-e76481a79b60',17721,10100,17720,10316),('3fe0c626-157b-4fd0-95e9-ae986053469f',17739,10100,17738,10316),('615fd1da-8628-462d-a262-3c5f79a8a972',18340,10100,18339,10316),('fc62aec5-0435-4134-a395-9d9e719bc007',18358,10100,18357,10316),('1c078c4c-afa3-46f3-be3d-fa014eb7a8d2',18376,10100,18375,10316),('7455c2dc-af20-4a63-90ea-c3c7be42f1aa',18421,10100,18420,10316),('1b1dd7df-111c-4d7e-b9f9-4434ead53fb4',19197,10100,19196,10316),('cd39af4c-4bc9-43e5-b91f-3561a0d53e81',19215,10100,19214,10316),('d9b33737-809b-4a2a-8ac5-44f606401315',19233,10100,19232,10316),('ee05823e-b622-4190-b2ad-2d226673d448',19291,10100,19290,10316),('166b99d7-ffa2-4dae-8c5d-24b00ff56614',19310,10100,19309,10316);

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

insert  into `ddmstructure`(`uuid_`,`structureId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`parentStructureId`,`classNameId`,`structureKey`,`name`,`description`,`xsd`,`storageType`,`type_`) values ('b817d755-57d6-456e-a970-9665e5e456ac',10304,10195,10155,10159,'','2015-07-17 19:13:44','2015-07-17 19:13:44',0,10091,'LEARNING MODULE METADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Learning Module Metadata</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Learning Module Metadata</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select2235\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"home_edition\" type=\"option\" value=\"HE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Home Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"business_edition\" type=\"option\" value=\"BE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Business Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"enterprise_edition\" type=\"option\" value=\"EE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Enterprise Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Product]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select3212\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"1_0\" type=\"option\" value=\"1\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[1.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"2_0\" type=\"option\" value=\"2\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[2.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"3_0\" type=\"option\" value=\"3\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[3.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Version]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select4115\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"administration\" type=\"option\" value=\"admin\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Administration]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"installation\" type=\"option\" value=\"install\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Installation]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"configuration\" type=\"option\" value=\"config\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Configuration]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Topics]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select5069\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"beginner\" type=\"option\" value=\"beginner\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Beginner]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"intermediate\" type=\"option\" value=\"intermediate\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Intermediate]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"advanced\" type=\"option\" value=\"advanced\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Advanced]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Level]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('6ca09fd7-319b-45ed-a603-bbdec3aafa1c',10305,10195,10155,10159,'','2015-07-17 19:13:44','2015-07-17 19:13:44',0,10091,'MARKETING CAMPAIGN THEME METADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Marketing Campaign Theme Metadata</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Marketing Campaign Theme Metadata</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select2305\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"strong_company\" type=\"option\" value=\"strong\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Strong Company]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"new_product_launch\" type=\"option\" value=\"product\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[New Product Launch]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"company_philosophy\" type=\"option\" value=\"philosophy\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Company Philosophy]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Select]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select3229\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"your_trusted_advisor\" type=\"option\" value=\"advisor\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Your Trusted Advisor]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"10_years_of_customer_solutions\" type=\"option\" value=\"solutions\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[10 Years of Customer Solutions]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"making_a_difference\" type=\"option\" value=\"difference\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Making a Difference]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Campaign Theme]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select4282\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"awareness\" type=\"option\" value=\"awareness\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Awareness]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"lead_generation\" type=\"option\" value=\"leads\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Lead Generation]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"customer_service\" type=\"option\" value=\"service\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Customer Service]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Business Goal]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('4ff6932b-573e-4e75-b064-d2bdd714603d',10306,10195,10155,10159,'','2015-07-17 19:13:44','2015-07-17 19:13:44',0,10091,'MEETING METADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Meeting Metadata</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Metadata for meeting</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"ddm-date3054\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2217\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Meeting Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text4569\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Time]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text5638\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Location]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"text\" name=\"textarea6584\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"text\" name=\"textarea7502\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Participants]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('15ed85f2-9687-45fa-9fa8-1bf526f26d04',10308,10195,10155,10159,'','2015-07-17 19:13:44','2015-07-17 19:13:44',0,10091,'AUTO_B0F5DFA6-D457-47FC-AD92-8F7C97757A29','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contract</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Contract</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"ddm-date18949\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Effective Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"ddm-date20127\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Expiration Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select10264\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"nda\" type=\"option\" value=\"NDA\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[NDA]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"msa\" type=\"option\" value=\"MSA\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[MSA]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"license_agreement\" type=\"option\" value=\"License\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[License Agreement]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Contract Type]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select4893\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"draft\" type=\"option\" value=\"Draft\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Draft]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"in_review\" type=\"option\" value=\"Review\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[In Review]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"suspended\" type=\"option\" value=\"Suspended\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Suspended]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"signed\" type=\"option\" value=\"Signed\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Signed]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Status]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text14822\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Legal Reviewer]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text17700\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Signing Authority]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2087\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Deal Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('4c5eaf5c-e34a-46cf-9be7-8a11a31e31be',10310,10195,10155,10159,'','2015-07-17 19:13:44','2015-07-17 19:13:44',0,10091,'AUTO_981FEC57-586A-49DD-89E9-78C17E806CBB','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Marketing Banner</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Marketing Banner</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"radio5547\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"radio\">\n		<dynamic-element name=\"yes\" type=\"option\" value=\"yes\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Yes]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"no\" type=\"option\" value=\"no\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[No]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Needs Legal Review]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2033\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Banner Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"text\" name=\"textarea2873\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('cf1d1745-1246-4b04-9447-1f9731d88280',10312,10195,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45',0,10091,'AUTO_79F5AE66-58E4-4BA2-948A-3FE8AD26D4D0','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Online Training</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Online Training</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2082\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Lesson Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text2979\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Author]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('5eefb2eb-8b2c-4c0c-a4dc-117764591c8f',10314,10195,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45',0,10091,'AUTO_325B633C-3EE7-46BA-A711-6189B435C40E','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Sales Presentation</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Sales Presentation</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select2890\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"home_edition\" type=\"option\" value=\"HE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Home Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"business_edition\" type=\"option\" value=\"BE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Business Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"enterprise_edition\" type=\"option\" value=\"EE\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Enterprise Edition]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Product]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"false\" name=\"select3864\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"1_0\" type=\"option\" value=\"1\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[1.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"2_0\" type=\"option\" value=\"2\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[2.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"3_0\" type=\"option\" value=\"3\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[3.0]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Version]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select4831\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"website\" type=\"option\" value=\"website\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Website]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"collaboration\" type=\"option\" value=\"collaboration\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Collaboration]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"intranet\" type=\"option\" value=\"intranet\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Intranet]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Areas of Interest]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" multiple=\"true\" name=\"select5929\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"acme\" type=\"option\" value=\"acme\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[ACME]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"sevencogs\" type=\"option\" value=\"sevencogs\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[SevenCogs]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"freeplus\" type=\"option\" value=\"freeplus\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[FreePlus]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Competitors]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"keyword\" name=\"text1993\" readOnly=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Prospect Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',1),('eb98993a-d8e2-4e74-b071-f1d747b6ec89',10316,10195,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45',0,10315,'TIKARAWMETADATA','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">TIKARAWMETADATA</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">TIKARAWMETADATA</Description></root>','<root available-locales=\"en_US\" default-locale=\"en_US\"><dynamic-element dataType=\"string\" name=\"ClimateForcast_PROGRAM_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.PROGRAM_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_COMMAND_LINE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.COMMAND_LINE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_HISTORY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.HISTORY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_TABLE_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.TABLE_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_INSTITUTION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.INSTITUTION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_SOURCE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.SOURCE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_CONTACT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.CONTACT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_PROJECT_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.PROJECT_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_CONVENTIONS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.CONVENTIONS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_REFERENCES\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.REFERENCES]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_ACKNOWLEDGEMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.ACKNOWLEDGEMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_REALIZATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.REALIZATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_EXPERIMENT_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.EXPERIMENT_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_COMMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.COMMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"ClimateForcast_MODEL_NAME_ENGLISH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.ClimateForcast.MODEL_NAME_ENGLISH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"CreativeCommons_LICENSE_URL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.CreativeCommons.LICENSE_URL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"CreativeCommons_LICENSE_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.CreativeCommons.LICENSE_LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"CreativeCommons_WORK_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.CreativeCommons.WORK_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_NAMESPACE_URI_DC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.NAMESPACE_URI_DC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_NAMESPACE_URI_DC_TERMS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.NAMESPACE_URI_DC_TERMS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_PREFIX_DC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.PREFIX_DC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_PREFIX_DC_TERMS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.PREFIX_DC_TERMS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_FORMAT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.FORMAT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_IDENTIFIER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.IDENTIFIER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_MODIFIED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.MODIFIED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_CONTRIBUTOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.CONTRIBUTOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_COVERAGE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.COVERAGE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_CREATOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.CREATOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_CREATED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.CREATED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_DESCRIPTION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.DESCRIPTION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_LANGUAGE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.LANGUAGE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_PUBLISHER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.PUBLISHER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_RELATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.RELATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_RIGHTS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.RIGHTS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_SOURCE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.SOURCE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_SUBJECT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.SUBJECT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_TITLE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.TITLE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"DublinCore_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.DublinCore.TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Geographic_LATITUDE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Geographic.LATITUDE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Geographic_LONGITUDE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Geographic.LONGITUDE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Geographic_ALTITUDE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Geographic.ALTITUDE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_ENCODING\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_ENCODING]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_LANGUAGE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_LANGUAGE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_LENGTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_LENGTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_DISPOSITION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_DISPOSITION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_MD5\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_MD5]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_CONTENT_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.CONTENT_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_LAST_MODIFIED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.LAST_MODIFIED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"HttpHeaders_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.HttpHeaders.LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_RECIPIENT_ADDRESS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_RECIPIENT_ADDRESS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_FROM\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_FROM]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_TO\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_TO]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_CC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_CC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"Message_MESSAGE_BCC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.Message.MESSAGE_BCC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_KEYWORDS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.KEYWORDS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_COMMENTS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.COMMENTS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LAST_AUTHOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LAST_AUTHOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_AUTHOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.AUTHOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_APPLICATION_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.APPLICATION_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_REVISION_NUMBER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.REVISION_NUMBER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_TEMPLATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.TEMPLATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_TOTAL_TIME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.TOTAL_TIME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_PRESENTATION_FORMAT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.PRESENTATION_FORMAT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_NOTES\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.NOTES]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_MANAGER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.MANAGER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_APPLICATION_VERSION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.APPLICATION_VERSION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_VERSION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.VERSION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CONTENT_STATUS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CONTENT_STATUS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CATEGORY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CATEGORY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_COMPANY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.COMPANY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_SECURITY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.SECURITY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_SLIDE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.SLIDE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_PAGE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.PAGE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_PARAGRAPH_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.PARAGRAPH_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LINE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LINE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_WORD_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.WORD_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CHARACTER_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CHARACTER_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CHARACTER_COUNT_WITH_SPACES\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CHARACTER_COUNT_WITH_SPACES]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_TABLE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.TABLE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_IMAGE_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.IMAGE_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_OBJECT_COUNT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.OBJECT_COUNT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_EDIT_TIME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.EDIT_TIME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_CREATION_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.CREATION_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LAST_SAVED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LAST_SAVED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_LAST_PRINTED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.LAST_PRINTED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"MSOffice_USER_DEFINED_METADATA_NAME_PREFIX\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.MSOffice.USER_DEFINED_METADATA_NAME_PREFIX]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_BITS_PER_SAMPLE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.BITS_PER_SAMPLE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_IMAGE_LENGTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.IMAGE_LENGTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_IMAGE_WIDTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.IMAGE_WIDTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_SAMPLES_PER_PIXEL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.SAMPLES_PER_PIXEL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_FLASH_FIRED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.FLASH_FIRED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_EXPOSURE_TIME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.EXPOSURE_TIME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_F_NUMBER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.F_NUMBER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_FOCAL_LENGTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.FOCAL_LENGTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_ISO_SPEED_RATINGS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.ISO_SPEED_RATINGS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_EQUIPMENT_MAKE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.EQUIPMENT_MAKE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_EQUIPMENT_MODEL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.EQUIPMENT_MODEL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_SOFTWARE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.SOFTWARE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_ORIENTATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.ORIENTATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_RESOLUTION_HORIZONTAL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.RESOLUTION_HORIZONTAL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_RESOLUTION_VERTICAL\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.RESOLUTION_VERTICAL]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_RESOLUTION_UNIT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.RESOLUTION_UNIT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TIFF_ORIGINAL_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TIFF.ORIGINAL_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMetadataKeys_RESOURCE_NAME_KEY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMetadataKeys.RESOURCE_NAME_KEY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMetadataKeys_PROTECTED\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMetadataKeys.PROTECTED]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMetadataKeys_EMBEDDED_RELATIONSHIP_ID\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMetadataKeys.EMBEDDED_RELATIONSHIP_ID]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMimeKeys_TIKA_MIME_FILE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMimeKeys.TIKA_MIME_FILE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"TikaMimeKeys_MIME_TYPE_MAGIC\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.TikaMimeKeys.MIME_TYPE_MAGIC]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_DURATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.DURATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ABS_PEAK_AUDIO_FILE_PATH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ABS_PEAK_AUDIO_FILE_PATH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ALBUM\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ALBUM]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ALT_TAPE_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ALT_TAPE_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ARTIST\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ARTIST]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_MOD_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_MOD_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_SAMPLE_RATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_SAMPLE_RATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_SAMPLE_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_SAMPLE_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_CHANNEL_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_CHANNEL_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_AUDIO_COMPRESSOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.AUDIO_COMPRESSOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_COMPOSER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.COMPOSER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_COPYRIGHT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.COPYRIGHT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_ENGINEER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.ENGINEER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_FILE_DATA_RATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.FILE_DATA_RATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_GENRE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.GENRE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_INSTRUMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.INSTRUMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_KEY\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.KEY]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_LOG_COMMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.LOG_COMMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_LOOP\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.LOOP]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_NUMBER_OF_BEATS\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.NUMBER_OF_BEATS]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_METADATA_MOD_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.METADATA_MOD_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_PULL_DOWN\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.PULL_DOWN]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_RELATIVE_PEAK_AUDIO_FILE_PATH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.RELATIVE_PEAK_AUDIO_FILE_PATH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_RELEASE_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.RELEASE_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SCALE_TYPE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SCALE_TYPE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SCENE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SCENE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SHOT_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SHOT_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SHOT_LOCATION\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SHOT_LOCATION]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SHOT_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SHOT_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_SPEAKER_PLACEMENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.SPEAKER_PLACEMENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_STRETCH_MODE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.STRETCH_MODE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TAPE_NAME\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TAPE_NAME]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TEMPO\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TEMPO]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TIME_SIGNATURE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TIME_SIGNATURE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_TRACK_NUMBER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.TRACK_NUMBER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_ALPHA_MODE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_ALPHA_MODE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_ALPHA_UNITY_IS_TRANSPARENT\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_ALPHA_UNITY_IS_TRANSPARENT]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_COLOR_SPACE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_COLOR_SPACE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_COMPRESSOR\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_COMPRESSOR]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_FIELD_ORDER\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_FIELD_ORDER]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_FRAME_RATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_FRAME_RATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_MOD_DATE\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_MOD_DATE]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_PIXEL_DEPTH\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_PIXEL_DEPTH]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element><dynamic-element dataType=\"string\" name=\"XMPDM_VIDEO_PIXEL_ASPECT_RATIO\" required=\"false\" showLabel=\"true\" type=\"text\"><meta-data locale=\"en_US\"><entry name=\"label\"><![CDATA[metadata.XMPDM.VIDEO_PIXEL_ASPECT_RATIO]]></entry><entry name=\"predefinedValue\"><![CDATA[]]></entry></meta-data></dynamic-element></root>','xml',0),('a7d029ec-d58c-476d-998c-15dcf33a0f17',10613,10182,10155,10159,'','2015-07-17 19:16:45','2015-07-17 19:16:45',0,10109,'BASIC-WEB-CONTENT-6.2.2.1','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Basic Web Content - 6.2.2.1</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"html\" fieldNamespace=\"ddm\" indexType=\"keyword\" name=\"content\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-text-html\" width=\"small\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Content]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('a0f83fd4-0fd6-4ef9-993a-489db0efde30',10801,10182,10155,10159,'','2015-07-17 20:50:48','2015-07-17 20:50:48',0,10098,'CONTACTS','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contacts</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Contacts</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"company\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Company]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"email\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Email]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"firstName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[First Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"imService\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"aol\" type=\"option\" value=\"aol\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[AOL]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"yahoo\" type=\"option\" value=\"yahoo\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Yahoo]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"gtalk\" type=\"option\" value=\"gtalk\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[GTalk]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Instant Messenger Service]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"gtalk\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"imUserName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Instant Messenger]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"jobTitle\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Job Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"lastName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Last Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"notes\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Notes]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"phoneMobile\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Phone (Mobile)]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"phoneOffice\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Phone (Office)]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('7ab18a9f-ce47-44ee-bd6c-49a1a6183265',10802,10182,10155,10159,'','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'EVENTS','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Events</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Events</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"double\" fieldNamespace=\"ddm\" name=\"cost\" required=\"false\" showLabel=\"true\" type=\"ddm-number\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Cost]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"eventDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"eventName\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Event Name]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"eventTime\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Time]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"location\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Location]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('dd59073a-a5ca-4a5e-8036-327bcf568254',10803,10182,10155,10159,'','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'INVENTORY','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Inventory</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Inventory</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"item\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Item]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"location\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Location]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"purchaseDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Purchase Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"style\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"double\" fieldNamespace=\"ddm\" name=\"purchasePrice\" required=\"false\" showLabel=\"true\" type=\"ddm-number\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Purchase Price]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"double\" fieldNamespace=\"ddm\" name=\"quantity\" required=\"false\" showLabel=\"true\" type=\"ddm-number\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Quantity]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('ff28b286-df52-4141-b063-f7d99b80a69f',10804,10182,10155,10159,'','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'ISSUES TRACKING','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Issues Tracking</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Issue Tracking</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"assignedTo\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Assigned To]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"comments\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Comments]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"dueDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Due Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"issueId\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Issue ID]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"severity\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"critical\" type=\"option\" value=\"critical\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Critical]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"major\" type=\"option\" value=\"major\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Major]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"minor\" type=\"option\" value=\"minor\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Minor]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"trivial\" type=\"option\" value=\"trivial\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Trivial]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Severity]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"minor\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"status\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"open\" type=\"option\" value=\"open\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Open]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"pending\" type=\"option\" value=\"pending\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Pending]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"completed\" type=\"option\" value=\"completed\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Completed]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Status]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"open\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"title\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('6cb566df-6640-4231-9963-8fafc0ce0891',10805,10182,10155,10159,'','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'MEETING MINUTES','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Meeting Minutes</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Meeting Minutes</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"author\" required=\"false\" showLabel=\"true\" type=\"text\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Author]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"duration\" required=\"false\" showLabel=\"true\" type=\"text\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Meeting Duration]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"meetingDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Meeting Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"minutes\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Minutes]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"title\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('97907290-6b20-427c-bc59-6807aef6263c',10806,10182,10155,10159,'','2015-07-17 20:50:49','2015-07-17 20:50:49',0,10098,'TO DO','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">To Do</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">To Do</Description></root>','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" name=\"assignedTo\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Assigned To]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" name=\"attachment\" required=\"false\" showLabel=\"true\" type=\"ddm-documentlibrary\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Attachment]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[Upload documents no larger than 3,000k.]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"comments\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Comments]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"description\" required=\"false\" showLabel=\"true\" type=\"textarea\" width=\"100\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Description]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"endDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[End Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"integer\" fieldNamespace=\"ddm\" name=\"percentComplete\" required=\"false\" showLabel=\"true\" type=\"ddm-integer\" width=\"25\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[% Complete]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[0]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"severity\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"critical\" type=\"option\" value=\"critical\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Critical]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"major\" type=\"option\" value=\"major\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Major]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"minor\" type=\"option\" value=\"minor\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Minor]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"trivial\" type=\"option\" value=\"trivial\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Trivial]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Severity]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"minor\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"date\" fieldNamespace=\"ddm\" name=\"startDate\" required=\"false\" showLabel=\"true\" type=\"ddm-date\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Start Date]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" multiple=\"false\" name=\"status\" required=\"false\" showLabel=\"true\" type=\"select\">\n		<dynamic-element name=\"open\" type=\"option\" value=\"open\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Open]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"pending\" type=\"option\" value=\"pending\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Pending]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"completed\" type=\"option\" value=\"completed\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Completed]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Status]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"open\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" name=\"title\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"50\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Title]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('a19ffcda-676b-4b92-ad8f-bf201ba3a3a7',11354,11305,10155,10159,'','2015-08-03 19:04:42','2015-08-03 19:04:42',0,10109,'CAROUSEL-6.2.0.1','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel - 6.2.0.1</Name></root>','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"\" name=\"height\" readOnly=\"false\" repeatable=\"false\" required=\"true\" showLabel=\"true\" type=\"text\" width=\"small\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Carousel Height]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[320]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"\" multiple=\"false\" name=\"duration\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" type=\"select\" width=\"\">\n		<dynamic-element name=\"option1\" type=\"option\" value=\"1\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[1]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"option2\" type=\"option\" value=\"2\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[2]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"option3\" type=\"option\" value=\"3\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[3]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"option4\" type=\"option\" value=\"4\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[4]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"option5\" type=\"option\" value=\"5\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[5]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"option6\" type=\"option\" value=\"6\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[6]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"option7\" type=\"option\" value=\"7\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[7]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"option8\" type=\"option\" value=\"8\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[8]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"option9\" type=\"option\" value=\"9\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[9]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"option10\" type=\"option\" value=\"10\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[10]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Transition Duration]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"5\"]]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"\" name=\"carousel-item\" readOnly=\"false\" repeatable=\"true\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"small\">\n		<dynamic-element dataType=\"string\" indexType=\"\" name=\"tagline\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" type=\"text\" width=\"small\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Item Tagline]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n				<entry name=\"tip\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element dataType=\"document-library\" fieldNamespace=\"ddm\" indexType=\"\" name=\"image\" readOnly=\"false\" repeatable=\"false\" required=\"true\" showLabel=\"true\" type=\"ddm-documentlibrary\" width=\"\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Item Image]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n				<entry name=\"tip\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element dataType=\"link-to-page\" fieldNamespace=\"ddm\" indexType=\"\" name=\"url-location\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" type=\"ddm-link-to-page\" width=\"small\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Item Url]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n				<entry name=\"tip\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Carousel Item]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			<entry name=\"tip\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0),('6c53b1ba-5440-42df-af0b-f311caf84fc8',11471,11419,10155,10159,'','2015-08-03 19:34:34','2015-08-03 19:34:34',0,10109,'CAROUSEL-1.0-SNAPSHOT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel - 1.0-SNAPSHOT</Name></root>','','<?xml version=\"1.0\"?>\n\n<!--\n\n    Copyright (c) 2000-present Liferay, Inc. All rights reserved.\n\n    This library is free software; you can redistribute it and/or modify it under\n    the terms of the GNU Lesser General Public License as published by the Free\n    Software Foundation; either version 2.1 of the License, or (at your option)\n    any later version.\n\n    This library is distributed in the hope that it will be useful, but WITHOUT\n    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS\n    FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more\n    details.\n\n-->\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element dataType=\"string\" indexType=\"\" name=\"height\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"25\" type=\"text\">\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Carousel Height]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[320]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"\" multiple=\"false\" name=\"duration\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"\" type=\"select\">\n		<dynamic-element name=\"optionhfsq\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[1]]></entry>\n				<entry name=\"label\"><![CDATA[option1]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionslzu\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[2]]></entry>\n				<entry name=\"label\"><![CDATA[option2]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionilxj\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[3]]></entry>\n				<entry name=\"label\"><![CDATA[option3]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionbkmu\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[4]]></entry>\n				<entry name=\"label\"><![CDATA[option4]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionpysy\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[5]]></entry>\n				<entry name=\"label\"><![CDATA[option5]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionuief\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[6]]></entry>\n				<entry name=\"label\"><![CDATA[option6]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionprim\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[7]]></entry>\n				<entry name=\"label\"><![CDATA[option7]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionmuqw\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[8]]></entry>\n				<entry name=\"label\"><![CDATA[option8]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionwezu\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[9]]></entry>\n				<entry name=\"label\"><![CDATA[option9]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element name=\"optionhvrg\" type=\"option\" value=\"option\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[10]]></entry>\n				<entry name=\"label\"><![CDATA[option10]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Transition Duration]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[[\"5\"]]]></entry>\n		</meta-data>\n	</dynamic-element>\n	<dynamic-element dataType=\"string\" indexType=\"\" name=\"carousel-item\" readOnly=\"false\" repeatable=\"true\" required=\"false\" showLabel=\"true\" width=\"25\" type=\"text\">\n		<dynamic-element dataType=\"string\" indexType=\"\" name=\"tagline\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"25\" type=\"text\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Item Tagline]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element dataType=\"string\" fieldNamespace=\"ddm\" indexType=\"\" name=\"image\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"\" type=\"ddm-documentlibrary\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Item Image]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<dynamic-element dataType=\"string\" fieldNamespace=\"ddm\" indexType=\"\" name=\"url-location\" readOnly=\"false\" repeatable=\"false\" required=\"false\" showLabel=\"true\" width=\"25\" type=\"ddm-link-to-page\">\n			<meta-data locale=\"en_US\">\n				<entry name=\"label\"><![CDATA[Item Url]]></entry>\n				<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n			</meta-data>\n		</dynamic-element>\n		<meta-data locale=\"en_US\">\n			<entry name=\"label\"><![CDATA[Carousel Item]]></entry>\n			<entry name=\"predefinedValue\"><![CDATA[]]></entry>\n		</meta-data>\n	</dynamic-element>\n</root>','xml',0);

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

insert  into `ddmstructurelink`(`structureLinkId`,`classNameId`,`classPK`,`structureId`) values (11357,10091,11353,10316),(11365,10091,11362,10316),(11369,10091,11366,10316),(11373,10091,11370,10316),(11470,10091,11467,10316),(11477,10091,11474,10316),(11481,10091,11478,10316),(11485,10091,11482,10316),(17722,10091,17719,10316),(17740,10091,17737,10316),(18341,10091,18338,10316),(18359,10091,18356,10316),(18377,10091,18374,10316),(18422,10091,18419,10316),(19198,10091,19195,10316),(19216,10091,19213,10316),(19234,10091,19231,10316),(19292,10091,19289,10316),(19311,10091,19308,10316);

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

insert  into `ddmtemplate`(`uuid_`,`templateId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`templateKey`,`name`,`description`,`type_`,`mode_`,`language`,`script`,`cacheable`,`smallImage`,`smallImageId`,`smallImageURL`) values ('6b88cb53-50dd-41c0-b628-d5450b6f9a91',10419,10195,10155,10159,'','2015-07-17 19:13:56','2015-07-17 19:13:56',10016,0,'WIKI-SOCIAL-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Social</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays social bookmarks and ratings for wiki pages and their child pages.</Description></root>','display','','ftl','<#assign liferay_ui = taglibLiferayHash[\"/WEB-INF/tld/liferay-ui.tld\"] />\n\n<#assign wikiPageClassName = \"com.liferay.portlet.wiki.model.WikiPage\" />\n\n<#assign assetRenderer = assetEntry.getAssetRenderer() />\n\n<div class=\"taglib-header\">\n	<h1 class=\"header-title\">${entry.getTitle()}</h1>\n</div>\n\n<div style=\"float: right;\">\n	<@getEditIcon />\n\n	<@getPageDetailsIcon />\n\n	<@getPrintIcon />\n</div>\n\n<div class=\"wiki-body\">\n	<div class=\"wiki-info\">\n		<span class=\"stats\">${assetEntry.getViewCount()} <@liferay.language key=\"views\" /></span> |\n\n		<span class=\"date\"><@liferay.language key=\"last-modified\" /> ${dateUtil.getDate(entry.getModifiedDate(), \"dd MMM yyyy - HH:mm:ss\", locale)}</span>\n\n		<span class=\"author\"><@liferay.language key=\"by\" /> ${htmlUtil.escape(portalUtil.getUserName(entry.getUserId(), entry.getUserName()))}</span>\n	</div>\n\n	<div class=\"wiki-content\">\n		<@liferay_ui[\"social-bookmarks\"]\n			displayStyle=\"normal\"\n			target=\"_blank\"\n			title=entry.getTitle()\n			url=viewURL\n		/>\n\n		${formattedContent}\n	</div>\n\n	<div class=\"page-actions\">\n		<div class=\"article-actions\">\n			<@getAddChildPageIcon />\n\n			<@getAttatchmentsIcon />\n		</div>\n	</div>\n\n	 <br />\n\n	<@getRatings cssClass=\"page-ratings\" entry=entry />\n\n	<@getRelatedAssets />\n</div>\n\n<div class=\"page-categorization\">\n	<div class=\"page-categories\">\n		<#assign viewCategorizedPagesURL = renderResponse.createRenderURL() />\n\n		${viewCategorizedPagesURL.setParameter(\"struts_action\", \"/wiki/view_categorized_pages\")}\n		${viewCategorizedPagesURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n\n		<@liferay_ui[\"asset-categories-summary\"]\n			className=wikiPageClassName\n			classPK=entry.getResourcePrimKey()\n			portletURL=viewCategorizedPagesURL\n		/>\n	</div>\n\n	<div class=\"page-tags\">\n		<#assign viewTaggedPagesURL = renderResponse.createRenderURL() />\n\n		${viewTaggedPagesURL.setParameter(\"struts_action\", \"/wiki/view_tagged_pages\")}\n		${viewTaggedPagesURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n\n		<@liferay_ui[\"asset-tags-summary\"]\n			className=wikiPageClassName\n			classPK=entry.getResourcePrimKey()\n			portletURL=viewTaggedPagesURL\n		/>\n	</div>\n</div>\n\n<#assign childPages = entry.getChildPages() />\n\n<#if (childPages?has_content)>\n	<div class=\"child-pages\">\n		<h2><@liferay.language key=\"children-pages\" /></h2>\n\n		<table class=\"taglib-search-iterator\">\n			<tr class=\"portlet-section-header results-header\">\n				<th>\n					<@liferay.language key=\"page\" />\n				</th>\n				<th>\n					<@liferay.language key=\"last-modified\" />\n				</th>\n				<th>\n					<@liferay.language key=\"ratings\" />\n				</th>\n			</tr>\n\n			<#list childPages as childPage>\n				<tr class=\"results-row\">\n					<#assign viewPageURL = renderResponse.createRenderURL() />\n\n					${viewPageURL.setParameter(\"struts_action\", \"/wiki/view\")}\n\n					<#assign childNode = childPage.getNode() />\n\n					${viewPageURL.setParameter(\"nodeName\", childNode.getName())}\n					${viewPageURL.setParameter(\"title\", childPage.getTitle())}\n\n					<td>\n						<a href=\"${viewPageURL}\">${childPage.getTitle()}</a>\n					</td>\n					<td>\n						<a href=\"${viewPageURL}\">${dateUtil.getDate(childPage.getModifiedDate(),\"dd MMM yyyy - HH:mm:ss\", locale)} <@liferay.language key=\"by\" /> ${htmlUtil.escape(portalUtil.getUserName(childPage.getUserId(), childPage.getUserName()))}</a>\n					</td>\n					<td>\n						<@getRatings cssClass=\"child-ratings\" entry=childPage />\n					</td>\n				</tr>\n			</#list>\n		</table>\n	</div>\n</#if>\n\n<@getDiscussion />\n\n<#macro getAddChildPageIcon>\n	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>\n		<#assign addPageURL = renderResponse.createRenderURL() />\n\n		${addPageURL.setParameter(\"struts_action\", \"/wiki/edit_page\")}\n		${addPageURL.setParameter(\"redirect\", currentURL)}\n		${addPageURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n		${addPageURL.setParameter(\"title\", \"\")}\n		${addPageURL.setParameter(\"editTitle\", \"1\")}\n		${addPageURL.setParameter(\"parentTitle\", entry.getTitle())}\n\n		<@liferay_ui[\"icon\"]\n			image=\"add_article\"\n			label=true\n			message=\"add-child-page\"\n			url=addPageURL?string\n		/>\n	</#if>\n</#macro>\n\n<#macro getAttatchmentsIcon>\n	<#assign viewPageAttachmentsURL = renderResponse.createRenderURL() />\n\n	${viewPageAttachmentsURL.setParameter(\"struts_action\", \"/wiki/view_page_attachments\") }\n\n	<@liferay_ui[\"icon\"]\n		image=\"clip\"\n		label=true\n		message=\'${entry.getAttachmentsFileEntriesCount() + languageUtil.get(locale, \"attachments\")}\'\n		url=viewPageAttachmentsURL?string\n	/>\n</#macro>\n\n<#macro getDiscussion>\n	<#if validator.isNotNull(assetRenderer.getDiscussionPath()) && (enableComments == \"true\")>\n		<br />\n\n		<#assign discussionURL = renderResponse.createActionURL() />\n\n		${discussionURL.setParameter(\"struts_action\", \"/wiki/\" + assetRenderer.getDiscussionPath())}\n\n		<@liferay_ui[\"discussion\"]\n			className=wikiPageClassName\n			classPK=entry.getResourcePrimKey()\n			formAction=discussionURL?string\n			formName=\"fm2\"\n			ratingsEnabled=enableCommentRatings == \"true\"\n			redirect=currentURL\n			subject=assetRenderer.getTitle(locale)\n			userId=assetRenderer.getUserId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getEditIcon>\n	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>\n		<#assign editPageURL = renderResponse.createRenderURL() />\n\n		${editPageURL.setParameter(\"struts_action\", \"/wiki/edit_page\")}\n		${editPageURL.setParameter(\"redirect\", currentURL)}\n		${editPageURL.setParameter(\"nodeId\", entry.getNodeId()?string)}\n		${editPageURL.setParameter(\"title\", entry.getTitle())}\n\n		<@liferay_ui[\"icon\"]\n			image=\"edit\"\n			message=entry.getTitle()\n			url=editPageURL?string\n		/>\n	</#if>\n</#macro>\n\n<#macro getPageDetailsIcon>\n	<#assign viewPageDetailsURL = renderResponse.createRenderURL() />\n\n	${viewPageDetailsURL.setParameter(\"struts_action\", \"/wiki/view_page_details\")}\n	${viewPageDetailsURL.setParameter(\"redirect\", currentURL)}\n\n	<@liferay_ui[\"icon\"]\n		image=\"history\"\n		message=\"details\"\n		url=viewPageDetailsURL?string\n	/>\n</#macro>\n\n<#macro getPrintIcon>\n	<#assign printURL = renderResponse.createRenderURL() />\n\n	${printURL.setParameter(\"viewMode\", \"print\")}\n	${printURL.setWindowState(\"pop_up\")}\n\n	<#assign title = languageUtil.format(locale, \"print-x-x\", [\"hide-accessible\", htmlUtil.escape(assetRenderer.getTitle(locale))]) />\n	<#assign taglibPrintURL = \"javascript:Liferay.Util.openWindow({dialog: {width: 960}, id:\'\" + renderResponse.getNamespace() + \"printAsset\', title: \'\" + title + \"\', uri: \'\" + htmlUtil.escapeURL(printURL.toString()) + \"\'});\" />\n\n	<@liferay_ui[\"icon\"]\n		image=\"print\"\n		message=\"print\"\n		url=taglibPrintURL\n	/>\n</#macro>\n\n<#macro getRatings\n	cssClass\n	entry\n>\n	<#if enablePageRatings == \"true\">\n		<div class=\"${cssClass}\">\n			<@liferay_ui[\"ratings\"]\n				className=wikiPageClassName\n				classPK=entry.getResourcePrimKey()\n			/>\n		</div>\n	</#if>\n</#macro>\n\n<#macro getRelatedAssets>\n	<#if assetEntry?? && (enableRelatedAssets == \"true\")>\n		<@liferay_ui[\"asset-links\"]\n			assetEntryId=assetEntry.getEntryId()\n		/>\n	</#if>\n</#macro>',0,0,10420,''),('2547cdb5-93c0-4919-8025-67989cdc5bd5',10421,10195,10155,10159,'','2015-07-17 19:13:57','2015-07-17 19:13:57',10081,0,'ASSET-CATEGORIES-NAVIGATION-MULTI-COLUMN-LAYOUT-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Multi Column Layout</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays a column for each vocabulary. Each column includes the name of a vocabulary with the vocabulary\'s top level categories listed underneath.</Description></root>','display','','ftl','<#assign aui = taglibLiferayHash[\"/WEB-INF/tld/aui.tld\"] />\n\n<#if entries?has_content>\n	<@aui.layout>\n		<#list entries as entry>\n			<@aui.column columnWidth=25>\n				<div class=\"results-header\">\n					<h3>\n						${entry.getName()}\n					</h3>\n				</div>\n\n				<#assign categories = entry.getCategories()>\n\n				<@displayCategories categories=categories />\n			</@aui.column>\n		</#list>\n	</@aui.layout>\n</#if>\n\n<#macro displayCategories\n	categories\n>\n	<#if categories?has_content>\n		<ul class=\"categories\">\n			<#list categories as category>\n				<li>\n					<#assign categoryURL = renderResponse.createRenderURL()>\n\n					${categoryURL.setParameter(\"resetCur\", \"true\")}\n					${categoryURL.setParameter(\"categoryId\", category.getCategoryId()?string)}\n\n					<a href=\"${categoryURL}\">${category.getName()}</a>\n\n					<#if serviceLocator??>\n						<#assign assetCategoryService = serviceLocator.findService(\"com.liferay.portlet.asset.service.AssetCategoryService\")>\n\n						<#assign childCategories = assetCategoryService.getChildCategories(category.getCategoryId())>\n\n						<@displayCategories categories=childCategories />\n					</#if>\n				</li>\n			</#list>\n		</ul>\n	</#if>\n</#macro>',0,0,10422,''),('b7e34b99-f5c0-4bbd-bd15-213449df8559',10424,10195,10155,10159,'','2015-07-17 19:13:57','2015-07-17 19:13:57',10423,0,'DOCUMENTLIBRARY-CAROUSEL-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays images in a carousel.</Description></root>','display','','ftl','<#assign aui = taglibLiferayHash[\"/WEB-INF/tld/aui.tld\"] />\n<#assign liferay_portlet = taglibLiferayHash[\"/WEB-INF/tld/liferay-portlet.tld\"] />\n\n<#if entries?has_content>\n	<style>\n		#<@liferay_portlet.namespace />carousel .carousel-item {\n			background-color: #000;\n			height: 250px;\n			overflow: hidden;\n			text-align: center;\n			width: 700px;\n		}\n\n		#<@liferay_portlet.namespace />carousel .carousel-item img {\n			max-height: 250px;\n			max-width: 700px;\n		}\n	</style>\n\n	<div id=\"<@liferay_portlet.namespace />carousel\">\n		<#assign imageMimeTypes = propsUtil.getArray(\"dl.file.entry.preview.image.mime.types\") />\n\n		<#list entries as entry>\n			<#if imageMimeTypes?seq_contains(entry.getMimeType()) >\n				<div class=\"carousel-item\">\n					<img src=\"${dlUtil.getPreviewURL(entry, entry.getFileVersion(), themeDisplay, \"\")}\" />\n				</div>\n			</#if>\n		</#list>\n	</div>\n\n	<@aui.script use=\"aui-carousel\">\n		new A.Carousel(\n			{\n				contentBox: \'#<@liferay_portlet.namespace />carousel\',\n				height: 250,\n				intervalTime: 2,\n				width: 700\n			}\n		).render();\n	</@aui.script>\n</#if>',0,0,10425,''),('47c64d2b-37a8-4417-9f14-87369e3c1c88',10426,10195,10155,10159,'','2015-07-17 19:13:57','2015-07-17 19:13:57',10083,0,'ASSET-PUBLISHER-RICH-SUMMARY-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Rich Summary</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays abstracts, icons, related assets, and print/edit actions for assets. Optionally include asset bookmarks and ratings.</Description></root>','display','','ftl','<#assign liferay_ui = taglibLiferayHash[\"/WEB-INF/tld/liferay-ui.tld\"] />\n\n<#list entries as entry>\n	<#assign entry = entry />\n\n	<#assign assetRenderer = entry.getAssetRenderer() />\n\n	<#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />\n\n	<#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />\n\n	<#if assetLinkBehavior != \"showFullContent\">\n		<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, viewURL) />\n	</#if>\n\n	<div class=\"asset-abstract\">\n		<div class=\"lfr-meta-actions asset-actions\">\n			<@getPrintIcon />\n\n			<@getFlagsIcon />\n\n			<@getEditIcon />\n		</div>\n\n		<h3 class=\"asset-title\">\n			<a href=\"${viewURL}\"><img alt=\"\" src=\"${assetRenderer.getIconPath(renderRequest)}\" />${entryTitle}</a>\n		</h3>\n\n		<@getMetadataField fieldName=\"tags\" />\n\n		<@getMetadataField fieldName=\"create-date\" />\n\n		<@getMetadataField fieldName=\"view-count\" />\n\n		<div class=\"asset-content\">\n			<@getSocialBookmarks />\n\n			<div class=\"asset-summary\">\n				<@getMetadataField fieldName=\"author\" />\n\n				${htmlUtil.escape(assetRenderer.getSummary(locale))}\n\n				<a href=\"${viewURL}\"><@liferay.language key=\"read-more\" /><span class=\"hide-accessible\"><@liferay.language key=\"about\" />${entryTitle}</span> &raquo;</a>\n			</div>\n\n			<@getRatings />\n\n			<@getRelatedAssets />\n\n			<@getDiscussion />\n		</div>\n	</div>\n\n</#list>\n\n<#macro getDiscussion>\n	<#if validator.isNotNull(assetRenderer.getDiscussionPath()) && (enableComments == \"true\")>\n		<br />\n\n		<#assign discussionURL = renderResponse.createActionURL() />\n\n		${discussionURL.setParameter(\"struts_action\", \"/asset_publisher/\" + assetRenderer.getDiscussionPath())}\n\n		<@liferay_ui[\"discussion\"]\n			className=entry.getClassName()\n			classPK=entry.getClassPK()\n			formAction=discussionURL?string\n			formName=\"fm\" + entry.getClassPK()\n			ratingsEnabled=enableCommentRatings == \"true\"\n			redirect=portalUtil.getCurrentURL(request)\n			userId=assetRenderer.getUserId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getEditIcon>\n	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>\n		<#assign redirectURL = renderResponse.createRenderURL() />\n\n		${redirectURL.setParameter(\"struts_action\", \"/asset_publisher/add_asset_redirect\")}\n		${redirectURL.setWindowState(\"pop_up\")}\n\n		<#assign editPortletURL = assetRenderer.getURLEdit(renderRequest, renderResponse, windowStateFactory.getWindowState(\"pop_up\"), redirectURL)!\"\" />\n\n		<#if validator.isNotNull(editPortletURL)>\n			<#assign title = languageUtil.format(locale, \"edit-x\", entryTitle) />\n\n			<@liferay_ui[\"icon\"]\n				image=\"edit\"\n				message=title\n				url=\"javascript:Liferay.Util.openWindow({dialog: {width: 960}, id:\'\" + renderResponse.getNamespace() + \"editAsset\', title: \'\" + title + \"\', uri:\'\" + htmlUtil.escapeURL(editPortletURL.toString()) + \"\'});\"\n			/>\n		</#if>\n	</#if>\n</#macro>\n\n<#macro getFlagsIcon>\n	<#if enableFlags == \"true\">\n		<@liferay_ui[\"flags\"]\n			className=entry.getClassName()\n			classPK=entry.getClassPK()\n			contentTitle=entry.getTitle(locale)\n			label=false\n			reportedUserId=entry.getUserId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getMetadataField\n	fieldName\n>\n	<#if stringUtil.split(metadataFields)?seq_contains(fieldName)>\n		<span class=\"metadata-entry metadata-\"${fieldName}\">\n			<#assign dateFormat = \"dd MMM yyyy - HH:mm:ss\" />\n\n			<#if fieldName == \"author\">\n				<@liferay.language key=\"by\" /> ${portalUtil.getUserName(assetRenderer.getUserId(), assetRenderer.getUserName())}\n			<#elseif fieldName == \"categories\">\n				<@liferay_ui[\"asset-categories-summary\"]\n					className=entry.getClassName()\n					classPK=entry.getClassPK()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			<#elseif fieldName == \"create-date\">\n				${dateUtil.getDate(entry.getCreateDate(), dateFormat, locale)}\n			<#elseif fieldName == \"expiration-date\">\n				${dateUtil.getDate(entry.getExpirationDate(), dateFormat, locale)}\n			<#elseif fieldName == \"modified-date\">\n				${dateUtil.getDate(entry.getModifiedDate(), dateFormat, locale)}\n			<#elseif fieldName == \"priority\">\n				${entry.getPriority()}\n			<#elseif fieldName == \"publish-date\">\n				${dateUtil.getDate(entry.getPublishDate(), dateFormat, locale)}\n			<#elseif fieldName == \"tags\">\n				<@liferay_ui[\"asset-tags-summary\"]\n					className=entry.getClassName()\n					classPK=entry.getClassPK()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			<#elseif fieldName == \"view-count\">\n				<@liferay_ui[\"icon\"]\n					image=\"history\"\n				/>\n\n				${entry.getViewCount()} <@liferay.language key=\"views\" />\n			</#if>\n		</span>\n	</#if>\n</#macro>\n\n<#macro getPrintIcon>\n	<#if enablePrint == \"true\" >\n		<#assign printURL = renderResponse.createRenderURL() />\n\n		${printURL.setParameter(\"struts_action\", \"/asset_publisher/view_content\")}\n		${printURL.setParameter(\"assetEntryId\", entry.getEntryId()?string)}\n		${printURL.setParameter(\"viewMode\", \"print\")}\n		${printURL.setParameter(\"type\", entry.getAssetRendererFactory().getType())}\n\n		<#if (validator.isNotNull(assetRenderer.getUrlTitle()))>\n			<#if (assetRenderer.getGroupId() != themeDisplay.getScopeGroupId())>\n				${printURL.setParameter(\"groupId\", assetRenderer.getGroupId()?string)}\n			</#if>\n\n			${printURL.setParameter(\"urlTitle\", assetRenderer.getUrlTitle())}\n		</#if>\n\n		${printURL.setWindowState(\"pop_up\")}\n\n		<@liferay_ui[\"icon\"]\n			image=\"print\"\n			message=\"print\"\n			url=\"javascript:Liferay.Util.openWindow({id:\'\" + renderResponse.getNamespace() + \"printAsset\', title: \'\" + languageUtil.format(locale, \"print-x-x\", [\"hide-accessible\", entryTitle]) + \"\', uri: \'\" + htmlUtil.escapeURL(printURL.toString()) + \"\'});\"\n		/>\n	</#if>\n</#macro>\n\n<#macro getRatings>\n	<#if (enableRatings == \"true\")>\n		<div class=\"asset-ratings\">\n			<@liferay_ui[\"ratings\"]\n				className=entry.getClassName()\n				classPK=entry.getClassPK()\n			/>\n		</div>\n	</#if>\n</#macro>\n\n<#macro getRelatedAssets>\n	<#if enableRelatedAssets == \"true\">\n		<@liferay_ui[\"asset-links\"]\n			assetEntryId=entry.getEntryId()\n		/>\n	</#if>\n</#macro>\n\n<#macro getSocialBookmarks>\n	<#if enableSocialBookmarks == \"true\">\n		<@liferay_ui[\"social-bookmarks\"]\n			displayStyle=\"${socialBookmarksDisplayStyle}\"\n			target=\"_blank\"\n			title=entry.getTitle(locale)\n			url=viewURL\n		/>\n	</#if>\n</#macro>',0,0,10427,''),('638d2ce8-35f9-4791-bf6e-98d3d8b41b1f',10428,10195,10155,10159,'','2015-07-17 19:13:57','2015-07-17 19:13:57',10034,0,'SITE-MAP-MULTI-COLUMN-LAYOUT-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Multi Column Layout</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays a column for each top level page. Each column includes the name of a top level page with the page\'s immediate children listed underneath.</Description></root>','display','','ftl','<#assign aui = taglibLiferayHash[\"/WEB-INF/tld/aui.tld\"] />\n\n<#if entries?has_content>\n	<@aui.layout>\n		<#list entries as entry>\n		    <@aui.column columnWidth=25>\n				<div class=\"results-header\">\n					<h3>\n						<#assign layoutURL = portalUtil.getLayoutURL(entry, themeDisplay)>\n\n						<a href=\"${layoutURL}\">${entry.getName(locale)}</a>\n					</h3>\n				</div>\n\n				<#assign pages = entry.getChildren()>\n\n				<@displayPages pages = pages />\n		    </@aui.column>\n		</#list>\n	</@aui.layout>\n</#if>\n\n<#macro displayPages\n	pages\n>\n	<#if pages?has_content>\n		<ul class=\"child-pages\">\n			<#list pages as page>\n				<li>\n					<#assign pageLayoutURL = portalUtil.getLayoutURL(page, themeDisplay)>\n\n					<a href=\"${pageLayoutURL}\">${page.getName(locale)}</a>\n\n					<#assign childPages = page.getChildren()>\n\n					<@displayPages pages = childPages />\n				</li>\n			</#list>\n		</ul>\n	</#if>\n</#macro>',0,0,10429,''),('fedb8e82-814a-4d84-a4ef-f2534d6c57e1',10430,10195,10155,10159,'','2015-07-17 19:13:57','2015-07-17 19:13:57',10085,0,'ASSET-TAGS-NAVIGATION-COLOR-BY-POPULARITY-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Color by Popularity</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays asset tags colored by popularity: red (high), yellow (medium), and green (low).</Description></root>','display','','ftl','<#if entries?has_content>\n	<ul class=\"tag-items tag-list\">\n		<#assign scopeGroupId = getterUtil.getLong(scopeGroupId, themeDisplay.getScopeGroupId()) />\n		<#assign classNameId = getterUtil.getLong(classNameId, 0) />\n\n		<#assign maxCount = 1 />\n		<#assign minCount = 1 />\n\n		<#list entries as entry>\n			<#assign maxCount = liferay.max(maxCount, entry.getAssetCount()) />\n			<#assign minCount = liferay.min(minCount, entry.getAssetCount()) />\n		</#list>\n\n		<#assign multiplier = 1 />\n\n		<#if maxCount != minCount>\n			<#assign multiplier = 3 / (maxCount - minCount) />\n		</#if>\n\n		<#list entries as entry>\n			<li class=\"taglib-asset-tags-summary\">\n				<#assign popularity = (maxCount - (maxCount - (entry.getAssetCount() - minCount))) * multiplier />\n\n				<#if popularity < 1>\n					<#assign color = \"green\" />\n				<#elseif (popularity >= 1) && (popularity < 2)>\n					<#assign color = \"orange\" />\n				<#else>\n					<#assign color = \"red\" />\n				</#if>\n\n				<#assign tagURL = renderResponse.createRenderURL() />\n\n				${tagURL.setParameter(\"resetCur\", \"true\")}\n				${tagURL.setParameter(\"tag\", entry.getName())}\n\n				<a class =\"tag\" style=\"color: ${color};\" href=\"${tagURL}\">\n					${entry.getName()}\n\n					<#if (showAssetCount == \"true\")>\n						<span class=\"tag-asset-count\">(${count})</span>\n					</#if>\n				</a>\n			</li>\n		</#list>\n	</ul>\n\n	<br style=\"clear: both;\" />\n</#if>',0,0,10431,''),('f072b565-0007-47e6-aec0-c575fd569060',10432,10195,10155,10159,'','2015-07-17 19:13:57','2015-07-17 19:13:57',10007,0,'BLOGS-BASIC-FTL','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Basic</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Displays titles, authors, and abstracts compactly for blog entries.</Description></root>','display','','ftl','<#assign liferay_ui = taglibLiferayHash[\"/WEB-INF/tld/liferay-ui.tld\"] />\n\n<#list entries as entry>\n	<div class=\"entry\">\n		<#assign viewURL = renderResponse.createRenderURL() />\n\n		${viewURL.setParameter(\"struts_action\", \"/blogs/view_entry\")}\n		${viewURL.setParameter(\"redirect\", currentURL)}\n		${viewURL.setParameter(\"urlTitle\", entry.getUrlTitle())}\n\n		<div class=\"entry-content\">\n			<div class=\"entry-title\">\n				<h2><a href=\"${viewURL}\">${htmlUtil.escape(entry.getTitle())}</a></h2>\n			</div>\n		</div>\n\n		<div class=\"entry-body\">\n			<div class=\"entry-author\">\n				<@liferay.language key=\"written-by\" /> ${htmlUtil.escape(portalUtil.getUserName(entry.getUserId(), entry.getUserName()))}\n			</div>\n\n			<#assign summary = entry.getDescription() />\n\n			<#if (validator.isNull(summary))>\n				<#assign summary = entry.getContent() />\n			</#if>\n\n			${stringUtil.shorten(htmlUtil.stripHtml(summary), 100)}\n\n			<a href=\"${viewURL}\"><@liferay.language key=\"read-more\" /> <span class=\"hide-accessible\"><@liferay.language key=\"about\"/>${htmlUtil.escape(entry.getTitle())}</span> &raquo;</a>\n		</div>\n\n		<div class=\"entry-footer\">\n			<span class=\"entry-date\">\n				${dateUtil.getDate(entry.getCreateDate(), \"dd MMM yyyy - HH:mm:ss\", locale)}\n			</span>\n\n			<#assign blogsEntryClassName = \"com.liferay.portlet.blogs.model.BlogsEntry\" />\n\n			<#if (enableFlags == \"true\")>\n				<@liferay_ui[\"flags\"]\n					className=blogsEntryClassName\n					classPK=entry.getEntryId()\n					contentTitle=entry.getTitle()\n					reportedUserId=entry.getUserId()\n				/>\n			</#if>\n\n			<span class=\"entry-categories\">\n				<@liferay_ui[\"asset-categories-summary\"]\n					className=blogsEntryClassName\n					classPK=entry.getEntryId()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			</span>\n\n			<span class=\"entry-tags\">\n				<@liferay_ui[\"asset-tags-summary\"]\n					className=blogsEntryClassName\n					classPK=entry.getEntryId()\n					portletURL=renderResponse.createRenderURL()\n				/>\n			</span>\n		</div>\n	</div>\n\n	<div class=\"separator\"><!-- --></div>\n</#list>',0,0,10433,''),('e72b4238-200e-4d20-80eb-345c93457152',10614,10182,10155,10159,'','2015-07-17 19:16:45','2015-07-17 19:16:45',10102,10613,'BASIC-WEB-CONTENT-6.2.2.1','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Basic Web Content - 6.2.2.1</Name></root>','','display','','vm','${content.getData()}',0,0,10615,''),('03c5e9df-6f87-4626-bf77-20357b659abc',11358,11305,10155,10159,'','2015-08-03 19:04:45','2015-08-03 19:04:45',10102,11354,'CAROUSEL-6.2.0.1','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel - 6.2.0.1</Name></root>','','display','','vm','#set ($article_id = $reserved-article-id.getData())\n#set ($content_id = \"carousel-${article_id}\")\n\n<style>\n	.carousel-container .carousel-item {\n		height: 100%;\n		width: 100%;\n	}\n\n	#${content_id} {\n		height: ${height.data}px;\n	}\n</style>\n\n<div class=\"carousel-container\" id=\"$content_id\">\n	<div class=\"carousel\">\n		#foreach ($item in $carousel-item.siblings)\n			#set ($carousel_item_class = \"carousel-item\")\n\n			#if ($velocityCount == 1)\n				#set ($carousel_item_class = \"$carousel_item_class carousel-item-active\")\n			#end\n\n			#if ($item.url-location.friendlyUrl)\n				<a class=\"$carousel_item_class\" href=\"$item.url-location.friendlyUrl\">\n			#end\n\n			<div class=\"$carousel_item_class\" style=\"background-image: url(${item.image.data});\">\n				#if ($item.tagline.data != \"\")\n					<span class=\"tagline\">\n						<h2>$item.data</h2>\n						$item.tagline.data\n					</span>\n				#end\n			</div>\n\n			#if ($item.url-location.friendlyUrl)\n				</a>\n			#end\n		#end\n	</div>\n</div>\n\n<script type=\"text/javascript\">\n	AUI().ready(\n		\'aui-carousel\',\n		function(A) {\n			new A.Carousel(\n				{\n					contentBox: \'#${content_id} .carousel\',\n					height: $height.data,\n					intervalTime: $duration.data,\n					height: \'100%\',\n					width: \'100%\'\n				}\n			).render();\n		}\n	);\n</script>',0,0,11359,''),('257eb396-b151-4fb9-9b60-0544ccf9f823',11472,11419,10155,10159,'','2015-08-03 19:34:34','2015-08-03 19:34:34',10102,11471,'CAROUSEL-1.0-SNAPSHOT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Carousel - 1.0-SNAPSHOT</Name></root>','','display','','vm','#*\n * Copyright (c) 2000-present Liferay, Inc. All rights reserved.\n *\n * This library is free software; you can redistribute it and/or modify it under\n * the terms of the GNU Lesser General Public License as published by the Free\n * Software Foundation; either version 2.1 of the License, or (at your option)\n * any later version.\n *\n * This library is distributed in the hope that it will be useful, but WITHOUT\n * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS\n * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more\n * details.\n *#\n#set ($article_id = $reserved-article-id.getData())\n#set ($content_id = \"carousel-${article_id}\")\n\n<style>\n	.carousel-container .carousel-item {\n		height: 100%;\n		width: 100%;\n	}\n\n	#${content_id} {\n		height: ${height.data}px;\n	}\n</style>\n\n<div class=\"carousel-container\" id=\"$content_id\">\n	<div class=\"carousel\">\n		#foreach ($item in $carousel-item.siblings)\n			#set ($carousel_item_class = \"carousel-item\")\n\n			#if ($velocityCount == 1)\n				#set ($carousel_item_class = \"$carousel_item_class carousel-item-active\")\n			#end\n\n			#if ($item.url-location.friendlyUrl)\n				<a class=\"$carousel_item_class\" href=\"$item.url-location.friendlyUrl\">\n			#end\n\n			<div class=\"$carousel_item_class\" style=\"background-image: url(${item.image.data});\">\n				#if ($item.tagline.data != \"\")\n					<span class=\"tagline\">\n						<h2>$item.data</h2>\n						$item.tagline.data\n					</span>\n				#end\n			</div>\n\n			#if ($item.url-location.friendlyUrl)\n				</a>\n			#end\n		#end\n	</div>\n</div>\n\n<script type=\"text/javascript\">\n	AUI().ready(\n		\'aui-carousel\',\n		function(A) {\n			new A.Carousel(\n				{\n					contentBox: \'#${content_id} .carousel\',\n					height: $height.data,\n					intervalTime: $duration.data,\n					height: \'100%\',\n					width: \'100%\'\n				}\n			).render();\n		}\n	);\n</script>',0,0,11473,'');

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

insert  into `dlfileentry`(`uuid_`,`fileEntryId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`repositoryId`,`folderId`,`treePath`,`name`,`extension`,`mimeType`,`title`,`description`,`extraSettings`,`fileEntryTypeId`,`version`,`size_`,`readCount`,`smallImageId`,`largeImageId`,`custom1ImageId`,`custom2ImageId`,`manualCheckInRequired`) values ('f26143e4-1fa9-4e30-b484-5fc753f54de8',11316,11305,10155,10159,'','2015-08-03 19:04:37','2015-08-03 19:04:37',0,0,11305,0,'/0/','101','jpg','image/jpeg','morgueFile-1','','',0,'1.0',77763,0,0,0,0,0,0),('d9f97505-a9ca-463c-9e00-5ddfb60686f8',11325,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',0,0,11305,0,'/0/','102','jpg','image/jpeg','morgueFile-3','','',0,'1.0',37409,0,0,0,0,0,0),('9af34929-943e-48ab-91c6-9e7c4dce3947',11333,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',0,0,11305,0,'/0/','103','jpg','image/jpeg','morgueFile-4','','',0,'1.0',84859,0,0,0,0,0,0),('0a03c7b0-34e0-40e1-962f-39463d080ecf',11341,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',0,0,11305,0,'/0/','104','jpg','image/jpeg','morgueFile-2','','',0,'1.0',79041,0,0,0,0,0,0),('5c89cc37-3bf3-4ab6-b198-adc2068635aa',11430,11419,10155,10159,'','2015-08-03 19:34:27','2015-08-03 19:34:27',0,0,11419,0,'/0/','105','jpg','image/jpeg','morgueFile-1','','',0,'1.0',77763,0,0,0,0,0,0),('205151c9-6e58-4b54-b93a-53b8a2d647ea',11439,11419,10155,10159,'','2015-08-03 19:34:30','2015-08-03 19:34:30',0,0,11419,0,'/0/','106','jpg','image/jpeg','morgueFile-3','','',0,'1.0',37409,0,0,0,0,0,0),('6febbec9-0fe4-4b55-b45c-4a8dcbe26572',11448,11419,10155,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',0,0,11419,0,'/0/','107','jpg','image/jpeg','morgueFile-4','','',0,'1.0',84859,0,0,0,0,0,0),('5353ab35-d820-4999-a108-4dd57f38c73b',11458,11419,10155,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',0,0,11419,0,'/0/','108','jpg','image/jpeg','morgueFile-2','','',0,'1.0',79041,0,0,0,0,0,0),('a84b7c7a-6dbb-4982-83a6-66c6c0f23e4f',13228,10182,10155,10199,'Test Test','2015-08-13 21:47:35','2015-08-13 21:47:35',10021,13222,13225,13227,'/13226/13227/','401','lar','application/zip','Private_Pages-201508132146.lar','','',0,'1.0',1077107,1,0,0,0,0,0),('11eaf602-3d60-4718-ae87-f8110b561a33',13234,10182,10155,10199,'Test Test','2015-08-13 21:47:59','2015-08-13 21:47:59',10021,13231,13225,13233,'/13226/13233/','402','lar','application/zip','Public_Pages-201508132147.lar','','',0,'1.0',1070669,1,0,0,0,0,0),('ad49bb74-caee-4f58-a0e6-a35c3000cd20',14004,10182,10155,10199,'Test Test','2015-08-23 07:22:36','2015-08-23 07:22:36',10021,14001,13225,14003,'/13226/14003/','601','lar','application/zip','Public_Pages-201508230722.lar','','',0,'1.0',1081243,0,0,0,0,0,0),('c4fb01df-877a-4354-8f79-f2c662486966',14009,10182,10155,10199,'Test Test','2015-08-23 07:23:02','2015-08-23 07:23:02',10021,14006,13225,14008,'/13226/14008/','602','lar','application/zip','Public_Pages-201508230722.lar','','',0,'1.0',1081185,1,0,0,0,0,0),('8f6499c3-5eb2-4288-b90d-1670bc1c609f',14015,10182,10155,10199,'Test Test','2015-08-23 07:23:29','2015-08-23 07:23:29',10021,14012,13225,14014,'/13226/14014/','603','lar','application/zip','Private_Pages-201508230723.lar','','',0,'1.0',1084317,1,0,0,0,0,0),('8ffe4eab-7399-45d6-be9a-020f76d01b4c',15604,10182,10155,10199,'Test Test','2015-09-14 19:42:34','2015-09-14 19:42:34',10021,15601,13225,15603,'/13226/15603/','1601','lar','application/zip','Public_Pages-201509141942.lar','','',0,'1.0',970051,1,0,0,0,0,0),('8189ced1-4cc6-4d44-8611-e70a602fc66a',15610,10182,10155,10199,'Test Test','2015-09-14 19:42:55','2015-09-14 19:42:55',10021,15607,13225,15609,'/13226/15609/','1602','lar','application/zip','Private_Pages-201509141942.lar','','',0,'1.0',979721,1,0,0,0,0,0),('f0f9261c-f936-4d55-8bd7-c439181af63b',17709,10182,10155,10199,'Gautam Sharma','2015-10-22 19:29:07','2015-10-22 19:29:07',0,0,10182,17705,'/17601/17705/','2103','txt','text/plain','faq_page (1).txt','faq_page (1).txt','',0,'1.0',85,1,0,0,0,0,0),('2f1c5ccf-9a97-4064-9582-95f72f57800b',17727,10182,10155,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55',0,0,10182,17723,'/17601/17723/','2104','txt','text/plain','faq_page.txt','faq_page.txt','',0,'1.0',85,0,0,0,0,0,0),('59eba706-a80e-4067-a8b9-37a83f24aa3a',18328,10182,10155,10199,'Gautam Sharma','2015-11-02 17:54:21','2015-11-02 17:54:21',0,0,10182,18324,'/17601/18324/','2201','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','',0,'1.0',57939,0,0,0,0,0,0),('8f61a626-4e3b-4e06-ae6e-b16475d819c9',18346,10182,10155,17001,'Colin LEVINS','2015-11-02 18:08:28','2015-11-02 18:08:28',0,0,10182,18342,'/17601/18342/','2202','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','',0,'1.0',57939,0,0,0,0,0,0),('7c49521f-b4af-4ee4-a8c7-0f715212f9c0',18364,10182,10155,10199,'Gautam Sharma','2015-11-02 18:17:34','2015-11-02 18:17:34',0,0,10182,18360,'/17601/18360/','2203','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','',0,'1.0',57939,0,0,0,0,0,0),('4f099e3d-4255-4f58-83e4-a8daa0c33afc',18409,10182,10155,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15',0,0,10182,18405,'/17601/18405/','2204','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','',0,'1.0',57939,3,0,0,0,0,0),('4976b1d8-0731-4404-9ce1-5ec520a71252',19185,10182,10155,17001,'Colin LEVINS','2015-12-27 17:31:40','2015-12-27 17:31:40',0,0,10182,19181,'/14301/19181/','2301','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','',0,'1.0',8609,0,0,0,0,0,0),('1aa05a74-a0f8-4801-b3c1-967d3cb7c99d',19203,10182,10155,17001,'Colin LEVINS','2015-12-27 17:41:25','2015-12-27 17:41:25',0,0,10182,19199,'/14301/19199/','2302','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','',0,'1.0',8609,0,0,0,0,0,0),('372ebab2-d19d-4ecd-890b-524d47e80668',19221,10182,10155,17001,'Colin LEVINS','2015-12-27 17:57:05','2015-12-27 17:57:05',0,0,10182,19217,'/14301/19217/','2303','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','',0,'1.0',8609,0,0,0,0,0,0),('026b9efb-b044-456c-b3b9-129746e700d6',19279,10182,10155,17001,'Colin LEVINS','2015-12-27 20:22:37','2015-12-27 20:22:37',0,0,10182,19275,'/14301/19275/','2304','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','',0,'1.0',8670,1,0,0,0,0,0),('0d4ec121-4f11-4cba-94cb-7dfaf9e1a4f9',19298,10182,10155,17001,'Colin LEVINS','2015-12-27 20:35:39','2015-12-27 20:35:39',0,0,10182,19294,'/14301/19294/','2305','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','',0,'1.0',8670,1,0,0,0,0,0),('80b6a621-cdf2-43f9-9f7b-ec86d8cd84b9',20604,10182,10155,10199,'Gautam Sharma','2016-01-25 04:53:55','2016-01-25 04:53:55',10021,20601,13225,20603,'/13226/20603/','2401','lar','application/zip','Public_Pages-201601250453.lar','','',0,'1.0',941190,1,0,0,0,0,0),('21bac29e-d808-4dc8-8013-db6b9dab2eed',20610,10182,10155,10199,'Gautam Sharma','2016-01-25 04:54:30','2016-01-25 04:54:30',10021,20607,13225,20609,'/13226/20609/','2402','lar','application/zip','Private_Pages-201601250454.lar','','',0,'1.0',958249,1,0,0,0,0,0);

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

insert  into `dlfileentrymetadata`(`uuid_`,`fileEntryMetadataId`,`DDMStorageId`,`DDMStructureId`,`fileEntryTypeId`,`fileEntryId`,`fileVersionId`) values ('fb0a3532-3044-4946-aa24-0e50efa50262',11353,11355,10316,0,11316,11317),('d21553ce-bf01-4c4b-905e-860480b5b62a',11362,11363,10316,0,11325,11326),('967a3d2e-0839-4155-a4e0-40ada0cf58fe',11366,11367,10316,0,11333,11334),('fe3cd5c8-bee5-48ea-9066-f01a14a3401a',11370,11371,10316,0,11341,11342),('921130fe-06df-4fbe-aedd-6b3924db91da',11467,11468,10316,0,11430,11431),('4a4db6de-2699-4c4e-adde-e1b10ebf6f06',11474,11475,10316,0,11439,11440),('24c1a045-3c71-4803-adaa-881e1cb0d2a1',11478,11479,10316,0,11448,11449),('28b8a32b-eb64-4963-b314-eee6fbcb19ab',11482,11483,10316,0,11458,11459),('8a0b5db4-3346-4407-b6ba-1aaa230baba2',17719,17720,10316,0,17709,17710),('519eca50-387d-4d73-bc20-980906025a14',17737,17738,10316,0,17727,17728),('79a6a03f-c0d3-4681-8f3d-13e4f32d9c30',18338,18339,10316,0,18328,18329),('e31089bb-7ec5-4fd3-9996-d55f4b5d3dc9',18356,18357,10316,0,18346,18347),('fe6ab392-57d2-4241-9869-caf61beaf67b',18374,18375,10316,0,18364,18365),('60c972fd-d8d5-47f5-8041-507002117880',18419,18420,10316,0,18409,18410),('204830ad-3708-4ff6-ad7f-1ae9c0696553',19195,19196,10316,0,19185,19186),('61b67972-b431-41ef-9dbd-87ddb7ae5f82',19213,19214,10316,0,19203,19204),('36bf126e-eb66-4d58-9061-9f8f6699c0ca',19231,19232,10316,0,19221,19222),('5896461c-6f39-4bbb-9e8c-679f5e1a5cac',19289,19290,10316,0,19279,19280),('5ccfd2ee-ab69-4345-97d4-6b3271d4dfc1',19308,19309,10316,0,19298,19299);

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

insert  into `dlfileentrytype`(`uuid_`,`fileEntryTypeId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`fileEntryTypeKey`,`name`,`description`) values ('fc64ccdf-5d8b-4eb7-b791-47468b731b72',0,0,0,0,'','2015-07-17 19:13:15','2015-07-17 19:13:15','BASIC-DOCUMENT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">basic-document</Name></root>',''),('b0f5dfa6-d457-47fc-ad92-8f7c97757a29',10307,10195,10155,10159,'','2015-07-17 19:13:44','2015-07-17 19:13:44','CONTRACT','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Contract</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Contract</Description></root>'),('981fec57-586a-49dd-89e9-78c17e806cbb',10309,10195,10155,10159,'','2015-07-17 19:13:44','2015-07-17 19:13:44','MARKETING BANNER','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Marketing Banner</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Marketing Banner</Description></root>'),('79f5ae66-58e4-4ba2-948a-3fe8ad26d4d0',10311,10195,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45','ONLINE TRAINING','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Online Training</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Online Training</Description></root>'),('325b633c-3ee7-46ba-a711-6189b435c40e',10313,10195,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45','SALES PRESENTATION','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Sales Presentation</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Sales Presentation</Description></root>');

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

insert  into `dlfilerank`(`fileRankId`,`groupId`,`companyId`,`userId`,`createDate`,`fileEntryId`,`active_`) values (13230,10182,10155,10199,'2015-08-13 21:47:39',13228,1),(13236,10182,10155,10199,'2015-08-13 21:48:03',13234,1),(14011,10182,10155,10199,'2015-08-23 07:23:08',14009,1),(14017,10182,10155,10199,'2015-08-23 07:23:43',14015,1),(15606,10182,10155,10199,'2015-09-14 19:42:38',15604,1),(15612,10182,10155,10199,'2015-09-14 19:43:01',15610,1),(17741,10182,10155,10199,'2015-10-22 20:49:24',17709,1),(18423,10182,10155,10199,'2015-11-02 18:50:27',18409,1),(20606,10182,10155,10199,'2016-01-25 04:54:05',20604,1),(20612,10182,10155,10199,'2016-01-25 04:54:35',20610,1);

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

insert  into `dlfileversion`(`uuid_`,`fileVersionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`repositoryId`,`folderId`,`fileEntryId`,`treePath`,`extension`,`mimeType`,`title`,`description`,`changeLog`,`extraSettings`,`fileEntryTypeId`,`version`,`size_`,`checksum`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('0f8e3238-7a70-4b7a-8f80-d63ae0b2106a',11317,11305,10155,10159,'','2015-08-03 19:04:37','2015-08-03 19:04:37',11305,0,11316,'/0/','jpg','image/jpeg','morgueFile-1','','','',0,'1.0',77763,'',0,10159,'','2015-08-03 19:04:38'),('737cb435-15f5-4f8b-9de1-0a3d002886c8',11326,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',11305,0,11325,'/0/','jpg','image/jpeg','morgueFile-3','','','',0,'1.0',37409,'',0,10159,'','2015-08-03 19:04:40'),('236caeed-f6de-4acb-ae28-9068d74f9e13',11334,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',11305,0,11333,'/0/','jpg','image/jpeg','morgueFile-4','','','',0,'1.0',84859,'',0,10159,'','2015-08-03 19:04:40'),('198b3de7-6d6a-47dd-b82b-062ca4b88fa6',11342,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',11305,0,11341,'/0/','jpg','image/jpeg','morgueFile-2','','','',0,'1.0',79041,'',0,10159,'','2015-08-03 19:04:41'),('4efd2673-2159-4459-b172-58faa9595aad',11431,11419,10155,10159,'','2015-08-03 19:34:27','2015-08-03 19:34:27',11419,0,11430,'/0/','jpg','image/jpeg','morgueFile-1','','','',0,'1.0',77763,'',0,10159,'','2015-08-03 19:34:28'),('38cfee76-aabe-4e48-8d15-86fe8065c5ed',11440,11419,10155,10159,'','2015-08-03 19:34:30','2015-08-03 19:34:30',11419,0,11439,'/0/','jpg','image/jpeg','morgueFile-3','','','',0,'1.0',37409,'',0,10159,'','2015-08-03 19:34:30'),('c4b2b79e-113a-4868-ba64-1eeebaaf5fe4',11449,11419,10155,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',11419,0,11448,'/0/','jpg','image/jpeg','morgueFile-4','','','',0,'1.0',84859,'',0,10159,'','2015-08-03 19:34:31'),('d77d1575-4024-49f4-8c4f-e00350ba37bf',11459,11419,10155,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',11419,0,11458,'/0/','jpg','image/jpeg','morgueFile-2','','','',0,'1.0',79041,'',0,10159,'','2015-08-03 19:34:32'),('75439cc4-56b7-4d3d-b69e-49f2828c67b6',13229,10182,10155,10199,'Test Test','2015-08-13 21:47:35','2015-08-13 21:47:35',13225,13227,13228,'/13226/13227/','lar','application/zip','Private_Pages-201508132146.lar','','','',0,'1.0',1077107,'',0,10199,'Test Test','2015-08-13 21:47:35'),('0a07c5b6-f1ed-4cf4-bf88-a39bef29d431',13235,10182,10155,10199,'Test Test','2015-08-13 21:47:59','2015-08-13 21:47:59',13225,13233,13234,'/13226/13233/','lar','application/zip','Public_Pages-201508132147.lar','','','',0,'1.0',1070669,'',0,10199,'Test Test','2015-08-13 21:48:00'),('2809c8e4-f312-4383-86f2-0ea5aede5496',14005,10182,10155,10199,'Test Test','2015-08-23 07:22:36','2015-08-23 07:22:36',13225,14003,14004,'/13226/14003/','lar','application/zip','Public_Pages-201508230722.lar','','','',0,'1.0',1081243,'',0,10199,'Test Test','2015-08-23 07:22:36'),('f879c864-1214-46c6-a9e0-9cf5c00b5c5d',14010,10182,10155,10199,'Test Test','2015-08-23 07:23:02','2015-08-23 07:23:02',13225,14008,14009,'/13226/14008/','lar','application/zip','Public_Pages-201508230722.lar','','','',0,'1.0',1081185,'',0,10199,'Test Test','2015-08-23 07:23:02'),('b2e20504-2a7b-4128-8b30-5184bb13e271',14016,10182,10155,10199,'Test Test','2015-08-23 07:23:29','2015-08-23 07:23:29',13225,14014,14015,'/13226/14014/','lar','application/zip','Private_Pages-201508230723.lar','','','',0,'1.0',1084317,'',0,10199,'Test Test','2015-08-23 07:23:29'),('f48d6339-f0a2-40c0-9544-e2ee723fbb4f',15605,10182,10155,10199,'Test Test','2015-09-14 19:42:34','2015-09-14 19:42:34',13225,15603,15604,'/13226/15603/','lar','application/zip','Public_Pages-201509141942.lar','','','',0,'1.0',970051,'',0,10199,'Test Test','2015-09-14 19:42:35'),('a0e8cf18-359a-4250-b4c6-4776289978f4',15611,10182,10155,10199,'Test Test','2015-09-14 19:42:55','2015-09-14 19:42:55',13225,15609,15610,'/13226/15609/','lar','application/zip','Private_Pages-201509141942.lar','','','',0,'1.0',979721,'',0,10199,'Test Test','2015-09-14 19:42:55'),('1b952763-0e5c-4f6f-82c8-695327582d20',17710,10182,10155,10199,'Gautam Sharma','2015-10-22 19:29:07','2015-10-22 19:29:07',10182,17705,17709,'/17601/17705/','txt','text/plain','faq_page (1).txt','faq_page (1).txt','upload','',0,'1.0',85,'',0,10199,'Gautam Sharma','2015-10-22 19:29:07'),('2a3ad969-d63e-4ee1-af88-c3e953ce3e8c',17728,10182,10155,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55',10182,17723,17727,'/17601/17723/','txt','text/plain','faq_page.txt','faq_page.txt','upload','',0,'1.0',85,'',0,10199,'Gautam Sharma','2015-10-22 19:58:55'),('9921b1e2-2021-4572-8dd2-c6b4708ca3cd',18329,10182,10155,10199,'Gautam Sharma','2015-11-02 17:54:21','2015-11-02 17:54:21',10182,18324,18328,'/17601/18324/','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','upload','',0,'1.0',57939,'',0,10199,'Gautam Sharma','2015-11-02 17:54:21'),('1346fc08-ae7b-4bc9-bb48-67677ce84dfe',18347,10182,10155,17001,'Colin LEVINS','2015-11-02 18:08:28','2015-11-02 18:08:28',10182,18342,18346,'/17601/18342/','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','upload','',0,'1.0',57939,'',0,17001,'Colin LEVINS','2015-11-02 18:08:29'),('88b2b993-c509-464c-9a44-f71446d6117d',18365,10182,10155,10199,'Gautam Sharma','2015-11-02 18:17:34','2015-11-02 18:17:34',10182,18360,18364,'/17601/18360/','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','upload','',0,'1.0',57939,'',0,10199,'Gautam Sharma','2015-11-02 18:17:34'),('ee4c19e1-3b3f-43d2-aa71-24ead9617155',18410,10182,10155,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15',10182,18405,18409,'/17601/18405/','pdf','application/pdf','Covering Letter.pdf','Covering Letter.pdf','upload','',0,'1.0',57939,'',0,10199,'Gautam Sharma','2015-11-02 18:50:15'),('9b5ce668-653e-49ee-b64a-87b737a763f8',19186,10182,10155,17001,'Colin LEVINS','2015-12-27 17:31:40','2015-12-27 17:31:40',10182,19181,19185,'/14301/19181/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','upload','',0,'1.0',8609,'',0,17001,'Colin LEVINS','2015-12-27 17:31:40'),('b83e338b-ea2b-47d8-bb74-23d76c00d00b',19204,10182,10155,17001,'Colin LEVINS','2015-12-27 17:41:25','2015-12-27 17:41:25',10182,19199,19203,'/14301/19199/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','upload','',0,'1.0',8609,'',0,17001,'Colin LEVINS','2015-12-27 17:41:25'),('6a58300c-ce36-433c-848e-67f75c200132',19222,10182,10155,17001,'Colin LEVINS','2015-12-27 17:57:05','2015-12-27 17:57:05',10182,19217,19221,'/14301/19217/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','WhiteHallOct.xlsx','upload','',0,'1.0',8609,'',0,17001,'Colin LEVINS','2015-12-27 17:57:05'),('49c5703c-4d5a-45fa-95fb-cd767c1a9bcd',19280,10182,10155,17001,'Colin LEVINS','2015-12-27 20:22:37','2015-12-27 20:22:37',10182,19275,19279,'/14301/19275/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','upload','',0,'1.0',8670,'',0,17001,'Colin LEVINS','2015-12-27 20:22:37'),('d52b4a0a-fcc7-4e0f-804f-b6208250b8ff',19299,10182,10155,17001,'Colin LEVINS','2015-12-27 20:35:39','2015-12-27 20:35:39',10182,19294,19298,'/14301/19294/','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','WhiteHallDec.xlsx','upload','',0,'1.0',8670,'',0,17001,'Colin LEVINS','2015-12-27 20:35:39'),('9f315161-52f9-4bcc-9c38-f3ff02d200da',20605,10182,10155,10199,'Gautam Sharma','2016-01-25 04:53:55','2016-01-25 04:53:55',13225,20603,20604,'/13226/20603/','lar','application/zip','Public_Pages-201601250453.lar','','','',0,'1.0',941190,'',0,10199,'Gautam Sharma','2016-01-25 04:53:55'),('55ce9bb2-2279-48b1-bc85-d0da44d44357',20611,10182,10155,10199,'Gautam Sharma','2016-01-25 04:54:30','2016-01-25 04:54:30',13225,20609,20610,'/13226/20609/','lar','application/zip','Private_Pages-201601250454.lar','','','',0,'1.0',958249,'',0,10199,'Gautam Sharma','2016-01-25 04:54:30');

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

insert  into `dlfolder`(`uuid_`,`folderId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`repositoryId`,`mountPoint`,`parentFolderId`,`treePath`,`name`,`description`,`lastPostDate`,`defaultFileEntryTypeId`,`hidden_`,`overrideFileEntryTypes`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('277b1c1d-8bd3-4c2d-859a-6cb62fb9ca55',13226,10182,10155,10159,'','2015-08-13 21:47:34','2015-08-13 21:47:34',13225,1,0,'/13226/','189','','2016-01-25 04:54:30',0,1,0,0,0,'',NULL),('b53a4ffb-e768-4770-8b7a-90966eb1a34f',13227,10182,10155,10199,'Test Test','2015-08-13 21:47:35','2015-08-13 21:47:35',13225,0,13226,'/13226/13227/','13222','','2015-08-13 21:47:35',0,0,0,0,0,'',NULL),('3c3e6da5-42de-40b1-a8a3-948bc9719ebc',13233,10182,10155,10199,'Test Test','2015-08-13 21:47:59','2015-08-13 21:47:59',13225,0,13226,'/13226/13233/','13231','','2015-08-13 21:47:59',0,0,0,0,0,'',NULL),('31b745b6-0663-4833-84dc-3652209d1dd1',14003,10182,10155,10199,'Test Test','2015-08-23 07:22:36','2015-08-23 07:22:36',13225,0,13226,'/13226/14003/','14001','','2015-08-23 07:22:36',0,0,0,0,0,'',NULL),('466a2ef2-be59-44c4-bd74-fe3fce2f348c',14008,10182,10155,10199,'Test Test','2015-08-23 07:23:02','2015-08-23 07:23:02',13225,0,13226,'/13226/14008/','14006','','2015-08-23 07:23:02',0,0,0,0,0,'',NULL),('a005aabb-eb1c-4298-8db3-da4cd45b862d',14014,10182,10155,10199,'Test Test','2015-08-23 07:23:29','2015-08-23 07:23:29',13225,0,13226,'/13226/14014/','14012','','2015-08-23 07:23:29',0,0,0,0,0,'',NULL),('c2672da9-7afe-45a3-a442-1ec31cd56bdb',14301,10182,10155,10199,'Test Test','2015-08-29 14:06:00','2015-08-29 14:06:00',10182,0,0,'/14301/','Invoices','Invoices','2015-12-27 20:35:39',0,0,0,0,0,'',NULL),('a9836966-ad70-4a97-8c16-0bd63d9e9ef9',15603,10182,10155,10199,'Test Test','2015-09-14 19:42:34','2015-09-14 19:42:34',13225,0,13226,'/13226/15603/','15601','','2015-09-14 19:42:34',0,0,0,0,0,'',NULL),('78f332ea-ada0-438d-a4e4-962170aa21b2',15609,10182,10155,10199,'Test Test','2015-09-14 19:42:55','2015-09-14 19:42:55',13225,0,13226,'/13226/15609/','15607','','2015-09-14 19:42:55',0,0,0,0,0,'',NULL),('0d2c49d1-6c21-4f8f-bfef-d284949fdcc7',17601,10182,10155,10199,'Gautam Sharma','2015-10-22 17:39:55','2015-10-22 17:39:55',10182,0,0,'/17601/','Insurance','Insurance','2015-11-02 18:50:15',0,0,0,0,0,'',NULL),('377dd1cc-4c75-4d30-8295-b987640ab475',17705,10182,10155,10199,'Gautam Sharma','2015-10-22 19:29:05','2015-10-22 19:29:05',10182,0,17601,'/17601/17705/','10','Trade Insurance Folder','2015-10-22 19:29:07',0,0,0,0,0,'',NULL),('cc8dbc70-da56-4c54-abd4-13ad1b7de62a',17723,10182,10155,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55',10182,0,17601,'/17601/17723/','11','Trade Insurance Folder','2015-10-22 19:58:55',0,0,0,0,0,'',NULL),('930f8558-2eb8-4b3d-867d-59a39753364a',18324,10182,10155,10199,'Gautam Sharma','2015-11-02 17:54:21','2015-11-02 17:54:21',10182,0,17601,'/17601/18324/','12','Trade Insurance Folder','2015-11-02 17:54:21',0,0,0,0,0,'',NULL),('4d377d4f-aac6-4698-88bb-e6fcb641ed77',18342,10182,10155,17001,'Colin LEVINS','2015-11-02 18:08:28','2015-11-02 18:08:28',10182,0,17601,'/17601/18342/','13','Trade Insurance Folder','2015-11-02 18:08:28',0,0,0,0,0,'',NULL),('e7088430-15e2-4c76-8cb4-e2384b8e145e',18360,10182,10155,10199,'Gautam Sharma','2015-11-02 18:17:34','2015-11-02 18:17:34',10182,0,17601,'/17601/18360/','14','Trade Insurance Folder','2015-11-02 18:17:34',0,0,0,0,0,'',NULL),('7e2440c2-ef73-45cc-ae3d-3465313ab952',18405,10182,10155,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15',10182,0,17601,'/17601/18405/','15','Trade Insurance Folder','2015-11-02 18:50:15',0,0,0,0,0,'',NULL),('fe61fea1-a8de-44e6-bbdb-0dc460b92a2a',19181,10182,10155,17001,'Colin LEVINS','2015-12-27 17:31:39','2015-12-27 17:31:39',10182,0,14301,'/14301/19181/','0','Invoices Document Folder','2015-12-27 17:31:40',0,0,0,0,0,'',NULL),('31aa124f-713c-4439-aab2-a765a20fe8b6',19199,10182,10155,17001,'Colin LEVINS','2015-12-27 17:41:25','2015-12-27 17:41:25',10182,0,14301,'/14301/19199/','1','Invoices Document Folder','2015-12-27 17:41:25',0,0,0,0,0,'',NULL),('e40620ff-83a9-4fd2-9c42-760bbb35b015',19217,10182,10155,17001,'Colin LEVINS','2015-12-27 17:57:04','2015-12-27 17:57:04',10182,0,14301,'/14301/19217/','2','Invoices Document Folder','2015-12-27 17:57:05',0,0,0,0,0,'',NULL),('832642d5-9261-4104-b28e-92ea383fc7a3',19275,10182,10155,17001,'Colin LEVINS','2015-12-27 20:22:37','2015-12-27 20:22:37',10182,0,14301,'/14301/19275/','3','Invoices Document Folder','2015-12-27 20:22:37',0,0,0,0,0,'',NULL),('9036ac98-7ebb-453f-b718-8b77e23b5167',19294,10182,10155,17001,'Colin LEVINS','2015-12-27 20:35:39','2015-12-27 20:35:39',10182,0,14301,'/14301/19294/','4','Invoices Document Folder','2015-12-27 20:35:39',0,0,0,0,0,'',NULL),('393d838b-18fc-4c08-b9ad-07e5d9bb88f7',20603,10182,10155,10199,'Gautam Sharma','2016-01-25 04:53:55','2016-01-25 04:53:55',13225,0,13226,'/13226/20603/','20601','','2016-01-25 04:53:55',0,0,0,0,0,'',NULL),('863462bc-11be-48c6-a8d7-fec68b1c0647',20609,10182,10155,10199,'Gautam Sharma','2016-01-25 04:54:30','2016-01-25 04:54:30',13225,0,13226,'/13226/20609/','20607','','2016-01-25 04:54:30',0,0,0,0,0,'',NULL);

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

insert  into `expandocolumn`(`columnId`,`companyId`,`tableId`,`name`,`type_`,`defaultData`,`typeSettings`) values (10441,10155,10440,'clientId',15,'','');

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

insert  into `expandotable`(`tableId`,`companyId`,`classNameId`,`name`) values (10508,10155,10002,'OPEN_SOCIAL_DATA_'),(10440,10155,10005,'MP'),(10509,10155,10005,'OPEN_SOCIAL_DATA_');

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

insert  into `group_`(`uuid_`,`groupId`,`companyId`,`creatorUserId`,`classNameId`,`classPK`,`parentGroupId`,`liveGroupId`,`treePath`,`name`,`description`,`type_`,`typeSettings`,`manualMembership`,`membershipRestriction`,`friendlyURL`,`site`,`remoteStagingGroupCount`,`active_`) values ('28488976-4dc1-4f17-81d5-d26bb8cf6970',10173,10155,10159,10001,10173,0,0,'/10173/','Control Panel','',3,'',1,0,'/control_panel',0,0,1),('15a1ccea-a2af-4232-b971-9c8f349c38c7',10182,10155,10159,10001,10182,0,0,'/10182/','Guest','',1,'breadcrumbShowParentGroups=true\ncontentSharingWithChildrenEnabled=-1\ndirectoryIndexingEnabled=false\nfalse-robots.txt=User-Agent: *_SAFE_NEWLINE_CHARACTER_Disallow:_SAFE_NEWLINE_CHARACTER_Sitemap: http://localhost/sitemap.xml\ninheritLocales=true\nlanguageId=en_US\nlocales=ca_ES,zh_CN,en_US,fi_FI,fr_FR,de_DE,iw_IL,hu_HU,ja_JP,pt_BR,es_ES\nmergeGuestPublicPages=false\ntrashEnabled=true\n',1,0,'/guest',1,0,1),('7da62c63-2777-4ab2-b918-52276fc873c5',10192,10155,10159,10191,10159,0,0,'/10192/','User Personal Site','',3,'',1,0,'/personal_site',0,0,1),('e46dbb47-b1ea-4be8-b6d6-ed272ea9a400',10195,10155,10159,10025,10155,0,0,'/10195/','10155','',0,'',1,0,'/global',1,0,1),('5de8b31a-3c94-4829-ba91-7fa721cb9568',10202,10155,10199,10005,10199,0,0,'/10202/','10199','',0,'',1,0,'/gautam',0,0,1),('529d249a-861a-4f29-a6f8-84f8396fd073',10318,10155,10159,10032,10317,0,0,'/10318/','10317','',0,'',1,0,'/template-10317',0,0,1),('5e9d163d-3b34-4544-ab4b-01e62a66ea00',10330,10155,10159,10032,10329,0,0,'/10330/','10329','',0,'',1,0,'/template-10329',0,0,1),('5a16e158-fbda-4727-aae2-adc84c4e2452',10340,10155,10159,10032,10339,0,0,'/10340/','10339','',0,'',1,0,'/template-10339',0,0,1),('111599d2-2d51-442c-bcea-87c125bd6f3f',10351,10155,10159,10036,10350,0,0,'/10351/','10350','',0,'',1,0,'/template-10350',0,0,1),('33a5286b-070e-4702-82e8-76982d9efed5',10377,10155,10159,10036,10376,0,0,'/10377/','10376','',0,'',1,0,'/template-10376',0,0,1),('eb5add50-6a12-4cfa-a181-5a98ab268f05',10664,10155,10199,10001,10664,0,0,'/10664/','Adm Site','Adm Site',2,'breadcrumbShowParentGroups=true\ncontentSharingWithChildrenEnabled=-1\ntrashEnabled=true\n',1,0,'/adm-site',1,0,1),('47d91061-a58a-452d-8eea-d3c0ee0a5611',10668,10155,10199,10001,10668,0,0,'/10668/','Usr Site','Usr Site',1,'breadcrumbShowParentGroups=true\ncontentSharingWithChildrenEnabled=-1\ntrashEnabled=true\n',1,0,'/usr-site',1,0,1),('24faff22-facf-4390-ba8b-b9b915740322',11305,10155,10159,10036,11304,0,0,'/11305/','11304','',0,'',1,0,'/template-11304',0,0,1),('252e309b-3e3c-4609-927e-d34c45e6533c',11419,10155,10159,10036,11418,0,0,'/11419/','11418','',0,'',1,0,'/template-11418',0,0,1),('00569f0d-ab24-4ac5-9f26-0666d67be7ea',13202,10155,10159,10036,13201,0,0,'/13202/','13201','',0,'',1,0,'/template-13201',0,0,1),('9704bd8c-e867-4a6c-9e31-02edaa367b4c',20304,10155,20301,10005,20301,0,0,'/20304/','20301','',0,'',1,0,'/prinvestor1',0,0,1),('f19bf001-492d-40e8-9448-b8963a73927a',20404,10155,20401,10005,20401,0,0,'/20404/','20401','',0,'',1,0,'/prinvestor2',0,0,1),('b68f4c2a-adc1-4666-9c3b-01709963eaef',20424,10155,20421,10005,20421,0,0,'/20424/','20421','',0,'',1,0,'/prinvestor3',0,0,1),('1b97e9b3-71d8-40ba-a2c0-32b31ee0613d',20444,10155,20441,10005,20441,0,0,'/20444/','20441','',0,'',1,0,'/prinvestor4',0,0,1),('b175fa60-e9e6-4eb0-b964-1e5064a56e14',20464,10155,20461,10005,20461,0,0,'/20464/','20461','',0,'',1,0,'/scfcompany1',0,0,1),('9105b2b7-401f-4a20-a45d-ac9580668e15',20509,10155,20506,10005,20506,0,0,'/20509/','20506','',0,'',1,0,'/scfcompany2',0,0,1),('fcfcba53-8501-4b08-8de3-dfcee84fb450',20530,10155,20527,10005,20527,0,0,'/20530/','20527','',0,'',1,0,'/scfcompany3',0,0,1),('9b425606-88ed-4019-8d24-3bef14bb218f',20550,10155,20547,10005,20547,0,0,'/20550/','20547','',0,'',1,0,'/seller1',0,0,1),('6250ab91-d6ed-48a2-a74b-273fb7ca768d',20570,10155,20567,10005,20567,0,0,'/20570/','20567','',0,'',1,0,'/seller2',0,0,1);

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

insert  into `journalarticle`(`uuid_`,`id_`,`resourcePrimKey`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`folderId`,`classNameId`,`classPK`,`treePath`,`articleId`,`version`,`title`,`urlTitle`,`description`,`content`,`type_`,`structureId`,`templateId`,`layoutUuid`,`displayDate`,`expirationDate`,`reviewDate`,`indexable`,`smallImage`,`smallImageId`,`smallImageURL`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('cd0605d5-1d3e-4c29-9ebc-da5d90d63e2a',10616,10617,10182,10155,10159,'','2015-07-17 19:16:45','2015-07-17 19:16:45',0,0,0,'/0/','WELCOME',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','welcome','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element name=\"content\" type=\"text_area\" index-type=\"keyword\" index=\"0\">\n		<dynamic-content language-id=\"en_US\"><![CDATA[\n			\n				<style type=\"text/css\">\n					h2.welcome-title {\n						font-size: 35px;\n						margin: 0 0 40px;\n					}\n\n					h4.subtitle {\n						font-size: 24px;\n						line-height: 30px;\n						margin-bottom: 0;\n					}\n\n					.welcome-content {\n						font-size: 15px;\n						margin: 0;\n					}\n\n					.welcome-content a {\n						text-decoration: none;\n					}\n\n					.welcome-content a:hover {\n						text-decoration: underline;\n					}\n\n					.welcome-content .welcome-text {\n						line-height: 22px;\n						margin: 0;\n					}\n\n					.welcome-content .pdf {\n						display: inline-block;\n						margin-top: 25px;\n					}\n\n					.welcome-content .welcome-icon {\n						float: left;\n						margin: 4px 0;\n						padding-right: 38px;\n					}\n\n					@media all and (max-width: 767px) {\n						h2.welcome-title {\n							font-size: 24px;\n						}\n\n						h4.subtitle {\n							margin: 32px 0 4px;\n						}\n\n						.welcome-content-wrapper {\n							text-align: center;\n						}\n\n						.welcome-content .welcome-icon {\n							float: none;\n							padding: 0;\n						}\n					}\n				</style>\n\n				<div class=\"welcome-content-wrapper\">\n					<h2 class=\"welcome-title\">\n						Welcome To Liferay Portal\n					</h2>\n\n					<div class=\"welcome-content\">\n						<img class=\"welcome-icon\" src=\"/documents/10182/0/welcome_cube/61e6077f-9a5f-4461-93d5-3b9e23ba60f1?version=1.0&t=1437160599810\" />\n\n						<h4 class=\"subtitle\">\n							Start\n						</h4>\n\n						<p class=\"welcome-text\">\n							Review our <a href=\"http://www.liferay.com/welcome-start?v1.0\" target=\"_blank\">Quick Start Guide</a> for an overview of Liferay\'s features.\n						</p>\n\n						<div class=\"helper-clearfix\">&nbsp;</div>\n					</div>\n\n					<div class=\"welcome-content\">\n						<img class=\"welcome-icon\" src=\"/documents/10182/0/welcome_learn/213673b0-9472-4b10-a197-d12b5330e83b?version=1.0&t=1437160599084\" />\n\n						<h4 class=\"subtitle\">\n							Learn\n						</h4>\n\n						<p class=\"welcome-text\">\n							Read the official <a href=\"http://www.liferay.com/welcome-learn?v1.0\" target=\"_blank\">Liferay User Guide</a> for detailed information about setting up and configuring Liferay.\n						</p>\n\n						<div class=\"helper-clearfix\">&nbsp;</div>\n					</div>\n\n					<div class=\"welcome-content\">\n						<img class=\"welcome-icon\" src=\"/documents/10182/0/welcome_community/4c5802b9-0fcc-418c-a104-3495ead558ca?version=1.0&t=1437160604768\" />\n\n						<h4 class=\"subtitle\">\n							Engage\n						</h4>\n\n						<p class=\"welcome-text\">\n							Visit the <a href=\"http://www.liferay.com/welcome-engage?v1.0\" target=\"_blank\">Liferay Community</a> to post questions, find answers, and contribute.\n						</p>\n\n						<div class=\"helper-clearfix\">&nbsp;</div>\n					</div>\n\n					<div class=\"welcome-content\">\n						<img class=\"welcome-icon\" src=\"/documents/10182/0/welcome_tools/fe61b92a-a4c2-44c1-8eee-01330676a3fa?version=1.0&t=1437160598016\" />\n\n						<h4 class=\"subtitle\">\n							Develop\n						</h4>\n\n						<p class=\"welcome-text\">\n							Explore our <a href=\"http://www.liferay.com/welcome-develop?v1.0\" target=\"_blank\">Developer Resources</a> to develop apps and more for Liferay Portal.\n						</p>\n\n						<div class=\"helper-clearfix\">&nbsp;</div>\n					</div>\n\n					<div class=\"welcome-content\">\n						<img class=\"welcome-icon\" src=\"/documents/10182/0/welcome_ee/34d5c4df-8382-411f-bd0f-28cba857293a?version=1.0&t=1437160604252\" />\n\n						<h4 class=\"subtitle\">\n							Evaluate\n						</h4>\n\n						<p class=\"welcome-text\">\n							Learn more about partners, support, training and other <a href=\"http://www.liferay.com/welcome-evaluate?v1.0\" target=\"_blank\">enterprise level options</a> available for Liferay.\n						</p>\n\n						<a class=\"pdf\" href=\"/documents/10182/0/helpful_links_for_using_liferay_portal/78329b1b-5b0c-407a-b88b-af04ab5a55d6?version=1.0\">Download this page as a PDF</a>\n					</div>\n				</div>\n			\n		]]></dynamic-content>\n	</dynamic-element>\n</root>','general','BASIC-WEB-CONTENT-6.2.2.1','BASIC-WEB-CONTENT-6.2.2.1','','2010-02-01 00:00:00',NULL,NULL,1,0,10618,'',0,10159,'','2015-07-17 19:16:47'),('a2f5906d-0df4-4840-a7d2-f993cb85552f',11360,11361,11305,10155,10159,'','2015-08-03 19:04:45','2015-08-03 19:04:45',0,0,0,'/0/','MAIN-CAROUSEL',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Main Carousel</Title></root>','main-carousel','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"Dq2bIXiJ\" name=\"height\" type=\"text\" index-type=\"\">\n		<dynamic-content><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"O4aO9a8O\" name=\"duration\" type=\"list\" index-type=\"\">\n		<dynamic-content><![CDATA[3]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"qYyn3lcL\" name=\"carousel-item\" type=\"text\" index-type=\"\">\n		<dynamic-element instance-id=\"SJwKZiO2\" name=\"tagline\" type=\"text\" index-type=\"\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis eu felis non ullamcorper. Sed a arcu ac nisl congue. ]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"NKshI0fa\" name=\"image\" type=\"document_library\" index-type=\"\">\n			<dynamic-content><![CDATA[/documents/11305/0/morgueFile-1/f26143e4-1fa9-4e30-b484-5fc753f54de8?version=1.0&t=1438628677941]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Make it work for you.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"grOgO2rI\" name=\"carousel-item\" type=\"text\" index-type=\"\">\n		<dynamic-element instance-id=\"UDRDxXc6\" name=\"tagline\" type=\"text\" index-type=\"\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis eu felis non ullamcorper. Sed a arcu ac nisl congue.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"AB6XGWIW\" name=\"image\" type=\"document_library\" index-type=\"\">\n			<dynamic-content><![CDATA[/documents/11305/0/morgueFile-2/0a03c7b0-34e0-40e1-962f-39463d080ecf?version=1.0&t=1438628680980]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[It\'s never old.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"qOSRCIBp\" name=\"carousel-item\" type=\"text\" index-type=\"\">\n		<dynamic-element instance-id=\"GaBpYLlY\" name=\"tagline\" type=\"text\" index-type=\"\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis eu felis non ullamcorper. Sed a arcu ac nisl congue.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"cJiqbcTO\" name=\"image\" type=\"document_library\" index-type=\"\">\n			<dynamic-content><![CDATA[/documents/11305/0/morgueFile-3/d9f97505-a9ca-463c-9e00-5ddfb60686f8?version=1.0&t=1438628680116]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Shape matters.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"PS84bJen\" name=\"carousel-item\" type=\"text\" index-type=\"\">\n		<dynamic-element instance-id=\"GfO1ljb2\" name=\"tagline\" type=\"text\" index-type=\"\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis eu felis non ullamcorper. Sed a arcu ac nisl congue.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"old8s3oU\" name=\"image\" type=\"document_library\" index-type=\"\">\n			<dynamic-content><![CDATA[/documents/11305/0/morgueFile-4/9af34929-943e-48ab-91c6-9e7c4dce3947?version=1.0&t=1438628680505]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Colorize it!]]></dynamic-content>\n	</dynamic-element>\n</root>','general','CAROUSEL-6.2.0.1','CAROUSEL-6.2.0.1','','2010-02-01 00:00:00',NULL,NULL,1,0,11374,'',0,10159,'','2015-08-03 19:04:49'),('8ebd192d-62d3-43a5-8b5c-98b29a614d33',11381,11382,11305,10155,10159,'','2015-08-03 19:04:49','2015-08-03 19:04:49',0,0,0,'/0/','CUSTOMIZE-IT',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Customize it</Title></root>','customize-it','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<div style=\"text-align: center; margin-top: 24px;\">\n	<span class=\"icon-stack\" style=\"font-size: 3em;\">\n		<i class=\"icon-circle icon-stack-base\"></i>\n		<i class=\"icon-pencil\" style=\"color: #FFFFFF;\"></i>\n	</span>\n	<h3>Customize it!</h3>\n</div>]]></static-content>\n</root>','general','','','','2010-02-01 00:00:00',NULL,NULL,1,0,11383,'',0,10159,'','2015-08-03 19:04:50'),('230360a8-1ff0-4e19-a8e4-74a225c8bd65',11389,11390,11305,10155,10159,'','2015-08-03 19:04:50','2015-08-03 19:04:50',0,0,0,'/0/','DID-YOU-KNOW',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Did you know</Title></root>','did-you-know','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<h3 class=\"title\"><i class=\"icon-code icon-fixed-width\"></i>It\'s open source.</h3>\nYou can find the source code on <a href=\"https://github.com/danielreuther/chroma-theme\">GitHub</a>.\n<h3 class=\"title\"><i class=\"icon-lightbulb icon-fixed-width\"></i>Did you know?</h3>\nThis Theme comes with a Dashboard view that can be applied automatically when a user logs in.]]></static-content>\n</root>','general','','','','2010-02-01 00:00:00',NULL,NULL,1,0,11391,'',0,10159,'','2015-08-03 19:04:50'),('b24b52f2-12b7-43d4-8533-92133710c7ca',11486,11487,11419,10155,10159,'','2015-08-03 19:34:34','2015-08-03 19:34:34',0,0,0,'/0/','MAIN-CAROUSEL',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Main Carousel</Title></root>','main-carousel','','<?xml version=\"1.0\"?>\n\n<!--\n\n    Copyright (c) 2000-present Liferay, Inc. All rights reserved.\n\n    This library is free software; you can redistribute it and/or modify it under\n    the terms of the GNU Lesser General Public License as published by the Free\n    Software Foundation; either version 2.1 of the License, or (at your option)\n    any later version.\n\n    This library is distributed in the hope that it will be useful, but WITHOUT\n    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS\n    FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more\n    details.\n\n-->\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<dynamic-element instance-id=\"Dq2bIXiJ\" name=\"height\" type=\"text\" index-type=\"\">\n		<dynamic-content><![CDATA[250]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"O4aO9a8O\" name=\"duration\" type=\"list\" index-type=\"\">\n		<dynamic-content><![CDATA[3]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"qYyn3lcL\" name=\"carousel-item\" type=\"text\" index-type=\"\">\n		<dynamic-element instance-id=\"SJwKZiO2\" name=\"tagline\" type=\"text\" index-type=\"\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis eu felis non ullamcorper. Sed a arcu ac nisl congue. ]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"NKshI0fa\" name=\"image\" type=\"document_library\" index-type=\"\">\n			<dynamic-content><![CDATA[/documents/11419/0/morgueFile-1/5c89cc37-3bf3-4ab6-b198-adc2068635aa?version=1.0&t=1438630467940]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Make it work for you.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"grOgO2rI\" name=\"carousel-item\" type=\"text\" index-type=\"\">\n		<dynamic-element instance-id=\"UDRDxXc6\" name=\"tagline\" type=\"text\" index-type=\"\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis eu felis non ullamcorper. Sed a arcu ac nisl congue.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"AB6XGWIW\" name=\"image\" type=\"document_library\" index-type=\"\">\n			<dynamic-content><![CDATA[/documents/11419/0/morgueFile-2/5353ab35-d820-4999-a108-4dd57f38c73b?version=1.0&t=1438630471897]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[It\'s never old.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"qOSRCIBp\" name=\"carousel-item\" type=\"text\" index-type=\"\">\n		<dynamic-element instance-id=\"GaBpYLlY\" name=\"tagline\" type=\"text\" index-type=\"\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis eu felis non ullamcorper. Sed a arcu ac nisl congue.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"cJiqbcTO\" name=\"image\" type=\"document_library\" index-type=\"\">\n			<dynamic-content><![CDATA[/documents/11419/0/morgueFile-3/205151c9-6e58-4b54-b93a-53b8a2d647ea?version=1.0&t=1438630470488]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Shape matters.]]></dynamic-content>\n	</dynamic-element>\n	<dynamic-element instance-id=\"PS84bJen\" name=\"carousel-item\" type=\"text\" index-type=\"\">\n		<dynamic-element instance-id=\"GfO1ljb2\" name=\"tagline\" type=\"text\" index-type=\"\">\n			<dynamic-content><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sagittis eu felis non ullamcorper. Sed a arcu ac nisl congue.]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-element instance-id=\"old8s3oU\" name=\"image\" type=\"document_library\" index-type=\"\">\n			<dynamic-content><![CDATA[/documents/11419/0/morgueFile-4/6febbec9-0fe4-4b55-b45c-4a8dcbe26572?version=1.0&t=1438630471380]]></dynamic-content>\n		</dynamic-element>\n		<dynamic-content><![CDATA[Colorize it!]]></dynamic-content>\n	</dynamic-element>\n</root>','general','CAROUSEL-1.0-SNAPSHOT','CAROUSEL-1.0-SNAPSHOT','','2010-02-01 00:00:00',NULL,NULL,1,0,11488,'',0,10159,'','2015-08-03 19:34:36'),('2995e988-2dd5-46e0-8329-0edc477ff236',11495,11496,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',0,0,0,'/0/','CUSTOMIZE-IT',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Customize it</Title></root>','customize-it','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<!--\n\n    Copyright (c) 2000-present Liferay, Inc. All rights reserved.\n\n    This library is free software; you can redistribute it and/or modify it under\n    the terms of the GNU Lesser General Public License as published by the Free\n    Software Foundation; either version 2.1 of the License, or (at your option)\n    any later version.\n\n    This library is distributed in the hope that it will be useful, but WITHOUT\n    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS\n    FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more\n    details.\n\n-->\n<div style=\"text-align: center; margin-top: 24px;\">\n	<span class=\"icon-stack\" style=\"font-size: 3em;\">\n		<i class=\"icon-circle icon-stack-base\"></i>\n		<i class=\"icon-pencil\" style=\"color: #FFFFFF;\"></i>\n	</span>\n	<h3>Customize it!</h3>\n</div>]]></static-content>\n</root>','general','','','','2010-02-01 00:00:00',NULL,NULL,1,0,11497,'',0,10159,'','2015-08-03 19:34:37'),('e94edfa6-c286-4028-b300-b04e62151ae2',11503,11504,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',0,0,0,'/0/','DID-YOU-KNOW',1,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Did you know</Title></root>','did-you-know','','<?xml version=\"1.0\"?>\n\n<root available-locales=\"en_US\" default-locale=\"en_US\">\n	<static-content language-id=\"en_US\"><![CDATA[<!--\n\n    Copyright (c) 2000-present Liferay, Inc. All rights reserved.\n\n    This library is free software; you can redistribute it and/or modify it under\n    the terms of the GNU Lesser General Public License as published by the Free\n    Software Foundation; either version 2.1 of the License, or (at your option)\n    any later version.\n\n    This library is distributed in the hope that it will be useful, but WITHOUT\n    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS\n    FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more\n    details.\n\n-->\n<h3 class=\"title\"><i class=\"icon-code icon-fixed-width\"></i>It\'s open source.</h3>\nYou can find the source code on <a href=\"https://github.com/danielreuther/chroma-theme\">GitHub</a>.\n<h3 class=\"title\"><i class=\"icon-lightbulb icon-fixed-width\"></i>Did you know?</h3>\nThis Theme comes with a Dashboard view that can be applied automatically when a user logs in.]]></static-content>\n</root>','general','','','','2010-02-01 00:00:00',NULL,NULL,1,0,11505,'',0,10159,'','2015-08-03 19:34:38');

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

insert  into `journalarticleresource`(`uuid_`,`resourcePrimKey`,`groupId`,`articleId`) values ('c5983e96-1c3d-4b47-b1dd-1b8551d19973',10617,10182,'WELCOME'),('58a43b7a-fb23-4b95-947e-6df5ba3dfcbf',11361,11305,'MAIN-CAROUSEL'),('b01731b1-f44b-429c-9b72-78e7b6c2919c',11382,11305,'CUSTOMIZE-IT'),('1758a440-49c9-47a4-955a-acf7487c2f7e',11390,11305,'DID-YOU-KNOW'),('0e2aa021-32f3-48ff-8f2d-8e6ba9dddd26',11487,11419,'MAIN-CAROUSEL'),('aad94e79-accf-4a94-8621-cd2fc621e458',11496,11419,'CUSTOMIZE-IT'),('f515ca80-72fc-4a94-924e-ad714ec4957b',11504,11419,'DID-YOU-KNOW');

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

insert  into `kaleoaction`(`kaleoActionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoClassName`,`kaleoClassPK`,`kaleoDefinitionId`,`kaleoNodeName`,`name`,`description`,`executionType`,`script`,`scriptLanguage`,`scriptRequiredContexts`,`priority`) values (10469,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09','com.liferay.portal.workflow.kaleo.model.KaleoNode',10468,10467,'update','reject','','onAssignment','\n					\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"denied\"), workflowContext);\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"pending\"), workflowContext);\n					\n				','javascript','',0),(10476,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09','com.liferay.portal.workflow.kaleo.model.KaleoNode',10475,10467,'approved','approve','','onEntry','\n					\n						import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;\n						import com.liferay.portal.kernel.workflow.WorkflowConstants;\n\n						WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.toStatus(\"approved\"), workflowContext);\n					\n				','groovy','',0);

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

insert  into `kaleodefinition`(`kaleoDefinitionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`title`,`description`,`content`,`version`,`active_`,`startKaleoNodeId`) values (10467,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:10','Single Approver','Single Approver','A single approver can approve a workflow content.','<?xml version=\"1.0\"?>\n\n<workflow-definition xmlns=\"urn:liferay.com:liferay-workflow_6.2.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"urn:liferay.com:liferay-workflow_6.2.0 http://www.liferay.com/dtd/liferay-workflow-definition_6_2_0.xsd\">\n	<name>Single Approver</name>\n	<description>A single approver can approve a workflow content.</description>\n	<version>1</version>\n	<state>\n		<name>created</name>\n		<metadata> <![CDATA[{\"xy\":[36,51]}]]> </metadata>\n		<initial>true</initial>\n		<transitions>\n			<transition>\n				<name>review</name>\n				<target>review</target>\n			</transition>\n		</transitions>\n	</state>\n	<task>\n		<name>update</name>\n		<metadata> <![CDATA[{\"transitions\":{\"resubmit\":{\"bendpoints\":[[303,140]]}},\"xy\":[328,199]}]]> </metadata>\n		<actions>\n			<action>\n				<name>reject</name>\n				<script> <![CDATA[\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"denied\"), workflowContext);\n						Packages.com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil.updateStatus(Packages.com.liferay.portal.kernel.workflow.WorkflowConstants.toStatus(\"pending\"), workflowContext);\n					]]> </script>\n				<script-language>javascript</script-language>\n				<execution-type>onAssignment</execution-type>\n			</action>\n			<notification>\n				<name>Creator Modification Notification</name>\n				<template>Your submission was rejected by ${userName}, please modify and resubmit.</template>\n				<template-language>freemarker</template-language>\n				<notification-type>email</notification-type>\n				<notification-type>user-notification</notification-type>\n				<execution-type>onAssignment</execution-type>\n			</notification>\n		</actions>\n		<assignments>\n			<user/>\n		</assignments>\n		<transitions>\n			<transition>\n				<name>resubmit</name>\n				<target>review</target>\n			</transition>\n		</transitions>\n	</task>\n	<task>\n		<name>review</name>\n		<metadata> <![CDATA[{\"xy\":[168,36]}]]> </metadata>\n		<actions>\n			<notification>\n				<name>Review Notification</name>\n				<template>${userName} sent you a ${entryType} for review in the workflow.</template>\n				<template-language>freemarker</template-language>\n				<notification-type>email</notification-type>\n				<notification-type>user-notification</notification-type>\n				<execution-type>onAssignment</execution-type>\n			</notification>\n			<notification>\n				<name>Review Completion Notification</name>\n				<template>Your submission has been reviewed and the reviewer has applied the following ${taskComments}.</template>\n				<template-language>freemarker</template-language>\n				<notification-type>email</notification-type>\n				<recipients>\n					<user/>\n				</recipients>\n				<execution-type>onExit</execution-type>\n			</notification>\n		</actions>\n		<assignments>\n			<roles>\n				<role>\n					<role-type>organization</role-type>\n					<name>Organization Administrator</name>\n				</role>\n				<role>\n					<role-type>organization</role-type>\n					<name>Organization Content Reviewer</name>\n				</role>\n				<role>\n					<role-type>organization</role-type>\n					<name>Organization Owner</name>\n				</role>\n				<role>\n					<role-type>regular</role-type>\n					<name>Administrator</name>\n				</role>\n				<role>\n					<role-type>regular</role-type>\n					<name>Portal Content Reviewer</name>\n				</role>\n				<role>\n					<role-type>site</role-type>\n					<name>Site Administrator</name>\n				</role>\n				<role>\n					<role-type>site</role-type>\n					<name>Site Content Reviewer</name>\n				</role>\n				<role>\n					<role-type>site</role-type>\n					<name>Site Owner</name>\n				</role>\n			</roles>\n		</assignments>\n		<transitions>\n			<transition>\n				<name>approve</name>\n				<target>approved</target>\n			</transition>\n			<transition>\n				<name>reject</name>\n				<target>update</target>\n				<default>false</default>\n			</transition>\n		</transitions>\n	</task>\n	<state>\n		<name>approved</name>\n		<metadata> <![CDATA[\n				{\"xy\":[380,51]}\n			]]> </metadata>\n		<actions>\n			<action>\n				<name>approve</name>\n				<script> <![CDATA[\n						import com.liferay.portal.kernel.workflow.WorkflowStatusManagerUtil;\n						import com.liferay.portal.kernel.workflow.WorkflowConstants;\n\n						WorkflowStatusManagerUtil.updateStatus(WorkflowConstants.toStatus(\"approved\"), workflowContext);\n					]]> </script>\n				<script-language>groovy</script-language>\n				<execution-type>onEntry</execution-type>\n			</action>\n		</actions>\n	</state>\n</workflow-definition>',1,1,10477);

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

insert  into `kaleonode`(`kaleoNodeId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoDefinitionId`,`name`,`metadata`,`description`,`type_`,`initial_`,`terminal`) values (10468,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09',10467,'update','\n			{\"transitions\":{\"resubmit\":{\"bendpoints\":[[303,140]]}},\"xy\":[328,199]}\n		','','TASK',0,0),(10475,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09',10467,'approved','\n			\n				{\"xy\":[380,51]}\n			\n		','','STATE',0,1),(10477,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09',10467,'created','\n			{\"xy\":[36,51]}\n		','','STATE',1,0),(10478,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09',10467,'review','\n			{\"xy\":[168,36]}\n		','','TASK',0,0);

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

insert  into `kaleonotification`(`kaleoNotificationId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoClassName`,`kaleoClassPK`,`kaleoDefinitionId`,`kaleoNodeName`,`name`,`description`,`executionType`,`template`,`templateLanguage`,`notificationTypes`) values (10470,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09','com.liferay.portal.workflow.kaleo.model.KaleoNode',10468,10467,'update','Creator Modification Notification','','onAssignment','Your submission was rejected by ${userName}, please modify and resubmit.','freemarker','user-notification,email'),(10479,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09','com.liferay.portal.workflow.kaleo.model.KaleoNode',10478,10467,'review','Review Notification','','onAssignment','${userName} sent you a ${entryType} for review in the workflow.','freemarker','user-notification,email'),(10480,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09','com.liferay.portal.workflow.kaleo.model.KaleoNode',10478,10467,'review','Review Completion Notification','','onExit','\n					Your submission has been reviewed and the reviewer has applied the following ${taskComments}.','freemarker','email');

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

insert  into `kaleonotificationrecipient`(`kaleoNotificationRecipientId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoDefinitionId`,`kaleoNotificationId`,`recipientClassName`,`recipientClassPK`,`recipientRoleType`,`address`) values (10481,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09',10467,10480,'com.liferay.portal.model.User',0,0,'');

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

insert  into `kaleotask`(`kaleoTaskId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoDefinitionId`,`kaleoNodeId`,`name`,`description`) values (10473,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09',10467,10468,'update',''),(10482,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10',10467,10478,'review','');

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

insert  into `kaleotaskassignment`(`kaleoTaskAssignmentId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoClassName`,`kaleoClassPK`,`kaleoDefinitionId`,`kaleoNodeId`,`assigneeClassName`,`assigneeClassPK`,`assigneeActionId`,`assigneeScript`,`assigneeScriptLanguage`,`assigneeScriptRequiredContexts`) values (10474,0,10155,10159,'','2015-07-17 19:16:09','2015-07-17 19:16:09','com.liferay.portal.workflow.kaleo.model.KaleoTask',10473,10467,0,'com.liferay.portal.model.User',0,'','','',''),(10483,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10','com.liferay.portal.workflow.kaleo.model.KaleoTask',10482,10467,0,'com.liferay.portal.model.Role',10162,'','','',''),(10484,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10','com.liferay.portal.workflow.kaleo.model.KaleoTask',10482,10467,0,'com.liferay.portal.model.Role',10485,'','','',''),(10486,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10','com.liferay.portal.workflow.kaleo.model.KaleoTask',10482,10467,0,'com.liferay.portal.model.Role',10487,'','','',''),(10488,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10','com.liferay.portal.workflow.kaleo.model.KaleoTask',10482,10467,0,'com.liferay.portal.model.Role',10489,'','','',''),(10490,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10','com.liferay.portal.workflow.kaleo.model.KaleoTask',10482,10467,0,'com.liferay.portal.model.Role',10172,'','','',''),(10491,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10','com.liferay.portal.workflow.kaleo.model.KaleoTask',10482,10467,0,'com.liferay.portal.model.Role',10170,'','','',''),(10492,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10','com.liferay.portal.workflow.kaleo.model.KaleoTask',10482,10467,0,'com.liferay.portal.model.Role',10167,'','','',''),(10493,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10','com.liferay.portal.workflow.kaleo.model.KaleoTask',10482,10467,0,'com.liferay.portal.model.Role',10168,'','','','');

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

insert  into `kaleotransition`(`kaleoTransitionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`kaleoDefinitionId`,`kaleoNodeId`,`name`,`description`,`sourceKaleoNodeId`,`sourceKaleoNodeName`,`targetKaleoNodeId`,`targetKaleoNodeName`,`defaultTransition`) values (10494,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10',10467,10468,'resubmit','',10468,'update',10478,'review',1),(10495,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10',10467,10477,'review','',10477,'created',10478,'review',1),(10496,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10',10467,10478,'approve','',10478,'review',10475,'approved',1),(10497,0,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10',10467,10478,'reject','',10478,'review',10468,'update',0);

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

insert  into `layout`(`uuid_`,`plid`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`privateLayout`,`layoutId`,`parentLayoutId`,`name`,`title`,`description`,`keywords`,`robots`,`type_`,`typeSettings`,`hidden_`,`friendlyURL`,`iconImage`,`iconImageId`,`themeId`,`colorSchemeId`,`wapThemeId`,`wapColorSchemeId`,`css`,`priority`,`layoutPrototypeUuid`,`layoutPrototypeLinkEnabled`,`sourcePrototypeLayoutUuid`) values ('2c821d0e-e43e-47cd-b9d2-4c5e5eb37197',10176,10173,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Control Panel</Name></root>','','','','','control_panel','privateLayout=true\n',0,'/manage',0,0,'','','','','',0,'',0,''),('c1ec8aa7-11c6-4c51-aa88-e15c7020f28a',10321,10318,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:46',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Blog</Name></root>','','','','','portlet','column-1=33,\ncolumn-2=148_INSTANCE_NbVnUaakHJfz,114,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/layout',0,0,'','','','','',0,'',0,''),('0fb1bca0-c867-4232-989b-b538576c7613',10333,10330,10155,10159,'','2015-07-17 19:13:46','2015-07-17 19:13:47',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Content Display Page</Name></root>','','','','','portlet','column-1=141_INSTANCE_j1ARUiX863zj,122_INSTANCE_3mYQCD9E4qqo,\ncolumn-2=3,101_INSTANCE_TNgqY1W4Waou,\ndefault-asset-publisher-portlet-id=101_INSTANCE_TNgqY1W4Waou\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/layout',0,0,'','','','','',0,'',0,''),('e2dbba69-2d0b-49db-934f-e6fbb4942704',10343,10340,10155,10159,'','2015-07-17 19:13:47','2015-07-17 19:13:48',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Wiki</Name></root>','','','','','portlet','column-1=36,\ncolumn-2=122_INSTANCE_AELA4U0ILxaV,141_INSTANCE_v9hxxlJV86xR,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/layout',0,0,'','','','','',0,'',0,''),('c8c16c1b-a66b-470b-bab5-6204f2f8f358',10362,10351,10155,10159,'','2015-07-17 19:13:49','2015-07-17 19:13:51',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','','','','','portlet','column-1=19,\ncolumn-2=3,59_INSTANCE_CkaoBs86hFMU,180,101_INSTANCE_TRz0qE44e3D9,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('5e2d5e70-4aa3-4d89-916b-d7ee1d0030eb',10370,10351,10155,10159,'','2015-07-17 19:13:51','2015-07-17 19:13:51',1,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Wiki</Name></root>','','','','','portlet','column-1=36,\ncolumn-2=122_INSTANCE_fKMZcwJCJMvN,148_INSTANCE_C36nMI1ylKAq,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/wiki',0,0,'','','','','',1,'',0,''),('1fe8da13-40ef-4965-ae0a-0e8888e5cbb6',10388,10377,10155,10159,'','2015-07-17 19:13:52','2015-07-17 19:13:54',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','','','','','portlet','column-1=116,\ncolumn-2=3,82,101_INSTANCE_0sN6skhNjCAX,\nlayout-template-id=2_columns_i\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('b438b420-6c0f-4dcf-8472-bd8bd2dcaec2',10397,10377,10155,10159,'','2015-07-17 19:13:54','2015-07-17 19:13:55',1,2,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Documents and Media</Name></root>','','','','','portlet','column-1=20,\ncolumn-2=101_INSTANCE_TrTnrxJatGdL,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/documents',0,0,'','','','','',1,'',0,''),('6b96d73c-98f8-4949-ad62-1283285e5c42',10405,10377,10155,10159,'','2015-07-17 19:13:55','2015-07-17 19:13:56',1,3,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">News</Name></root>','','','','','portlet','column-1=39_INSTANCE_VDngodQYRcI1,\ncolumn-2=39_INSTANCE_jy7N7i1NiAme,\nlayout-template-id=2_columns_iii\nprivateLayout=true\n',0,'/news',0,0,'','','','','',2,'',0,''),('5a5c9aa9-fafc-4b35-b036-a3fb573821cb',10637,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('c0dc9cae-783b-4983-8cd7-91c0420a5e41',10643,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('b9cada1c-4459-4a34-9a0a-836b2633eb61',11399,11305,10155,10159,'','2015-08-03 19:04:53','2015-08-03 19:04:54',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','','','','portlet','column-1=56_INSTANCE_EKTsx5COIR1N,\ncolumn-2=56_INSTANCE_T046NqIscI6e,\ncolumn-3=56_INSTANCE_4Q79zWIcCEMg,\nlayout-template-id=1_2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('e824bcf1-a772-4a45-9b0f-f3d7bd354fa9',11513,11419,10155,10159,'','2015-08-03 19:34:39','2015-08-03 19:34:40',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Welcome</Title></root>','','','','portlet','column-1=56_INSTANCE_OWuUtaaMxSYN,\ncolumn-2=56_INSTANCE_RhBiXGJlAZfT,\ncolumn-3=56_INSTANCE_EtWFTQCyFg0x,\nlayout-template-id=1_2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('7dd64fed-1be7-4302-962e-58376941d103',12904,10182,10155,10199,'Test Test','2015-08-13 19:57:20','2015-09-16 21:19:27',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Company</Name></root>','','','','','portlet','column-1=tfcompanyportlet_WAR_tfadminportlet_INSTANCE_4SCNxO6HnzNS,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/company',0,0,'','','','','',1,'',0,''),('09de4195-abf2-4f04-8d93-5a5fc6ab51a4',12922,10182,10155,10199,'Test Test','2015-08-13 19:58:03','2015-09-16 21:19:27',1,3,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Dashboard</Name></root>','','','','','portlet','column-1=tfdashboardportlet_WAR_tfdashboardportlet\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/dashboard',0,0,'','','','','',0,'',0,''),('fe4d0e90-f6cf-4cfe-9120-4d7077e9979a',12931,10182,10155,10199,'Test Test','2015-08-13 19:58:29','2015-09-16 21:19:30',1,4,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Purchase Order</Name></root>','','','','','portlet','column-1=tfpoportlet_WAR_tfpoportlet\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nprivateLayout=true\n',1,'/purchase-order',0,0,'classic','','','','',2,'',0,''),('d90ea964-138f-4179-bb76-b07fa7dfe41c',13001,10182,10155,10199,'Test Test','2015-08-13 20:36:13','2015-08-13 21:44:36',0,5,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','','','','','portlet','column-1=58,\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nlfr-theme:regular:dashboard-view-for-logged-in-users=false\nlfr-theme:regular:hide-dockbar=false\nlfr-theme:regular:portlet-setup-show-borders-default=true\nlfr-theme:regular:show-link-user-personal-menu=false\nlfr-theme:regular:show-search-field=false\nlfr-theme:regular:site-header-icon=icon-camera-retro\nlfr-theme:regular:site-subheading=Welcome to trade Finance!\nlfr-theme:regular:theme-color-highlight=#295780\nlfr-theme:regular:theme-color-main=#295780\nsitemap-changefreq=daily\nsitemap-include=1\n',0,'/home',0,0,'tftheme_WAR_tftheme','01','','','',1,'',0,''),('95a07f1f-3ebb-499e-afc5-fbe3340387da',13215,13202,10155,10159,'','2015-08-13 21:39:00','2015-08-13 21:39:00',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Home</Name></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Home</Title></root>','','','','portlet','column-1=58,\ncolumn-2=47,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('aad0b1fc-5261-4775-9809-3699692c8085',13304,10182,10155,10199,'Test Test','2015-08-16 09:54:22','2015-10-27 20:01:38',0,7,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Registration</Name></root>','','','','','portlet','column-1=tfregistrationportlet_WAR_tfregistrationportlet\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nlfr-theme:regular:dashboard-view-for-logged-in-users=false\nlfr-theme:regular:hide-dockbar=false\nlfr-theme:regular:portlet-setup-show-borders-default=true\nlfr-theme:regular:show-link-user-personal-menu=false\nlfr-theme:regular:show-search-field=false\nlfr-theme:regular:site-header-icon=icon-camera-retro\nlfr-theme:regular:site-subheading=Welcome to trade Finance!\nlfr-theme:regular:theme-color-highlight=#295780\nlfr-theme:regular:theme-color-main=#295780\nsitemap-changefreq=daily\nsitemap-include=1\n',1,'/registration',0,0,'tftheme_WAR_tftheme','01','','','',2,'',0,''),('337fe27b-1c24-4d93-87c8-82050d7a95f3',14202,10182,10155,10199,'Test Test','2015-08-27 18:38:56','2015-08-27 18:39:29',1,5,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Invoices</Name></root>','','','','','portlet','column-1=scfinvoiceportlet_WAR_scfinvoiceportlet\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/invoices',0,0,'','','','','',3,'',0,''),('a8bbadf8-a9a1-4df3-a3e5-0f08bfce480b',14601,10182,10155,10199,'Test Test','2015-08-31 17:57:39','2015-09-01 20:04:27',1,6,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">SCF Trade</Name></root>','','','','','portlet','column-1=scftradeportlet_WAR_scftradeportlet,\nlayout-template-id=1_column\nprivateLayout=true\n',0,'/scf-trade',0,0,'','','','','',4,'',0,''),('73b16621-56b2-42f2-b7f2-c250eb19381a',18001,10182,10155,10199,'Gautam Sharma','2015-10-31 19:21:12','2016-01-19 21:39:37',1,8,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Portfolio</Name></root>','','','','','portlet','column-1=scfinvestorportlet_WAR_scfinvestorportlet\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nprivateLayout=true\n',1,'/portfolio',0,0,'classic','','','','',6,'',0,''),('ead0482d-a666-4e94-ae51-712ead7e7aa9',20001,10182,10155,10199,'Gautam Sharma','2016-01-16 20:46:18','2016-01-16 21:11:10',1,9,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Settings</Name></root>','','','','','portlet','column-1=tfsettingsportlet_WAR_tfsettingsportlet,\ncolumn-1-customizable=false\nlayout-template-id=1_column\nlayoutUpdateable=true\nprivateLayout=true\n',1,'/settings',0,0,'classic','','','','',7,'',0,''),('48c0be9b-c5a8-4ef8-9d67-7af203e86a12',20308,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:27','2016-01-19 21:34:27',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('8a15a336-5437-4a62-b900-611857c18b81',20314,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:28','2016-01-19 21:34:28',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('2bb318d9-6b60-473d-8215-6b5a5c894891',20408,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:42','2016-01-23 18:58:44',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('50b9a163-b86c-47d5-a7cc-542c302a00b0',20414,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:44','2016-01-23 18:58:44',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('2713dada-0cbe-4025-9fab-2724ad52ee6c',20428,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('7984d75d-5d69-46a3-a212-a9011e5f75d2',20434,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('0cbee0ea-9b42-4aaa-8c7c-a6354109505f',20448,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('954b00e4-055d-4027-b049-146e0af1442f',20454,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('726c0674-f749-4944-b30b-9e95a4310557',20468,20464,10155,20461,'SCF Company1','2016-01-23 19:14:01','2016-01-23 19:14:01',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('5e8af73c-eabf-4787-a113-66673a5a5962',20474,20464,10155,20461,'SCF Company1','2016-01-23 19:14:02','2016-01-23 19:14:02',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('b9261c30-47e6-4cc0-9368-8c8473584c86',20513,20509,10155,20506,'SCF Company2','2016-01-23 20:58:41','2016-01-23 20:58:41',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('129b35eb-5729-48d1-b4e9-28fdd908bb45',20519,20509,10155,20506,'SCF Company2','2016-01-23 20:58:41','2016-01-23 20:58:42',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('5fd9596e-8ee3-4017-9b6b-083c8badb114',20534,20530,10155,20527,'SCF Company3','2016-01-23 21:01:53','2016-01-23 21:01:54',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('65e84af3-e0a6-4732-b73a-f2ca3df807c6',20540,20530,10155,20527,'SCF Company3','2016-01-23 21:01:54','2016-01-23 21:01:54',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('db064440-0707-46a7-afbf-9a0d516b2e2b',20554,20550,10155,20547,'seller 1','2016-01-23 21:09:37','2016-01-23 21:09:38',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('24797bd9-a24c-46d5-b6d8-83e6e3564ae3',20560,20550,10155,20547,'seller 1','2016-01-23 21:09:38','2016-01-23 21:09:38',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,''),('ba9494c1-cc41-4e51-bcb8-152ea668b513',20574,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',1,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,23,11,\ncolumn-2=29,\nlayout-template-id=2_columns_ii\nprivateLayout=true\n',0,'/home',0,0,'','','','','',0,'',0,''),('eca7ba44-b24b-4ec2-a41d-7efeef925578',20580,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:19',0,1,0,'<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Welcome</Name></root>','','','','','portlet','column-1=82,3,\ncolumn-2=33,\nlayout-template-id=2_columns_ii\n',0,'/home',0,0,'','','','','',0,'',0,'');

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

insert  into `layoutfriendlyurl`(`uuid_`,`layoutFriendlyURLId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`plid`,`privateLayout`,`friendlyURL`,`languageId`) values ('30f71ec1-0f11-4024-9776-de7cee33cd58',10177,10173,10155,10159,'','2015-07-17 19:13:40','2015-07-17 19:13:40',10176,1,'/manage','en_US'),('e5010860-8cb4-44cd-8409-8aba951cf726',10322,10318,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45',10321,1,'/layout','en_US'),('0b340cda-d239-40be-a6c0-2c76276f9be8',10334,10330,10155,10159,'','2015-07-17 19:13:46','2015-07-17 19:13:46',10333,1,'/layout','en_US'),('38ca9c00-0f63-4282-999e-0e3b0069b179',10344,10340,10155,10159,'','2015-07-17 19:13:47','2015-07-17 19:13:47',10343,1,'/layout','en_US'),('82af6253-00cb-4dba-b7b4-695a7cbcc58c',10363,10351,10155,10159,'','2015-07-17 19:13:49','2015-07-17 19:13:49',10362,1,'/home','en_US'),('283e8abe-0f17-4b4b-8a26-6fc08709da3b',10371,10351,10155,10159,'','2015-07-17 19:13:51','2015-07-17 19:13:51',10370,1,'/wiki','en_US'),('722e1470-1ecd-4733-ba5b-5f212fff55da',10389,10377,10155,10159,'','2015-07-17 19:13:52','2015-07-17 19:13:52',10388,1,'/home','en_US'),('e90f80c5-77a5-44a2-96f4-bcc842de3c18',10398,10377,10155,10159,'','2015-07-17 19:13:54','2015-07-17 19:13:54',10397,1,'/documents','en_US'),('c860b925-1530-4f99-89a0-791e7cf886e1',10406,10377,10155,10159,'','2015-07-17 19:13:55','2015-07-17 19:13:55',10405,1,'/news','en_US'),('a542658e-75de-4c64-8de1-2a381accc12f',10638,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',10637,1,'/home','en_US'),('6431fb12-5f57-45ac-8390-3d32bbfe3b52',10644,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',10643,0,'/home','en_US'),('8ce220a7-339c-4638-8d75-ad0d22902229',11400,11305,10155,10159,'','2015-08-03 19:04:53','2015-08-03 19:04:53',11399,1,'/home','en_US'),('842661f2-7d4b-48c8-8efe-f19bd8e658cf',11514,11419,10155,10159,'','2015-08-03 19:34:39','2015-08-03 19:34:39',11513,1,'/home','en_US'),('df0d32ab-daa3-4258-8d36-2f8e6e51e3ac',12905,10182,10155,10199,'Test Test','2015-08-13 19:57:20','2015-08-13 19:57:20',12904,1,'/company','en_US'),('12431917-3a8e-49bc-89fe-a85e04db194c',12923,10182,10155,10199,'Test Test','2015-08-13 19:58:04','2015-08-13 19:58:04',12922,1,'/dashboard','en_US'),('6dea7e92-cb52-46b6-929a-7e884cf67461',12932,10182,10155,10199,'Test Test','2015-08-13 19:58:29','2015-08-13 19:58:29',12931,1,'/purchase-order','en_US'),('35f9a3c8-5c33-494a-8b0d-b5cba5bb58ea',13002,10182,10155,10199,'Test Test','2015-08-13 20:36:13','2015-08-13 20:36:13',13001,0,'/home','en_US'),('f38c1d56-77e5-42d5-aeaa-9cb25f0d539f',13216,13202,10155,10159,'','2015-08-13 21:39:00','2015-08-13 21:39:00',13215,1,'/home','en_US'),('029469a0-26c5-474b-98cc-d2a13aadd3da',13305,10182,10155,10199,'Test Test','2015-08-16 09:54:22','2015-08-16 09:54:22',13304,0,'/registration','en_US'),('49136a77-8ef7-4c11-b63e-dc789d885ec6',14203,10182,10155,10199,'Test Test','2015-08-27 18:38:56','2015-08-27 18:38:56',14202,1,'/invoices','en_US'),('74e7fe88-65f2-4493-bded-9e9fc3667914',14602,10182,10155,10199,'Test Test','2015-08-31 17:57:40','2015-08-31 17:57:40',14601,1,'/scf-trade','en_US'),('6021a986-63b9-474e-93d8-de833847a668',18002,10182,10155,10199,'Gautam Sharma','2015-10-31 19:21:12','2015-10-31 19:21:12',18001,1,'/portfolio','en_US'),('6febff21-a2f4-4909-89c0-4fe99ffa205f',20002,10182,10155,10199,'Gautam Sharma','2016-01-16 20:46:18','2016-01-16 20:46:18',20001,1,'/settings','en_US'),('056236c3-96b0-4b50-b314-c3a3857113b8',20309,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:27','2016-01-19 21:34:27',20308,1,'/home','en_US'),('de680ee8-cf8d-4112-8368-5e431763a0fc',20315,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:28','2016-01-19 21:34:28',20314,0,'/home','en_US'),('2fb08551-ee64-47f7-87c8-69df9d9ffd58',20409,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:42','2016-01-23 18:58:42',20408,1,'/home','en_US'),('47208f56-a530-4fb8-82fd-1011be307bde',20415,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:44','2016-01-23 18:58:44',20414,0,'/home','en_US'),('24aa97b3-eb53-4d84-8de7-63b6ca3edd9f',20429,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',20428,1,'/home','en_US'),('bb79fe31-744e-4c27-b1a2-d7e59b59f40c',20435,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',20434,0,'/home','en_US'),('c2800deb-d85d-47a4-9e41-42ae1a70f210',20449,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',20448,1,'/home','en_US'),('e9dca83b-c54f-4669-916a-dbbcec941fdd',20455,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',20454,0,'/home','en_US'),('b90b46b8-c8e9-4484-bcec-ca1c8d53dd76',20469,20464,10155,20461,'SCF Company1','2016-01-23 19:14:01','2016-01-23 19:14:01',20468,1,'/home','en_US'),('8fa464f0-9e75-4d25-b3d9-9dd7e11055c4',20475,20464,10155,20461,'SCF Company1','2016-01-23 19:14:02','2016-01-23 19:14:02',20474,0,'/home','en_US'),('ff0f1645-e181-46ea-80b6-30010854bcc9',20514,20509,10155,20506,'SCF Company2','2016-01-23 20:58:41','2016-01-23 20:58:41',20513,1,'/home','en_US'),('98fe2e0f-c781-4144-affc-761bc7f0a9c9',20520,20509,10155,20506,'SCF Company2','2016-01-23 20:58:41','2016-01-23 20:58:41',20519,0,'/home','en_US'),('137f2acd-081e-4cd4-9da7-662c47d5c7bd',20535,20530,10155,20527,'SCF Company3','2016-01-23 21:01:53','2016-01-23 21:01:53',20534,1,'/home','en_US'),('4ea3e9b6-a678-4b21-8197-822afdf822c8',20541,20530,10155,20527,'SCF Company3','2016-01-23 21:01:54','2016-01-23 21:01:54',20540,0,'/home','en_US'),('a7fb3aa7-b382-4f2b-98c8-8dcb6f34fc72',20555,20550,10155,20547,'seller 1','2016-01-23 21:09:37','2016-01-23 21:09:37',20554,1,'/home','en_US'),('fc373012-d728-4a36-8968-9f144fa612a6',20561,20550,10155,20547,'seller 1','2016-01-23 21:09:38','2016-01-23 21:09:38',20560,0,'/home','en_US'),('d4efc349-7586-4650-a1ab-506e1c2338ca',20575,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',20574,1,'/home','en_US'),('f1c84e79-c8d2-4537-8c60-24f941a4338e',20581,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',20580,0,'/home','en_US');

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

insert  into `layoutprototype`(`uuid_`,`layoutPrototypeId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`description`,`settings_`,`active_`) values ('821f9446-e0f4-48f4-8ee5-11756bc4210a',10317,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Blog</Name></root>','Create, edit, and view blogs from this page. Explore topics using tags, and connect with other members that blog.','',1),('1231e06e-2bef-4a52-a52d-021945a0c465',10329,10155,10159,'','2015-07-17 19:13:46','2015-07-17 19:13:46','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Content Display Page</Name></root>','Create, edit, and explore web content with this page. Search available content, explore related content with tags, and browse content categories.','',1),('1b56fcab-a998-43f7-8afa-6ef60f62dc52',10339,10155,10159,'','2015-07-17 19:13:47','2015-07-17 19:13:47','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Wiki</Name></root>','Collaborate with members through the wiki on this page. Discover related content through tags, and navigate quickly and easily with categories.','',1);

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

insert  into `layoutset`(`layoutSetId`,`groupId`,`companyId`,`createDate`,`modifiedDate`,`privateLayout`,`logo`,`logoId`,`themeId`,`colorSchemeId`,`wapThemeId`,`wapColorSchemeId`,`css`,`pageCount`,`settings_`,`layoutSetPrototypeUuid`,`layoutSetPrototypeLinkEnabled`) values (10174,10173,10155,'2015-07-17 19:13:39','2015-07-17 19:13:40',1,0,0,'classic','01','mobile','01','',1,'','',0),(10175,10173,10155,'2015-07-17 19:13:39','2015-07-17 19:13:39',0,0,0,'classic','01','mobile','01','',0,'','',0),(10183,10182,10155,'2015-07-17 19:13:41','2016-01-16 20:46:18',1,0,0,'tftheme_WAR_tftheme','01','mobile','01','',7,'lfr-theme:regular:hide-dockbar=true\nlfr-theme:regular:show-link-user-personal-menu=true\nshowSiteName=true\n','',0),(10184,10182,10155,'2015-07-17 19:13:41','2015-08-16 09:54:22',0,0,0,'welcome_WAR_welcometheme','01','mobile','01','',2,'','',0),(10193,10192,10155,'2015-07-17 19:13:41','2015-07-17 19:13:41',1,0,0,'classic','01','mobile','01','',0,'','',0),(10194,10192,10155,'2015-07-17 19:13:41','2015-07-17 19:13:41',0,0,0,'classic','01','mobile','01','',0,'','',0),(10196,10195,10155,'2015-07-17 19:13:41','2015-07-17 19:13:41',1,0,0,'classic','01','mobile','01','',0,'','',0),(10197,10195,10155,'2015-07-17 19:13:41','2015-07-17 19:13:41',0,0,0,'classic','01','mobile','01','',0,'','',0),(10203,10202,10155,'2015-07-17 19:13:42','2015-07-17 19:20:19',1,0,0,'classic','01','mobile','01','',1,'','',0),(10204,10202,10155,'2015-07-17 19:13:42','2015-07-17 19:20:19',0,0,0,'classic','01','mobile','01','',1,'','',0),(10319,10318,10155,'2015-07-17 19:13:45','2015-07-17 19:13:45',1,0,0,'classic','01','mobile','01','',1,'','',0),(10320,10318,10155,'2015-07-17 19:13:45','2015-07-17 19:13:45',0,0,0,'classic','01','mobile','01','',0,'','',0),(10331,10330,10155,'2015-07-17 19:13:46','2015-07-17 19:13:46',1,0,0,'classic','01','mobile','01','',1,'','',0),(10332,10330,10155,'2015-07-17 19:13:46','2015-07-17 19:13:46',0,0,0,'classic','01','mobile','01','',0,'','',0),(10341,10340,10155,'2015-07-17 19:13:47','2015-07-17 19:13:47',1,0,0,'classic','01','mobile','01','',1,'','',0),(10342,10340,10155,'2015-07-17 19:13:47','2015-07-17 19:13:47',0,0,0,'classic','01','mobile','01','',0,'','',0),(10352,10351,10155,'2015-07-17 19:13:48','2015-07-17 19:13:51',1,0,0,'classic','01','mobile','01','',2,'','',0),(10353,10351,10155,'2015-07-17 19:13:48','2015-07-17 19:13:48',0,0,0,'classic','01','mobile','01','',0,'','',0),(10378,10377,10155,'2015-07-17 19:13:52','2015-07-17 19:13:56',1,0,0,'classic','01','mobile','01','',3,'','',0),(10379,10377,10155,'2015-07-17 19:13:52','2015-07-17 19:13:52',0,0,0,'classic','01','mobile','01','',0,'','',0),(10665,10664,10155,'2015-07-17 19:23:51','2015-07-17 19:23:51',1,0,0,'classic','01','mobile','01','',0,'','',0),(10666,10664,10155,'2015-07-17 19:23:51','2015-07-17 19:23:51',0,0,0,'classic','01','mobile','01','',0,'','',0),(10669,10668,10155,'2015-07-17 19:24:15','2015-07-17 19:24:15',1,0,0,'classic','01','mobile','01','',0,'','',0),(10670,10668,10155,'2015-07-17 19:24:15','2015-07-17 19:24:15',0,0,0,'classic','01','mobile','01','',0,'','',0),(11306,11305,10155,'2015-08-03 19:04:33','2015-08-03 19:04:54',1,0,0,'chroma_WAR_chromatheme','01','mobile','01','',1,'','',0),(11307,11305,10155,'2015-08-03 19:04:33','2015-08-03 19:04:52',0,0,0,'chroma_WAR_chromatheme','01','mobile','01','',0,'','',0),(11420,11419,10155,'2015-08-03 19:34:23','2015-08-03 19:34:40',1,0,0,'classic','01','mobile','01','',1,'','',0),(11421,11419,10155,'2015-08-03 19:34:23','2015-08-03 19:34:38',0,0,0,'classic','01','mobile','01','',0,'','',0),(13203,13202,10155,'2015-08-13 21:38:57','2015-08-13 21:39:00',1,0,0,'classic','01','mobile','01','',1,'','',0),(13204,13202,10155,'2015-08-13 21:38:57','2015-08-13 21:38:59',0,0,0,'classic','01','mobile','01','',0,'','',0),(20305,20304,10155,'2016-01-19 21:32:49','2016-01-19 21:34:27',1,0,0,'classic','01','mobile','01','',1,'','',0),(20306,20304,10155,'2016-01-19 21:32:49','2016-01-19 21:34:28',0,0,0,'classic','01','mobile','01','',1,'','',0),(20405,20404,10155,'2016-01-23 18:57:44','2016-01-23 18:58:42',1,0,0,'classic','01','mobile','01','',1,'','',0),(20406,20404,10155,'2016-01-23 18:57:44','2016-01-23 18:58:44',0,0,0,'classic','01','mobile','01','',1,'','',0),(20425,20424,10155,'2016-01-23 19:02:23','2016-01-23 19:02:55',1,0,0,'classic','01','mobile','01','',1,'','',0),(20426,20424,10155,'2016-01-23 19:02:23','2016-01-23 19:02:55',0,0,0,'classic','01','mobile','01','',1,'','',0),(20445,20444,10155,'2016-01-23 19:06:02','2016-01-23 19:06:33',1,0,0,'classic','01','mobile','01','',1,'','',0),(20446,20444,10155,'2016-01-23 19:06:02','2016-01-23 19:06:33',0,0,0,'classic','01','mobile','01','',1,'','',0),(20465,20464,10155,'2016-01-23 19:13:36','2016-01-23 19:14:01',1,0,0,'classic','01','mobile','01','',1,'','',0),(20466,20464,10155,'2016-01-23 19:13:36','2016-01-23 19:14:02',0,0,0,'classic','01','mobile','01','',1,'','',0),(20510,20509,10155,'2016-01-23 20:49:59','2016-01-23 20:58:41',1,0,0,'classic','01','mobile','01','',1,'','',0),(20511,20509,10155,'2016-01-23 20:49:59','2016-01-23 20:58:42',0,0,0,'classic','01','mobile','01','',1,'','',0),(20531,20530,10155,'2016-01-23 21:01:29','2016-01-23 21:01:53',1,0,0,'classic','01','mobile','01','',1,'','',0),(20532,20530,10155,'2016-01-23 21:01:29','2016-01-23 21:01:54',0,0,0,'classic','01','mobile','01','',1,'','',0),(20551,20550,10155,'2016-01-23 21:09:17','2016-01-23 21:09:37',1,0,0,'classic','01','mobile','01','',1,'','',0),(20552,20550,10155,'2016-01-23 21:09:17','2016-01-23 21:09:38',0,0,0,'classic','01','mobile','01','',1,'','',0),(20571,20570,10155,'2016-01-23 21:14:10','2016-01-23 21:17:18',1,0,0,'classic','01','mobile','01','',1,'','',0),(20572,20570,10155,'2016-01-23 21:14:10','2016-01-23 21:17:18',0,0,0,'classic','01','mobile','01','',1,'','',0);

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

insert  into `layoutsetprototype`(`uuid_`,`layoutSetPrototypeId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`name`,`description`,`settings_`,`active_`) values ('e1988f51-2d34-428b-a303-ee90e4d4d1cf',10350,10155,10159,'','2015-07-17 19:13:48','2015-08-04 18:25:33','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Community Site</Name></root>','Site with Forums and Wiki','layoutsUpdateable=true\n',1),('61d99fef-9f09-466d-9d81-2e18815fbfeb',10376,10155,10159,'','2015-07-17 19:13:52','2015-08-04 18:25:33','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Intranet Site</Name></root>','Site with Documents and News','layoutsUpdateable=true\n',1),('0c509983-58f6-4eb2-b9bf-14eee0264ecd',11304,10155,10159,'','2015-08-03 19:04:33','2015-08-04 18:25:33','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Chroma Theme</Name></root>','','layoutsUpdateable=true\n',1),('90867c78-469d-4164-89c9-4a34e5b65003',11418,10155,10159,'','2015-08-03 19:34:22','2015-08-04 18:25:33','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Tf Theme</Name></root>','','layoutsUpdateable=true\n',1),('c7030ace-1782-4a26-b57d-6ab32ac45701',13201,10155,10159,'','2015-08-13 21:38:56','2015-08-13 21:39:00','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Name language-id=\"en_US\">Tf Login Theme</Name></root>','','layoutsUpdateable=true\n',1);

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

insert  into `marketplace_app`(`uuid_`,`appId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`remoteAppId`,`title`,`description`,`category`,`iconURL`,`version`) values ('15b17167-3df8-4d3c-8ee6-5256ef63ee2e',11301,0,0,'','2015-08-03 19:03:58','2015-08-03 19:03:58',45574885,'Chroma Theme','* A bug in the latest Liferay releases affects the visibility of imported content. See below for details. *Chroma is meant to provide a pragmatic look and feel for your Portal that can be adjusted via several configurable options. Its two different views allow for using it in public website–scenarios as well as for administration or dashboard-style interfaces while providing a common look and feel when switching between them.Features:- Two fully responsive views: Default and Dashboard.- Option to automatically switch to Dashboard view for logged in users.- Theme colors can be adjusted via a set of Color Pickers in the configuration menu.- Fontawesome-based site logo (optional) that can be configured in the Theme\'s settings.- Option to hide the dockbar by default.- Option to enable globally visible Search field.Please note: Because of a bug in the latest Liferay releases (including 6.2 EE SP9 and 6.2 CE GA3), Guest users will not be able to see the imported images in the Main Carousel on the Welcome page. The workaround in this case is to put the Documents and Media Portlet on a page of this Site and immediately remove it again. This will create the necessary resource permissions.','Themes / Site Templates','http://www.liferay.com/web/guest/marketplace/-/mp/asset/icon/48599355','0.9.3');

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

insert  into `marketplace_module`(`uuid_`,`moduleId`,`appId`,`contextName`) values ('c473e295-3898-4178-affe-3756c37d1951',11302,11301,'chroma-theme'),('8cc2e12c-2acd-46fd-b862-262ead1b58cf',11303,11301,'resources-importer-web');

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

insert  into `mbdiscussion`(`uuid_`,`discussionId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`threadId`) values ('dd6cb050-fdbe-4766-933e-b9988b7a895b',10181,0,0,10159,'','2015-07-17 19:13:41','2015-07-17 19:13:41',10002,10176,10179),('188694d0-1161-4f60-a512-1ef5203c536d',10327,0,0,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45',10002,10321,10324),('93195cc9-4c0a-45bf-b1de-7c1afb6910fb',10338,0,0,10159,'','2015-07-17 19:13:46','2015-07-17 19:13:46',10002,10333,10336),('c6246107-2c7d-46cd-aa0f-873b36349874',10348,0,0,10159,'','2015-07-17 19:13:47','2015-07-17 19:13:47',10002,10343,10346),('39785d60-ffc6-4acd-8ee5-9c4639470202',10367,0,0,10159,'','2015-07-17 19:13:49','2015-07-17 19:13:49',10002,10362,10365),('5a8bcfd9-3be7-48c9-9fda-b8849edc882a',10375,0,0,10159,'','2015-07-17 19:13:51','2015-07-17 19:13:51',10002,10370,10373),('9d97572a-cfcc-4b9e-b33d-62cde462879e',10393,0,0,10159,'','2015-07-17 19:13:52','2015-07-17 19:13:52',10002,10388,10391),('0816bd60-f475-4287-959d-ba2d5f3a33f9',10402,0,0,10159,'','2015-07-17 19:13:54','2015-07-17 19:13:54',10002,10397,10400),('5e4daf37-64e0-46c7-8a6d-0132d62c6a4e',10410,0,0,10159,'','2015-07-17 19:13:55','2015-07-17 19:13:55',10002,10405,10408),('b4eebcdf-2fa7-4fe3-9aa6-a149d144f167',10623,0,0,10159,'','2015-07-17 19:16:46','2015-07-17 19:16:46',10109,10617,10621),('da8bfd46-8db8-48a7-90ce-891181c14b19',10642,0,0,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',10002,10637,10640),('0ee6cb90-5763-45d0-8db8-41ebbb3ed97e',10648,0,0,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',10002,10643,10646),('ae68c0e0-b9d7-4209-87ef-889d84f1af51',11322,0,0,10159,'','2015-08-03 19:04:38','2015-08-03 19:04:38',10011,11316,11320),('ed205829-c1b4-4008-9735-3c29fb64285d',11331,0,0,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',10011,11325,11329),('2b36c83a-05c2-461e-a3d4-3f8ac3e069fa',11339,0,0,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',10011,11333,11337),('c60de81e-473d-4c72-8c2b-0f7f33ab0b65',11348,0,0,10159,'','2015-08-03 19:04:41','2015-08-03 19:04:41',10011,11341,11346),('a5264a20-7f49-46cb-a262-42acede35473',11379,0,0,10159,'','2015-08-03 19:04:47','2015-08-03 19:04:47',10109,11361,11377),('0e9343ed-ca78-4049-a572-a2ab2cacfd42',11388,0,0,10159,'','2015-08-03 19:04:49','2015-08-03 19:04:49',10109,11382,11386),('08c5d4ad-3a8a-48f2-a015-91c6b4fbe467',11396,0,0,10159,'','2015-08-03 19:04:50','2015-08-03 19:04:50',10109,11390,11394),('de03b473-bf1b-4f0b-8112-febb801e12d0',11404,0,0,10159,'','2015-08-03 19:04:53','2015-08-03 19:04:53',10002,11399,11402),('fdb35222-8a26-428d-a675-bba61510005c',11436,0,0,10159,'','2015-08-03 19:34:28','2015-08-03 19:34:28',10011,11430,11434),('2265941c-0edc-4f09-b8fc-044f246aabb3',11445,0,0,10159,'','2015-08-03 19:34:30','2015-08-03 19:34:30',10011,11439,11443),('b7923206-c5ae-415e-8877-a4cc611314c6',11455,0,0,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',10011,11448,11453),('1c593c03-f42e-4cb2-a4fd-5ff80d36414d',11464,0,0,10159,'','2015-08-03 19:34:32','2015-08-03 19:34:32',10011,11458,11462),('f814f096-f001-4d54-82b6-536f12043907',11493,0,0,10159,'','2015-08-03 19:34:36','2015-08-03 19:34:36',10109,11487,11491),('3dbd39d7-4582-43ea-9a95-68a51338fac7',11502,0,0,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',10109,11496,11500),('69589d64-7fef-4812-b033-94884277f2ab',11510,0,0,10159,'','2015-08-03 19:34:38','2015-08-03 19:34:38',10109,11504,11508),('aa2bbafb-a010-40e4-ae29-6b7070442077',11518,0,0,10159,'','2015-08-03 19:34:39','2015-08-03 19:34:39',10002,11513,11516),('7d6cf06f-a256-4fa8-8748-2f4d18515038',12909,0,0,10199,'Test Test','2015-08-13 19:57:20','2015-08-13 19:57:20',10002,12904,12907),('d2570818-fe78-479d-9875-b3365f26e1b3',12927,0,0,10199,'Test Test','2015-08-13 19:58:04','2015-08-13 19:58:04',10002,12922,12925),('9d281aee-6a2f-4420-90dd-46aced16e106',12936,0,0,10199,'Test Test','2015-08-13 19:58:29','2015-08-13 19:58:29',10002,12931,12934),('90f5337c-4dbc-437a-8a5f-35d05043afb8',13006,0,0,10199,'Test Test','2015-08-13 20:36:13','2015-08-13 20:36:13',10002,13001,13004),('3840a1ac-23ac-4816-90e0-4f119f06d39f',13220,0,0,10159,'','2015-08-13 21:39:00','2015-08-13 21:39:00',10002,13215,13218),('bfaaddc0-403b-48b1-860a-50e43f40a279',13309,0,0,10199,'Test Test','2015-08-16 09:54:23','2015-08-16 09:54:23',10002,13304,13307),('ffb0bbea-d88a-4911-b3de-095b16f23021',14207,0,0,10199,'Test Test','2015-08-27 18:38:56','2015-08-27 18:38:56',10002,14202,14205),('03f06e24-1c49-43de-9702-0f4930441f5c',14606,0,0,10199,'Test Test','2015-08-31 17:57:40','2015-08-31 17:57:40',10002,14601,14604),('cc80dd62-e5e0-4f0d-b3f0-a54d4791d6bb',17715,0,0,10199,'Gautam Sharma','2015-10-22 19:29:07','2015-10-22 19:29:07',10011,17709,17713),('53f7e558-7fc3-4c92-a03c-ca19ac5bef88',17733,0,0,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55',10011,17727,17731),('10e9ff1d-f762-4f98-9bbc-24f63d4fad4d',18006,0,0,10199,'Gautam Sharma','2015-10-31 19:21:13','2015-10-31 19:21:13',10002,18001,18004),('f3c7b3c5-84fe-409e-b938-ef009373920a',18334,0,0,10199,'Gautam Sharma','2015-11-02 17:54:21','2015-11-02 17:54:21',10011,18328,18332),('d925418b-de6e-41a6-bb6a-e80614dbbed9',18352,0,0,17001,'Colin LEVINS','2015-11-02 18:08:28','2015-11-02 18:08:28',10011,18346,18350),('ba3ba129-9799-42be-9108-e20859cfbb8d',18370,0,0,10199,'Gautam Sharma','2015-11-02 18:17:34','2015-11-02 18:17:34',10011,18364,18368),('db73bc50-1683-4421-970c-9dc432410170',18415,0,0,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15',10011,18409,18413),('a97ed0aa-e587-425a-a26f-199cf6059dda',19191,0,0,17001,'Colin LEVINS','2015-12-27 17:31:40','2015-12-27 17:31:40',10011,19185,19189),('6cec1946-572c-483f-9d98-e67f2fa5863c',19209,0,0,17001,'Colin LEVINS','2015-12-27 17:41:25','2015-12-27 17:41:25',10011,19203,19207),('dee1e58d-9416-4b3b-bf88-03fef4ebc129',19227,0,0,17001,'Colin LEVINS','2015-12-27 17:57:05','2015-12-27 17:57:05',10011,19221,19225),('05804d4f-b579-4d4c-997e-481e1c0f7e17',19285,0,0,17001,'Colin LEVINS','2015-12-27 20:22:37','2015-12-27 20:22:37',10011,19279,19283),('a8a8a56b-a84c-4fbb-ac68-ff860a6e6c34',19304,0,0,17001,'Colin LEVINS','2015-12-27 20:35:39','2015-12-27 20:35:39',10011,19298,19302),('ea5bf26f-1abc-42fe-901d-bcb03902b9d8',20006,0,0,10199,'Gautam Sharma','2016-01-16 20:46:19','2016-01-16 20:46:19',10002,20001,20004),('24237dc6-2bd1-4f85-bf45-59e7d878aee6',20313,0,0,20301,'Primary Investor1','2016-01-19 21:34:27','2016-01-19 21:34:27',10002,20308,20311),('ad9d66cb-7a3d-42c6-9efe-29ac2fbf8b19',20319,0,0,20301,'Primary Investor1','2016-01-19 21:34:28','2016-01-19 21:34:28',10002,20314,20317),('a1ce6eba-045f-4fc5-8b57-ba13d75dc4d5',20413,0,0,20401,'primary prInvestor2','2016-01-23 18:58:43','2016-01-23 18:58:43',10002,20408,20411),('7829be85-4a68-4cf6-8eda-b7bacceaca23',20419,0,0,20401,'primary prInvestor2','2016-01-23 18:58:44','2016-01-23 18:58:44',10002,20414,20417),('51e96124-c3f4-483f-825c-d220bd96e88d',20433,0,0,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',10002,20428,20431),('96cdabb3-5cbc-437d-a2d5-8433f33d102f',20439,0,0,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',10002,20434,20437),('e68d00ac-d85a-411a-96d4-89aeca6a4524',20453,0,0,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',10002,20448,20451),('76820bfc-95ca-4f8b-a695-3da33dfe3561',20459,0,0,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',10002,20454,20457),('7e28d3af-c512-4820-a3db-d9af75a49282',20473,0,0,20461,'SCF Company1','2016-01-23 19:14:01','2016-01-23 19:14:01',10002,20468,20471),('c511dd5a-8ba4-45d4-8690-fcc493f909cb',20479,0,0,20461,'SCF Company1','2016-01-23 19:14:02','2016-01-23 19:14:02',10002,20474,20477),('9c6cc8bc-c85c-4015-b7f1-60fe96d3560a',20518,0,0,20506,'SCF Company2','2016-01-23 20:58:41','2016-01-23 20:58:41',10002,20513,20516),('e6ed0de2-2c25-40fd-94fd-663f5a00d477',20524,0,0,20506,'SCF Company2','2016-01-23 20:58:42','2016-01-23 20:58:42',10002,20519,20522),('83cffc32-6452-4204-a994-d0438f181e43',20539,0,0,20527,'SCF Company3','2016-01-23 21:01:53','2016-01-23 21:01:53',10002,20534,20537),('86f892d7-4c37-4dce-88db-83539e23fa46',20545,0,0,20527,'SCF Company3','2016-01-23 21:01:54','2016-01-23 21:01:54',10002,20540,20543),('2ced336b-f35a-47b4-a4ec-a20cf97abd2a',20559,0,0,20547,'seller 1','2016-01-23 21:09:38','2016-01-23 21:09:38',10002,20554,20557),('04b928f5-a2a2-4522-9099-6b55ed789c5b',20565,0,0,20547,'seller 1','2016-01-23 21:09:38','2016-01-23 21:09:38',10002,20560,20563),('1f84a32d-6cff-4c32-b57f-657ada9a2975',20579,0,0,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',10002,20574,20577),('a22b4bb6-0b6f-4777-9c86-9ef0eac9448b',20585,0,0,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',10002,20580,20583);

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

insert  into `mbmessage`(`uuid_`,`messageId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`categoryId`,`threadId`,`rootMessageId`,`parentMessageId`,`subject`,`body`,`format`,`anonymous`,`priority`,`allowPingbacks`,`answer`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('c2011814-f94b-423b-a667-470e528d2eb6',10178,10173,10155,10159,'','2015-07-17 19:13:40','2015-07-17 19:13:40',10002,10176,-1,10179,10178,0,'10176','10176','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:13:40'),('283d4890-03dc-4c34-881c-8e3c0f8bc645',10323,10318,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45',10002,10321,-1,10324,10323,0,'10321','10321','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:13:45'),('963669ea-c574-41a0-aa5a-27352d2bcacc',10335,10330,10155,10159,'','2015-07-17 19:13:46','2015-07-17 19:13:46',10002,10333,-1,10336,10335,0,'10333','10333','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:13:46'),('99206058-1211-45ca-98be-5c3b18fe10af',10345,10340,10155,10159,'','2015-07-17 19:13:47','2015-07-17 19:13:47',10002,10343,-1,10346,10345,0,'10343','10343','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:13:47'),('204defbe-bf50-44b0-b1e8-2f7bef827c11',10364,10351,10155,10159,'','2015-07-17 19:13:49','2015-07-17 19:13:49',10002,10362,-1,10365,10364,0,'10362','10362','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:13:49'),('5f7e014c-234c-4204-bc36-fa6829760c89',10372,10351,10155,10159,'','2015-07-17 19:13:51','2015-07-17 19:13:51',10002,10370,-1,10373,10372,0,'10370','10370','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:13:51'),('7ff28569-38f2-41c2-8670-59beff00050e',10390,10377,10155,10159,'','2015-07-17 19:13:52','2015-07-17 19:13:52',10002,10388,-1,10391,10390,0,'10388','10388','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:13:52'),('1151d7a5-7fae-4845-b66f-14c1319eade6',10399,10377,10155,10159,'','2015-07-17 19:13:54','2015-07-17 19:13:54',10002,10397,-1,10400,10399,0,'10397','10397','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:13:54'),('7dc565ac-b31f-42d7-87a9-9790573629b4',10407,10377,10155,10159,'','2015-07-17 19:13:55','2015-07-17 19:13:55',10002,10405,-1,10408,10407,0,'10405','10405','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:13:55'),('8c7d8b09-85c4-4f68-8da8-87242942a254',10620,10182,10155,10159,'','2015-07-17 19:16:46','2015-07-17 19:16:46',10109,10617,-1,10621,10620,0,'10617','10617','bbcode',1,0,0,0,0,10159,'','2015-07-17 19:16:46'),('d9a5e706-9014-4e75-993a-4df8127cab24',10639,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',10002,10637,-1,10640,10639,0,'10637','10637','bbcode',0,0,0,0,0,10199,'Test Test','2015-07-17 19:20:19'),('9a8a729a-6188-4f16-a1c2-59c06b7558a4',10645,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',10002,10643,-1,10646,10645,0,'10643','10643','bbcode',0,0,0,0,0,10199,'Test Test','2015-07-17 19:20:19'),('a2cf3335-6ff7-43bc-aabe-54fc9fde65c5',11319,11305,10155,10159,'','2015-08-03 19:04:38','2015-08-03 19:04:38',10011,11316,-1,11320,11319,0,'11316','11316','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:04:38'),('e860603f-ee39-48e9-b8ee-9be423b84a69',11328,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',10011,11325,-1,11329,11328,0,'11325','11325','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:04:40'),('6849e817-29c9-4ef5-8048-6e106d14bd0d',11336,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',10011,11333,-1,11337,11336,0,'11333','11333','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:04:40'),('bd269170-791b-403b-a7ab-0ae8e3e75b1c',11345,11305,10155,10159,'','2015-08-03 19:04:41','2015-08-03 19:04:41',10011,11341,-1,11346,11345,0,'11341','11341','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:04:41'),('9dc8e01f-57ba-43e6-9642-03abf9bd6bb4',11376,11305,10155,10159,'','2015-08-03 19:04:47','2015-08-03 19:04:47',10109,11361,-1,11377,11376,0,'11361','11361','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:04:47'),('4f46ea4a-c73c-4f4e-b0ee-40d45b726b2b',11385,11305,10155,10159,'','2015-08-03 19:04:49','2015-08-03 19:04:49',10109,11382,-1,11386,11385,0,'11382','11382','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:04:49'),('5afed931-d900-4fe0-b38c-35c8fc5302c5',11393,11305,10155,10159,'','2015-08-03 19:04:50','2015-08-03 19:04:50',10109,11390,-1,11394,11393,0,'11390','11390','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:04:50'),('4496edf6-0187-4394-a19a-cd298eba223b',11401,11305,10155,10159,'','2015-08-03 19:04:53','2015-08-03 19:04:53',10002,11399,-1,11402,11401,0,'11399','11399','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:04:53'),('e6cdf81c-008f-4e0c-bde3-b92e5b5fa5da',11433,11419,10155,10159,'','2015-08-03 19:34:28','2015-08-03 19:34:28',10011,11430,-1,11434,11433,0,'11430','11430','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:34:28'),('1f8ddd4c-c544-4f26-a17b-f882d6af467b',11442,11419,10155,10159,'','2015-08-03 19:34:30','2015-08-03 19:34:30',10011,11439,-1,11443,11442,0,'11439','11439','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:34:30'),('aed74637-b8e5-4aa4-92f1-3f398439a5e7',11452,11419,10155,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',10011,11448,-1,11453,11452,0,'11448','11448','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:34:31'),('5b94a4ee-8f61-43a9-b21c-fe34aa006f35',11461,11419,10155,10159,'','2015-08-03 19:34:32','2015-08-03 19:34:32',10011,11458,-1,11462,11461,0,'11458','11458','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:34:32'),('97252eab-ae56-4d95-aed7-8158af886de1',11490,11419,10155,10159,'','2015-08-03 19:34:36','2015-08-03 19:34:36',10109,11487,-1,11491,11490,0,'11487','11487','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:34:36'),('0b5b84bc-7cdb-4044-8424-57032b70fe92',11499,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',10109,11496,-1,11500,11499,0,'11496','11496','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:34:37'),('d17bead8-9d5a-4832-b5d7-d8e0db419206',11507,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',10109,11504,-1,11508,11507,0,'11504','11504','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:34:38'),('d1e93901-9d0f-4e40-8fa1-805c90ba2749',11515,11419,10155,10159,'','2015-08-03 19:34:39','2015-08-03 19:34:39',10002,11513,-1,11516,11515,0,'11513','11513','bbcode',1,0,0,0,0,10159,'','2015-08-03 19:34:39'),('8670c626-8fe9-46b0-a1fe-cca394c0d177',12906,10182,10155,10199,'Test Test','2015-08-13 19:57:20','2015-08-13 19:57:20',10002,12904,-1,12907,12906,0,'12904','12904','bbcode',0,0,0,0,0,10199,'Test Test','2015-08-13 19:57:20'),('aa0aef14-d6d8-4498-a019-633358bda040',12924,10182,10155,10199,'Test Test','2015-08-13 19:58:04','2015-08-13 19:58:04',10002,12922,-1,12925,12924,0,'12922','12922','bbcode',0,0,0,0,0,10199,'Test Test','2015-08-13 19:58:04'),('ed11b3e5-7536-460d-bed9-cd39be890df9',12933,10182,10155,10199,'Test Test','2015-08-13 19:58:29','2015-08-13 19:58:29',10002,12931,-1,12934,12933,0,'12931','12931','bbcode',0,0,0,0,0,10199,'Test Test','2015-08-13 19:58:29'),('52ce6064-93cd-47bd-83d3-4f2747626215',13003,10182,10155,10199,'Test Test','2015-08-13 20:36:13','2015-08-13 20:36:13',10002,13001,-1,13004,13003,0,'13001','13001','bbcode',0,0,0,0,0,10199,'Test Test','2015-08-13 20:36:13'),('5fc7a4c3-d007-462a-8f0e-dcde33852211',13217,13202,10155,10159,'','2015-08-13 21:39:00','2015-08-13 21:39:00',10002,13215,-1,13218,13217,0,'13215','13215','bbcode',1,0,0,0,0,10159,'','2015-08-13 21:39:00'),('390d5ede-b31c-4b9f-a654-3c8e7d27dd67',13306,10182,10155,10199,'Test Test','2015-08-16 09:54:22','2015-08-16 09:54:22',10002,13304,-1,13307,13306,0,'13304','13304','bbcode',0,0,0,0,0,10199,'Test Test','2015-08-16 09:54:23'),('273508f3-a0a9-4820-99b4-ef413411c6e0',14204,10182,10155,10199,'Test Test','2015-08-27 18:38:56','2015-08-27 18:38:56',10002,14202,-1,14205,14204,0,'14202','14202','bbcode',0,0,0,0,0,10199,'Test Test','2015-08-27 18:38:56'),('e472f204-b114-43f5-873e-0a3ef05f40f2',14603,10182,10155,10199,'Test Test','2015-08-31 17:57:40','2015-08-31 17:57:40',10002,14601,-1,14604,14603,0,'14601','14601','bbcode',0,0,0,0,0,10199,'Test Test','2015-08-31 17:57:40'),('573fdf46-681a-4422-b6e6-0bccd6995835',17712,10182,10155,10199,'Gautam Sharma','2015-10-22 19:29:07','2015-10-22 19:29:07',10011,17709,-1,17713,17712,0,'17709','17709','bbcode',0,0,0,0,0,10199,'Gautam Sharma','2015-10-22 19:29:07'),('843a9d39-f49c-4ae3-bb11-3ef3141628dc',17730,10182,10155,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55',10011,17727,-1,17731,17730,0,'17727','17727','bbcode',0,0,0,0,0,10199,'Gautam Sharma','2015-10-22 19:58:55'),('03ad2941-98f2-4ebe-93f5-56a6583fcd94',18003,10182,10155,10199,'Gautam Sharma','2015-10-31 19:21:13','2015-10-31 19:21:13',10002,18001,-1,18004,18003,0,'18001','18001','bbcode',0,0,0,0,0,10199,'Gautam Sharma','2015-10-31 19:21:13'),('20fca4e6-3d7c-466a-9fe4-0948eecdcf0a',18331,10182,10155,10199,'Gautam Sharma','2015-11-02 17:54:21','2015-11-02 17:54:21',10011,18328,-1,18332,18331,0,'18328','18328','bbcode',0,0,0,0,0,10199,'Gautam Sharma','2015-11-02 17:54:21'),('41243804-ebdf-48e7-9f1f-e75de8f16875',18349,10182,10155,17001,'Colin LEVINS','2015-11-02 18:08:28','2015-11-02 18:08:28',10011,18346,-1,18350,18349,0,'18346','18346','bbcode',0,0,0,0,0,17001,'Colin LEVINS','2015-11-02 18:08:28'),('500b2918-e975-41f1-a427-6864d4a5896d',18367,10182,10155,10199,'Gautam Sharma','2015-11-02 18:17:34','2015-11-02 18:17:34',10011,18364,-1,18368,18367,0,'18364','18364','bbcode',0,0,0,0,0,10199,'Gautam Sharma','2015-11-02 18:17:34'),('41854380-a640-4942-9526-d7b3f5d164cd',18412,10182,10155,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15',10011,18409,-1,18413,18412,0,'18409','18409','bbcode',0,0,0,0,0,10199,'Gautam Sharma','2015-11-02 18:50:15'),('50d82e18-7e9c-4f69-a665-4fb67a8f1fda',19188,10182,10155,17001,'Colin LEVINS','2015-12-27 17:31:40','2015-12-27 17:31:40',10011,19185,-1,19189,19188,0,'19185','19185','bbcode',0,0,0,0,0,17001,'Colin LEVINS','2015-12-27 17:31:40'),('88daf304-9cf5-483e-b27a-859896230284',19206,10182,10155,17001,'Colin LEVINS','2015-12-27 17:41:25','2015-12-27 17:41:25',10011,19203,-1,19207,19206,0,'19203','19203','bbcode',0,0,0,0,0,17001,'Colin LEVINS','2015-12-27 17:41:25'),('41b9b06d-d7a0-4b4f-bb46-53ab83ebfc28',19224,10182,10155,17001,'Colin LEVINS','2015-12-27 17:57:05','2015-12-27 17:57:05',10011,19221,-1,19225,19224,0,'19221','19221','bbcode',0,0,0,0,0,17001,'Colin LEVINS','2015-12-27 17:57:05'),('7ad395f5-20f3-4e23-8a52-bac458043336',19282,10182,10155,17001,'Colin LEVINS','2015-12-27 20:22:37','2015-12-27 20:22:37',10011,19279,-1,19283,19282,0,'19279','19279','bbcode',0,0,0,0,0,17001,'Colin LEVINS','2015-12-27 20:22:37'),('3fb5e091-7a9f-4d8a-bf55-1f6dc777b465',19301,10182,10155,17001,'Colin LEVINS','2015-12-27 20:35:39','2015-12-27 20:35:39',10011,19298,-1,19302,19301,0,'19298','19298','bbcode',0,0,0,0,0,17001,'Colin LEVINS','2015-12-27 20:35:39'),('2954bb0d-e903-4d28-900e-e3794b7647e8',20003,10182,10155,10199,'Gautam Sharma','2016-01-16 20:46:18','2016-01-16 20:46:18',10002,20001,-1,20004,20003,0,'20001','20001','bbcode',0,0,0,0,0,10199,'Gautam Sharma','2016-01-16 20:46:19'),('31444a9c-b017-41bc-a9ee-efc33099ff82',20310,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:27','2016-01-19 21:34:27',10002,20308,-1,20311,20310,0,'20308','20308','bbcode',0,0,0,0,0,20301,'Primary Investor1','2016-01-19 21:34:27'),('24be1e7f-0a54-4b5f-a128-8f1864a42547',20316,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:28','2016-01-19 21:34:28',10002,20314,-1,20317,20316,0,'20314','20314','bbcode',0,0,0,0,0,20301,'Primary Investor1','2016-01-19 21:34:28'),('a6b2164f-34b1-4d21-8c48-7062024e1a5f',20410,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:43','2016-01-23 18:58:43',10002,20408,-1,20411,20410,0,'20408','20408','bbcode',0,0,0,0,0,20401,'primary prInvestor2','2016-01-23 18:58:43'),('68051c63-cf27-4477-8c49-22fbc0528efc',20416,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:44','2016-01-23 18:58:44',10002,20414,-1,20417,20416,0,'20414','20414','bbcode',0,0,0,0,0,20401,'primary prInvestor2','2016-01-23 18:58:44'),('8c45c011-4249-4394-ac02-e628caab5e69',20430,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',10002,20428,-1,20431,20430,0,'20428','20428','bbcode',0,0,0,0,0,20421,'primary Investor3','2016-01-23 19:02:55'),('cfca73ef-38a5-48b6-86c5-dc4ce7f29589',20436,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',10002,20434,-1,20437,20436,0,'20434','20434','bbcode',0,0,0,0,0,20421,'primary Investor3','2016-01-23 19:02:55'),('0a36d607-7f28-4b5a-a8c8-2c77bafa8bfc',20450,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',10002,20448,-1,20451,20450,0,'20448','20448','bbcode',0,0,0,0,0,20441,'primary Investor4','2016-01-23 19:06:33'),('e02b3e5d-655b-4dd2-9d08-73a16caac69e',20456,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',10002,20454,-1,20457,20456,0,'20454','20454','bbcode',0,0,0,0,0,20441,'primary Investor4','2016-01-23 19:06:33'),('bd364dcb-212d-4fa7-aa2c-6f67af819667',20470,20464,10155,20461,'SCF Company1','2016-01-23 19:14:01','2016-01-23 19:14:01',10002,20468,-1,20471,20470,0,'20468','20468','bbcode',0,0,0,0,0,20461,'SCF Company1','2016-01-23 19:14:01'),('b3689d65-6acf-4bad-a2e3-c3248a74dc41',20476,20464,10155,20461,'SCF Company1','2016-01-23 19:14:02','2016-01-23 19:14:02',10002,20474,-1,20477,20476,0,'20474','20474','bbcode',0,0,0,0,0,20461,'SCF Company1','2016-01-23 19:14:02'),('a03e12da-ca0b-434e-9e8e-60672533d933',20515,20509,10155,20506,'SCF Company2','2016-01-23 20:58:41','2016-01-23 20:58:41',10002,20513,-1,20516,20515,0,'20513','20513','bbcode',0,0,0,0,0,20506,'SCF Company2','2016-01-23 20:58:41'),('c19c49da-6034-496f-9422-dffe043eeef0',20521,20509,10155,20506,'SCF Company2','2016-01-23 20:58:42','2016-01-23 20:58:42',10002,20519,-1,20522,20521,0,'20519','20519','bbcode',0,0,0,0,0,20506,'SCF Company2','2016-01-23 20:58:42'),('8eb99458-688f-41c9-8476-d20a01dccd49',20536,20530,10155,20527,'SCF Company3','2016-01-23 21:01:53','2016-01-23 21:01:53',10002,20534,-1,20537,20536,0,'20534','20534','bbcode',0,0,0,0,0,20527,'SCF Company3','2016-01-23 21:01:53'),('27490650-928a-47af-835d-bad73fc30039',20542,20530,10155,20527,'SCF Company3','2016-01-23 21:01:54','2016-01-23 21:01:54',10002,20540,-1,20543,20542,0,'20540','20540','bbcode',0,0,0,0,0,20527,'SCF Company3','2016-01-23 21:01:54'),('879c44de-9d66-4ac4-90b8-7b02d1cbe03a',20556,20550,10155,20547,'seller 1','2016-01-23 21:09:37','2016-01-23 21:09:37',10002,20554,-1,20557,20556,0,'20554','20554','bbcode',0,0,0,0,0,20547,'seller 1','2016-01-23 21:09:37'),('1f3de588-1923-4840-b335-4f5f0ea6fc55',20562,20550,10155,20547,'seller 1','2016-01-23 21:09:38','2016-01-23 21:09:38',10002,20560,-1,20563,20562,0,'20560','20560','bbcode',0,0,0,0,0,20547,'seller 1','2016-01-23 21:09:38'),('61b9b44e-4083-4871-a2f0-17be70ac4b52',20576,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',10002,20574,-1,20577,20576,0,'20574','20574','bbcode',0,0,0,0,0,20567,'Seller 2','2016-01-23 21:17:18'),('c8e83b4e-78fe-4e65-ac4b-24d4e7586feb',20582,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',10002,20580,-1,20583,20582,0,'20580','20580','bbcode',0,0,0,0,0,20567,'Seller 2','2016-01-23 21:17:18');

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

insert  into `mbthread`(`uuid_`,`threadId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`categoryId`,`rootMessageId`,`rootMessageUserId`,`messageCount`,`viewCount`,`lastPostByUserId`,`lastPostDate`,`priority`,`question`,`status`,`statusByUserId`,`statusByUserName`,`statusDate`) values ('902ab370-120b-4b57-beab-873ebbd8f0c6',10179,10173,10155,10159,'','2015-07-17 19:13:40','2015-07-17 19:13:40',-1,10178,10159,1,0,0,'2015-07-17 19:13:40',0,0,0,10159,'','2015-07-17 19:13:40'),('b014dd37-e36e-48bc-9396-86abd87435a4',10324,10318,10155,10159,'','2015-07-17 19:13:45','2015-07-17 19:13:45',-1,10323,10159,1,0,0,'2015-07-17 19:13:45',0,0,0,10159,'','2015-07-17 19:13:45'),('217f25ed-dc51-4dc7-9abd-62e240da1b29',10336,10330,10155,10159,'','2015-07-17 19:13:46','2015-07-17 19:13:46',-1,10335,10159,1,0,0,'2015-07-17 19:13:46',0,0,0,10159,'','2015-07-17 19:13:46'),('95e5e794-54fc-4f91-a720-457bb7a81056',10346,10340,10155,10159,'','2015-07-17 19:13:47','2015-07-17 19:13:47',-1,10345,10159,1,0,0,'2015-07-17 19:13:47',0,0,0,10159,'','2015-07-17 19:13:47'),('31117195-ce6f-4e6f-88d2-ce5f04f5b3fc',10365,10351,10155,10159,'','2015-07-17 19:13:49','2015-07-17 19:13:49',-1,10364,10159,1,0,0,'2015-07-17 19:13:49',0,0,0,10159,'','2015-07-17 19:13:49'),('04394be5-a027-4fa5-917e-afcb774a6e80',10373,10351,10155,10159,'','2015-07-17 19:13:51','2015-07-17 19:13:51',-1,10372,10159,1,0,0,'2015-07-17 19:13:51',0,0,0,10159,'','2015-07-17 19:13:51'),('021e8466-18ae-4a28-acde-68968c3d3a23',10391,10377,10155,10159,'','2015-07-17 19:13:52','2015-07-17 19:13:52',-1,10390,10159,1,0,0,'2015-07-17 19:13:52',0,0,0,10159,'','2015-07-17 19:13:52'),('db9d591c-b4ba-4567-9b84-1723ec2eb421',10400,10377,10155,10159,'','2015-07-17 19:13:54','2015-07-17 19:13:54',-1,10399,10159,1,0,0,'2015-07-17 19:13:54',0,0,0,10159,'','2015-07-17 19:13:54'),('7965f2b6-de6e-4540-b840-e75d5fcde931',10408,10377,10155,10159,'','2015-07-17 19:13:55','2015-07-17 19:13:55',-1,10407,10159,1,0,0,'2015-07-17 19:13:55',0,0,0,10159,'','2015-07-17 19:13:55'),('020c7b01-60fd-4292-b9e4-bc74785b2d00',10621,10182,10155,10159,'','2015-07-17 19:16:46','2015-07-17 19:16:46',-1,10620,10159,1,0,0,'2015-07-17 19:16:46',0,0,0,10159,'','2015-07-17 19:16:46'),('3a230d2e-807b-4d68-8d9d-8288a3f15405',10640,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',-1,10639,10199,1,0,10199,'2015-07-17 19:20:19',0,0,0,10199,'Test Test','2015-07-17 19:20:19'),('18630124-922b-45c3-a9fb-930d64d0fcc3',10646,10202,10155,10199,'Test Test','2015-07-17 19:20:19','2015-07-17 19:20:19',-1,10645,10199,1,0,10199,'2015-07-17 19:20:19',0,0,0,10199,'Test Test','2015-07-17 19:20:19'),('fe9003f7-1bca-47b7-bb16-f02757741f10',11320,11305,10155,10159,'','2015-08-03 19:04:38','2015-08-03 19:04:38',-1,11319,10159,1,0,0,'2015-08-03 19:04:38',0,0,0,10159,'','2015-08-03 19:04:38'),('f00a6552-1a9c-47b6-b419-74c04739ad63',11329,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',-1,11328,10159,1,0,0,'2015-08-03 19:04:40',0,0,0,10159,'','2015-08-03 19:04:40'),('959dda1a-187d-4a9a-a6da-d6c2a5d3000b',11337,11305,10155,10159,'','2015-08-03 19:04:40','2015-08-03 19:04:40',-1,11336,10159,1,0,0,'2015-08-03 19:04:40',0,0,0,10159,'','2015-08-03 19:04:40'),('3172b405-0653-4820-bca9-c656612ba539',11346,11305,10155,10159,'','2015-08-03 19:04:41','2015-08-03 19:04:41',-1,11345,10159,1,0,0,'2015-08-03 19:04:41',0,0,0,10159,'','2015-08-03 19:04:41'),('351f7ca6-f825-4db1-97bb-c2deb4aa2b6b',11377,11305,10155,10159,'','2015-08-03 19:04:47','2015-08-03 19:04:47',-1,11376,10159,1,0,0,'2015-08-03 19:04:47',0,0,0,10159,'','2015-08-03 19:04:47'),('8960e2d7-4c89-4956-b028-cebfded286b3',11386,11305,10155,10159,'','2015-08-03 19:04:49','2015-08-03 19:04:49',-1,11385,10159,1,0,0,'2015-08-03 19:04:49',0,0,0,10159,'','2015-08-03 19:04:49'),('9d31e4a8-ae4a-4861-ae7d-273668e27393',11394,11305,10155,10159,'','2015-08-03 19:04:50','2015-08-03 19:04:50',-1,11393,10159,1,0,0,'2015-08-03 19:04:50',0,0,0,10159,'','2015-08-03 19:04:50'),('8ef9ef9b-191e-44f9-a71f-d5003313256c',11402,11305,10155,10159,'','2015-08-03 19:04:53','2015-08-03 19:04:53',-1,11401,10159,1,0,0,'2015-08-03 19:04:53',0,0,0,10159,'','2015-08-03 19:04:53'),('1f6f1a4f-2b51-4b00-b017-daadbeb03fac',11434,11419,10155,10159,'','2015-08-03 19:34:28','2015-08-03 19:34:28',-1,11433,10159,1,0,0,'2015-08-03 19:34:28',0,0,0,10159,'','2015-08-03 19:34:28'),('22c55b94-1b92-44b9-bfc4-f1d75b3ce80f',11443,11419,10155,10159,'','2015-08-03 19:34:30','2015-08-03 19:34:30',-1,11442,10159,1,0,0,'2015-08-03 19:34:30',0,0,0,10159,'','2015-08-03 19:34:30'),('35ae1f2a-ac88-4908-8b1c-e3bc87580968',11453,11419,10155,10159,'','2015-08-03 19:34:31','2015-08-03 19:34:31',-1,11452,10159,1,0,0,'2015-08-03 19:34:31',0,0,0,10159,'','2015-08-03 19:34:31'),('d3ea4340-1530-4659-b2b2-f141849dbe46',11462,11419,10155,10159,'','2015-08-03 19:34:32','2015-08-03 19:34:32',-1,11461,10159,1,0,0,'2015-08-03 19:34:32',0,0,0,10159,'','2015-08-03 19:34:32'),('f54cbb55-4f9c-421a-8b06-27fc5fa4ea4e',11491,11419,10155,10159,'','2015-08-03 19:34:36','2015-08-03 19:34:36',-1,11490,10159,1,0,0,'2015-08-03 19:34:36',0,0,0,10159,'','2015-08-03 19:34:36'),('9cccd0fd-8884-4d5d-a1c6-5c387ba363ec',11500,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:37',-1,11499,10159,1,0,0,'2015-08-03 19:34:37',0,0,0,10159,'','2015-08-03 19:34:37'),('ba0fd4e1-158c-4efa-b4cd-97947cc27c99',11508,11419,10155,10159,'','2015-08-03 19:34:37','2015-08-03 19:34:38',-1,11507,10159,1,0,0,'2015-08-03 19:34:38',0,0,0,10159,'','2015-08-03 19:34:38'),('4539809b-7b98-4197-baf2-1e44585637f2',11516,11419,10155,10159,'','2015-08-03 19:34:39','2015-08-03 19:34:39',-1,11515,10159,1,0,0,'2015-08-03 19:34:39',0,0,0,10159,'','2015-08-03 19:34:39'),('8a350875-d2ba-4bb8-ae49-32ae3c297799',12907,10182,10155,10199,'Test Test','2015-08-13 19:57:20','2015-08-13 19:57:20',-1,12906,10199,1,0,10199,'2015-08-13 19:57:20',0,0,0,10199,'Test Test','2015-08-13 19:57:20'),('e0888363-b372-4760-97d3-9c1897cc2659',12925,10182,10155,10199,'Test Test','2015-08-13 19:58:04','2015-08-13 19:58:04',-1,12924,10199,1,0,10199,'2015-08-13 19:58:04',0,0,0,10199,'Test Test','2015-08-13 19:58:04'),('b85a0ce8-a75a-4565-ac1e-7d85f4be17a1',12934,10182,10155,10199,'Test Test','2015-08-13 19:58:29','2015-08-13 19:58:29',-1,12933,10199,1,0,10199,'2015-08-13 19:58:29',0,0,0,10199,'Test Test','2015-08-13 19:58:29'),('e7fa4d7a-26e3-4806-88ab-b83a82f82d5f',13004,10182,10155,10199,'Test Test','2015-08-13 20:36:13','2015-08-13 20:36:13',-1,13003,10199,1,0,10199,'2015-08-13 20:36:13',0,0,0,10199,'Test Test','2015-08-13 20:36:13'),('216a3426-f583-4de9-926f-aad5a070aa25',13218,13202,10155,10159,'','2015-08-13 21:39:00','2015-08-13 21:39:00',-1,13217,10159,1,0,0,'2015-08-13 21:39:00',0,0,0,10159,'','2015-08-13 21:39:00'),('6cc052f1-ebc3-45c3-8615-a8bf0f0bbbc4',13307,10182,10155,10199,'Test Test','2015-08-16 09:54:22','2015-08-16 09:54:23',-1,13306,10199,1,0,10199,'2015-08-16 09:54:23',0,0,0,10199,'Test Test','2015-08-16 09:54:23'),('db0e5761-0b19-4ca7-a1e6-7c53db8dfb75',14205,10182,10155,10199,'Test Test','2015-08-27 18:38:56','2015-08-27 18:38:56',-1,14204,10199,1,0,10199,'2015-08-27 18:38:56',0,0,0,10199,'Test Test','2015-08-27 18:38:56'),('4ad8855a-0baf-457b-ab02-f7e6ac2751d8',14604,10182,10155,10199,'Test Test','2015-08-31 17:57:40','2015-08-31 17:57:40',-1,14603,10199,1,0,10199,'2015-08-31 17:57:40',0,0,0,10199,'Test Test','2015-08-31 17:57:40'),('aa9f1e61-9674-4043-a3dc-4c6ffdc66475',17713,10182,10155,10199,'Gautam Sharma','2015-10-22 19:29:07','2015-10-22 19:29:07',-1,17712,10199,1,0,10199,'2015-10-22 19:29:07',0,0,0,10199,'Gautam Sharma','2015-10-22 19:29:07'),('de68e21c-097f-4f04-abf8-f3fb8d4d203b',17731,10182,10155,10199,'Gautam Sharma','2015-10-22 19:58:55','2015-10-22 19:58:55',-1,17730,10199,1,0,10199,'2015-10-22 19:58:55',0,0,0,10199,'Gautam Sharma','2015-10-22 19:58:55'),('8e20de94-77d9-4335-ad1e-6979d3010b2d',18004,10182,10155,10199,'Gautam Sharma','2015-10-31 19:21:13','2015-10-31 19:21:13',-1,18003,10199,1,0,10199,'2015-10-31 19:21:13',0,0,0,10199,'Gautam Sharma','2015-10-31 19:21:13'),('7558098b-5149-4b5e-97ff-89cc495dbfc9',18332,10182,10155,10199,'Gautam Sharma','2015-11-02 17:54:21','2015-11-02 17:54:21',-1,18331,10199,1,0,10199,'2015-11-02 17:54:21',0,0,0,10199,'Gautam Sharma','2015-11-02 17:54:21'),('76fc7d7f-7296-4924-b915-7d87a07c93ba',18350,10182,10155,17001,'Colin LEVINS','2015-11-02 18:08:28','2015-11-02 18:08:28',-1,18349,17001,1,0,17001,'2015-11-02 18:08:28',0,0,0,17001,'Colin LEVINS','2015-11-02 18:08:28'),('eec9d354-929f-49df-a353-4132e0a3003b',18368,10182,10155,10199,'Gautam Sharma','2015-11-02 18:17:34','2015-11-02 18:17:34',-1,18367,10199,1,0,10199,'2015-11-02 18:17:34',0,0,0,10199,'Gautam Sharma','2015-11-02 18:17:34'),('e82b6777-6592-4e2a-91e5-6d64c53ddcf6',18413,10182,10155,10199,'Gautam Sharma','2015-11-02 18:50:15','2015-11-02 18:50:15',-1,18412,10199,1,0,10199,'2015-11-02 18:50:15',0,0,0,10199,'Gautam Sharma','2015-11-02 18:50:15'),('2c070144-964f-4e25-80e8-3d2accdf9082',19189,10182,10155,17001,'Colin LEVINS','2015-12-27 17:31:40','2015-12-27 17:31:40',-1,19188,17001,1,0,17001,'2015-12-27 17:31:40',0,0,0,17001,'Colin LEVINS','2015-12-27 17:31:40'),('779db633-54af-4ee8-bc93-2404979193d8',19207,10182,10155,17001,'Colin LEVINS','2015-12-27 17:41:25','2015-12-27 17:41:25',-1,19206,17001,1,0,17001,'2015-12-27 17:41:25',0,0,0,17001,'Colin LEVINS','2015-12-27 17:41:25'),('1184e53a-3286-4976-82ac-e49e299ed749',19225,10182,10155,17001,'Colin LEVINS','2015-12-27 17:57:05','2015-12-27 17:57:05',-1,19224,17001,1,0,17001,'2015-12-27 17:57:05',0,0,0,17001,'Colin LEVINS','2015-12-27 17:57:05'),('90f06404-73f3-4252-89d6-2d08d7fe810f',19283,10182,10155,17001,'Colin LEVINS','2015-12-27 20:22:37','2015-12-27 20:22:37',-1,19282,17001,1,0,17001,'2015-12-27 20:22:37',0,0,0,17001,'Colin LEVINS','2015-12-27 20:22:37'),('3290e8c5-6c55-417c-9621-0e2d47b511a6',19302,10182,10155,17001,'Colin LEVINS','2015-12-27 20:35:39','2015-12-27 20:35:39',-1,19301,17001,1,0,17001,'2015-12-27 20:35:39',0,0,0,17001,'Colin LEVINS','2015-12-27 20:35:39'),('8c95bd2d-767b-4b6f-b4e8-3fcfca7ddd41',20004,10182,10155,10199,'Gautam Sharma','2016-01-16 20:46:18','2016-01-16 20:46:19',-1,20003,10199,1,0,10199,'2016-01-16 20:46:19',0,0,0,10199,'Gautam Sharma','2016-01-16 20:46:19'),('582c9afc-7028-4532-84b7-2a1c2520123d',20311,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:27','2016-01-19 21:34:27',-1,20310,20301,1,0,20301,'2016-01-19 21:34:27',0,0,0,20301,'Primary Investor1','2016-01-19 21:34:27'),('4af9c012-e84c-4576-8f6b-bbd3a06adcee',20317,20304,10155,20301,'Primary Investor1','2016-01-19 21:34:28','2016-01-19 21:34:28',-1,20316,20301,1,0,20301,'2016-01-19 21:34:28',0,0,0,20301,'Primary Investor1','2016-01-19 21:34:28'),('e53ca937-f54e-426a-9a85-3866dcf89b6b',20411,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:43','2016-01-23 18:58:43',-1,20410,20401,1,0,20401,'2016-01-23 18:58:43',0,0,0,20401,'primary prInvestor2','2016-01-23 18:58:43'),('41743219-7979-49df-959e-6bffed09212a',20417,20404,10155,20401,'primary prInvestor2','2016-01-23 18:58:44','2016-01-23 18:58:44',-1,20416,20401,1,0,20401,'2016-01-23 18:58:44',0,0,0,20401,'primary prInvestor2','2016-01-23 18:58:44'),('18a97f8b-5999-40f7-a204-9e0760b55646',20431,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',-1,20430,20421,1,0,20421,'2016-01-23 19:02:55',0,0,0,20421,'primary Investor3','2016-01-23 19:02:55'),('a681c11a-61c3-4f16-ad45-25c5c41a8170',20437,20424,10155,20421,'primary Investor3','2016-01-23 19:02:55','2016-01-23 19:02:55',-1,20436,20421,1,0,20421,'2016-01-23 19:02:55',0,0,0,20421,'primary Investor3','2016-01-23 19:02:55'),('77f81897-fc76-499a-a3e0-75cd6c456c41',20451,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',-1,20450,20441,1,0,20441,'2016-01-23 19:06:33',0,0,0,20441,'primary Investor4','2016-01-23 19:06:33'),('bfa3a841-3f36-4dd9-9847-92f59570b06a',20457,20444,10155,20441,'primary Investor4','2016-01-23 19:06:33','2016-01-23 19:06:33',-1,20456,20441,1,0,20441,'2016-01-23 19:06:33',0,0,0,20441,'primary Investor4','2016-01-23 19:06:33'),('d2a99010-ebab-40b2-95a0-0635454f9c91',20471,20464,10155,20461,'SCF Company1','2016-01-23 19:14:01','2016-01-23 19:14:01',-1,20470,20461,1,0,20461,'2016-01-23 19:14:01',0,0,0,20461,'SCF Company1','2016-01-23 19:14:01'),('a3957ad1-5219-4a6e-bff2-fdbd8254e128',20477,20464,10155,20461,'SCF Company1','2016-01-23 19:14:02','2016-01-23 19:14:02',-1,20476,20461,1,0,20461,'2016-01-23 19:14:02',0,0,0,20461,'SCF Company1','2016-01-23 19:14:02'),('99bcaa96-d24a-430f-b9e7-b119805406f7',20516,20509,10155,20506,'SCF Company2','2016-01-23 20:58:41','2016-01-23 20:58:41',-1,20515,20506,1,0,20506,'2016-01-23 20:58:41',0,0,0,20506,'SCF Company2','2016-01-23 20:58:41'),('0ca7c56a-5337-4ad9-b9b6-15444a446cd7',20522,20509,10155,20506,'SCF Company2','2016-01-23 20:58:42','2016-01-23 20:58:42',-1,20521,20506,1,0,20506,'2016-01-23 20:58:42',0,0,0,20506,'SCF Company2','2016-01-23 20:58:42'),('7187bb2b-6f3b-4024-9c7b-86a4a8b7a3aa',20537,20530,10155,20527,'SCF Company3','2016-01-23 21:01:53','2016-01-23 21:01:53',-1,20536,20527,1,0,20527,'2016-01-23 21:01:53',0,0,0,20527,'SCF Company3','2016-01-23 21:01:53'),('0d633204-bb9c-4c75-9351-f761e524268b',20543,20530,10155,20527,'SCF Company3','2016-01-23 21:01:54','2016-01-23 21:01:54',-1,20542,20527,1,0,20527,'2016-01-23 21:01:54',0,0,0,20527,'SCF Company3','2016-01-23 21:01:54'),('d6dbafa2-2ff9-4907-be5f-811ce1a51041',20557,20550,10155,20547,'seller 1','2016-01-23 21:09:37','2016-01-23 21:09:37',-1,20556,20547,1,0,20547,'2016-01-23 21:09:37',0,0,0,20547,'seller 1','2016-01-23 21:09:37'),('4ab96978-dba5-4bd6-abcb-025836be60e7',20563,20550,10155,20547,'seller 1','2016-01-23 21:09:38','2016-01-23 21:09:38',-1,20562,20547,1,0,20547,'2016-01-23 21:09:38',0,0,0,20547,'seller 1','2016-01-23 21:09:38'),('3310347b-efd7-4f8e-8977-6f6e883cf95b',20577,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',-1,20576,20567,1,0,20567,'2016-01-23 21:17:18',0,0,0,20567,'Seller 2','2016-01-23 21:17:18'),('e325dd2d-aa56-40df-8059-fe26a7ef559d',20583,20570,10155,20567,'Seller 2','2016-01-23 21:17:18','2016-01-23 21:17:18',-1,20582,20567,1,0,20567,'2016-01-23 21:17:18',0,0,0,20567,'Seller 2','2016-01-23 21:17:18');

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

insert  into `passwordpolicy`(`uuid_`,`passwordPolicyId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`defaultPolicy`,`name`,`description`,`changeable`,`changeRequired`,`minAge`,`checkSyntax`,`allowDictionaryWords`,`minAlphanumeric`,`minLength`,`minLowerCase`,`minNumbers`,`minSymbols`,`minUpperCase`,`regex`,`history`,`historyCount`,`expireable`,`maxAge`,`warningTime`,`graceLimit`,`lockout`,`maxFailure`,`lockoutDuration`,`requireUnlock`,`resetFailureCount`,`resetTicketMaxAge`) values ('96d090ec-80e5-49cb-b426-fc773ce6a002',10198,10155,10159,'','2015-07-17 19:13:41','2015-07-17 19:13:41',1,'Default Password Policy','Default Password Policy',1,1,0,0,1,0,6,0,1,0,1,'(?=.{4})(?:[a-zA-Z0-9]*)',0,6,0,8640000,86400,0,0,3,0,1,600,86400);

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

insert  into `passwordpolicyrel`(`passwordPolicyRelId`,`passwordPolicyId`,`classNameId`,`classPK`) values (10201,10198,10005,10199),(20303,10198,10005,20301),(20403,10198,10005,20401),(20423,10198,10005,20421),(20443,10198,10005,20441),(20463,10198,10005,20461),(20508,10198,10005,20506),(20529,10198,10005,20527),(20549,10198,10005,20547),(20569,10198,10005,20567);

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

/*Table structure for table `pizza` */

DROP TABLE IF EXISTS `pizza`;

CREATE TABLE `pizza` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pizza` */

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

insert  into `portalpreferences`(`portalPreferencesId`,`ownerId`,`ownerType`,`preferences`) values (10154,0,1,'<portlet-preferences><preference><name>mail.session.mail</name><value>true</value></preference><preference><name>imagemagick.resource.limit.file</name><value></value></preference><preference><name>mail.session.mail.smtp.user</name><value>gautam.tf2015@gmail.com</value></preference><preference><name>mail.session.mail.pop3.host</name><value>localhost</value></preference><preference><name>imagemagick.resource.limit.area</name><value>2GiB</value></preference><preference><name>imagemagick.resource.limit.memory</name><value>2GiB</value></preference><preference><name>mail.session.mail.pop3.user</name><value>gautam.tf2015@gmail.com</value></preference><preference><name>mail.session.mail.advanced.properties</name><value></value></preference><preference><name>mail.session.mail.pop3.password</name><value>Trade2015</value></preference><preference><name>mail.session.mail.pop3.port</name><value>110</value></preference><preference><name>openoffice.server.enabled</name><value>true</value></preference><preference><name>mail.session.mail.store.protocol</name><value>pop3</value></preference><preference><name>imagemagick.enabled</name><value>false</value></preference><preference><name>openoffice.server.port</name><value>8100</value></preference><preference><name>imagemagick.resource.limit.disk</name><value></value></preference><preference><name>mail.session.mail.transport.protocol</name><value>smtps</value></preference><preference><name>mail.session.mail.smtp.host</name><value>smtp.gmail.com</value></preference><preference><name>imagemagick.global.search.path</name><value>C:\\Program Files\\gs\\bin;C:\\Program Files\\ImageMagick</value></preference><preference><name>xuggler.enabled</name><value>false</value></preference><preference><name>imagemagick.resource.limit.thread</name><value></value></preference><preference><name>mail.session.mail.smtp.password</name><value>Trade2015</value></preference><preference><name>imagemagick.resource.limit.map</name><value>1GiB</value></preference><preference><name>imagemagick.resource.limit.time</name><value></value></preference><preference><name>mail.session.mail.smtp.port</name><value>465</value></preference></portlet-preferences>'),(10161,10155,1,'<portlet-preferences><preference><name>company.security.strangers.verify</name><value>false</value></preference><preference><name>facebook.connect.app.secret</name><value>admin</value></preference><preference><name>locales</name><value>ca_ES,zh_CN,en_US,fi_FI,fr_FR,de_DE,iw_IL,hu_HU,ja_JP,pt_BR,es_ES</value></preference><preference><name>ldap.server.ids</name><value></value></preference><preference><name>admin.analytics.types</name><value>google[$NEW_LINE$]piwik</value></preference><preference><name>admin.default.group.names</name><value>WhiteHall Finance</value></preference><preference><name>admin.email.user.added.enabled</name><value>false</value></preference><preference><name>admin.email.password.reset.subject</name><value>[$PORTAL_URL$]: Reset Your Password</value></preference><preference><name>admin.email.user.added.subject</name><value>[$PORTAL_URL$]: Your New Account</value></preference><preference><name>admin.email.password.sent.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Your new password for [$PORTAL_URL$] is [$USER_PASSWORD$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]The request for a new password was made from [$REMOTE_ADDRESS$] / [$REMOTE_HOST$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>admin.email.verification.subject</name><value>[$PORTAL_URL$]: Email Address Verification</value></preference><preference><name>open.id.auth.enabled</name><value>false</value></preference><preference><name>admin.default.role.names</name><value>Power User[$NEW_LINE$]User</value></preference><preference><name>company.security.strangers.with.mx</name><value>true</value></preference><preference><name>company.security.auto.login</name><value>true</value></preference><preference><name>default.landing.page.path</name><value>/group/guest/dashboard</value></preference><preference><name>facebook.connect.app.id</name><value>test@liferay.com</value></preference><preference><name>company.security.site.logo</name><value>true</value></preference><preference><name>admin.email.password.sent.subject</name><value>[$PORTAL_URL$]: Your New Password</value></preference><preference><name>admin.email.password.reset.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]You can reset your password for [$PORTAL_URL$] at [$PASSWORD_RESET_URL$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]The request for a new password was made from [$REMOTE_ADDRESS$] / [$REMOTE_HOST$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>admin.email.from.name</name><value>Gautam Sharma</value></preference><preference><name>company.security.send.password</name><value>true</value></preference><preference><name>default.logout.page.path</name><value>/web/guest/home</value></preference><preference><name>admin.email.verification.body</name><value>&lt;p&gt;Hi [$TO_NAME$],&lt;/p&gt;[$NEW_LINE$][$NEW_LINE$]&lt;p&gt;&lt;br /&gt;[$NEW_LINE$]Welcome! You recently created an account at [$PORTAL_URL$]. Your temporary password&amp;nbsp;&amp;nbsp;is&amp;nbsp;[$USER_PASSWORD$].&amp;nbsp;&lt;/p&gt;[$NEW_LINE$][$NEW_LINE$]&lt;p&gt;Once login you would be asked to enter email verification&amp;nbsp;code.Please use below verification&amp;nbsp;code for same.&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]&lt;strong&gt;Your verification code is:&lt;/strong&gt; &amp;nbsp;[$EMAIL_VERIFICATION_CODE$]&lt;/p&gt;[$NEW_LINE$][$NEW_LINE$]&lt;p&gt;&amp;nbsp;&lt;/p&gt;[$NEW_LINE$][$NEW_LINE$]&lt;p&gt;Thanks&lt;br /&gt;[$NEW_LINE$]WhiteHall Finance&lt;/p&gt;</value></preference><preference><name>admin.email.user.added.no.password.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Welcome! You recently created an account at [$PORTAL_URL$].&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>admin.sync.default.associations</name><value>true</value></preference><preference><name>admin.email.user.added.body</name><value>Dear [$TO_NAME$],&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Welcome! You recently created an account at [$PORTAL_URL$]. Your password is [$USER_PASSWORD$]. Enjoy!&lt;br /&gt;[$NEW_LINE$]&lt;br /&gt;[$NEW_LINE$]Sincerely,&lt;br /&gt;[$NEW_LINE$][$FROM_NAME$]&lt;br /&gt;[$NEW_LINE$][$FROM_ADDRESS$]&lt;br /&gt;[$NEW_LINE$][$PORTAL_URL$]</value></preference><preference><name>company.security.strangers</name><value>true</value></preference><preference><name>company.security.auth.type</name><value>emailAddress</value></preference></portlet-preferences>'),(10434,10159,4,'<portlet-preferences />'),(10649,10199,4,'<portlet-preferences><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.pages</name><value>closed</value></preference><preference><name>125#users-order-by-col</name><value>last-name</value></preference><preference><name>com.liferay.portal.util.SessionTreeJSClicks#layoutsTree</name><value></value></preference><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.configuration</name><value>open</value></preference><preference><name>125#entries-order-by-col</name><value>removed-date</value></preference><preference><name>128#roles-order-by-col</name><value>title</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory12</name><value>open</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory9</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#adminOpenOfficeConversionPanel</name><value>open</value></preference><preference><name>125#entries-order-by-type</name><value>asc</value></preference><preference><name>128#roles-order-by-type</name><value>asc</value></preference><preference><name>com.liferay.portal.util.SessionClicks#regularlayoutsAdminLookAndFeelSettingsPanel</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory7</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.content</name><value>open</value></preference><preference><name>com.liferay.portal.util.SessionClicks#adminImageMagickConversionPanel</name><value>open</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_details</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory8</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory11</name><value>open</value></preference><preference><name>com.liferay.portal.util.SessionClicks#liferay_toggle_controls</name><value>hidden</value></preference><preference><name>com.liferay.portal.util.SessionClicks#panel-manage-site_administration.users</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory0</name><value>closed</value></preference><preference><name>com.liferay.portal.util.SessionClicks#liferay_addpanel_tab</name><value>applications</value></preference><preference><name>125#users-order-by-type</name><value>asc</value></preference><preference><name>com.liferay.portal.util.SessionClicks#p_auth</name><value>WT7f2iPq</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_portletCategory10</name><value>open</value></preference><preference><name>com.liferay.portal.util.SessionClicks#_145_lookAndFeel</name><value>open</value></preference></portlet-preferences>'),(11859,11839,4,'<portlet-preferences />'),(12229,12201,4,'<portlet-preferences />'),(12955,12338,4,'<portlet-preferences />'),(13646,13627,4,'<portlet-preferences />'),(13820,13801,4,'<portlet-preferences />'),(15740,15721,4,'<portlet-preferences />'),(16021,16001,4,'<portlet-preferences />'),(16110,16088,4,'<portlet-preferences />'),(16419,16400,4,'<portlet-preferences />'),(17113,17001,4,'<portlet-preferences />'),(17339,17320,4,'<portlet-preferences />'),(17845,17826,4,'<portlet-preferences />'),(17873,17854,4,'<portlet-preferences />'),(17901,17882,4,'<portlet-preferences />'),(18220,18201,4,'<portlet-preferences />'),(18243,18224,4,'<portlet-preferences />'),(18320,18301,4,'<portlet-preferences />'),(18397,18378,4,'<portlet-preferences />'),(18631,18612,4,'<portlet-preferences />'),(18720,18701,4,'<portlet-preferences />'),(18923,18904,4,'<portlet-preferences />'),(19254,19235,4,'<portlet-preferences />'),(19274,19255,4,'<portlet-preferences />'),(20320,20301,4,'<portlet-preferences />'),(20420,20401,4,'<portlet-preferences />'),(20440,20421,4,'<portlet-preferences />'),(20460,20441,4,'<portlet-preferences />'),(20480,20461,4,'<portlet-preferences />'),(20525,20506,4,'<portlet-preferences />'),(20546,20527,4,'<portlet-preferences />'),(20566,20547,4,'<portlet-preferences />'),(20586,20567,4,'<portlet-preferences />');

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

insert  into `portlet`(`id_`,`companyId`,`portletId`,`roles`,`active_`) values (10206,10155,'98','',0),(10207,10155,'66','',1),(10208,10155,'180','',1),(10209,10155,'27','',1),(10210,10155,'152','',1),(10211,10155,'183','',1),(10212,10155,'134','',1),(10213,10155,'130','',1),(10214,10155,'122','',1),(10215,10155,'36','',1),(10216,10155,'26','',1),(10217,10155,'175','',1),(10218,10155,'153','',1),(10219,10155,'64','',1),(10220,10155,'129','',1),(10221,10155,'182','',1),(10222,10155,'179','',1),(10223,10155,'173','',0),(10224,10155,'100','',1),(10225,10155,'19','',1),(10226,10155,'157','',1),(10227,10155,'128','',1),(10228,10155,'181','',1),(10229,10155,'154','',1),(10230,10155,'148','',1),(10231,10155,'11','',1),(10232,10155,'29','',1),(10233,10155,'158','',1),(10234,10155,'178','',1),(10235,10155,'58','',1),(10236,10155,'71','',1),(10237,10155,'97','',1),(10238,10155,'39','',1),(10239,10155,'85','',1),(10240,10155,'118','',1),(10241,10155,'107','',1),(10242,10155,'30','',1),(10243,10155,'184','',1),(10244,10155,'147','',1),(10245,10155,'48','',1),(10246,10155,'125','',1),(10247,10155,'161','',1),(10248,10155,'146','',1),(10249,10155,'62','',0),(10250,10155,'162','',1),(10251,10155,'176','',1),(10252,10155,'108','',1),(10253,10155,'187','',1),(10254,10155,'84','',1),(10255,10155,'101','',1),(10256,10155,'121','',1),(10257,10155,'143','',1),(10258,10155,'77','',1),(10259,10155,'167','',1),(10260,10155,'115','',1),(10261,10155,'56','',1),(10262,10155,'16','',1),(10263,10155,'3','',1),(10264,10155,'23','',1),(10265,10155,'20','',1),(10266,10155,'83','',1),(10267,10155,'99','',1),(10268,10155,'186','',1),(10269,10155,'194','',1),(10270,10155,'70','',1),(10271,10155,'164','',1),(10272,10155,'141','',1),(10273,10155,'9','',1),(10274,10155,'28','',1),(10275,10155,'137','',1),(10276,10155,'47','',1),(10277,10155,'15','',1),(10278,10155,'116','',1),(10279,10155,'82','',1),(10280,10155,'151','',1),(10281,10155,'54','',1),(10282,10155,'34','',1),(10283,10155,'169','',1),(10284,10155,'132','',1),(10285,10155,'61','',1),(10286,10155,'73','',1),(10287,10155,'31','',1),(10288,10155,'50','',1),(10289,10155,'127','',1),(10290,10155,'193','',1),(10291,10155,'25','',1),(10292,10155,'166','',1),(10293,10155,'33','',1),(10294,10155,'150','',1),(10295,10155,'114','',1),(10296,10155,'149','',1),(10297,10155,'67','',1),(10298,10155,'110','',1),(10299,10155,'59','',1),(10300,10155,'135','',1),(10301,10155,'188','',1),(10302,10155,'131','',1),(10303,10155,'102','',1),(10448,10155,'1_WAR_calendarportlet','',1),(10499,10155,'1_WAR_notificationsportlet','',1),(10504,10155,'4_WAR_opensocialportlet','',1),(10505,10155,'2_WAR_opensocialportlet','',1),(10506,10155,'1_WAR_opensocialportlet','',1),(10507,10155,'3_WAR_opensocialportlet','',1),(10512,10155,'1_WAR_webformportlet','',1),(10901,10155,'springhibliferay_WAR_SpringHibMavenLiferayportlet','',1),(11109,10155,'adminportlet_WAR_adminportlet','',1),(12401,10155,'tfcompanyportlet_WAR_adminportlet','',1),(12402,10155,'tfcompanyportlet_WAR_tfadminportlet','',1),(12501,10155,'tfdashboardportlet_WAR_adminportlet','',1),(12502,10155,'tfdashboardportlet_WAR_tfdashboardportlet','',1),(12516,10155,'tfpoportlet_WAR_tfpoportlet','',1),(14201,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet','',1),(14609,10155,'scftradeportlet_WAR_scfinvoiceportlet','',1),(14610,10155,'scftradeportlet_WAR_scftradeportlet','',1),(17801,10155,'tfregistrationportlet_WAR_tfregistrationportlet','',1),(18012,10155,'scfinvestorportlet_WAR_scfinvestorportlet','',1),(19901,10155,'tfsettingsportlet_WAR_scfinvestorportlet','',1),(20007,10155,'tfsettingsportlet_WAR_tfsettingsportlet','',1);

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

insert  into `portletpreferences`(`portletPreferencesId`,`ownerId`,`ownerType`,`plid`,`portletId`,`preferences`) values (10328,0,3,10321,'148_INSTANCE_NbVnUaakHJfz','<portlet-preferences><preference><name>showAssetCount</name><value>true</value></preference><preference><name>showZeroAssetCount</name><value>false</value></preference><preference><name>classNameId</name><value>10007</value></preference><preference><name>displayStyle</name><value>cloud</value></preference><preference><name>maxAssetTags</name><value>10</value></preference></portlet-preferences>'),(10349,0,3,10343,'141_INSTANCE_v9hxxlJV86xR','<portlet-preferences><preference><name>showAssetCount</name><value>true</value></preference><preference><name>classNameId</name><value>10016</value></preference></portlet-preferences>'),(10368,0,3,10362,'3','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(10369,0,3,10362,'101_INSTANCE_TRz0qE44e3D9','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>anyAssetType</name><value>false</value></preference><preference><name>portletSetupTitle_en_US</name><value>Upcoming Events</value></preference></portlet-preferences>'),(10394,0,3,10388,'3','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(10395,0,3,10388,'82','<portlet-preferences><preference><name>displayStyle</name><value>3</value></preference></portlet-preferences>'),(10396,0,3,10388,'101_INSTANCE_0sN6skhNjCAX','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>portletSetupTitle_en_US</name><value>Recent Content</value></preference></portlet-preferences>'),(10403,0,3,10397,'20','<portlet-preferences><preference><name>portletSetupShowBorders</name><value>false</value></preference></portlet-preferences>'),(10404,0,3,10397,'101_INSTANCE_TrTnrxJatGdL','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>anyAssetType</name><value>false</value></preference><preference><name>portletSetupTitle_en_US</name><value>Upcoming Events</value></preference></portlet-preferences>'),(10411,0,3,10405,'39_INSTANCE_VDngodQYRcI1','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>expandedEntriesPerFeed</name><value>3</value></preference><preference><name>urls</name><value>http://partners.userland.com/nytRss/technology.xml</value></preference><preference><name>entriesPerFeed</name><value>4</value></preference><preference><name>portletSetupTitle_en_US</name><value>Technology news</value></preference></portlet-preferences>'),(10412,0,3,10405,'39_INSTANCE_jy7N7i1NiAme','<portlet-preferences><preference><name>portletSetupUseCustomTitle</name><value>true</value></preference><preference><name>expandedEntriesPerFeed</name><value>0</value></preference><preference><name>urls</name><value>http://www.liferay.com/en/about-us/news/-/blogs/rss</value></preference><preference><name>titles</name><value>Liferay Press Releases</value></preference><preference><name>entriesPerFeed</name><value>4</value></preference><preference><name>portletSetupTitle_en_US</name><value>Liferay news</value></preference></portlet-preferences>'),(10536,10182,2,0,'20','<portlet-preferences />'),(10624,10182,2,0,'15','<portlet-preferences />'),(10657,0,3,10176,'190','<portlet-preferences />'),(10658,0,3,10176,'145','<portlet-preferences />'),(10659,0,3,10176,'2_WAR_notificationsportlet','<portlet-preferences />'),(10660,0,3,10176,'134','<portlet-preferences />'),(10661,0,3,10176,'160','<portlet-preferences />'),(10662,0,3,10176,'156','<portlet-preferences />'),(10663,0,3,10176,'165','<portlet-preferences />'),(10672,0,3,10176,'125','<portlet-preferences />'),(10683,0,3,10176,'174','<portlet-preferences />'),(11324,11305,2,0,'20','<portlet-preferences />'),(11380,11305,2,0,'15','<portlet-preferences />'),(11405,0,3,11399,'56_INSTANCE_EKTsx5COIR1N','<portlet-preferences><preference><name>articleId</name><value>MAIN-CAROUSEL</value></preference><preference><name>portletSetupCss</name><value>{&#034;advancedData&#034;:{&#034;customCSSClassName&#034;:&#034;main-carousel&#034;}}</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>11305</value></preference></portlet-preferences>'),(11406,0,3,11399,'56_INSTANCE_T046NqIscI6e','<portlet-preferences><preference><name>articleId</name><value>DID-YOU-KNOW</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>11305</value></preference></portlet-preferences>'),(11407,0,3,11399,'56_INSTANCE_4Q79zWIcCEMg','<portlet-preferences><preference><name>articleId</name><value>CUSTOMIZE-IT</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>11305</value></preference></portlet-preferences>'),(11438,11419,2,0,'20','<portlet-preferences />'),(11494,11419,2,0,'15','<portlet-preferences />'),(11519,0,3,11513,'56_INSTANCE_OWuUtaaMxSYN','<portlet-preferences><preference><name>articleId</name><value>MAIN-CAROUSEL</value></preference><preference><name>portletSetupCss</name><value>{&#034;advancedData&#034;:{&#034;customCSSClassName&#034;:&#034;main-carousel&#034;}}</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>11419</value></preference></portlet-preferences>'),(11520,0,3,11513,'56_INSTANCE_RhBiXGJlAZfT','<portlet-preferences><preference><name>articleId</name><value>DID-YOU-KNOW</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>11419</value></preference></portlet-preferences>'),(11521,0,3,11513,'56_INSTANCE_EtWFTQCyFg0x','<portlet-preferences><preference><name>articleId</name><value>CUSTOMIZE-IT</value></preference><preference><name>portletSetupShowBorders</name><value>false</value></preference><preference><name>groupId</name><value>11419</value></preference></portlet-preferences>'),(11601,0,3,10176,'130','<portlet-preferences />'),(11711,0,3,10176,'137','<portlet-preferences />'),(12101,0,3,10176,'20','<portlet-preferences />'),(12212,0,3,10643,'145','<portlet-preferences />'),(12213,0,3,10643,'2_WAR_notificationsportlet','<portlet-preferences />'),(12214,0,3,10176,'2','<portlet-preferences />'),(12215,0,3,10176,'140','<portlet-preferences />'),(12216,0,3,10176,'158','<portlet-preferences />'),(12723,0,3,10176,'15','<portlet-preferences />'),(12937,0,3,12904,'145','<portlet-preferences />'),(12938,0,3,12904,'2_WAR_notificationsportlet','<portlet-preferences />'),(12957,0,3,12922,'145','<portlet-preferences />'),(12958,0,3,12922,'2_WAR_notificationsportlet','<portlet-preferences />'),(12959,0,3,12922,'tfdashboardportlet_WAR_tfdashboardportlet','<portlet-preferences />'),(12960,0,3,12931,'145','<portlet-preferences />'),(12961,0,3,12931,'2_WAR_notificationsportlet','<portlet-preferences />'),(12962,0,3,12931,'tfpoportlet_WAR_tfpoportlet','<portlet-preferences />'),(13007,0,3,13001,'145','<portlet-preferences />'),(13008,0,3,13001,'2_WAR_notificationsportlet','<portlet-preferences />'),(13101,0,3,10176,'86','<portlet-preferences />'),(13221,0,3,13001,'58','<portlet-preferences />'),(13310,0,3,13304,'145','<portlet-preferences />'),(13311,0,3,13304,'2_WAR_notificationsportlet','<portlet-preferences />'),(13402,0,3,12904,'tfcompanyportlet_WAR_tfadminportlet_INSTANCE_4SCNxO6HnzNS','<portlet-preferences />'),(13647,0,3,10176,'128','<portlet-preferences />'),(14208,0,3,14202,'145','<portlet-preferences />'),(14209,0,3,14202,'2_WAR_notificationsportlet','<portlet-preferences />'),(14210,0,3,14202,'scfinvoiceportlet_WAR_scfinvoiceportlet','<portlet-preferences />'),(14543,0,3,10176,'151','<portlet-preferences />'),(14607,0,3,14601,'145','<portlet-preferences />'),(14608,0,3,14601,'2_WAR_notificationsportlet','<portlet-preferences />'),(14611,0,3,14601,'scftradeportlet_WAR_scftradeportlet','<portlet-preferences />'),(14907,0,3,10176,'182','<portlet-preferences />'),(15013,0,3,10176,'149','<portlet-preferences />'),(15117,10195,2,0,'15','<portlet-preferences />'),(15118,10195,2,0,'20','<portlet-preferences />'),(15119,10664,2,0,'20','<portlet-preferences />'),(15120,10668,2,0,'20','<portlet-preferences />'),(15613,0,3,10176,'139','<portlet-preferences />'),(15901,0,3,10637,'145','<portlet-preferences />'),(15902,0,3,10637,'2_WAR_notificationsportlet','<portlet-preferences />'),(16053,0,3,10176,'4_WAR_opensocialportlet','<portlet-preferences />'),(17319,0,3,10176,'127','<portlet-preferences />'),(17802,0,3,13304,'tfregistrationportlet_WAR_tfregistrationportlet','<portlet-preferences />'),(18010,0,3,18001,'145','<portlet-preferences />'),(18011,0,3,18001,'2_WAR_notificationsportlet','<portlet-preferences />'),(18101,0,3,10176,'183','<portlet-preferences />'),(19001,0,3,10176,'3_WAR_marketplaceportlet','<portlet-preferences />'),(19002,10199,4,10176,'3_WAR_marketplaceportlet','<portlet-preferences />'),(19401,0,3,10176,'153','<portlet-preferences />'),(20008,0,3,20001,'145','<portlet-preferences />'),(20009,0,3,20001,'2_WAR_notificationsportlet','<portlet-preferences />'),(20011,0,3,20001,'tfsettingsportlet_WAR_tfsettingsportlet','<portlet-preferences />'),(20324,0,3,18001,'scfinvestorportlet_WAR_scfinvestorportlet','<portlet-preferences />');

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

insert  into `ratingsstats`(`statsId`,`classNameId`,`classPK`,`totalEntries`,`totalScore`,`averageScore`) values (10625,10109,10617,0,0,0),(11408,10109,11390,0,0,0),(11409,10109,11382,0,0,0),(11410,10109,11361,0,0,0),(11411,10011,11341,0,0,0),(11412,10011,11325,0,0,0),(11413,10011,11333,0,0,0),(11414,10011,11316,0,0,0),(11522,10109,11496,0,0,0),(11523,10109,11487,0,0,0),(11524,10109,11504,0,0,0),(11525,10011,11458,0,0,0),(11526,10011,11430,0,0,0),(11527,10011,11448,0,0,0),(11528,10011,11439,0,0,0),(16036,10012,15415,0,0,0),(16042,10012,15433,0,0,0),(16048,10012,15501,0,0,0),(16318,10012,12103,0,0,0),(16322,10012,12701,0,0,0),(16323,10012,12705,0,0,0),(16324,10012,12802,0,0,0),(16325,10012,13901,0,0,0),(16328,10012,16054,0,0,0),(17614,10012,17605,0,0,0),(17663,10012,17618,0,0,0),(17668,10012,17622,0,0,0),(17673,10012,17644,0,0,0),(17678,10012,17626,0,0,0),(17683,10012,17609,0,0,0),(17717,10011,17709,0,0,0),(17735,10011,17727,0,0,0),(18336,10011,18328,0,0,0),(18354,10011,18346,0,0,0),(18372,10011,18364,0,0,0),(18417,10011,18409,0,0,0),(19102,10012,16119,0,0,0),(19108,10012,16202,0,0,0),(19114,10012,16363,0,0,0),(19120,10012,16382,0,0,0),(19126,10012,17301,0,0,0),(19132,10012,17340,0,0,0),(19138,10012,17358,0,0,0),(19144,10012,17376,0,0,0),(19193,10011,19185,0,0,0),(19211,10011,19203,0,0,0),(19229,10011,19221,0,0,0),(19287,10011,19279,0,0,0),(19306,10011,19298,0,0,0);

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

insert  into `release_`(`releaseId`,`createDate`,`modifiedDate`,`servletContextName`,`buildNumber`,`buildDate`,`verified`,`state_`,`testString`) values (1,'2015-07-18 00:40:46','2016-01-28 04:23:07','portal',6202,'2016-01-28 04:23:07',1,0,'You take the blue pill, the story ends, you wake up in your bed and believe whatever you want to believe. You take the red pill, you stay in Wonderland, and I show you how deep the rabbit hole goes.'),(10439,'2015-07-17 19:15:42','2016-01-28 04:24:38','marketplace-portlet',100,NULL,1,0,''),(10447,'2015-07-17 19:15:49','2016-01-28 04:24:39','calendar-portlet',100,NULL,1,0,''),(10466,'2015-07-17 19:16:07','2016-01-28 04:24:45','kaleo-web',110,NULL,1,0,''),(10498,'2015-07-17 19:16:13','2016-01-28 04:24:52','notifications-portlet',110,NULL,1,0,'');

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

insert  into `repository`(`uuid_`,`repositoryId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`name`,`description`,`portletId`,`typeSettings`,`dlFolderId`) values ('d23d1936-6caa-4d8d-a1cd-4bce9db3d3a9',13225,10182,10155,10159,'','2015-08-13 21:47:34','2015-08-13 21:47:34',10527,'189','','189','',13226);

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

insert  into `resourceaction`(`resourceActionId`,`name`,`actionId`,`bitwiseValue`) values (1,'com.liferay.portlet.softwarecatalog','ADD_FRAMEWORK_VERSION',2),(2,'com.liferay.portlet.softwarecatalog','ADD_PRODUCT_ENTRY',4),(3,'com.liferay.portlet.softwarecatalog','PERMISSIONS',8),(4,'com.liferay.portal.model.Team','ASSIGN_MEMBERS',2),(5,'com.liferay.portal.model.Team','DELETE',4),(6,'com.liferay.portal.model.Team','PERMISSIONS',8),(7,'com.liferay.portal.model.Team','UPDATE',16),(8,'com.liferay.portal.model.Team','VIEW',1),(9,'com.liferay.portal.model.PasswordPolicy','ASSIGN_MEMBERS',2),(10,'com.liferay.portal.model.PasswordPolicy','DELETE',4),(11,'com.liferay.portal.model.PasswordPolicy','PERMISSIONS',8),(12,'com.liferay.portal.model.PasswordPolicy','UPDATE',16),(13,'com.liferay.portal.model.PasswordPolicy','VIEW',1),(14,'com.liferay.portlet.blogs.model.BlogsEntry','ADD_DISCUSSION',2),(15,'com.liferay.portlet.blogs.model.BlogsEntry','DELETE',4),(16,'com.liferay.portlet.blogs.model.BlogsEntry','DELETE_DISCUSSION',8),(17,'com.liferay.portlet.blogs.model.BlogsEntry','PERMISSIONS',16),(18,'com.liferay.portlet.blogs.model.BlogsEntry','UPDATE',32),(19,'com.liferay.portlet.blogs.model.BlogsEntry','UPDATE_DISCUSSION',64),(20,'com.liferay.portlet.blogs.model.BlogsEntry','VIEW',1),(21,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','DELETE',2),(22,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','PERMISSIONS',4),(23,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','UPDATE',8),(24,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate','VIEW',1),(25,'com.liferay.portlet.journal.model.JournalFeed','DELETE',2),(26,'com.liferay.portlet.journal.model.JournalFeed','PERMISSIONS',4),(27,'com.liferay.portlet.journal.model.JournalFeed','UPDATE',8),(28,'com.liferay.portlet.journal.model.JournalFeed','VIEW',1),(29,'com.liferay.portlet.wiki.model.WikiNode','ADD_ATTACHMENT',2),(30,'com.liferay.portlet.wiki.model.WikiNode','ADD_PAGE',4),(31,'com.liferay.portlet.wiki.model.WikiNode','DELETE',8),(32,'com.liferay.portlet.wiki.model.WikiNode','IMPORT',16),(33,'com.liferay.portlet.wiki.model.WikiNode','PERMISSIONS',32),(34,'com.liferay.portlet.wiki.model.WikiNode','SUBSCRIBE',64),(35,'com.liferay.portlet.wiki.model.WikiNode','UPDATE',128),(36,'com.liferay.portlet.wiki.model.WikiNode','VIEW',1),(37,'com.liferay.portlet.announcements.model.AnnouncementsEntry','DELETE',2),(38,'com.liferay.portlet.announcements.model.AnnouncementsEntry','UPDATE',4),(39,'com.liferay.portlet.announcements.model.AnnouncementsEntry','VIEW',1),(40,'com.liferay.portlet.announcements.model.AnnouncementsEntry','PERMISSIONS',8),(41,'com.liferay.portlet.bookmarks','ADD_ENTRY',2),(42,'com.liferay.portlet.bookmarks','ADD_FOLDER',4),(43,'com.liferay.portlet.bookmarks','PERMISSIONS',8),(44,'com.liferay.portlet.bookmarks','SUBSCRIBE',16),(45,'com.liferay.portlet.bookmarks','VIEW',1),(46,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','DELETE',2),(47,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','PERMISSIONS',4),(48,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','UPDATE',8),(49,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroupInstance','VIEW',1),(50,'com.liferay.portlet.asset.model.AssetVocabulary','DELETE',2),(51,'com.liferay.portlet.asset.model.AssetVocabulary','PERMISSIONS',4),(52,'com.liferay.portlet.asset.model.AssetVocabulary','UPDATE',8),(53,'com.liferay.portlet.asset.model.AssetVocabulary','VIEW',1),(54,'com.liferay.portlet.documentlibrary.model.DLFolder','ACCESS',2),(55,'com.liferay.portlet.documentlibrary.model.DLFolder','ADD_DOCUMENT',4),(56,'com.liferay.portlet.documentlibrary.model.DLFolder','ADD_SHORTCUT',8),(57,'com.liferay.portlet.documentlibrary.model.DLFolder','ADD_SUBFOLDER',16),(58,'com.liferay.portlet.documentlibrary.model.DLFolder','DELETE',32),(59,'com.liferay.portlet.documentlibrary.model.DLFolder','PERMISSIONS',64),(60,'com.liferay.portlet.documentlibrary.model.DLFolder','UPDATE',128),(61,'com.liferay.portlet.documentlibrary.model.DLFolder','VIEW',1),(62,'com.liferay.portlet.expando.model.ExpandoColumn','DELETE',2),(63,'com.liferay.portlet.expando.model.ExpandoColumn','PERMISSIONS',4),(64,'com.liferay.portlet.expando.model.ExpandoColumn','UPDATE',8),(65,'com.liferay.portlet.expando.model.ExpandoColumn','VIEW',1),(66,'com.liferay.portlet.documentlibrary','ADD_DOCUMENT',2),(67,'com.liferay.portlet.documentlibrary','ADD_DOCUMENT_TYPE',4),(68,'com.liferay.portlet.documentlibrary','ADD_FOLDER',8),(69,'com.liferay.portlet.documentlibrary','ADD_REPOSITORY',16),(70,'com.liferay.portlet.documentlibrary','ADD_STRUCTURE',32),(71,'com.liferay.portlet.documentlibrary','ADD_SHORTCUT',64),(72,'com.liferay.portlet.documentlibrary','PERMISSIONS',128),(73,'com.liferay.portlet.documentlibrary','SUBSCRIBE',256),(74,'com.liferay.portlet.documentlibrary','UPDATE',512),(75,'com.liferay.portlet.documentlibrary','VIEW',1),(76,'com.liferay.portlet.calendar.model.CalEvent','ADD_DISCUSSION',2),(77,'com.liferay.portlet.calendar.model.CalEvent','DELETE',4),(78,'com.liferay.portlet.calendar.model.CalEvent','DELETE_DISCUSSION',8),(79,'com.liferay.portlet.calendar.model.CalEvent','PERMISSIONS',16),(80,'com.liferay.portlet.calendar.model.CalEvent','UPDATE',32),(81,'com.liferay.portlet.calendar.model.CalEvent','UPDATE_DISCUSSION',64),(82,'com.liferay.portlet.calendar.model.CalEvent','VIEW',1),(83,'com.liferay.portlet.shopping.model.ShoppingCategory','ADD_ITEM',2),(84,'com.liferay.portlet.shopping.model.ShoppingCategory','ADD_SUBCATEGORY',4),(85,'com.liferay.portlet.shopping.model.ShoppingCategory','DELETE',8),(86,'com.liferay.portlet.shopping.model.ShoppingCategory','PERMISSIONS',16),(87,'com.liferay.portlet.shopping.model.ShoppingCategory','UPDATE',32),(88,'com.liferay.portlet.shopping.model.ShoppingCategory','VIEW',1),(89,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','DELETE',2),(90,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','PERMISSIONS',4),(91,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','UPDATE',8),(92,'com.liferay.portlet.documentlibrary.model.DLFileShortcut','VIEW',1),(93,'com.liferay.portlet.journal','ADD_ARTICLE',2),(94,'com.liferay.portlet.journal','ADD_FEED',4),(95,'com.liferay.portlet.journal','ADD_FOLDER',8),(96,'com.liferay.portlet.journal','ADD_STRUCTURE',16),(97,'com.liferay.portlet.journal','ADD_TEMPLATE',32),(98,'com.liferay.portlet.journal','SUBSCRIBE',64),(99,'com.liferay.portlet.journal','VIEW',1),(100,'com.liferay.portlet.journal','PERMISSIONS',128),(101,'com.liferay.portlet.calendar','ADD_EVENT',2),(102,'com.liferay.portlet.calendar','EXPORT_ALL_EVENTS',4),(103,'com.liferay.portlet.calendar','PERMISSIONS',8),(104,'com.liferay.portal.model.LayoutPrototype','DELETE',2),(105,'com.liferay.portal.model.LayoutPrototype','PERMISSIONS',4),(106,'com.liferay.portal.model.LayoutPrototype','UPDATE',8),(107,'com.liferay.portal.model.LayoutPrototype','VIEW',1),(108,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','ADD_RECORD',2),(109,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','DELETE',4),(110,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','PERMISSIONS',8),(111,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','UPDATE',16),(112,'com.liferay.portlet.dynamicdatalists.model.DDLRecordSet','VIEW',1),(113,'com.liferay.portal.model.Organization','ADD_ORGANIZATION',2),(114,'com.liferay.portal.model.Organization','ASSIGN_MEMBERS',4),(115,'com.liferay.portal.model.Organization','ASSIGN_USER_ROLES',8),(116,'com.liferay.portal.model.Organization','DELETE',16),(117,'com.liferay.portal.model.Organization','MANAGE_ANNOUNCEMENTS',32),(118,'com.liferay.portal.model.Organization','MANAGE_SUBORGANIZATIONS',64),(119,'com.liferay.portal.model.Organization','MANAGE_USERS',128),(120,'com.liferay.portal.model.Organization','PERMISSIONS',256),(121,'com.liferay.portal.model.Organization','UPDATE',512),(122,'com.liferay.portal.model.Organization','VIEW',1),(123,'com.liferay.portal.model.Organization','VIEW_MEMBERS',1024),(124,'com.liferay.portlet.softwarecatalog.model.SCLicense','DELETE',2),(125,'com.liferay.portlet.softwarecatalog.model.SCLicense','PERMISSIONS',4),(126,'com.liferay.portlet.softwarecatalog.model.SCLicense','UPDATE',8),(127,'com.liferay.portlet.softwarecatalog.model.SCLicense','VIEW',1),(128,'com.liferay.portlet.journal.model.JournalFolder','ACCESS',2),(129,'com.liferay.portlet.journal.model.JournalFolder','ADD_ARTICLE',4),(130,'com.liferay.portlet.journal.model.JournalFolder','ADD_SUBFOLDER',8),(131,'com.liferay.portlet.journal.model.JournalFolder','DELETE',16),(132,'com.liferay.portlet.journal.model.JournalFolder','PERMISSIONS',32),(133,'com.liferay.portlet.journal.model.JournalFolder','UPDATE',64),(134,'com.liferay.portlet.journal.model.JournalFolder','VIEW',1),(135,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','DELETE',2),(136,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','PERMISSIONS',4),(137,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','UPDATE',8),(138,'com.liferay.portlet.documentlibrary.model.DLFileEntryType','VIEW',1),(139,'com.liferay.portlet.journal.model.JournalTemplate','DELETE',2),(140,'com.liferay.portlet.journal.model.JournalTemplate','PERMISSIONS',4),(141,'com.liferay.portlet.journal.model.JournalTemplate','UPDATE',8),(142,'com.liferay.portlet.journal.model.JournalTemplate','VIEW',1),(143,'com.liferay.portlet.journal.model.JournalArticle','ADD_DISCUSSION',2),(144,'com.liferay.portlet.journal.model.JournalArticle','DELETE',4),(145,'com.liferay.portlet.journal.model.JournalArticle','DELETE_DISCUSSION',8),(146,'com.liferay.portlet.journal.model.JournalArticle','EXPIRE',16),(147,'com.liferay.portlet.journal.model.JournalArticle','PERMISSIONS',32),(148,'com.liferay.portlet.journal.model.JournalArticle','UPDATE',64),(149,'com.liferay.portlet.journal.model.JournalArticle','UPDATE_DISCUSSION',128),(150,'com.liferay.portlet.journal.model.JournalArticle','VIEW',1),(151,'com.liferay.portlet.dynamicdatalists','ADD_RECORD_SET',2),(152,'com.liferay.portlet.dynamicdatalists','ADD_STRUCTURE',4),(153,'com.liferay.portlet.dynamicdatalists','ADD_TEMPLATE',8),(154,'com.liferay.portlet.dynamicdatalists','PERMISSIONS',16),(155,'com.liferay.portlet.bookmarks.model.BookmarksFolder','ACCESS',2),(156,'com.liferay.portlet.bookmarks.model.BookmarksFolder','ADD_ENTRY',4),(157,'com.liferay.portlet.bookmarks.model.BookmarksFolder','ADD_SUBFOLDER',8),(158,'com.liferay.portlet.bookmarks.model.BookmarksFolder','DELETE',16),(159,'com.liferay.portlet.bookmarks.model.BookmarksFolder','PERMISSIONS',32),(160,'com.liferay.portlet.bookmarks.model.BookmarksFolder','SUBSCRIBE',64),(161,'com.liferay.portlet.bookmarks.model.BookmarksFolder','UPDATE',128),(162,'com.liferay.portlet.bookmarks.model.BookmarksFolder','VIEW',1),(163,'com.liferay.portal.model.Group','ADD_COMMUNITY',2),(164,'com.liferay.portal.model.Group','ADD_LAYOUT',4),(165,'com.liferay.portal.model.Group','ADD_LAYOUT_BRANCH',8),(166,'com.liferay.portal.model.Group','ADD_LAYOUT_SET_BRANCH',16),(167,'com.liferay.portal.model.Group','ASSIGN_MEMBERS',32),(168,'com.liferay.portal.model.Group','ASSIGN_USER_ROLES',64),(169,'com.liferay.portal.model.Group','CONFIGURE_PORTLETS',128),(170,'com.liferay.portal.model.Group','DELETE',256),(171,'com.liferay.portal.model.Group','EXPORT_IMPORT_LAYOUTS',512),(172,'com.liferay.portal.model.Group','EXPORT_IMPORT_PORTLET_INFO',1024),(173,'com.liferay.portal.model.Group','MANAGE_ANNOUNCEMENTS',2048),(174,'com.liferay.portal.model.Group','MANAGE_ARCHIVED_SETUPS',4096),(175,'com.liferay.portal.model.Group','MANAGE_LAYOUTS',8192),(176,'com.liferay.portal.model.Group','MANAGE_STAGING',16384),(177,'com.liferay.portal.model.Group','MANAGE_SUBGROUPS',32768),(178,'com.liferay.portal.model.Group','MANAGE_TEAMS',65536),(179,'com.liferay.portal.model.Group','PERMISSIONS',131072),(180,'com.liferay.portal.model.Group','PREVIEW_IN_DEVICE',262144),(181,'com.liferay.portal.model.Group','PUBLISH_STAGING',524288),(182,'com.liferay.portal.model.Group','PUBLISH_TO_REMOTE',1048576),(183,'com.liferay.portal.model.Group','UPDATE',2097152),(184,'com.liferay.portal.model.Group','VIEW',1),(185,'com.liferay.portal.model.Group','VIEW_MEMBERS',4194304),(186,'com.liferay.portal.model.Group','VIEW_SITE_ADMINISTRATION',8388608),(187,'com.liferay.portal.model.Group','VIEW_STAGING',16777216),(188,'com.liferay.portlet.journal.model.JournalStructure','DELETE',2),(189,'com.liferay.portlet.journal.model.JournalStructure','PERMISSIONS',4),(190,'com.liferay.portlet.journal.model.JournalStructure','UPDATE',8),(191,'com.liferay.portlet.journal.model.JournalStructure','VIEW',1),(192,'com.liferay.portlet.asset.model.AssetTag','DELETE',2),(193,'com.liferay.portlet.asset.model.AssetTag','PERMISSIONS',4),(194,'com.liferay.portlet.asset.model.AssetTag','UPDATE',8),(195,'com.liferay.portlet.asset.model.AssetTag','VIEW',1),(196,'com.liferay.portal.model.Layout','ADD_DISCUSSION',2),(197,'com.liferay.portal.model.Layout','ADD_LAYOUT',4),(198,'com.liferay.portal.model.Layout','CONFIGURE_PORTLETS',8),(199,'com.liferay.portal.model.Layout','CUSTOMIZE',16),(200,'com.liferay.portal.model.Layout','DELETE',32),(201,'com.liferay.portal.model.Layout','DELETE_DISCUSSION',64),(202,'com.liferay.portal.model.Layout','PERMISSIONS',128),(203,'com.liferay.portal.model.Layout','UPDATE',256),(204,'com.liferay.portal.model.Layout','UPDATE_DISCUSSION',512),(205,'com.liferay.portal.model.Layout','VIEW',1),(206,'com.liferay.portlet.asset','ADD_TAG',2),(207,'com.liferay.portlet.asset','PERMISSIONS',4),(208,'com.liferay.portlet.asset','ADD_CATEGORY',8),(209,'com.liferay.portlet.asset','ADD_VOCABULARY',16),(210,'com.liferay.portal.model.LayoutBranch','DELETE',2),(211,'com.liferay.portal.model.LayoutBranch','PERMISSIONS',4),(212,'com.liferay.portal.model.LayoutBranch','UPDATE',8),(213,'com.liferay.portal.model.LayoutSetBranch','DELETE',2),(214,'com.liferay.portal.model.LayoutSetBranch','MERGE',4),(215,'com.liferay.portal.model.LayoutSetBranch','PERMISSIONS',8),(216,'com.liferay.portal.model.LayoutSetBranch','UPDATE',16),(217,'com.liferay.portlet.messageboards','ADD_CATEGORY',2),(218,'com.liferay.portlet.messageboards','ADD_FILE',4),(219,'com.liferay.portlet.messageboards','ADD_MESSAGE',8),(220,'com.liferay.portlet.messageboards','BAN_USER',16),(221,'com.liferay.portlet.messageboards','MOVE_THREAD',32),(222,'com.liferay.portlet.messageboards','LOCK_THREAD',64),(223,'com.liferay.portlet.messageboards','PERMISSIONS',128),(224,'com.liferay.portlet.messageboards','REPLY_TO_MESSAGE',256),(225,'com.liferay.portlet.messageboards','SUBSCRIBE',512),(226,'com.liferay.portlet.messageboards','UPDATE_THREAD_PRIORITY',1024),(227,'com.liferay.portlet.messageboards','VIEW',1),(228,'com.liferay.portlet.polls','ADD_QUESTION',2),(229,'com.liferay.portlet.polls','PERMISSIONS',4),(230,'com.liferay.portlet.shopping.model.ShoppingItem','DELETE',2),(231,'com.liferay.portlet.shopping.model.ShoppingItem','PERMISSIONS',4),(232,'com.liferay.portlet.shopping.model.ShoppingItem','UPDATE',8),(233,'com.liferay.portlet.shopping.model.ShoppingItem','VIEW',1),(234,'com.liferay.portlet.bookmarks.model.BookmarksEntry','DELETE',2),(235,'com.liferay.portlet.bookmarks.model.BookmarksEntry','PERMISSIONS',4),(236,'com.liferay.portlet.bookmarks.model.BookmarksEntry','SUBSCRIBE',8),(237,'com.liferay.portlet.bookmarks.model.BookmarksEntry','UPDATE',16),(238,'com.liferay.portlet.bookmarks.model.BookmarksEntry','VIEW',1),(239,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','ADD_DISCUSSION',2),(240,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','DELETE',4),(241,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','DELETE_DISCUSSION',8),(242,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','PERMISSIONS',16),(243,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','UPDATE',32),(244,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','UPDATE_DISCUSSION',64),(245,'com.liferay.portlet.softwarecatalog.model.SCProductEntry','VIEW',1),(246,'com.liferay.portal.model.User','DELETE',2),(247,'com.liferay.portal.model.User','IMPERSONATE',4),(248,'com.liferay.portal.model.User','PERMISSIONS',8),(249,'com.liferay.portal.model.User','UPDATE',16),(250,'com.liferay.portal.model.User','VIEW',1),(251,'com.liferay.portal.model.LayoutSetPrototype','DELETE',2),(252,'com.liferay.portal.model.LayoutSetPrototype','PERMISSIONS',4),(253,'com.liferay.portal.model.LayoutSetPrototype','UPDATE',8),(254,'com.liferay.portal.model.LayoutSetPrototype','VIEW',1),(255,'com.liferay.portlet.shopping','ADD_CATEGORY',2),(256,'com.liferay.portlet.shopping','ADD_ITEM',4),(257,'com.liferay.portlet.shopping','MANAGE_COUPONS',8),(258,'com.liferay.portlet.shopping','MANAGE_ORDERS',16),(259,'com.liferay.portlet.shopping','PERMISSIONS',32),(260,'com.liferay.portlet.shopping','VIEW',1),(261,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion','DELETE',2),(262,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion','PERMISSIONS',4),(263,'com.liferay.portlet.softwarecatalog.model.SCFrameworkVersion','UPDATE',8),(264,'com.liferay.portlet.wiki','ADD_NODE',2),(265,'com.liferay.portlet.wiki','PERMISSIONS',4),(266,'com.liferay.portlet.polls.model.PollsQuestion','ADD_VOTE',2),(267,'com.liferay.portlet.polls.model.PollsQuestion','DELETE',4),(268,'com.liferay.portlet.polls.model.PollsQuestion','PERMISSIONS',8),(269,'com.liferay.portlet.polls.model.PollsQuestion','UPDATE',16),(270,'com.liferay.portlet.polls.model.PollsQuestion','VIEW',1),(271,'com.liferay.portlet.shopping.model.ShoppingOrder','DELETE',2),(272,'com.liferay.portlet.shopping.model.ShoppingOrder','PERMISSIONS',4),(273,'com.liferay.portlet.shopping.model.ShoppingOrder','UPDATE',8),(274,'com.liferay.portlet.shopping.model.ShoppingOrder','VIEW',1),(275,'com.liferay.portal.model.UserGroup','ASSIGN_MEMBERS',2),(276,'com.liferay.portal.model.UserGroup','DELETE',4),(277,'com.liferay.portal.model.UserGroup','MANAGE_ANNOUNCEMENTS',8),(278,'com.liferay.portal.model.UserGroup','PERMISSIONS',16),(279,'com.liferay.portal.model.UserGroup','UPDATE',32),(280,'com.liferay.portal.model.UserGroup','VIEW',1),(281,'com.liferay.portal.model.UserGroup','VIEW_MEMBERS',64),(282,'com.liferay.portal.model.Role','ASSIGN_MEMBERS',2),(283,'com.liferay.portal.model.Role','DEFINE_PERMISSIONS',4),(284,'com.liferay.portal.model.Role','DELETE',8),(285,'com.liferay.portal.model.Role','MANAGE_ANNOUNCEMENTS',16),(286,'com.liferay.portal.model.Role','PERMISSIONS',32),(287,'com.liferay.portal.model.Role','UPDATE',64),(288,'com.liferay.portal.model.Role','VIEW',1),(289,'com.liferay.portlet.messageboards.model.MBCategory','ADD_FILE',2),(290,'com.liferay.portlet.messageboards.model.MBCategory','ADD_MESSAGE',4),(291,'com.liferay.portlet.messageboards.model.MBCategory','ADD_SUBCATEGORY',8),(292,'com.liferay.portlet.messageboards.model.MBCategory','DELETE',16),(293,'com.liferay.portlet.messageboards.model.MBCategory','LOCK_THREAD',32),(294,'com.liferay.portlet.messageboards.model.MBCategory','MOVE_THREAD',64),(295,'com.liferay.portlet.messageboards.model.MBCategory','PERMISSIONS',128),(296,'com.liferay.portlet.messageboards.model.MBCategory','REPLY_TO_MESSAGE',256),(297,'com.liferay.portlet.messageboards.model.MBCategory','SUBSCRIBE',512),(298,'com.liferay.portlet.messageboards.model.MBCategory','UPDATE',1024),(299,'com.liferay.portlet.messageboards.model.MBCategory','UPDATE_THREAD_PRIORITY',2048),(300,'com.liferay.portlet.messageboards.model.MBCategory','VIEW',1),(301,'com.liferay.portlet.mobiledevicerules','ADD_RULE_GROUP',2),(302,'com.liferay.portlet.mobiledevicerules','ADD_RULE_GROUP_INSTANCE',4),(303,'com.liferay.portlet.mobiledevicerules','CONFIGURATION',8),(304,'com.liferay.portlet.mobiledevicerules','VIEW',1),(305,'com.liferay.portlet.mobiledevicerules','PERMISSIONS',16),(306,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','DELETE',2),(307,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','PERMISSIONS',4),(308,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','UPDATE',8),(309,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure','VIEW',1),(310,'com.liferay.portlet.wiki.model.WikiPage','ADD_DISCUSSION',2),(311,'com.liferay.portlet.wiki.model.WikiPage','DELETE',4),(312,'com.liferay.portlet.wiki.model.WikiPage','DELETE_DISCUSSION',8),(313,'com.liferay.portlet.wiki.model.WikiPage','PERMISSIONS',16),(314,'com.liferay.portlet.wiki.model.WikiPage','SUBSCRIBE',32),(315,'com.liferay.portlet.wiki.model.WikiPage','UPDATE',64),(316,'com.liferay.portlet.wiki.model.WikiPage','UPDATE_DISCUSSION',128),(317,'com.liferay.portlet.wiki.model.WikiPage','VIEW',1),(318,'com.liferay.portlet.asset.model.AssetCategory','ADD_CATEGORY',2),(319,'com.liferay.portlet.asset.model.AssetCategory','DELETE',4),(320,'com.liferay.portlet.asset.model.AssetCategory','PERMISSIONS',8),(321,'com.liferay.portlet.asset.model.AssetCategory','UPDATE',16),(322,'com.liferay.portlet.asset.model.AssetCategory','VIEW',1),(323,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','DELETE',2),(324,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','PERMISSIONS',4),(325,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','UPDATE',8),(326,'com.liferay.portlet.mobiledevicerules.model.MDRRuleGroup','VIEW',1),(327,'com.liferay.portlet.messageboards.model.MBMessage','DELETE',2),(328,'com.liferay.portlet.messageboards.model.MBMessage','PERMISSIONS',4),(329,'com.liferay.portlet.messageboards.model.MBMessage','SUBSCRIBE',8),(330,'com.liferay.portlet.messageboards.model.MBMessage','UPDATE',16),(331,'com.liferay.portlet.messageboards.model.MBMessage','VIEW',1),(332,'com.liferay.portlet.messageboards.model.MBThread','SUBSCRIBE',2),(333,'com.liferay.portlet.messageboards.model.MBThread','VIEW',1),(334,'com.liferay.portlet.messageboards.model.MBThread','PERMISSIONS',4),(335,'com.liferay.portlet.blogs','ADD_ENTRY',2),(336,'com.liferay.portlet.blogs','PERMISSIONS',4),(337,'com.liferay.portlet.blogs','SUBSCRIBE',8),(338,'com.liferay.portlet.documentlibrary.model.DLFileEntry','ADD_DISCUSSION',2),(339,'com.liferay.portlet.documentlibrary.model.DLFileEntry','DELETE',4),(340,'com.liferay.portlet.documentlibrary.model.DLFileEntry','DELETE_DISCUSSION',8),(341,'com.liferay.portlet.documentlibrary.model.DLFileEntry','OVERRIDE_CHECKOUT',16),(342,'com.liferay.portlet.documentlibrary.model.DLFileEntry','PERMISSIONS',32),(343,'com.liferay.portlet.documentlibrary.model.DLFileEntry','UPDATE',64),(344,'com.liferay.portlet.documentlibrary.model.DLFileEntry','UPDATE_DISCUSSION',128),(345,'com.liferay.portlet.documentlibrary.model.DLFileEntry','VIEW',1),(346,'134','ACCESS_IN_CONTROL_PANEL',2),(347,'134','CONFIGURATION',4),(348,'134','VIEW',1),(349,'134','PERMISSIONS',8),(350,'59','ADD_TO_PAGE',2),(351,'59','CONFIGURATION',4),(352,'59','PERMISSIONS',8),(353,'59','VIEW',1),(354,'139','ACCESS_IN_CONTROL_PANEL',2),(355,'139','ADD_EXPANDO',4),(356,'139','CONFIGURATION',8),(357,'139','VIEW',1),(358,'139','PERMISSIONS',16),(359,'19','ADD_TO_PAGE',2),(360,'19','CONFIGURATION',4),(361,'19','VIEW',1),(362,'19','PERMISSIONS',8),(363,'110','ADD_TO_PAGE',2),(364,'110','CONFIGURATION',4),(365,'110','PERMISSIONS',8),(366,'110','VIEW',1),(367,'36','ADD_PORTLET_DISPLAY_TEMPLATE',2),(368,'36','ADD_TO_PAGE',4),(369,'36','CONFIGURATION',8),(370,'36','VIEW',1),(371,'36','PERMISSIONS',16),(372,'178','CONFIGURATION',2),(373,'178','VIEW',1),(374,'178','ADD_TO_PAGE',4),(375,'178','PERMISSIONS',8),(376,'15','ACCESS_IN_CONTROL_PANEL',2),(377,'15','ADD_TO_PAGE',4),(378,'15','CONFIGURATION',8),(379,'15','VIEW',1),(380,'15','PERMISSIONS',16),(381,'33','ADD_PORTLET_DISPLAY_TEMPLATE',2),(382,'33','ADD_TO_PAGE',4),(383,'33','CONFIGURATION',8),(384,'33','VIEW',1),(385,'33','PERMISSIONS',16),(386,'34','ADD_TO_PAGE',2),(387,'34','CONFIGURATION',4),(388,'34','VIEW',1),(389,'34','PERMISSIONS',8),(390,'156','ADD_TO_PAGE',2),(391,'156','CONFIGURATION',4),(392,'156','PERMISSIONS',8),(393,'156','VIEW',1),(394,'154','ACCESS_IN_CONTROL_PANEL',2),(395,'154','CONFIGURATION',4),(396,'154','VIEW',1),(397,'154','PERMISSIONS',8),(398,'20','ACCESS_IN_CONTROL_PANEL',2),(399,'20','ADD_PORTLET_DISPLAY_TEMPLATE',4),(400,'20','ADD_TO_PAGE',8),(401,'20','CONFIGURATION',16),(402,'20','VIEW',1),(403,'20','PERMISSIONS',32),(404,'174','ADD_TO_PAGE',2),(405,'174','CONFIGURATION',4),(406,'174','PERMISSIONS',8),(407,'174','VIEW',1),(408,'83','ADD_ENTRY',2),(409,'83','ADD_TO_PAGE',4),(410,'83','CONFIGURATION',8),(411,'83','VIEW',1),(412,'83','PERMISSIONS',16),(413,'99','ACCESS_IN_CONTROL_PANEL',2),(414,'99','CONFIGURATION',4),(415,'99','VIEW',1),(416,'99','PERMISSIONS',8),(417,'84','ADD_ENTRY',2),(418,'84','ADD_TO_PAGE',4),(419,'84','CONFIGURATION',8),(420,'84','VIEW',1),(421,'84','PERMISSIONS',16),(422,'98','ACCESS_IN_CONTROL_PANEL',2),(423,'98','ADD_TO_PAGE',4),(424,'98','CONFIGURATION',8),(425,'98','VIEW',1),(426,'98','PERMISSIONS',16),(427,'125','ACCESS_IN_CONTROL_PANEL',2),(428,'125','CONFIGURATION',4),(429,'125','EXPORT_USER',8),(430,'125','VIEW',1),(431,'125','PERMISSIONS',16),(432,'127','ADD_TO_PAGE',2),(433,'127','CONFIGURATION',4),(434,'127','PERMISSIONS',8),(435,'127','VIEW',1),(436,'128','ACCESS_IN_CONTROL_PANEL',2),(437,'128','CONFIGURATION',4),(438,'128','VIEW',1),(439,'128','PERMISSIONS',8),(440,'146','ACCESS_IN_CONTROL_PANEL',2),(441,'146','CONFIGURATION',4),(442,'146','VIEW',1),(443,'146','PERMISSIONS',8),(444,'147','ACCESS_IN_CONTROL_PANEL',2),(445,'147','CONFIGURATION',4),(446,'147','VIEW',1),(447,'147','PERMISSIONS',8),(448,'149','ACCESS_IN_CONTROL_PANEL',2),(449,'149','CONFIGURATION',4),(450,'149','VIEW',1),(451,'149','PERMISSIONS',8),(452,'169','ADD_TO_PAGE',2),(453,'169','CONFIGURATION',4),(454,'169','PERMISSIONS',8),(455,'169','VIEW',1),(456,'25','ACCESS_IN_CONTROL_PANEL',2),(457,'25','CONFIGURATION',4),(458,'25','VIEW',1),(459,'25','PERMISSIONS',8),(460,'129','ACCESS_IN_CONTROL_PANEL',2),(461,'129','CONFIGURATION',4),(462,'129','VIEW',1),(463,'129','PERMISSIONS',8),(464,'166','ACCESS_IN_CONTROL_PANEL',2),(465,'166','ADD_TO_PAGE',4),(466,'166','CONFIGURATION',8),(467,'166','VIEW',1),(468,'166','PERMISSIONS',16),(469,'165','ADD_TO_PAGE',2),(470,'165','CONFIGURATION',4),(471,'165','PERMISSIONS',8),(472,'165','VIEW',1),(473,'28','ACCESS_IN_CONTROL_PANEL',2),(474,'28','ADD_TO_PAGE',4),(475,'28','CONFIGURATION',8),(476,'28','VIEW',1),(477,'28','PERMISSIONS',16),(478,'167','ACCESS_IN_CONTROL_PANEL',2),(479,'167','ADD_TO_PAGE',4),(480,'167','CONFIGURATION',8),(481,'167','VIEW',1),(482,'167','PERMISSIONS',16),(483,'161','ACCESS_IN_CONTROL_PANEL',2),(484,'161','CONFIGURATION',4),(485,'161','VIEW',1),(486,'161','PERMISSIONS',8),(487,'162','ACCESS_IN_CONTROL_PANEL',2),(488,'162','CONFIGURATION',4),(489,'162','VIEW',1),(490,'162','PERMISSIONS',8),(491,'31','ADD_TO_PAGE',2),(492,'31','CONFIGURATION',4),(493,'31','PERMISSIONS',8),(494,'31','VIEW',1),(495,'8','ACCESS_IN_CONTROL_PANEL',2),(496,'8','ADD_TO_PAGE',4),(497,'8','CONFIGURATION',8),(498,'8','VIEW',1),(499,'8','PERMISSIONS',16),(500,'66','VIEW',1),(501,'66','ADD_TO_PAGE',2),(502,'66','ACCESS_IN_CONTROL_PANEL',4),(503,'66','CONFIGURATION',8),(504,'66','PERMISSIONS',16),(505,'156','ACCESS_IN_CONTROL_PANEL',16),(506,'180','VIEW',1),(507,'180','ADD_TO_PAGE',2),(508,'180','ACCESS_IN_CONTROL_PANEL',4),(509,'180','CONFIGURATION',8),(510,'180','PERMISSIONS',16),(511,'183','VIEW',1),(512,'183','ADD_TO_PAGE',2),(513,'183','ACCESS_IN_CONTROL_PANEL',4),(514,'183','CONFIGURATION',8),(515,'183','PERMISSIONS',16),(516,'152','ACCESS_IN_CONTROL_PANEL',2),(517,'152','CONFIGURATION',4),(518,'152','VIEW',1),(519,'152','PERMISSIONS',8),(520,'27','VIEW',1),(521,'27','ADD_TO_PAGE',2),(522,'27','ACCESS_IN_CONTROL_PANEL',4),(523,'27','CONFIGURATION',8),(524,'27','PERMISSIONS',16),(525,'88','VIEW',1),(526,'88','ADD_TO_PAGE',2),(527,'88','ACCESS_IN_CONTROL_PANEL',4),(528,'88','CONFIGURATION',8),(529,'88','PERMISSIONS',16),(530,'130','ACCESS_IN_CONTROL_PANEL',2),(531,'130','CONFIGURATION',4),(532,'130','VIEW',1),(533,'130','PERMISSIONS',8),(534,'122','ADD_PORTLET_DISPLAY_TEMPLATE',2),(535,'122','CONFIGURATION',4),(536,'122','VIEW',1),(537,'122','ADD_TO_PAGE',8),(538,'122','PERMISSIONS',16),(539,'122','ACCESS_IN_CONTROL_PANEL',32),(540,'36','ACCESS_IN_CONTROL_PANEL',32),(541,'26','VIEW',1),(542,'26','ADD_TO_PAGE',2),(543,'26','ACCESS_IN_CONTROL_PANEL',4),(544,'26','CONFIGURATION',8),(545,'26','PERMISSIONS',16),(546,'190','VIEW',1),(547,'190','ADD_TO_PAGE',2),(548,'190','ACCESS_IN_CONTROL_PANEL',4),(549,'190','CONFIGURATION',8),(550,'190','PERMISSIONS',16),(551,'175','VIEW',1),(552,'175','ADD_TO_PAGE',2),(553,'175','ACCESS_IN_CONTROL_PANEL',4),(554,'175','CONFIGURATION',8),(555,'175','PERMISSIONS',16),(556,'64','VIEW',1),(557,'64','ADD_TO_PAGE',2),(558,'64','ACCESS_IN_CONTROL_PANEL',4),(559,'64','CONFIGURATION',8),(560,'64','PERMISSIONS',16),(561,'153','ACCESS_IN_CONTROL_PANEL',2),(562,'153','ADD_TO_PAGE',4),(563,'153','CONFIGURATION',8),(564,'153','VIEW',1),(565,'153','PERMISSIONS',16),(566,'182','VIEW',1),(567,'182','ADD_TO_PAGE',2),(568,'182','ACCESS_IN_CONTROL_PANEL',4),(569,'182','CONFIGURATION',8),(570,'182','PERMISSIONS',16),(571,'179','ACCESS_IN_CONTROL_PANEL',2),(572,'179','CONFIGURATION',4),(573,'179','VIEW',1),(574,'179','PERMISSIONS',8),(575,'173','VIEW',1),(576,'173','ADD_TO_PAGE',2),(577,'173','ACCESS_IN_CONTROL_PANEL',4),(578,'173','CONFIGURATION',8),(579,'173','PERMISSIONS',16),(580,'100','VIEW',1),(581,'100','ADD_TO_PAGE',2),(582,'100','ACCESS_IN_CONTROL_PANEL',4),(583,'100','CONFIGURATION',8),(584,'100','PERMISSIONS',16),(585,'157','ACCESS_IN_CONTROL_PANEL',2),(586,'157','CONFIGURATION',4),(587,'157','VIEW',1),(588,'157','PERMISSIONS',8),(589,'19','ACCESS_IN_CONTROL_PANEL',16),(590,'160','VIEW',1),(591,'160','ADD_TO_PAGE',2),(592,'160','ACCESS_IN_CONTROL_PANEL',4),(593,'160','CONFIGURATION',8),(594,'160','PERMISSIONS',16),(595,'181','VIEW',1),(596,'181','ADD_TO_PAGE',2),(597,'181','ACCESS_IN_CONTROL_PANEL',4),(598,'181','CONFIGURATION',8),(599,'181','PERMISSIONS',16),(600,'86','VIEW',1),(601,'86','ADD_TO_PAGE',2),(602,'86','ACCESS_IN_CONTROL_PANEL',4),(603,'86','CONFIGURATION',8),(604,'86','PERMISSIONS',16),(605,'148','VIEW',1),(606,'148','ADD_TO_PAGE',2),(607,'148','ACCESS_IN_CONTROL_PANEL',4),(608,'148','CONFIGURATION',8),(609,'148','PERMISSIONS',16),(610,'11','ADD_TO_PAGE',2),(611,'11','CONFIGURATION',4),(612,'11','VIEW',1),(613,'11','PERMISSIONS',8),(614,'11','ACCESS_IN_CONTROL_PANEL',16),(615,'29','ADD_TO_PAGE',2),(616,'29','CONFIGURATION',4),(617,'29','VIEW',1),(618,'29','PERMISSIONS',8),(619,'29','ACCESS_IN_CONTROL_PANEL',16),(620,'174','ACCESS_IN_CONTROL_PANEL',16),(621,'158','ACCESS_IN_CONTROL_PANEL',2),(622,'158','ADD_TO_PAGE',4),(623,'158','CONFIGURATION',8),(624,'158','VIEW',1),(625,'158','PERMISSIONS',16),(626,'178','ACCESS_IN_CONTROL_PANEL',16),(627,'124','VIEW',1),(628,'124','ADD_TO_PAGE',2),(629,'124','ACCESS_IN_CONTROL_PANEL',4),(630,'124','CONFIGURATION',8),(631,'124','PERMISSIONS',16),(632,'58','ADD_TO_PAGE',2),(633,'58','CONFIGURATION',4),(634,'58','VIEW',1),(635,'58','PERMISSIONS',8),(636,'58','ACCESS_IN_CONTROL_PANEL',16),(637,'97','VIEW',1),(638,'97','ADD_TO_PAGE',2),(639,'97','ACCESS_IN_CONTROL_PANEL',4),(640,'97','CONFIGURATION',8),(641,'97','PERMISSIONS',16),(642,'71','ADD_TO_PAGE',2),(643,'71','CONFIGURATION',4),(644,'71','VIEW',1),(645,'71','PERMISSIONS',8),(646,'71','ACCESS_IN_CONTROL_PANEL',16),(647,'39','VIEW',1),(648,'39','ADD_TO_PAGE',2),(649,'39','ACCESS_IN_CONTROL_PANEL',4),(650,'39','CONFIGURATION',8),(651,'39','PERMISSIONS',16),(652,'185','VIEW',1),(653,'185','ADD_TO_PAGE',2),(654,'185','ACCESS_IN_CONTROL_PANEL',4),(655,'185','CONFIGURATION',8),(656,'185','PERMISSIONS',16),(657,'170','VIEW',1),(658,'170','ADD_TO_PAGE',2),(659,'170','ACCESS_IN_CONTROL_PANEL',4),(660,'170','CONFIGURATION',8),(661,'170','PERMISSIONS',16),(662,'85','ADD_TO_PAGE',2),(663,'85','CONFIGURATION',4),(664,'85','VIEW',1),(665,'85','PERMISSIONS',8),(666,'85','ADD_PORTLET_DISPLAY_TEMPLATE',16),(667,'85','ACCESS_IN_CONTROL_PANEL',32),(668,'118','VIEW',1),(669,'118','ADD_TO_PAGE',2),(670,'118','ACCESS_IN_CONTROL_PANEL',4),(671,'118','CONFIGURATION',8),(672,'118','PERMISSIONS',16),(673,'107','VIEW',1),(674,'107','ADD_TO_PAGE',2),(675,'107','ACCESS_IN_CONTROL_PANEL',4),(676,'107','CONFIGURATION',8),(677,'107','PERMISSIONS',16),(678,'30','VIEW',1),(679,'30','ADD_TO_PAGE',2),(680,'30','ACCESS_IN_CONTROL_PANEL',4),(681,'30','CONFIGURATION',8),(682,'30','PERMISSIONS',16),(683,'184','ADD_TO_PAGE',2),(684,'184','CONFIGURATION',4),(685,'184','VIEW',1),(686,'184','PERMISSIONS',8),(687,'184','ACCESS_IN_CONTROL_PANEL',16),(688,'48','VIEW',1),(689,'48','ADD_TO_PAGE',2),(690,'48','ACCESS_IN_CONTROL_PANEL',4),(691,'48','CONFIGURATION',8),(692,'48','PERMISSIONS',16),(693,'62','VIEW',1),(694,'62','ADD_TO_PAGE',2),(695,'62','ACCESS_IN_CONTROL_PANEL',4),(696,'62','CONFIGURATION',8),(697,'62','PERMISSIONS',16),(698,'176','VIEW',1),(699,'176','ADD_TO_PAGE',2),(700,'176','ACCESS_IN_CONTROL_PANEL',4),(701,'176','CONFIGURATION',8),(702,'176','PERMISSIONS',16),(703,'172','VIEW',1),(704,'172','ADD_TO_PAGE',2),(705,'172','ACCESS_IN_CONTROL_PANEL',4),(706,'172','CONFIGURATION',8),(707,'172','PERMISSIONS',16),(708,'187','ADD_TO_PAGE',2),(709,'187','CONFIGURATION',4),(710,'187','VIEW',1),(711,'187','PERMISSIONS',8),(712,'187','ACCESS_IN_CONTROL_PANEL',16),(713,'108','VIEW',1),(714,'108','ADD_TO_PAGE',2),(715,'108','ACCESS_IN_CONTROL_PANEL',4),(716,'108','CONFIGURATION',8),(717,'108','PERMISSIONS',16),(718,'84','ACCESS_IN_CONTROL_PANEL',32),(719,'101','ADD_PORTLET_DISPLAY_TEMPLATE',2),(720,'101','ADD_TO_PAGE',4),(721,'101','CONFIGURATION',8),(722,'101','SUBSCRIBE',16),(723,'101','VIEW',1),(724,'101','PERMISSIONS',32),(725,'101','ACCESS_IN_CONTROL_PANEL',64),(726,'121','VIEW',1),(727,'121','ADD_TO_PAGE',2),(728,'121','ACCESS_IN_CONTROL_PANEL',4),(729,'121','CONFIGURATION',8),(730,'121','PERMISSIONS',16),(731,'49','VIEW',1),(732,'49','ADD_TO_PAGE',2),(733,'49','ACCESS_IN_CONTROL_PANEL',4),(734,'49','CONFIGURATION',8),(735,'49','PERMISSIONS',16),(736,'143','VIEW',1),(737,'143','ADD_TO_PAGE',2),(738,'143','ACCESS_IN_CONTROL_PANEL',4),(739,'143','CONFIGURATION',8),(740,'143','PERMISSIONS',16),(741,'77','VIEW',1),(742,'77','ADD_TO_PAGE',2),(743,'77','ACCESS_IN_CONTROL_PANEL',4),(744,'77','CONFIGURATION',8),(745,'77','PERMISSIONS',16),(746,'115','VIEW',1),(747,'115','ADD_TO_PAGE',2),(748,'115','ACCESS_IN_CONTROL_PANEL',4),(749,'115','CONFIGURATION',8),(750,'115','PERMISSIONS',16),(751,'56','ADD_TO_PAGE',2),(752,'56','CONFIGURATION',4),(753,'56','VIEW',1),(754,'56','PERMISSIONS',8),(755,'56','ACCESS_IN_CONTROL_PANEL',16),(756,'142','VIEW',1),(757,'142','ADD_TO_PAGE',2),(758,'142','ACCESS_IN_CONTROL_PANEL',4),(759,'142','CONFIGURATION',8),(760,'142','PERMISSIONS',16),(761,'16','PREFERENCES',2),(762,'16','GUEST_PREFERENCES',4),(763,'16','VIEW',1),(764,'16','ADD_TO_PAGE',8),(765,'16','ACCESS_IN_CONTROL_PANEL',16),(766,'16','CONFIGURATION',32),(767,'16','PERMISSIONS',64),(768,'3','VIEW',1),(769,'3','ADD_TO_PAGE',2),(770,'3','ACCESS_IN_CONTROL_PANEL',4),(771,'3','CONFIGURATION',8),(772,'3','PERMISSIONS',16),(773,'23','VIEW',1),(774,'23','ADD_TO_PAGE',2),(775,'23','ACCESS_IN_CONTROL_PANEL',4),(776,'23','CONFIGURATION',8),(777,'23','PERMISSIONS',16),(778,'145','VIEW',1),(779,'145','ADD_TO_PAGE',2),(780,'145','ACCESS_IN_CONTROL_PANEL',4),(781,'145','CONFIGURATION',8),(782,'145','PERMISSIONS',16),(783,'83','ACCESS_IN_CONTROL_PANEL',32),(784,'194','VIEW',1),(785,'194','ADD_TO_PAGE',2),(786,'194','ACCESS_IN_CONTROL_PANEL',4),(787,'194','CONFIGURATION',8),(788,'194','PERMISSIONS',16),(789,'186','ADD_TO_PAGE',2),(790,'186','CONFIGURATION',4),(791,'186','VIEW',1),(792,'186','PERMISSIONS',8),(793,'186','ACCESS_IN_CONTROL_PANEL',16),(794,'70','VIEW',1),(795,'70','ADD_TO_PAGE',2),(796,'70','ACCESS_IN_CONTROL_PANEL',4),(797,'70','CONFIGURATION',8),(798,'70','PERMISSIONS',16),(799,'164','VIEW',1),(800,'164','ADD_TO_PAGE',2),(801,'164','ACCESS_IN_CONTROL_PANEL',4),(802,'164','CONFIGURATION',8),(803,'164','PERMISSIONS',16),(804,'141','ADD_PORTLET_DISPLAY_TEMPLATE',2),(805,'141','CONFIGURATION',4),(806,'141','VIEW',1),(807,'141','ADD_TO_PAGE',8),(808,'141','PERMISSIONS',16),(809,'141','ACCESS_IN_CONTROL_PANEL',32),(810,'9','VIEW',1),(811,'9','ADD_TO_PAGE',2),(812,'9','ACCESS_IN_CONTROL_PANEL',4),(813,'9','CONFIGURATION',8),(814,'9','PERMISSIONS',16),(815,'137','ACCESS_IN_CONTROL_PANEL',2),(816,'137','CONFIGURATION',4),(817,'137','VIEW',1),(818,'137','PERMISSIONS',8),(819,'133','VIEW',1),(820,'133','ADD_TO_PAGE',2),(821,'133','ACCESS_IN_CONTROL_PANEL',4),(822,'133','CONFIGURATION',8),(823,'133','PERMISSIONS',16),(824,'116','VIEW',1),(825,'116','ADD_TO_PAGE',2),(826,'116','ACCESS_IN_CONTROL_PANEL',4),(827,'116','CONFIGURATION',8),(828,'116','PERMISSIONS',16),(829,'47','VIEW',1),(830,'47','ADD_TO_PAGE',2),(831,'47','ACCESS_IN_CONTROL_PANEL',4),(832,'47','CONFIGURATION',8),(833,'47','PERMISSIONS',16),(834,'82','VIEW',1),(835,'82','ADD_TO_PAGE',2),(836,'82','ACCESS_IN_CONTROL_PANEL',4),(837,'82','CONFIGURATION',8),(838,'82','PERMISSIONS',16),(839,'103','VIEW',1),(840,'103','ADD_TO_PAGE',2),(841,'103','ACCESS_IN_CONTROL_PANEL',4),(842,'103','CONFIGURATION',8),(843,'103','PERMISSIONS',16),(844,'151','ACCESS_IN_CONTROL_PANEL',2),(845,'151','CONFIGURATION',4),(846,'151','VIEW',1),(847,'151','PERMISSIONS',8),(848,'140','ACCESS_IN_CONTROL_PANEL',2),(849,'140','CONFIGURATION',4),(850,'140','VIEW',1),(851,'140','PERMISSIONS',8),(852,'54','VIEW',1),(853,'54','ADD_TO_PAGE',2),(854,'54','ACCESS_IN_CONTROL_PANEL',4),(855,'54','CONFIGURATION',8),(856,'54','PERMISSIONS',16),(857,'169','ACCESS_IN_CONTROL_PANEL',16),(858,'132','ACCESS_IN_CONTROL_PANEL',2),(859,'132','CONFIGURATION',4),(860,'132','VIEW',1),(861,'132','PERMISSIONS',8),(862,'34','ACCESS_IN_CONTROL_PANEL',16),(863,'61','VIEW',1),(864,'61','ADD_TO_PAGE',2),(865,'61','ACCESS_IN_CONTROL_PANEL',4),(866,'61','CONFIGURATION',8),(867,'61','PERMISSIONS',16),(868,'73','ADD_TO_PAGE',2),(869,'73','CONFIGURATION',4),(870,'73','VIEW',1),(871,'73','PERMISSIONS',8),(872,'73','ACCESS_IN_CONTROL_PANEL',16),(873,'31','ACCESS_IN_CONTROL_PANEL',16),(874,'165','ACCESS_IN_CONTROL_PANEL',16),(875,'193','VIEW',1),(876,'193','ADD_TO_PAGE',2),(877,'193','ACCESS_IN_CONTROL_PANEL',4),(878,'193','CONFIGURATION',8),(879,'193','PERMISSIONS',16),(880,'127','ACCESS_IN_CONTROL_PANEL',16),(881,'50','VIEW',1),(882,'50','ADD_TO_PAGE',2),(883,'50','ACCESS_IN_CONTROL_PANEL',4),(884,'50','CONFIGURATION',8),(885,'50','PERMISSIONS',16),(886,'192','VIEW',1),(887,'192','ADD_TO_PAGE',2),(888,'192','ACCESS_IN_CONTROL_PANEL',4),(889,'192','CONFIGURATION',8),(890,'192','PERMISSIONS',16),(891,'90','ADD_COMMUNITY',2),(892,'90','ADD_GENERAL_ANNOUNCEMENTS',4),(893,'90','ADD_LAYOUT_PROTOTYPE',8),(894,'90','ADD_LAYOUT_SET_PROTOTYPE',16),(895,'90','ADD_LICENSE',32),(896,'90','ADD_ORGANIZATION',64),(897,'90','ADD_PASSWORD_POLICY',128),(898,'90','ADD_ROLE',256),(899,'90','ADD_USER',512),(900,'90','ADD_USER_GROUP',1024),(901,'90','CONFIGURATION',2048),(902,'90','EXPORT_USER',4096),(903,'90','IMPERSONATE',8192),(904,'90','UNLINK_LAYOUT_SET_PROTOTYPE',16384),(905,'90','VIEW_CONTROL_PANEL',32768),(906,'90','ADD_TO_PAGE',65536),(907,'90','ACCESS_IN_CONTROL_PANEL',131072),(908,'90','PERMISSIONS',262144),(909,'90','VIEW',1),(910,'150','ACCESS_IN_CONTROL_PANEL',2),(911,'150','CONFIGURATION',4),(912,'150','VIEW',1),(913,'150','PERMISSIONS',8),(914,'113','VIEW',1),(915,'113','ADD_TO_PAGE',2),(916,'113','ACCESS_IN_CONTROL_PANEL',4),(917,'113','CONFIGURATION',8),(918,'113','PERMISSIONS',16),(919,'33','ACCESS_IN_CONTROL_PANEL',32),(920,'2','ACCESS_IN_CONTROL_PANEL',2),(921,'2','CONFIGURATION',4),(922,'2','VIEW',1),(923,'2','PERMISSIONS',8),(924,'191','VIEW',1),(925,'191','ADD_TO_PAGE',2),(926,'191','ACCESS_IN_CONTROL_PANEL',4),(927,'191','CONFIGURATION',8),(928,'191','PERMISSIONS',16),(929,'119','VIEW',1),(930,'119','ADD_TO_PAGE',2),(931,'119','ACCESS_IN_CONTROL_PANEL',4),(932,'119','CONFIGURATION',8),(933,'119','PERMISSIONS',16),(934,'114','VIEW',1),(935,'114','ADD_TO_PAGE',2),(936,'114','ACCESS_IN_CONTROL_PANEL',4),(937,'114','CONFIGURATION',8),(938,'114','PERMISSIONS',16),(939,'67','VIEW',1),(940,'67','ADD_TO_PAGE',2),(941,'67','ACCESS_IN_CONTROL_PANEL',4),(942,'67','CONFIGURATION',8),(943,'67','PERMISSIONS',16),(944,'110','ACCESS_IN_CONTROL_PANEL',16),(945,'135','ACCESS_IN_CONTROL_PANEL',2),(946,'135','CONFIGURATION',4),(947,'135','VIEW',1),(948,'135','PERMISSIONS',8),(949,'59','ACCESS_IN_CONTROL_PANEL',16),(950,'188','ADD_TO_PAGE',2),(951,'188','CONFIGURATION',4),(952,'188','VIEW',1),(953,'188','PERMISSIONS',8),(954,'188','ACCESS_IN_CONTROL_PANEL',16),(955,'131','ACCESS_IN_CONTROL_PANEL',2),(956,'131','CONFIGURATION',4),(957,'131','VIEW',1),(958,'131','PERMISSIONS',8),(959,'102','VIEW',1),(960,'102','ADD_TO_PAGE',2),(961,'102','CONFIGURATION',4),(962,'102','PERMISSIONS',8),(963,'102','ACCESS_IN_CONTROL_PANEL',16),(964,'1_WAR_marketplaceportlet','VIEW',1),(965,'1_WAR_marketplaceportlet','ADD_TO_PAGE',2),(966,'1_WAR_marketplaceportlet','ACCESS_IN_CONTROL_PANEL',4),(967,'1_WAR_marketplaceportlet','CONFIGURATION',8),(968,'1_WAR_marketplaceportlet','PERMISSIONS',16),(969,'2_WAR_marketplaceportlet','VIEW',1),(970,'2_WAR_marketplaceportlet','ADD_TO_PAGE',2),(971,'2_WAR_marketplaceportlet','ACCESS_IN_CONTROL_PANEL',4),(972,'2_WAR_marketplaceportlet','CONFIGURATION',8),(973,'2_WAR_marketplaceportlet','PERMISSIONS',16),(974,'3_WAR_marketplaceportlet','VIEW',1),(975,'3_WAR_marketplaceportlet','ADD_TO_PAGE',2),(976,'3_WAR_marketplaceportlet','ACCESS_IN_CONTROL_PANEL',4),(977,'3_WAR_marketplaceportlet','CONFIGURATION',8),(978,'3_WAR_marketplaceportlet','PERMISSIONS',16),(979,'1_WAR_calendarportlet','ACCESS_IN_CONTROL_PANEL',2),(980,'1_WAR_calendarportlet','ADD_TO_PAGE',4),(981,'1_WAR_calendarportlet','CONFIGURATION',8),(982,'1_WAR_calendarportlet','VIEW',1),(983,'1_WAR_calendarportlet','PERMISSIONS',16),(984,'com.liferay.calendar.model.CalendarResource','ADD_CALENDAR',2),(985,'com.liferay.calendar.model.CalendarResource','DELETE',4),(986,'com.liferay.calendar.model.CalendarResource','UPDATE',8),(987,'com.liferay.calendar.model.CalendarResource','VIEW',1),(988,'com.liferay.calendar.model.CalendarResource','PERMISSIONS',16),(989,'com.liferay.calendar.model.Calendar','DELETE',2),(990,'com.liferay.calendar.model.Calendar','MANAGE_BOOKINGS',4),(991,'com.liferay.calendar.model.Calendar','PERMISSIONS',8),(992,'com.liferay.calendar.model.Calendar','UPDATE',16),(993,'com.liferay.calendar.model.Calendar','VIEW',1),(994,'com.liferay.calendar.model.Calendar','VIEW_BOOKING_DETAILS',32),(995,'com.liferay.calendar','ADD_RESOURCE',2),(996,'com.liferay.calendar','PERMISSIONS',4),(997,'com.liferay.calendar.model.CalendarBooking','ADD_DISCUSSION',2),(998,'com.liferay.calendar.model.CalendarBooking','DELETE_DISCUSSION',4),(999,'com.liferay.calendar.model.CalendarBooking','PERMISSIONS',8),(1000,'com.liferay.calendar.model.CalendarBooking','UPDATE_DISCUSSION',16),(1001,'2_WAR_notificationsportlet','VIEW',1),(1002,'2_WAR_notificationsportlet','ADD_TO_PAGE',2),(1003,'2_WAR_notificationsportlet','ACCESS_IN_CONTROL_PANEL',4),(1004,'2_WAR_notificationsportlet','CONFIGURATION',8),(1005,'2_WAR_notificationsportlet','PERMISSIONS',16),(1006,'1_WAR_notificationsportlet','VIEW',1),(1007,'1_WAR_notificationsportlet','ADD_TO_PAGE',2),(1008,'1_WAR_notificationsportlet','ACCESS_IN_CONTROL_PANEL',4),(1009,'1_WAR_notificationsportlet','CONFIGURATION',8),(1010,'1_WAR_notificationsportlet','PERMISSIONS',16),(1011,'4_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',2),(1012,'4_WAR_opensocialportlet','CONFIGURATION',4),(1013,'4_WAR_opensocialportlet','VIEW',1),(1014,'4_WAR_opensocialportlet','PERMISSIONS',8),(1015,'2_WAR_opensocialportlet','ADD_TO_PAGE',2),(1016,'2_WAR_opensocialportlet','CONFIGURATION',4),(1017,'2_WAR_opensocialportlet','VIEW',1),(1018,'2_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',8),(1019,'2_WAR_opensocialportlet','PERMISSIONS',16),(1020,'1_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',2),(1021,'1_WAR_opensocialportlet','CONFIGURATION',4),(1022,'1_WAR_opensocialportlet','VIEW',1),(1023,'1_WAR_opensocialportlet','PERMISSIONS',8),(1024,'com.liferay.opensocial.model.Gadget','DELETE',2),(1025,'com.liferay.opensocial.model.Gadget','PERMISSIONS',4),(1026,'com.liferay.opensocial.model.Gadget','UPDATE',8),(1027,'com.liferay.opensocial.model.Gadget','VIEW',1),(1028,'com.liferay.opensocial','PERMISSIONS',2),(1029,'com.liferay.opensocial','PUBLISH_GADGET',4),(1030,'3_WAR_opensocialportlet','ADD_TO_PAGE',2),(1031,'3_WAR_opensocialportlet','CONFIGURATION',4),(1032,'3_WAR_opensocialportlet','VIEW',1),(1033,'3_WAR_opensocialportlet','ACCESS_IN_CONTROL_PANEL',8),(1034,'3_WAR_opensocialportlet','PERMISSIONS',16),(1035,'1_WAR_webformportlet','VIEW',1),(1036,'1_WAR_webformportlet','ADD_TO_PAGE',2),(1037,'1_WAR_webformportlet','ACCESS_IN_CONTROL_PANEL',4),(1038,'1_WAR_webformportlet','CONFIGURATION',8),(1039,'1_WAR_webformportlet','PERMISSIONS',16),(1101,'springhibliferay_WAR_SpringHibMavenLiferayportlet','VIEW',1),(1102,'springhibliferay_WAR_SpringHibMavenLiferayportlet','ADD_TO_PAGE',2),(1103,'springhibliferay_WAR_SpringHibMavenLiferayportlet','ACCESS_IN_CONTROL_PANEL',4),(1104,'springhibliferay_WAR_SpringHibMavenLiferayportlet','CONFIGURATION',8),(1105,'springhibliferay_WAR_SpringHibMavenLiferayportlet','PERMISSIONS',16),(1201,'adminportlet_WAR_adminportlet','VIEW',1),(1202,'adminportlet_WAR_adminportlet','ADD_TO_PAGE',2),(1203,'adminportlet_WAR_adminportlet','ACCESS_IN_CONTROL_PANEL',4),(1204,'adminportlet_WAR_adminportlet','CONFIGURATION',8),(1205,'adminportlet_WAR_adminportlet','PERMISSIONS',16),(1301,'tfcompanyportlet_WAR_adminportlet','VIEW',1),(1302,'tfcompanyportlet_WAR_adminportlet','ADD_TO_PAGE',2),(1303,'tfcompanyportlet_WAR_adminportlet','ACCESS_IN_CONTROL_PANEL',4),(1304,'tfcompanyportlet_WAR_adminportlet','CONFIGURATION',8),(1305,'tfcompanyportlet_WAR_adminportlet','PERMISSIONS',16),(1306,'tfcompanyportlet_WAR_tfadminportlet','VIEW',1),(1307,'tfcompanyportlet_WAR_tfadminportlet','ADD_TO_PAGE',2),(1308,'tfcompanyportlet_WAR_tfadminportlet','ACCESS_IN_CONTROL_PANEL',4),(1309,'tfcompanyportlet_WAR_tfadminportlet','CONFIGURATION',8),(1310,'tfcompanyportlet_WAR_tfadminportlet','PERMISSIONS',16),(1401,'tfdashboardportlet_WAR_adminportlet','VIEW',1),(1402,'tfdashboardportlet_WAR_adminportlet','ADD_TO_PAGE',2),(1403,'tfdashboardportlet_WAR_adminportlet','ACCESS_IN_CONTROL_PANEL',4),(1404,'tfdashboardportlet_WAR_adminportlet','CONFIGURATION',8),(1405,'tfdashboardportlet_WAR_adminportlet','PERMISSIONS',16),(1406,'tfdashboardportlet_WAR_tfdashboardportlet','VIEW',1),(1407,'tfdashboardportlet_WAR_tfdashboardportlet','ADD_TO_PAGE',2),(1408,'tfdashboardportlet_WAR_tfdashboardportlet','ACCESS_IN_CONTROL_PANEL',4),(1409,'tfdashboardportlet_WAR_tfdashboardportlet','CONFIGURATION',8),(1410,'tfdashboardportlet_WAR_tfdashboardportlet','PERMISSIONS',16),(1411,'tfpoportlet_WAR_tfpoportlet','VIEW',1),(1412,'tfpoportlet_WAR_tfpoportlet','ADD_TO_PAGE',2),(1413,'tfpoportlet_WAR_tfpoportlet','ACCESS_IN_CONTROL_PANEL',4),(1414,'tfpoportlet_WAR_tfpoportlet','CONFIGURATION',8),(1415,'tfpoportlet_WAR_tfpoportlet','PERMISSIONS',16),(1501,'scfinvoiceportlet_WAR_scfinvoiceportlet','VIEW',1),(1502,'scfinvoiceportlet_WAR_scfinvoiceportlet','ADD_TO_PAGE',2),(1503,'scfinvoiceportlet_WAR_scfinvoiceportlet','ACCESS_IN_CONTROL_PANEL',4),(1504,'scfinvoiceportlet_WAR_scfinvoiceportlet','CONFIGURATION',8),(1505,'scfinvoiceportlet_WAR_scfinvoiceportlet','PERMISSIONS',16),(1601,'scftradeportlet_WAR_scfinvoiceportlet','VIEW',1),(1602,'scftradeportlet_WAR_scfinvoiceportlet','ADD_TO_PAGE',2),(1603,'scftradeportlet_WAR_scfinvoiceportlet','ACCESS_IN_CONTROL_PANEL',4),(1604,'scftradeportlet_WAR_scfinvoiceportlet','CONFIGURATION',8),(1605,'scftradeportlet_WAR_scfinvoiceportlet','PERMISSIONS',16),(1606,'scftradeportlet_WAR_scftradeportlet','VIEW',1),(1607,'scftradeportlet_WAR_scftradeportlet','ADD_TO_PAGE',2),(1608,'scftradeportlet_WAR_scftradeportlet','ACCESS_IN_CONTROL_PANEL',4),(1609,'scftradeportlet_WAR_scftradeportlet','CONFIGURATION',8),(1610,'scftradeportlet_WAR_scftradeportlet','PERMISSIONS',16),(1701,'tfregistrationportlet_WAR_tfregistrationportlet','VIEW',1),(1702,'tfregistrationportlet_WAR_tfregistrationportlet','ADD_TO_PAGE',2),(1703,'tfregistrationportlet_WAR_tfregistrationportlet','ACCESS_IN_CONTROL_PANEL',4),(1704,'tfregistrationportlet_WAR_tfregistrationportlet','CONFIGURATION',8),(1705,'tfregistrationportlet_WAR_tfregistrationportlet','PERMISSIONS',16),(1801,'scfinvestorportlet_WAR_scfinvestorportlet','VIEW',1),(1802,'scfinvestorportlet_WAR_scfinvestorportlet','ADD_TO_PAGE',2),(1803,'scfinvestorportlet_WAR_scfinvestorportlet','ACCESS_IN_CONTROL_PANEL',4),(1804,'scfinvestorportlet_WAR_scfinvestorportlet','CONFIGURATION',8),(1805,'scfinvestorportlet_WAR_scfinvestorportlet','PERMISSIONS',16),(1901,'tfsettingsportlet_WAR_scfinvestorportlet','VIEW',1),(1902,'tfsettingsportlet_WAR_scfinvestorportlet','ADD_TO_PAGE',2),(1903,'tfsettingsportlet_WAR_scfinvestorportlet','ACCESS_IN_CONTROL_PANEL',4),(1904,'tfsettingsportlet_WAR_scfinvestorportlet','CONFIGURATION',8),(1905,'tfsettingsportlet_WAR_scfinvestorportlet','PERMISSIONS',16),(2001,'tfsettingsportlet_WAR_tfsettingsportlet','VIEW',1),(2002,'tfsettingsportlet_WAR_tfsettingsportlet','ADD_TO_PAGE',2),(2003,'tfsettingsportlet_WAR_tfsettingsportlet','ACCESS_IN_CONTROL_PANEL',4),(2004,'tfsettingsportlet_WAR_tfsettingsportlet','CONFIGURATION',8),(2005,'tfsettingsportlet_WAR_tfsettingsportlet','PERMISSIONS',16);

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

insert  into `resourceblock`(`resourceBlockId`,`companyId`,`groupId`,`name`,`permissionsHash`,`referenceCount`) values (1,10155,10182,'com.liferay.calendar.model.CalendarResource','a4fbfec8150bc3ea4d91841df523ca4f561c8c17',1),(4,10155,10182,'com.liferay.calendar.model.Calendar','15b1c38f0777e19af9a6988dae3130a535100e3c',1);

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

insert  into `resourceblockpermission`(`resourceBlockPermissionId`,`resourceBlockId`,`roleId`,`actionIds`) values (10695,1,10164,31),(10697,2,10164,63),(10698,3,10164,63),(10699,3,10171,1),(10700,4,10163,1),(10701,4,10164,63),(10702,4,10171,1);

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

insert  into `resourcepermission`(`resourcePermissionId`,`companyId`,`name`,`scope`,`primKey`,`roleId`,`ownerId`,`actionIds`) values (1,10155,'2',1,'10155',10166,0,2),(2,10155,'140',1,'10155',10166,0,2),(3,10155,'158',1,'10155',10166,0,6),(4,10155,'153',1,'10155',10166,0,6),(5,10155,'com.liferay.portal.model.Layout',4,'10176',10164,10159,1023),(6,10155,'com.liferay.portal.model.Layout',4,'10176',10171,0,19),(7,10155,'com.liferay.portal.model.Layout',4,'10176',10163,0,1),(11,10155,'98',2,'10192',10166,0,1),(12,10155,'66',2,'10192',10166,0,1),(13,10155,'180',2,'10192',10166,0,1),(14,10155,'27',2,'10192',10166,0,1),(15,10155,'152',2,'10192',10166,0,1),(16,10155,'183',2,'10192',10166,0,1),(17,10155,'134',2,'10192',10166,0,1),(18,10155,'130',2,'10192',10166,0,1),(19,10155,'122',2,'10192',10166,0,1),(20,10155,'36',2,'10192',10166,0,1),(21,10155,'26',2,'10192',10166,0,1),(22,10155,'175',2,'10192',10166,0,1),(23,10155,'153',2,'10192',10166,0,1),(24,10155,'64',2,'10192',10166,0,1),(25,10155,'129',2,'10192',10166,0,1),(26,10155,'182',2,'10192',10166,0,1),(27,10155,'179',2,'10192',10166,0,1),(28,10155,'173',2,'10192',10166,0,1),(29,10155,'100',2,'10192',10166,0,1),(30,10155,'19',2,'10192',10166,0,1),(31,10155,'157',2,'10192',10166,0,1),(32,10155,'128',2,'10192',10166,0,1),(33,10155,'181',2,'10192',10166,0,1),(34,10155,'154',2,'10192',10166,0,1),(35,10155,'148',2,'10192',10166,0,1),(36,10155,'11',2,'10192',10166,0,1),(37,10155,'29',2,'10192',10166,0,1),(38,10155,'158',2,'10192',10166,0,1),(39,10155,'178',2,'10192',10166,0,1),(40,10155,'58',2,'10192',10166,0,1),(41,10155,'71',2,'10192',10166,0,1),(42,10155,'97',2,'10192',10166,0,1),(43,10155,'39',2,'10192',10166,0,1),(44,10155,'85',2,'10192',10166,0,1),(45,10155,'118',2,'10192',10166,0,1),(46,10155,'107',2,'10192',10166,0,1),(47,10155,'30',2,'10192',10166,0,1),(48,10155,'184',2,'10192',10166,0,1),(49,10155,'147',2,'10192',10166,0,1),(50,10155,'48',2,'10192',10166,0,1),(51,10155,'125',2,'10192',10166,0,1),(52,10155,'161',2,'10192',10166,0,1),(53,10155,'146',2,'10192',10166,0,1),(54,10155,'62',2,'10192',10166,0,1),(55,10155,'162',2,'10192',10166,0,1),(56,10155,'176',2,'10192',10166,0,1),(57,10155,'108',2,'10192',10166,0,1),(58,10155,'187',2,'10192',10166,0,1),(59,10155,'84',2,'10192',10166,0,1),(60,10155,'101',2,'10192',10166,0,1),(61,10155,'121',2,'10192',10166,0,1),(62,10155,'143',2,'10192',10166,0,1),(63,10155,'77',2,'10192',10166,0,1),(64,10155,'167',2,'10192',10166,0,1),(65,10155,'115',2,'10192',10166,0,1),(66,10155,'56',2,'10192',10166,0,1),(67,10155,'16',2,'10192',10166,0,1),(68,10155,'3',2,'10192',10166,0,1),(69,10155,'23',2,'10192',10166,0,1),(70,10155,'20',2,'10192',10166,0,1),(71,10155,'83',2,'10192',10166,0,1),(72,10155,'99',2,'10192',10166,0,1),(73,10155,'186',2,'10192',10166,0,1),(74,10155,'194',2,'10192',10166,0,1),(75,10155,'70',2,'10192',10166,0,1),(76,10155,'164',2,'10192',10166,0,1),(77,10155,'141',2,'10192',10166,0,1),(78,10155,'9',2,'10192',10166,0,1),(79,10155,'28',2,'10192',10166,0,1),(80,10155,'137',2,'10192',10166,0,1),(81,10155,'47',2,'10192',10166,0,1),(82,10155,'15',2,'10192',10166,0,1),(83,10155,'116',2,'10192',10166,0,1),(84,10155,'82',2,'10192',10166,0,1),(85,10155,'151',2,'10192',10166,0,1),(86,10155,'54',2,'10192',10166,0,1),(87,10155,'34',2,'10192',10166,0,1),(88,10155,'169',2,'10192',10166,0,1),(89,10155,'132',2,'10192',10166,0,1),(90,10155,'61',2,'10192',10166,0,1),(91,10155,'73',2,'10192',10166,0,1),(92,10155,'31',2,'10192',10166,0,1),(93,10155,'50',2,'10192',10166,0,1),(94,10155,'127',2,'10192',10166,0,1),(95,10155,'193',2,'10192',10166,0,1),(96,10155,'25',2,'10192',10166,0,1),(97,10155,'166',2,'10192',10166,0,1),(98,10155,'33',2,'10192',10166,0,1),(99,10155,'150',2,'10192',10166,0,1),(100,10155,'114',2,'10192',10166,0,1),(101,10155,'149',2,'10192',10166,0,1),(102,10155,'67',2,'10192',10166,0,1),(103,10155,'110',2,'10192',10166,0,1),(104,10155,'59',2,'10192',10166,0,1),(105,10155,'135',2,'10192',10166,0,1),(106,10155,'188',2,'10192',10166,0,1),(107,10155,'131',2,'10192',10166,0,1),(108,10155,'102',2,'10192',10166,0,1),(109,10155,'com.liferay.portal.model.Layout',2,'10192',10166,0,1),(110,10155,'com.liferay.portlet.blogs',2,'10192',10166,0,14),(111,10155,'98',2,'10192',10165,0,2),(112,10155,'152',2,'10192',10165,0,2),(113,10155,'183',2,'10192',10165,0,4),(114,10155,'182',2,'10192',10165,0,4),(115,10155,'179',2,'10192',10165,0,2),(116,10155,'173',2,'10192',10165,0,4),(117,10155,'154',2,'10192',10165,0,2),(118,10155,'178',2,'10192',10165,0,16),(119,10155,'147',2,'10192',10165,0,2),(120,10155,'161',2,'10192',10165,0,2),(121,10155,'162',2,'10192',10165,0,2),(122,10155,'167',2,'10192',10165,0,2),(123,10155,'20',2,'10192',10165,0,2),(124,10155,'99',2,'10192',10165,0,2),(125,10155,'28',2,'10192',10165,0,2),(126,10155,'15',2,'10192',10165,0,2),(127,10155,'25',2,'10192',10165,0,2),(128,10155,'com.liferay.portal.model.Group',2,'10192',10165,0,8396800),(129,10155,'com.liferay.portlet.asset',2,'10192',10165,0,30),(130,10155,'com.liferay.portlet.blogs',2,'10192',10165,0,14),(131,10155,'com.liferay.portlet.bookmarks',2,'10192',10165,0,31),(132,10155,'com.liferay.portlet.documentlibrary',2,'10192',10165,0,1023),(133,10155,'com.liferay.portlet.journal',2,'10192',10165,0,255),(134,10155,'com.liferay.portlet.messageboards',2,'10192',10165,0,2047),(135,10155,'com.liferay.portlet.polls',2,'10192',10165,0,6),(136,10155,'com.liferay.portlet.wiki',2,'10192',10165,0,6),(137,10155,'com.liferay.portal.model.User',4,'10199',10164,10199,31),(138,10155,'98',1,'10155',10165,0,4),(139,10155,'98',1,'10155',10166,0,4),(140,10155,'66',1,'10155',10165,0,2),(141,10155,'66',1,'10155',10166,0,2),(142,10155,'180',1,'10155',10163,0,2),(143,10155,'180',1,'10155',10165,0,2),(144,10155,'180',1,'10155',10166,0,2),(145,10155,'27',1,'10155',10165,0,2),(146,10155,'27',1,'10155',10166,0,2),(147,10155,'183',1,'10155',10162,0,2),(148,10155,'122',1,'10155',10163,0,8),(149,10155,'122',1,'10155',10165,0,8),(150,10155,'122',1,'10155',10166,0,8),(151,10155,'36',1,'10155',10165,0,4),(152,10155,'36',1,'10155',10166,0,4),(153,10155,'26',1,'10155',10165,0,2),(154,10155,'26',1,'10155',10166,0,2),(155,10155,'175',1,'10155',10163,0,2),(156,10155,'175',1,'10155',10165,0,2),(157,10155,'175',1,'10155',10166,0,2),(158,10155,'153',1,'10155',10165,0,4),(159,10155,'64',1,'10155',10163,0,2),(160,10155,'64',1,'10155',10165,0,2),(161,10155,'64',1,'10155',10166,0,2),(162,10155,'182',1,'10155',10165,0,2),(163,10155,'182',1,'10155',10166,0,2),(164,10155,'173',1,'10155',10163,0,2),(165,10155,'173',1,'10155',10165,0,2),(166,10155,'173',1,'10155',10166,0,2),(167,10155,'100',1,'10155',10165,0,2),(168,10155,'100',1,'10155',10166,0,2),(169,10155,'19',1,'10155',10165,0,2),(170,10155,'19',1,'10155',10166,0,2),(171,10155,'181',1,'10155',10163,0,2),(172,10155,'181',1,'10155',10165,0,2),(173,10155,'181',1,'10155',10166,0,2),(174,10155,'148',1,'10155',10163,0,2),(175,10155,'148',1,'10155',10165,0,2),(176,10155,'148',1,'10155',10166,0,2),(177,10155,'11',1,'10155',10165,0,2),(178,10155,'11',1,'10155',10166,0,2),(179,10155,'29',1,'10155',10165,0,2),(180,10155,'29',1,'10155',10166,0,2),(181,10155,'158',1,'10155',10165,0,4),(182,10155,'178',1,'10155',10165,0,4),(183,10155,'178',1,'10155',10166,0,4),(184,10155,'58',1,'10155',10163,0,2),(185,10155,'58',1,'10155',10165,0,2),(186,10155,'58',1,'10155',10166,0,2),(187,10155,'71',1,'10155',10163,0,2),(188,10155,'71',1,'10155',10165,0,2),(189,10155,'71',1,'10155',10166,0,2),(190,10155,'97',1,'10155',10165,0,2),(191,10155,'97',1,'10155',10166,0,2),(192,10155,'39',1,'10155',10165,0,2),(193,10155,'39',1,'10155',10166,0,2),(194,10155,'85',1,'10155',10163,0,2),(195,10155,'85',1,'10155',10165,0,2),(196,10155,'85',1,'10155',10166,0,2),(197,10155,'118',1,'10155',10163,0,2),(198,10155,'118',1,'10155',10165,0,2),(199,10155,'118',1,'10155',10166,0,2),(200,10155,'107',1,'10155',10165,0,2),(201,10155,'107',1,'10155',10166,0,2),(202,10155,'30',1,'10155',10165,0,2),(203,10155,'30',1,'10155',10166,0,2),(204,10155,'184',1,'10155',10163,0,2),(205,10155,'184',1,'10155',10165,0,2),(206,10155,'184',1,'10155',10166,0,2),(207,10155,'48',1,'10155',10165,0,2),(208,10155,'48',1,'10155',10166,0,2),(209,10155,'62',1,'10155',10165,0,2),(210,10155,'62',1,'10155',10166,0,2),(211,10155,'176',1,'10155',10162,0,2),(212,10155,'108',1,'10155',10165,0,2),(213,10155,'108',1,'10155',10166,0,2),(214,10155,'187',1,'10155',10165,0,2),(215,10155,'187',1,'10155',10166,0,2),(216,10155,'84',1,'10155',10165,0,4),(217,10155,'84',1,'10155',10166,0,4),(218,10155,'101',1,'10155',10163,0,4),(219,10155,'101',1,'10155',10165,0,4),(220,10155,'101',1,'10155',10166,0,4),(221,10155,'121',1,'10155',10163,0,2),(222,10155,'121',1,'10155',10165,0,2),(223,10155,'121',1,'10155',10166,0,2),(224,10155,'143',1,'10155',10163,0,2),(225,10155,'143',1,'10155',10165,0,2),(226,10155,'143',1,'10155',10166,0,2),(227,10155,'77',1,'10155',10163,0,2),(228,10155,'77',1,'10155',10165,0,2),(229,10155,'77',1,'10155',10166,0,2),(230,10155,'167',1,'10155',10165,0,4),(231,10155,'167',1,'10155',10166,0,4),(232,10155,'115',1,'10155',10163,0,2),(233,10155,'115',1,'10155',10165,0,2),(234,10155,'115',1,'10155',10166,0,2),(235,10155,'56',1,'10155',10163,0,2),(236,10155,'56',1,'10155',10165,0,2),(237,10155,'56',1,'10155',10166,0,2),(238,10155,'16',1,'10155',10165,0,8),(239,10155,'16',1,'10155',10166,0,8),(240,10155,'3',1,'10155',10163,0,2),(241,10155,'3',1,'10155',10165,0,2),(242,10155,'3',1,'10155',10166,0,2),(243,10155,'23',1,'10155',10165,0,2),(244,10155,'23',1,'10155',10166,0,2),(245,10155,'20',1,'10155',10163,0,8),(246,10155,'20',1,'10155',10165,0,8),(247,10155,'20',1,'10155',10166,0,8),(248,10155,'83',1,'10155',10165,0,4),(249,10155,'83',1,'10155',10166,0,4),(250,10155,'186',1,'10155',10165,0,2),(251,10155,'186',1,'10155',10166,0,2),(252,10155,'194',1,'10155',10163,0,2),(253,10155,'194',1,'10155',10165,0,2),(254,10155,'194',1,'10155',10166,0,2),(255,10155,'70',1,'10155',10165,0,2),(256,10155,'70',1,'10155',10166,0,2),(257,10155,'164',1,'10155',10163,0,2),(258,10155,'164',1,'10155',10165,0,2),(259,10155,'164',1,'10155',10166,0,2),(260,10155,'141',1,'10155',10163,0,8),(261,10155,'141',1,'10155',10165,0,8),(262,10155,'141',1,'10155',10166,0,8),(263,10155,'9',1,'10155',10162,0,2),(264,10155,'28',1,'10155',10165,0,4),(265,10155,'28',1,'10155',10166,0,4),(266,10155,'47',1,'10155',10163,0,2),(267,10155,'47',1,'10155',10165,0,2),(268,10155,'47',1,'10155',10166,0,2),(269,10155,'15',1,'10155',10165,0,4),(270,10155,'15',1,'10155',10166,0,4),(271,10155,'116',1,'10155',10163,0,2),(272,10155,'116',1,'10155',10165,0,2),(273,10155,'116',1,'10155',10166,0,2),(274,10155,'82',1,'10155',10163,0,2),(275,10155,'82',1,'10155',10165,0,2),(276,10155,'82',1,'10155',10166,0,2),(277,10155,'54',1,'10155',10165,0,2),(278,10155,'54',1,'10155',10166,0,2),(279,10155,'34',1,'10155',10165,0,2),(280,10155,'34',1,'10155',10166,0,2),(281,10155,'169',1,'10155',10165,0,2),(282,10155,'169',1,'10155',10166,0,2),(283,10155,'61',1,'10155',10165,0,2),(284,10155,'61',1,'10155',10166,0,2),(285,10155,'73',1,'10155',10163,0,2),(286,10155,'73',1,'10155',10165,0,2),(287,10155,'73',1,'10155',10166,0,2),(288,10155,'31',1,'10155',10163,0,2),(289,10155,'31',1,'10155',10165,0,2),(290,10155,'31',1,'10155',10166,0,2),(291,10155,'50',1,'10155',10163,0,2),(292,10155,'50',1,'10155',10165,0,2),(293,10155,'50',1,'10155',10166,0,2),(294,10155,'127',1,'10155',10162,0,2),(295,10155,'193',1,'10155',10163,0,2),(296,10155,'193',1,'10155',10165,0,2),(297,10155,'193',1,'10155',10166,0,2),(298,10155,'166',1,'10155',10165,0,4),(299,10155,'166',1,'10155',10166,0,4),(300,10155,'33',1,'10155',10163,0,4),(301,10155,'33',1,'10155',10165,0,4),(302,10155,'33',1,'10155',10166,0,4),(303,10155,'114',1,'10155',10163,0,2),(304,10155,'114',1,'10155',10165,0,2),(305,10155,'114',1,'10155',10166,0,2),(306,10155,'67',1,'10155',10165,0,2),(307,10155,'67',1,'10155',10166,0,2),(308,10155,'110',1,'10155',10165,0,2),(309,10155,'110',1,'10155',10166,0,2),(310,10155,'59',1,'10155',10165,0,2),(311,10155,'59',1,'10155',10166,0,2),(312,10155,'188',1,'10155',10165,0,2),(313,10155,'188',1,'10155',10166,0,2),(314,10155,'102',1,'10155',10163,0,2),(315,10155,'102',1,'10155',10165,0,2),(316,10155,'102',1,'10155',10166,0,2),(317,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10304',10164,10159,15),(318,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10304',10166,0,1),(319,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10304',10163,0,1),(320,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10305',10164,10159,15),(321,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10305',10166,0,1),(322,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10305',10163,0,1),(323,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10306',10164,10159,15),(324,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10306',10166,0,1),(325,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10306',10163,0,1),(326,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10308',10164,10159,15),(327,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10308',10166,0,1),(328,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10308',10163,0,1),(329,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10307',10164,10159,15),(330,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10307',10166,0,1),(331,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10307',10163,0,1),(332,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10310',10164,10159,15),(333,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10310',10166,0,1),(334,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10310',10163,0,1),(335,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10309',10164,10159,15),(336,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10309',10166,0,1),(337,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10309',10163,0,1),(338,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10312',10164,10159,15),(339,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10312',10166,0,1),(340,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10312',10163,0,1),(341,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10311',10164,10159,15),(342,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10311',10166,0,1),(343,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10311',10163,0,1),(344,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10314',10164,10159,15),(345,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10314',10166,0,1),(346,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10314',10163,0,1),(347,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10313',10164,10159,15),(348,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10313',10166,0,1),(349,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntryType',4,'10313',10163,0,1),(350,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10316',10164,10159,15),(351,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10316',10166,0,1),(352,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10316',10163,0,1),(353,10155,'com.liferay.portal.model.LayoutPrototype',4,'10317',10164,10159,15),(354,10155,'com.liferay.portal.model.Layout',4,'10321',10164,10159,1023),(355,10155,'com.liferay.portal.model.Layout',4,'10321',10171,0,19),(356,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'10325',10164,10159,15),(357,10155,'33',4,'10321_LAYOUT_33',10164,0,63),(358,10155,'33',4,'10321_LAYOUT_33',10171,0,1),(359,10155,'33',4,'10321_LAYOUT_33',10163,0,1),(360,10155,'com.liferay.portlet.blogs',4,'10318',10164,0,14),(361,10155,'148',4,'10321_LAYOUT_148_INSTANCE_NbVnUaakHJfz',10164,0,31),(362,10155,'148',4,'10321_LAYOUT_148_INSTANCE_NbVnUaakHJfz',10171,0,1),(363,10155,'148',4,'10321_LAYOUT_148_INSTANCE_NbVnUaakHJfz',10163,0,1),(364,10155,'114',4,'10321_LAYOUT_114',10164,0,31),(365,10155,'114',4,'10321_LAYOUT_114',10171,0,1),(366,10155,'114',4,'10321_LAYOUT_114',10163,0,1),(367,10155,'com.liferay.portal.model.LayoutPrototype',4,'10329',10164,10159,15),(368,10155,'com.liferay.portal.model.Layout',4,'10333',10164,10159,1023),(369,10155,'com.liferay.portal.model.Layout',4,'10333',10171,0,19),(370,10155,'141',4,'10333_LAYOUT_141_INSTANCE_j1ARUiX863zj',10164,0,63),(371,10155,'141',4,'10333_LAYOUT_141_INSTANCE_j1ARUiX863zj',10171,0,1),(372,10155,'141',4,'10333_LAYOUT_141_INSTANCE_j1ARUiX863zj',10163,0,1),(373,10155,'122',4,'10333_LAYOUT_122_INSTANCE_3mYQCD9E4qqo',10164,0,63),(374,10155,'122',4,'10333_LAYOUT_122_INSTANCE_3mYQCD9E4qqo',10171,0,1),(375,10155,'122',4,'10333_LAYOUT_122_INSTANCE_3mYQCD9E4qqo',10163,0,1),(376,10155,'3',4,'10333_LAYOUT_3',10164,0,31),(377,10155,'3',4,'10333_LAYOUT_3',10171,0,1),(378,10155,'3',4,'10333_LAYOUT_3',10163,0,1),(379,10155,'101',4,'10333_LAYOUT_101_INSTANCE_TNgqY1W4Waou',10164,0,127),(380,10155,'101',4,'10333_LAYOUT_101_INSTANCE_TNgqY1W4Waou',10171,0,17),(381,10155,'101',4,'10333_LAYOUT_101_INSTANCE_TNgqY1W4Waou',10163,0,1),(382,10155,'com.liferay.portal.model.LayoutPrototype',4,'10339',10164,10159,15),(383,10155,'com.liferay.portal.model.Layout',4,'10343',10164,10159,1023),(384,10155,'com.liferay.portal.model.Layout',4,'10343',10171,0,19),(385,10155,'36',4,'10343_LAYOUT_36',10164,0,63),(386,10155,'36',4,'10343_LAYOUT_36',10171,0,1),(387,10155,'36',4,'10343_LAYOUT_36',10163,0,1),(388,10155,'com.liferay.portlet.wiki',4,'10340',10164,0,6),(389,10155,'122',4,'10343_LAYOUT_122_INSTANCE_AELA4U0ILxaV',10164,0,63),(390,10155,'122',4,'10343_LAYOUT_122_INSTANCE_AELA4U0ILxaV',10171,0,1),(391,10155,'122',4,'10343_LAYOUT_122_INSTANCE_AELA4U0ILxaV',10163,0,1),(392,10155,'141',4,'10343_LAYOUT_141_INSTANCE_v9hxxlJV86xR',10164,0,63),(393,10155,'141',4,'10343_LAYOUT_141_INSTANCE_v9hxxlJV86xR',10171,0,1),(394,10155,'141',4,'10343_LAYOUT_141_INSTANCE_v9hxxlJV86xR',10163,0,1),(395,10155,'com.liferay.portal.model.LayoutSetPrototype',4,'10350',10164,10159,15),(399,10155,'com.liferay.portal.model.Layout',4,'10362',10164,10159,1023),(400,10155,'com.liferay.portal.model.Layout',4,'10362',10171,0,19),(401,10155,'com.liferay.portal.model.Layout',4,'10362',10163,0,1),(402,10155,'19',4,'10362_LAYOUT_19',10164,0,31),(403,10155,'19',4,'10362_LAYOUT_19',10171,0,1),(404,10155,'19',4,'10362_LAYOUT_19',10163,0,1),(405,10155,'com.liferay.portlet.messageboards',4,'10351',10164,0,2047),(406,10155,'com.liferay.portlet.messageboards',4,'10351',10171,0,781),(407,10155,'com.liferay.portlet.messageboards',4,'10351',10163,0,1),(408,10155,'3',4,'10362_LAYOUT_3',10164,0,31),(409,10155,'3',4,'10362_LAYOUT_3',10171,0,1),(410,10155,'3',4,'10362_LAYOUT_3',10163,0,1),(411,10155,'59',4,'10362_LAYOUT_59_INSTANCE_CkaoBs86hFMU',10164,0,31),(412,10155,'59',4,'10362_LAYOUT_59_INSTANCE_CkaoBs86hFMU',10171,0,1),(413,10155,'59',4,'10362_LAYOUT_59_INSTANCE_CkaoBs86hFMU',10163,0,1),(414,10155,'com.liferay.portlet.polls',4,'10351',10164,0,6),(415,10155,'180',4,'10362_LAYOUT_180',10164,0,31),(416,10155,'180',4,'10362_LAYOUT_180',10171,0,1),(417,10155,'180',4,'10362_LAYOUT_180',10163,0,1),(418,10155,'101',4,'10362_LAYOUT_101_INSTANCE_TRz0qE44e3D9',10164,0,127),(419,10155,'101',4,'10362_LAYOUT_101_INSTANCE_TRz0qE44e3D9',10171,0,17),(420,10155,'101',4,'10362_LAYOUT_101_INSTANCE_TRz0qE44e3D9',10163,0,1),(421,10155,'com.liferay.portal.model.Layout',4,'10370',10164,10159,1023),(422,10155,'com.liferay.portal.model.Layout',4,'10370',10171,0,19),(423,10155,'com.liferay.portal.model.Layout',4,'10370',10163,0,1),(424,10155,'36',4,'10370_LAYOUT_36',10164,0,63),(425,10155,'36',4,'10370_LAYOUT_36',10171,0,1),(426,10155,'36',4,'10370_LAYOUT_36',10163,0,1),(427,10155,'com.liferay.portlet.wiki',4,'10351',10164,0,6),(428,10155,'122',4,'10370_LAYOUT_122_INSTANCE_fKMZcwJCJMvN',10164,0,63),(429,10155,'122',4,'10370_LAYOUT_122_INSTANCE_fKMZcwJCJMvN',10171,0,1),(430,10155,'122',4,'10370_LAYOUT_122_INSTANCE_fKMZcwJCJMvN',10163,0,1),(431,10155,'148',4,'10370_LAYOUT_148_INSTANCE_C36nMI1ylKAq',10164,0,31),(432,10155,'148',4,'10370_LAYOUT_148_INSTANCE_C36nMI1ylKAq',10171,0,1),(433,10155,'148',4,'10370_LAYOUT_148_INSTANCE_C36nMI1ylKAq',10163,0,1),(434,10155,'com.liferay.portal.model.LayoutSetPrototype',4,'10376',10164,10159,15),(438,10155,'com.liferay.portal.model.Layout',4,'10388',10164,10159,1023),(439,10155,'com.liferay.portal.model.Layout',4,'10388',10171,0,19),(440,10155,'com.liferay.portal.model.Layout',4,'10388',10163,0,1),(441,10155,'116',4,'10388_LAYOUT_116',10164,0,31),(442,10155,'116',4,'10388_LAYOUT_116',10171,0,1),(443,10155,'116',4,'10388_LAYOUT_116',10163,0,1),(444,10155,'3',4,'10388_LAYOUT_3',10164,0,31),(445,10155,'3',4,'10388_LAYOUT_3',10171,0,1),(446,10155,'3',4,'10388_LAYOUT_3',10163,0,1),(447,10155,'82',4,'10388_LAYOUT_82',10164,0,31),(448,10155,'82',4,'10388_LAYOUT_82',10171,0,1),(449,10155,'82',4,'10388_LAYOUT_82',10163,0,1),(450,10155,'101',4,'10388_LAYOUT_101_INSTANCE_0sN6skhNjCAX',10164,0,127),(451,10155,'101',4,'10388_LAYOUT_101_INSTANCE_0sN6skhNjCAX',10171,0,17),(452,10155,'101',4,'10388_LAYOUT_101_INSTANCE_0sN6skhNjCAX',10163,0,1),(453,10155,'com.liferay.portal.model.Layout',4,'10397',10164,10159,1023),(454,10155,'com.liferay.portal.model.Layout',4,'10397',10171,0,19),(455,10155,'com.liferay.portal.model.Layout',4,'10397',10163,0,1),(456,10155,'20',4,'10397_LAYOUT_20',10164,0,63),(457,10155,'20',4,'10397_LAYOUT_20',10171,0,1),(458,10155,'20',4,'10397_LAYOUT_20',10163,0,1),(459,10155,'com.liferay.portlet.documentlibrary',4,'10377',10164,0,1023),(460,10155,'com.liferay.portlet.documentlibrary',4,'10377',10171,0,331),(461,10155,'com.liferay.portlet.documentlibrary',4,'10377',10163,0,1),(462,10155,'101',4,'10397_LAYOUT_101_INSTANCE_TrTnrxJatGdL',10164,0,127),(463,10155,'101',4,'10397_LAYOUT_101_INSTANCE_TrTnrxJatGdL',10171,0,17),(464,10155,'101',4,'10397_LAYOUT_101_INSTANCE_TrTnrxJatGdL',10163,0,1),(465,10155,'com.liferay.portal.model.Layout',4,'10405',10164,10159,1023),(466,10155,'com.liferay.portal.model.Layout',4,'10405',10171,0,19),(467,10155,'com.liferay.portal.model.Layout',4,'10405',10163,0,1),(468,10155,'39',4,'10405_LAYOUT_39_INSTANCE_VDngodQYRcI1',10164,0,31),(469,10155,'39',4,'10405_LAYOUT_39_INSTANCE_VDngodQYRcI1',10171,0,1),(470,10155,'39',4,'10405_LAYOUT_39_INSTANCE_VDngodQYRcI1',10163,0,1),(471,10155,'39',4,'10405_LAYOUT_39_INSTANCE_jy7N7i1NiAme',10164,0,31),(472,10155,'39',4,'10405_LAYOUT_39_INSTANCE_jy7N7i1NiAme',10171,0,1),(473,10155,'39',4,'10405_LAYOUT_39_INSTANCE_jy7N7i1NiAme',10163,0,1),(480,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10419',10164,10159,15),(481,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10421',10164,10159,15),(482,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10424',10164,10159,15),(483,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10426',10164,10159,15),(484,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10428',10164,10159,15),(485,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10430',10164,10159,15),(486,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10432',10164,10159,15),(498,10155,'com.liferay.portlet.expando.model.ExpandoColumn',4,'10441',10164,0,15),(499,10155,'1_WAR_calendarportlet',1,'10155',10162,0,4),(500,10155,'1_WAR_calendarportlet',1,'10155',10163,0,4),(501,10155,'1_WAR_calendarportlet',1,'10155',10165,0,4),(502,10155,'1_WAR_calendarportlet',1,'10155',10166,0,4),(503,10155,'1_WAR_notificationsportlet',1,'10155',10162,0,2),(504,10155,'1_WAR_notificationsportlet',1,'10155',10163,0,2),(505,10155,'1_WAR_notificationsportlet',1,'10155',10165,0,2),(506,10155,'1_WAR_notificationsportlet',1,'10155',10166,0,2),(507,10155,'2_WAR_opensocialportlet',1,'10155',10162,0,2),(508,10155,'2_WAR_opensocialportlet',1,'10155',10163,0,2),(509,10155,'2_WAR_opensocialportlet',1,'10155',10165,0,2),(510,10155,'2_WAR_opensocialportlet',1,'10155',10166,0,2),(511,10155,'3_WAR_opensocialportlet',1,'10155',10162,0,2),(512,10155,'3_WAR_opensocialportlet',1,'10155',10163,0,2),(513,10155,'3_WAR_opensocialportlet',1,'10155',10165,0,2),(514,10155,'3_WAR_opensocialportlet',1,'10155',10166,0,2),(515,10155,'1_WAR_webformportlet',1,'10155',10162,0,2),(516,10155,'1_WAR_webformportlet',1,'10155',10163,0,2),(517,10155,'1_WAR_webformportlet',1,'10155',10165,0,2),(518,10155,'1_WAR_webformportlet',1,'10155',10166,0,2),(537,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10613',10164,10159,15),(538,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10613',10171,0,1),(539,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10613',10163,0,1),(540,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10614',10164,10159,15),(541,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10614',10171,0,1),(542,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'10614',10163,0,1),(543,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'10617',10164,10159,255),(544,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'10617',10171,0,3),(545,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'10617',10163,0,3),(558,10155,'com.liferay.portal.model.Layout',4,'10637',10164,10199,1023),(559,10155,'com.liferay.portal.model.Layout',4,'10643',10164,10199,1023),(560,10155,'com.liferay.portal.model.Layout',4,'10643',10165,0,19),(561,10155,'com.liferay.portal.model.Layout',4,'10643',10163,0,1),(565,10155,'com.liferay.portal.model.Group',4,'10664',10164,0,33554431),(566,10155,'com.liferay.portal.model.Group',4,'10668',10164,0,33554431),(601,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10801',10164,10159,15),(602,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10802',10164,10159,15),(603,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10803',10164,10159,15),(604,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10804',10164,10159,15),(605,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10805',10164,10159,15),(606,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'10806',10164,10159,15),(701,10155,'springhibliferay_WAR_SpringHibMavenLiferayportlet',1,'10155',10162,0,2),(702,10155,'springhibliferay_WAR_SpringHibMavenLiferayportlet',1,'10155',10163,0,2),(703,10155,'springhibliferay_WAR_SpringHibMavenLiferayportlet',1,'10155',10165,0,2),(704,10155,'springhibliferay_WAR_SpringHibMavenLiferayportlet',1,'10155',10166,0,2),(1010,10155,'adminportlet_WAR_adminportlet',1,'10155',10162,0,2),(1011,10155,'adminportlet_WAR_adminportlet',1,'10155',10163,0,2),(1012,10155,'adminportlet_WAR_adminportlet',1,'10155',10165,0,2),(1013,10155,'adminportlet_WAR_adminportlet',1,'10155',10166,0,2),(1201,10155,'com.liferay.portal.model.LayoutSetPrototype',4,'11304',10164,10159,15),(1205,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11316',10164,10159,255),(1206,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11316',10171,0,3),(1207,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11316',10163,0,3),(1208,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11325',10164,10159,255),(1209,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11325',10171,0,3),(1210,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11325',10163,0,3),(1211,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11333',10164,10159,255),(1212,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11333',10171,0,3),(1213,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11333',10163,0,3),(1214,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11341',10164,10159,255),(1215,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11341',10171,0,3),(1216,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11341',10163,0,3),(1217,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'11354',10164,10159,15),(1218,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'11354',10171,0,1),(1219,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'11354',10163,0,1),(1220,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'11358',10164,10159,15),(1221,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'11358',10171,0,1),(1222,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'11358',10163,0,1),(1223,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11361',10164,10159,255),(1224,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11361',10171,0,3),(1225,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11361',10163,0,3),(1226,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11382',10164,10159,255),(1227,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11382',10171,0,3),(1228,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11382',10163,0,3),(1229,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11390',10164,10159,255),(1230,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11390',10171,0,3),(1231,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11390',10163,0,3),(1232,10155,'com.liferay.portal.model.Layout',4,'11399',10164,10159,1023),(1233,10155,'com.liferay.portal.model.Layout',4,'11399',10171,0,19),(1234,10155,'com.liferay.portal.model.Layout',4,'11399',10163,0,1),(1235,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'11416',10164,10159,15),(1236,10155,'com.liferay.portlet.asset.model.AssetVocabulary',4,'11415',10164,10159,15),(1240,10155,'com.liferay.portal.model.LayoutSetPrototype',4,'11418',10164,10159,15),(1244,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11430',10164,10159,255),(1245,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11430',10171,0,3),(1246,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11430',10163,0,3),(1247,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11439',10164,10159,255),(1248,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11439',10171,0,3),(1249,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11439',10163,0,3),(1250,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11448',10164,10159,255),(1251,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11448',10171,0,3),(1252,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11448',10163,0,3),(1253,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11458',10164,10159,255),(1254,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11458',10171,0,3),(1255,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'11458',10163,0,3),(1256,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'11471',10164,10159,15),(1257,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'11471',10171,0,1),(1258,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMStructure',4,'11471',10163,0,1),(1259,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'11472',10164,10159,15),(1260,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'11472',10171,0,1),(1261,10155,'com.liferay.portlet.dynamicdatamapping.model.DDMTemplate',4,'11472',10163,0,1),(1262,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11487',10164,10159,255),(1263,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11487',10171,0,3),(1264,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11487',10163,0,3),(1265,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11496',10164,10159,255),(1266,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11496',10171,0,3),(1267,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11496',10163,0,3),(1268,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11504',10164,10159,255),(1269,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11504',10171,0,3),(1270,10155,'com.liferay.portlet.journal.model.JournalArticle',4,'11504',10163,0,3),(1271,10155,'com.liferay.portal.model.Layout',4,'11513',10164,10159,1023),(1272,10155,'com.liferay.portal.model.Layout',4,'11513',10171,0,19),(1273,10155,'com.liferay.portal.model.Layout',4,'11513',10163,0,1),(1702,10155,'33',4,'10643_LAYOUT_33',10164,0,63),(1703,10155,'82',4,'10643_LAYOUT_82',10164,0,31),(1704,10155,'82',4,'10643_LAYOUT_82',10165,0,1),(1705,10155,'33',4,'10643_LAYOUT_33',10165,0,1),(1706,10155,'82',4,'10643_LAYOUT_82',10163,0,1),(1707,10155,'33',4,'10643_LAYOUT_33',10163,0,1),(1708,10155,'com.liferay.portlet.blogs',4,'10202',10164,0,14),(1709,10155,'3',4,'10643_LAYOUT_3',10164,0,31),(1710,10155,'3',4,'10643_LAYOUT_3',10165,0,1),(1711,10155,'3',4,'10643_LAYOUT_3',10163,0,1),(1712,10155,'145',4,'10643_LAYOUT_145',10164,0,31),(1713,10155,'145',4,'10643_LAYOUT_145',10165,0,1),(1714,10155,'145',4,'10643_LAYOUT_145',10163,0,1),(1715,10155,'2_WAR_notificationsportlet',4,'10643_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(1716,10155,'2_WAR_notificationsportlet',4,'10643_LAYOUT_2_WAR_notificationsportlet',10165,0,1),(1717,10155,'2_WAR_notificationsportlet',4,'10643_LAYOUT_2_WAR_notificationsportlet',10163,0,1),(1718,10155,'49',4,'10643_LAYOUT_49',10164,0,31),(1719,10155,'49',4,'10643_LAYOUT_49',10165,0,1),(1720,10155,'49',4,'10643_LAYOUT_49',10163,0,1),(1901,10155,'tfcompanyportlet_WAR_adminportlet',1,'10155',10162,0,2),(1902,10155,'tfcompanyportlet_WAR_adminportlet',1,'10155',10163,0,2),(1903,10155,'tfcompanyportlet_WAR_adminportlet',1,'10155',10165,0,2),(1904,10155,'tfcompanyportlet_WAR_adminportlet',1,'10155',10166,0,2),(1905,10155,'tfcompanyportlet_WAR_tfadminportlet',1,'10155',10162,0,2),(1906,10155,'tfcompanyportlet_WAR_tfadminportlet',1,'10155',10163,0,2),(1907,10155,'tfcompanyportlet_WAR_tfadminportlet',1,'10155',10165,0,2),(1908,10155,'tfcompanyportlet_WAR_tfadminportlet',1,'10155',10166,0,2),(2001,10155,'tfdashboardportlet_WAR_adminportlet',1,'10155',10162,0,2),(2002,10155,'tfdashboardportlet_WAR_adminportlet',1,'10155',10163,0,2),(2003,10155,'tfdashboardportlet_WAR_adminportlet',1,'10155',10165,0,2),(2004,10155,'tfdashboardportlet_WAR_adminportlet',1,'10155',10166,0,2),(2005,10155,'tfdashboardportlet_WAR_tfdashboardportlet',1,'10155',10162,0,2),(2006,10155,'tfdashboardportlet_WAR_tfdashboardportlet',1,'10155',10163,0,2),(2007,10155,'tfdashboardportlet_WAR_tfdashboardportlet',1,'10155',10165,0,2),(2008,10155,'tfdashboardportlet_WAR_tfdashboardportlet',1,'10155',10166,0,2),(2033,10155,'tfpoportlet_WAR_tfpoportlet',1,'10155',10162,0,2),(2034,10155,'tfpoportlet_WAR_tfpoportlet',1,'10155',10163,0,2),(2035,10155,'tfpoportlet_WAR_tfpoportlet',1,'10155',10165,0,2),(2036,10155,'tfpoportlet_WAR_tfpoportlet',1,'10155',10166,0,2),(2401,10155,'com.liferay.portal.model.Layout',4,'12904',10164,10199,1023),(2402,10155,'com.liferay.portal.model.Layout',4,'12904',10171,0,19),(2405,10155,'com.liferay.portal.model.Layout',4,'12922',10164,10199,1023),(2406,10155,'com.liferay.portal.model.Layout',4,'12922',10171,0,19),(2407,10155,'com.liferay.portal.model.Layout',4,'12931',10164,10199,1023),(2408,10155,'com.liferay.portal.model.Layout',4,'12931',10171,0,19),(2409,10155,'145',4,'12904_LAYOUT_145',10164,0,31),(2410,10155,'145',4,'12904_LAYOUT_145',10171,0,1),(2411,10155,'2_WAR_notificationsportlet',4,'12904_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(2412,10155,'2_WAR_notificationsportlet',4,'12904_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(2419,10155,'145',4,'12922_LAYOUT_145',10164,0,31),(2420,10155,'145',4,'12922_LAYOUT_145',10171,0,1),(2421,10155,'2_WAR_notificationsportlet',4,'12922_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(2422,10155,'2_WAR_notificationsportlet',4,'12922_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(2423,10155,'tfdashboardportlet_WAR_tfdashboardportlet',4,'12922_LAYOUT_tfdashboardportlet_WAR_tfdashboardportlet',10164,0,31),(2424,10155,'tfdashboardportlet_WAR_tfdashboardportlet',4,'12922_LAYOUT_tfdashboardportlet_WAR_tfdashboardportlet',10171,0,1),(2425,10155,'145',4,'12931_LAYOUT_145',10164,0,31),(2426,10155,'145',4,'12931_LAYOUT_145',10171,0,1),(2427,10155,'2_WAR_notificationsportlet',4,'12931_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(2428,10155,'2_WAR_notificationsportlet',4,'12931_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(2429,10155,'tfpoportlet_WAR_tfpoportlet',4,'12931_LAYOUT_tfpoportlet_WAR_tfpoportlet',10164,0,31),(2430,10155,'tfpoportlet_WAR_tfpoportlet',4,'12931_LAYOUT_tfpoportlet_WAR_tfpoportlet',10171,0,1),(2501,10155,'com.liferay.portal.model.Layout',4,'13001',10164,10199,1023),(2502,10155,'com.liferay.portal.model.Layout',4,'13001',10171,0,19),(2503,10155,'com.liferay.portal.model.Layout',4,'13001',10163,0,1),(2504,10155,'145',4,'13001_LAYOUT_145',10164,0,31),(2505,10155,'145',4,'13001_LAYOUT_145',10171,0,1),(2506,10155,'145',4,'13001_LAYOUT_145',10163,0,1),(2507,10155,'2_WAR_notificationsportlet',4,'13001_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(2508,10155,'2_WAR_notificationsportlet',4,'13001_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(2509,10155,'2_WAR_notificationsportlet',4,'13001_LAYOUT_2_WAR_notificationsportlet',10163,0,1),(2601,10155,'86',4,'13001_LAYOUT_86',10164,0,31),(2602,10155,'86',4,'13001_LAYOUT_86',10171,0,1),(2603,10155,'86',4,'13001_LAYOUT_86',10163,0,1),(2701,10155,'com.liferay.portal.model.LayoutSetPrototype',4,'13201',10164,10159,15),(2705,10155,'com.liferay.portal.model.Layout',4,'13215',10164,10159,1023),(2706,10155,'com.liferay.portal.model.Layout',4,'13215',10171,0,19),(2707,10155,'com.liferay.portal.model.Layout',4,'13215',10163,0,1),(2708,10155,'58',4,'13001_LAYOUT_58',10164,0,31),(2709,10155,'58',4,'13001_LAYOUT_58',10171,0,1),(2710,10155,'58',4,'13001_LAYOUT_58',10163,0,1),(2711,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'13226',10164,10159,255),(2712,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'13226',10171,0,29),(2713,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'13226',10163,0,1),(2714,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'13227',10164,10199,255),(2715,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'13227',10171,0,29),(2716,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'13227',10163,0,1),(2717,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'13228',10164,10199,255),(2718,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'13228',10171,0,3),(2719,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'13228',10163,0,3),(2720,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'13233',10164,10199,255),(2721,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'13233',10171,0,29),(2722,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'13233',10163,0,1),(2723,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'13234',10164,10199,255),(2724,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'13234',10171,0,3),(2725,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'13234',10163,0,3),(2801,10155,'com.liferay.portal.model.Layout',4,'13304',10164,10199,1023),(2802,10155,'com.liferay.portal.model.Layout',4,'13304',10171,0,19),(2803,10155,'com.liferay.portal.model.Layout',4,'13304',10163,0,1),(2804,10155,'145',4,'13304_LAYOUT_145',10164,0,31),(2805,10155,'145',4,'13304_LAYOUT_145',10171,0,1),(2806,10155,'145',4,'13304_LAYOUT_145',10163,0,1),(2807,10155,'2_WAR_notificationsportlet',4,'13304_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(2808,10155,'2_WAR_notificationsportlet',4,'13304_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(2809,10155,'2_WAR_notificationsportlet',4,'13304_LAYOUT_2_WAR_notificationsportlet',10163,0,1),(2904,10155,'tfcompanyportlet_WAR_tfadminportlet',4,'12904_LAYOUT_tfcompanyportlet_WAR_tfadminportlet_INSTANCE_4SCNxO6HnzNS',10164,0,31),(2905,10155,'tfcompanyportlet_WAR_tfadminportlet',4,'12904_LAYOUT_tfcompanyportlet_WAR_tfadminportlet_INSTANCE_4SCNxO6HnzNS',10171,0,1),(3306,10155,'49',4,'12931_LAYOUT_49',10164,0,31),(3307,10155,'49',4,'12931_LAYOUT_49',10171,0,1),(3501,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14003',10164,10199,255),(3502,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14003',10171,0,29),(3503,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14003',10163,0,1),(3504,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'14004',10164,10199,255),(3505,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'14004',10171,0,3),(3506,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'14004',10163,0,3),(3507,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14008',10164,10199,255),(3508,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14008',10171,0,29),(3509,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14008',10163,0,1),(3510,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'14009',10164,10199,255),(3511,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'14009',10171,0,3),(3512,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'14009',10163,0,3),(3513,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14014',10164,10199,255),(3514,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14014',10171,0,29),(3515,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14014',10163,0,1),(3516,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'14015',10164,10199,255),(3517,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'14015',10171,0,3),(3518,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'14015',10163,0,3),(3601,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',1,'10155',10162,0,2),(3602,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',1,'10155',10163,0,2),(3603,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',1,'10155',10165,0,2),(3604,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',1,'10155',10166,0,2),(3605,10155,'com.liferay.portal.model.Layout',4,'14202',10164,10199,1023),(3606,10155,'com.liferay.portal.model.Layout',4,'14202',10171,0,19),(3607,10155,'145',4,'14202_LAYOUT_145',10164,0,31),(3608,10155,'145',4,'14202_LAYOUT_145',10171,0,1),(3609,10155,'2_WAR_notificationsportlet',4,'14202_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(3610,10155,'2_WAR_notificationsportlet',4,'14202_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(3611,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',4,'14202_LAYOUT_scfinvoiceportlet_WAR_scfinvoiceportlet',10164,0,31),(3612,10155,'scfinvoiceportlet_WAR_scfinvoiceportlet',4,'14202_LAYOUT_scfinvoiceportlet_WAR_scfinvoiceportlet',10171,0,1),(3701,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14301',10164,10199,255),(3702,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'14301',10171,0,29),(4001,10155,'com.liferay.portal.model.Layout',4,'14601',10164,10199,1023),(4002,10155,'com.liferay.portal.model.Layout',4,'14601',10171,0,19),(4003,10155,'145',4,'14601_LAYOUT_145',10164,0,31),(4004,10155,'145',4,'14601_LAYOUT_145',10171,0,1),(4005,10155,'2_WAR_notificationsportlet',4,'14601_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(4006,10155,'2_WAR_notificationsportlet',4,'14601_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(4007,10155,'scftradeportlet_WAR_scfinvoiceportlet',1,'10155',10162,0,2),(4008,10155,'scftradeportlet_WAR_scfinvoiceportlet',1,'10155',10163,0,2),(4009,10155,'scftradeportlet_WAR_scfinvoiceportlet',1,'10155',10165,0,2),(4010,10155,'scftradeportlet_WAR_scfinvoiceportlet',1,'10155',10166,0,2),(4011,10155,'scftradeportlet_WAR_scftradeportlet',1,'10155',10162,0,2),(4012,10155,'scftradeportlet_WAR_scftradeportlet',1,'10155',10163,0,2),(4013,10155,'scftradeportlet_WAR_scftradeportlet',1,'10155',10165,0,2),(4014,10155,'scftradeportlet_WAR_scftradeportlet',1,'10155',10166,0,2),(4015,10155,'scftradeportlet_WAR_scftradeportlet',4,'14601_LAYOUT_scftradeportlet_WAR_scftradeportlet',10164,0,31),(4016,10155,'scftradeportlet_WAR_scftradeportlet',4,'14601_LAYOUT_scftradeportlet_WAR_scftradeportlet',10171,0,1),(4601,10155,'49',4,'14202_LAYOUT_49',10164,0,31),(4602,10155,'49',4,'14202_LAYOUT_49',10171,0,1),(4701,10155,'49',4,'12904_LAYOUT_49',10164,0,31),(4702,10155,'49',4,'12904_LAYOUT_49',10171,0,1),(5001,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'15603',10164,10199,255),(5002,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'15603',10171,0,29),(5003,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'15603',10163,0,1),(5004,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'15604',10164,10199,255),(5005,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'15604',10171,0,3),(5006,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'15604',10163,0,3),(5007,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'15609',10164,10199,255),(5008,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'15609',10171,0,29),(5009,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'15609',10163,0,1),(5010,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'15610',10164,10199,255),(5011,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'15610',10171,0,3),(5012,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'15610',10163,0,3),(5201,10155,'145',4,'10637_LAYOUT_145',10164,0,31),(5202,10155,'145',4,'10637_LAYOUT_145',10165,0,1),(5203,10155,'2_WAR_notificationsportlet',4,'10637_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(5204,10155,'2_WAR_notificationsportlet',4,'10637_LAYOUT_2_WAR_notificationsportlet',10165,0,1),(5509,10155,'com.liferay.portlet.documentlibrary',4,'10182',10164,0,1023),(5510,10155,'com.liferay.portlet.documentlibrary',4,'10182',10171,0,331),(5511,10155,'com.liferay.portlet.documentlibrary',4,'10182',10163,0,1),(5516,10155,'49',4,'12922_LAYOUT_49',10164,0,31),(5517,10155,'49',4,'12922_LAYOUT_49',10171,0,1),(5601,10155,'49',4,'14601_LAYOUT_49',10164,0,31),(5602,10155,'49',4,'14601_LAYOUT_49',10171,0,1),(6201,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'17601',10164,10199,255),(6202,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'17601',10171,0,29),(6211,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'17705',10164,10199,255),(6212,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'17709',10164,10199,255),(6213,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'17723',10164,10199,255),(6214,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'17727',10164,10199,255),(6301,10155,'tfregistrationportlet_WAR_tfregistrationportlet',1,'10155',10162,0,2),(6302,10155,'tfregistrationportlet_WAR_tfregistrationportlet',1,'10155',10163,0,2),(6303,10155,'tfregistrationportlet_WAR_tfregistrationportlet',1,'10155',10165,0,2),(6304,10155,'tfregistrationportlet_WAR_tfregistrationportlet',1,'10155',10166,0,2),(6305,10155,'tfregistrationportlet_WAR_tfregistrationportlet',4,'13304_LAYOUT_tfregistrationportlet_WAR_tfregistrationportlet',10164,0,31),(6306,10155,'tfregistrationportlet_WAR_tfregistrationportlet',4,'13304_LAYOUT_tfregistrationportlet_WAR_tfregistrationportlet',10171,0,1),(6307,10155,'tfregistrationportlet_WAR_tfregistrationportlet',4,'13304_LAYOUT_tfregistrationportlet_WAR_tfregistrationportlet',10163,0,1),(6312,10155,'49',4,'13001_LAYOUT_49',10164,0,31),(6313,10155,'49',4,'13001_LAYOUT_49',10171,0,1),(6314,10155,'49',4,'13001_LAYOUT_49',10163,0,1),(6401,10155,'com.liferay.portal.model.Layout',4,'18001',10164,10199,1023),(6402,10155,'com.liferay.portal.model.Layout',4,'18001',10171,0,19),(6403,10155,'145',4,'18001_LAYOUT_145',10164,0,31),(6404,10155,'145',4,'18001_LAYOUT_145',10171,0,1),(6405,10155,'2_WAR_notificationsportlet',4,'18001_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(6406,10155,'2_WAR_notificationsportlet',4,'18001_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(6407,10155,'scfinvestorportlet_WAR_scfinvestorportlet',1,'10155',10162,0,2),(6408,10155,'scfinvestorportlet_WAR_scfinvestorportlet',1,'10155',10163,0,2),(6409,10155,'scfinvestorportlet_WAR_scfinvestorportlet',1,'10155',10165,0,2),(6410,10155,'scfinvestorportlet_WAR_scfinvestorportlet',1,'10155',10166,0,2),(6606,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'18324',10164,10199,255),(6607,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'18328',10164,10199,255),(6608,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'18342',10164,17001,255),(6609,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'18346',10164,17001,255),(6610,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'18360',10164,10199,255),(6611,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'18364',10164,10199,255),(6618,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'18405',10164,10199,255),(6619,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'18409',10164,10199,255),(6901,10155,'49',4,'18001_LAYOUT_49',10164,0,31),(6902,10155,'49',4,'18001_LAYOUT_49',10171,0,1),(7101,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'19181',10164,17001,255),(7102,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'19185',10164,17001,255),(7103,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'19199',10164,17001,255),(7104,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'19203',10164,17001,255),(7105,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'19217',10164,17001,255),(7106,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'19221',10164,17001,255),(7117,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'19275',10164,17001,255),(7118,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'19279',10164,17001,255),(7119,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'19294',10164,17001,255),(7120,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'19298',10164,17001,255),(7201,10155,'82',4,'10637_LAYOUT_82',10164,0,31),(7202,10155,'29',4,'10637_LAYOUT_29',10164,0,31),(7203,10155,'23',4,'10637_LAYOUT_23',10164,0,31),(7204,10155,'11',4,'10637_LAYOUT_11',10164,0,31),(7205,10155,'23',4,'10637_LAYOUT_23',10165,0,1),(7206,10155,'29',4,'10637_LAYOUT_29',10165,0,1),(7207,10155,'82',4,'10637_LAYOUT_82',10165,0,1),(7208,10155,'49',4,'10637_LAYOUT_49',10164,0,31),(7209,10155,'49',4,'10637_LAYOUT_49',10165,0,1),(7501,10155,'tfsettingsportlet_WAR_scfinvestorportlet',1,'10155',10162,0,2),(7502,10155,'tfsettingsportlet_WAR_scfinvestorportlet',1,'10155',10163,0,2),(7503,10155,'tfsettingsportlet_WAR_scfinvestorportlet',1,'10155',10165,0,2),(7504,10155,'tfsettingsportlet_WAR_scfinvestorportlet',1,'10155',10166,0,2),(7601,10155,'com.liferay.portal.model.Layout',4,'20001',10164,10199,1023),(7602,10155,'com.liferay.portal.model.Layout',4,'20001',10171,0,19),(7603,10155,'tfsettingsportlet_WAR_tfsettingsportlet',1,'10155',10162,0,2),(7604,10155,'tfsettingsportlet_WAR_tfsettingsportlet',1,'10155',10163,0,2),(7605,10155,'tfsettingsportlet_WAR_tfsettingsportlet',1,'10155',10165,0,2),(7606,10155,'tfsettingsportlet_WAR_tfsettingsportlet',1,'10155',10166,0,2),(7607,10155,'145',4,'20001_LAYOUT_145',10164,0,31),(7608,10155,'145',4,'20001_LAYOUT_145',10171,0,1),(7609,10155,'2_WAR_notificationsportlet',4,'20001_LAYOUT_2_WAR_notificationsportlet',10164,0,31),(7610,10155,'2_WAR_notificationsportlet',4,'20001_LAYOUT_2_WAR_notificationsportlet',10171,0,1),(7613,10155,'tfsettingsportlet_WAR_tfsettingsportlet',4,'20001_LAYOUT_tfsettingsportlet_WAR_tfsettingsportlet',10164,0,31),(7614,10155,'tfsettingsportlet_WAR_tfsettingsportlet',4,'20001_LAYOUT_tfsettingsportlet_WAR_tfsettingsportlet',10171,0,1),(7701,10155,'com.liferay.portal.model.User',4,'20301',10164,10159,31),(7702,10155,'com.liferay.portal.model.Layout',4,'20308',10164,20301,1023),(7703,10155,'com.liferay.portal.model.Layout',4,'20314',10164,20301,1023),(7704,10155,'com.liferay.portal.model.Layout',4,'20314',10165,0,19),(7705,10155,'com.liferay.portal.model.Layout',4,'20314',10163,0,1),(7706,10155,'scfinvestorportlet_WAR_scfinvestorportlet',4,'18001_LAYOUT_scfinvestorportlet_WAR_scfinvestorportlet',10164,0,31),(7707,10155,'scfinvestorportlet_WAR_scfinvestorportlet',4,'18001_LAYOUT_scfinvestorportlet_WAR_scfinvestorportlet',10171,0,1),(7801,10155,'com.liferay.portal.model.User',4,'20401',10164,10199,31),(7802,10155,'com.liferay.portal.model.Layout',4,'20408',10164,20401,1023),(7803,10155,'com.liferay.portal.model.Layout',4,'20414',10164,20401,1023),(7804,10155,'com.liferay.portal.model.Layout',4,'20414',10165,0,19),(7805,10155,'com.liferay.portal.model.Layout',4,'20414',10163,0,1),(7806,10155,'com.liferay.portal.model.User',4,'20421',10164,10199,31),(7807,10155,'com.liferay.portal.model.Layout',4,'20428',10164,20421,1023),(7808,10155,'com.liferay.portal.model.Layout',4,'20434',10164,20421,1023),(7809,10155,'com.liferay.portal.model.Layout',4,'20434',10165,0,19),(7810,10155,'com.liferay.portal.model.Layout',4,'20434',10163,0,1),(7811,10155,'com.liferay.portal.model.User',4,'20441',10164,10199,31),(7812,10155,'com.liferay.portal.model.Layout',4,'20448',10164,20441,1023),(7813,10155,'com.liferay.portal.model.Layout',4,'20454',10164,20441,1023),(7814,10155,'com.liferay.portal.model.Layout',4,'20454',10165,0,19),(7815,10155,'com.liferay.portal.model.Layout',4,'20454',10163,0,1),(7816,10155,'com.liferay.portal.model.User',4,'20461',10164,10159,31),(7817,10155,'com.liferay.portal.model.Layout',4,'20468',10164,20461,1023),(7818,10155,'com.liferay.portal.model.Layout',4,'20474',10164,20461,1023),(7819,10155,'com.liferay.portal.model.Layout',4,'20474',10165,0,19),(7820,10155,'com.liferay.portal.model.Layout',4,'20474',10163,0,1),(7823,10155,'com.liferay.portal.model.User',4,'20506',10164,10199,31),(7824,10155,'com.liferay.portal.model.Layout',4,'20513',10164,20506,1023),(7825,10155,'com.liferay.portal.model.Layout',4,'20519',10164,20506,1023),(7826,10155,'com.liferay.portal.model.Layout',4,'20519',10165,0,19),(7827,10155,'com.liferay.portal.model.Layout',4,'20519',10163,0,1),(7828,10155,'com.liferay.portal.model.User',4,'20527',10164,10199,31),(7829,10155,'com.liferay.portal.model.Layout',4,'20534',10164,20527,1023),(7830,10155,'com.liferay.portal.model.Layout',4,'20540',10164,20527,1023),(7831,10155,'com.liferay.portal.model.Layout',4,'20540',10165,0,19),(7832,10155,'com.liferay.portal.model.Layout',4,'20540',10163,0,1),(7833,10155,'com.liferay.portal.model.User',4,'20547',10164,10159,31),(7834,10155,'com.liferay.portal.model.Layout',4,'20554',10164,20547,1023),(7835,10155,'com.liferay.portal.model.Layout',4,'20560',10164,20547,1023),(7836,10155,'com.liferay.portal.model.Layout',4,'20560',10165,0,19),(7837,10155,'com.liferay.portal.model.Layout',4,'20560',10163,0,1),(7838,10155,'com.liferay.portal.model.User',4,'20567',10164,10199,31),(7839,10155,'com.liferay.portal.model.Layout',4,'20574',10164,20567,1023),(7840,10155,'com.liferay.portal.model.Layout',4,'20580',10164,20567,1023),(7841,10155,'com.liferay.portal.model.Layout',4,'20580',10165,0,19),(7842,10155,'com.liferay.portal.model.Layout',4,'20580',10163,0,1),(7901,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'20603',10164,10199,255),(7902,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'20603',10171,0,29),(7903,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'20603',10163,0,1),(7904,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'20604',10164,10199,255),(7905,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'20604',10171,0,3),(7906,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'20604',10163,0,3),(7907,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'20609',10164,10199,255),(7908,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'20609',10171,0,29),(7909,10155,'com.liferay.portlet.documentlibrary.model.DLFolder',4,'20609',10163,0,1),(7910,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'20610',10164,10199,255),(7911,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'20610',10171,0,3),(7912,10155,'com.liferay.portlet.documentlibrary.model.DLFileEntry',4,'20610',10163,0,3);

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

insert  into `role_`(`uuid_`,`roleId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`classNameId`,`classPK`,`name`,`title`,`description`,`type_`,`subtype`) values ('e08bf5c1-0160-4f23-929d-2f19e193252d',10162,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10162,'Administrator','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Administrators are super users who can do anything.</Description></root>',1,''),('202df018-09a3-4f49-8595-fdc193195978',10163,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10163,'Guest','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Unauthenticated users always have this role.</Description></root>',1,''),('0c166f62-c881-4ffd-9dcd-612cb65092cb',10164,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10164,'Owner','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">This is an implied role with respect to the objects users create.</Description></root>',1,''),('62c2e97f-7aa8-48ac-8ccc-9ab12bd3176a',10165,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10165,'Power User','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Power Users have their own personal site.</Description></root>',1,''),('447000ea-f960-4fec-a014-2d303259c879',10166,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10166,'User','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Authenticated users should be assigned this role.</Description></root>',1,''),('3df5e86f-1485-4dab-aaf1-b0dc545a6d4e',10167,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10167,'Organization Administrator','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Organization Administrators are super users of their organization but cannot make other users into Organization Administrators.</Description></root>',3,''),('80a6820c-ea09-431d-8ca2-f9d6f1dd4912',10168,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10168,'Organization Owner','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Organization Owners are super users of their organization and can assign organization roles to users.</Description></root>',3,''),('de6f8d26-0699-4ed7-809a-2aab065b67ea',10169,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10169,'Organization User','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">All users who belong to an organization have this role within that organization.</Description></root>',3,''),('a1691294-e281-44da-8912-9b3457e6d838',10170,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10170,'Site Administrator','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Site Administrators are super users of their site but cannot make other users into Site Administrators.</Description></root>',2,''),('45e64855-eba2-4e34-b17d-2021167f36df',10171,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10171,'Site Member','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">All users who belong to a site have this role within that site.</Description></root>',2,''),('d7e7d613-ddc2-415d-aa9b-3ffcf967b70d',10172,10155,10159,'','2015-07-17 19:13:39','2015-07-17 19:13:39',10004,10172,'Site Owner','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Site Owners are super users of their site and can assign site roles to users.</Description></root>',2,''),('3b078b4f-a5e4-47ed-b4be-dc48fa79c3d3',10485,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10',10004,10485,'Organization Content Reviewer','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Autogenerated role from workflow definition</Description></root>',3,''),('67369a48-2520-4f70-9723-1e9d0f289ace',10487,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10',10004,10487,'Site Content Reviewer','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Autogenerated role from workflow definition</Description></root>',2,''),('7a135686-f96f-4ddf-9a0c-403885c77624',10489,10155,10159,'','2015-07-17 19:16:10','2015-07-17 19:16:10',10004,10489,'Portal Content Reviewer','','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Autogenerated role from workflow definition</Description></root>',1,''),('1312d9ac-ea81-4265-981e-593c2d62d1a5',19825,10155,10159,'','2016-01-07 05:45:48','2016-01-07 05:45:48',10004,19825,'Primary Investor Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Primary Investor Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Primary Investor Admin</Description></root>',1,''),('45f39c97-7c38-4c65-a0d9-f932244d013f',19826,10155,10159,'','2016-01-07 05:45:48','2016-01-07 05:45:48',10004,19826,'Secondary Investor Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Secondary Investor Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Secondary Investor Admin</Description></root>',1,''),('355da471-6009-4bb4-902f-93542cbe9938',19827,10155,10159,'','2016-01-07 05:45:48','2016-01-07 05:45:48',10004,19827,'SCF Company Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">SCF Company Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">SCF Company Admin</Description></root>',1,''),('91745f6b-ac5f-49b6-9bdb-065854cdf92e',19828,10155,10159,'','2016-01-07 05:45:48','2016-01-07 05:45:48',10004,19828,'SCF Company User','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">SCF Company User</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">SCF Company User</Description></root>',1,''),('e748d227-f588-46c5-85cc-39a41d80f671',19829,10155,10159,'','2016-01-07 05:45:48','2016-01-07 05:45:48',10004,19829,'Seller Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Seller Admin</Description></root>',1,''),('c3c39772-29ae-4db6-a829-ee75226d7ab5',19830,10155,10159,'','2016-01-07 05:45:48','2016-01-07 05:45:48',10004,19830,'Seller User','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">Seller User</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">Seller User</Description></root>',1,''),('01542c85-6062-484e-810f-57e50645441f',19831,10155,10159,'','2016-01-07 05:45:48','2016-01-07 05:45:48',10004,19831,'WhiteHall Admin','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">WhiteHall Admin</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">WhiteHall Admin</Description></root>',1,''),('5d995083-3425-482b-b3c8-174fb8cc05a3',19832,10155,10159,'','2016-01-07 05:45:49','2016-01-07 05:45:49',10004,19832,'WhiteHall User','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Title language-id=\"en_US\">WhiteHall User</Title></root>','<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\"en_US\" default-locale=\"en_US\"><Description language-id=\"en_US\">WhiteHall User</Description></root>',1,'');

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
  `due_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `trade_id` bigint(20) DEFAULT NULL,
  `invoice_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `invoice_number_UNIQUE` (`invoice_number`),
  KEY `FK6FCD3004FF6B5E3D` (`scf_company`),
  KEY `FK6FCD30041C0F51D8` (`trade_id`),
  KEY `FK6FCD300479F0FF06` (`invoice_id`),
  CONSTRAINT `FK6FCD30041C0F51D8` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`),
  CONSTRAINT `FK6FCD300479F0FF06` FOREIGN KEY (`invoice_id`) REFERENCES `scf_invoice` (`id`),
  CONSTRAINT `FK6FCD3004FF6B5E3D` FOREIGN KEY (`scf_company`) REFERENCES `tf_company` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `scf_invoice` */

insert  into `scf_invoice`(`id`,`invoice_number`,`invoice_date`,`seller_company_registration_number`,`seller_company_vat_number`,`invoice_amout`,`vat_amount`,`invoice_desc`,`duration`,`payment_date`,`currency`,`scf_company`,`due_date`,`status`,`trade_id`,`invoice_id`) values (1,1001,'2016-01-01','04619040','VAT04619040',50000,50000,'Morrosons Invoice',60,'2016-03-24','GBP',24,'2016-03-01','New',NULL,NULL),(2,1002,'2016-01-30','04619040','VAT04619040',100000,100000,'Morrisons ',60,'2016-03-24','GBP',24,'2016-03-25','TRADE_GENERATED',10,NULL),(3,1003,'2016-01-31','01836534','VAT01836534',100000,100000,'Tesco Invoice',60,'2016-03-28','GBP',25,'2016-03-29','New',NULL,NULL);

/*Table structure for table `scf_invoice_company` */

DROP TABLE IF EXISTS `scf_invoice_company`;

CREATE TABLE `scf_invoice_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `scf_invoice_company` */

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
  `invoice_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `document_id_UNIQUE` (`document_id`),
  KEY `FKD5F096F6FF6B5E3D` (`scf_company`),
  KEY `FKD5F096F679F0FF06` (`invoice_id`),
  CONSTRAINT `FKD5F096F679F0FF06` FOREIGN KEY (`invoice_id`) REFERENCES `scf_invoice` (`id`),
  CONSTRAINT `FKD5F096F6FF6B5E3D` FOREIGN KEY (`scf_company`) REFERENCES `tf_company` (`idcompany`)
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
  `status` varchar(50) DEFAULT NULL,
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
  `investor_total_gross_profit` decimal(10,4) DEFAULT NULL,
  `whitehall_total_share` decimal(10,4) DEFAULT NULL,
  `investor_total_net_profit` decimal(10,4) DEFAULT NULL,
  `seller_fees` decimal(10,4) DEFAULT NULL,
  `whitehall_total_profit` decimal(10,4) DEFAULT NULL,
  `whitehall_net_receivable` decimal(10,4) DEFAULT NULL,
  `seller_net_allotment` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK834227FB9946BD06` (`company_id`),
  CONSTRAINT `FK834227FB9946BD06` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `scf_trade` */

insert  into `scf_trade`(`id`,`scf_trade`,`duration`,`closing_date`,`opening_date`,`investor_Payment_date`,`Seller_Payment_date`,`trade_amount`,`status`,`company_id`,`trade_notes`,`trade_settled`,`want_to_insure`,`insurance_doc_id`,`insurance_doc_name`,`insurance_doc_url`,`insurance_doc_type`,`promisory_note`,`create_date`,`update_date`,`investor_total_gross_profit`,`whitehall_total_share`,`investor_total_net_profit`,`seller_fees`,`whitehall_total_profit`,`whitehall_net_receivable`,`seller_net_allotment`) values (10,NULL,60,'2016-03-28','2016-01-24','2016-03-25','2016-01-25',100000,'Live',24,'Finance requested by Supplier',0,0,NULL,NULL,NULL,NULL,NULL,'2016-01-24',NULL,657.5360,65.7536,591.7824,1200.0000,1265.7536,1265.7536,98142.4640);

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

insert  into `servicecomponent`(`serviceComponentId`,`buildNamespace`,`buildNumber`,`buildDate`,`data_`) values (10438,'Marketplace',3,1371580382539,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table Marketplace_App (\n	uuid_ VARCHAR(75) null,\n	appId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	remoteAppId LONG,\n	title VARCHAR(75) null,\n	description STRING null,\n	category VARCHAR(75) null,\n	iconURL STRING null,\n	version VARCHAR(75) null\n);\n\ncreate table Marketplace_Module (\n	uuid_ VARCHAR(75) null,\n	moduleId LONG not null primary key,\n	appId LONG,\n	contextName VARCHAR(75) null\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_94A7EF25 on Marketplace_App (category);\ncreate index IX_865B7BD5 on Marketplace_App (companyId);\ncreate index IX_20F14D93 on Marketplace_App (remoteAppId);\ncreate index IX_3E667FE1 on Marketplace_App (uuid_);\ncreate index IX_A7807DA7 on Marketplace_App (uuid_, companyId);\n\ncreate index IX_7DC16D26 on Marketplace_Module (appId);\ncreate index IX_C6938724 on Marketplace_Module (appId, contextName);\ncreate index IX_F2F1E964 on Marketplace_Module (contextName);\ncreate index IX_A7EFD80E on Marketplace_Module (uuid_);]]></indexes-sql>\n</data>'),(10446,'Calendar',2,1397685647889,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table Calendar (\n	uuid_ VARCHAR(75) null,\n	calendarId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	resourceBlockId LONG,\n	calendarResourceId LONG,\n	name STRING null,\n	description STRING null,\n	color INTEGER,\n	defaultCalendar BOOLEAN,\n	enableComments BOOLEAN,\n	enableRatings BOOLEAN\n);\n\ncreate table CalendarBooking (\n	uuid_ VARCHAR(75) null,\n	calendarBookingId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	resourceBlockId LONG,\n	calendarId LONG,\n	calendarResourceId LONG,\n	parentCalendarBookingId LONG,\n	title STRING null,\n	description TEXT null,\n	location STRING null,\n	startTime LONG,\n	endTime LONG,\n	allDay BOOLEAN,\n	recurrence STRING null,\n	firstReminder LONG,\n	firstReminderType VARCHAR(75) null,\n	secondReminder LONG,\n	secondReminderType VARCHAR(75) null,\n	status INTEGER,\n	statusByUserId LONG,\n	statusByUserName VARCHAR(75) null,\n	statusDate DATE null\n);\n\ncreate table CalendarNotificationTemplate (\n	uuid_ VARCHAR(75) null,\n	calendarNotificationTemplateId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	calendarId LONG,\n	notificationType VARCHAR(75) null,\n	notificationTypeSettings VARCHAR(75) null,\n	notificationTemplateType VARCHAR(75) null,\n	subject VARCHAR(75) null,\n	body TEXT null\n);\n\ncreate table CalendarResource (\n	uuid_ VARCHAR(75) null,\n	calendarResourceId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	resourceBlockId LONG,\n	classNameId LONG,\n	classPK LONG,\n	classUuid VARCHAR(75) null,\n	code_ VARCHAR(75) null,\n	name STRING null,\n	description STRING null,\n	active_ BOOLEAN\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_B53EB0E1 on Calendar (groupId, calendarResourceId);\ncreate index IX_97FC174E on Calendar (groupId, calendarResourceId, defaultCalendar);\ncreate index IX_F0FAF226 on Calendar (resourceBlockId);\ncreate index IX_96C8590 on Calendar (uuid_);\ncreate index IX_97656498 on Calendar (uuid_, companyId);\ncreate unique index IX_3AE311A on Calendar (uuid_, groupId);\n\ncreate index IX_D300DFCE on CalendarBooking (calendarId);\ncreate unique index IX_113A264E on CalendarBooking (calendarId, parentCalendarBookingId);\ncreate index IX_470170B4 on CalendarBooking (calendarId, status);\ncreate index IX_B198FFC on CalendarBooking (calendarResourceId);\ncreate index IX_57EBF55B on CalendarBooking (parentCalendarBookingId);\ncreate index IX_F7B8A941 on CalendarBooking (parentCalendarBookingId, status);\ncreate index IX_22DFDB49 on CalendarBooking (resourceBlockId);\ncreate index IX_F6E8EE73 on CalendarBooking (uuid_);\ncreate index IX_A21D9FD5 on CalendarBooking (uuid_, companyId);\ncreate unique index IX_F4C61797 on CalendarBooking (uuid_, groupId);\n\ncreate index IX_A412E5B6 on CalendarNotificationTemplate (calendarId);\ncreate index IX_7727A482 on CalendarNotificationTemplate (calendarId, notificationType, notificationTemplateType);\ncreate index IX_A2D4D78B on CalendarNotificationTemplate (uuid_);\ncreate index IX_4D7D97BD on CalendarNotificationTemplate (uuid_, companyId);\ncreate unique index IX_4012E97F on CalendarNotificationTemplate (uuid_, groupId);\n\ncreate index IX_76DDD0F7 on CalendarResource (active_);\ncreate unique index IX_16A12327 on CalendarResource (classNameId, classPK);\ncreate index IX_4470A59D on CalendarResource (companyId, code_, active_);\ncreate index IX_2C5184D4 on CalendarResource (companyId, name, active_);\ncreate index IX_1243D698 on CalendarResource (groupId);\ncreate index IX_40678371 on CalendarResource (groupId, active_);\ncreate index IX_55C2F8AA on CalendarResource (groupId, code_);\ncreate index IX_B9EA8C92 on CalendarResource (groupId, name, active_);\ncreate index IX_8BCB4D38 on CalendarResource (resourceBlockId);\ncreate index IX_150E2F22 on CalendarResource (uuid_);\ncreate index IX_56A06BC6 on CalendarResource (uuid_, companyId);\ncreate unique index IX_4ABD2BC8 on CalendarResource (uuid_, groupId);]]></indexes-sql>\n</data>'),(10465,'Kaleo',6,1378393571274,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table KaleoAction (\n	kaleoActionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoNodeName VARCHAR(200) null,\n	name VARCHAR(200) null,\n	description STRING null,\n	executionType VARCHAR(20) null,\n	script TEXT null,\n	scriptLanguage VARCHAR(75) null,\n	scriptRequiredContexts STRING null,\n	priority INTEGER\n);\n\ncreate table KaleoCondition (\n	kaleoConditionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	script TEXT null,\n	scriptLanguage VARCHAR(75) null,\n	scriptRequiredContexts VARCHAR(75) null\n);\n\ncreate table KaleoDefinition (\n	kaleoDefinitionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(200) null,\n	title STRING null,\n	description STRING null,\n	content TEXT null,\n	version INTEGER,\n	active_ BOOLEAN,\n	startKaleoNodeId LONG\n);\n\ncreate table KaleoInstance (\n	kaleoInstanceId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoDefinitionName VARCHAR(200) null,\n	kaleoDefinitionVersion INTEGER,\n	rootKaleoInstanceTokenId LONG,\n	className VARCHAR(200) null,\n	classPK LONG,\n	completed BOOLEAN,\n	completionDate DATE null,\n	workflowContext TEXT null\n);\n\ncreate table KaleoInstanceToken (\n	kaleoInstanceTokenId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	parentKaleoInstanceTokenId LONG,\n	currentKaleoNodeId LONG,\n	currentKaleoNodeName VARCHAR(200) null,\n	className VARCHAR(200) null,\n	classPK LONG,\n	completed BOOLEAN,\n	completionDate DATE null\n);\n\ncreate table KaleoLog (\n	kaleoLogId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskInstanceTokenId LONG,\n	kaleoNodeName VARCHAR(200) null,\n	terminalKaleoNode BOOLEAN,\n	kaleoActionId LONG,\n	kaleoActionName VARCHAR(200) null,\n	kaleoActionDescription STRING null,\n	previousKaleoNodeId LONG,\n	previousKaleoNodeName VARCHAR(200) null,\n	previousAssigneeClassName VARCHAR(200) null,\n	previousAssigneeClassPK LONG,\n	currentAssigneeClassName VARCHAR(200) null,\n	currentAssigneeClassPK LONG,\n	type_ VARCHAR(50) null,\n	comment_ TEXT null,\n	startDate DATE null,\n	endDate DATE null,\n	duration LONG,\n	workflowContext TEXT null\n);\n\ncreate table KaleoNode (\n	kaleoNodeId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	name VARCHAR(200) null,\n	metadata STRING null,\n	description STRING null,\n	type_ VARCHAR(20) null,\n	initial_ BOOLEAN,\n	terminal BOOLEAN\n);\n\ncreate table KaleoNotification (\n	kaleoNotificationId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoNodeName VARCHAR(200) null,\n	name VARCHAR(200) null,\n	description STRING null,\n	executionType VARCHAR(20) null,\n	template TEXT null,\n	templateLanguage VARCHAR(75) null,\n	notificationTypes VARCHAR(25) null\n);\n\ncreate table KaleoNotificationRecipient (\n	kaleoNotificationRecipientId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNotificationId LONG,\n	recipientClassName VARCHAR(200) null,\n	recipientClassPK LONG,\n	recipientRoleType INTEGER,\n	address VARCHAR(255) null\n);\n\ncreate table KaleoTask (\n	kaleoTaskId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	name VARCHAR(200) null,\n	description STRING null\n);\n\ncreate table KaleoTaskAssignment (\n	kaleoTaskAssignmentId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	assigneeClassName VARCHAR(200) null,\n	assigneeClassPK LONG,\n	assigneeActionId VARCHAR(75) null,\n	assigneeScript TEXT null,\n	assigneeScriptLanguage VARCHAR(75) null,\n	assigneeScriptRequiredContexts VARCHAR(75) null\n);\n\ncreate table KaleoTaskAssignmentInstance (\n	kaleoTaskAssignmentInstanceId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskInstanceTokenId LONG,\n	kaleoTaskId LONG,\n	kaleoTaskName VARCHAR(200) null,\n	assigneeClassName VARCHAR(200) null,\n	assigneeClassPK LONG,\n	completed BOOLEAN,\n	completionDate DATE null\n);\n\ncreate table KaleoTaskInstanceToken (\n	kaleoTaskInstanceTokenId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskId LONG,\n	kaleoTaskName VARCHAR(200) null,\n	className VARCHAR(200) null,\n	classPK LONG,\n	completionUserId LONG,\n	completed BOOLEAN,\n	completionDate DATE null,\n	dueDate DATE null,\n	workflowContext TEXT null\n);\n\ncreate table KaleoTimer (\n	kaleoTimerId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	name VARCHAR(75) null,\n	blocking BOOLEAN,\n	description STRING null,\n	duration DOUBLE,\n	scale VARCHAR(75) null,\n	recurrenceDuration DOUBLE,\n	recurrenceScale VARCHAR(75) null\n);\n\ncreate table KaleoTimerInstanceToken (\n	kaleoTimerInstanceTokenId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoClassName VARCHAR(200) null,\n	kaleoClassPK LONG,\n	kaleoDefinitionId LONG,\n	kaleoInstanceId LONG,\n	kaleoInstanceTokenId LONG,\n	kaleoTaskInstanceTokenId LONG,\n	kaleoTimerId LONG,\n	kaleoTimerName VARCHAR(200) null,\n	blocking BOOLEAN,\n	completionUserId LONG,\n	completed BOOLEAN,\n	completionDate DATE null,\n	workflowContext TEXT null\n);\n\ncreate table KaleoTransition (\n	kaleoTransitionId LONG not null primary key,\n	groupId LONG,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(200) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	kaleoDefinitionId LONG,\n	kaleoNodeId LONG,\n	name VARCHAR(200) null,\n	description STRING null,\n	sourceKaleoNodeId LONG,\n	sourceKaleoNodeName VARCHAR(200) null,\n	targetKaleoNodeId LONG,\n	targetKaleoNodeName VARCHAR(200) null,\n	defaultTransition BOOLEAN\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_50E9112C on KaleoAction (companyId);\ncreate index IX_170EFD7A on KaleoAction (kaleoClassName, kaleoClassPK);\ncreate index IX_4B2545E8 on KaleoAction (kaleoClassName, kaleoClassPK, executionType);\ncreate index IX_F95A622 on KaleoAction (kaleoDefinitionId);\n\ncreate index IX_FEE46067 on KaleoCondition (companyId);\ncreate index IX_DC978A5D on KaleoCondition (kaleoDefinitionId);\ncreate index IX_86CBD4C on KaleoCondition (kaleoNodeId);\n\ncreate index IX_40B9112F on KaleoDefinition (companyId);\ncreate index IX_408542BA on KaleoDefinition (companyId, active_);\ncreate index IX_76C781AE on KaleoDefinition (companyId, name);\ncreate index IX_4C23F11B on KaleoDefinition (companyId, name, active_);\ncreate index IX_EC14F81A on KaleoDefinition (companyId, name, version);\n\ncreate index IX_5F2FCD2D on KaleoInstance (companyId);\ncreate index IX_BF5839F8 on KaleoInstance (companyId, kaleoDefinitionName, kaleoDefinitionVersion, completionDate);\ncreate index IX_4DA4D123 on KaleoInstance (kaleoDefinitionId);\ncreate index IX_ACF16238 on KaleoInstance (kaleoDefinitionId, completed);\n\ncreate index IX_153721BE on KaleoInstanceToken (companyId);\ncreate index IX_4A86923B on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId);\ncreate index IX_360D34D9 on KaleoInstanceToken (companyId, parentKaleoInstanceTokenId, completionDate);\ncreate index IX_7BDB04B4 on KaleoInstanceToken (kaleoDefinitionId);\ncreate index IX_F42AAFF6 on KaleoInstanceToken (kaleoInstanceId);\n\ncreate index IX_73B5F4DE on KaleoLog (companyId);\ncreate index IX_E66A153A on KaleoLog (kaleoClassName, kaleoClassPK, kaleoInstanceTokenId, type_);\ncreate index IX_6C64B7D4 on KaleoLog (kaleoDefinitionId);\ncreate index IX_5BC6AB16 on KaleoLog (kaleoInstanceId);\ncreate index IX_470B9FF8 on KaleoLog (kaleoInstanceTokenId, type_);\ncreate index IX_B0CDCA38 on KaleoLog (kaleoTaskInstanceTokenId);\n\ncreate index IX_C4E9ACE0 on KaleoNode (companyId);\ncreate index IX_F28C443E on KaleoNode (companyId, kaleoDefinitionId);\ncreate index IX_32E94DD6 on KaleoNode (kaleoDefinitionId);\n\ncreate index IX_38829497 on KaleoNotification (companyId);\ncreate index IX_902D342F on KaleoNotification (kaleoClassName, kaleoClassPK);\ncreate index IX_F3362E93 on KaleoNotification (kaleoClassName, kaleoClassPK, executionType);\ncreate index IX_4B968E8D on KaleoNotification (kaleoDefinitionId);\n\ncreate index IX_2C8C4AF4 on KaleoNotificationRecipient (companyId);\ncreate index IX_AA6697EA on KaleoNotificationRecipient (kaleoDefinitionId);\ncreate index IX_7F4FED02 on KaleoNotificationRecipient (kaleoNotificationId);\n\ncreate index IX_E1F8B23D on KaleoTask (companyId);\ncreate index IX_3FFA633 on KaleoTask (kaleoDefinitionId);\ncreate index IX_77B3F1A2 on KaleoTask (kaleoNodeId);\n\ncreate index IX_611732B0 on KaleoTaskAssignment (companyId);\ncreate index IX_D835C576 on KaleoTaskAssignment (kaleoClassName, kaleoClassPK);\ncreate index IX_1087068E on KaleoTaskAssignment (kaleoClassName, kaleoClassPK, assigneeClassName);\ncreate index IX_575C03A6 on KaleoTaskAssignment (kaleoDefinitionId);\n\ncreate index IX_6E3CDA1B on KaleoTaskAssignmentInstance (companyId);\ncreate index IX_C851011 on KaleoTaskAssignmentInstance (kaleoDefinitionId);\ncreate index IX_67A9EE93 on KaleoTaskAssignmentInstance (kaleoInstanceId);\ncreate index IX_D4C2235B on KaleoTaskAssignmentInstance (kaleoTaskInstanceTokenId);\n\ncreate index IX_997FE723 on KaleoTaskInstanceToken (companyId);\ncreate index IX_608E9519 on KaleoTaskInstanceToken (kaleoDefinitionId);\ncreate index IX_2CE1159B on KaleoTaskInstanceToken (kaleoInstanceId);\ncreate index IX_B857A115 on KaleoTaskInstanceToken (kaleoInstanceId, kaleoTaskId);\n\ncreate index IX_4DE6A889 on KaleoTimer (kaleoClassName, kaleoClassPK);\ncreate index IX_1A479F32 on KaleoTimer (kaleoClassName, kaleoClassPK, blocking);\n\ncreate index IX_DB96C55B on KaleoTimerInstanceToken (kaleoInstanceId);\ncreate index IX_DB279423 on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed);\ncreate index IX_9932524C on KaleoTimerInstanceToken (kaleoInstanceTokenId, completed, blocking);\ncreate index IX_13A5BA2C on KaleoTimerInstanceToken (kaleoInstanceTokenId, kaleoTimerId);\n\ncreate index IX_41D6C6D on KaleoTransition (companyId);\ncreate index IX_479F3063 on KaleoTransition (kaleoDefinitionId);\ncreate index IX_A392DFD2 on KaleoTransition (kaleoNodeId);\ncreate index IX_A38E2194 on KaleoTransition (kaleoNodeId, defaultTransition);\ncreate index IX_85268A11 on KaleoTransition (kaleoNodeId, name);]]></indexes-sql>\n</data>'),(10472,'Notification',1,1409250476826,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table Notifications_UserNotificationEvent (\n	notificationEventId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userNotificationEventId LONG,\n	timestamp LONG,\n	delivered BOOLEAN,\n	actionRequired BOOLEAN,\n	archived BOOLEAN\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_93C52776 on Notifications_UserNotificationEvent (userId, actionRequired);\ncreate index IX_36E5AE4C on Notifications_UserNotificationEvent (userId, actionRequired, archived);\ncreate index IX_73C065F0 on Notifications_UserNotificationEvent (userId, delivered, actionRequired);\ncreate unique index IX_DC9FCEDC on Notifications_UserNotificationEvent (userNotificationEventId);]]></indexes-sql>\n</data>'),(10503,'OpenSocial',4,1343264401607,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table OpenSocial_Gadget (\n	uuid_ VARCHAR(75) null,\n	gadgetId LONG not null primary key,\n	companyId LONG,\n	createDate DATE null,\n	modifiedDate DATE null,\n	name VARCHAR(75) null,\n	url STRING null,\n	portletCategoryNames STRING null\n);\n\ncreate table OpenSocial_OAuthConsumer (\n	oAuthConsumerId LONG not null primary key,\n	companyId LONG,\n	createDate DATE null,\n	modifiedDate DATE null,\n	gadgetKey VARCHAR(75) null,\n	serviceName VARCHAR(75) null,\n	consumerKey VARCHAR(75) null,\n	consumerSecret TEXT null,\n	keyType VARCHAR(75) null\n);\n\ncreate table OpenSocial_OAuthToken (\n	oAuthTokenId LONG not null primary key,\n	companyId LONG,\n	userId LONG,\n	userName VARCHAR(75) null,\n	createDate DATE null,\n	modifiedDate DATE null,\n	gadgetKey VARCHAR(75) null,\n	serviceName VARCHAR(75) null,\n	moduleId LONG,\n	accessToken VARCHAR(75) null,\n	tokenName VARCHAR(75) null,\n	tokenSecret VARCHAR(75) null,\n	sessionHandle VARCHAR(75) null,\n	expiration LONG\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_729869EE on OpenSocial_Gadget (companyId);\ncreate unique index IX_A6A89EB1 on OpenSocial_Gadget (companyId, url);\ncreate index IX_E1F8627A on OpenSocial_Gadget (uuid_);\ncreate index IX_3C79316E on OpenSocial_Gadget (uuid_, companyId);\n\ncreate index IX_47206618 on OpenSocial_OAuthConsumer (gadgetKey);\ncreate index IX_8E715BF8 on OpenSocial_OAuthConsumer (gadgetKey, serviceName);\n\ncreate index IX_6C8CCC3D on OpenSocial_OAuthToken (gadgetKey, serviceName);\ncreate index IX_CDD35402 on OpenSocial_OAuthToken (userId, gadgetKey, serviceName, moduleId, tokenName);]]></indexes-sql>\n</data>'),(10511,'Sync',1,1368486568278,'<?xml version=\"1.0\"?>\n\n<data>\n	<tables-sql><![CDATA[create table SyncDLObject (\n	objectId LONG not null primary key,\n	companyId LONG,\n	createTime LONG,\n	modifiedTime LONG,\n	repositoryId LONG,\n	parentFolderId LONG,\n	name VARCHAR(255) null,\n	extension VARCHAR(75) null,\n	mimeType VARCHAR(75) null,\n	description STRING null,\n	changeLog VARCHAR(75) null,\n	extraSettings TEXT null,\n	version VARCHAR(75) null,\n	size_ LONG,\n	checksum VARCHAR(75) null,\n	event VARCHAR(75) null,\n	lockExpirationDate DATE null,\n	lockUserId LONG,\n	lockUserName VARCHAR(75) null,\n	type_ VARCHAR(75) null,\n	typePK LONG,\n	typeUuid VARCHAR(75) null\n);]]></tables-sql>\n	<sequences-sql><![CDATA[]]></sequences-sql>\n	<indexes-sql><![CDATA[create index IX_7F996123 on SyncDLObject (companyId, modifiedTime, repositoryId);\ncreate unique index IX_69ADEDD1 on SyncDLObject (typePK);]]></indexes-sql>\n</data>');

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

insert  into `socialactivity`(`activityId`,`groupId`,`companyId`,`userId`,`createDate`,`activitySetId`,`mirrorActivityId`,`classNameId`,`classPK`,`parentClassNameId`,`parentClassPK`,`type_`,`extraData`,`receiverUserId`) values (7,10182,10155,10159,1437160606541,0,0,10109,10617,0,0,1,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"en_US\\\" default-locale=\\\"en_US\\\"><Title language-id=\\\"en_US\\\">Welcome<\\/Title><\\/root>\"}',0),(8,10182,10155,10159,1437160607117,0,0,10109,10617,0,0,1,'{\"title\":\"<?xml version=\'1.0\' encoding=\'UTF-8\'?><root available-locales=\\\"en_US\\\" default-locale=\\\"en_US\\\"><Title language-id=\\\"en_US\\\">Welcome<\\/Title><\\/root>\"}',0),(1909,10182,10155,10199,1445542147383,0,0,10011,17709,0,0,1,'{\"title\":\"faq_page (1).txt\"}',0),(1910,10182,10155,10199,1445543935221,0,0,10011,17727,0,0,1,'{\"title\":\"faq_page.txt\"}',0),(2001,10182,10155,10199,1446486861526,0,0,10011,18328,0,0,1,'{\"title\":\"Covering Letter.pdf\"}',0),(2003,10182,10155,10199,1446488254409,0,0,10011,18364,0,0,1,'{\"title\":\"Covering Letter.pdf\"}',0),(2004,10182,10155,10199,1446490215197,0,0,10011,18409,0,0,1,'{\"title\":\"Covering Letter.pdf\"}',0);

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

insert  into `syncdlobject`(`objectId`,`companyId`,`createTime`,`modifiedTime`,`repositoryId`,`parentFolderId`,`name`,`extension`,`mimeType`,`description`,`changeLog`,`extraSettings`,`version`,`size_`,`checksum`,`event`,`lockExpirationDate`,`lockUserId`,`lockUserName`,`type_`,`typePK`,`typeUuid`) values (10548,10155,1437160598239,1445200433460,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',10528,'fe61b92a-a4c2-44c1-8eee-01330676a3fa'),(10552,10155,1437160599130,1445200433355,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',10538,'213673b0-9472-4b10-a197-d12b5330e83b'),(10566,10155,1437160599892,1445200432913,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',10553,'61e6077f-9a5f-4461-93d5-3b9e23ba60f1'),(10580,10155,1437160601435,1445200429237,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',10567,'78329b1b-5b0c-407a-b88b-af04ab5a55d6'),(10594,10155,1437160604330,1445200433210,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',10581,'34d5c4df-8382-411f-bd0f-28cba857293a'),(10608,10155,1437160604926,1445200433018,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',10595,'4c5802b9-0fcc-418c-a104-3495ead558ca'),(11343,10155,1438628679195,1438628679195,11305,0,'morgueFile-1','jpg','image/jpeg','','','','1.0',77763,'WldbzSVFG7cR5WVNhx4r5LBvuA4=','add',NULL,0,'','file',11316,'f26143e4-1fa9-4e30-b484-5fc753f54de8'),(11350,10155,1438628680286,1438628680286,11305,0,'morgueFile-3','jpg','image/jpeg','','','','1.0',37409,'MKwQwk58jXQ5Pp0Ubv8VAd9+RuM=','add',NULL,0,'','file',11325,'d9f97505-a9ca-463c-9e00-5ddfb60686f8'),(11351,10155,1438628680685,1438628680685,11305,0,'morgueFile-4','jpg','image/jpeg','','','','1.0',84859,'4gBrGm94e7isfwxdoH53zHO7EFs=','add',NULL,0,'','file',11333,'9af34929-943e-48ab-91c6-9e7c4dce3947'),(11352,10155,1438628681122,1438628681122,11305,0,'morgueFile-2','jpg','image/jpeg','','','','1.0',79041,'LfSOpUKIDiwLbpNBYbqOONzxj94=','add',NULL,0,'','file',11341,'0a03c7b0-34e0-40e1-962f-39463d080ecf'),(11446,10155,1438630469674,1438630469674,11419,0,'morgueFile-1','jpg','image/jpeg','','','','1.0',77763,'WldbzSVFG7cR5WVNhx4r5LBvuA4=','add',NULL,0,'','file',11430,'5c89cc37-3bf3-4ab6-b198-adc2068635aa'),(11450,10155,1438630471174,1438630471174,11419,0,'morgueFile-3','jpg','image/jpeg','','','','1.0',37409,'MKwQwk58jXQ5Pp0Ubv8VAd9+RuM=','add',NULL,0,'','file',11439,'205151c9-6e58-4b54-b93a-53b8a2d647ea'),(11457,10155,1438630471453,1438630471453,11419,0,'morgueFile-4','jpg','image/jpeg','','','','1.0',84859,'4gBrGm94e7isfwxdoH53zHO7EFs=','add',NULL,0,'','file',11448,'6febbec9-0fe4-4b55-b45c-4a8dcbe26572'),(11466,10155,1438630472133,1438630472133,11419,0,'morgueFile-2','jpg','image/jpeg','','','','1.0',79041,'LfSOpUKIDiwLbpNBYbqOONzxj94=','add',NULL,0,'','file',11458,'5353ab35-d820-4999-a108-4dd57f38c73b'),(12106,10155,1438885775366,1445200432748,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',12103,'8e23860b-c81d-4c57-8d5f-c075427d5851'),(12704,10155,1439327195481,1445200431307,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',12701,'941f6aff-2fcc-4ea4-b24b-0fc49b1b0cf5'),(12708,10155,1439329671452,1445200431825,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',12705,'212dc5a5-b0f6-4c1c-8911-50773005c9c9'),(12719,10155,1439329676422,1445200431587,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',12709,'dc4c186f-2672-4f19-a5c3-aa09aa1db267'),(12805,10155,1439404379077,1445200432202,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',12802,'41416abb-30de-4236-b534-9d3ee4512967'),(12815,10155,1439404381058,1445200431963,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',12806,'a46c937e-12af-446c-9118-ff2d5e512bef'),(13904,10155,1440104447783,1445200432650,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',13901,'5fcf5e04-d395-4ecf-8ee5-68b35affa1a0'),(13914,10155,1440104449295,1445200432336,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',13905,'b2777762-b260-4bfa-99f9-bd74678e2ab1'),(13925,10155,1440104450824,1445200432476,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',13915,'9b56de55-8c36-4d04-8628-3faaf5532427'),(14304,10155,1440857161659,1440857161659,10182,0,'Invoices','','','Invoices','','','-1',0,'','add',NULL,0,'','folder',14301,'c2672da9-7afe-45a3-a442-1ec31cd56bdb'),(14410,10155,1440880401566,1441775562719,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',14401,'ba61de40-0366-4bb7-966f-39335e8135fa'),(14517,10155,1440943663871,1441775643127,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',14508,'96853045-5fc2-4b2b-a02a-dc5abb71956f'),(14537,10155,1440943984709,1441775647671,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',14528,'830e2bc3-9386-4713-9681-05858d2e1d28'),(14716,10155,1441134810236,1441775659442,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',14707,'61148bfa-5964-4254-8b0b-ee226d56a860'),(14816,10155,1441312255021,1441775663003,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',14807,'2f0e0e2d-06b2-4c82-a7fc-6f2714a774c1'),(14951,10155,1441775690098,1441821638932,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',14942,'30e4e19b-efde-4712-9628-406105d7e0cd'),(15023,10155,1441821714353,1442087525008,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',15014,'9e342cd0-6d92-481a-91a1-85c78b5f3211'),(15210,10155,1441913048958,1442087529873,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',15201,'d59c808b-3e88-47d4-b856-26b0f0e173fe'),(15410,10155,1442092668639,1442498016568,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',15401,'ef01de37-eb37-43fd-be5b-eaf3cdda92dd'),(15418,10155,1442094042696,1442498021895,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',15415,'f3dcdf88-863d-4c21-96c6-c3e4eea76713'),(15428,10155,1442094043063,1442498021606,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',15419,'4e7abef6-d286-4562-b3b9-5669f10523d6'),(15436,10155,1442094161941,1442498025507,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',15433,'9459d22b-63b7-4425-a552-5703881329a1'),(15446,10155,1442094162108,1442498025452,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',15437,'28aa750f-b790-4224-bfff-452e65076946'),(15504,10155,1442156228579,1442498029332,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',15501,'5b54a6f2-4a1e-48c7-8a05-3e458f7b59c4'),(15514,10155,1442156230788,1442498029286,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',15505,'966a1fd5-3d3e-4a76-bb79-3e5267fc611f'),(16057,10155,1442498010069,1445200432822,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',16054,'6dbb7fda-0a2e-480b-abde-2d030635375e'),(16122,10155,1442500082682,1451237348887,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',16119,'abcb3e06-74d6-459b-8936-67a63c3f85f3'),(16132,10155,1442500083531,1451237348079,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',16123,'b967219e-72cb-428b-9282-0a657fe398a2'),(16205,10155,1442502166165,1451237354871,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',16202,'e6dad12d-ca80-44bb-aaa0-fc02ecf744df'),(16215,10155,1442502166962,1451237354809,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',16206,'14422d9d-1404-4d4e-9912-0d992bb09503'),(16366,10155,1442517403055,1451237359924,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',16363,'c57b37ed-9ec3-49d9-9de5-89b1ed22d632'),(16376,10155,1442517403908,1451237359872,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',16367,'595c54c4-dfdf-42c0-b17c-7fe18cac5cb3'),(16385,10155,1442519351233,1451237367401,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',16382,'5e3008bb-a2f2-4fc6-b35c-3dd2f6e243ce'),(16395,10155,1442519351434,1451237367346,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',16386,'f39d2e5d-d14a-42dd-9e4d-c07aefba5745'),(17304,10155,1444850295056,1451237372459,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17301,'663e8913-3da3-4bb3-a40e-04504233070e'),(17314,10155,1444850296508,1451237372395,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',17305,'391b19d5-1fe0-4ff5-ab4d-d2ef53490526'),(17343,10155,1444852687745,1451237377260,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17340,'1ab72679-c8da-4264-84ae-81d3aae63e09'),(17353,10155,1444852688010,1451237377127,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',17344,'dd425b44-57cd-4fe1-b241-bfbf36803986'),(17361,10155,1444852845320,1451237381913,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17358,'0b5bc5c4-3805-4772-9e15-33d1ce3fecd7'),(17371,10155,1444852845495,1451237381849,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',17362,'f47eb82f-8457-45f1-bfcd-043288b9b3ab'),(17379,10155,1444853757374,1451237385762,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17376,'4ab7f482-3b4e-425c-89be-984a8b5a355a'),(17389,10155,1444853757809,1451237385704,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',17380,'c3ca637c-d6bf-4c2b-b7f6-50b0e608db97'),(17604,10155,1445535596136,1445535596136,10182,0,'Insurance','','','Insurance','','','-1',0,'','add',NULL,0,'','folder',17601,'0d2c49d1-6c21-4f8f-bfef-d284949fdcc7'),(17608,10155,1445539806264,1445541278089,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17605,'efb32c28-d575-433e-8636-75d7e88f5608'),(17612,10155,1445540020020,1445541301893,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17609,'b871e2cc-53c5-4c90-a16c-2b2537d99be9'),(17621,10155,1445540175133,1445541284022,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17618,'4716cadd-a491-4068-a122-59af519f15de'),(17625,10155,1445540269404,1445541289363,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17622,'4076f8d0-852e-4f5b-a500-1a2c302a209b'),(17629,10155,1445540711990,1445541297008,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17626,'2f546eae-1ab5-40bd-b157-220475471658'),(17639,10155,1445540713541,1445541296965,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',17630,'fc2aab24-96d2-497b-b5dd-f34e0922cf1e'),(17647,10155,1445540979998,1445541293290,10182,0,'','','','','','','',0,'','delete',NULL,0,'','folder',17644,'96ec1a21-b82a-4f83-bd52-88dc565155a3'),(17657,10155,1445540981637,1445541293066,10182,0,'','','','','','','',0,'','delete',NULL,0,'','file',17648,'bff665df-25fb-4cf1-b9e9-7c80edc9ad1e'),(17708,10155,1445542146029,1445542146029,10182,17601,'10','','','Trade Insurance Folder','','','-1',0,'','add',NULL,0,'','folder',17705,'377dd1cc-4c75-4d30-8295-b987640ab475'),(17718,10155,1445542147751,1445542147751,10182,17705,'faq_page (1).txt','txt','text/plain','faq_page (1).txt','upload','','1.0',85,'955R4Lwz+06Xquv+649ztGPCeUE=','add',NULL,0,'','file',17709,'f0f9261c-f936-4d55-8bd7-c439181af63b'),(17726,10155,1445543935133,1445543935133,10182,17601,'11','','','Trade Insurance Folder','','','-1',0,'','add',NULL,0,'','folder',17723,'cc8dbc70-da56-4c54-abd4-13ad1b7de62a'),(17736,10155,1445543935287,1445543935287,10182,17723,'faq_page.txt','txt','text/plain','faq_page.txt','upload','','1.0',85,'955R4Lwz+06Xquv+649ztGPCeUE=','add',NULL,0,'','file',17727,'2f1c5ccf-9a97-4064-9582-95f72f57800b'),(18327,10155,1446486861281,1446486861281,10182,17601,'12','','','Trade Insurance Folder','','','-1',0,'','add',NULL,0,'','folder',18324,'930f8558-2eb8-4b3d-867d-59a39753364a'),(18337,10155,1446486861754,1446486861754,10182,18324,'Covering Letter.pdf','pdf','application/pdf','Covering Letter.pdf','upload','','1.0',57939,'ug39LpzvnrHqiFUdbnmyby/yyUk=','add',NULL,0,'','file',18328,'59eba706-a80e-4067-a8b9-37a83f24aa3a'),(18345,10155,1446487708851,1446487708851,10182,17601,'13','','','Trade Insurance Folder','','','-1',0,'','add',NULL,0,'','folder',18342,'4d377d4f-aac6-4698-88bb-e6fcb641ed77'),(18355,10155,1446487709009,1446487709009,10182,18342,'Covering Letter.pdf','pdf','application/pdf','Covering Letter.pdf','upload','','1.0',57939,'ug39LpzvnrHqiFUdbnmyby/yyUk=','add',NULL,0,'','file',18346,'8f61a626-4e3b-4e06-ae6e-b16475d819c9'),(18363,10155,1446488254322,1446488254322,10182,17601,'14','','','Trade Insurance Folder','','','-1',0,'','add',NULL,0,'','folder',18360,'e7088430-15e2-4c76-8cb4-e2384b8e145e'),(18373,10155,1446488254467,1446488254467,10182,18360,'Covering Letter.pdf','pdf','application/pdf','Covering Letter.pdf','upload','','1.0',57939,'ug39LpzvnrHqiFUdbnmyby/yyUk=','add',NULL,0,'','file',18364,'7c49521f-b4af-4ee4-a8c7-0f715212f9c0'),(18408,10155,1446490215066,1446490215066,10182,17601,'15','','','Trade Insurance Folder','','','-1',0,'','add',NULL,0,'','folder',18405,'7e2440c2-ef73-45cc-ae3d-3465313ab952'),(18418,10155,1446490215380,1446490215380,10182,18405,'Covering Letter.pdf','pdf','application/pdf','Covering Letter.pdf','upload','','1.0',57939,'ug39LpzvnrHqiFUdbnmyby/yyUk=','add',NULL,0,'','file',18409,'4f099e3d-4255-4f58-83e4-a8daa0c33afc'),(19184,10155,1451237499915,1451237499915,10182,14301,'0','','','Invoices Document Folder','','','-1',0,'','add',NULL,0,'','folder',19181,'fe61fea1-a8de-44e6-bbdb-0dc460b92a2a'),(19194,10155,1451237500348,1451237500348,10182,19181,'WhiteHallOct.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','upload','','1.0',8609,'092de/9/fXVYIibOHe4D0sESUrc=','add',NULL,0,'','file',19185,'4976b1d8-0731-4404-9ce1-5ec520a71252'),(19202,10155,1451238085317,1451238085317,10182,14301,'1','','','Invoices Document Folder','','','-1',0,'','add',NULL,0,'','folder',19199,'31aa124f-713c-4439-aab2-a765a20fe8b6'),(19212,10155,1451238085581,1451238085581,10182,19199,'WhiteHallOct.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','upload','','1.0',8609,'092de/9/fXVYIibOHe4D0sESUrc=','add',NULL,0,'','file',19203,'1aa05a74-a0f8-4801-b3c1-967d3cb7c99d'),(19220,10155,1451239024729,1451239024729,10182,14301,'2','','','Invoices Document Folder','','','-1',0,'','add',NULL,0,'','folder',19217,'e40620ff-83a9-4fd2-9c42-760bbb35b015'),(19230,10155,1451239025332,1451239025332,10182,19217,'WhiteHallOct.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallOct.xlsx','upload','','1.0',8609,'092de/9/fXVYIibOHe4D0sESUrc=','add',NULL,0,'','file',19221,'372ebab2-d19d-4ecd-890b-524d47e80668'),(19278,10155,1451247757235,1451247757235,10182,14301,'3','','','Invoices Document Folder','','','-1',0,'','add',NULL,0,'','folder',19275,'832642d5-9261-4104-b28e-92ea383fc7a3'),(19288,10155,1451247757425,1451247757425,10182,19275,'WhiteHallDec.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','upload','','1.0',8670,'lW9v+wDebVWCaEK1ItSHjMUgB74=','add',NULL,0,'','file',19279,'026b9efb-b044-456c-b3b9-129746e700d6'),(19297,10155,1451248539447,1451248539447,10182,14301,'4','','','Invoices Document Folder','','','-1',0,'','add',NULL,0,'','folder',19294,'9036ac98-7ebb-453f-b718-8b77e23b5167'),(19307,10155,1451248539749,1451248539749,10182,19294,'WhiteHallDec.xlsx','xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','WhiteHallDec.xlsx','upload','','1.0',8670,'lW9v+wDebVWCaEK1ItSHjMUgB74=','add',NULL,0,'','file',19298,'0d4ec121-4f11-4cba-94cb-7dfaf9e1a4f9');

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

insert  into `systemevent`(`systemEventId`,`groupId`,`companyId`,`userId`,`userName`,`createDate`,`classNameId`,`classPK`,`classUuid`,`referrerClassNameId`,`parentSystemEventId`,`systemEventSetKey`,`type_`,`extraData`) values (10515,10182,10155,0,'','2015-07-17 19:16:37',10102,10413,'bed67bac-bd1d-40c1-aa33-4a6034ed7188',10098,0,10516,1,''),(10517,10182,10155,0,'','2015-07-17 19:16:37',10102,10414,'f74bb2bc-205e-4966-bea6-53451ca3f7b6',10098,0,10518,1,''),(10519,10182,10155,0,'','2015-07-17 19:16:37',10102,10415,'553d6014-d045-4115-9abe-3573c388a77d',10098,0,10520,1,''),(10521,10182,10155,0,'','2015-07-17 19:16:37',10102,10416,'8642c519-39d7-4cdb-81fc-6aac840e283a',10098,0,10522,1,''),(10523,10182,10155,0,'','2015-07-17 19:16:37',10102,10417,'66574021-400e-44be-aab8-1001605aa2c9',10098,0,10524,1,''),(10525,10182,10155,0,'','2015-07-17 19:16:37',10102,10418,'cf04de7d-8e6a-44bd-9183-dffea1b48757',10098,0,10526,1,''),(11714,0,10155,10199,'Test Test','2015-08-04 21:28:14',10005,11703,'d56d4ce2-cbd5-49e7-b018-43f2e5e19204',0,0,11715,1,''),(11726,0,10155,10199,'Test Test','2015-08-04 21:30:02',10005,11716,'dde12c4d-fcd1-4bec-a90c-735e39687cee',0,0,11727,1,''),(11738,0,10155,10199,'Test Test','2015-08-04 21:34:02',10005,11728,'cc10fb85-d3e7-4d6f-ab3a-b0b528445260',0,0,11739,1,''),(11750,0,10155,10199,'Test Test','2015-08-04 21:36:48',10005,11740,'1fe620d8-009e-4afd-90e7-f9d0a2bb5666',0,0,11751,1,''),(11803,0,10155,10199,'Test Test','2015-08-04 21:48:25',10005,11752,'048a0be2-36c8-4b6d-be24-31150b59a50d',0,0,11804,1,''),(11816,0,10155,10199,'Test Test','2015-08-04 21:54:26',10005,11805,'958f3741-8a15-4876-8e37-884270f52c46',0,0,11817,1,''),(11837,0,10155,10199,'Test Test','2015-08-04 21:59:11',10005,11818,'6b2a9a85-7b64-4419-abde-f8513288e032',0,0,11838,1,''),(12011,0,10155,10199,'Test Test','2015-08-05 19:01:33',10005,11826,'83315bc6-41dc-4c62-99a4-95292ced4507',0,0,12012,1,''),(12019,0,10155,10199,'Test Test','2015-08-05 19:01:36',10005,11839,'47da14fc-bab6-44bd-b321-90ff2d5b9ee3',0,0,12020,1,''),(12023,0,10155,10199,'Test Test','2015-08-05 19:01:36',10005,12001,'6cc8feb3-65ad-46b1-beec-3f129cc39f7e',0,0,12024,1,''),(12237,0,10155,10199,'Test Test','2015-08-08 12:17:13',10005,12201,'f0bf8339-2d51-422c-bbf8-2f2ac2049401',0,0,12238,1,''),(12249,0,10155,10199,'Test Test','2015-08-08 12:26:13',10005,12239,'5e73ae6e-0312-40f6-8ef5-6f5621b361cc',0,0,12250,1,''),(12261,0,10155,10199,'Test Test','2015-08-08 13:10:43',10005,12251,'53f8a8fd-8687-483e-b5e6-0f3c023c239c',0,0,12262,1,''),(12311,0,10155,10199,'Test Test','2015-08-08 17:00:58',10005,12301,'5430290e-a52b-4662-a5f7-6c565d67776e',0,0,12312,1,''),(12323,0,10155,10199,'Test Test','2015-08-08 17:09:59',10005,12313,'848099d4-f11b-4d70-8ba6-71a21bde71d7',0,0,12324,1,''),(12336,0,10155,10199,'Test Test','2015-08-08 18:35:28',10005,12325,'611fa01c-16c3-42a1-a888-5f967d11b630',0,0,12337,1,''),(12902,10182,10155,10199,'Test Test','2015-08-13 19:57:08',10002,11101,'be6a9c74-8c80-4208-b5b4-048ed430afa6',0,0,12903,1,'{\"privateLayout\":\"false\"}'),(12911,10182,10155,10199,'Test Test','2015-08-13 19:57:29',10002,12504,'df73e71e-a45f-4396-8268-350f52e2d2b6',0,0,12912,1,'{\"privateLayout\":\"false\"}'),(12920,10182,10155,10199,'Test Test','2015-08-13 19:57:56',10002,12913,'2bd94e02-5845-49a8-8b5e-4eb4bb7c200f',0,0,12921,1,'{\"privateLayout\":\"true\"}'),(12929,10182,10155,10199,'Test Test','2015-08-13 19:58:17',10002,12519,'4bc4cea9-eb59-4b6d-9437-c77872908fe3',0,0,12930,1,'{\"privateLayout\":\"false\"}'),(13010,10182,10155,10199,'Test Test','2015-08-13 20:37:14',10002,10628,'82402fba-52e6-4dc9-800a-05953ef8186c',0,0,13011,1,'{\"privateLayout\":\"false\"}'),(13109,10182,10155,10199,'Test Test','2015-08-13 20:51:32',10002,13102,'b8d80bd4-9c3a-440b-82bd-76f6a76b2b0c',0,0,13110,1,'{\"privateLayout\":\"false\"}'),(13507,0,10155,10199,'Test Test','2015-08-16 19:51:13',10005,12338,'d2973d02-4043-4c8e-a5d0-e47e8304f9c2',0,0,13508,1,''),(13519,0,10155,10199,'Test Test','2015-08-16 20:19:26',10005,13509,'c247f697-393c-437b-8f14-d2756a134149',0,0,13520,1,''),(13534,0,10155,10199,'Test Test','2015-08-16 20:35:40',10005,13521,'e1263b78-44ae-42fb-99b9-29ba12d7cb30',0,0,13535,1,''),(13603,0,10155,10199,'Test Test','2015-08-17 19:45:42',10005,13536,'ef8e70b3-6684-46b3-ad15-e1e1fe7b88ad',0,0,13604,1,''),(13614,0,10155,10199,'Test Test','2015-08-17 19:59:39',10005,13605,'c35d3226-878d-4fe5-a2ee-18ac2ddc4efc',0,0,13615,1,''),(13625,0,10155,10199,'Test Test','2015-08-17 21:14:42',10005,13616,'34a65a3b-9cd1-4b24-b5fd-5f4106e54e76',0,0,13626,1,''),(13650,0,10155,0,'','2015-08-17 21:23:57',10004,13648,'3a1969a6-2cf7-4ca5-bbf6-c8c7372bb610',0,0,13651,1,''),(13707,0,10155,10199,'Test Test','2015-08-18 20:50:26',10005,13627,'df7f64a3-9825-4c62-82d8-de58af0e78b1',0,0,13708,1,''),(13718,0,10155,10199,'Test Test','2015-08-18 21:17:32',10005,13709,'fa2158d6-6ab3-4b09-8d2d-8f5a278a88b1',0,0,13719,1,''),(13729,0,10155,10199,'Test Test','2015-08-18 21:26:23',10005,13720,'90c18f7c-fd8a-4d61-a263-c5fc159b21e2',0,0,13730,1,''),(14909,10182,10155,10199,'Test Test','2015-09-09 05:12:42',10011,14401,'ba61de40-0366-4bb7-966f-39335e8135fa',0,0,14910,1,''),(14916,10182,10155,10199,'Test Test','2015-09-09 05:14:03',10011,14508,'96853045-5fc2-4b2b-a02a-dc5abb71956f',0,0,14917,1,''),(14923,10182,10155,10199,'Test Test','2015-09-09 05:14:07',10011,14528,'830e2bc3-9386-4713-9681-05858d2e1d28',0,0,14924,1,''),(14930,10182,10155,10199,'Test Test','2015-09-09 05:14:19',10011,14707,'61148bfa-5964-4254-8b0b-ee226d56a860',0,0,14931,1,''),(14936,10182,10155,10199,'Test Test','2015-09-09 05:14:23',10011,14807,'2f0e0e2d-06b2-4c82-a7fc-6f2714a774c1',0,0,14937,1,''),(15007,10182,10155,10199,'Test Test','2015-09-09 18:00:38',10011,14942,'30e4e19b-efde-4712-9628-406105d7e0cd',0,0,15008,1,''),(15313,10182,10155,10199,'Test Test','2015-09-12 19:52:05',10011,15014,'9e342cd0-6d92-481a-91a1-85c78b5f3211',0,0,15314,1,''),(15319,10182,10155,10199,'Test Test','2015-09-12 19:52:09',10011,15201,'d59c808b-3e88-47d4-b856-26b0f0e173fe',0,0,15320,1,''),(15703,0,10155,10199,'Test Test','2015-09-15 19:33:16',10005,10673,'93af8269-5ea2-402d-b32a-ea8be3d17397',0,0,15704,1,''),(15711,0,10155,10199,'Test Test','2015-09-15 19:33:18',10005,13801,'154ffbb9-9475-46b1-8be6-d5e8d2f52287',0,0,15712,1,''),(15715,0,10155,10199,'Test Test','2015-09-15 19:33:19',10005,13731,'d842d339-4141-45a9-9d15-af5c8730f2b4',0,0,15716,1,''),(15719,0,10155,10199,'Test Test','2015-09-15 19:33:20',10005,10684,'857e6ee3-48fb-4383-8289-b0eb2c4d1beb',0,0,15720,1,''),(16058,10182,10155,10199,'Test Test','2015-09-17 13:53:36',10011,15401,'ef01de37-eb37-43fd-be5b-eaf3cdda92dd',0,0,16059,1,''),(16065,10182,10155,10199,'Test Test','2015-09-17 13:53:41',10012,15415,'f3dcdf88-863d-4c21-96c6-c3e4eea76713',0,0,16067,1,''),(16069,10182,10155,10199,'Test Test','2015-09-17 13:53:45',10012,15433,'9459d22b-63b7-4425-a552-5703881329a1',0,0,16071,1,''),(16073,10182,10155,10199,'Test Test','2015-09-17 13:53:49',10012,15501,'5b54a6f2-4a1e-48c7-8a05-3e458f7b59c4',0,0,16075,1,''),(16086,0,10155,10199,'Test Test','2015-09-17 13:55:22',10005,15721,'1c357750-4614-4b09-8d1f-d96ac4491b2b',0,0,16087,1,''),(16117,0,10155,10199,'Test Test','2015-09-17 13:57:54',10005,16088,'e53d498e-a231-482c-b900-f489d61bb4e9',0,0,16118,1,''),(16903,0,10155,10199,'Gautam Sharma','2015-10-11 16:14:22',10005,16022,'e0b68216-70d1-4839-90a4-80a2d8099f13',0,0,16904,1,''),(16911,0,10155,10199,'Gautam Sharma','2015-10-11 16:14:24',10005,16400,'0a8fdb54-9c3c-4959-8bf4-76ff14ce3b66',0,0,16912,1,''),(16919,0,10155,10199,'Gautam Sharma','2015-10-11 16:14:24',10005,16001,'40290946-0208-49bd-98d5-bf097085dde8',0,0,16920,1,''),(17502,10182,10155,0,'','2015-10-18 20:33:49',10011,10567,'78329b1b-5b0c-407a-b88b-af04ab5a55d6',0,0,17503,1,''),(17509,10182,10155,0,'','2015-10-18 20:33:52',10012,12103,'8e23860b-c81d-4c57-8d5f-c075427d5851',0,0,17519,1,''),(17521,10182,10155,0,'','2015-10-18 20:33:52',10012,16054,'6dbb7fda-0a2e-480b-abde-2d030635375e',0,0,17523,1,''),(17525,10182,10155,0,'','2015-10-18 20:33:52',10011,10553,'61e6077f-9a5f-4461-93d5-3b9e23ba60f1',0,0,17526,1,''),(17532,10182,10155,0,'','2015-10-18 20:33:53',10011,10595,'4c5802b9-0fcc-418c-a104-3495ead558ca',0,0,17533,1,''),(17539,10182,10155,0,'','2015-10-18 20:33:53',10011,10581,'34d5c4df-8382-411f-bd0f-28cba857293a',0,0,17540,1,''),(17546,10182,10155,0,'','2015-10-18 20:33:53',10011,10538,'213673b0-9472-4b10-a197-d12b5330e83b',0,0,17547,1,''),(17553,10182,10155,0,'','2015-10-18 20:33:53',10011,10528,'fe61b92a-a4c2-44c1-8eee-01330676a3fa',0,0,17554,1,''),(17688,10182,10155,10199,'Gautam Sharma','2015-10-22 19:14:38',10012,17605,'efb32c28-d575-433e-8636-75d7e88f5608',0,0,17689,1,''),(17691,10182,10155,10199,'Gautam Sharma','2015-10-22 19:14:44',10012,17618,'4716cadd-a491-4068-a122-59af519f15de',0,0,17692,1,''),(17694,10182,10155,10199,'Gautam Sharma','2015-10-22 19:14:49',10012,17622,'4076f8d0-852e-4f5b-a500-1a2c302a209b',0,0,17695,1,''),(17697,10182,10155,10199,'Gautam Sharma','2015-10-22 19:14:53',10012,17644,'96ec1a21-b82a-4f83-bd52-88dc565155a3',0,0,17698,1,''),(17700,10182,10155,10199,'Gautam Sharma','2015-10-22 19:14:57',10012,17626,'2f546eae-1ab5-40bd-b157-220475471658',0,0,17701,1,''),(17703,10182,10155,10199,'Gautam Sharma','2015-10-22 19:15:01',10012,17609,'b871e2cc-53c5-4c90-a16c-2b2537d99be9',0,0,17704,1,''),(17813,0,10155,10199,'Gautam Sharma','2015-10-27 21:25:41',10005,17804,'5ff0249c-1893-4f99-8a6f-95da031cbac9',0,0,17814,1,''),(17824,0,10155,10199,'Gautam Sharma','2015-10-27 21:29:50',10005,17815,'5ada9e1f-f412-4ba7-91e4-6946c8b1974a',0,0,17825,1,''),(17852,0,10155,10199,'Gautam Sharma','2015-10-27 21:43:51',10005,17826,'30a893d6-a5bf-4475-8750-12f1ad9ff1e8',0,0,17853,1,''),(17880,0,10155,10199,'Gautam Sharma','2015-10-27 21:47:59',10005,17854,'026d5517-b511-47fa-b622-89183e742620',0,0,17881,1,''),(18008,10182,10155,10199,'Gautam Sharma','2015-10-31 19:33:29',10002,16301,'9901991d-8bd0-4700-9647-d5d0a9f55520',0,0,18009,1,'{\"privateLayout\":\"true\"}'),(18264,0,10155,10199,'Gautam Sharma','2015-11-02 17:09:07',10005,18255,'90cbb78f-e4d5-427e-96f0-d1aa963a89ce',0,0,18265,1,''),(18268,0,10155,10199,'Gautam Sharma','2015-11-02 17:09:09',10005,18245,'aef6ebb3-da51-423d-9776-7cc681a73ed5',0,0,18269,1,''),(18610,0,10155,10199,'Gautam Sharma','2015-11-10 20:47:51',10005,18601,'10997b8b-d79b-439e-be33-865e15dd5441',0,0,18611,1,''),(19150,10182,10155,10199,'Gautam Sharma','2015-12-27 17:29:08',10012,16119,'abcb3e06-74d6-459b-8936-67a63c3f85f3',0,0,19152,1,''),(19154,10182,10155,10199,'Gautam Sharma','2015-12-27 17:29:14',10012,16202,'e6dad12d-ca80-44bb-aaa0-fc02ecf744df',0,0,19156,1,''),(19158,10182,10155,10199,'Gautam Sharma','2015-12-27 17:29:19',10012,16363,'c57b37ed-9ec3-49d9-9de5-89b1ed22d632',0,0,19160,1,''),(19162,10182,10155,10199,'Gautam Sharma','2015-12-27 17:29:27',10012,16382,'5e3008bb-a2f2-4fc6-b35c-3dd2f6e243ce',0,0,19164,1,''),(19166,10182,10155,10199,'Gautam Sharma','2015-12-27 17:29:32',10012,17301,'663e8913-3da3-4bb3-a40e-04504233070e',0,0,19168,1,''),(19170,10182,10155,10199,'Gautam Sharma','2015-12-27 17:29:37',10012,17340,'1ab72679-c8da-4264-84ae-81d3aae63e09',0,0,19172,1,''),(19174,10182,10155,10199,'Gautam Sharma','2015-12-27 17:29:41',10012,17358,'0b5bc5c4-3805-4772-9e15-33d1ce3fecd7',0,0,19176,1,''),(19178,10182,10155,10199,'Gautam Sharma','2015-12-27 17:29:45',10012,17376,'4ab7f482-3b4e-425c-89be-984a8b5a355a',0,0,19180,1,''),(19508,0,10155,0,'','2016-01-02 19:16:24',10004,19505,'45816152-8c72-4567-9b85-ea3280ce1fa3',0,0,19509,1,''),(19603,0,10155,0,'','2016-01-04 16:03:11',10004,19601,'3a04c50a-b501-44aa-a7b6-6930c128477b',0,0,19604,1,''),(19802,0,10155,0,'','2016-01-07 04:02:51',10004,16501,'b1686a6e-acac-4238-b25e-399b88b4c59a',0,0,19803,1,''),(19805,0,10155,0,'','2016-01-07 04:02:57',10004,19510,'41763b46-5cdd-4ec3-9d2e-6d9dfd4c70a2',0,0,19806,1,''),(19808,0,10155,0,'','2016-01-07 04:03:03',10004,13652,'2f0ac13d-0c9a-46bb-b4fb-98fec5b54590',0,0,19809,1,''),(19811,0,10155,0,'','2016-01-07 04:03:09',10004,17803,'8dffbc2d-a660-436e-b768-6e953fb36da3',0,0,19812,1,''),(19814,0,10155,0,'','2016-01-07 04:03:15',10004,19504,'dc958bdc-8083-4f08-b81f-f62b85d88b25',0,0,19815,1,''),(19817,0,10155,0,'','2016-01-07 04:03:21',10004,19506,'10690e3e-d423-4461-ae20-c1a19ceb4a3c',0,0,19818,1,''),(19820,0,10155,0,'','2016-01-07 04:03:30',10004,19605,'11c54fa9-f959-4dcd-adcd-9a05a478332e',0,0,19821,1,''),(19823,0,10155,0,'','2016-01-07 04:03:35',10004,19606,'3616906c-c1e9-446a-8b0d-24bc4d57ebb5',0,0,19824,1,''),(20106,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:26',10005,18284,'3353de20-8b78-419f-a918-cdefc8151fd8',0,0,20107,1,''),(20110,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:27',10005,18277,'6c8661a3-dcde-40a8-b0ed-f4c42d7b7766',0,0,20111,1,''),(20114,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:28',10005,18398,'3f84f4de-248e-442c-821c-fb9ef9b3ef4d',0,0,20115,1,''),(20122,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:30',10005,17882,'39c6865f-2eef-4342-921e-6c343dfd6c6b',0,0,20123,1,''),(20130,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:30',10005,18201,'4e25ae83-853d-4fd1-bf39-4b1a7981e74f',0,0,20131,1,''),(20138,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:31',10005,18224,'a75c0f67-f1e1-4c04-a671-87825a9e84f0',0,0,20139,1,''),(20142,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:32',10005,18270,'68213606-3d26-4323-9832-6cbab0349c27',0,0,20143,1,''),(20150,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:33',10005,18378,'1ae0193b-3d0a-4329-a16c-aecc09b0bc5c',0,0,20151,1,''),(20158,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:34',10005,18612,'1623676d-3ffd-4c57-9bc8-4f582a2c5f23',0,0,20159,1,''),(20166,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:35',10005,18701,'024928db-7f2c-4a8e-9583-143b8499e777',0,0,20167,1,''),(20174,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:36',10005,17320,'5217a884-88ee-449d-92c4-0661418e9fca',0,0,20175,1,''),(20182,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:37',10005,17001,'47d54239-07ad-40d6-8d27-738f88f8dcdc',0,0,20183,1,''),(20190,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:38',10005,19235,'4646c7cc-c2a4-42e5-8be1-767210c25b00',0,0,20191,1,''),(20198,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:39',10005,18904,'425970a4-9427-42b2-9a2a-f0b0449b8163',0,0,20199,1,''),(20206,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:40',10005,19255,'a402c63c-e7cc-4e02-9c53-9afcf67bf463',0,0,20207,1,''),(20214,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:41',10005,18301,'3e831219-6c79-425f-8168-610eec214050',0,0,20215,1,''),(20218,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:41',10005,18015,'e9990151-d0db-4697-b7d1-34059aefc422',0,0,20219,1,''),(20222,0,10155,10199,'Gautam Sharma','2016-01-19 20:40:42',10005,19836,'5e4b5614-33cd-46c8-b5fd-6fe91e53cbbe',0,0,20223,1,''),(20337,0,10155,10199,'Gautam Sharma','2016-01-19 21:53:03',10005,20325,'bbf81542-87fa-4ec5-95d1-446e43d96f5f',0,0,20338,1,''),(20493,0,10155,10199,'Gautam Sharma','2016-01-23 19:39:45',10005,20481,'09b09963-4230-4f7c-a286-1932907573ee',0,0,20494,1,''),(20504,0,10155,10199,'Gautam Sharma','2016-01-23 19:42:46',10005,20495,'1d2d962f-6652-4f3e-923a-2a6aeb134ee7',0,0,20505,1,'');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

/*Data for the table `tf_address` */

insert  into `tf_address`(`id`,`idcompany`,`address_line_1`,`address_line_2`,`locality`,`region`,`country`,`postal_code`) values (18,20,'209 Station Lane','Hornchurch','Essex','London','United Kingdom','RM12 6LL'),(19,21,'Www.Buy-This-Company-Name.Com','Suite B, 29 Harley Street','London','London','United Kingdom','W1G 9QR'),(20,22,'1 Rosemont Road','','London','London','United Kingdom','NW3 6NG'),(21,23,'Lovat Bank','Silver Street','Newport Pagnell','Buckinghamshire','United Kingdom','MK16 0EJ'),(22,24,'17/20 Commercial Road','Swindon','Wiltshire','London','United Kingdom','SN1 5NR'),(23,25,'Tesco House','Delamare Road','Cheshunt','Hertfordshire','United Kingdom','EN8 9SL'),(24,26,'Asda House','South Bank','Great Wilson Street','Leeds','United Kingdom','LS11 5AD'),(25,27,'247 Clarendon Park Road','Leicester','','London','United Kingdom','LE2 3AN'),(26,28,'23 Heathland Road','London','','London','United Kingdom','N16 5PG');

/*Table structure for table `tf_allotments` */

DROP TABLE IF EXISTS `tf_allotments`;

CREATE TABLE `tf_allotments` (
  `allotment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trade_id` bigint(20) DEFAULT NULL,
  `investor_portfolio_id` bigint(20) DEFAULT NULL,
  `allotment_amount` decimal(10,4) DEFAULT NULL,
  `noofdays` int(11) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '1',
  `user_id` bigint(20) DEFAULT NULL,
  `market_discount` int(11) DEFAULT NULL,
  `investor_gross_profit` decimal(10,4) DEFAULT NULL,
  `whitehall_profit_share` decimal(10,4) DEFAULT NULL,
  `investor_net_profit` decimal(10,4) DEFAULT NULL,
  `allotment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`allotment_id`),
  UNIQUE KEY `allotment_id_UNIQUE` (`allotment_id`),
  KEY `fk_allotment_trade_id` (`trade_id`),
  KEY `fk_allotment_investor_portfolio_id` (`investor_portfolio_id`),
  KEY `fk_allotment_user_id` (`user_id`),
  CONSTRAINT `tf_allotments_ibfk_1` FOREIGN KEY (`trade_id`) REFERENCES `scf_trade` (`id`),
  CONSTRAINT `tf_allotments_ibfk_2` FOREIGN KEY (`investor_portfolio_id`) REFERENCES `tf_investor_portfolio` (`investor_portfolio_id`),
  CONSTRAINT `tf_allotments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tf_user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tf_allotments` */

insert  into `tf_allotments`(`allotment_id`,`trade_id`,`investor_portfolio_id`,`allotment_amount`,`noofdays`,`is_primary`,`user_id`,`market_discount`,`investor_gross_profit`,`whitehall_profit_share`,`investor_net_profit`,`allotment_date`) values (7,10,1,50000.0000,60,0,NULL,400,328.7680,32.8768,295.8912,'2016-01-24 19:18:56'),(8,10,4,50000.0000,60,0,NULL,400,328.7680,32.8768,295.8912,'2016-01-24 19:18:56');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `tf_bank_holiday` */

insert  into `tf_bank_holiday`(`id`,`date`,`day`,`Description`,`Year`) values (1,'2016-01-01','Friday','New Year’s Day',2016),(2,'2016-03-25','Friday','Good Friday',2016),(3,'2016-03-28','Monday','Easter Monday',2016),(4,'2016-05-02','Monday','Early May bank holiday',2016),(5,'2016-05-30','Monday','Spring bank holiday',2016),(6,'2016-08-29','Monday','Summer bank holiday',2016),(7,'2016-12-26','Monday','Boxing Day',2016),(8,'2016-12-27','Tuesday','Christmas Day (substitute day)',2016);

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
  `company_type` varchar(150) DEFAULT NULL,
  `sic_code` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idcompany`),
  UNIQUE KEY `name_UNIQUE` (`NAME`),
  UNIQUE KEY `regnumber_UNIQUE` (`regnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `tf_company` */

insert  into `tf_company`(`idcompany`,`NAME`,`altname`,`regnumber`,`addtrading`,`addregistered`,`dateestablished`,`website`,`telnumber`,`directors`,`shareholders`,`customers`,`accounts`,`jurisdiction`,`bustype`,`active_status`,`company_reference`,`OrganisationType`,`industryclassification`,`company_type`,`sic_code`) values (20,'HSBC LTD','','03688645',NULL,NULL,'1998-12-24','','235-254-5242','','','',NULL,'england-wales','','New','','ltd',NULL,'1',NULL),(21,'LLOYDS LTD','','05187659',NULL,NULL,'2004-07-23','','363-636-3636','','','',NULL,'england-wales','','New','','ltd',NULL,'1',NULL),(22,'BARCLAY LIMITED','','02763982',NULL,NULL,'1992-11-11','','452-452-5522','','','',NULL,'england-wales','','New','','ltd',NULL,'1',NULL),(23,'CITI LIMITED','','02775249',NULL,NULL,'1993-01-04','','363-636-3633','','','',NULL,'england-wales','','New','','ltd',NULL,'1',NULL),(24,'MORRISONS LIMITED','','02280567',NULL,NULL,'1988-07-26','','532-532-5325','','','',NULL,'england-wales','','New','','ltd',NULL,'5',NULL),(25,'TESCO (LONDON) LTD.','','00334737',NULL,NULL,'1937-12-15','','574-746-3464','','','',NULL,'england-wales','','New','','ltd',NULL,'5',NULL),(26,'ASDA GROUP LIMITED','','01396513',NULL,NULL,'1978-10-27','','624-242-4624','','','',NULL,'england-wales','','New','','ltd',NULL,'5',NULL),(27,'TROPICANA LIMITED','','04619040',NULL,NULL,'2002-12-17','','524-524-5245','','','',NULL,'england-wales','','New','','ltd',NULL,'4',NULL),(28,'STELLA LIMITED','','01836534',NULL,NULL,'1984-07-27','','134-374-3144','','','',NULL,'england-wales','','New','','ltd',NULL,'4',NULL);

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

/*Table structure for table `tf_investor` */

DROP TABLE IF EXISTS `tf_investor`;

CREATE TABLE `tf_investor` (
  `investor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `whitehall_share` decimal(5,0) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`investor_id`),
  UNIQUE KEY `investor_id_UNIQUE` (`investor_id`),
  KEY `fk_investor_company_idx` (`company_id`),
  CONSTRAINT `fk_investor_company` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `tf_investor` */

insert  into `tf_investor`(`investor_id`,`company_id`,`create_date`,`whitehall_share`,`update_date`) values (4,20,'2016-01-20',10,NULL),(5,21,'2016-01-20',10,NULL),(6,22,'2016-01-20',5,NULL),(7,23,'2016-01-20',5,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `tf_investor_portfolio` */

insert  into `tf_investor_portfolio`(`investor_portfolio_id`,`investor_id`,`investment_discount_rate`,`investor_status`,`investor_type`,`max_dicsount_rate`,`min_discount_rate`,`company_id`,`start_date`,`end_date`,`updated_by`,`available_to_invest`,`amount_invested`,`my_credit_line`,`current_credit_line`) values (1,4,400,0,NULL,600,400,24,'2016-01-24 13:44:15',NULL,'prinvestor1',150000,50000,200000,NULL),(2,4,400,0,NULL,600,400,25,'2016-01-24 13:44:15',NULL,'prinvestor1',100000,NULL,100000,NULL),(3,4,480,0,NULL,600,400,26,'2016-01-24 13:44:15',NULL,'prinvestor1',100000,NULL,100000,NULL),(4,5,400,0,NULL,600,400,24,'2016-01-24 13:45:36',NULL,'prinvestor2',150000,50000,200000,NULL),(5,5,400,0,NULL,600,400,25,'2016-01-24 13:45:36',NULL,'prinvestor2',200000,NULL,200000,NULL),(6,5,400,0,NULL,600,400,26,'2016-01-24 13:45:36',NULL,'prinvestor2',200000,NULL,200000,NULL);

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

/*Table structure for table `tf_officer` */

DROP TABLE IF EXISTS `tf_officer`;

CREATE TABLE `tf_officer` (
  `officer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `tf_officer` */

insert  into `tf_officer`(`officer_id`,`company_id`,`name`,`officer_role`,`appointed_on`,`resigned_on`,`country_of_residence`,`nationality`,`occupation`,`updated_on`,`iduser`) values (1,22,'SILVER, Jonathan Richard','secretary','2014-08-01',NULL,NULL,NULL,NULL,NULL,NULL),(2,22,'SILVER, Jonathan Richard','director','2010-09-20',NULL,NULL,'British','Company Director',NULL,NULL),(3,22,'CSQ (SERVICES) LIMITED','secretary','1993-11-11','1998-11-01',NULL,NULL,NULL,NULL,NULL),(4,22,'SILVER, Jonathan Richard','secretary','1998-11-01','2013-09-20',NULL,NULL,NULL,NULL,NULL),(5,22,'HAMPSHIRE, Anthony','director','2003-02-14','2003-02-17',NULL,'British','Sales Manager',NULL,NULL),(6,22,'LONDON HOMES LIMITED','corporate-director','1998-02-04','2010-11-11',NULL,NULL,NULL,NULL,NULL),(7,22,'SILVER, Jonathan Richard','director','1993-11-11','1998-02-04',NULL,'British','Solicitor',NULL,NULL),(8,22,'SILVER, Jonathan Richard','director','2003-02-14','2003-02-17',NULL,'British','Property',NULL,NULL),(9,25,'TESCO SECRETARIES LIMITED','corporate-secretary','2013-10-15',NULL,NULL,NULL,NULL,NULL,NULL),(10,25,'LLOYD, Jonathan Mark','director','2005-05-31',NULL,NULL,'British','Company Secretary',NULL,NULL),(11,25,'BAILEY, John Anthony','secretary','1995-10-09','1996-04-22',NULL,NULL,NULL,NULL,NULL),(12,25,'FIELD, Martin John','secretary','1992-06-07','1995-10-09',NULL,NULL,NULL,NULL,NULL),(13,25,'FIELD, Martin John','secretary','1996-04-22','2000-10-10',NULL,NULL,NULL,NULL,NULL),(14,25,'O\'KEEFE, Helen Jane','secretary','2004-08-31','2013-10-15',NULL,NULL,NULL,NULL,NULL),(15,25,'SANKAR, Nadine Amanda','secretary','2000-10-10','2004-08-31',NULL,NULL,NULL,NULL,NULL),(16,25,'AGER, Rowley Stuart','director','1992-06-07','2004-03-15',NULL,'British','Company Director',NULL,NULL),(17,25,'BAILEY, John Anthony','director','1997-01-30','2003-05-30',NULL,'British','Chartered Sec',NULL,NULL),(18,25,'FIELD, Martin John','director','2003-05-30','2005-05-31',NULL,'British','Chartered Secretary',NULL,NULL),(19,25,'HIGGINSON, Andrew Thomas','director','2003-05-30','2012-02-29',NULL,'British','Director',NULL,NULL),(20,25,'MACLAURIN, Ian Charter, Lord','director','1992-06-07','1997-01-30',NULL,'British','Director',NULL,NULL),(21,25,'NEVILLE-ROLFE, Lucy Jeanne','director','2004-03-15','2013-01-02',NULL,'British','Company Director',NULL,NULL),(22,25,'REID, David Edward','director','1992-06-07','2003-05-30',NULL,'British','Director',NULL,NULL),(23,25,'TESCO SERVICES LIMITED','corporate-director','2013-01-24','2013-12-19',NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `tf_officer_address` */

insert  into `tf_officer_address`(`id`,`officer_id`,`address_line_1`,`address_line_2`,`locality`,`region`,`country`,`postal_code`) values (1,1,'Rosemont Road',NULL,'London',NULL,'England','NW3 6NG'),(2,2,'Rosemont Road',NULL,'London',NULL,'England','NW3 6NG'),(3,3,'25 Harley Street',NULL,'London',NULL,NULL,'W1N 2BR'),(4,4,'Audley House','56 Kings Road','Richmond','Surrey',NULL,'TW10 6EP'),(5,5,'17 Montague Road',NULL,'Richmond','Surrey',NULL,'TW10 6QW'),(6,6,'56 Kings Road',NULL,'Richmond','Surrey','United Kingdom','TW10 6EP'),(7,7,'54 Castelnau','Barnes','London',NULL,NULL,'SW13 9EX'),(8,8,'Audley House','56 Kings Road','Richmond','Surrey',NULL,'TW10 6EP'),(9,9,'Delamare Road',NULL,'Cheshunt','Herts','United Kingdom','EN8 9SL'),(10,10,'New Tesco House','Delamare Road','Cheshunt','Hertfordshire',NULL,'EN8 9SL'),(11,11,'Games Road',NULL,'Barnet','Hertfordshire',NULL,'EN4 9HX'),(12,12,'1 Hole Farm Cottages','Albury Hall Park Albury','Ware','Hertfordshire',NULL,'SG11 2JE'),(13,13,'1 Hole Farm Cottages','Albury Hall Park Albury','Ware','Hertfordshire',NULL,'SG11 2JE'),(14,14,'New Tesco House','Delamare Road','Cheshunt','Hertfordshire',NULL,'EN8 9SL'),(15,15,'90 Ebury Road',NULL,'Watford',NULL,NULL,'WD17 2SB'),(16,16,'Tesco House','Delamare Road','Cheshunt','Hertfordshire',NULL,'EN8 9SL'),(17,17,'Games Road',NULL,'Barnet','Hertfordshire',NULL,'EN4 9HX'),(18,18,'42 Lygean Avenue',NULL,'Ware','Hertfordshire',NULL,'SG12 7AR'),(19,19,'New Tesco House','Delamare Road','Cheshunt','Hertfordshire',NULL,'EN8 9SL'),(20,20,'14 Great College Street','Westminster','London',NULL,NULL,'SW1P 3RX'),(21,21,'New Tesco House','Delamare Road','Cheshunt','Hertfordshire',NULL,'EN8 9SL'),(22,22,'New Tesco House','Delamare Road','Cheshunt','Hertfordshire',NULL,'EN8 9SL'),(23,23,'Delamare Road',NULL,'Cheshunt','Hertfordshire','United Kingdom','EN8 9SL');

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
  `trade_trade_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`purchase_order_id`),
  UNIQUE KEY `purchase_order_id_UNIQUE` (`purchase_order_id`),
  UNIQUE KEY `po_number_UNIQUE` (`po_number`),
  KEY `FK3728D7FD193E6AA6` (`trade_id`),
  KEY `FK3728D7FD221AFB21` (`trade_trade_id`),
  CONSTRAINT `FK3728D7FD193E6AA6` FOREIGN KEY (`trade_id`) REFERENCES `tf_trade` (`trade_id`),
  CONSTRAINT `FK3728D7FD221AFB21` FOREIGN KEY (`trade_trade_id`) REFERENCES `tf_trade` (`trade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tf_purchase_order` */

/*Table structure for table `tf_seller_setting` */

DROP TABLE IF EXISTS `tf_seller_setting`;

CREATE TABLE `tf_seller_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seller_transaction_fee` decimal(10,2) DEFAULT NULL,
  `seller_finance_fee` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tf_seller_setting` */

insert  into `tf_seller_setting`(`id`,`seller_transaction_fee`,`seller_finance_fee`) values (1,25.00,2.0000);

/*Table structure for table `tf_trade` */

DROP TABLE IF EXISTS `tf_trade`;

CREATE TABLE `tf_trade` (
  `trade_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `duration` int(11) DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `trade_amount` decimal(10,0) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
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
  `company_idcompany` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `iduser_UNIQUE` (`iduser`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_user_company_idx` (`company_id`),
  KEY `FKABD2CD783133FEA9` (`company_idcompany`),
  CONSTRAINT `FKABD2CD783133FEA9` FOREIGN KEY (`company_idcompany`) REFERENCES `tf_company` (`idcompany`),
  CONSTRAINT `fk_user_company` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_company_id` FOREIGN KEY (`company_id`) REFERENCES `tf_company` (`idcompany`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='User table';

/*Data for the table `tf_user` */

insert  into `tf_user`(`iduser`,`firstname`,`middlename`,`lastname`,`title`,`username`,`password`,`type`,`active`,`email`,`telwork`,`telmobile`,`level`,`diremail`,`dirname`,`reqdate`,`tcagree`,`dirconfirm`,`checksagree`,`memtype`,`updateflag`,`active_status`,`company_id`,`companydirector`,`liferay_user_id`,`company_idcompany`) values (22,'Primary','','Investor1','mr','prInvestor1',NULL,'Primary Investor Admin',0,'prInvestor1@whitehall.com',NULL,'343-353-5525','Dev',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,20,'Yes',20301,NULL),(23,'primary','','prInvestor2','Mr','prInvestor2',NULL,'Primary Investor Admin',0,'prInvestor2@whitehall.com',NULL,'235-235-2535','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,21,'secretary',20401,NULL),(24,'primary','','Investor3','Mr','prInvestor3',NULL,'Primary Investor Admin',0,'prInvestor3@whitehall.com',NULL,'254-256-2522','Company Director',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,22,'director',20421,NULL),(25,'primary','','Investor4','Mr','prInvestor4',NULL,'Primary Investor Admin',0,'prInvestor4@whitehall.com',NULL,'542-524-5245','Secretary',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,23,'secretary',20441,NULL),(26,'SCF','','Company1','Mr','scfcompany1',NULL,'SCF Company Admin',0,'scfcompany1@whitehall.com',NULL,'252-525-2525','Dev',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,24,'other',20461,NULL),(27,'SCF','','Company2','Mr','scfcompany2',NULL,'SCF Company Admin',0,'scfcompany2@whitehall.com',NULL,'758-747-4676','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,25,'other',20506,NULL),(28,'SCF','','Company3','Mr','scfcompany3',NULL,'SCF Company Admin',0,'scfcompany3@whitehall.com',NULL,'424-263-5653','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,26,'director',20527,NULL),(29,'seller','','1','Mr','seller1',NULL,'Seller Admin',0,'seller1@whitehall.com',NULL,'324-434-2525','Dev',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,27,'Yes',20547,NULL),(30,'Seller','','2','Mr','seller2',NULL,'Seller Admin',0,'seller2@whitehall.com',NULL,'486-319-4863','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,28,'director',20567,NULL);

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

insert  into `ticket`(`ticketId`,`companyId`,`createDate`,`classNameId`,`classPK`,`key_`,`type_`,`extraInfo`,`expirationDate`) values (11710,10155,'2015-08-04 21:20:45',10005,11703,'a8c6bf48-9a61-4b87-bef2-3ff488b6a881',1,'pawankct91@gmail.com',NULL),(11723,10155,'2015-08-04 21:29:18',10005,11716,'b4d01851-2781-441c-bf5a-03f47d2cbbaa',1,'pawankct91@gmail.com',NULL),(11735,10155,'2015-08-04 21:31:25',10005,11728,'a65d05e5-2a1e-4938-8f3d-7a60dcb7ea74',1,'pawankct91@gmail.com',NULL),(11747,10155,'2015-08-04 21:34:30',10005,11740,'803e54ed-b39c-4fc5-88fa-65da3e6ca812',1,'pawankct91@gmail.com',NULL),(11759,10155,'2015-08-04 21:39:39',10005,11752,'39452c12-88f1-4c67-b848-313fd0325532',1,'pawankct91@gmail.com',NULL),(11812,10155,'2015-08-04 21:49:02',10005,11805,'b76d5b67-71f4-4dcf-a00b-a551c0037fa3',1,'pawankct91@gmail.com',NULL),(11833,10155,'2015-08-04 21:57:43',10005,11826,'d9d56b1c-3934-4731-ba69-761e50cb42e8',1,'mailtotarun@gmail.com',NULL),(11846,10155,'2015-08-04 21:59:57',10005,11839,'2e418c96-b5db-4618-8346-4d21002915a4',1,'pawankct91@gmail.com',NULL),(12008,10155,'2015-08-05 17:53:49',10005,12001,'cfb3cba3-a3d1-4300-a885-0f04dede6fe2',1,'gautam.kct1988@gmail.com',NULL),(12246,10155,'2015-08-08 12:21:53',10005,12239,'acc2fced-1e7f-4309-ac08-52eb9a62b5f7',1,'gautam.kct1988@gmail.com',NULL),(12258,10155,'2015-08-08 12:29:06',10005,12251,'3d24ddf3-5767-4a92-a376-83854303d83e',1,'gautam.kct1988@gmail.com',NULL),(12308,10155,'2015-08-08 16:59:11',10005,12301,'6cabb748-026d-4a66-83d9-578aeaab8957',1,'gautam.kct1988@gmail.com',NULL),(12320,10155,'2015-08-08 17:08:58',10005,12313,'3c392c0c-a92c-47c8-ad2c-487e605c4a26',1,'gautam.kct1988@gmail.com',NULL),(12332,10155,'2015-08-08 17:12:10',10005,12325,'56488396-2a3b-4040-9ee5-5bacc100553e',1,'gautam.kct1988@gmail.com',NULL),(12345,10155,'2015-08-08 18:36:52',10005,12338,'b8705521-4f5d-45f7-94de-5a6638d264d6',1,'gautam.kct1988@gmail.com',NULL),(12942,10155,'2015-08-13 20:12:49',10005,12338,'8f07e825-3151-462c-93cf-5b4466659603',1,'gautam.kct1988@gmail.com',NULL),(13516,10155,'2015-08-16 20:13:10',10005,13509,'52b4ab10-4bec-46c0-ba5a-cbd66011ddbb',1,'gautam.kct1988@gmail.com',NULL),(13543,10155,'2015-08-16 20:45:38',10005,13536,'77086eb3-e9f7-4df3-a135-674e9b5dcfc7',1,'gautam.kct1988@gmail.com',NULL);

/*Table structure for table `trade_finance` */

DROP TABLE IF EXISTS `trade_finance`;

CREATE TABLE `trade_finance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Amount_Invested` double DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Estimated_Return` double DEFAULT NULL,
  `Fee_Deducted` double DEFAULT NULL,
  `Net_Invested` double DEFAULT NULL,
  `Net_Return` double DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `Return_Per` float DEFAULT NULL,
  `Secondary_Market` double DEFAULT NULL,
  `Secondary_Market_Sale` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `trade_finance` */

insert  into `trade_finance`(`id`,`Amount_Invested`,`Duration`,`Estimated_Return`,`Fee_Deducted`,`Net_Invested`,`Net_Return`,`position`,`Return_Per`,`Secondary_Market`,`Secondary_Market_Sale`) values (1,1,8,5,3,4,7,0,9,6,2),(2,22,99,66,44,55,88,11,111,77,33),(3,222,999,666,444,555,888,111,1010,777,333),(4,22,55,88,44,77,33,11,12,99,33),(5,12341,67,777,33,77,44444,1234,88,22222,12342),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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

insert  into `user_`(`uuid_`,`userId`,`companyId`,`createDate`,`modifiedDate`,`defaultUser`,`contactId`,`password_`,`passwordEncrypted`,`passwordReset`,`passwordModifiedDate`,`digest`,`reminderQueryQuestion`,`reminderQueryAnswer`,`graceLoginCount`,`screenName`,`emailAddress`,`facebookId`,`ldapServerId`,`openId`,`portraitId`,`languageId`,`timeZoneId`,`greeting`,`comments`,`firstName`,`middleName`,`lastName`,`jobTitle`,`loginDate`,`loginIP`,`lastLoginDate`,`lastLoginIP`,`lastFailedLoginDate`,`failedLoginAttempts`,`lockout`,`lockoutDate`,`agreedToTermsOfUse`,`emailAddressVerified`,`status`) values ('4f2fbdbc-2651-478e-89a2-6acd01cecc0a',10159,10155,'2015-07-17 19:13:38','2015-07-17 19:13:38',1,10160,'password',0,0,NULL,'5533ed38b5e33c076a804bb4bca644f9,3122172330a991cc1e9575c4f75428d4,3122172330a991cc1e9575c4f75428d4','','',0,'10159','default@liferay.com',0,0,'',0,'en_US','UTC','Welcome!','','','','','','2015-07-17 19:13:38','',NULL,'',NULL,0,0,NULL,1,0,0),('82eb80a1-ba72-4984-b226-90b4cebbe18f',10199,10155,'2015-07-17 19:13:41','2016-01-23 20:14:25',0,10200,'test',1,0,NULL,'c34dbefc6a3044b7994c686450913c23,874f41bf85d382eb285311a16b4cb1a3,0d964023b6532e1cb17d96b98642eb31','what-is-your-library-card-number','70',0,'gautam','gautam@liferay.com',0,-1,'',0,'en_US','UTC','Welcome Test Test!','','Gautam','','Sharma','','2016-01-28 04:28:16','127.0.0.1','2016-01-27 19:21:52','127.0.0.1','2015-10-31 19:34:14',0,0,NULL,1,1,0),('1b0c36cf-c970-4cdc-9cab-b47b28ad3b2f',20301,10155,'2016-01-19 21:32:49','2016-01-19 21:32:49',0,20302,'test',1,0,'2016-01-19 21:35:19','4e5513911934f6f8859e5451e8d8bf33,3f5c8f1ebac4191f0e637907ccbeefb5,db3dfa6fa161eb73446566754d5ed3aa','what-is-your-library-card-number','75',0,'prinvestor1','prinvestor1@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome Primary Investor1!','','Primary','','Investor1','Dev','2016-01-27 19:07:35','127.0.0.1','2016-01-27 05:04:23','127.0.0.1',NULL,0,0,NULL,1,0,0),('faae499b-9b16-487a-9ae1-eebef20ed74c',20401,10155,'2016-01-23 18:57:44','2016-01-23 18:57:44',0,20402,'test',1,0,'2016-01-23 18:59:01','3ac914feed347e1143ef6b2eca555c40,5624293185ca94d044399ac3112755af,f655d5f6ddd8f1b1b88abec244797fbb','what-is-your-library-card-number','75',0,'prinvestor2','prinvestor2@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome primary prInvestor2!','','primary','','prInvestor2','Admin','2016-01-24 13:44:54','127.0.0.1','2016-01-23 18:58:42','127.0.0.1',NULL,0,0,NULL,1,0,0),('586c10a9-f104-428a-b596-b1f944062bcf',20421,10155,'2016-01-23 19:02:23','2016-01-23 19:02:23',0,20422,'test',1,0,'2016-01-23 19:03:04','','what-is-your-library-card-number','75',0,'prinvestor3','prinvestor3@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome primary Investor3!','','primary','','Investor3','Company Director','2016-01-23 19:02:54','127.0.0.1','2016-01-23 19:02:54','127.0.0.1',NULL,0,0,NULL,1,0,0),('48c66aff-ab75-448c-81a1-90ad596a255b',20441,10155,'2016-01-23 19:06:02','2016-01-23 19:06:02',0,20442,'test',1,0,'2016-01-23 19:06:50','','what-is-your-library-card-number','75',0,'prinvestor4','prinvestor4@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome primary Investor4!','','primary','','Investor4','Secretary','2016-01-23 19:06:32','127.0.0.1','2016-01-23 19:06:32','127.0.0.1',NULL,0,0,NULL,1,0,0),('578969fc-cec6-4a6e-a7f6-4355cd8199b9',20461,10155,'2016-01-23 19:13:36','2016-01-23 19:13:36',0,20462,'test',1,0,'2016-01-23 19:14:11','d6100d8bf01916d829aba137680d680a,935421f883b8650bf123cf308b473f1d,9d8aa3ccb8d987aa3ecd11d6790286ff','what-is-your-library-card-number','75',0,'scfcompany1','scfcompany1@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome SCF Company1!','','SCF','','Company1','Dev','2016-01-24 16:09:29','127.0.0.1','2016-01-24 15:52:52','127.0.0.1',NULL,0,0,NULL,1,0,0),('699e7735-35ff-4ac0-83a9-a0f6c8ce7460',20506,10155,'2016-01-23 20:49:59','2016-01-23 20:49:59',0,20507,'test',1,0,'2016-01-23 20:58:53','b4be60bd88ca9a23dcc655c8529fd050,c454aafe60a5a423d91aaba34ddcf062,0603a207269fb757eee1b4fa9dae8e37','what-is-your-library-card-number','75',0,'scfcompany2','scfcompany2@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome SCF Company2!','','SCF','','Company2','Admin','2016-01-24 16:09:56','127.0.0.1','2016-01-23 20:59:53','127.0.0.1',NULL,0,0,NULL,1,0,0),('6bfe16a6-ce49-477b-9f04-9cc24d2a1c52',20527,10155,'2016-01-23 21:01:29','2016-01-23 21:01:29',0,20528,'test',1,0,'2016-01-23 21:02:05','','what-is-your-library-card-number','75',0,'scfcompany3','scfcompany3@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome SCF Company3!','','SCF','','Company3','Admin','2016-01-23 21:01:53','127.0.0.1','2016-01-23 21:01:53','127.0.0.1',NULL,0,0,NULL,1,0,0),('26e9d8c4-2fa5-4e35-a0be-b60ec72d8dc0',20547,10155,'2016-01-23 21:09:17','2016-01-23 21:09:17',0,20548,'test',1,0,'2016-01-23 21:09:48','4b86472a761cb12ab22da0d4cb4052f8,f21ef1a0991f78e08bb0049eb8505e4b,e6d1b7681899af31133e83e17907a20b','what-is-your-library-card-number','75',0,'seller1','seller1@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome seller 1!','','seller','','1','Dev','2016-01-24 19:18:39','127.0.0.1','2016-01-24 18:47:51','127.0.0.1',NULL,0,0,NULL,1,0,0),('a6d525f7-b79a-4f92-a810-0f1b6f6b149b',20567,10155,'2016-01-23 21:14:10','2016-01-23 21:14:10',0,20568,'test',1,0,'2016-01-23 21:17:28','db060774ccbe51f6120e9976ab42adcb,f47611cb08b2f361d3021f534b4542e1,d347c1181b508c7cb4c95dad04d22cc1','what-is-your-library-card-number','75',0,'seller2','seller2@whitehall.com',0,-1,'',0,'en_US','UTC','Welcome Seller 2!','','Seller','','2','','2016-01-24 16:03:40','127.0.0.1','2016-01-23 21:17:17','127.0.0.1',NULL,0,0,NULL,1,0,0);

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

insert  into `usergrouprole`(`userId`,`groupId`,`roleId`) values (10199,10664,10172),(10199,10668,10172);

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

insert  into `users_groups`(`groupId`,`userId`) values (10182,10199),(10182,20301),(10182,20401),(10182,20421),(10182,20441),(10182,20461),(10182,20506),(10182,20527),(10182,20547),(10182,20567),(10664,10199),(10668,10199);

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

insert  into `users_roles`(`roleId`,`userId`) values (10162,10199),(10163,10159),(10165,10199),(10165,20301),(10165,20401),(10165,20421),(10165,20441),(10165,20461),(10165,20506),(10165,20527),(10165,20547),(10165,20567),(10166,10199),(10166,20301),(10166,20401),(10166,20421),(10166,20441),(10166,20461),(10166,20506),(10166,20527),(10166,20547),(10166,20567),(19825,20301),(19825,20401),(19825,20421),(19825,20441),(19827,20461),(19827,20506),(19827,20527),(19828,20506),(19829,20547),(19829,20567);

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
