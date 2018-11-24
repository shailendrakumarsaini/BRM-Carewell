-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: leadpassers_dev
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `uid` varchar(40) NOT NULL,
  `user_uid` varchar(40) NOT NULL,
  `doc_type_uid` varchar(40) NOT NULL,
  `doc_title` varchar(50) NOT NULL,
  `doc_path` varchar(1000) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` varchar(50) NOT NULL,
  `createdon` datetime NOT NULL,
  `modifiedby` varchar(50) NOT NULL,
  `modifiedon` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQ_USER_TITLE` (`user_uid`,`doc_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `documents_BEFORE_INSERT` BEFORE INSERT ON `documents`
 FOR EACH ROW 
 BEGIN
	SET new.uid = uuid();
    SET new.createdon = NOW();
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `documents_BEFORE_UPDATE` BEFORE UPDATE ON `documents` FOR EACH ROW 
 BEGIN
	SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `uid` varchar(40) NOT NULL,
  `user_uid` varchar(40) NOT NULL,
  `client_name` varchar(200) NOT NULL,
  `client_org` varchar(100) DEFAULT NULL,
  `client_phone` varchar(15) NOT NULL,
  `client_email` varchar(200) DEFAULT NULL,
  `state_uid` varchar(40) DEFAULT NULL,
  `city_uid` varchar(40) DEFAULT NULL,
  `other_state` varchar(50) DEFAULT NULL,
  `other_city` varchar(50) DEFAULT NULL,
  `category_uid` varchar(40) DEFAULT NULL,
  `subcategory_uid` varchar(40) DEFAULT NULL,
  `timeframe_uid` varchar(40) DEFAULT NULL,
  `ticket_value` decimal(15,2) DEFAULT NULL,
  `otherinfo` varchar(4000) DEFAULT NULL,
  `assigned_to_uid` varchar(40) DEFAULT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'New',
  `comments_verification` varchar(200) DEFAULT NULL,
  `comments_final` varchar(200) DEFAULT NULL,
  `apr_ticket_value` decimal(15,2) DEFAULT NULL,
  `createdby` varchar(50) NOT NULL,
  `createdon` datetime NOT NULL,
  `modifiedby` varchar(50) NOT NULL,
  `modifiedon` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `FK_USERUID_idx` (`user_uid`),
  CONSTRAINT `FK_USERUID` FOREIGN KEY (`user_uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `leads_BEFORE_INSERT` BEFORE INSERT ON `leads` FOR EACH ROW 
 BEGIN
	SET new.uid = uuid();
    SET new.createdon = NOW();
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `leads_BEFORE_UPDATE` BEFORE UPDATE ON `leads` FOR EACH ROW 
 BEGIN
	SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lg_bank_details`
--

DROP TABLE IF EXISTS `lg_bank_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lg_bank_details` (
  `uid` varchar(40) NOT NULL,
  `user_uid` varchar(40) NOT NULL,
  `owner_name` varchar(200) NOT NULL,
  `pan_number` varchar(20) DEFAULT NULL,
  `account_number` varchar(45) NOT NULL,
  `account_type` varchar(45) DEFAULT NULL,
  `bank` varchar(100) NOT NULL,
  `branch` varchar(200) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `editable` tinyint(1) DEFAULT '1',
  `createdby` varchar(50) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedby` varchar(50) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQ_USER_UID` (`user_uid`),
  KEY `FK_USRER_UID_idx` (`user_uid`),
  CONSTRAINT `FK_USRER_UID` FOREIGN KEY (`user_uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lg_bank_details`
--

LOCK TABLES `lg_bank_details` WRITE;
/*!40000 ALTER TABLE `lg_bank_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `lg_bank_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `lg_bank_details_BEFORE_INSERT` BEFORE INSERT ON `lg_bank_details` FOR EACH ROW
BEGIN
	SET new.uid = uuid();
    SET new.createdon = NOW();
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `lg_bank_details_BEFORE_UPDATE` BEFORE UPDATE ON `lg_bank_details` FOR EACH ROW
BEGIN
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `masterlist`
--

DROP TABLE IF EXISTS `masterlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masterlist` (
  `uid` varchar(40) NOT NULL,
  `code` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `parent_uid` varchar(40) DEFAULT NULL,
  `seq` int(11) NOT NULL DEFAULT '999',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `createdby` varchar(50) NOT NULL DEFAULT 'system',
  `createdon` datetime NOT NULL,
  `modifiedby` varchar(50) NOT NULL DEFAULT 'system',
  `modifiedon` datetime NOT NULL,
  `numfield_1` decimal(12,4) DEFAULT NULL,
  `numfield_2` decimal(12,4) DEFAULT NULL,
  `txtfield_1` varchar(100) DEFAULT NULL,
  `txtfield_2` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQ_CODE_PARENTUID` (`parent_uid`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masterlist`
--

LOCK TABLES `masterlist` WRITE;
/*!40000 ALTER TABLE `masterlist` DISABLE KEYS */;
INSERT INTO `masterlist` VALUES ('1d861154-5f05-11e6-a3e1-025400b812aa','passport','Passport','eb7530d7-18ed-11e6-a7d5-02b453d9ac26',15,1,'sysadmin','2016-08-10 19:47:05','sysadmin','2016-08-10 19:47:05',NULL,NULL,NULL,NULL),('2ec02a37-5ee4-11e6-a3e1-025400b812aa','loans','Loans','ebdda41f-18ed-11e6-a7d5-02b453d9ac26',10,1,'sysadmin','2016-08-10 15:51:21','sysadmin','2016-08-10 15:51:21',NULL,NULL,'Fixed','Fixed'),('3275bb10-5f04-11e6-a3e1-025400b812aa','bike','Bike','2ec02a37-5ee4-11e6-a3e1-025400b812aa',20,1,'sysadmin','2016-08-10 19:40:31','sysadmin','2016-08-10 19:40:31',400.0000,800.0000,'Fixed','Fixed'),('3760ed79-5f05-11e6-a3e1-025400b812aa','la','Lease Agreement','fedf6f37-48ab-11e6-8a1c-02b453d9ac26',5,1,'sysadmin','2016-08-10 19:47:48','sysadmin','2016-08-10 19:47:48',NULL,NULL,NULL,NULL),('3b68d84b-1b30-11e6-a7d5-02b453d9ac26','in','India','ebbd6164-18ed-11e6-a7d5-02b453d9ac26',999,1,'superuser','2016-05-16 12:04:25','superuser','2016-05-16 12:04:25',NULL,NULL,NULL,NULL),('3cb246ca-4d83-11e6-8a1c-02b453d9ac26','_timeframe','Timeframe',NULL,999,1,'superuser','2016-07-19 13:04:33','superuser','2016-07-19 13:04:33',NULL,NULL,NULL,NULL),('3d0ce807-5f05-11e6-a3e1-025400b812aa','br','Business Registration','fedf6f37-48ab-11e6-8a1c-02b453d9ac26',10,1,'sysadmin','2016-08-10 19:47:58','sysadmin','2016-08-10 19:47:58',NULL,NULL,NULL,NULL),('460337a9-5f05-11e6-a3e1-025400b812aa','pan','PAN Card','fedf6f37-48ab-11e6-8a1c-02b453d9ac26',15,1,'sysadmin','2016-08-10 19:48:13','sysadmin','2016-08-10 19:48:13',NULL,NULL,NULL,NULL),('471d3060-5ee4-11e6-a3e1-025400b812aa','home','Home','2ec02a37-5ee4-11e6-a3e1-025400b812aa',5,1,'sysadmin','2016-08-10 15:52:02','sysadmin','2016-08-10 15:52:02',0.0100,0.0200,'Percentage','Percentage'),('477565f7-5f04-11e6-a3e1-025400b812aa','car','Car','2ec02a37-5ee4-11e6-a3e1-025400b812aa',40,1,'sysadmin','2016-08-10 19:41:06','sysadmin','2016-08-10 19:41:06',0.1000,0.3000,'Percentage','Percentage'),('567b2fe0-5f04-11e6-a3e1-025400b812aa','personal','Personal','2ec02a37-5ee4-11e6-a3e1-025400b812aa',50,1,'sysadmin','2016-08-10 19:41:31','sysadmin','2016-08-10 19:41:31',0.1000,0.3000,'Percentage','Percentage'),('5dcb3222-5f04-11e6-a3e1-025400b812aa','insurance','Insurance','ebdda41f-18ed-11e6-a7d5-02b453d9ac26',20,1,'sysadmin','2016-08-10 19:41:43','user','2016-08-14 11:24:12',NULL,NULL,'Fixed','Fixed'),('6e143f3b-5f04-11e6-a3e1-025400b812aa','life','Life','5dcb3222-5f04-11e6-a3e1-025400b812aa',10,1,'sysadmin','2016-08-10 19:42:11','sysadmin','2016-08-10 19:42:11',0.0100,0.0300,'Percentage','Percentage'),('7d8c8040-5f04-11e6-a3e1-025400b812aa','medical','Medical','5dcb3222-5f04-11e6-a3e1-025400b812aa',20,1,'sysadmin','2016-08-10 19:42:37','sysadmin','2016-08-10 19:42:37',0.2000,0.4000,'Percentage','Percentage'),('81a6ff70-5ee2-11e6-a3e1-025400b812aa','immediately','Immediately','3cb246ca-4d83-11e6-8a1c-02b453d9ac26',5,1,'sysadmin','2016-08-10 15:39:21','sysadmin','2016-08-10 15:39:21',NULL,NULL,NULL,NULL),('8d69ff7a-5f04-11e6-a3e1-025400b812aa','pan','PAN Card','eb7530d7-18ed-11e6-a7d5-02b453d9ac26',5,1,'sysadmin','2016-08-10 19:43:03','sysadmin','2016-08-10 19:43:03',NULL,NULL,NULL,NULL),('8fbfdc42-5ee2-11e6-a3e1-025400b812aa','1mo','Within 1 Month','3cb246ca-4d83-11e6-8a1c-02b453d9ac26',10,1,'sysadmin','2016-08-10 15:39:44','sysadmin','2016-08-10 15:39:44',NULL,NULL,NULL,NULL),('94d6aea7-5f04-11e6-a3e1-025400b812aa','dl','Driving Licence','eb7530d7-18ed-11e6-a7d5-02b453d9ac26',10,1,'sysadmin','2016-08-10 19:43:16','sysadmin','2016-08-10 19:43:16',NULL,NULL,NULL,NULL),('9bab047a-5ee2-11e6-a3e1-025400b812aa','1to3mo','1 to 3 Months','3cb246ca-4d83-11e6-8a1c-02b453d9ac26',15,1,'sysadmin','2016-08-10 15:40:04','sysadmin','2016-08-10 15:40:04',NULL,NULL,NULL,NULL),('9ecb9c30-1042-11e7-ac0c-0254001bc12d','ts','Telangana','3b68d84b-1b30-11e6-a7d5-02b453d9ac26',999,1,'sysadmin','2017-03-24 09:03:17','sysadmin','2017-03-24 09:03:17',NULL,NULL,NULL,NULL),('a945da20-1042-11e7-ac0c-0254001bc12d','hyd','Hyderabad','9ecb9c30-1042-11e7-ac0c-0254001bc12d',999,1,'sysadmin','2017-03-24 09:03:35','sysadmin','2017-03-24 09:03:35',NULL,NULL,NULL,NULL),('ab52bf92-5ee2-11e6-a3e1-025400b812aa','3to6mo','3 to 6 Months','3cb246ca-4d83-11e6-8a1c-02b453d9ac26',20,1,'sysadmin','2016-08-10 15:40:31','sysadmin','2016-08-10 15:40:46',NULL,NULL,NULL,NULL),('b8b161d6-1042-11e7-ac0c-0254001bc12d','hyderabad','Hyderabad','a945da20-1042-11e7-ac0c-0254001bc12d',999,1,'sysadmin','2017-03-24 09:04:01','sysadmin','2017-03-24 09:04:01',NULL,NULL,NULL,NULL),('da01f6f8-5ee2-11e6-a3e1-025400b812aa','later','Beyond 6 months','3cb246ca-4d83-11e6-8a1c-02b453d9ac26',999,1,'sysadmin','2016-08-10 15:41:49','sysadmin','2016-08-10 15:41:49',NULL,NULL,NULL,NULL),('eb03fad8-18ed-11e6-a7d5-02b453d9ac26','_lead_status','Lead Status',NULL,999,1,'system','2016-05-13 09:34:41','superuser','2016-07-13 09:14:41',NULL,NULL,NULL,NULL),('eb1ad8cd-18ed-11e6-a7d5-02b453d9ac26','_lead_status_reason','Lead Status Reason',NULL,999,1,'system','2016-05-13 09:34:41','superuser','2016-07-13 09:14:48',NULL,NULL,NULL,NULL),('eb7530d7-18ed-11e6-a7d5-02b453d9ac26','_lg_docs','LG Documents',NULL,999,1,'system','2016-05-13 09:34:41','superuser','2016-07-13 09:14:27',NULL,NULL,NULL,NULL),('ebbd6164-18ed-11e6-a7d5-02b453d9ac26','_geo_locations','Geographical Locations',NULL,999,1,'system','2016-05-13 09:34:42','superuser','2016-05-16 11:27:28',NULL,NULL,NULL,NULL),('ebdda41f-18ed-11e6-a7d5-02b453d9ac26','_product_catalog','Product Catalog',NULL,999,1,'system','2016-05-13 09:34:42','system','2016-05-13 09:34:42',NULL,NULL,NULL,NULL),('fedf6f37-48ab-11e6-8a1c-02b453d9ac26','_sp_docs','SP Documents',NULL,999,1,'superuser','2016-07-13 09:13:43','superuser','2016-07-13 09:13:43',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `masterlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `masterlist_BEFORE_INSERT` BEFORE INSERT ON `masterlist` FOR EACH ROW 
BEGIN
	SET new.uid = uuid();
    SET new.createdon = NOW();
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `masterlist_BEFORE_UPDATE` BEFORE UPDATE ON `masterlist` FOR EACH ROW 
BEGIN
	SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sp_catalog`
--

DROP TABLE IF EXISTS `sp_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_catalog` (
  `uid` varchar(45) NOT NULL,
  `sp_uid` varchar(40) NOT NULL,
  `category_uid` varchar(40) NOT NULL,
  `subcategory_uid` varchar(40) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `createdby` varchar(50) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedby` varchar(50) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQ_SPUID_CATEGORY_SUBCATEGORY` (`sp_uid`,`category_uid`,`subcategory_uid`),
  KEY `FK_CATEGORY_idx` (`category_uid`),
  KEY `FK_SUBCATEGORY_idx` (`subcategory_uid`),
  CONSTRAINT `FK_CATEGORY` FOREIGN KEY (`category_uid`) REFERENCES `masterlist` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SPUID` FOREIGN KEY (`sp_uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SUBCATEGORY` FOREIGN KEY (`subcategory_uid`) REFERENCES `masterlist` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_catalog`
--

LOCK TABLES `sp_catalog` WRITE;
/*!40000 ALTER TABLE `sp_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_catalog` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sp_catalog_BEFORE_INSERT` BEFORE INSERT ON `sp_catalog` FOR EACH ROW 
BEGIN
	SET new.uid = uuid();
    SET new.createdon = NOW();
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sp_catalog_BEFORE_UPDATE` BEFORE UPDATE ON `sp_catalog` FOR EACH ROW 
BEGIN
	SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sp_catalog_locations`
--

DROP TABLE IF EXISTS `sp_catalog_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_catalog_locations` (
  `uid` varchar(40) NOT NULL,
  `sp_catalog_uid` varchar(40) NOT NULL,
  `country_uid` varchar(40) NOT NULL,
  `state_uid` varchar(40) NOT NULL DEFAULT '',
  `district_uid` varchar(40) NOT NULL DEFAULT '',
  `city_uid` varchar(40) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `createdby` varchar(50) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedby` varchar(50) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQ_COUNTRY_STATE_DIST_CITY` (`sp_catalog_uid`,`country_uid`,`state_uid`,`district_uid`,`city_uid`) USING BTREE,
  CONSTRAINT `FK_SPCATALOG_UID` FOREIGN KEY (`sp_catalog_uid`) REFERENCES `sp_catalog` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_catalog_locations`
--

LOCK TABLES `sp_catalog_locations` WRITE;
/*!40000 ALTER TABLE `sp_catalog_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_catalog_locations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sp_catalog_locations_BEFORE_INSERT` BEFORE INSERT ON `sp_catalog_locations` FOR EACH ROW 
BEGIN
	SET new.uid = uuid();
    SET new.createdon = NOW();
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sp_catalog_locations_BEFORE_UPDATE` BEFORE UPDATE ON `sp_catalog_locations` FOR EACH ROW 
BEGIN
	SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sp_leads`
--

DROP TABLE IF EXISTS `sp_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_leads` (
  `uid` varchar(40) NOT NULL,
  `sp_uid` varchar(40) NOT NULL,
  `lead_uid` varchar(40) NOT NULL,
  `shared_on` datetime DEFAULT NULL,
  `viewed_on` datetime DEFAULT NULL,
  `acceptance_status` varchar(50) DEFAULT NULL,
  `accepted_on` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT 'New',
  `comments` varchar(4000) DEFAULT NULL,
  `apr_ticket_value` decimal(15,2) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `createdby` varchar(45) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `modifiedby` varchar(45) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UQ_SPUID_LEADUID` (`sp_uid`,`lead_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_leads`
--

LOCK TABLES `sp_leads` WRITE;
/*!40000 ALTER TABLE `sp_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `sp_leads` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sp_leads_BEFORE_INSERT` BEFORE INSERT ON `sp_leads` FOR EACH ROW 
BEGIN

    SET new.uid = uuid();
    SET new.createdon = NOW();
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sp_leads_AFTER_INSERT` AFTER INSERT ON `sp_leads` FOR EACH ROW 
BEGIN
	
    IF ((select  count(*) from sp_leads where lead_uid = new.lead_uid and acceptance_status is not null) > 0) THEN
		update leads
		set status = 'In Progress'
		where uid = new.lead_uid;
    ELSE
		update leads
		set status = 'Verified'
		where uid = new.lead_uid;
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sp_leads_BEFORE_UPDATE` BEFORE UPDATE ON `sp_leads` FOR EACH ROW 
BEGIN
	SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `sp_leads_AFTER_UPDATE` AFTER UPDATE ON `sp_leads` FOR EACH ROW 
BEGIN
	
    IF ((select  count(*) from sp_leads where lead_uid = new.lead_uid and acceptance_status is not null) > 0) THEN
		update leads
		set status = 'In Progress'
		where uid = new.lead_uid;
    ELSE
		update leads
		set status = 'Verified'
		where uid = new.lead_uid;
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `uid` varchar(40) NOT NULL,
  `user_uid` varchar(40) NOT NULL,
  `info_key` varchar(30) NOT NULL,
  `info_value` varchar(1000) DEFAULT NULL,
  `createdby` varchar(50) NOT NULL,
  `createdon` datetime NOT NULL,
  `modifiedby` varchar(50) NOT NULL,
  `modifiedon` datetime NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `UNQ_UID_KEY` (`user_uid`,`info_key`),
  CONSTRAINT `FK_USERS` FOREIGN KEY (`user_uid`) REFERENCES `users` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `user_details_BEFORE_INSERT` BEFORE INSERT ON `user_details` FOR EACH ROW 
BEGIN
	SET new.uid = uuid();
    SET new.createdon = NOW();
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `user_details_BEFORE_UPDATE` BEFORE UPDATE ON `user_details` FOR EACH ROW 
BEGIN
	SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `utype` char(2) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `upass` varchar(4000) NOT NULL,
  `temp_pwd` varchar(100) DEFAULT NULL,
  `resetpwd` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(200) DEFAULT NULL,
  `emailverified` tinyint(1) NOT NULL DEFAULT '0',
  `ecode` varchar(45) DEFAULT NULL,
  `ecodevalidity` datetime DEFAULT NULL,
  `mobilenum` varchar(15) NOT NULL,
  `mobileverified` tinyint(1) NOT NULL DEFAULT '0',
  `mcode` varchar(45) DEFAULT NULL,
  `mcodevalidity` datetime DEFAULT NULL,
  `comments` varchar(4000) DEFAULT NULL,
  `address1` varchar(200) DEFAULT NULL,
  `address2` varchar(200) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `name2` varchar(100) DEFAULT NULL,
  `email2` varchar(200) DEFAULT NULL,
  `mobilenum2` varchar(15) DEFAULT NULL,
  `enable_display` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `createdby` varchar(50) NOT NULL DEFAULT 'System',
  `createdon` datetime DEFAULT NULL,
  `modifiedby` varchar(50) NOT NULL DEFAULT 'System',
  `modifiedon` datetime DEFAULT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname_UNIQUE` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('9509670d-505a-11e8-9aa8-000c297a62dd','UNS Srikanth',NULL,'SU','srikanth','29182decf71747d296b559a99e85c444','srikanth',1,'c85518+5eo7w5fnpowi4@sharklasers.com',0,'f076f1a57b30-49a5-be75-c6939a5592d3','2018-05-07 17:10:02','9676667623',0,'699967','2018-05-05 17:41:01',NULL,NULL,NULL,'Kakinada','ap',NULL,'1980-02-14','Male',NULL,NULL,NULL,1,1,'sysadmin','2018-05-05 17:21:01','sysadmin','2018-05-05 17:34:31','admin'),('eab436c6-18ed-11e6-a7d5-02b453d9ac26','System Admin',NULL,'su','sysadmin','5f4dcc3b5aa765d61d8327deb882cf99',NULL,0,'manish@shanrohi.com',1,NULL,NULL,'9989925151',0,'053783','2016-06-30 15:30:27',NULL,NULL,NULL,'Hyderabad','Telangana',NULL,'1998-05-05','Male',NULL,NULL,NULL,0,1,'system','2016-05-13 09:34:40','sysadmin','2016-09-26 23:38:08','admin'),('eace7aee-18ed-11e6-a7d5-02b453d9ac26','Super User',NULL,'de','superuser','5f4dcc3b5aa765d61d8327deb882cf99','password',0,'manish.gupta@shanrohi.com',1,NULL,NULL,'9160402299',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,'system','2016-05-13 09:34:40','system','2016-05-13 09:34:40','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `users_BEFORE_INSERT` BEFORE INSERT ON `users` FOR EACH ROW 
BEGIN

	SET new.uid = uuid();
    SET new.createdon = NOW();
    SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `users_BEFORE_UPDATE` BEFORE UPDATE ON `users` FOR EACH ROW 
BEGIN
	SET new.modifiedon = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `vw_leads`
--

DROP TABLE IF EXISTS `vw_leads`;
/*!50001 DROP VIEW IF EXISTS `vw_leads`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_leads` AS SELECT 
 1 AS `uid`,
 1 AS `user_uid`,
 1 AS `leadpasser`,
 1 AS `client_org`,
 1 AS `client_name`,
 1 AS `client_phone`,
 1 AS `client_email`,
 1 AS `state_uid`,
 1 AS `state`,
 1 AS `city_uid`,
 1 AS `city`,
 1 AS `other_state`,
 1 AS `other_city`,
 1 AS `category_uid`,
 1 AS `category`,
 1 AS `subcategory_uid`,
 1 AS `subcategory`,
 1 AS `timeframe_uid`,
 1 AS `timeframe`,
 1 AS `ticket_value`,
 1 AS `otherinfo`,
 1 AS `assigned_to_uid`,
 1 AS `agent`,
 1 AS `status`,
 1 AS `createdby`,
 1 AS `createdon`,
 1 AS `modifiedby`,
 1 AS `modifiedon`,
 1 AS `comments_verification`,
 1 AS `age`,
 1 AS `reward`,
 1 AS `purchase_cost`,
 1 AS `apr_reward`,
 1 AS `apr_purchase_cost`,
 1 AS `leadtype`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_leadserviceproviders`
--

DROP TABLE IF EXISTS `vw_leadserviceproviders`;
/*!50001 DROP VIEW IF EXISTS `vw_leadserviceproviders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_leadserviceproviders` AS SELECT 
 1 AS `lead_uid`,
 1 AS `sp_uid`,
 1 AS `organization`,
 1 AS `state_presence`,
 1 AS `sharing_status`,
 1 AS `spl_uid`,
 1 AS `shared_on`,
 1 AS `acceptance_status`,
 1 AS `accepted_on`,
 1 AS `status`,
 1 AS `apr_ticket_value`,
 1 AS `active`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_openleads`
--

DROP TABLE IF EXISTS `vw_openleads`;
/*!50001 DROP VIEW IF EXISTS `vw_openleads`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_openleads` AS SELECT 
 1 AS `uid`,
 1 AS `user_uid`,
 1 AS `leadpasser`,
 1 AS `client_org`,
 1 AS `client_name`,
 1 AS `client_phone`,
 1 AS `client_email`,
 1 AS `state_uid`,
 1 AS `state`,
 1 AS `city_uid`,
 1 AS `city`,
 1 AS `other_state`,
 1 AS `other_city`,
 1 AS `category_uid`,
 1 AS `category`,
 1 AS `subcategory_uid`,
 1 AS `subcategory`,
 1 AS `timeframe_uid`,
 1 AS `timeframe`,
 1 AS `ticket_value`,
 1 AS `otherinfo`,
 1 AS `assigned_to_uid`,
 1 AS `agent`,
 1 AS `status`,
 1 AS `createdby`,
 1 AS `createdon`,
 1 AS `modifiedby`,
 1 AS `modifiedon`,
 1 AS `age`,
 1 AS `reward`,
 1 AS `purchase_cost`,
 1 AS `lead_uid`,
 1 AS `total_count`,
 1 AS `inprocess_count`,
 1 AS `accepted_count`,
 1 AS `rejected_count`,
 1 AS `terminated_count`,
 1 AS `inprogress_count`,
 1 AS `approved_count`,
 1 AS `declined_count`,
 1 AS `sp_approvals`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_spleads_counts`
--

DROP TABLE IF EXISTS `vw_spleads_counts`;
/*!50001 DROP VIEW IF EXISTS `vw_spleads_counts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_spleads_counts` AS SELECT 
 1 AS `lead_uid`,
 1 AS `total_count`,
 1 AS `inprocess_count`,
 1 AS `accepted_count`,
 1 AS `rejected_count`,
 1 AS `acceptance_terminated_count`,
 1 AS `inprogress_count`,
 1 AS `approved_count`,
 1 AS `declined_count`,
 1 AS `terminated_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'leadpassers_dev'
--

--
-- Dumping routines for database 'leadpassers_dev'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_documenttypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_documenttypes`(`doctypecode` VARCHAR(20))
BEGIN
    select 
        d.uid as doc_type_uid
    , 	d.description as doc_type
    ,	d.active
    ,	d.seq
    from masterlist as l
    left join masterlist as d on d.parent_uid = l.uid
    where 
            l.code = doctypecode
    order by 
            d.active desc, d.seq, d.description;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_leaddetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_leaddetails`(`uid` VARCHAR(40))
BEGIN
    SELECT 
        `l`.`uid` AS `uid`,
        `l`.`user_uid` AS `user_uid`,
        `lg`.`name` AS `leadpasser`,
        `l`.`client_org` AS `client_org`,
        `l`.`client_name` AS `client_name`,
        `l`.`client_phone` AS `client_phone`,
        `l`.`client_email` AS `client_email`,
        `l`.`state_uid` AS `state_uid`,
        `s`.`description` AS `state`,
        `l`.`city_uid` AS `city_uid`,
        `ct`.`description` AS `city`,
        `l`.`other_state` AS `other_state`,
        `l`.`other_city` AS `other_city`,
        `l`.`category_uid` AS `category_uid`,
        `cat`.`description` AS `category`,
        `l`.`subcategory_uid` AS `subcategory_uid`,
        `scat`.`description` AS `subcategory`,
        `l`.`timeframe_uid` AS `timeframe_uid`,
        `tf`.`description` AS `timeframe`,
        `l`.`ticket_value` AS `ticket_value`,
        `l`.`otherinfo` AS `otherinfo`,
        `l`.`assigned_to_uid` AS `assigned_to_uid`,
        `ag`.`name` AS `agent`,
        `l`.`status` AS `status`,
        `l`.`createdby` AS `createdby`,
        `l`.`createdon` AS `createdon`,
        `l`.`modifiedby` AS `modifiedby`,
        `l`.`modifiedon` AS `modifiedon`,
        l.apr_ticket_value,
        l.comments_verification,
        l.comments_final,
        (TO_DAYS(NOW()) - TO_DAYS(`l`.`createdon`)) AS `age`,
        (CASE
            WHEN (`scat`.`txtfield_1` = 'Fixed') THEN `scat`.`numfield_1`
            WHEN (`scat`.`txtfield_1` = 'Percentage') THEN (`scat`.`numfield_1` * `l`.`ticket_value`/100)
        END) AS `reward`,
        (CASE
            WHEN (`scat`.`txtfield_2` = 'Fixed') THEN `scat`.`numfield_2`
            WHEN (`scat`.`txtfield_2` = 'Percentage') THEN (`scat`.`numfield_2` * `l`.`ticket_value`/100)
        END) AS `purchase_cost`,


        (CASE
            WHEN
                (`scat`.`txtfield_1` = 'Fixed')
            THEN
                CAST(IF(ISNULL(`l`.`apr_ticket_value`),
                        0,
                        `scat`.`numfield_1`)
                    AS DECIMAL (15 , 2 ))
            WHEN
                (`scat`.`txtfield_1` = 'Percentage')
            THEN
                CAST(IFNULL(((`scat`.`numfield_1` * `l`.`apr_ticket_value`) / 100),
                            0)
                    AS DECIMAL (15 , 2 ))
        END) AS `apr_reward`,
        (CASE
            WHEN
                (`scat`.`txtfield_2` = 'Fixed')
            THEN
                CAST(IF(ISNULL(`l`.`apr_ticket_value`),
                        0,
                        `scat`.`numfield_2`)
                    AS DECIMAL (15 , 2 ))
            WHEN
                (`scat`.`txtfield_2` = 'Percentage')
            THEN
                CAST(IFNULL(((`scat`.`numfield_2` * `l`.`apr_ticket_value`) / 100),
                            0)
                    AS DECIMAL (15 , 2 ))
        END) AS `apr_purchase_cost`,

        case
			WHEN `status` IN ('Terminated' , 'Completed',
            'Withdrawn', 'Declined',
            'Invalid Lead',
            'Verification Failed',
            'Rejected By All') THEN 'Past'
            ELSE 'Open'
		END as `leadtype`,
        `spl`.`lead_uid` AS `lead_uid`,
        `spl`.`total_count` AS `total_count`,
        `spl`.`inprocess_count` AS `inprocess_count`,
        `spl`.`accepted_count` AS `accepted_count`,
        `spl`.`rejected_count` AS `rejected_count`,
        `spl`.`terminated_count` AS `terminated_count`,
        `spl`.`inprogress_count` AS `inprogress_count`,
        `spl`.`approved_count` AS `approved_count`,
        `spl`.`declined_count` AS `declined_count`
    FROM
        (((((((`leads` `l`
        JOIN `users` `lg` ON ((`l`.`user_uid` = `lg`.`uid`)))
        LEFT JOIN `masterlist` `s` ON ((`l`.`state_uid` = `s`.`uid`)))
        LEFT JOIN `masterlist` `ct` ON ((`l`.`city_uid` = `ct`.`uid`)))
        JOIN `masterlist` `cat` ON ((`l`.`category_uid` = `cat`.`uid`)))
        JOIN `masterlist` `scat` ON ((`l`.`subcategory_uid` = `scat`.`uid`)))
        JOIN `masterlist` `tf` ON ((`l`.`timeframe_uid` = `tf`.`uid`)))
        LEFT JOIN `users` `ag` ON ((`l`.`assigned_to_uid` = `ag`.`uid`)))
        LEFT JOIN (SELECT 
            `sp_leads`.`lead_uid` AS `lead_uid`,
                COUNT(0) AS `total_count`,
                SUM(IF(((`sp_leads`.`acceptance_status` = 'Yet To View')
                    OR (`sp_leads`.`acceptance_status` = 'Viewed')), 1, 0)) AS `inprocess_count`,
                SUM(IF((`sp_leads`.`acceptance_status` = 'Accepted'), 1, 0)) AS `accepted_count`,
                SUM(IF((`sp_leads`.`acceptance_status` = 'Rejected'), 1, 0)) AS `rejected_count`,
                SUM(IF((`sp_leads`.`acceptance_status` = 'Terminated'), 1, 0)) AS `terminated_count`,
                SUM(IF(((`sp_leads`.`acceptance_status` = 'Accepted')
                    AND (`sp_leads`.`status` = 'In Progress')), 1, 0)) AS `inprogress_count`,
                SUM(IF(((`sp_leads`.`acceptance_status` = 'Accepted')
                    AND (`sp_leads`.`status` = 'Approved')), 1, 0)) AS `approved_count`,
                SUM(IF(((`sp_leads`.`acceptance_status` = 'Accepted')
                    AND (`sp_leads`.`status` = 'Declined')), 1, 0)) AS `declined_count`
        FROM
            `sp_leads`
        WHERE
            (`sp_leads`.`active` = 1)
        GROUP BY `sp_leads`.`lead_uid`) `spl` ON ((`spl`.`lead_uid` = `l`.`uid`))
    WHERE
        l.uid = uid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_leadserviceproviders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_leadserviceproviders`(`p_lead_uid` VARCHAR(40), `p_sp_uid` VARCHAR(40))
BEGIN

	select * from vw_leads where uid = p_lead_uid;

	SELECT 
        `l`.`uid` AS `lead_uid`,
        `spc`.`sp_uid` AS `sp_uid`,
        `u`.`organization` AS `organization`,
        IF((`spcl`.`state_uid` = ''),
            'All States',
            'Selected State') AS `state_presence`,
        (CASE
            WHEN
                (ISNULL(`spl`.`uid`)
                    OR (`spl`.`active` = 0))
            THEN
                0
            ELSE 1
        END) AS `sharing_status`,
        `spl`.`uid` AS `spl_uid`,
        `spl`.`shared_on` AS `shared_on`,
        `spl`.`viewed_on` AS `viewed_on`,
        `spl`.`acceptance_status` AS `acceptance_status`,
        `spl`.`accepted_on` AS `accepted_on`,
        `spl`.`status` AS `status`,
        `spl`.`apr_ticket_value` AS `apr_ticket_value`,
        `spl`.`active` AS `active`
    FROM
        ((((`leads` `l`
        JOIN `sp_catalog` `spc` ON (((`spc`.`category_uid` = `l`.`category_uid`)
            AND (`spc`.`subcategory_uid` = `l`.`subcategory_uid`)
            AND (`spc`.`active` = 1))))
        JOIN `users` `u` ON (((`u`.`uid` = `spc`.`sp_uid`)
            AND (`u`.`active` = 1))))
        LEFT JOIN `sp_catalog_locations` `spcl` ON ((`spcl`.`sp_catalog_uid` = `spc`.`uid`)))
        LEFT JOIN `sp_leads` `spl` ON ((`spl`.`sp_uid` = `spc`.`sp_uid` AND spl.lead_uid = l.uid)))
    WHERE
		l.uid = p_lead_uid and
        spc.sp_uid = IFNULL(p_sp_uid, spc.sp_uid) and
        ((`spcl`.`uid` IS NOT NULL)
            AND ((`spcl`.`state_uid` = '')
            OR (`spcl`.`state_uid` = IFNULL(`l`.`state_uid`, `spcl`.`state_uid`))));
            


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_locationmaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_locationmaster`()
BEGIN

	select DISTINCT 
		c.uid as 'country_uid',
		c.code as 'country_code',
		c.description as 'country_name',
		c.active as 'country_active'
	from masterlist as l
	INNER join masterlist as c on c.parent_uid = l.uid and c.active = 1
	where 
		l.code='_geo_locations'
	and c.code = 'IN'
	order by c.description;

    select DISTINCT 
		c.uid as 'country_uid',
        s.uid as 'state_uid',
		s.code as 'state_code',
		s.description as 'state_name',
		s.active as 'state_active'
	from masterlist as l
	INNER join masterlist as c on c.parent_uid = l.uid and c.active = 1
    inner join masterlist as s on s.parent_uid = c.uid and s.active = 1
	where 
		l.code='_geo_locations'
	and c.code = 'IN'
	order by c.uid, s.description;

	select DISTINCT 
		s.uid as 'state_uid',
        d.uid as 'district_uid',
		d.code as 'district_code',
		d.description as 'district_name',
		d.active as 'district_active'
	from masterlist as l
	INNER join masterlist as c on c.parent_uid = l.uid and c.active = 1
    inner join masterlist as s on s.parent_uid = c.uid and s.active = 1
    inner join masterlist as d on d.parent_uid = s.uid and d.active = 1
	where 
		l.code='_geo_locations'
	and c.code = 'IN'
	order by s.uid, d.description;
    
    select DISTINCT 
		s.uid as 'state_uid',
        d.uid as 'district_uid',
        ct.uid as 'city_uid',
		ct.code as 'city_code',
		ct.description as 'city_name',
		ct.active as 'city_active'
	from masterlist as l
	INNER join masterlist as c on c.parent_uid = l.uid and c.active = 1
    inner join masterlist as s on s.parent_uid = c.uid and s.active = 1
    inner join masterlist as d on d.parent_uid = s.uid and d.active = 1
    inner join masterlist as ct on ct.parent_uid = d.uid and ct.active = 1
	where 
		l.code='_geo_locations'
	and c.code = 'IN'
	order by d.uid, ct.description;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_locations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_locations`()
BEGIN

	select 
		c.uid as CountryUID
	,	s.uid as StateUID
	,	d.uid as DistrictUID
	,	ct.uid as CityUID
	, 	c.code as CountryCode
	, 	c.description as CountryName
	,	s.code as StateCode
	,	s.description as StateName
	,	d.code as DistrictCode
	,	d.description as DistrictName
	,	ct.code as CityCode
	,	ct.description as CityName
	from masterlist as l
	left join masterlist as c on c.parent_uid = l.uid
	left join masterlist as s on s.parent_uid = c.uid
	left join masterlist as d on d.parent_uid = s.uid
	left join masterlist as ct on ct.parent_uid = d.uid
	where 
		l.code = '_geo_locations'
	order by 
		c.description, s.description, d.description, ct.description;
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_masterlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_masterlist`(`parent_uid` VARCHAR(40))
BEGIN

    select 
        p1.uid, 
        p1.code, 
        p1.description, 
		p1.parent_uid,
        p1.active, 
        p1.seq,
        p1.txtfield_1,
        p1.txtfield_2,
        p1.numfield_1,
        p1.numfield_2,
        p1.createdon, 
        p1.createdby,
        p1.modifiedon,
        p1.modifiedby
	from masterlist as p1
	where ifnull(p1.parent_uid,'') = IFNULL(parent_uid,'');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_masterlistbycode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_masterlistbycode`(`parent_code` VARCHAR(30))
BEGIN
	select 
		l.uid, 
        l.code, 
        l.description, 
		l.parent_uid,
        l.active, 
        l.seq,
        l.txtfield_1,
        l.txtfield_2,
        l.numfield_1,
        l.numfield_2,
        l.createdon, 
        l.createdby,
        l.modifiedon,
        l.modifiedby
	from masterlist as l
    inner join masterlist as p on l.parent_uid = p.uid
    where p.code = parent_code
    order by seq;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_productcatalogmaster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_productcatalogmaster`()
BEGIN
  
    
    select DISTINCT 
		c.uid,
		c.code,
		c.description,
		c.active
	from masterlist as pc
	INNER join masterlist as c on c.parent_uid = pc.uid and c.active = 1
	left outer join masterlist as sc on sc.parent_uid = c.uid and sc.active = 1
	where 
		pc.code='_product_catalog'
	and sc.uid IS NOT NULL
	order by c.description;

	select
		c.uid as 'categoryuid',
		sc.uid ,
		sc.code,
		sc.description,
        sc.txtfield_1 as 'buy_type',
        sc.numfield_1 as 'buy_price',
        sc.txtfield_2 as 'sell_type',
        sc.numfield_2 as 'sell_price',
		sc.active
	from masterlist as pc
	left outer join masterlist as c on c.parent_uid = pc.uid and c.active = 1
	left outer join masterlist as sc on sc.parent_uid = c.uid and sc.active = 1
	where 
		pc.code='_product_catalog'
	and sc.uid IS NOT NULL
	order by sc.description;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_spleaddetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_spleaddetails`(`p_uid` VARCHAR(40))
BEGIN
	SELECT 
        `l`.`client_name` AS `client_name`,
        `l`.`client_phone` AS `client_phone`,
        `l`.`client_email` AS `client_email`,
        `l`.`state_uid` AS `state_uid`,
        `s`.`description` AS `state`,
        `l`.`other_state` AS `other_state`,
        `l`.`city_uid` AS `city_uid`,
        `ct`.`description` AS `city`,
        `l`.`other_city` AS `other_city`,
        `l`.`category_uid` AS `category_uid`,
        `cat`.`description` AS `category`,
        `l`.`subcategory_uid` AS `subcategory_uid`,
        `scat`.`description` AS `subcategory`,
        `l`.`timeframe_uid` AS `timeframe_uid`,
        `tf`.`description` AS `timeframe`,
        `l`.`ticket_value` AS `ticket_value`,
        `l`.`otherinfo` AS `otherinfo`,
        `l`.`status` AS `lead_status`,
        `spl`.`uid` AS `uid`,
        `spl`.`sp_uid` AS `sp_uid`,
        `spl`.`lead_uid` AS `lead_uid`,
        `spl`.`shared_on` AS `shared_on`,
        `spl`.`viewed_on` AS `viewed_on`,
        `spl`.`acceptance_status` AS `acceptance_status`,
        `spl`.`accepted_on` AS `accepted_on`,
        `spl`.`status` AS `status`,
        `spl`.`comments` AS `comments`,
        `spl`.`apr_ticket_value` AS `apr_ticket_value`,
        `spl`.`active` AS `active`,
        `spl`.`modifiedon` AS `modifiedon`,
        (CASE
            WHEN
                ((`l`.`status` = 'In Progress')
                    AND (`spl`.`acceptance_status` IN ('Yet To View' , 'Viewed')))
            THEN
                (TO_DAYS(NOW()) - TO_DAYS(`spl`.`shared_on`))
            WHEN
                ((`l`.`status` = 'In Progress')
                    AND (`spl`.`acceptance_status` = 'Accepted'))
            THEN
                (TO_DAYS(NOW()) - TO_DAYS(`spl`.`accepted_on`))
        END) AS `age`
    FROM
        ((((((`sp_leads` `spl`
        JOIN `leads` `l` ON ((`l`.`uid` = `spl`.`lead_uid`)))
        LEFT JOIN `masterlist` `s` ON ((`s`.`uid` = `l`.`state_uid`)))
        LEFT JOIN `masterlist` `ct` ON ((`ct`.`uid` = `l`.`city_uid`)))
        JOIN `masterlist` `cat` ON ((`cat`.`uid` = `l`.`category_uid`)))
        JOIN `masterlist` `scat` ON ((`scat`.`uid` = `l`.`subcategory_uid`)))
        LEFT JOIN `masterlist` `tf` ON ((`tf`.`uid` = `l`.`timeframe_uid`)))
    WHERE
       spl.uid = p_uid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_userdocuments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `get_userdocuments`(`user_uid` VARCHAR(40))
BEGIN
	select 
		d.uid,
		d.user_uid,
		d.doc_type_uid,
		dt.description as 'doc_type',
		d.doc_title,
		d.doc_path,
		d.verified,
		d.createdby,
		d.createdon,
		d.modifiedby,
		d.modifiedon
	from documents as d
	inner join masterlist as dt on dt.uid = d.doc_type_uid
	where
		d.user_uid = user_uid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `upd_leadclosure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `upd_leadclosure`(`p_lead_uid` VARCHAR(40), `p_source` VARCHAR(50))
BEGIN

	if p_source = 'leads' THEN
    
		select @lead_status := status from leads where uid = p_lead_uid;
		
        select @lead_status;
        
		IF @lead_status = 'Terminated' THEN

			update sp_leads
			set status = 'Terminated'
			,	comments = 'Terminated by System Admin'
			where lead_uid = p_lead_uid
			and	active = 1;

		END IF;
        
	ELSEIF p_source = 'sp_leads' THEN
		
		select @sp_total_count := count(*) 
        from sp_leads 
		where 
			lead_uid = p_lead_uid 
        and active = 1;
		
		select @splead_decline_count :=  count(*) 
        from sp_leads 
		where 
			lead_uid = p_lead_uid 
		and status in ('Declined')
		and active = 1;
        
        IF @splead_decline_count = @sp_total_count THEN
            update leads
			set	status = 'Rejected By All'
            where uid = lead_uid;
        
        END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_leads`
--

/*!50001 DROP VIEW IF EXISTS `vw_leads`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_leads` AS select `l`.`uid` AS `uid`,`l`.`user_uid` AS `user_uid`,`lg`.`name` AS `leadpasser`,`l`.`client_org` AS `client_org`,`l`.`client_name` AS `client_name`,`l`.`client_phone` AS `client_phone`,`l`.`client_email` AS `client_email`,`l`.`state_uid` AS `state_uid`,`s`.`description` AS `state`,`l`.`city_uid` AS `city_uid`,`ct`.`description` AS `city`,`l`.`other_state` AS `other_state`,`l`.`other_city` AS `other_city`,`l`.`category_uid` AS `category_uid`,`cat`.`description` AS `category`,`l`.`subcategory_uid` AS `subcategory_uid`,`scat`.`description` AS `subcategory`,`l`.`timeframe_uid` AS `timeframe_uid`,`tf`.`description` AS `timeframe`,`l`.`ticket_value` AS `ticket_value`,`l`.`otherinfo` AS `otherinfo`,`l`.`assigned_to_uid` AS `assigned_to_uid`,`ag`.`name` AS `agent`,`l`.`status` AS `status`,`l`.`createdby` AS `createdby`,`l`.`createdon` AS `createdon`,`l`.`modifiedby` AS `modifiedby`,`l`.`modifiedon` AS `modifiedon`,`l`.`comments_verification` AS `comments_verification`,(case when (`l`.`status` in ('Terminated','Completed','Withdrawn','Declined','Invalid Lead','Verification Failed','Rejected By All')) then (to_days(`l`.`modifiedon`) - to_days(`l`.`createdon`)) else (to_days(now()) - to_days(`l`.`createdon`)) end) AS `age`,(case when (`scat`.`txtfield_1` = 'Fixed') then `scat`.`numfield_1` when (`scat`.`txtfield_1` = 'Percentage') then ((`scat`.`numfield_1` * `l`.`ticket_value`) / 100) end) AS `reward`,(case when (`scat`.`txtfield_2` = 'Fixed') then `scat`.`numfield_2` when (`scat`.`txtfield_2` = 'Percentage') then ((`scat`.`numfield_2` * `l`.`ticket_value`) / 100) end) AS `purchase_cost`,(case when (`scat`.`txtfield_1` = 'Fixed') then cast(if(isnull(`l`.`apr_ticket_value`),0,`scat`.`numfield_1`) as decimal(15,2)) when (`scat`.`txtfield_1` = 'Percentage') then cast(ifnull(((`scat`.`numfield_1` * `l`.`apr_ticket_value`) / 100),0) as decimal(15,2)) end) AS `apr_reward`,(case when (`scat`.`txtfield_2` = 'Fixed') then cast(if(isnull(`l`.`apr_ticket_value`),0,`scat`.`numfield_2`) as decimal(15,2)) when (`scat`.`txtfield_2` = 'Percentage') then cast(ifnull(((`scat`.`numfield_2` * `l`.`apr_ticket_value`) / 100),0) as decimal(15,2)) end) AS `apr_purchase_cost`,(case when (`l`.`status` in ('Terminated','Completed','Withdrawn','Declined','Invalid Lead','Verification Failed','Rejected By All')) then 'Past' else 'Open' end) AS `leadtype` from (((((((`leads` `l` join `users` `lg` on((`l`.`user_uid` = `lg`.`uid`))) left join `masterlist` `s` on((`l`.`state_uid` = `s`.`uid`))) left join `masterlist` `ct` on((`l`.`city_uid` = `ct`.`uid`))) join `masterlist` `cat` on((`l`.`category_uid` = `cat`.`uid`))) join `masterlist` `scat` on((`l`.`subcategory_uid` = `scat`.`uid`))) join `masterlist` `tf` on((`l`.`timeframe_uid` = `tf`.`uid`))) left join `users` `ag` on((`l`.`assigned_to_uid` = `ag`.`uid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_leadserviceproviders`
--

/*!50001 DROP VIEW IF EXISTS `vw_leadserviceproviders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_leadserviceproviders` AS select `l`.`uid` AS `lead_uid`,`spc`.`sp_uid` AS `sp_uid`,`u`.`organization` AS `organization`,if((`spcl`.`state_uid` = ''),'All States','Selected State') AS `state_presence`,(case when (isnull(`spl`.`uid`) or (`spl`.`active` = 0)) then 0 else 1 end) AS `sharing_status`,`spl`.`uid` AS `spl_uid`,`spl`.`shared_on` AS `shared_on`,`spl`.`acceptance_status` AS `acceptance_status`,`spl`.`accepted_on` AS `accepted_on`,`spl`.`status` AS `status`,`spl`.`apr_ticket_value` AS `apr_ticket_value`,`spl`.`active` AS `active` from ((((`leads` `l` join `sp_catalog` `spc` on(((`spc`.`category_uid` = `l`.`category_uid`) and (`spc`.`subcategory_uid` = `l`.`subcategory_uid`) and (`spc`.`active` = 1)))) join `users` `u` on(((`u`.`uid` = `spc`.`sp_uid`) and (`u`.`active` = 1)))) left join `sp_catalog_locations` `spcl` on((`spcl`.`sp_catalog_uid` = `spc`.`uid`))) left join `sp_leads` `spl` on((`spl`.`sp_uid` = `spc`.`sp_uid`))) where ((`spcl`.`uid` is not null) and ((`spcl`.`state_uid` = '') or (`spcl`.`state_uid` = ifnull(`l`.`state_uid`,`spcl`.`state_uid`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_openleads`
--

/*!50001 DROP VIEW IF EXISTS `vw_openleads`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_openleads` AS select `l`.`uid` AS `uid`,`l`.`user_uid` AS `user_uid`,`lg`.`name` AS `leadpasser`,`l`.`client_org` AS `client_org`,`l`.`client_name` AS `client_name`,`l`.`client_phone` AS `client_phone`,`l`.`client_email` AS `client_email`,`l`.`state_uid` AS `state_uid`,`s`.`description` AS `state`,`l`.`city_uid` AS `city_uid`,`ct`.`description` AS `city`,`l`.`other_state` AS `other_state`,`l`.`other_city` AS `other_city`,`l`.`category_uid` AS `category_uid`,`cat`.`description` AS `category`,`l`.`subcategory_uid` AS `subcategory_uid`,`scat`.`description` AS `subcategory`,`l`.`timeframe_uid` AS `timeframe_uid`,`tf`.`description` AS `timeframe`,`l`.`ticket_value` AS `ticket_value`,`l`.`otherinfo` AS `otherinfo`,`l`.`assigned_to_uid` AS `assigned_to_uid`,`ag`.`name` AS `agent`,`l`.`status` AS `status`,`l`.`createdby` AS `createdby`,`l`.`createdon` AS `createdon`,`l`.`modifiedby` AS `modifiedby`,`l`.`modifiedon` AS `modifiedon`,(to_days(now()) - to_days(`l`.`createdon`)) AS `age`,(case when (`scat`.`txtfield_1` = 'Fixed') then `scat`.`numfield_1` when (`scat`.`txtfield_1` = 'Percentage') then ((`scat`.`numfield_1` * `l`.`ticket_value`) / 100) end) AS `reward`,(case when (`scat`.`txtfield_2` = 'Fixed') then `scat`.`numfield_2` when (`scat`.`txtfield_2` = 'Percentage') then ((`scat`.`numfield_2` * `l`.`ticket_value`) / 100) end) AS `purchase_cost`,`spl`.`lead_uid` AS `lead_uid`,`spl`.`total_count` AS `total_count`,`spl`.`inprocess_count` AS `inprocess_count`,`spl`.`accepted_count` AS `accepted_count`,`spl`.`rejected_count` AS `rejected_count`,`spl`.`terminated_count` AS `terminated_count`,`spl`.`inprogress_count` AS `inprogress_count`,`spl`.`approved_count` AS `approved_count`,`spl`.`declined_count` AS `declined_count`,(case when (`spl`.`total_count` = `spl`.`rejected_count`) then 'Rejected' when (`spl`.`total_count` = `spl`.`acceptance_terminated_count`) then 'Terminated' when (`spl`.`total_count` = `spl`.`declined_count`) then 'Declined' when (`spl`.`total_count` = `spl`.`approved_count`) then 'Approved' when (`spl`.`accepted_count` = 0) then 'None Accepted' when (`spl`.`total_count` = `spl`.`terminated_count`) then 'Terminated' when ((`spl`.`inprocess_count` = 0) and (`spl`.`inprogress_count` = 0) and (`spl`.`approved_count` > 0)) then 'Approved' when ((`spl`.`inprocess_count` = 0) and (`spl`.`inprogress_count` = 0) and ((`spl`.`terminated_count` > 0) or (`spl`.`declined_count` > 0))) then 'Declined' when ((`spl`.`inprogress_count` > 0) and (`spl`.`approved_count` = 0)) then 'In Progress' when (((`spl`.`inprogress_count` > 0) or (`spl`.`inprocess_count` > 0)) and (`spl`.`approved_count` > 0)) then 'Approved by some' else 'In Progress' end) AS `sp_approvals` from ((((((((`leads` `l` join `users` `lg` on((`l`.`user_uid` = `lg`.`uid`))) left join `masterlist` `s` on((`l`.`state_uid` = `s`.`uid`))) left join `masterlist` `ct` on((`l`.`city_uid` = `ct`.`uid`))) join `masterlist` `cat` on((`l`.`category_uid` = `cat`.`uid`))) join `masterlist` `scat` on((`l`.`subcategory_uid` = `scat`.`uid`))) join `masterlist` `tf` on((`l`.`timeframe_uid` = `tf`.`uid`))) left join `users` `ag` on((`l`.`assigned_to_uid` = `ag`.`uid`))) left join `vw_spleads_counts` `spl` on((`spl`.`lead_uid` = `l`.`uid`))) where (`l`.`status` not in ('Terminated','Completed','Withdrawn','Declined','Invalid Lead','Verification Failed','Rejected By All')) order by (case when (`spl`.`total_count` = `spl`.`rejected_count`) then 'Rejected' when (`spl`.`total_count` = `spl`.`acceptance_terminated_count`) then 'Terminated' when (`spl`.`total_count` = `spl`.`declined_count`) then 'Declined' when (`spl`.`total_count` = `spl`.`approved_count`) then 'Approved' when (`spl`.`accepted_count` = 0) then 'None Accepted' when (`spl`.`total_count` = `spl`.`terminated_count`) then 'Terminated' when ((`spl`.`inprocess_count` = 0) and (`spl`.`inprogress_count` = 0) and (`spl`.`approved_count` > 0)) then 'Approved' when ((`spl`.`inprocess_count` = 0) and (`spl`.`inprogress_count` = 0) and ((`spl`.`terminated_count` > 0) or (`spl`.`declined_count` > 0))) then 'Declined' when ((`spl`.`inprogress_count` > 0) and (`spl`.`approved_count` = 0)) then 'In Progress' when ((`spl`.`inprogress_count` > 0) and (`spl`.`approved_count` > 0)) then 'Approved by some' else 'In Progress' end),`l`.`client_name`,`l`.`modifiedon` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_spleads_counts`
--

/*!50001 DROP VIEW IF EXISTS `vw_spleads_counts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_spleads_counts` AS select `sp_leads`.`lead_uid` AS `lead_uid`,count(0) AS `total_count`,sum(if(((`sp_leads`.`acceptance_status` = 'Yet To View') or (`sp_leads`.`acceptance_status` = 'Viewed')),1,0)) AS `inprocess_count`,sum(if((`sp_leads`.`acceptance_status` = 'Accepted'),1,0)) AS `accepted_count`,sum(if((`sp_leads`.`acceptance_status` = 'Rejected'),1,0)) AS `rejected_count`,sum(if((`sp_leads`.`acceptance_status` = 'Terminated'),1,0)) AS `acceptance_terminated_count`,sum(if(((`sp_leads`.`acceptance_status` = 'Accepted') and (`sp_leads`.`status` = 'In Progress')),1,0)) AS `inprogress_count`,sum(if(((`sp_leads`.`acceptance_status` = 'Accepted') and (`sp_leads`.`status` = 'Approved')),1,0)) AS `approved_count`,sum(if(((`sp_leads`.`acceptance_status` = 'Accepted') and (`sp_leads`.`status` = 'Declined')),1,0)) AS `declined_count`,sum(if((`sp_leads`.`status` = 'Terminated'),1,0)) AS `terminated_count` from `sp_leads` where (`sp_leads`.`active` = 1) group by `sp_leads`.`lead_uid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-23 10:34:55
