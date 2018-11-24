-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: edwise
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
-- Table structure for table `ACL`
--

DROP TABLE IF EXISTS `ACL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(512) DEFAULT NULL,
  `property` varchar(512) DEFAULT NULL,
  `accessType` varchar(512) DEFAULT NULL,
  `permission` varchar(512) DEFAULT NULL,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACL`
--

LOCK TABLES `ACL` WRITE;
/*!40000 ALTER TABLE `ACL` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AccessToken`
--

DROP TABLE IF EXISTS `AccessToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessToken` (
  `id` varchar(255) NOT NULL,
  `ttl` int(11) DEFAULT NULL,
  `scopes` text,
  `created` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AccessToken`
--

LOCK TABLES `AccessToken` WRITE;
/*!40000 ALTER TABLE `AccessToken` DISABLE KEYS */;
INSERT INTO `AccessToken` VALUES ('0v1bHuAklEmfrTIkneWgxBdDLPVmmGVXY2jQ8sUqOMeSgMEJpdwG1bNo0mpSkBFf',1209600,NULL,'2018-05-04 18:08:47',1),('1PFHhry2GGrzsfWm4BmMACGDxSRtyDTznQAMYXeHdqhJnwywl5xUMphA8YbtkTwx',1209600,NULL,'2018-04-27 10:58:39',2),('A2kTAxWaLmuQz9q9MIS4c6aHSvdulRcQHywO5GKBstIBkxC4fj1eLcQq9286yoqz',1209600,NULL,'2018-05-04 16:34:00',1),('AbbscM3945JrH5MgFHPzUJAdaUhgrLm3z17PTc2ssSfZUO3ipb8RK5nmtmYJdbCY',1209600,NULL,'2018-05-04 04:13:45',1),('c47Qldooe8WldJh6lGownyldCqGr7xAjZl4Qk3rQvP0TDt8gB6JaDnAEbfWDSBxa',1209600,NULL,'2018-05-04 16:28:59',1),('COWNebkHNxg1QsciTe1RihC4BPEXz3WfHjyXg60k5N9VwYEB0Paz3z3Ko1PlyQk5',1209600,NULL,'2018-05-04 18:05:45',1),('dNmGbOJITIstqgQi2F1uMmh9bFcAlfAI8VE0hQjrqe9adZfBMnIphWHRfe36McHA',1209600,NULL,'2018-04-26 17:50:46',1),('DPSoYFUI9fWbWDwBMGMY9cAaIohLq3eqFl2aI0R9FfZBRIBC8haJLZVT4XB4mdcj',1209600,NULL,'2018-05-04 17:01:11',1),('ds5F1qmqwSd5OSAvrjrf9mZ7BC5y0x0KIh7BHbis7D6AhQl0wcfLCJz0rxJHJcFN',1209600,NULL,'2018-05-04 18:06:03',1),('FmDw3CgXTF7tckE4wT0TpxUOBrefBHudjWBC5sIm6yNLDrHZ1cCdYczmGD4rbbd7',1209600,NULL,'2018-05-05 04:13:34',1),('FnaCHh0YGnmr65umNcE2TfqJ4a2WCuPWtc3axTXAXGw3bJBDmC6jTMg0Gj2DVELM',1209600,NULL,'2018-05-04 17:04:39',1),('IgBb7yIisJuhfiBmaSr83NMThtFQZCQCukFO9ryCpyDeZfKr8ylzcPBD2AJhTgon',1209600,NULL,'2018-04-27 04:25:19',1),('iHvBComL0Vy0glTBd7crHdUnwlmQJxiCkEru26Ofg3LoxL4MlpUhGJ7OaSDoElBD',1209600,NULL,'2018-05-04 16:41:54',1),('JtfhwbVOa01Z2dFaoUUfRjKxSA55CU0DaWGVxAuKIG1RWz3kUHnraXVZhukvzlPM',1209600,NULL,'2018-05-04 17:03:32',1),('kDQbUdcN5FkOpRC4vvW4gU3uREvywObMWXiKdyuAHzBG0qTT8np1LPJoIgrZtk85',1209600,NULL,'2018-04-26 17:43:21',2),('KDqEExclGGGEARELS01qA5Ezc43Jt8lAcOlxnj6e5XbiyESbmh30QBoYoXA74BCL',1209600,NULL,'2018-05-04 04:13:44',1),('kHWwqu5l9FEHGd9AMYqk0Tpg4gf35YRKd3BcV0WUaOKP3JLyOY60C2HM17M1TwVr',1209600,NULL,'2018-05-04 16:50:14',1),('Kp51j65bvn72CL8MFVsbhfkgUguhaGMAvHG6c0se8JDhX2Om1hZwuWkjD5d8yTtk',1209600,NULL,'2018-05-04 18:09:09',1),('KTndmyoNgI2HRrYS232rqdmZIdADAtB6sJrLs3oqCcfqkM14F7VMntTdCqUWejis',1209600,NULL,'2018-05-04 16:53:51',1),('L0jAZu7bPYSq4zJgCNCMZHtX1FQHRTqIIv6wiHj7KmaKMbq47Kxk2CjJTMO9BYjI',1209600,NULL,'2018-04-28 11:22:21',1),('LSqzGKh4lncjEQGXrPpGC1iLjCgvvsPh6Ex7SPPu4aP4PnpY9C8bhu8fE7IjqpC0',1209600,NULL,'2018-05-04 16:55:26',1),('n4lSjW73RoEeB30ELpVQ3Wpc8qlxztBd4gOPfeNX19EE0iBAAN7ABpFzjhUAo7J7',1209600,NULL,'2018-05-04 16:52:12',1),('PXFBGCCEnVXus0ziMYcGqvw1Sl8kwCUGW82oFjby1Fk36J4jUAqXmXKb0GyRpDxb',1209600,NULL,'2018-05-04 18:08:56',1),('t2ECqp75aMb69fXrQNxGz0VTeZDOWyb9MexlAHRVn5TZ9bqmyc6ckBCFjFlw8nCz',1209600,NULL,'2018-05-04 16:42:18',1),('tnZTur7kGBrbz2vP4VHJNvgAwDdukTRPfBeqpGEkycLUCvb4yZe1NkVqWWbguWPc',1209600,NULL,'2018-05-04 17:49:58',1),('TpjpfZnDiRyUw6x4xayluHiXOeKlp2l0zRaszuu89GZWojbwJ9ApPDGKRdCy9Ahi',1209600,NULL,'2018-05-04 16:34:19',1),('Uomc80BmuRiFrMpDG7KFTN7KnXF3qP7ZL7QikyunZSTClozHYTWQxArXqEBrgknQ',1209600,NULL,'2018-05-04 16:44:36',1),('v61jv3pf6kyL4ruGHnqQCiZwDu33vwPKs0ZlWEblpzi9hIJcbx2pGdveYsDsYsqF',1209600,NULL,'2018-05-04 16:42:32',1),('vZoqThPHOxuOIfRSH8x88irXAHX0SrQlV8qwHNF352T4mJv0guGfACL6bDS2QSWt',1209600,NULL,'2018-05-04 16:49:19',1),('WvIzmerkD5Rmvm2OURjpkC6ss2kad4vQFTxVhsGiSIs6crLD4GF6RyzAclCjIYwz',1209600,NULL,'2018-05-04 17:13:51',1),('xNsOse5tsjHUZGbUEleqGAk1HE1hL4y1y4D8hvXl6WRdCpCybiQFgnFk1XeIHgeo',1209600,NULL,'2018-05-04 18:12:39',1);
/*!40000 ALTER TABLE `AccessToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdmissionCategory`
--

DROP TABLE IF EXISTS `AdmissionCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdmissionCategory` (
  `ACId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`ACId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdmissionCategory`
--

LOCK TABLES `AdmissionCategory` WRITE;
/*!40000 ALTER TABLE `AdmissionCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdmissionCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Affiliation`
--

DROP TABLE IF EXISTS `Affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Affiliation` (
  `Aid` int(11) NOT NULL AUTO_INCREMENT,
  `ACode` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`Aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Affiliation`
--

LOCK TABLES `Affiliation` WRITE;
/*!40000 ALTER TABLE `Affiliation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Affiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campus`
--

DROP TABLE IF EXISTS `Campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campus` (
  `campId` int(11) NOT NULL AUTO_INCREMENT,
  `campCode` varchar(64) DEFAULT NULL,
  `campName` varchar(256) DEFAULT NULL,
  `campAddress` varchar(512) DEFAULT NULL,
  `campCity` varchar(64) DEFAULT NULL,
  `campContact` varchar(16) DEFAULT NULL,
  `InstCatId` int(11) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`campId`),
  KEY `InstCatId` (`InstCatId`),
  CONSTRAINT `Campus_ibfk_1` FOREIGN KEY (`InstCatId`) REFERENCES `InstituteCategory` (`instcatId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campus`
--

LOCK TABLES `Campus` WRITE;
/*!40000 ALTER TABLE `Campus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `Cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `shortName` varchar(8) DEFAULT NULL,
  `instcatId` int(11) DEFAULT NULL,
  `CTId` int(11) DEFAULT NULL,
  `Aid` int(11) DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `cdId` int(11) DEFAULT NULL,
  `CourseDetails` json DEFAULT NULL,
  `FeeApplicability` tinyint(1) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cid`),
  KEY `instcatId` (`instcatId`),
  KEY `CTId` (`CTId`),
  KEY `Aid` (`Aid`),
  KEY `cdId` (`cdId`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`instcatId`) REFERENCES `InstituteCategory` (`instcatId`),
  CONSTRAINT `Course_ibfk_2` FOREIGN KEY (`CTId`) REFERENCES `CourseType` (`CTId`),
  CONSTRAINT `Course_ibfk_3` FOREIGN KEY (`Aid`) REFERENCES `Affiliation` (`Aid`),
  CONSTRAINT `Course_ibfk_4` FOREIGN KEY (`cdId`) REFERENCES `CourseDuration` (`cdId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseCampus`
--

DROP TABLE IF EXISTS `CourseCampus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseCampus` (
  `Cid` int(11) DEFAULT NULL,
  `campId` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  KEY `Cid` (`Cid`),
  KEY `campId` (`campId`),
  CONSTRAINT `CourseCampus_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `Course` (`Cid`),
  CONSTRAINT `CourseCampus_ibfk_2` FOREIGN KEY (`campId`) REFERENCES `Campus` (`campId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseCampus`
--

LOCK TABLES `CourseCampus` WRITE;
/*!40000 ALTER TABLE `CourseCampus` DISABLE KEYS */;
/*!40000 ALTER TABLE `CourseCampus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseDuration`
--

DROP TABLE IF EXISTS `CourseDuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseDuration` (
  `cdId` int(11) NOT NULL AUTO_INCREMENT,
  `cdname` varchar(256) DEFAULT NULL,
  `inYears` int(11) DEFAULT NULL,
  `inMonths` int(11) DEFAULT NULL,
  `inDays` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cdId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseDuration`
--

LOCK TABLES `CourseDuration` WRITE;
/*!40000 ALTER TABLE `CourseDuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `CourseDuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseSubject`
--

DROP TABLE IF EXISTS `CourseSubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseSubject` (
  `Cid` int(11) DEFAULT NULL,
  `Sid` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  KEY `Cid` (`Cid`),
  KEY `Sid` (`Sid`),
  CONSTRAINT `CourseSubject_ibfk_1` FOREIGN KEY (`Cid`) REFERENCES `Course` (`Cid`),
  CONSTRAINT `CourseSubject_ibfk_2` FOREIGN KEY (`Sid`) REFERENCES `Subject` (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseSubject`
--

LOCK TABLES `CourseSubject` WRITE;
/*!40000 ALTER TABLE `CourseSubject` DISABLE KEYS */;
/*!40000 ALTER TABLE `CourseSubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseType`
--

DROP TABLE IF EXISTS `CourseType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseType` (
  `CTId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`CTId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseType`
--

LOCK TABLES `CourseType` WRITE;
/*!40000 ALTER TABLE `CourseType` DISABLE KEYS */;
/*!40000 ALTER TABLE `CourseType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `Did` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`Did`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fee`
--

DROP TABLE IF EXISTS `Fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fee` (
  `Fid` int(11) NOT NULL AUTO_INCREMENT,
  `FGId` int(11) DEFAULT NULL,
  `Feename` varchar(64) DEFAULT NULL,
  `shortName` varchar(8) DEFAULT NULL,
  `ConcessionApplicability` tinyint(1) DEFAULT NULL,
  `FineApplicability` tinyint(1) DEFAULT NULL,
  `IsRefundable` tinyint(1) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`Fid`),
  KEY `FGId` (`FGId`),
  CONSTRAINT `Fee_ibfk_1` FOREIGN KEY (`FGId`) REFERENCES `FeeGroup` (`FGId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fee`
--

LOCK TABLES `Fee` WRITE;
/*!40000 ALTER TABLE `Fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeeGroup`
--

DROP TABLE IF EXISTS `FeeGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeeGroup` (
  `FGId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`FGId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeeGroup`
--

LOCK TABLES `FeeGroup` WRITE;
/*!40000 ALTER TABLE `FeeGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `FeeGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Institute`
--

DROP TABLE IF EXISTS `Institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Institute` (
  `instId` int(11) NOT NULL AUTO_INCREMENT,
  `instCode` varchar(32) DEFAULT NULL,
  `instName` varchar(256) DEFAULT NULL,
  `instAddress` varchar(512) DEFAULT NULL,
  `instCity` varchar(64) DEFAULT NULL,
  `instCatId` int(11) DEFAULT NULL,
  `societyID` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`instId`),
  KEY `instCatId` (`instCatId`),
  KEY `societyID` (`societyID`),
  CONSTRAINT `Institute_ibfk_1` FOREIGN KEY (`instCatId`) REFERENCES `InstituteCategory` (`instcatId`),
  CONSTRAINT `Institute_ibfk_2` FOREIGN KEY (`societyID`) REFERENCES `Society` (`socId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Institute`
--

LOCK TABLES `Institute` WRITE;
/*!40000 ALTER TABLE `Institute` DISABLE KEYS */;
INSERT INTO `Institute` VALUES (1,'AJCKKD','Aditya Jr College','Sri','KKD',1,1,0,'2018-04-11 15:12:49','2018-04-11 20:42:49');
/*!40000 ALTER TABLE `Institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InstituteCampus`
--

DROP TABLE IF EXISTS `InstituteCampus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstituteCampus` (
  `instId` int(11) DEFAULT NULL,
  `campId` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  KEY `instId` (`instId`),
  KEY `campId` (`campId`),
  CONSTRAINT `InstituteCampus_ibfk_1` FOREIGN KEY (`instId`) REFERENCES `Institute` (`instId`),
  CONSTRAINT `InstituteCampus_ibfk_2` FOREIGN KEY (`campId`) REFERENCES `Campus` (`campId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InstituteCampus`
--

LOCK TABLES `InstituteCampus` WRITE;
/*!40000 ALTER TABLE `InstituteCampus` DISABLE KEYS */;
/*!40000 ALTER TABLE `InstituteCampus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InstituteCategory`
--

DROP TABLE IF EXISTS `InstituteCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstituteCategory` (
  `instcatId` int(11) NOT NULL AUTO_INCREMENT,
  `instcatName` varchar(256) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`instcatId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InstituteCategory`
--

LOCK TABLES `InstituteCategory` WRITE;
/*!40000 ALTER TABLE `InstituteCategory` DISABLE KEYS */;
INSERT INTO `InstituteCategory` VALUES (1,'Schools',0,'2018-04-11 15:03:01','2018-04-11 20:33:01'),(2,'Jr Colleges',0,'2018-04-11 15:03:57','2018-04-11 20:33:57');
/*!40000 ALTER TABLE `InstituteCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoleMapping`
--

DROP TABLE IF EXISTS `RoleMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleMapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `principalType` varchar(512) DEFAULT NULL,
  `principalId` varchar(255) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `principalId` (`principalId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoleMapping`
--

LOCK TABLES `RoleMapping` WRITE;
/*!40000 ALTER TABLE `RoleMapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `RoleMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Society`
--

DROP TABLE IF EXISTS `Society`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Society` (
  `socId` int(11) NOT NULL AUTO_INCREMENT,
  `socCode` varchar(16) DEFAULT NULL,
  `socName` varchar(256) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `RegNo` varchar(32) DEFAULT NULL,
  `GSTIN` varchar(64) DEFAULT NULL,
  `PAN` varchar(32) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`socId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Society`
--

LOCK TABLES `Society` WRITE;
/*!40000 ALTER TABLE `Society` DISABLE KEYS */;
INSERT INTO `Society` VALUES (1,'AA001','Aditya Academy','Sringar','Kakinada','1234','1234','1234',0,'2018-04-11 09:12:10','2018-04-11 14:42:10');
/*!40000 ALTER TABLE `Society` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SocietyFeeGroup`
--

DROP TABLE IF EXISTS `SocietyFeeGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SocietyFeeGroup` (
  `socId` int(11) NOT NULL AUTO_INCREMENT,
  `FGId` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`socId`),
  KEY `FGId` (`FGId`),
  CONSTRAINT `SocietyFeeGroup_ibfk_1` FOREIGN KEY (`FGId`) REFERENCES `FeeGroup` (`FGId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SocietyFeeGroup`
--

LOCK TABLES `SocietyFeeGroup` WRITE;
/*!40000 ALTER TABLE `SocietyFeeGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `SocietyFeeGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subject`
--

DROP TABLE IF EXISTS `Subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subject` (
  `Sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `shortName` varchar(8) DEFAULT NULL,
  `Did` int(11) DEFAULT NULL,
  `instcatId` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sid`),
  KEY `Did` (`Did`),
  KEY `instcatId` (`instcatId`),
  CONSTRAINT `Subject_ibfk_1` FOREIGN KEY (`Did`) REFERENCES `Department` (`Did`),
  CONSTRAINT `Subject_ibfk_2` FOREIGN KEY (`instcatId`) REFERENCES `InstituteCategory` (`instcatId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subject`
--

LOCK TABLES `Subject` WRITE;
/*!40000 ALTER TABLE `Subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `Subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realm` varchar(512) DEFAULT NULL,
  `username` varchar(512) DEFAULT NULL,
  `password` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `emailVerified` tinyint(1) DEFAULT NULL,
  `verificationToken` varchar(512) DEFAULT NULL,
  `levelid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'PSR Kumar','kumar','$2a$10$eO1nz58E08kEx8MKqlID3Oei.oDxR4OGqNCGc1Pu8hAda5bIIvX7u','kumarpsr9@gmail.com',0,NULL,NULL),(2,'kumar','kiran','$2a$10$d.jNFiwuC496dQVRHisi9.NMGuOurcn23O.IZ4VY7ckhRpdQJkzVy','kumar@aditya.ac.in',0,NULL,1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Year`
--

DROP TABLE IF EXISTS `Year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Year` (
  `yearId` int(11) NOT NULL AUTO_INCREMENT,
  `yearCode` varchar(16) DEFAULT NULL,
  `yearLabel` varchar(16) DEFAULT NULL,
  `yearType` varchar(10) DEFAULT NULL,
  `yearStart` date DEFAULT NULL,
  `yearEnd` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`yearId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Year`
--

LOCK TABLES `Year` WRITE;
/*!40000 ALTER TABLE `Year` DISABLE KEYS */;
/*!40000 ALTER TABLE `Year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `mainmenu` varchar(50) NOT NULL,
  `mainmenu_order` int(11) NOT NULL,
  `mainmenu_icon` varchar(50) NOT NULL DEFAULT 'fa fa-th-list',
  `submenu` varchar(50) NOT NULL,
  `submenu_order` int(11) NOT NULL,
  `submenu_icon` varchar(50) NOT NULL DEFAULT 'fa fa-angle-right',
  `href` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `controller` varchar(100) DEFAULT NULL,
  `min_level` int(11) NOT NULL DEFAULT '4',
  `side_menu` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Masters',1,'fa fa-th-list','Organization',1,'fa fa-university','#organization','/organization','organization.html','organization_ctrl',2,0),(2,'Masters',1,'fa fa-th-list','Institute',2,'fa fa-building-o','#institute','/institute','institute.html','institute_ctrl',2,0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_level`
--

DROP TABLE IF EXISTS `user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_level` (
  `ul_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_code` varchar(4) NOT NULL,
  `level_name` varchar(50) NOT NULL,
  PRIMARY KEY (`ul_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_level`
--

LOCK TABLES `user_level` WRITE;
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
INSERT INTO `user_level` VALUES (1,'MGMT','Management'),(2,'ADMN','Administrator'),(3,'COOD','Co Ordinator'),(4,'PRIN','Principal'),(5,'OPER','Operator'),(6,'FACL','Faculty'),(7,'PRNT','Parent'),(8,'STUD','Student');
/*!40000 ALTER TABLE `user_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_menu`
--

DROP TABLE IF EXISTS `user_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `menu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu`
--

LOCK TABLES `user_menu` WRITE;
/*!40000 ALTER TABLE `user_menu` DISABLE KEYS */;
INSERT INTO `user_menu` VALUES (482,1,1),(483,1,2);
/*!40000 ALTER TABLE `user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'edwise'
--

--
-- Dumping routines for database 'edwise'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-23 10:31:53
