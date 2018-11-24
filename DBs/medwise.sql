-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: medwise
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
-- Table structure for table `CaseSheet`
--

DROP TABLE IF EXISTS `CaseSheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CaseSheet` (
  `caseSheetId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `bedId` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `visitedDoctor` int(11) DEFAULT NULL,
  `consultationType` int(11) DEFAULT NULL,
  `diagnosis` varchar(512) DEFAULT NULL,
  `investigationsPerformed` json DEFAULT NULL,
  `investigationResults` json DEFAULT NULL,
  `prescribedMedication` json DEFAULT NULL,
  `givenMadication` json DEFAULT NULL,
  `monitoring` json DEFAULT NULL,
  `notes` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`caseSheetId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  KEY `bedId` (`bedId`),
  KEY `visitedDoctor` (`visitedDoctor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CaseSheet`
--

LOCK TABLES `CaseSheet` WRITE;
/*!40000 ALTER TABLE `CaseSheet` DISABLE KEYS */;
INSERT INTO `CaseSheet` VALUES (1,1,1,9,'2018-05-30',16,2,'','null','[{\"resultGiven\": false}]','null',NULL,NULL,'','2018-05-30 05:46:37','2018-05-30 05:46:37',1,1),(2,1,1,9,'2018-05-30',28,10,'','null','[{\"resultGiven\": false}]','null',NULL,NULL,'','2018-05-30 05:46:52','2018-05-30 05:46:52',1,1),(3,5,6,31,'2018-05-30',16,2,'','[{\"price\": \"50\", \"test_id\": \"3\", \"test_name\": \"LIPID PROFILE\", \"ref_values\": [{\"Gender\": \"All\", \"endRange\": \"200\", \"$$hashKey\": \"object:3411\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"25\", \"subInvestigation\": \"TRIGLYCERIDES\"}, {\"Gender\": \"All\", \"endRange\": \"250\", \"$$hashKey\": \"object:3562\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"130\", \"subInvestigation\": \"TOTAL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:3578\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"35\", \"subInvestigation\": \"HDL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"120\", \"$$hashKey\": \"object:3594\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"LDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"27\", \"$$hashKey\": \"object:3610\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"VLDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"4.3\", \"$$hashKey\": \"object:3626\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"2.9\", \"endNumerator\": \"0.7\", \"startNumerator\": \"3.6\", \"subInvestigation\": \"TOTAL/HDL CHOLESTEROL RATIO\"}, {\"Gender\": \"All\", \"endRange\": \"2.7\", \"$$hashKey\": \"object:3690\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.5\", \"subInvestigation\": \"LDL/HDL CHOLESTEROL RATIO\"}]}]','[{\"price\": \"50\", \"test_id\": \"3\", \"$$hashKey\": \"object:2697\", \"test_name\": \"LIPID PROFILE\", \"ref_values\": [{\"Gender\": \"All\", \"result\": \"56\", \"endRange\": \"200\", \"$$hashKey\": \"object:3411\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"25\", \"subInvestigation\": \"TRIGLYCERIDES\"}, {\"Gender\": \"All\", \"result\": \"135\", \"endRange\": \"250\", \"$$hashKey\": \"object:3562\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"130\", \"subInvestigation\": \"TOTAL CHOLESTEROL\"}, {\"Gender\": \"All\", \"result\": \"56\", \"endRange\": \"70\", \"$$hashKey\": \"object:3578\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"35\", \"subInvestigation\": \"HDL CHOLESTEROL\"}, {\"Gender\": \"All\", \"result\": \"67\", \"endRange\": \"120\", \"$$hashKey\": \"object:3594\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"LDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"result\": \"19\", \"endRange\": \"27\", \"$$hashKey\": \"object:3610\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"VLDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"result\": \"3.2\", \"endRange\": \"4.3\", \"$$hashKey\": \"object:3626\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"2.9\", \"endNumerator\": \"0.7\", \"startNumerator\": \"3.6\", \"subInvestigation\": \"TOTAL/HDL CHOLESTEROL RATIO\"}, {\"Gender\": \"All\", \"result\": \"2.0\", \"endRange\": \"2.7\", \"$$hashKey\": \"object:3690\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.5\", \"subInvestigation\": \"LDL/HDL CHOLESTEROL RATIO\"}], \"resultGiven\": true}]','null',NULL,NULL,'','2018-05-30 09:09:51','2018-05-30 10:31:11',1,1),(4,10,11,NULL,'2018-05-31',16,NULL,NULL,'[{\"test_id\": \"7\", \"$$hashKey\": \"object:9359\", \"test_name\": \"DENGUE\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}], \"paid_amount\": \"50\"}]','[{\"test_id\": \"7\", \"$$hashKey\": \"object:9359\", \"test_name\": \"DENGUE\", \"ref_values\": [{\"Gender\": \"All\", \"result\": \"NEGATIVE\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"result\": \"NEGATIVE\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"result\": \"NEGATIVE\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}], \"paid_amount\": \"50\", \"resultGiven\": true}]',NULL,NULL,NULL,NULL,'2018-05-31 06:04:12','2018-05-31 06:04:56',1,1),(5,11,12,20,'2018-05-01',16,2,'','[{\"price\": \"50\", \"test_id\": \"4\", \"test_name\": \"VIROLOGY\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:3973\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BLOOD FOR HIV(TRIDOT)\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:4309\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HEPATISIS B ANTIGEN(HbsAg)\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:4994\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HEPATITIS C VIRUS(HCV)\"}]}, {\"price\": \"50\", \"test_id\": \"6\", \"test_name\": \"BLOOD GROUPING\", \"ref_values\": [{\"Array\": \"A,B,AB,0\", \"Gender\": \"All\", \"$$hashKey\": \"object:5677\", \"rangeType\": \"Array\", \"unit_name\": \"-\", \"subInvestigation\": \"BLOOD GROUP\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:5831\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"RH-TYPE\"}]}, {\"price\": \"50\", \"test_id\": \"3\", \"test_name\": \"LIPID PROFILE\", \"ref_values\": [{\"Gender\": \"All\", \"endRange\": \"200\", \"$$hashKey\": \"object:3411\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"25\", \"subInvestigation\": \"TRIGLYCERIDES\"}, {\"Gender\": \"All\", \"endRange\": \"250\", \"$$hashKey\": \"object:3562\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"130\", \"subInvestigation\": \"TOTAL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:3578\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"35\", \"subInvestigation\": \"HDL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"120\", \"$$hashKey\": \"object:3594\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"LDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"27\", \"$$hashKey\": \"object:3610\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"VLDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"4.3\", \"$$hashKey\": \"object:3626\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"2.9\", \"endNumerator\": \"0.7\", \"startNumerator\": \"3.6\", \"subInvestigation\": \"TOTAL/HDL CHOLESTEROL RATIO\"}, {\"Gender\": \"All\", \"endRange\": \"2.7\", \"$$hashKey\": \"object:3690\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.5\", \"subInvestigation\": \"LDL/HDL CHOLESTEROL RATIO\"}]}]','[{\"price\": \"50\", \"test_id\": \"4\", \"$$hashKey\": \"object:1676\", \"test_name\": \"VIROLOGY\", \"ref_values\": [{\"Gender\": \"All\", \"result\": \"POSITIVE\", \"$$hashKey\": \"object:3973\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BLOOD FOR HIV(TRIDOT)\"}, {\"Gender\": \"All\", \"result\": \"POSITIVE\", \"$$hashKey\": \"object:4309\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HEPATISIS B ANTIGEN(HbsAg)\"}, {\"Gender\": \"All\", \"result\": \"POSITIVE\", \"$$hashKey\": \"object:4994\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HEPATITIS C VIRUS(HCV)\"}], \"resultGiven\": true}, {\"price\": \"50\", \"test_id\": \"6\", \"$$hashKey\": \"object:1677\", \"test_name\": \"BLOOD GROUPING\", \"ref_values\": [{\"Array\": [\"A\", \"B\", \"AB\", \"0\"], \"Gender\": \"All\", \"result\": \"AB\", \"$$hashKey\": \"object:5677\", \"rangeType\": \"Array\", \"unit_name\": \"-\", \"subInvestigation\": \"BLOOD GROUP\"}, {\"Gender\": \"All\", \"result\": \"POSITIVE\", \"$$hashKey\": \"object:5831\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"RH-TYPE\"}]}, {\"price\": \"50\", \"test_id\": \"3\", \"$$hashKey\": \"object:1678\", \"test_name\": \"LIPID PROFILE\", \"ref_values\": [{\"Gender\": \"All\", \"result\": \"24\", \"endRange\": \"200\", \"$$hashKey\": \"object:3411\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"25\", \"subInvestigation\": \"TRIGLYCERIDES\"}, {\"Gender\": \"All\", \"result\": \"131\", \"endRange\": \"250\", \"$$hashKey\": \"object:3562\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"130\", \"subInvestigation\": \"TOTAL CHOLESTEROL\"}, {\"Gender\": \"All\", \"result\": \"36\", \"endRange\": \"70\", \"$$hashKey\": \"object:3578\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"35\", \"subInvestigation\": \"HDL CHOLESTEROL\"}, {\"Gender\": \"All\", \"result\": \"10\", \"endRange\": \"120\", \"$$hashKey\": \"object:3594\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"LDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"result\": \"26\", \"endRange\": \"27\", \"$$hashKey\": \"object:3610\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"VLDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"result\": \"2\", \"endRange\": \"4.3\", \"$$hashKey\": \"object:3626\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"2.9\", \"endNumerator\": \"0.7\", \"startNumerator\": \"3.6\", \"subInvestigation\": \"TOTAL/HDL CHOLESTEROL RATIO\"}, {\"Gender\": \"All\", \"result\": \"1.8\", \"endRange\": \"2.7\", \"$$hashKey\": \"object:3690\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.5\", \"subInvestigation\": \"LDL/HDL CHOLESTEROL RATIO\"}]}]','null',NULL,NULL,'','2018-05-31 07:06:42','2018-05-31 07:19:17',1,1),(6,11,12,20,'2018-05-01',19,4,'','null','[{\"resultGiven\": false}]','null',NULL,NULL,'','2018-05-31 07:24:28','2018-05-31 07:26:46',1,1),(7,11,12,20,'2018-05-02',29,21,'','null','[{\"resultGiven\": false}]','null',NULL,NULL,'','2018-05-31 07:28:08','2018-05-31 07:28:08',1,1),(8,11,12,20,'2018-05-04',28,10,'','null','[{\"resultGiven\": false}]','null',NULL,NULL,'','2018-05-31 07:28:50','2018-05-31 07:30:28',1,1),(9,11,12,20,'2018-05-05',29,21,'','null','[{\"resultGiven\": false}]','null',NULL,NULL,'','2018-05-31 07:29:48','2018-05-31 07:30:13',1,1),(10,1,1,16,'2018-06-02',29,21,'','null','[{\"resultGiven\": false}]','null',NULL,NULL,'','2018-06-02 10:05:33','2018-06-02 10:05:33',1,1);
/*!40000 ALTER TABLE `CaseSheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CasualtyCharges`
--

DROP TABLE IF EXISTS `CasualtyCharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CasualtyCharges` (
  `CasualtyChargeId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `casualtyCharge` double DEFAULT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`CasualtyChargeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CasualtyCharges`
--

LOCK TABLES `CasualtyCharges` WRITE;
/*!40000 ALTER TABLE `CasualtyCharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `CasualtyCharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CasualtyDoctors`
--

DROP TABLE IF EXISTS `CasualtyDoctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CasualtyDoctors` (
  `CasualtyDoctorId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`CasualtyDoctorId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CasualtyDoctors`
--

LOCK TABLES `CasualtyDoctors` WRITE;
/*!40000 ALTER TABLE `CasualtyDoctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `CasualtyDoctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DirectPO`
--

DROP TABLE IF EXISTS `DirectPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DirectPO` (
  `directPOId` int(11) NOT NULL AUTO_INCREMENT,
  `supplierId` int(11) DEFAULT NULL,
  `storeId` int(11) DEFAULT NULL,
  `invoiceNo` int(11) DEFAULT NULL,
  `invoiceDate` date DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `totalAmount` double DEFAULT NULL,
  `netAmount` double DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`directPOId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DirectPO`
--

LOCK TABLES `DirectPO` WRITE;
/*!40000 ALTER TABLE `DirectPO` DISABLE KEYS */;
INSERT INTO `DirectPO` VALUES (1,9,3,2323,'2018-05-25',0,1,1.18,'2018-05-25 10:41:49','2018-05-25 10:41:49',1,1),(2,7,3,2423,'2018-05-28',0,1,1.18,'2018-05-28 05:52:17','2018-05-28 05:52:17',1,1);
/*!40000 ALTER TABLE `DirectPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DirectPODetails`
--

DROP TABLE IF EXISTS `DirectPODetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DirectPODetails` (
  `detailId` int(11) NOT NULL AUTO_INCREMENT,
  `directPOId` int(11) DEFAULT NULL,
  `medicineId` int(11) DEFAULT NULL,
  `batchNo` varchar(16) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `free` double DEFAULT NULL,
  `expiryDate` date DEFAULT NULL,
  `mrp` double DEFAULT NULL,
  `purchasePrice` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amountTax` double DEFAULT NULL,
  `taxId` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`detailId`),
  KEY `directPOId` (`directPOId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DirectPODetails`
--

LOCK TABLES `DirectPODetails` WRITE;
/*!40000 ALTER TABLE `DirectPODetails` DISABLE KEYS */;
INSERT INTO `DirectPODetails` VALUES (1,NULL,2,'24234',100,0,'2018-05-25',12,10,1000,1180,1,'2018-05-25 04:20:01','2018-05-25 04:20:01',1,1),(2,NULL,2,'323',10,0,'2018-05-25',12,10,100,118,1,'2018-05-25 04:51:40','2018-05-25 04:51:40',1,1),(3,NULL,2,'1212',1,0,'2018-05-25',11,1,1,1.18,1,'2018-05-25 10:41:11','2018-05-25 10:41:11',1,1),(4,1,11,'2343',1,0,'2018-05-25',1,1,1,1.18,1,'2018-05-25 10:41:49','2018-05-25 10:41:49',1,1),(5,NULL,2,'34343',1,0,'2018-05-28',1,1,1,1.18,1,'2018-05-28 05:51:22','2018-05-28 05:51:22',1,1),(6,2,14,'2342',1,0,'2018-05-28',1,1,1,1.18,1,'2018-05-28 05:52:17','2018-05-28 05:52:17',1,1);
/*!40000 ALTER TABLE `DirectPODetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DischargeSummary`
--

DROP TABLE IF EXISTS `DischargeSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DischargeSummary` (
  `dischargeId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `dischargeFileName` varchar(32) DEFAULT NULL,
  `dischargeDate` datetime DEFAULT NULL,
  `diagnosisTreatmentBy` text,
  `dischargeSummary` text,
  `dischargeAdvise` text,
  `finalBillDetails` json DEFAULT NULL,
  `discount` double(8,4) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`dischargeId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DischargeSummary`
--

LOCK TABLES `DischargeSummary` WRITE;
/*!40000 ALTER TABLE `DischargeSummary` DISABLE KEYS */;
INSERT INTO `DischargeSummary` VALUES (1,4,4,'1.pdf','2018-05-19 17:44:43',NULL,'&lt;p&gt;Fever and urinary symptoms:&lt;/p&gt;\r\n\r\n&lt;p&gt;A preliminary diagnosis of pyelonephritis was established. Other causes of fever&lt;/p&gt;\r\n\r\n&lt;p&gt;were possible but less likely. The patient&lt;/p&gt;\r\n\r\n&lt;p&gt;was hypotensive on initial assessment with a blood pressure of&lt;/p&gt;\r\n\r\n&lt;p&gt;80/40. Serum lactate was elevated at 6.1. A bolus of IV fluid was administered (1.5L) but the patient remained&lt;/p&gt;\r\n\r\n&lt;p&gt;hypotensive. Our colleagues from ICU were consulted. An arterial line was inserted&lt;/p&gt;\r\n\r\n&lt;p&gt;for hemodynamic&lt;/p&gt;\r\n\r\n&lt;p&gt;monitoring. Hemodynamics were supported with levophed and crystalloids. Piptazo was started after blood&lt;/p&gt;\r\n\r\n&lt;p&gt;and urine cultures were drawn. After 12 hours serum lactate had normalized and hemodynamics had&lt;/p&gt;\r\n\r\n&lt;p&gt;stabilized. Blood cultures were positiv&lt;/p&gt;\r\n\r\n&lt;p&gt;e for E.Coli that was sensitive to all antibiotics. The patient was stepped&lt;/p&gt;\r\n\r\n&lt;p&gt;down to oral ciprofloxacin to complete a total 14 day course of antibiotics&lt;/p&gt;\r\n',NULL,'[{\"amount\": \"200\", \"no_of_days\": 3, \"service_name\": \"Ward-1\"}, {\"amount\": \"200\", \"no_of_days\": 7, \"service_name\": \"Ward-3\"}, {\"amount\": \"300\", \"no_of_days\": 1, \"service_name\": \"surgeory\"}, {\"amount\": \"400\", \"no_of_days\": 1, \"service_name\": \"Emergency\"}, {\"amount\": \"200\", \"no_of_days\": 11, \"service_name\": \"Room-5\"}, {\"amount\": \"300\", \"no_of_days\": 2, \"service_name\": \"Revanth Kumar\"}, {\"amount\": \"300\", \"no_of_days\": 1, \"service_name\": \"Gurvinder Singh\"}, {\"amount\": \"300\", \"no_of_days\": 2, \"service_name\": \"John Doe\"}, {\"amount\": \"300\", \"no_of_days\": 1, \"service_name\": \"Syam Kumar\"}, {\"amount\": \"200\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-19 12:17:48','2018-05-19 12:17:48',1,1),(2,6,6,NULL,'2018-05-19 18:50:58',NULL,'',NULL,'[{\"amount\": \"200\", \"no_of_days\": 21, \"service_name\": \"Ward-2\"}, {\"amount\": \"300\", \"no_of_days\": 1, \"service_name\": \"Revanth Kumar\"}, {\"amount\": \"80\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',10.0000,'2018-05-19 13:23:06','2018-05-19 13:23:06',1,1),(3,2,2,NULL,'2018-05-19 19:36:10',NULL,'',NULL,'[{\"amount\": \"200\", \"no_of_days\": 21, \"service_name\": \"Ward-3\"}, {\"amount\": \"200\", \"no_of_days\": 2, \"service_name\": \"Siva Rama Krishna\"}, {\"amount\": \"300\", \"no_of_days\": 1, \"service_name\": \"Revanth Kumar\"}, {\"amount\": \"140\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',40.0000,'2018-05-19 14:11:22','2018-05-19 14:11:22',1,1),(4,15,35,'4.txt','2018-05-21 16:04:28',NULL,'',NULL,'[{\"amount\": \"200\", \"no_of_days\": \"50\", \"service_name\": \"Ward-3\"}, {\"amount\": \"300\", \"no_of_days\": \"1\", \"service_name\": \"Syam Kumar\"}, {\"amount\": \"50\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-21 08:13:50','2018-05-21 10:34:34',3,3),(5,15,15,NULL,NULL,NULL,NULL,NULL,'[{\"amount\": \"\", \"no_of_days\": \"8\", \"service_name\": \"General Ward ( Female )\"}, {\"amount\": \"300\", \"no_of_days\": \"20\", \"service_name\": \"Ram Murthy\"}, {\"amount\": \"0\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-22 10:37:42','2018-05-22 10:37:42',17,17),(6,118,123,NULL,NULL,NULL,NULL,NULL,'[{\"amount\": \"500\", \"no_of_days\": \"17673\", \"service_name\": \"CASUALITY\"}, {\"amount\": \"0\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-22 10:39:36','2018-05-22 10:39:36',17,17),(7,8,135,NULL,NULL,NULL,NULL,NULL,'[{\"amount\": \"3800\", \"no_of_days\": \"5\", \"service_name\": \"I.C.U ROOM ( 1 )\"}, {\"amount\": \"0\", \"no_of_days\": \"10\", \"service_name\": \"PHYSOTHEREPY ROOM\"}, {\"amount\": \"3800\", \"no_of_days\": \"1\", \"service_name\": \"I.C.U ROOM ( 2 )\"}, {\"amount\": \"500\", \"no_of_days\": \"8\", \"service_name\": \"CASUALITY\"}, {\"amount\": \"300\", \"no_of_days\": \"1\", \"service_name\": \"Ram Murthy\"}, {\"amount\": \"500\", \"no_of_days\": \"1\", \"service_name\": \"DR.T.RAMESH\"}, {\"amount\": \"100\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-24 07:21:32','2018-05-24 07:21:32',1,1),(8,7,128,NULL,NULL,NULL,NULL,NULL,'[{\"amount\": \"3800\", \"no_of_days\": \"1\", \"service_name\": \"I.C.U ROOM ( 2 )\"}, {\"amount\": \"0\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-24 08:12:37','2018-05-24 08:12:37',1,1),(9,5,140,'9.pdf','2018-05-25 12:11:55',NULL,'undefined',NULL,'[{\"amount\": \"3800\", \"no_of_days\": \"0\", \"service_name\": \"I.C.U ROOM ( 2 )\"}, {\"amount\": \"0\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-25 06:23:54','2018-05-25 07:03:36',1,1),(10,10,141,NULL,'2018-05-25 12:52:31',NULL,'undefined',NULL,'[{\"amount\": \"3800\", \"no_of_days\": \"0\", \"service_name\": \"I.C.U ROOM ( 1 )\"}, {\"amount\": \"1000\", \"no_of_days\": \"1\", \"service_name\": \"DR.P.HARI PRASAD\"}, {\"amount\": \"50\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-25 07:10:55','2018-05-25 07:22:55',1,1),(11,9,142,NULL,NULL,NULL,NULL,NULL,'[{\"amount\": \"3800\", \"no_of_days\": \"0\", \"service_name\": \"I.C.U ROOM ( 2 )\"}, {\"amount\": \"500\", \"no_of_days\": \"1\", \"service_name\": \"Jagan mohan\"}, {\"amount\": \"1000\", \"no_of_days\": \"1\", \"service_name\": \"DR.P.HARI PRASAD\"}, {\"amount\": \"200\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-25 07:31:47','2018-05-25 07:31:47',1,1),(12,5,6,NULL,NULL,NULL,NULL,NULL,'[{\"amount\": \"1000\", \"no_of_days\": \"2\", \"service_name\": \"General ward ( MALE )\"}, {\"amount\": \"0\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-26 10:39:19','2018-05-26 10:39:19',1,1),(13,1,1,NULL,NULL,NULL,NULL,NULL,'[{\"amount\": \"3800\", \"no_of_days\": \"1\", \"service_name\": \"I.C.U ROOM ( 1 )\"}, {\"amount\": \"0\", \"no_of_days\": null, \"service_name\": \"Labs\"}]',0.0000,'2018-05-30 09:57:52','2018-05-30 09:57:52',1,1);
/*!40000 ALTER TABLE `DischargeSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorPayment`
--

DROP TABLE IF EXISTS `DoctorPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorPayment` (
  `DPId` int(11) NOT NULL AUTO_INCREMENT,
  `PId` int(11) DEFAULT NULL,
  `VId` int(11) DEFAULT NULL,
  `DId` int(11) DEFAULT NULL,
  `amountReceived` double DEFAULT NULL,
  `doctorPayment` double(16,4) DEFAULT NULL,
  `isPaid` tinyint(1) DEFAULT NULL,
  `dateOfPayment` date DEFAULT NULL,
  `paymentThrough` varchar(64) DEFAULT NULL,
  `paymentDetails` varchar(64) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `paymentType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DPId`),
  KEY `PId` (`PId`),
  KEY `VId` (`VId`),
  KEY `DId` (`DId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorPayment`
--

LOCK TABLES `DoctorPayment` WRITE;
/*!40000 ALTER TABLE `DoctorPayment` DISABLE KEYS */;
INSERT INTO `DoctorPayment` VALUES (2,5,6,16,15000,1600.0000,1,'2018-05-30','Sachin','Cash','2018-05-30 12:14:31','2018-05-30 12:14:31',17,17,'cash');
/*!40000 ALTER TABLE `DoctorPayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dr_consultation`
--

DROP TABLE IF EXISTS `Dr_consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dr_consultation` (
  `dr_consult_id` int(11) NOT NULL AUTO_INCREMENT,
  `dr_id` int(11) DEFAULT NULL,
  `fcid` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `con_status` tinyint(2) DEFAULT '1',
  `valid_days` tinyint(4) DEFAULT NULL,
  `valid_visits` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`dr_consult_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dr_consultation`
--

LOCK TABLES `Dr_consultation` WRITE;
/*!40000 ALTER TABLE `Dr_consultation` DISABLE KEYS */;
INSERT INTO `Dr_consultation` VALUES (1,16,1,200,1,15,5),(2,16,5,300,1,15,5),(3,19,1,200,1,15,5),(4,19,5,500,1,15,5),(5,20,1,300,1,15,5),(6,21,1,300,1,15,5),(7,26,1,300,1,15,5),(8,26,5,500,1,5,5),(9,28,1,300,1,15,5),(10,28,5,1000,1,15,5),(11,31,1,200,1,15,5),(12,27,1,200,1,15,5),(13,27,5,200,1,15,5),(14,51,1,300,1,15,5),(15,53,1,300,1,15,5),(16,53,5,500,1,5,5),(17,36,1,300,1,15,5),(18,36,5,500,1,15,5),(19,30,1,300,1,15,5),(20,29,1,300,1,15,5),(21,29,5,300,1,15,5),(22,16,4,1000,1,15,2);
/*!40000 ALTER TABLE `Dr_consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExpenditureCategories`
--

DROP TABLE IF EXISTS `ExpenditureCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExpenditureCategories` (
  `expCatId` int(11) NOT NULL AUTO_INCREMENT,
  `expCatName` varchar(128) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  `expStatus` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`expCatId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExpenditureCategories`
--

LOCK TABLES `ExpenditureCategories` WRITE;
/*!40000 ALTER TABLE `ExpenditureCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExpenditureCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HealthSchemes`
--

DROP TABLE IF EXISTS `HealthSchemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HealthSchemes` (
  `schemeId` int(11) NOT NULL AUTO_INCREMENT,
  `schemeName` varchar(64) DEFAULT NULL,
  `cashlessOrReimbursement` varchar(16) DEFAULT NULL,
  `govtOrInsurance` varchar(16) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`schemeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthSchemes`
--

LOCK TABLES `HealthSchemes` WRITE;
/*!40000 ALTER TABLE `HealthSchemes` DISABLE KEYS */;
INSERT INTO `HealthSchemes` VALUES (1,'PRIVATE','Cash','General','2018-05-04 10:25:40','2018-05-25 17:55:35',15,17),(2,'AROGYA RAKSHA','Reimbursment','Government','2018-05-04 10:26:02','2018-05-04 10:26:02',15,15),(3,'EHS ( Employe health scheme )','Reimbursment','Government','2018-05-04 10:26:47','2018-05-04 10:26:47',15,15),(4,'VIPUL','Reimbursment','Insurance','2018-05-04 10:27:16','2018-05-04 10:27:16',15,15),(5,'NTR VAIDYA SEVA','Reimbursment','Government','2018-05-10 07:13:25','2018-05-12 10:46:34',15,24);
/*!40000 ALTER TABLE `HealthSchemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InformationSheet`
--

DROP TABLE IF EXISTS `InformationSheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InformationSheet` (
  `isId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `financeDetails` json DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`isId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  CONSTRAINT `InformationSheet_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `InformationSheet_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformationSheet`
--

LOCK TABLES `InformationSheet` WRITE;
/*!40000 ALTER TABLE `InformationSheet` DISABLE KEYS */;
/*!40000 ALTER TABLE `InformationSheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InformationSheetDoctorPayments`
--

DROP TABLE IF EXISTS `InformationSheetDoctorPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InformationSheetDoctorPayments` (
  `isdpId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `noOfVisits` int(11) DEFAULT NULL,
  `facilityGroupId` int(11) DEFAULT NULL,
  `amountPaid` double DEFAULT NULL,
  `isPaid` tinyint(1) DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `dateOfPayment` date DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  `infoSheetid` int(11) DEFAULT NULL,
  PRIMARY KEY (`isdpId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  KEY `doctorId` (`doctorId`),
  CONSTRAINT `InformationSheetDoctorPayments_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `InformationSheetDoctorPayments_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`),
  CONSTRAINT `InformationSheetDoctorPayments_ibfk_3` FOREIGN KEY (`doctorId`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformationSheetDoctorPayments`
--

LOCK TABLES `InformationSheetDoctorPayments` WRITE;
/*!40000 ALTER TABLE `InformationSheetDoctorPayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `InformationSheetDoctorPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InformationSheetPayments`
--

DROP TABLE IF EXISTS `InformationSheetPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InformationSheetPayments` (
  `ispId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `facilityGroupId` int(11) DEFAULT NULL,
  `amountPaid` double DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `dateOfPayment` date DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`ispId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  CONSTRAINT `InformationSheetPayments_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `InformationSheetPayments_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformationSheetPayments`
--

LOCK TABLES `InformationSheetPayments` WRITE;
/*!40000 ALTER TABLE `InformationSheetPayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `InformationSheetPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InformationSheetReferralPayments`
--

DROP TABLE IF EXISTS `InformationSheetReferralPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InformationSheetReferralPayments` (
  `isrpId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `referralId` int(11) DEFAULT NULL,
  `facilityGroupId` int(11) DEFAULT NULL,
  `amountPaid` double DEFAULT NULL,
  `isPaid` tinyint(1) DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `dateOfPayment` date DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`isrpId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  KEY `referralId` (`referralId`),
  CONSTRAINT `InformationSheetReferralPayments_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `InformationSheetReferralPayments_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`),
  CONSTRAINT `InformationSheetReferralPayments_ibfk_3` FOREIGN KEY (`referralId`) REFERENCES `referral_master` (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformationSheetReferralPayments`
--

LOCK TABLES `InformationSheetReferralPayments` WRITE;
/*!40000 ALTER TABLE `InformationSheetReferralPayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `InformationSheetReferralPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inpatient`
--

DROP TABLE IF EXISTS `Inpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inpatient` (
  `inpatient_id` int(11) NOT NULL AUTO_INCREMENT,
  `surgery_or_medical` varchar(30) DEFAULT NULL,
  `package_or_regular` varchar(30) DEFAULT NULL,
  `scheme_id` int(11) DEFAULT NULL,
  `incharge_doctor_id` int(11) DEFAULT NULL,
  `surgeon_doctor_id` int(11) DEFAULT NULL,
  `anesthesian_doctor_id` int(11) DEFAULT NULL,
  `total_package_amount` double DEFAULT NULL,
  `advance_amount` double DEFAULT NULL,
  `approx_no_of_days` int(11) DEFAULT NULL,
  `admit_date` datetime DEFAULT NULL,
  `discharge_date` datetime DEFAULT NULL,
  `discharge_summary` longtext,
  `discharge_status` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `p_visit_id` int(11) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `initial_diagnosis` text,
  `isBillSettled` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`inpatient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inpatient`
--

LOCK TABLES `Inpatient` WRITE;
/*!40000 ALTER TABLE `Inpatient` DISABLE KEYS */;
INSERT INTO `Inpatient` VALUES (1,'surgery','package',1,16,28,21,30000,NULL,10,'2018-05-29 00:00:00',NULL,NULL,0,1,1,1,2,'A positive TB skin test or TB blood test only tells that a person has been infected with TB bacteria. It does not tell whether the person has latent TB infection (LTBI) or has progressed to TB disease.',1),(2,'medical','regular',1,20,NULL,NULL,0,NULL,10,'2018-05-29 00:00:00',NULL,NULL,0,1,3,3,3,'Skin Rashes.',0),(3,'medical','regular',1,20,NULL,NULL,0,NULL,2,'2018-05-30 00:00:00',NULL,NULL,0,1,6,7,1,'CheckUp',0),(4,'surgery','package',1,16,43,21,15000,NULL,2,'2018-05-30 00:00:00',NULL,NULL,0,1,5,6,5,'giving fluids',0),(5,'surgery','package',1,16,26,41,30000,NULL,5,'2018-05-01 00:00:00',NULL,NULL,0,1,11,12,2,'rist facture',0),(6,'medical','regular',1,20,NULL,NULL,0,NULL,2,'2018-05-31 00:00:00',NULL,NULL,0,1,13,15,2,'tests',0);
/*!40000 ALTER TABLE `Inpatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payments` (
  `paymentId` int(11) NOT NULL AUTO_INCREMENT,
  `expCatId` int(11) DEFAULT NULL,
  `individualOrCompany` varchar(32) DEFAULT NULL,
  `receivedBy` varchar(64) DEFAULT NULL,
  `purpose` varchar(512) DEFAULT NULL,
  `invoiceNo` varchar(64) DEFAULT NULL,
  `invoiceDate` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `onetimeOrDateRange` varchar(16) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `dateOfPayment` date DEFAULT NULL,
  `cashierId` int(11) DEFAULT NULL,
  `canceledStatus` tinyint(1) DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  `receivedUserId` int(11) DEFAULT NULL,
  `pay_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `expCatId` (`expCatId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
INSERT INTO `Payments` VALUES (1,NULL,'staff','SAI KUMAR','MAY MONTH SALALRY',NULL,NULL,10000,'onetime','2018-05-15','2018-05-15','2018-05-31',1,1,'2018-05-15 12:36:36','2018-05-15 12:36:55',1,1,22,1);
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReferralPayment`
--

DROP TABLE IF EXISTS `ReferralPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferralPayment` (
  `RPId` int(11) NOT NULL AUTO_INCREMENT,
  `PId` int(11) DEFAULT NULL,
  `VId` int(11) DEFAULT NULL,
  `RId` int(11) DEFAULT NULL,
  `amountReceived` double DEFAULT NULL,
  `referralPayment` double DEFAULT NULL,
  `isPaid` tinyint(1) DEFAULT NULL,
  `dateOfPayment` date DEFAULT NULL,
  `paymentThrough` varchar(64) DEFAULT NULL,
  `paymentDetails` varchar(64) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `paymentType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`RPId`),
  KEY `PId` (`PId`),
  KEY `VId` (`VId`),
  KEY `RId` (`RId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReferralPayment`
--

LOCK TABLES `ReferralPayment` WRITE;
/*!40000 ALTER TABLE `ReferralPayment` DISABLE KEYS */;
INSERT INTO `ReferralPayment` VALUES (3,1,1,2,30000,1200,1,'2018-05-31','Kumar','Cash','2018-05-30 06:56:38','2018-05-30 06:56:38',17,17,'cash');
/*!40000 ALTER TABLE `ReferralPayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoomAllotment`
--

DROP TABLE IF EXISTS `RoomAllotment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoomAllotment` (
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `bedId` int(11) DEFAULT NULL,
  `roomRentAmount` double DEFAULT NULL,
  `checkInOrCheckOut` varchar(8) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  `enteredDate` date DEFAULT NULL,
  `vacatedDate` date DEFAULT NULL,
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  KEY `bedId` (`bedId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoomAllotment`
--

LOCK TABLES `RoomAllotment` WRITE;
/*!40000 ALTER TABLE `RoomAllotment` DISABLE KEYS */;
INSERT INTO `RoomAllotment` VALUES (1,1,9,3800,'checkOut','2018-05-29 05:52:19','2018-05-31 06:00:30',1,1,'2018-05-29','2018-05-31'),(3,3,10,3800,'checkIn','2018-05-29 06:14:22','2018-05-29 06:14:22',1,1,'2018-05-29',NULL),(6,7,19,1000,'checkIn','2018-05-30 02:42:41','2018-05-30 02:42:41',1,1,'2018-05-30',NULL),(5,6,31,1000,'checkIn','2018-05-30 08:55:12','2018-05-30 08:55:12',1,1,'2018-05-30',NULL),(1,1,16,1800,'checkIn','2018-05-31 06:00:30','2018-05-31 06:00:30',1,1,'2018-05-31',NULL),(11,12,20,1000,'checkOut','2018-05-31 06:56:27','2018-05-31 07:31:04',1,1,'2018-05-01','2018-05-03'),(11,12,12,3800,'checkOut','2018-05-31 07:31:04','2018-05-31 07:31:25',1,1,'2018-05-03','2018-05-04'),(11,12,20,1000,'checkIn','2018-05-31 07:31:25','2018-05-31 07:31:25',1,1,'2018-05-04',NULL),(13,15,27,1000,'checkIn','2018-05-31 14:01:35','2018-05-31 14:01:35',1,1,'2018-05-31',NULL);
/*!40000 ALTER TABLE `RoomAllotment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_inward_register`
--

DROP TABLE IF EXISTS `asset_inward_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_inward_register` (
  `asset_inward_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `assetpo_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_amount` double DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_pend_qty` int(11) DEFAULT NULL,
  `item_rec_qty` int(11) DEFAULT NULL,
  `item_amount` double DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `item_qty` int(11) DEFAULT NULL,
  `start_sequence` int(11) DEFAULT NULL,
  `end_sequence` int(11) DEFAULT NULL,
  `opening_balance` double(16,4) DEFAULT NULL,
  PRIMARY KEY (`asset_inward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_inward_register`
--

LOCK TABLES `asset_inward_register` WRITE;
/*!40000 ALTER TABLE `asset_inward_register` DISABLE KEYS */;
INSERT INTO `asset_inward_register` VALUES (1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-05-08',15,3,10,1,10,1500.0000),(2,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-05-08',15,3,20,11,30,350.0000),(3,NULL,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,'2018-05-18',1,2,1,31,31,1.0000),(4,NULL,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,'2018-05-18',1,2,1,32,32,1.0000),(5,NULL,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,'2018-05-18',1,2,1,33,33,1.0000),(6,NULL,NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,'2018-05-18',1,2,1,34,34,1.0000),(7,NULL,NULL,NULL,NULL,NULL,36,NULL,NULL,NULL,'2018-05-18',1,2,2,35,36,2.0000),(8,NULL,NULL,NULL,NULL,NULL,37,NULL,NULL,NULL,'2018-05-18',1,2,1,37,37,1.0000),(9,NULL,NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,'2018-05-18',1,2,1,38,38,1.0000),(10,NULL,NULL,NULL,NULL,NULL,39,NULL,NULL,NULL,'2018-05-18',1,2,1,39,39,1.0000),(11,NULL,NULL,NULL,NULL,NULL,40,NULL,NULL,NULL,'2018-05-18',1,2,1,40,40,1.0000),(12,NULL,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,'2018-05-18',1,3,1,41,41,1.0000),(13,NULL,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,'2018-05-18',1,3,1,42,42,1.0000),(14,NULL,NULL,NULL,NULL,NULL,46,NULL,NULL,NULL,'2018-05-18',1,3,1,43,43,1.0000),(15,NULL,NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,'2018-05-18',1,3,1,44,44,1.0000),(16,NULL,NULL,NULL,NULL,NULL,48,NULL,NULL,NULL,'2018-05-18',1,3,4,45,48,4.0000),(17,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,NULL,'2018-05-18',1,3,1,49,49,1.0000),(18,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'2018-05-18',1,3,1,50,50,1.0000),(19,NULL,NULL,NULL,NULL,NULL,51,NULL,NULL,NULL,'2018-05-18',1,3,1,51,51,1.0000),(20,NULL,NULL,NULL,NULL,NULL,52,NULL,NULL,NULL,'2018-05-18',1,3,1,52,52,1.0000),(21,NULL,NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,'2018-05-18',1,3,2,53,54,2.0000),(22,NULL,NULL,NULL,NULL,NULL,53,NULL,NULL,NULL,'2018-05-18',1,3,1,55,55,1.0000),(23,NULL,NULL,NULL,NULL,NULL,54,NULL,NULL,NULL,'2018-05-18',1,3,1,56,56,1.0000),(24,NULL,NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,'2018-05-18',1,3,1,57,57,1.0000),(25,NULL,NULL,NULL,NULL,NULL,56,NULL,NULL,NULL,'2018-05-18',1,3,1,58,58,1.0000),(26,NULL,NULL,NULL,NULL,NULL,57,NULL,NULL,NULL,'2018-05-18',1,3,1,59,59,1.0000),(27,NULL,NULL,NULL,NULL,NULL,58,NULL,NULL,NULL,'2018-05-18',1,3,1,60,60,1.0000),(28,NULL,NULL,NULL,NULL,NULL,59,NULL,NULL,NULL,'2018-05-18',1,3,2,61,62,2.0000),(29,NULL,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,'2018-05-18',1,3,3,63,65,3.0000),(30,NULL,NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,'2018-05-18',1,3,2,66,67,2.0000),(31,NULL,NULL,NULL,NULL,NULL,62,NULL,NULL,NULL,'2018-05-18',1,3,1,68,68,1.0000),(32,NULL,NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,'2018-05-18',1,3,1,69,69,1.0000),(33,NULL,NULL,NULL,NULL,NULL,64,NULL,NULL,NULL,'2018-05-18',1,3,2,70,71,2.0000),(34,NULL,NULL,NULL,NULL,NULL,65,NULL,NULL,NULL,'2018-05-18',1,3,1,72,72,1.0000),(35,NULL,NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,'2018-05-18',1,3,1,73,73,1.0000),(36,NULL,NULL,NULL,NULL,NULL,67,NULL,NULL,NULL,'2018-05-18',1,3,2,74,75,2.0000),(37,NULL,NULL,NULL,NULL,NULL,68,NULL,NULL,NULL,'2018-05-18',1,3,2,76,77,2.0000),(38,NULL,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,'2018-05-18',1,3,1,78,78,1.0000),(39,NULL,NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,'2018-05-18',1,3,1,79,79,1.0000),(40,NULL,NULL,NULL,NULL,NULL,36,NULL,NULL,NULL,'2018-05-18',1,3,2,80,81,2.0000),(41,NULL,NULL,NULL,NULL,NULL,37,NULL,NULL,NULL,'2018-05-18',1,3,1,82,82,1.0000),(42,NULL,NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,'2018-05-18',1,3,1,83,83,1.0000),(43,NULL,NULL,NULL,NULL,NULL,39,NULL,NULL,NULL,'2018-05-18',1,3,1,84,84,1.0000),(44,NULL,NULL,NULL,NULL,NULL,40,NULL,NULL,NULL,'2018-05-18',1,3,1,85,85,1.0000),(45,NULL,NULL,NULL,NULL,NULL,41,NULL,NULL,NULL,'2018-05-18',1,3,1,86,86,1.0000),(46,NULL,NULL,NULL,NULL,NULL,42,NULL,NULL,NULL,'2018-05-18',1,3,1,87,87,1.0000),(47,NULL,NULL,NULL,NULL,NULL,43,NULL,NULL,NULL,'2018-05-18',1,3,1,88,88,1.0000),(48,NULL,NULL,NULL,NULL,NULL,44,NULL,NULL,NULL,'2018-05-18',1,3,1,89,89,1.0000),(49,NULL,NULL,NULL,NULL,NULL,45,NULL,NULL,NULL,'2018-05-18',1,3,1,90,90,1.0000),(50,NULL,NULL,NULL,NULL,NULL,69,NULL,NULL,NULL,'2018-05-23',15,3,1,91,91,1.0000),(51,NULL,NULL,NULL,NULL,NULL,70,NULL,NULL,NULL,'2018-05-23',15,3,1,92,92,1.0000),(52,NULL,NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,'2018-05-23',15,3,1,93,93,1.0000),(53,NULL,NULL,NULL,NULL,NULL,72,NULL,NULL,NULL,'2018-05-23',15,3,1,94,94,1.0000),(54,NULL,NULL,NULL,NULL,NULL,74,NULL,NULL,NULL,'2018-05-23',15,3,1,95,95,1.0000),(55,NULL,NULL,NULL,NULL,NULL,73,NULL,NULL,NULL,'2018-05-23',15,3,1,96,96,1.0000),(56,NULL,NULL,NULL,NULL,NULL,81,NULL,NULL,NULL,'2018-05-23',1,3,1,97,97,1.0000),(57,NULL,NULL,NULL,NULL,NULL,76,NULL,NULL,NULL,'2018-05-23',15,3,1,98,98,1.0000),(58,NULL,NULL,NULL,NULL,NULL,77,NULL,NULL,NULL,'2018-05-23',15,3,1,99,99,1.0000),(59,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'2018-05-23',15,3,1,100,100,1.0000),(60,NULL,NULL,NULL,NULL,NULL,75,NULL,NULL,NULL,'2018-05-23',15,3,1,101,101,1.0000),(61,NULL,NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,'2018-05-23',15,3,1,102,102,1.0000),(62,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-05-23',15,3,1,103,103,1.0000),(63,NULL,NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,'2018-05-23',1,3,2,104,105,2.0000),(64,NULL,NULL,NULL,NULL,NULL,78,NULL,NULL,NULL,'2018-05-23',1,3,1,106,106,1.0000),(65,NULL,NULL,NULL,NULL,NULL,82,NULL,NULL,NULL,'2018-05-23',1,3,4,107,110,4.0000),(66,NULL,NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,'2018-05-23',1,3,3,111,113,3.0000),(67,NULL,NULL,NULL,NULL,NULL,79,NULL,NULL,NULL,'2018-05-23',1,3,1,114,114,1.0000),(68,NULL,NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,'2018-05-23',1,3,1,115,115,1.0000),(69,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-05-23',1,3,4,116,119,4.0000),(70,NULL,NULL,NULL,NULL,NULL,85,NULL,NULL,NULL,'2018-05-23',1,3,1,120,120,1.0000),(71,NULL,NULL,NULL,NULL,NULL,86,NULL,NULL,NULL,'2018-05-23',1,3,2,121,122,2.0000),(72,NULL,NULL,NULL,NULL,NULL,87,NULL,NULL,NULL,'2018-05-23',1,3,1,123,123,1.0000),(73,NULL,NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,'2018-05-23',1,3,2,124,125,2.0000),(74,NULL,NULL,NULL,NULL,NULL,89,NULL,NULL,NULL,'2018-05-23',1,3,1,126,126,1.0000),(75,NULL,NULL,NULL,NULL,NULL,90,NULL,NULL,NULL,'2018-05-23',1,3,1,127,127,1.0000),(76,NULL,NULL,NULL,NULL,NULL,91,NULL,NULL,NULL,'2018-05-23',1,3,1,128,128,1.0000),(77,NULL,NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,'2018-05-23',1,3,1,129,129,1.0000),(78,NULL,NULL,NULL,NULL,NULL,94,NULL,NULL,NULL,'2018-05-23',1,3,2,130,131,2.0000),(79,NULL,NULL,NULL,NULL,NULL,95,NULL,NULL,NULL,'2018-05-23',1,3,2,132,133,2.0000),(80,NULL,NULL,NULL,NULL,NULL,96,NULL,NULL,NULL,'2018-05-23',1,3,1,134,134,1.0000),(81,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,'2018-05-23',1,3,1,135,135,1.0000),(82,NULL,NULL,NULL,NULL,NULL,98,NULL,NULL,NULL,'2018-05-23',1,3,1,136,136,1.0000),(83,NULL,NULL,NULL,NULL,NULL,99,NULL,NULL,NULL,'2018-05-23',1,3,1,137,137,1.0000),(84,NULL,NULL,NULL,NULL,NULL,100,NULL,NULL,NULL,'2018-05-23',1,3,1,138,138,1.0000),(85,NULL,NULL,NULL,NULL,NULL,101,NULL,NULL,NULL,'2018-05-23',1,3,1,139,139,1.0000),(86,NULL,NULL,NULL,NULL,NULL,102,NULL,NULL,NULL,'2018-05-23',1,3,2,140,141,2.0000),(87,NULL,NULL,NULL,NULL,NULL,103,NULL,NULL,NULL,'2018-05-23',1,3,2,142,143,2.0000),(88,NULL,NULL,NULL,NULL,NULL,104,NULL,NULL,NULL,'2018-05-23',1,3,1,144,144,1.0000),(89,NULL,NULL,NULL,NULL,NULL,105,NULL,NULL,NULL,'2018-05-23',1,3,1,145,145,1.0000),(90,14,1,'2323323','2018-05-28',708,41,1,2,708,'2018-05-28',1,3,3,146,147,NULL),(91,3,2,'87944','2018-05-31',10620,34,0,2,10620,'2018-05-31',1,3,2,148,149,NULL),(92,NULL,NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,'2018-05-31',1,3,12,150,161,12.0000),(93,14,3,'221','2018-06-02',23010,93,1,1,23010,'2018-06-02',1,3,2,162,162,NULL),(94,14,3,'656546','2018-06-02',23010,93,0,1,23010,'2018-06-02',1,3,2,163,163,NULL);
/*!40000 ALTER TABLE `asset_inward_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_outward_register`
--

DROP TABLE IF EXISTS `asset_outward_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_outward_register` (
  `asset_outward_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_store_id` int(11) DEFAULT NULL,
  `to_store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `received_quantity` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `from_store_name` varchar(50) DEFAULT NULL,
  `to_store_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`asset_outward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_outward_register`
--

LOCK TABLES `asset_outward_register` WRITE;
/*!40000 ALTER TABLE `asset_outward_register` DISABLE KEYS */;
INSERT INTO `asset_outward_register` VALUES (1,3,2,32,1,1,1,'2018-05-18 04:55:57',1,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(2,3,2,33,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(3,3,2,34,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(4,3,2,35,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(5,3,2,36,2,2,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(6,3,2,37,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(7,3,2,38,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(8,3,2,40,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(9,3,2,41,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(10,3,2,42,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(11,3,2,43,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(12,3,2,44,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(13,3,2,45,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(14,3,2,46,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(15,3,2,47,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(16,3,2,48,4,4,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(17,3,2,49,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(18,3,2,50,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(19,3,2,51,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(20,3,2,52,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(21,3,2,27,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(22,3,2,53,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(23,3,2,54,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(24,3,2,55,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(25,3,2,56,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(26,3,2,57,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(27,3,2,58,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(28,3,2,59,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(29,3,2,60,3,3,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(30,3,2,61,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(31,3,2,62,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(32,3,2,63,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(33,3,2,64,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(34,3,2,65,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(35,3,2,66,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(36,3,2,67,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(37,3,2,68,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(38,3,2,39,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(39,3,7,69,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(40,3,7,70,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(41,3,7,71,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(42,3,7,72,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(43,3,7,74,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(44,3,7,73,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(45,3,7,81,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(46,3,7,76,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(47,3,7,77,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(48,3,7,7,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(49,3,7,75,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(50,3,7,31,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(51,3,7,1,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(52,3,7,93,2,2,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(53,3,7,78,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(54,3,7,82,4,4,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(55,3,7,83,3,3,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(56,3,7,79,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(57,3,7,84,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(58,3,7,2,4,4,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(59,3,7,85,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(60,3,7,86,2,2,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(61,3,7,87,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(62,3,7,88,2,2,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(63,3,7,89,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(64,3,7,90,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(65,3,7,91,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(66,3,7,92,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(67,3,7,94,2,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(68,3,7,95,2,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(69,3,7,94,1,1,1,'2018-05-23 05:15:14',6,'BRM MEDICAL STORE','LAB'),(70,3,7,95,1,1,1,'2018-05-23 05:18:45',7,'BRM MEDICAL STORE','LAB'),(71,3,8,96,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(72,3,8,97,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(73,3,8,98,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(74,3,8,99,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(75,3,8,100,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(76,3,8,101,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(77,3,8,102,2,2,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(78,3,8,103,2,2,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(79,3,8,104,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(80,3,8,105,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(81,3,4,41,2,2,1,'2018-05-31 05:07:47',9,'BRM MEDICAL STORE','General ward Male'),(82,3,6,93,2,1,1,'2018-06-02 10:28:10',10,'BRM MEDICAL STORE','MINOR OT');
/*!40000 ALTER TABLE `asset_outward_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_sequence_nos`
--

DROP TABLE IF EXISTS `asset_sequence_nos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_sequence_nos` (
  `sequence_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_po_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `asset_sequence_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`sequence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_sequence_nos`
--

LOCK TABLES `asset_sequence_nos` WRITE;
/*!40000 ALTER TABLE `asset_sequence_nos` DISABLE KEYS */;
INSERT INTO `asset_sequence_nos` VALUES (1,NULL,1,1),(2,NULL,1,2),(3,NULL,1,3),(4,NULL,1,4),(5,NULL,1,5),(6,NULL,1,6),(7,NULL,1,7),(8,NULL,1,8),(9,NULL,1,9),(10,NULL,1,10),(11,NULL,2,11),(12,NULL,2,12),(13,NULL,2,13),(14,NULL,2,14),(15,NULL,2,15),(16,NULL,2,16),(17,NULL,2,17),(18,NULL,2,18),(19,NULL,2,19),(20,NULL,2,20),(21,NULL,2,21),(22,NULL,2,22),(23,NULL,2,23),(24,NULL,2,24),(25,NULL,2,25),(26,NULL,2,26),(27,NULL,2,27),(28,NULL,2,28),(29,NULL,2,29),(30,NULL,2,30),(31,NULL,32,31),(32,NULL,33,32),(33,NULL,34,33),(34,NULL,35,34),(35,NULL,36,35),(36,NULL,36,36),(37,NULL,37,37),(38,NULL,38,38),(39,NULL,39,39),(40,NULL,40,40),(41,NULL,32,41),(42,NULL,33,42),(43,NULL,46,43),(44,NULL,47,44),(45,NULL,48,45),(46,NULL,48,46),(47,NULL,48,47),(48,NULL,48,48),(49,NULL,49,49),(50,NULL,50,50),(51,NULL,51,51),(52,NULL,52,52),(53,NULL,27,53),(54,NULL,27,54),(55,NULL,53,55),(56,NULL,54,56),(57,NULL,55,57),(58,NULL,56,58),(59,NULL,57,59),(60,NULL,58,60),(61,NULL,59,61),(62,NULL,59,62),(63,NULL,60,63),(64,NULL,60,64),(65,NULL,60,65),(66,NULL,61,66),(67,NULL,61,67),(68,NULL,62,68),(69,NULL,63,69),(70,NULL,64,70),(71,NULL,64,71),(72,NULL,65,72),(73,NULL,66,73),(74,NULL,67,74),(75,NULL,67,75),(76,NULL,68,76),(77,NULL,68,77),(78,NULL,34,78),(79,NULL,35,79),(80,NULL,36,80),(81,NULL,36,81),(82,NULL,37,82),(83,NULL,38,83),(84,NULL,39,84),(85,NULL,40,85),(86,NULL,41,86),(87,NULL,42,87),(88,NULL,43,88),(89,NULL,44,89),(90,NULL,45,90),(91,NULL,69,91),(92,NULL,70,92),(93,NULL,71,93),(94,NULL,72,94),(95,NULL,74,95),(96,NULL,73,96),(97,NULL,81,97),(98,NULL,76,98),(99,NULL,77,99),(100,NULL,7,100),(101,NULL,75,101),(102,NULL,31,102),(103,NULL,1,103),(104,NULL,93,104),(105,NULL,93,105),(106,NULL,78,106),(107,NULL,82,107),(108,NULL,82,108),(109,NULL,82,109),(110,NULL,82,110),(111,NULL,83,111),(112,NULL,83,112),(113,NULL,83,113),(114,NULL,79,114),(115,NULL,84,115),(116,NULL,2,116),(117,NULL,2,117),(118,NULL,2,118),(119,NULL,2,119),(120,NULL,85,120),(121,NULL,86,121),(122,NULL,86,122),(123,NULL,87,123),(124,NULL,88,124),(125,NULL,88,125),(126,NULL,89,126),(127,NULL,90,127),(128,NULL,91,128),(129,NULL,92,129),(130,NULL,94,130),(131,NULL,94,131),(132,NULL,95,132),(133,NULL,95,133),(134,NULL,96,134),(135,NULL,97,135),(136,NULL,98,136),(137,NULL,99,137),(138,NULL,100,138),(139,NULL,101,139),(140,NULL,102,140),(141,NULL,102,141),(142,NULL,103,142),(143,NULL,103,143),(144,NULL,104,144),(145,NULL,105,145),(146,1,41,146),(147,1,41,147),(148,2,34,148),(149,2,34,149),(150,NULL,30,150),(151,NULL,30,151),(152,NULL,30,152),(153,NULL,30,153),(154,NULL,30,154),(155,NULL,30,155),(156,NULL,30,156),(157,NULL,30,157),(158,NULL,30,158),(159,NULL,30,159),(160,NULL,30,160),(161,NULL,30,161),(162,3,93,162),(163,3,93,163);
/*!40000 ALTER TABLE `asset_sequence_nos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_stock_register`
--

DROP TABLE IF EXISTS `asset_stock_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_stock_register` (
  `asset_stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`asset_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_stock_register`
--

LOCK TABLES `asset_stock_register` WRITE;
/*!40000 ALTER TABLE `asset_stock_register` DISABLE KEYS */;
INSERT INTO `asset_stock_register` VALUES (12,3,32,0),(13,3,33,0),(14,3,46,0),(15,3,47,0),(16,3,48,0),(17,3,49,0),(18,3,50,0),(19,3,51,0),(20,3,52,0),(21,3,27,0),(22,3,53,0),(23,3,54,0),(24,3,55,0),(25,3,56,0),(26,3,57,0),(27,3,58,0),(28,3,59,0),(29,3,60,0),(30,3,61,0),(31,3,62,0),(32,3,63,0),(33,3,64,0),(34,3,65,0),(35,3,66,0),(36,3,67,0),(37,3,68,0),(38,3,34,2),(39,3,35,0),(40,3,36,0),(41,3,37,0),(42,3,38,0),(43,3,39,0),(44,3,40,0),(45,3,41,0),(46,3,42,0),(47,3,43,0),(48,3,44,0),(49,3,45,0),(50,2,32,1),(51,2,33,1),(52,2,34,1),(53,2,35,1),(54,2,36,2),(55,2,37,1),(56,2,38,1),(57,2,40,1),(58,2,41,1),(59,2,42,1),(60,2,43,1),(61,2,44,1),(62,2,45,1),(63,2,46,1),(64,2,47,1),(65,2,48,4),(66,2,49,1),(67,2,50,1),(68,2,51,1),(69,2,52,1),(70,2,27,2),(71,2,53,1),(72,2,54,1),(73,2,55,1),(74,2,56,1),(75,2,57,1),(76,2,58,1),(77,2,59,2),(78,2,60,3),(79,2,61,2),(80,2,62,1),(81,2,63,1),(82,2,64,2),(83,2,65,1),(84,2,66,1),(85,2,67,2),(86,2,68,2),(87,2,39,1),(88,3,69,0),(89,3,70,0),(90,3,71,0),(91,3,72,0),(92,3,74,0),(93,3,73,0),(94,3,81,0),(95,3,76,0),(96,3,77,0),(97,3,7,0),(98,3,75,0),(99,3,31,0),(100,3,1,0),(101,3,93,1),(102,3,78,0),(103,3,82,0),(104,3,83,0),(105,3,79,0),(106,3,84,0),(107,3,2,0),(108,3,85,0),(109,3,86,0),(110,3,87,0),(111,3,88,0),(112,3,89,0),(113,3,90,0),(114,3,91,0),(115,3,92,0),(116,3,94,0),(117,3,95,0),(118,7,69,1),(119,7,70,1),(120,7,71,1),(121,7,72,1),(122,7,74,1),(123,7,73,1),(124,7,81,1),(125,7,76,1),(126,7,77,1),(127,7,7,1),(128,7,75,1),(129,7,31,1),(130,7,1,1),(131,7,93,2),(132,7,78,1),(133,7,82,4),(134,7,83,3),(135,7,79,1),(136,7,84,1),(137,7,2,4),(138,7,85,1),(139,7,86,2),(140,7,87,1),(141,7,88,2),(142,7,89,1),(143,7,90,1),(144,7,91,1),(145,7,92,1),(146,7,94,2),(147,7,95,2),(148,3,96,0),(149,3,97,0),(150,3,98,0),(151,3,99,0),(152,3,100,0),(153,3,101,0),(154,3,102,0),(155,3,103,0),(156,3,104,0),(157,3,105,0),(158,8,96,1),(159,8,97,1),(160,8,98,1),(161,8,99,1),(162,8,100,1),(163,8,101,1),(164,8,102,2),(165,8,103,2),(166,8,104,1),(167,8,105,1),(168,3,30,12),(169,4,41,2),(170,6,93,1);
/*!40000 ALTER TABLE `asset_stock_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `asset_id` int(5) NOT NULL AUTO_INCREMENT,
  `asset_name` varchar(200) DEFAULT NULL,
  `asset_group_id` int(11) DEFAULT NULL,
  `asset_brand` varchar(200) DEFAULT NULL,
  `asset_desc` varchar(200) DEFAULT NULL,
  `asset_units` int(11) DEFAULT NULL,
  `asset_tax` int(11) DEFAULT NULL,
  `asset_status` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`asset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,'Fan',38,'usha','test',36,1,1),(2,'Bulbs and tubes',38,'Wiprow','lights',36,1,1),(3,'Cloths',39,'BRM carewell','Bed sheets pillows',19,1,1),(4,'Furniture Items',1,'BRM Carewell','Furniture',36,1,1),(5,'Bed Sheets',39,'BRM Carewell','bed sheets',19,1,1),(6,'Drug Box',8,'BRM Carewell','for use of drug and patient uses',36,1,1),(7,'LAND PHONE',10,'BEETEL','land phone',36,1,1),(8,'STEEL TRALY',11,'BRM','for moving madicine equipments',36,1,1),(9,'wheel chair',12,'BRM','for purpose of patient',36,1,1),(10,'Fire cylinder',13,'peter autokits pvt ltd','SAFTY',36,1,1),(11,'Counter Table',1,'BRM','counters',36,1,1),(12,'Siline Stand',16,'BRM','Purpose of fluids',36,1,1),(13,'weighing Machine',17,'BRM','weight',36,1,1),(14,'Notice board',19,'BRM','NOTE',36,1,1),(15,'GLASS STAND',20,'BRM','STANDS',36,1,1),(16,'PLANK STAND',21,'BRM','TABLE STANDS',36,1,1),(17,'MOBILE PHONE',22,'JIO','phone',36,1,1),(18,'STETHESCOPE',23,'BRM','Stethescope',36,1,1),(19,'BP Operator',24,'BRM','Checking of bp level',36,1,1),(20,'Thermometer',25,'BRM','Fever checking levels',36,1,1),(21,'Dresing tray and forechef',26,'BRM','TRAY',36,1,1),(22,'Scissors',28,'BRM','cuthing therds and strips',36,1,1),(23,'NAPKIN',39,'BRM','cloth',36,1,1),(24,'Punching Maching',44,'BRM','puching',36,1,1),(25,'Needle Burner',31,'BRM','needle',36,1,1),(26,'Small tray',32,'BRM','carrying medical instruments',36,1,1),(27,'Dust bin',4,'BRM','dust bins',36,1,1),(28,'Glass Curtains',39,'BRM','glass covering curtain',36,1,1),(29,'Plastic tray',37,'BRM','TRAY',36,1,1),(30,'Pillows',7,'BRM','PILLOWS',36,1,1),(31,'AIR CONDITIONS  AC',43,'GODREJ','air conditions',36,1,1),(32,'Anastecia Drager',46,'BRM','ANASTECIA DRAGER',11,1,1),(33,'CRM',52,'BRM','BRM',11,1,1),(34,'SURGERY TABLE',1,'BRM','BRM',36,1,1),(35,'INSTRUMENT BIG TRALLY',53,'BRM','BRM',36,1,1),(36,'INSTRUMENT TRALLY SMALL',54,'BRM','BRM',36,1,1),(37,'INSTRUMENT TRALLY MEDIUM',55,'BRM','BRM',36,1,1),(38,'LAPROSCOPE TRLLY MAXER',56,'BRM','BRM',36,1,1),(39,'LAPROSCOPE MONITOR',78,'BRMbrm','brm',36,1,1),(40,'SECTION OPERATOR',79,'BRM','BRM',36,1,1),(41,'VACCUM SECTION OPERATOR',79,'BRM','BRM',36,1,1),(42,'MANNUAL BP OPERATOR',24,'BRM','BRM',36,1,1),(43,'DRUG TRALLY TRASH CARD',80,'BRM','BRM',36,1,1),(44,'SIDEX TRAY',81,'BRM','BRM',36,1,1),(45,'PENDENT',82,'BRM','BRM',36,1,1),(46,'AUTO CLAVE MACHINE BIG',59,'BRM','BRM',36,1,1),(47,'AUTO CLAVE MACHINE SMALL',59,'BRM','BRM',36,1,1),(48,'BOOSTER',60,'BRM','BRM',36,1,1),(49,'AaM REST',61,'BRM','BRM',36,1,1),(50,'MONITOR',47,'BRM','BRM',36,1,1),(51,'I V STAND',16,'BRM','BRM',36,1,1),(52,'TRUNK BOX',62,'BRM','BRM',36,1,1),(53,'PUT STOOL',63,'BRM','BRM',36,1,1),(54,'SURGEN STOOL',64,'BRM','BRM',36,1,1),(55,'BABY WEIGHT MACHINE',17,'BRM','BRM',36,1,1),(56,'LAPROSCOPE INSTRUMENT BOX',65,'BRM','BRM',36,1,1),(57,'X RAY LAVI',66,'BRM','BRM',36,1,1),(58,'DY TERAMI SHALYA EASY',67,'SHALYA EASY PLUS','BRM',36,1,1),(59,'BIG BIN',68,'BRM','BRM',36,1,1),(60,'MEDIUM BIN',68,'BRM','BRM',36,1,1),(61,'SMALL BIN',68,'BRM','BRM',36,1,1),(62,'SCISSORE BOX',28,'BRM','BRM',36,1,1),(63,'PEMPCATION MACHINE BOX',70,'BRM','BRM',36,1,1),(64,'BASIN',71,'BRM','BRM',36,1,1),(65,'MAT',72,'BRM','BRM',36,1,1),(66,'STEEL SINC',73,'BRM','BRM',36,1,1),(67,'STEEL TAP',74,'BRM','BRM',36,1,1),(68,'TOUCH MADE LED LIGHTS',50,'TOUCH MADE','BRM',36,1,1),(69,'FULL AUTOMATED ANALIZER',83,'ERBA','BIO CHEMISTRY  ANALIZER',36,1,1),(70,'BIO SYSTEM',84,'ERBA','CEL COUNTER',36,1,1),(71,'SEMI AUTOMATED ANALIZER',85,'RADIANCE','BIO CHEMISTRY SEMI',36,1,1),(72,'ELECTROLATES  ANALYZER',86,'EASY LYTE EXPEND','BIO CHEMISTRY',36,1,1),(73,'NEEDLE BURNER',87,'BHARTHI  ENTP SURGICALS','NEEDLE DISCUSION',36,1,1),(74,'MICRO SCOPE',88,'BLISCO INDIA','TO OBSERVE SMALL CEL',36,1,1),(75,'PRINTER HP LAZER',92,'HP LAZER','PRINTING PURPOSE',36,1,1),(76,'COLORI METER',89,'EXCEL DIAGNOSTICS PVT LTD','BIO CHEMISTRY',36,1,1),(77,'COUNTING CELLS MACHINE',90,'DURGA','COUNTING CELLS',36,1,1),(78,'ROTATED SAMPLE MACHINE',91,'TRANSASIA BIO MEDICALS LTD','ROTATED SAMPLE',36,1,1),(79,'INVERTOR',93,'BRM','POWER SUPORTER',36,1,1),(80,'LAND PHONE',10,'BEETEL','PHONE',36,1,1),(81,'LG FRIDGE',94,'LG','ANASTECIA MEDICINE STORAGE',36,1,1),(82,'WATER TINS',95,'BRM','WATER',36,1,1),(83,'WASHING TINS',96,'BRM','WEASTAGE WATER',36,1,1),(84,'CLEANING SOLUCTION TIN',97,'BRM','SOLUCTION TINS',36,1,1),(85,'TUBE CLEANING HYPER SOLUCTION',99,'BRM','CLEANING',36,1,1),(86,'URIN STRIPS',101,'SD BIO STANDRAD DIAGNOSIS','URIN STRIPS',36,1,1),(87,'HIMOGLOBIN SOLUCTION',98,'EXCEL DIAGNOSIS PVT LTD','HIMOGOLBIN CHECKING',36,1,1),(88,'TEST TUBE STANDS',102,'BRM','STANDS',36,1,1),(89,'STRELLIUM',103,'BRM','WASHING SOLUCTION',4,1,1),(90,'SPRIT',104,'BRM','WASHING PURPOSE',4,1,1),(91,'PT MACHINE',105,'AGAPPE','PT APTT TESTS',36,1,1),(92,'CENTRIFUSE',106,'RE MI','SAMPLE SEPARATED',36,1,1),(93,'COMPUTER',107,'ZWBRONICS','COMPUTER',36,1,1),(94,'CHAIR',2,'BRM','brm',36,1,1),(95,'NL RL',108,'BRM','BRM',4,1,1),(96,'REEDER',110,'Konika Minolta Regius','casset reder',36,1,1),(97,'PRINTER',111,'Dry Pro konika Minolta','X Ray printing',36,1,1),(98,'Mobile X Ray Machine',112,'100ma','X Ray Machine',36,1,1),(99,'X Ray Chest Stand',113,'BRM','STAND',36,1,1),(100,'X Ray Grid Table',114,'BRM','Grid  Table',36,1,1),(101,'LEAD AAPERON',115,'BRM','Safety Purpose',36,1,1),(102,'CASSET',116,'BRM','CASSET',36,1,1),(103,'CASSET',117,'BRM','CASSET',36,1,1),(104,'THREAD MILL TMT',118,'RMS','Checking heart',36,1,1),(105,'ACQUISITION BOX RMS',119,'RMS','SUPORTER',36,1,1),(106,'STOOL',120,'BRM','SITTING',36,1,1);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_podata`
--

DROP TABLE IF EXISTS `assets_podata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_podata` (
  `apo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apo_item_id` int(11) DEFAULT NULL,
  `apo_item_name` varchar(200) DEFAULT NULL,
  `apo_units` varchar(50) DEFAULT NULL,
  `apo_qty` int(11) DEFAULT NULL,
  `apo_bonus` int(11) DEFAULT NULL,
  `apo_mrp` double DEFAULT NULL,
  `apo_pp` double DEFAULT NULL,
  `asset_po_id` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `apo_qty_received` int(11) DEFAULT '0',
  PRIMARY KEY (`apo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_podata`
--

LOCK TABLES `assets_podata` WRITE;
/*!40000 ALTER TABLE `assets_podata` DISABLE KEYS */;
INSERT INTO `assets_podata` VALUES (1,41,'VACCUM SECTION OPERATOR',NULL,3,NULL,300,300,1,18,2),(2,34,'SURGERY TABLE',NULL,2,NULL,4550,4500,2,18,2),(3,93,'COMPUTER',NULL,2,NULL,20000,19500,3,18,2);
/*!40000 ALTER TABLE `assets_podata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_pos`
--

DROP TABLE IF EXISTS `assets_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_pos` (
  `assetpo_id` int(11) NOT NULL AUTO_INCREMENT,
  `assetpo_date` date DEFAULT NULL,
  `assetpo_supplier_id` int(11) DEFAULT NULL,
  `assetpo_status` varchar(30) DEFAULT 'Issued',
  `assetpo_authorised_by` int(11) DEFAULT NULL,
  `assetpo_price` double DEFAULT NULL,
  `assetpo_net_price` double DEFAULT NULL,
  PRIMARY KEY (`assetpo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_pos`
--

LOCK TABLES `assets_pos` WRITE;
/*!40000 ALTER TABLE `assets_pos` DISABLE KEYS */;
INSERT INTO `assets_pos` VALUES (1,'2018-05-27',14,'Issued',1,900,1062),(2,'2018-05-31',3,'Received',1,9000,10620),(3,'2018-06-02',14,'Received',1,39000,46020);
/*!40000 ALTER TABLE `assets_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bed_master`
--

DROP TABLE IF EXISTS `bed_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bed_master` (
  `bed_id` int(11) NOT NULL AUTO_INCREMENT,
  `bed_code` varchar(20) DEFAULT NULL,
  `bed_loc_id` int(11) DEFAULT NULL,
  `bed_loc_name` varchar(50) DEFAULT NULL,
  `extra_data` longtext,
  `rentAmount` double(8,4) DEFAULT NULL,
  PRIMARY KEY (`bed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed_master`
--

LOCK TABLES `bed_master` WRITE;
/*!40000 ALTER TABLE `bed_master` DISABLE KEYS */;
INSERT INTO `bed_master` VALUES (5,'BED 12',8,'CASUALITY','Off day 500\nFull day 1000',500.0000),(6,'BED 13',8,'CASUALITY','Off day 500\nFull day 1000',500.0000),(7,'BED 14',8,'CASUALITY','Off day 500',500.0000),(8,'BED 1',4,'I.C.U ROOM ( 1 )','ICU Rooms',3800.0000),(9,'BED 2',4,'I.C.U ROOM ( 1 )','ICU Room',3800.0000),(10,'BED 3',4,'I.C.U ROOM ( 1 )','ICU Room',3800.0000),(11,'BED 4',4,'I.C.U ROOM ( 1 )','ICU Room',3800.0000),(12,'BED 5',9,'I.C.U ROOM ( 2 )','ICU Room',3800.0000),(13,'BED 6',9,'I.C.U ROOM ( 2 )','ICU Room',3800.0000),(14,'BED 7',9,'I.C.U ROOM ( 2 )','ICU Room',3800.0000),(15,'BED 8',6,'Special Room ( 1 )','A/C  - 2500\nNON A/C - 1800',1800.0000),(16,'BED 9',11,'Special Room ( 2 )','A/C  - 2500\nNON A/C  - 1800',1800.0000),(17,'BED 10',12,'Special Room ( 3 )','A/C  - 2500\nNON A/C  - 1800',1800.0000),(18,'BED 11',13,'Special Room ( 4 )','A/C   - 2500\nNON A/C  - 1800',1800.0000),(19,'BED 15',5,'General ward ( MALE )','Per day - 1000',1000.0000),(20,'BED 16',5,'General ward ( MALE )','Per day 1000',1000.0000),(21,'BED 17',5,'General ward ( MALE )','Per day 1000',1000.0000),(22,'BED 18',5,'General ward ( MALE )','Per day 1000',1000.0000),(23,'BED 19',5,'General ward ( MALE )','Per day 1000',1000.0000),(24,'BED 20',5,'General ward ( MALE )','Per day 1000',1000.0000),(25,'BED 21',5,'General ward ( MALE )','Per day 1000',1000.0000),(26,'BED 22',5,'General ward ( MALE )','Per day 1000',1000.0000),(27,'BED 23',5,'General ward ( MALE )','Per day 1000',1000.0000),(28,'BED 24',5,'General ward ( MALE )','Per day 1000',1000.0000),(29,'BED 25',5,'General ward ( MALE )','Per day 1000',1000.0000),(30,'BED 26',5,'General ward ( MALE )','Per day 1000',1000.0000),(31,'BED 27',10,'General Ward ( Female )','Per day 1000',1000.0000),(32,'BED 28',10,'General Ward ( Female )','Per day 1000',1000.0000),(33,'BED 29',10,'General Ward ( Female )','Per day 1000',1000.0000),(34,'BED 30',10,'General Ward ( Female )','Per day 1000',1000.0000),(35,'BED 31',10,'General Ward ( Female )','Per day 1000',1000.0000),(36,'BED 32',10,'General Ward ( Female )','Per day 1000',1000.0000),(37,'EXAMINATION TABLE 1',15,'CONSULTATION ROOM 2','A',0.0000),(38,'EXAMINATION TABLE 2',25,'PHYSOTHEREPY ROOM','A',0.0000),(39,'EXAMINATION TABLE 3',25,'PHYSOTHEREPY ROOM','A',0.0000),(40,'EXAMINATION TABLE 4',25,'PHYSOTHEREPY ROOM','A',0.0000),(41,'BED 33',25,'PHYSOTHEREPY ROOM','A',0.0000),(42,'BED28',2,'ICU','LAB ROOM',1000.0000);
/*!40000 ALTER TABLE `bed_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billcategory`
--

DROP TABLE IF EXISTS `billcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billcategory` (
  `bcid` int(11) NOT NULL AUTO_INCREMENT,
  `bcgroup` varchar(30) DEFAULT NULL,
  `bcname` varchar(100) DEFAULT NULL,
  `bccode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bcid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billcategory`
--

LOCK TABLES `billcategory` WRITE;
/*!40000 ALTER TABLE `billcategory` DISABLE KEYS */;
INSERT INTO `billcategory` VALUES (1,'Hospital','OP Consultation','OPC'),(2,'Hospital','Advance','ADV'),(3,'Labs','LABS','LAB'),(4,'Pharmacy','PHARMACY','PHR');
/*!40000 ALTER TABLE `billcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing` (
  `bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_date` date DEFAULT NULL,
  `bill_org_id` int(11) DEFAULT NULL,
  `bill_org_name_city` varchar(200) DEFAULT NULL,
  `bill_order` int(11) DEFAULT NULL,
  `bill_no` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `patient_type` varchar(20) DEFAULT NULL,
  `facility_id` int(11) DEFAULT NULL,
  `facility_name` varchar(100) DEFAULT NULL,
  `facilitator_id` int(11) DEFAULT NULL,
  `facilitator_name` varchar(100) DEFAULT NULL,
  `facilitator_qualification` varchar(50) DEFAULT NULL,
  `bill_amount` double DEFAULT NULL,
  `bill_discount` double DEFAULT NULL,
  `bill_total` double DEFAULT NULL,
  `bill_tax` varchar(20) DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `due` double DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL,
  `paid_date_time` datetime DEFAULT NULL,
  `remarks` longtext,
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (25,'2017-12-05',1,'Kakinada - 03',1,'H1/18/1',77,'OPC',12,'OP Consultation',14,'SESHA GIRI RAO','M.S.(Ortho)',400,0,400,'',0,0,0,'','2017-12-05 03:51:11',''),(26,'2017-12-05',1,'Kakinada - 03',2,'H1/18/2',77,'OPC',12,'OP Consultation',14,'SESHA GIRI RAO','M.S.(Ortho)',400,0,400,'',0,0,0,'','2017-12-05 03:52:51',''),(27,'2017-12-05',1,'Kakinada - 03',3,'H1/18/3',77,'OPC',12,'OP Consultation',14,'SESHA GIRI RAO','M.S.(Ortho)',400,0,400,'',0,0,0,'','2017-12-05 03:54:18','');
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casualty_medicines`
--

DROP TABLE IF EXISTS `casualty_medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casualty_medicines` (
  `casualty_medicine_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `medicine_stock_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `issued` tinyint(1) DEFAULT '0',
  `p_visit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`casualty_medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casualty_medicines`
--

LOCK TABLES `casualty_medicines` WRITE;
/*!40000 ALTER TABLE `casualty_medicines` DISABLE KEYS */;
/*!40000 ALTER TABLE `casualty_medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultation_rooms`
--

DROP TABLE IF EXISTS `consultation_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultation_rooms` (
  `cons_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `dr_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cons_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation_rooms`
--

LOCK TABLES `consultation_rooms` WRITE;
/*!40000 ALTER TABLE `consultation_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultation_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecilities`
--

DROP TABLE IF EXISTS `fecilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fecilities` (
  `fcid` int(11) NOT NULL AUTO_INCREMENT,
  `fcode` varchar(10) DEFAULT NULL,
  `fcname` varchar(100) DEFAULT NULL,
  `fcdesc` varchar(200) DEFAULT NULL,
  `fcgid` int(11) DEFAULT NULL,
  `fc_status` int(11) DEFAULT '1',
  `tax` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fcid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecilities`
--

LOCK TABLES `fecilities` WRITE;
/*!40000 ALTER TABLE `fecilities` DISABLE KEYS */;
INSERT INTO `fecilities` VALUES (1,'GOP','General OP','General OP',1,1,'3'),(2,'SOP','Special OP','Special OP',1,1,'3'),(3,'EOP','Emergency OP','Emergency OP',1,1,'3'),(4,'COP','Casualty OP','Casualty OP',1,1,'3'),(5,'GIP','General IP','General IP',2,1,'3'),(6,'EIP','Emergency  IP','Emergency  IP',2,1,'3'),(7,'CIP','ICU IP','ICU IP',4,1,'3'),(8,'LAB','Laboratory','Laboratory',5,1,'3'),(9,'RADIOLOGY','RADIOLOGY','RADIOLOGY',6,1,'3'),(10,'FC10','Special IP','Special IP',6,1,'3'),(11,'FC11','Emergency IP','ss',6,1,'3');
/*!40000 ALTER TABLE `fecilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fecilities_group`
--

DROP TABLE IF EXISTS `fecilities_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fecilities_group` (
  `fcgid` int(11) NOT NULL AUTO_INCREMENT,
  `fcgname` varchar(100) DEFAULT NULL,
  `fcgdesc` text,
  `fcg_status` int(11) DEFAULT '1',
  PRIMARY KEY (`fcgid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecilities_group`
--

LOCK TABLES `fecilities_group` WRITE;
/*!40000 ALTER TABLE `fecilities_group` DISABLE KEYS */;
INSERT INTO `fecilities_group` VALUES (1,'Out Patient','Out Patient',1),(2,'In Patient','In Patient',1),(3,'IP Rooms','IP Rooms',1),(4,'ICU','ICU',1),(5,'LAB','LAB',1),(6,'Scan Center','Scanning Center',1),(7,'OT','Operation Theater',1),(8,'PH','Pharmacy',1),(9,'Canteen','Food Court',1);
/*!40000 ALTER TABLE `fecilities_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospitals` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `hcode` varchar(10) DEFAULT NULL,
  `hname` varchar(100) DEFAULT NULL,
  `haddress` varchar(100) DEFAULT NULL,
  `hcity` varchar(100) DEFAULT NULL,
  `hphone` varchar(12) DEFAULT NULL,
  `hmobile` varchar(12) DEFAULT NULL,
  `hemail` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `fecility_grp` int(11) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitals`
--

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;
INSERT INTO `hospitals` VALUES (1,'BRM','Dr. BRM CareWell Hospital','100 building centre','Kakinada','0884235648','9063995999','brmcrewell@gmail.com',1,1),(2,'SSC','Satya Scan Center','Srinagar','Kakinada','8888','9995555123','k@kd.com',1,6);
/*!40000 ALTER TABLE `hospitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_inward`
--

DROP TABLE IF EXISTS `inventory_inward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_inward` (
  `inward_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(50) DEFAULT NULL,
  `item_group` varchar(50) DEFAULT NULL,
  `is_medicine` varchar(50) DEFAULT NULL,
  `item_units` varchar(50) DEFAULT NULL,
  `item_batch_code` varchar(50) DEFAULT NULL,
  `item_expiry_date` date DEFAULT NULL,
  `item_brand_name` varchar(50) DEFAULT NULL,
  `date_of_purchase` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `vendor` varchar(50) DEFAULT NULL,
  `receipt_no` varchar(50) DEFAULT NULL,
  `mrp` varchar(50) DEFAULT NULL,
  `purchase_price` double(10,2) DEFAULT NULL,
  `sale_price` double(10,2) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `warrenty_date` date DEFAULT NULL,
  `inw_is_deleted` int(11) DEFAULT '1',
  PRIMARY KEY (`inward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_inward`
--

LOCK TABLES `inventory_inward` WRITE;
/*!40000 ALTER TABLE `inventory_inward` DISABLE KEYS */;
INSERT INTO `inventory_inward` VALUES (43,16,'Fans','Electrical','1','Pcs',NULL,NULL,NULL,'2017-11-01',10,'Mukesh Electronics','324256','500',400.00,NULL,NULL,NULL,1),(44,20,'LED TV','Eletronics','1','Pcs',NULL,NULL,NULL,'2017-11-01',20,'Mukesh Electronics','324256','50000',35000.00,NULL,NULL,NULL,1),(45,27,'Cotton Bandage','Medicine','1','Bundle',NULL,NULL,NULL,'2017-12-13',12,'Naresh Electronics','35345','5000',4000.00,NULL,NULL,NULL,1),(46,22,'Dettol Floor Cleaner','House Keeping','0','Bottle',NULL,NULL,NULL,'2017-12-13',34,'Naresh Electronics','35345','400',250.00,NULL,NULL,NULL,1),(47,22,'Dettol Floor Cleaner','House Keeping','0','Bottle',NULL,NULL,NULL,'2017-12-06',34,'Naresh Electronics','45435','450',250.00,NULL,NULL,NULL,1),(48,24,'Room Spray','House Keeping','0','Spray',NULL,NULL,NULL,'2017-12-06',22,'Naresh Electronics','45435','4500',3000.00,NULL,NULL,NULL,1),(49,21,'2 Ton Split AC','Eletronics','0','Pcs',NULL,NULL,NULL,'1111-11-11',1,'122','232','1',1.00,NULL,NULL,NULL,1),(50,21,'2 Ton Split AC','Eletronics','0','Pcs',NULL,NULL,NULL,'1111-11-10',1,'a','12','1',1.00,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `inventory_inward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_qty`
--

DROP TABLE IF EXISTS `inventory_qty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_qty` (
  `inventory_qty_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`inventory_qty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_qty`
--

LOCK TABLES `inventory_qty` WRITE;
/*!40000 ALTER TABLE `inventory_qty` DISABLE KEYS */;
INSERT INTO `inventory_qty` VALUES (19,16,20),(20,20,20),(21,27,12),(22,22,68),(23,24,22),(24,21,2);
/*!40000 ALTER TABLE `inventory_qty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_units`
--

DROP TABLE IF EXISTS `inventory_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `is_medicine` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_units`
--

LOCK TABLES `inventory_units` WRITE;
/*!40000 ALTER TABLE `inventory_units` DISABLE KEYS */;
INSERT INTO `inventory_units` VALUES (1,'Ampoule',1,'N'),(2,'Bag',1,'N'),(4,'Bottle',1,'N'),(5,'Box',1,'N'),(6,'Bundle',1,'Y'),(7,'Capsule',1,'Y'),(8,'Case',1,'N'),(9,'Container',1,'N'),(10,'Cream',1,'Y'),(11,'Each',1,'N'),(12,'Gel',1,'Y'),(13,'Nebule',1,'Y'),(14,'Ointment',1,'Y'),(15,'Pack',1,'N'),(16,'Pair',1,'N'),(17,'Pallet',1,'N'),(18,'Patch',1,'N'),(19,'Pcs',1,'N'),(20,'Pill',1,'Y'),(22,'Polyamp',1,'N'),(23,'Roll',1,'Y'),(24,'Spray',1,'Y'),(25,'Suspension',1,'N'),(26,'Setwet',1,'N'),(27,'Syrup',1,'Y'),(28,'Tablet',1,'Y'),(29,'Tray',1,'Y'),(30,'Tube',1,'N'),(31,'Vial',1,'N'),(32,'syrup',1,NULL),(33,'gml',1,NULL),(34,'ml',1,NULL),(35,'FLUID',1,NULL),(36,'Nos',1,NULL);
/*!40000 ALTER TABLE `inventory_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_group`
--

DROP TABLE IF EXISTS `item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_group` (
  `ig_id` int(10) NOT NULL AUTO_INCREMENT,
  `ig_name` varchar(100) DEFAULT NULL,
  `ig_asset` varchar(1) DEFAULT 'N',
  `is_medicine` varchar(1) DEFAULT 'N',
  `ig_status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`ig_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_group`
--

LOCK TABLES `item_group` WRITE;
/*!40000 ALTER TABLE `item_group` DISABLE KEYS */;
INSERT INTO `item_group` VALUES (1,'TABLES','Y','N',1),(2,'CHAIRS','Y','N',1),(3,'MEDICINE','N','Y',1),(4,'BUCKETS','Y','N',1),(5,'MUGS','Y','N',1),(6,'CHIPURLU','Y','N',1),(7,'BED SHEETS AND PILLOWS','Y','N',1),(8,'DRUG BOXES','Y','N',1),(9,'FAN','Y','N',1),(10,'LAND PHONES','Y','N',1),(11,'STEEL TROLLY','Y','N',1),(12,'WHEEL CHAIR','Y','N',1),(13,'FIRE EXTINGUISHER CYLINDER','Y','N',1),(14,'O2 cylinder','Y','N',1),(15,'COUNTER TABLE','Y','N',1),(16,'SILINE STANDS','Y','N',1),(17,'WEIGHING MACHINE','Y','N',1),(18,'ECG MACHINE AND TROLLY','Y','Y',1),(19,'NOTICE BOARD','Y','N',1),(20,'GLASS STAND','Y','N',1),(21,'PLANK STAND table','Y','N',1),(22,'JIO MOBILE PHONE','Y','N',1),(23,'STETHESCOPE','Y','N',1),(24,'BP Operater','Y','N',1),(25,'Thermo meter','Y','N',1),(26,'Dressing tray and forecheff','Y','N',1),(27,'Instruments box','Y','N',1),(28,'Scissore','Y','N',1),(29,'Napkin','Y','N',1),(30,'Punching Machine','Y','N',1),(31,'Needle burner','Y','N',1),(32,'Small tray','Y','N',1),(33,'Dust bin','Y','N',1),(34,'Bulb and tubes','Y','N',1),(35,'Bed curtains','Y','N',1),(36,'Glass Curtains','Y','N',1),(37,'Plastic Tray','Y','N',1),(38,'Electricals','Y','N',1),(39,'Cloths','Y','N',1),(40,'Stands','Y','N',1),(41,'For patient Utilities','Y','Y',1),(42,'Furniture','Y','N',1),(43,'Air conditionar AC','Y','N',1),(44,'Stationary','Y','N',1),(45,'OT modular','Y','N',1),(46,'Anastecia Station','Y','N',1),(47,'Monitor','Y','N',1),(48,'Surgery Table','Y','N',1),(49,'Put stool chair','Y','N',1),(50,'Touch Made LED lights','Y','N',1),(51,'CLOCK','Y','N',1),(52,'CRM','Y','N',1),(53,'INSTRUMENT TRALY BIG','Y','N',1),(54,'INSTRUMENT TRALY SMALL','Y','N',1),(55,'INSTRUMENT TRALY MEDIUM','Y','N',1),(56,'MAXER LAPROSCOPE TRALY','Y','N',1),(57,'VACCUM SECTION OPERATOR','Y','N',1),(58,'PENDENT','Y','N',1),(59,'AUTO CLAVE MACHINE BIG','Y','N',1),(60,'BOOSTER','Y','N',1),(61,'AaM REST','Y','N',1),(62,'TRUNK BOX','Y','N',1),(63,'PUT STOOL','Y','N',1),(64,'SURGEN STOOL','Y','N',1),(65,'LAPROSCOPE INSTRUMENT BOX','Y','N',1),(66,'X RAY LOBBY','Y','N',1),(67,'DY THERAMI','Y','N',1),(68,'BIN','Y','N',1),(69,'SCISSORS BOX','Y','N',1),(70,'PEMPCATION MACHINE BOX','Y','N',1),(71,'BASIN','Y','N',1),(72,'MAT','Y','N',1),(73,'STEEL SINC','Y','N',1),(74,'STEEL TAPS','Y','N',1),(75,'COMPUTERS','Y','N',1),(76,'PRINTERS','Y','N',1),(77,'CPU','Y','N',1),(78,'LAPROSCOPE MONITOR','Y','N',1),(79,'SECTION OPERATOR','Y','N',1),(80,'DRUG TRALLY TRASH CARD','Y','N',1),(81,'SIDEX TRAY','Y','N',1),(82,'PENDENT','Y','N',1),(83,'ERBA EM200','Y','N',1),(84,'BIO SYSTEM A 45 XP 100','Y','N',1),(85,'RADIANCE SEMI AUTOMATED ANALYZER','Y','N',1),(86,'EASYLYTE EXPOND ELECTROLATES','Y','N',1),(87,'NEEDLE BURNER','Y','N',1),(88,'PATHOLOGICAL MICROSCOPE','Y','N',1),(89,'COLORI METER','Y','N',1),(90,'COUNTING CELLS MACHINE','Y','N',1),(91,'ROTATED SAMPLE MACHINE','Y','N',1),(92,'PRINTER','Y','N',1),(93,'INVERTOR','Y','N',1),(94,'LG FRIDGE','Y','N',1),(95,'WATER TINS','Y','N',1),(96,'WEAST WATER TINS','Y','N',1),(97,'CLEANING SOLUCTION TIN','Y','N',1),(98,'HIMOGLOBIN SOLUCTION','Y','N',1),(99,'TUBE CLEANING HYPER SOLUCTION','Y','N',1),(100,'NS RL','Y','N',1),(101,'URIN STRIPS','Y','N',1),(102,'TEST TUBE STANDS','Y','N',1),(103,'STERILLIUM','Y','N',1),(104,'SPRIT','Y','N',1),(105,'P T MACHINE','Y','N',1),(106,'CENTRIFUGE','Y','N',1),(107,'COMPUTER','Y','N',1),(108,'NS RL','Y','N',1),(109,'Needle Stand','Y','N',1),(110,'Reeder Konika  Minolta Regius 2','Y','N',1),(111,'Printer DryPro','Y','N',1),(112,'Mobile X Ray Machine 100 ma','Y','N',1),(113,'X Ray Chest Stand','Y','N',1),(114,'X Ray Grid Table','Y','N',1),(115,'Lead Apperon','Y','N',1),(116,'14  17 casset','Y','N',1),(117,'12  10 casset','Y','N',1),(118,'Thread Mill TMT','Y','N',1),(119,'ACQUISITION BOX RMS','Y','N',1),(120,'STOOL','Y','N',1),(121,'Machinery Tools','Y','N',1);
/*!40000 ALTER TABLE `item_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item_code` varchar(100) NOT NULL DEFAULT '',
  `item_group` varchar(50) NOT NULL,
  `item_name` varchar(200) NOT NULL,
  `item_units` varchar(20) DEFAULT NULL,
  `item_manufacturer` varchar(100) NOT NULL DEFAULT 'Unknown',
  `is_fixed_asset` tinyint(1) DEFAULT '0',
  `is_consumable` tinyint(1) NOT NULL DEFAULT '0',
  `in_house_use_only` tinyint(1) NOT NULL DEFAULT '0',
  `is_medicine` tinyint(1) NOT NULL DEFAULT '0',
  `combination` varchar(200) DEFAULT NULL,
  `taxes` varchar(10) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '1',
  `med_combination` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (16,'ITEM1','Electrical','Fans','19','USHA',1,1,1,1,NULL,'GST18%',0,'Combination B12'),(17,'ITEM2','Electrical','Tube Lights','19','CG',1,0,1,0,NULL,'7.5',0,'Test Combination'),(18,'ITEM3','Furniture','Table','19','Godrej',1,0,1,0,NULL,'1',0,NULL),(19,'ITEM4','Furniture','Executive Chair','19','Godrej',1,0,1,0,NULL,'1',0,NULL),(20,'ITEM5','Eletronics','LED TV','19','Samsung',1,0,1,1,NULL,'1',0,'Combnation C12'),(21,'ITEM6','Eletronics','2 Ton Split AC','19','LG',1,0,1,0,NULL,'1',0,NULL),(22,'ITEM7','House Keeping','Dettol Floor Cleaner','4','Dettol',0,1,1,0,NULL,'1',0,NULL),(23,'ITEM8','Lab Chemical','H2SO4','4','nil',0,1,0,0,NULL,'1',0,NULL),(24,'ITEM9','House Keeping','Room Spray','24','Airvick',0,1,1,0,NULL,'1',0,NULL),(25,'ITEM10','Surgicals','Curved scissors','19','Nil',1,0,1,0,NULL,'1',0,NULL),(26,'ITEM11','Surgicals','Suture needle','19','Nil',0,1,1,0,NULL,'1',0,NULL),(27,'ITEM12','Medicine','Cotton Bandage','6','nil',0,1,0,1,NULL,'1',0,NULL),(28,'ITEM13','Lab Chemical','ITEM13','4','Dettol',0,1,1,1,NULL,'4',0,NULL),(29,'ITEM14','Eletronics','TableBulb','19','USHA',1,1,1,1,NULL,'4',0,NULL),(30,'Item420','House Keeping','Mat','8','USHA',1,0,1,0,NULL,'',0,NULL),(31,'Item422','Lab Chemical','LAB','4','USHA',1,0,0,1,NULL,'',0,NULL),(32,'Item 55','Lab Chemical','LabNobe','5','Dettol',0,0,0,1,NULL,'3',0,'Test'),(33,'1','1','1','','',0,0,0,0,NULL,'',0,'');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_test`
--

DROP TABLE IF EXISTS `lab_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_test` (
  `lab_test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_group_id` varchar(40) DEFAULT NULL,
  `test_name` varchar(40) DEFAULT NULL,
  `ref_values` json DEFAULT NULL,
  `sample_name` json DEFAULT NULL,
  `consumable_items` json DEFAULT NULL,
  `test_service_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`lab_test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_test`
--

LOCK TABLES `lab_test` WRITE;
/*!40000 ALTER TABLE `lab_test` DISABLE KEYS */;
INSERT INTO `lab_test` VALUES (1,'1','COMPLETE BLOOD PICTURE','[{\"Gender\": \"All\", \"endRange\": \"17\", \"$$hashKey\": \"object:386\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"13\", \"subInvestigation\": \"HEMOGLOBIN\"}, {\"Gender\": \"All\", \"endRange\": \"5.5\", \"$$hashKey\": \"object:540\", \"rangeType\": \"Range\", \"unit_name\": \"million cells/cu.mm\", \"startRange\": \"4.5\", \"subInvestigation\": \"RBC COUNT\"}, {\"Gender\": \"All\", \"endRange\": \"50\", \"$$hashKey\": \"object:556\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"40\", \"subInvestigation\": \"HCT\"}, {\"Gender\": \"All\", \"endRange\": \"101\", \"$$hashKey\": \"object:572\", \"rangeType\": \"Range\", \"unit_name\": \"fl\", \"startRange\": \"83\", \"subInvestigation\": \"MCV\"}, {\"Gender\": \"All\", \"endRange\": \"32\", \"$$hashKey\": \"object:588\", \"rangeType\": \"Range\", \"unit_name\": \"pg\", \"startRange\": \"27\", \"subInvestigation\": \"MCH\"}, {\"Gender\": \"All\", \"endRange\": \"34\", \"$$hashKey\": \"object:604\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"31\", \"subInvestigation\": \"MCHC\"}, {\"Gender\": \"All\", \"endRange\": \"12000\", \"$$hashKey\": \"object:620\", \"rangeType\": \"Range\", \"unit_name\": \"cells/cu.mm\", \"startRange\": \"4,000\", \"subInvestigation\": \"TWBC COUNT\"}, {\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:636\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"40\", \"subInvestigation\": \"NEUTROPHILS\"}, {\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:652\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"20\", \"subInvestigation\": \"LYMPHOCYTES\"}, {\"Gender\": \"All\", \"endRange\": \"10\", \"$$hashKey\": \"object:668\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"2\", \"subInvestigation\": \"MONOCYTES\"}, {\"Gender\": \"All\", \"endRange\": \"6\", \"$$hashKey\": \"object:684\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"2\", \"subInvestigation\": \"EOSINOPHILS\"}, {\"Gender\": \"All\", \"endRange\": \"4.0\", \"$$hashKey\": \"object:700\", \"rangeType\": \"Range\", \"unit_name\": \"lakhs/cu.mm\", \"startRange\": \"1.5\", \"subInvestigation\": \"PLATELET COUNT\"}, {\"Gender\": \"All\", \"endRange\": \"10\", \"$$hashKey\": \"object:716\", \"rangeType\": \"Range\", \"unit_name\": \"mm in 1st hour\", \"startRange\": \"0\", \"subInvestigation\": \"ESR\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:748\", \"rangeType\": \"Time\", \"unit_name\": \"minutes\", \"endMinutes\": \"3\", \"endSeconds\": \"00\", \"startMinutes\": \"1\", \"startSeconds\": \"00\", \"subInvestigation\": \"BLEEDING TIME\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:776\", \"rangeType\": \"Time\", \"unit_name\": \"minutes\", \"endMinutes\": \"7\", \"endSeconds\": \"00\", \"startMinutes\": \"3\", \"startSeconds\": \"00\", \"subInvestigation\": \"CLOTTING TIME\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:396\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"5\", \"med_name\": \"20 M\", \"$$hashKey\": \"object:406\"}]',2),(2,'2','LIVER FUNCTION TEST(LFT)','[{\"Gender\": \"All\", \"endRange\": \"1.2\", \"$$hashKey\": \"object:2266\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.2\", \"subInvestigation\": \"SERUM BILIRUBIN TOTAL\"}, {\"Gender\": \"All\", \"endRange\": \"0.3\", \"$$hashKey\": \"object:2417\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.0\", \"subInvestigation\": \"SERUM BILIRUBIN DIRECT\"}, {\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:2433\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"SERUM BILIRUBIN INDIRECT\"}, {\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:2449\", \"rangeType\": \"Range\", \"unit_name\": \"u/l\", \"startRange\": \"05\", \"subInvestigation\": \"SGOT\"}, {\"Gender\": \"All\", \"endRange\": \"49\", \"$$hashKey\": \"object:2465\", \"rangeType\": \"Range\", \"unit_name\": \"u/l\", \"startRange\": \"0\", \"subInvestigation\": \"SGPT\"}, {\"Gender\": \"All\", \"endRange\": \"141\", \"$$hashKey\": \"object:2481\", \"rangeType\": \"Range\", \"unit_name\": \"u/l\", \"startRange\": \"36\", \"subInvestigation\": \"S.ALKALINE PHOSPHATASE\"}, {\"Gender\": \"All\", \"endRange\": \"8.0\", \"$$hashKey\": \"object:2497\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"6.0\", \"subInvestigation\": \"SERUM TOTAL PROTEIN\"}, {\"Gender\": \"All\", \"endRange\": \"5.0\", \"$$hashKey\": \"object:2513\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"3.5\", \"subInvestigation\": \"ALBUMIN\"}, {\"Gender\": \"All\", \"endRange\": \"3.7\", \"$$hashKey\": \"object:2529\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"2.3\", \"subInvestigation\": \"GLOBULIN\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:2276\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"5\", \"med_name\": \"20 M\", \"$$hashKey\": \"object:2286\"}]',2),(3,'2','LIPID PROFILE','[{\"Gender\": \"All\", \"endRange\": \"200\", \"$$hashKey\": \"object:3411\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"25\", \"subInvestigation\": \"TRIGLYCERIDES\"}, {\"Gender\": \"All\", \"endRange\": \"250\", \"$$hashKey\": \"object:3562\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"130\", \"subInvestigation\": \"TOTAL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:3578\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"35\", \"subInvestigation\": \"HDL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"120\", \"$$hashKey\": \"object:3594\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"LDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"27\", \"$$hashKey\": \"object:3610\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"VLDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"4.3\", \"$$hashKey\": \"object:3626\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"2.9\", \"endNumerator\": \"0.7\", \"startNumerator\": \"3.6\", \"subInvestigation\": \"TOTAL/HDL CHOLESTEROL RATIO\"}, {\"Gender\": \"All\", \"endRange\": \"2.7\", \"$$hashKey\": \"object:3690\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.5\", \"subInvestigation\": \"LDL/HDL CHOLESTEROL RATIO\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:3421\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"9\", \"med_name\": \"Diken 3 ml inj\", \"$$hashKey\": \"object:3431\"}]',2),(4,'3','VIROLOGY','[{\"Gender\": \"All\", \"$$hashKey\": \"object:3973\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BLOOD FOR HIV(TRIDOT)\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:4309\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HEPATISIS B ANTIGEN(HbsAg)\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:4994\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HEPATITIS C VIRUS(HCV)\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:3983\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:3993\"}]',2),(5,'1','HEMOGLOBIN A1c','[{\"Gender\": \"All\", \"$$hashKey\": \"object:5261\", \"rangeType\": \"Description\", \"unit_name\": \"%\", \"Description\": \"NORMAL : 3.0-6.2%,GOOD DIABATIC CONTROL : 5.5-6.8%,FAIR CONTROL : 6.8 - 7.6%,POOR CONTROL : >7.6%\", \"subInvestigation\": \"GLYCOSYLATED HEMOGLOBIN A1c\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:5418\", \"rangeType\": \"Description\", \"unit_name\": \"mg/dl\", \"Description\": \"NORMAL : 3.0-6.2%,GOOD DIABATIC CONTROL : 5.5-6.8%,FAIR CONTROL : 6.8 - 7.6%,POOR CONTROL : >7.6%\", \"subInvestigation\": \"MEAN BLOOD GLUCOSE(MBG)\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"GLYCOSYLATED HEMOGLBIN SERVES AS AN INDICATOR OF METABOLIC CONTROL OF DIABETICS. THE MEASURE OF GLYCOSLATED HEMOGLOBIN REFLECTS THE AVERAGE BLOOD GLUCOSE CONCENTRATUINS OVER THE PRECEEDING  SERVERAL WEEKS. HENCE IT IS UNAFFECTED BY DIET, INSULIN OR EXERCISE ON THE TESTING. A FAIRLY RAPID RISE CAN OCCUR DURING POOR DIABETIC CONTROL\", \"$$hashKey\": \"object:5271\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:5281\"}]',2),(6,'1','BLOOD GROUPING','[{\"Array\": \"A,B,AB,0\", \"Gender\": \"All\", \"$$hashKey\": \"object:5677\", \"rangeType\": \"Array\", \"unit_name\": \"-\", \"subInvestigation\": \"BLOOD GROUP\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:5831\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"RH-TYPE\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:5687\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:5697\"}]',2),(7,'3','DENGUE','[{\"Gender\": \"All\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:6104\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:6114\"}]',2),(8,'3','MALARIAL','[{\"Gender\": \"All\", \"$$hashKey\": \"object:6535\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BLOOD FOR MALARIAL PARASITE(P.V &P.F CARD)\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:6545\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:6555\"}]',2),(9,'3','WIDAL','[{\"Gender\": \"All\", \"$$hashKey\": \"object:6939\", \"rangeType\": \"Ratio\", \"unit_name\": \"dilutions\", \"endNumerator\": \"1\", \"endDenominator\": \"320\", \"startNumerator\": \"1\", \"startDenominator\": \"20\", \"subInvestigation\": \"SALMONELLA TYPHI - O\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:7526\", \"rangeType\": \"Ratio\", \"unit_name\": \"dilutions\", \"endNumerator\": \"1\", \"endDenominator\": \"320\", \"startNumerator\": \"1\", \"startDenominator\": \"20\", \"subInvestigation\": \"SALMONELLA TYPHI - H\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:7552\", \"rangeType\": \"Ratio\", \"unit_name\": \"dilutions\", \"endNumerator\": \"1\", \"endDenominator\": \"320\", \"startNumerator\": \"1\", \"startDenominator\": \"20\", \"subInvestigation\": \"SALMONELLA  PARA TYPHI - AH\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:7578\", \"rangeType\": \"Ratio\", \"unit_name\": \"dilutions\", \"endNumerator\": \"1\", \"endDenominator\": \"320\", \"startNumerator\": \"1\", \"startDenominator\": \"20\", \"subInvestigation\": \"SALMONELLA  PARA TYPHI - BH\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:6949\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:6959\"}]',2),(10,'2','RENTAL FUNCTION TESTS(RFT)','[{\"Gender\": \"All\", \"endRange\": \"140\", \"$$hashKey\": \"object:7923\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"70\", \"subInvestigation\": \"BLOOD GLUCOSE(R)\"}, {\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:8074\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"14\", \"subInvestigation\": \"BLOOD UREA\"}, {\"Gender\": \"All\", \"endRange\": \"21.0\", \"$$hashKey\": \"object:8090\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"6.5\", \"subInvestigation\": \"BLOOD UREA NITROGEN (BUN)\"}, {\"Gender\": \"All\", \"endRange\": \"7.7\", \"$$hashKey\": \"object:8106\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"2.5\", \"subInvestigation\": \"SERUM URIC ACID\"}, {\"Gender\": \"All\", \"endRange\": \"10.8\", \"$$hashKey\": \"object:8122\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"8.2\", \"subInvestigation\": \"SERUM CALCIUM\"}, {\"Gender\": \"All\", \"endRange\": \"1.4\", \"$$hashKey\": \"object:8138\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.4\", \"subInvestigation\": \"SERUM CREA TININE\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:7933\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:7943\"}]',2),(11,'2','ELECTROLYTES','[{\"Gender\": \"All\", \"endRange\": \"155\", \"$$hashKey\": \"object:8409\", \"rangeType\": \"Range\", \"unit_name\": \"mmoI/L\", \"startRange\": \"135\", \"subInvestigation\": \"SERUM SODIUM\"}, {\"Gender\": \"All\", \"endRange\": \"5.5\", \"$$hashKey\": \"object:8560\", \"rangeType\": \"Range\", \"unit_name\": \"mmoI/L\", \"startRange\": \"3.5\", \"subInvestigation\": \"SERUM POTASSIUM\"}, {\"Gender\": \"All\", \"endRange\": \"108\", \"$$hashKey\": \"object:8576\", \"rangeType\": \"Range\", \"unit_name\": \"mmoI/L\", \"startRange\": \"98\", \"subInvestigation\": \"SERUM CHLORIDES\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:8419\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:8429\"}]',2),(12,'4','COMPLETE URINE EXAMINATION (CUE)','[{\"Gender\": \"All\", \"remarks\": \"\", \"$$hashKey\": \"object:8908\", \"rangeType\": \"T/F\", \"trueValue\": \"CLEAR\", \"unit_name\": \"-\", \"falseValue\": \"CLOUDY\", \"subInvestigation\": \"APPEARANCE\"}, {\"Array\": \"PALE YELLO\", \"Gender\": \"All\", \"$$hashKey\": \"object:9070\", \"rangeType\": \"T/F\", \"trueValue\": \"PALE YELLOW\", \"unit_name\": \"-\", \"falseValue\": \"REDDISH YELLOW\", \"subInvestigation\": \"COLOUR\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9093\", \"rangeType\": \"T/F\", \"trueValue\": \"ACIDIC\", \"unit_name\": \"-\", \"falseValue\": \"-\", \"subInvestigation\": \"REACTION\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9113\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BLOOD\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9133\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BILE SALTS\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9165\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BILE PIGMENTS\"}, {\"Array\": \"NORMAL,1+,2+,3+,4+\", \"Gender\": \"All\", \"$$hashKey\": \"object:9185\", \"rangeType\": \"Array\", \"unit_name\": \"-\", \"subInvestigation\": \"UROBILINOGEN\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9208\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"KETONE BODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9228\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"PROTEINS\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9248\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"GLUCOSE\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9268\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"NITRITES\"}, {\"Gender\": \"All\", \"endRange\": \"9.0\", \"$$hashKey\": \"object:9288\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"5.0\", \"subInvestigation\": \"PH\"}, {\"Gender\": \"All\", \"endRange\": \"1.030\", \"$$hashKey\": \"object:9304\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.00\", \"subInvestigation\": \"SPECIFIC GRAVITY\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9320\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"LEUKOCYTES\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:8918\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:8928\"}]',2),(13,'4','suc,alb,micro','[{\"Gender\": \"All\", \"remarks\": \"2-3 suc cells , crystal and reports, chemical cells\", \"$$hashKey\": \"object:1043\", \"rangeType\": \"T/F\", \"trueValue\": \"positive\", \"unit_name\": \"-\", \"falseValue\": \"negative\", \"subInvestigation\": \"glucose\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:1198\", \"rangeType\": \"T/F\", \"trueValue\": \"positive\", \"unit_name\": \"-\", \"falseValue\": \"negative\", \"subInvestigation\": \"albnum\"}]','[{\"qty\": \"1\", \"sample\": \"SERUM\", \"remarks\": \"3 -2 puc cells,crystals and reports\", \"$$hashKey\": \"object:1053\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:1063\"}]',2);
/*!40000 ALTER TABLE `lab_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_test_groups`
--

DROP TABLE IF EXISTS `lab_test_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_test_groups` (
  `test_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_group_name` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`test_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_test_groups`
--

LOCK TABLES `lab_test_groups` WRITE;
/*!40000 ALTER TABLE `lab_test_groups` DISABLE KEYS */;
INSERT INTO `lab_test_groups` VALUES (1,'HEMOTOLOGY',1),(2,'BIO CHEMISTRY',1),(3,'SEROLOGY',1),(4,'URINE',1),(5,'sample',1);
/*!40000 ALTER TABLE `lab_test_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `loc_id` int(11) NOT NULL AUTO_INCREMENT,
  `loc_code` varchar(10) DEFAULT NULL,
  `block_name` varchar(100) DEFAULT NULL,
  `loc_name` varchar(100) DEFAULT NULL,
  `hosp_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `fcgid` int(11) DEFAULT NULL,
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'LOC1','1st floor','Reception',1,1,1),(2,'LOC2','1st floor','LAB',1,1,5),(3,'LOC3','1st floor','NTR Vaidya seva room',1,1,2),(4,'LOC4','2nd floor','I.C.U ROOM ( 1 )',1,1,4),(5,'LOC5','3rd floor','General ward ( MALE )',1,1,2),(6,'LOC6','3rd floor','Special Room ( 1 )',1,1,NULL),(7,'LOC7','2nd floor','O.T ( MODULAR THEARTRE  )',1,1,7),(8,'LOC8','Ground Floor','CASUALITY',1,1,NULL),(9,'LOC9','2nd floor','I.C.U ROOM ( 2 )',1,1,NULL),(10,'LOC10','3rd Floor','General Ward ( Female )',1,1,NULL),(11,'LOC11','3rd Floor','Special Room ( 2 )',1,1,NULL),(12,'LOC12','3rd Floor','Special Room ( 3 )',1,1,NULL),(13,'LOC13','3rd Floor','Special Room ( 4 )',1,1,NULL),(14,'LOC14','1 st Floor','CONSULTATION ROOM 1',1,1,NULL),(15,'LOC15','1st Floor','CONSULTATION ROOM 2',1,1,NULL),(16,'LOC16','1st Floor','IN HOUSE PHARMACY',1,1,NULL),(17,'LOC17','1st Floor','ACCOUNTS ROOM',1,1,NULL),(18,'LOC18','1st Floor','IT ROOM',1,1,NULL),(19,'LOC19','1st Floor','CHAIRMAN ROOM',1,1,NULL),(20,'LOC20','1st Floor','X-RAY IMAGINING & THREDMILL ROOM',1,1,NULL),(21,'LOC21','1st Floor','DOCTORS TOILETS ROOM',1,1,NULL),(22,'LOC22','1st Floor','X-RAY ROOM',1,1,NULL),(23,'LOC23','1st Floor','RECEPTION & WAITING HALL',1,1,NULL),(24,'LOC24','1st Floor','PATIEANT TOILET',1,1,NULL),(25,'LOC25','1st Floor','PHYSOTHEREPY ROOM',1,1,NULL),(26,'LOC26','1st Floor','SMALL STORE ROOM',1,1,NULL),(27,'LOC27','2ND Floor','OT ( SMALL )',1,1,NULL),(28,'LOC28','2ND Floor','LABOUR ROOM',1,1,NULL),(29,'LOC29','2ND Floor','FEMALE DRESSING ROOM',1,1,NULL),(30,'LOC30','2ND Floor','DOCTORES REST ROOM',1,1,NULL),(31,'LOC31','2ND Floor','DUTY DOCTORS REST ROOM',1,1,NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_inward_register`
--

DROP TABLE IF EXISTS `medicine_inward_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine_inward_register` (
  `medicine_inward_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `medicinepo_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `invoice_amount` double DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_pend_qty` int(11) DEFAULT NULL,
  `item_rec_qty` int(11) DEFAULT NULL,
  `item_amount` double DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `item_qty` int(11) DEFAULT NULL,
  `batch_no` varchar(60) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `start_sequence` int(11) DEFAULT NULL,
  `end_sequence` int(11) DEFAULT NULL,
  `opening_balance` double(16,4) DEFAULT NULL,
  `mrp` double DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `free` double(8,4) DEFAULT NULL,
  PRIMARY KEY (`medicine_inward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_inward_register`
--

LOCK TABLES `medicine_inward_register` WRITE;
/*!40000 ALTER TABLE `medicine_inward_register` DISABLE KEYS */;
INSERT INTO `medicine_inward_register` VALUES (1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-05-05',15,1,4,'92229','2019-04-01',1,4,116.5200,29.13,29.13,NULL),(2,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-05-05',15,1,1,'1175323','2020-08-01',5,5,32.0000,32,32,NULL),(3,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,'2018-05-05',15,1,4,'17056','2020-04-01',6,9,52.0000,13,13,NULL),(4,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,'2018-05-05',15,1,4,'1174606','2020-10-01',10,13,188.0000,47,47,NULL),(5,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'2018-05-05',15,1,6,'2171218','2020-07-01',14,19,180.0000,30,30,NULL),(6,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,'2018-05-05',15,1,3,'692025','2019-06-01',20,22,69.0000,23,23,NULL),(7,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'2018-05-05',15,1,2,'263610','2018-05-01',23,24,38.0000,19,19,NULL),(8,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,'2018-05-05',15,1,2,'1090','2021-03-01',25,26,22.0000,17,11,NULL),(9,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,'2018-05-05',15,1,2,'7902','2019-07-01',27,28,10.0000,5,5,NULL),(10,NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,'2018-05-05',15,1,3,'6231','2018-06-01',29,31,15.0000,5,5,NULL),(11,NULL,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,'2018-05-05',15,1,4,'17232','2019-01-01',32,35,24.0000,6,6,NULL),(12,NULL,NULL,NULL,NULL,NULL,26,NULL,NULL,NULL,'2018-05-05',15,1,4,'7102','2018-12-01',36,39,108.0000,27,27,NULL),(13,NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,'2018-05-05',15,1,3,'3162030','2018-11-01',40,42,12.0000,4,4,NULL),(14,NULL,NULL,NULL,NULL,NULL,23,NULL,NULL,NULL,'2018-05-05',15,1,2,'6016','2020-03-01',43,44,24.0000,12,12,NULL),(15,NULL,NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,'2018-05-05',15,1,1,'2708','2019-05-01',45,45,14.0000,14,14,NULL),(16,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,'2018-05-05',15,1,5,'17063','2019-08-01',46,50,55.0000,11,11,NULL),(17,NULL,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,'2018-05-05',15,1,1,'1169141','2019-03-01',51,51,48.0000,48,48,NULL),(18,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,'2018-05-05',15,1,2,'670266','2020-07-01',52,53,40.0000,20,20,NULL),(19,NULL,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,'2018-05-05',15,1,2,'2417108','2019-02-01',54,55,8.0000,4,4,NULL),(20,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,'2018-05-05',15,1,2,'38006','2019-01-01',56,57,8.0000,4,4,NULL),(21,NULL,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,'2018-05-05',15,1,2,'1019','2019-08-01',58,59,10.0000,5,5,NULL),(22,NULL,NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,'2018-05-05',15,1,4,'896','2019-10-01',60,63,20.0000,5,5,NULL),(23,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,'2018-05-05',15,1,3,'0088','2020-06-01',64,66,33.0000,11,11,NULL),(24,NULL,NULL,NULL,NULL,NULL,21,NULL,NULL,NULL,'2018-05-05',15,1,2,'1334061','2018-11-01',67,68,54.0000,27,27,NULL),(25,NULL,NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,'2018-05-05',15,1,4,'1614','2018-09-01',69,72,76.0000,19,19,NULL),(26,NULL,NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,'2018-05-05',15,1,2,'75206','2019-10-01',73,74,44.0000,22,22,NULL),(27,NULL,NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,'2018-05-05',15,1,1,'2172683','2020-10-01',75,75,29.0000,29,29,NULL),(28,NULL,NULL,NULL,NULL,NULL,29,NULL,NULL,NULL,'2018-05-05',15,1,1,'74074','2019-08-01',76,76,11.0000,11,11,NULL),(29,NULL,NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,'2018-05-22',1,3,2,'17004','2019-01-01',77,78,228.0000,114,114,NULL),(30,NULL,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,'2018-05-22',1,3,7,'90002','2018-11-01',79,85,2541.0000,363,363,NULL),(31,NULL,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,'2018-05-22',1,3,3,'675002','2019-08-01',86,88,804.0000,267,268,NULL),(32,NULL,NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,'2018-05-22',1,3,2,'17004','2019-01-01',89,90,228.0000,114,114,NULL),(33,NULL,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,'2018-05-22',1,3,7,'90002','2018-11-01',91,97,2541.0000,363,363,NULL),(34,NULL,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,'2018-05-22',1,3,3,'675002','2019-08-01',98,100,804.0000,267,268,NULL),(35,NULL,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,'2018-05-22',1,3,3,'170033','2019-10-01',101,103,426.0000,142,142,NULL),(36,NULL,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,'2018-05-22',1,3,3,'170033','2019-10-01',104,106,426.0000,142,142,NULL),(37,NULL,NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,'2018-05-22',1,3,1,'102417','2019-10-01',107,107,846.0000,846,846,NULL),(38,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-05-25',1,3,100,'423423','2018-10-25',108,207,1000.0000,12,10,NULL),(39,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-05-25',1,3,100,'7654332','2018-08-23',208,307,1000.0000,12,10,NULL),(40,1,1,'1234','2018-05-26',9.09,1,7,1,9.09,'2018-05-26',1,3,8,'3232','2018-06-07',308,308,NULL,NULL,NULL,0.0000),(41,1,1,'12345','2018-05-26',9.09,1,6,1,9.09,'2018-05-26',1,3,8,'3232','2018-07-07',309,309,NULL,NULL,NULL,0.0000),(42,1,1,'121212','2018-05-26',9.09,1,5,1,9.09,'2018-05-26',1,3,8,'1212','2018-06-21',310,310,NULL,NULL,NULL,0.0000),(43,1,1,'2313','2018-05-26',9.09,1,4,1,9.09,'2018-05-26',1,3,8,'435345','2018-06-29',311,311,NULL,NULL,NULL,0.0000),(44,1,1,'123123','2018-05-26',9.09,1,3,1,9.09,'2018-05-26',1,3,8,'32131','2018-06-22',312,312,NULL,NULL,NULL,0.0000),(45,1,1,'324234','2018-05-26',9.09,1,2,1,9.09,'2018-05-26',1,3,8,'23423','2018-06-15',313,313,NULL,NULL,NULL,0.0000),(46,1,1,'1212','2018-05-26',9.09,1,1,1,9.09,'2018-05-26',1,3,8,'3424','2018-05-25',314,314,NULL,NULL,NULL,0.0000),(47,1,1,'234234','2018-05-26',9.09,1,0,1,9.09,'2018-05-26',1,3,8,'3234234','2018-05-25',315,315,NULL,NULL,NULL,0.0000),(48,2,2,'123421','2018-05-27',181.8,3,80,20,181.8,'2018-05-27',1,3,100,'4646564','2018-06-21',316,335,NULL,NULL,NULL,0.0000),(49,2,2,'12345432','2018-05-27',727.2,3,0,80,727.2,'2018-05-27',1,3,100,'232323','2018-06-27',336,415,NULL,10,10,0.0000),(50,1,5,'65445654','2018-06-02',363.6,7,0,20,363.6,'2018-06-02',1,3,20,'545654','2018-07-21',416,436,NULL,NULL,NULL,1.0000),(51,1,6,'23232323223','2018-06-02',60.6,88,0,4,60.6,'2018-06-02',1,3,4,'786786','2018-07-06',437,440,NULL,NULL,NULL,0.0000);
/*!40000 ALTER TABLE `medicine_inward_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_outward_register`
--

DROP TABLE IF EXISTS `medicine_outward_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine_outward_register` (
  `medi_outward_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_store_id` int(11) DEFAULT NULL,
  `to_store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `received_quantity` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `from_store_name` varchar(50) DEFAULT NULL,
  `to_store_name` varchar(50) DEFAULT NULL,
  `batch_no` varchar(60) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`medi_outward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_outward_register`
--

LOCK TABLES `medicine_outward_register` WRITE;
/*!40000 ALTER TABLE `medicine_outward_register` DISABLE KEYS */;
INSERT INTO `medicine_outward_register` VALUES (1,3,1,2,124,10,1,'2018-06-02 12:43:21',1,'BRM MEDICAL STORE','CASUALITY','423423','2018-10-25');
/*!40000 ALTER TABLE `medicine_outward_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_sequence_nos`
--

DROP TABLE IF EXISTS `medicine_sequence_nos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine_sequence_nos` (
  `sequence_id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_po_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `medicine_sequence_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`sequence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_sequence_nos`
--

LOCK TABLES `medicine_sequence_nos` WRITE;
/*!40000 ALTER TABLE `medicine_sequence_nos` DISABLE KEYS */;
INSERT INTO `medicine_sequence_nos` VALUES (1,NULL,1,1),(2,NULL,1,2),(3,NULL,1,3),(4,NULL,1,4),(5,NULL,2,5),(6,NULL,3,6),(7,NULL,3,7),(8,NULL,3,8),(9,NULL,3,9),(10,NULL,4,10),(11,NULL,4,11),(12,NULL,4,12),(13,NULL,4,13),(14,NULL,5,14),(15,NULL,5,15),(16,NULL,5,16),(17,NULL,5,17),(18,NULL,5,18),(19,NULL,5,19),(20,NULL,6,20),(21,NULL,6,21),(22,NULL,6,22),(23,NULL,7,23),(24,NULL,7,24),(25,NULL,10,25),(26,NULL,10,26),(27,NULL,9,27),(28,NULL,9,28),(29,NULL,12,29),(30,NULL,12,30),(31,NULL,12,31),(32,NULL,16,32),(33,NULL,16,33),(34,NULL,16,34),(35,NULL,16,35),(36,NULL,26,36),(37,NULL,26,37),(38,NULL,26,38),(39,NULL,26,39),(40,NULL,25,40),(41,NULL,25,41),(42,NULL,25,42),(43,NULL,23,43),(44,NULL,23,44),(45,NULL,24,45),(46,NULL,11,46),(47,NULL,11,47),(48,NULL,11,48),(49,NULL,11,49),(50,NULL,11,50),(51,NULL,13,51),(52,NULL,8,52),(53,NULL,8,53),(54,NULL,14,54),(55,NULL,14,55),(56,NULL,17,56),(57,NULL,17,57),(58,NULL,18,58),(59,NULL,18,59),(60,NULL,20,60),(61,NULL,20,61),(62,NULL,20,62),(63,NULL,20,63),(64,NULL,19,64),(65,NULL,19,65),(66,NULL,19,66),(67,NULL,21,67),(68,NULL,21,68),(69,NULL,22,69),(70,NULL,22,70),(71,NULL,22,71),(72,NULL,22,72),(73,NULL,27,73),(74,NULL,27,74),(75,NULL,28,75),(76,NULL,29,76),(77,NULL,31,77),(78,NULL,31,78),(79,NULL,32,79),(80,NULL,32,80),(81,NULL,32,81),(82,NULL,32,82),(83,NULL,32,83),(84,NULL,32,84),(85,NULL,32,85),(86,NULL,33,86),(87,NULL,33,87),(88,NULL,33,88),(89,NULL,31,89),(90,NULL,31,90),(91,NULL,32,91),(92,NULL,32,92),(93,NULL,32,93),(94,NULL,32,94),(95,NULL,32,95),(96,NULL,32,96),(97,NULL,32,97),(98,NULL,33,98),(99,NULL,33,99),(100,NULL,33,100),(101,NULL,34,101),(102,NULL,34,102),(103,NULL,34,103),(104,NULL,34,104),(105,NULL,34,105),(106,NULL,34,106),(107,NULL,35,107),(108,NULL,2,108),(109,NULL,2,109),(110,NULL,2,110),(111,NULL,2,111),(112,NULL,2,112),(113,NULL,2,113),(114,NULL,2,114),(115,NULL,2,115),(116,NULL,2,116),(117,NULL,2,117),(118,NULL,2,118),(119,NULL,2,119),(120,NULL,2,120),(121,NULL,2,121),(122,NULL,2,122),(123,NULL,2,123),(124,NULL,2,124),(125,NULL,2,125),(126,NULL,2,126),(127,NULL,2,127),(128,NULL,2,128),(129,NULL,2,129),(130,NULL,2,130),(131,NULL,2,131),(132,NULL,2,132),(133,NULL,2,133),(134,NULL,2,134),(135,NULL,2,135),(136,NULL,2,136),(137,NULL,2,137),(138,NULL,2,138),(139,NULL,2,139),(140,NULL,2,140),(141,NULL,2,141),(142,NULL,2,142),(143,NULL,2,143),(144,NULL,2,144),(145,NULL,2,145),(146,NULL,2,146),(147,NULL,2,147),(148,NULL,2,148),(149,NULL,2,149),(150,NULL,2,150),(151,NULL,2,151),(152,NULL,2,152),(153,NULL,2,153),(154,NULL,2,154),(155,NULL,2,155),(156,NULL,2,156),(157,NULL,2,157),(158,NULL,2,158),(159,NULL,2,159),(160,NULL,2,160),(161,NULL,2,161),(162,NULL,2,162),(163,NULL,2,163),(164,NULL,2,164),(165,NULL,2,165),(166,NULL,2,166),(167,NULL,2,167),(168,NULL,2,168),(169,NULL,2,169),(170,NULL,2,170),(171,NULL,2,171),(172,NULL,2,172),(173,NULL,2,173),(174,NULL,2,174),(175,NULL,2,175),(176,NULL,2,176),(177,NULL,2,177),(178,NULL,2,178),(179,NULL,2,179),(180,NULL,2,180),(181,NULL,2,181),(182,NULL,2,182),(183,NULL,2,183),(184,NULL,2,184),(185,NULL,2,185),(186,NULL,2,186),(187,NULL,2,187),(188,NULL,2,188),(189,NULL,2,189),(190,NULL,2,190),(191,NULL,2,191),(192,NULL,2,192),(193,NULL,2,193),(194,NULL,2,194),(195,NULL,2,195),(196,NULL,2,196),(197,NULL,2,197),(198,NULL,2,198),(199,NULL,2,199),(200,NULL,2,200),(201,NULL,2,201),(202,NULL,2,202),(203,NULL,2,203),(204,NULL,2,204),(205,NULL,2,205),(206,NULL,2,206),(207,NULL,2,207),(208,NULL,2,208),(209,NULL,2,209),(210,NULL,2,210),(211,NULL,2,211),(212,NULL,2,212),(213,NULL,2,213),(214,NULL,2,214),(215,NULL,2,215),(216,NULL,2,216),(217,NULL,2,217),(218,NULL,2,218),(219,NULL,2,219),(220,NULL,2,220),(221,NULL,2,221),(222,NULL,2,222),(223,NULL,2,223),(224,NULL,2,224),(225,NULL,2,225),(226,NULL,2,226),(227,NULL,2,227),(228,NULL,2,228),(229,NULL,2,229),(230,NULL,2,230),(231,NULL,2,231),(232,NULL,2,232),(233,NULL,2,233),(234,NULL,2,234),(235,NULL,2,235),(236,NULL,2,236),(237,NULL,2,237),(238,NULL,2,238),(239,NULL,2,239),(240,NULL,2,240),(241,NULL,2,241),(242,NULL,2,242),(243,NULL,2,243),(244,NULL,2,244),(245,NULL,2,245),(246,NULL,2,246),(247,NULL,2,247),(248,NULL,2,248),(249,NULL,2,249),(250,NULL,2,250),(251,NULL,2,251),(252,NULL,2,252),(253,NULL,2,253),(254,NULL,2,254),(255,NULL,2,255),(256,NULL,2,256),(257,NULL,2,257),(258,NULL,2,258),(259,NULL,2,259),(260,NULL,2,260),(261,NULL,2,261),(262,NULL,2,262),(263,NULL,2,263),(264,NULL,2,264),(265,NULL,2,265),(266,NULL,2,266),(267,NULL,2,267),(268,NULL,2,268),(269,NULL,2,269),(270,NULL,2,270),(271,NULL,2,271),(272,NULL,2,272),(273,NULL,2,273),(274,NULL,2,274),(275,NULL,2,275),(276,NULL,2,276),(277,NULL,2,277),(278,NULL,2,278),(279,NULL,2,279),(280,NULL,2,280),(281,NULL,2,281),(282,NULL,2,282),(283,NULL,2,283),(284,NULL,2,284),(285,NULL,2,285),(286,NULL,2,286),(287,NULL,2,287),(288,NULL,2,288),(289,NULL,2,289),(290,NULL,2,290),(291,NULL,2,291),(292,NULL,2,292),(293,NULL,2,293),(294,NULL,2,294),(295,NULL,2,295),(296,NULL,2,296),(297,NULL,2,297),(298,NULL,2,298),(299,NULL,2,299),(300,NULL,2,300),(301,NULL,2,301),(302,NULL,2,302),(303,NULL,2,303),(304,NULL,2,304),(305,NULL,2,305),(306,NULL,2,306),(307,NULL,2,307),(308,1,1,308),(309,1,1,309),(310,1,1,310),(311,1,1,311),(312,1,1,312),(313,1,1,313),(314,1,1,314),(315,1,1,315),(316,2,3,316),(317,2,3,317),(318,2,3,318),(319,2,3,319),(320,2,3,320),(321,2,3,321),(322,2,3,322),(323,2,3,323),(324,2,3,324),(325,2,3,325),(326,2,3,326),(327,2,3,327),(328,2,3,328),(329,2,3,329),(330,2,3,330),(331,2,3,331),(332,2,3,332),(333,2,3,333),(334,2,3,334),(335,2,3,335),(336,2,3,336),(337,2,3,337),(338,2,3,338),(339,2,3,339),(340,2,3,340),(341,2,3,341),(342,2,3,342),(343,2,3,343),(344,2,3,344),(345,2,3,345),(346,2,3,346),(347,2,3,347),(348,2,3,348),(349,2,3,349),(350,2,3,350),(351,2,3,351),(352,2,3,352),(353,2,3,353),(354,2,3,354),(355,2,3,355),(356,2,3,356),(357,2,3,357),(358,2,3,358),(359,2,3,359),(360,2,3,360),(361,2,3,361),(362,2,3,362),(363,2,3,363),(364,2,3,364),(365,2,3,365),(366,2,3,366),(367,2,3,367),(368,2,3,368),(369,2,3,369),(370,2,3,370),(371,2,3,371),(372,2,3,372),(373,2,3,373),(374,2,3,374),(375,2,3,375),(376,2,3,376),(377,2,3,377),(378,2,3,378),(379,2,3,379),(380,2,3,380),(381,2,3,381),(382,2,3,382),(383,2,3,383),(384,2,3,384),(385,2,3,385),(386,2,3,386),(387,2,3,387),(388,2,3,388),(389,2,3,389),(390,2,3,390),(391,2,3,391),(392,2,3,392),(393,2,3,393),(394,2,3,394),(395,2,3,395),(396,2,3,396),(397,2,3,397),(398,2,3,398),(399,2,3,399),(400,2,3,400),(401,2,3,401),(402,2,3,402),(403,2,3,403),(404,2,3,404),(405,2,3,405),(406,2,3,406),(407,2,3,407),(408,2,3,408),(409,2,3,409),(410,2,3,410),(411,2,3,411),(412,2,3,412),(413,2,3,413),(414,2,3,414),(415,2,3,415),(416,5,7,416),(417,5,7,417),(418,5,7,418),(419,5,7,419),(420,5,7,420),(421,5,7,421),(422,5,7,422),(423,5,7,423),(424,5,7,424),(425,5,7,425),(426,5,7,426),(427,5,7,427),(428,5,7,428),(429,5,7,429),(430,5,7,430),(431,5,7,431),(432,5,7,432),(433,5,7,433),(434,5,7,434),(435,5,7,435),(436,5,7,436),(437,6,88,437),(438,6,88,438),(439,6,88,439),(440,6,88,440);
/*!40000 ALTER TABLE `medicine_sequence_nos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_stock_register`
--

DROP TABLE IF EXISTS `medicine_stock_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicine_stock_register` (
  `medicine_stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `batch_no` varchar(40) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`medicine_stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_stock_register`
--

LOCK TABLES `medicine_stock_register` WRITE;
/*!40000 ALTER TABLE `medicine_stock_register` DISABLE KEYS */;
INSERT INTO `medicine_stock_register` VALUES (1,1,1,13,'92229','2019-04-01'),(2,1,2,1,'1175323','2020-08-01'),(3,1,3,2,'17056','2020-04-01'),(4,1,4,4,'1174606','2020-10-01'),(5,1,5,6,'2171218','2020-07-01'),(6,1,6,2,'692025','2019-06-01'),(7,1,7,2,'263610','2018-05-01'),(8,1,10,2,'1090','2021-03-01'),(9,1,9,2,'7902','2019-07-01'),(10,1,12,0,'6231','2018-06-01'),(11,1,16,0,'17232','2019-01-01'),(12,1,26,0,'7102','2018-12-01'),(13,1,25,0,'3162030','2018-11-01'),(14,1,23,1,'6016','2020-03-01'),(15,1,24,0,'2708','2019-05-01'),(16,1,11,2,'17063','2019-08-01'),(17,1,13,0,'1169141','2019-03-01'),(18,1,8,2,'670266','2020-07-01'),(19,1,14,0,'2417108','2019-02-01'),(20,1,17,2,'38006','2019-01-01'),(21,1,18,2,'1019','2019-08-01'),(22,1,20,1,'896','2019-10-01'),(23,1,19,3,'0088','2020-06-01'),(24,1,21,2,'1334061','2018-11-01'),(25,1,22,0,'1614','2018-09-01'),(26,1,27,0,'75206','2019-10-01'),(27,1,28,1,'2172683','2020-10-01'),(28,1,29,1,'74074','2019-08-01'),(34,3,2,0,'24234','2018-05-25'),(35,3,2,114,'423423','2018-10-25'),(36,3,2,70,'7654332','2018-08-23'),(37,3,2,0,'323','2018-05-25'),(38,3,2,1,'1212','2018-05-25'),(39,3,11,0,'2343','2018-05-25'),(40,3,1,1,'3234234','2018-05-25'),(41,3,3,0,'4646564','2018-06-21'),(42,3,3,60,'232323','2018-06-27'),(43,3,2,1,'34343','2018-05-28'),(44,3,14,0,'2342','2018-05-28'),(45,1,14,1,'123','2018-10-16'),(46,1,27,1,'456','2018-10-17'),(47,1,14,1,'123','2018-05-26'),(48,1,27,1,'456','2018-05-25'),(49,1,14,1,'1234','2018-05-16'),(50,1,27,1,'23424','2018-05-25'),(51,1,14,1,'121','2018-05-14'),(52,1,27,1,'232','2018-05-18'),(53,1,14,1,'2417108','2027-02-01'),(54,1,27,1,'123','2024-03-19'),(55,3,2,10,'456','2028-02-21'),(56,1,20,1,'1212','2022-11-15'),(57,3,2,3,'2323','2022-11-15'),(58,3,7,21,'545654','2018-07-21'),(59,1,22,1,'6543','2019-11-20'),(60,1,22,1,'5654','2019-06-05'),(61,1,27,0,'9450','2020-06-17'),(62,1,27,1,'0909','2021-06-02'),(63,1,3,0,'1212','2019-06-03'),(64,1,2,6,'423423','2018-10-25'),(65,3,88,0,'786786','2018-07-06'),(66,1,11,1,'1111','2019-06-02'),(67,1,2,2,'2222','2019-06-02');
/*!40000 ALTER TABLE `medicine_stock_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicines` (
  `med_id` bigint(19) NOT NULL AUTO_INCREMENT,
  `med_group_id` varchar(11) DEFAULT NULL,
  `med_category` varchar(200) DEFAULT NULL,
  `med_name` varchar(200) DEFAULT NULL,
  `med_brand` varchar(200) DEFAULT NULL,
  `med_combination` varchar(200) DEFAULT NULL,
  `med_allow_sale` varchar(10) DEFAULT 'y',
  `med_sale_units` varchar(200) DEFAULT NULL,
  `med_distributed_units` varchar(200) DEFAULT NULL,
  `med_tax` int(11) DEFAULT NULL,
  `med_status` tinyint(2) DEFAULT '1',
  `med_reorder` varchar(40) DEFAULT NULL,
  `med_code` varchar(50) DEFAULT NULL,
  `med_hsncode` varchar(30) DEFAULT NULL,
  `med_manufacturedby` varchar(100) DEFAULT NULL,
  `med_schedule` varchar(100) DEFAULT NULL,
  `med_purchasepack` varchar(100) DEFAULT NULL,
  `med_no_of_units` varchar(255) DEFAULT NULL,
  `med_boxpack` int(15) DEFAULT NULL,
  `med_rockno` int(15) DEFAULT NULL,
  PRIMARY KEY (`med_id`),
  KEY `med_idx` (`med_name`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (1,'3','antibiotics','D5 DEXTROSE INJ','infutec health care limited','dextrose','Yes','FLUID','FLUID',1,1,'3','6KA92282','30048945','gghggh','H','1','',1,0),(2,'3','antibiotics','DNS 500 ML','ACULIFE','SODIUM CHLORIDE','Yes','FLUID','FLUID',1,1,'5','1175','9018','appolo','H','1','',1,0),(3,'3','antibiotics','METRIS metronidazole','Claris Otsuka','metronidazole','Yes','FLUID','FLUID',1,1,'3','C270','3064','Dr.reddys','H','1','',1,0),(4,'3','antibiotics','RL 500 ML','Claris Otsuka','compound sodium lactate inj','Yes','FLUID','FLUID',1,1,'3','C169537','30045020','sun pharmacy','H','1','',1,0),(5,'3','FLUID','20 M','Claris Otsuka','MANNITOL INJ','Yes','FLUID','FLUID',1,1,'3','1050003286','30049099','Dr.reddys','','1','',1,0),(6,'3','antibiotics','CIPROKEM 100ML INJ','ALKEM','CIPROFLOXACIN INJ','Yes','FLUID','FLUID',1,1,'3','7001','30042033','ALKA PHARMACEUTICALS','','1','',1,0),(7,'3','antibiotics','25 D','Claris Otsuka','DEXTROSE INJ','Yes','FLUID','FLUID',1,1,'3','1050002683','30049099','sun pharmacy','H','1','',1,0),(8,'3','antibiotics','Emeset 2ml','Cipla','Ondansetron inj','Yes','Ampoule','Ampoule',1,1,'3','670266','30049097','cipla','H','1','',1,0),(9,'3','antibiotics','Diken 3 ml inj','SEMUNS','Diclofenac sodium inj','Yes','Ampoule','Ampoule',1,1,'3','7902','84331110','SEMUNS','H','1','',1,0),(10,'3','injection','Epsolin 2 ml','Zydus','phenytoin sodium inj','Yes','Ampoule','Ampoule',1,1,'3','1090','30049099','ZYDUS','H','1','',10,1),(11,'3','injection','Buscogast inj','sansofi','Hyoscine butylibromide inj','Yes','Ampoule','Ampoule',1,1,'3','01003917','3064','sansofi','','1','',1,3),(12,'3','injection','STEMIN INJ','Ind-Swift limited','Betamethasone sodium','Yes','Vial','Vial',1,1,'3','A16231','9018','Ind-Swift limited','','1','',1,0),(13,'3','Ivs','GLUCI IV','NEON LABORATORIES','CALCIUM GLUCONATE','Yes','Ampoule','Ampoule',1,1,'3','1169141','3068','NEON LABORATORIES','','1','',1,0),(14,'3','injection','AVIL INJ','sansofi','PHENIRAMINE MALEATE INJ','Yes','Ampoule','Ampoule',1,1,'3','HP 173025','3064','sansofi','','1','',1,0),(15,'3','injection','VASOCAN INJ','NEON LABORATORIES','ADERNALINE BITARTARATE INJ','Yes','Ampoule','Ampoule',1,1,'3','85221','9018','NEON LABORATORIES','','1','',1,2),(16,'3','INJECTION','DEXASONE','CADILA PHARMA','Dexamethasone sodium phosphate','Yes','Ampoule','Ampoule',1,1,'3','1389','6098','CADILA PHARMA','','1','',1,4),(17,'3','injection','TROPINE INJ','NEON LABORATORIES','ATROPINE SULPHATE INJ','Yes','Ampoule','Ampoule',1,1,'3','38006','3062','NEON LABORATORIES','','1','',1,0),(18,'3','injection','Deriphyllin  INJ','CADILA PHARMA','ETOFYLLINE THEOPHYLLINE','Yes','Ampoule','Ampoule',1,1,'3','BGS1019','6034','CADILA PHARMA','','1','',1,3),(19,'3','injection','Eptoin inj','abbott pharma','phenytoin sodium inj','Yes','Ampoule','Ampoule',1,1,'3','apc0088','6034','abbott pharma','','1','',1,4),(20,'3','injection','BETNASOL','GSK','Betamethasone sodium phosphate','Yes','Ampoule','Ampoule',1,1,'3','GR 768','6034','GSK','','1','',1,3),(21,'3','injection','DOMIN','NEON LABORATORIES','Sterile dopamine concentrate','Yes','Ampoule','Ampoule',1,1,'4','1334061','6034','NEON LABORATORIES','','1','',1,3),(22,'3','injection','Styptochrome inj','DR.Reddys','Estamsylate inj','Yes','Ampoule','Ampoule',1,1,'3','1614','6034','DR.Reddys','H','1','',10,3),(23,'3','injection','Hyocimax inj','Acme pharma','Hyoscine butylbromide inj','Yes','Ampoule','Ampoule',1,1,'3','HA6016','6034','Acme pharma','H','1','',1,0),(24,'3','injection','KENADION 1','SAMARTH LIFE SCIENCE PVT LTD','phytomenadione inj','Yes','Ampoule','Ampoule',1,1,'3','2708','3098','SAMARTH LIFE SCIENCE PVT LTD','H','1','',5,2),(25,'3','injection','FRUSIZEX INJ','ZEE LABORITIES','frusemide inj','Yes','Ampoule','Ampoule',1,1,'3','2038','9034','ZEE LABORITIES','','1','',1,4),(26,'3','injection','Tramosyn inj','senate laboratories','tramadol inj','Yes','Ampoule','Ampoule',1,1,'3','7102','9018','senate laboratories','H','1','',1,0),(27,'3','BUDECORT','BUDECORT 2ml','CIPLA','Budesonide nebuliser','Yes','Ampoule','Ampoule',1,1,'3','209206','6034','CIPLA','','1','',5,0),(28,'3','antibiotics','NS 500 ML','Otsuka pharmaceutical','SODIUM CHLORIDE','Yes','Ampoule','Ampoule',1,1,'3','2172683','30049099','sun pharmacy','H','1','',1,0),(29,'3','Inheller','duolin','Cipla','levosalbutamol and Ipratropium','Yes','Ampoule','Ampoule',1,1,'3','4074','9034','Cipla','','1','',1,0),(30,'3','injection','LIZOLID','GLENMARK','LINEZOLID','Yes','Bottle','Bottle',1,1,'3','934','9934','GLENMARK','H','1','',1,0),(31,'3','IP','OFLOKEM','AISHWARYA HEALTH CARE','OFLOXACIN IP','Yes','Bottle','Bottle',1,1,'3','34','9034','ALKEM','H','1','0',1,0),(32,'3','IP','TOPMOL','INFUTEC','PARACETOMAL','Yes','Bottle','Bottle',1,1,'3','43','9034','INFUTEC','H','1','0',1,0),(33,'3','IV','MOXIF IV','TORRENT','MOXIFLOXACIN','Yes','Bottle','Bottle',1,1,'3','343','9034','TORRENT','H','1','',1,0),(34,'3','IV','LEVOFLOX 500','CIPLA','LEVOFLOX 500','Yes','Bottle','Bottle',1,1,'3','453','9034','CIPLA','H','1','',1,0),(35,'3','INJECTION','STROPIN','UNICHEM','CEREBROPROTEIN','Yes','Ampoule','Ampoule',1,1,'3','545','9034','UNICHEM','H','1','',1,0),(36,'3','INJECTION','CEFBACT S','CIPLA','CEFTRIAXONE','Yes','Vial','Vial',1,1,'3','38','9038','CIPLA','H','1','0',1,0),(37,'3','INJECTION','CEZOSAL','NEON LABORATORIES','CEFOOERAZONE','Yes','Vial','Vial',1,1,'3','34','6034','NEON LABORATORIES','H','1','0',1,0),(38,'3','INJECTION','EMICEL','CELON','IMIPENEM & CILASTAIN','Yes','Vial','Vial',1,1,'3','343','6034','CELON','H','1','0',1,0),(39,'3','INJECTION','UNITAZ P','U LABS','PI[ERACILLIAN & TAZOBZCTAM','Yes','Vial','Vial',1,1,'3','364','9038','U LABS','H','1','0',1,0),(40,'3','INJECTION','SULBACEF','BIOCHEM','SULBACTAM AND CEFOPERAZONE','Yes','Vial','Vial',1,1,'3','34','6034','BIOCHEM','','1','0',1,0),(41,'3','INJECTION','FALCIGO','ZYDUS CADILA','ARTESUNATE INJ','Yes','Vial','Vial',1,1,'3','000','000','ZYDUS CADILA','','0','0',0,0),(42,'3','INJECTION','TAZOPEN','BIOCHEM','PIPERACILLIN AND TAZOBACTAM','Yes','Vial','Vial',1,1,'3','000','000','BIOCHEM','H','0','0',0,0),(43,'3','INJECTION','CORT S','NEON','HYDROCORTISONE','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(44,'3','INJECTION','PRIMACORT 100','MACLEODS PHARMA','HYDROCORTISONE','Yes','Vial','Vial',1,1,'3','000','000','MACLEODS PHARMA','H','0','0',0,0),(45,'3','INJECTION','AMIBIOTIC','NEON','AMIKACIN','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(46,'3','INJECTION','PANTOCAF IV','KNOLL HEALTH CARE','PANTOPRAZOLE','Yes','Vial','Vial',1,1,'3','000','000','KNOLL HEALTH CARE','H','0','0',0,0),(47,'3','INJECTION','CEFBACT-S','CIPLA','CEFTRIAXONE','Yes','Vial','Vial',1,1,'3','000','000','CIPLA','H','0','0',0,0),(48,'3','INJECTION','LOX 2%','NEON LABORATORIES','LINOCAINE HYDROCHLORIDE','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(49,'3','INJECTION','ANAWIN','NEON LABORATORIES','BUPIVACAINE','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(50,'3','INJECTION','COGNISTAR 60','LUPIN LTD','CEREBROPROTEIN','Yes','Vial','Vial',1,1,'3','000','000','LUIPIN LTD','H','0','0',0,0),(51,'3','INJECTION','MEDZOL','THEMIS MEDICARE','MIDAZOLAM','Yes','Vial','Vial',1,1,'3','000','000','THEMIS MEDICARE','H','0','0',0,0),(52,'3','INJECTION','LABLOL','NEON LABORATORIES','LABETALOL','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(53,'3','INJECTION','MUCOMIX','SAMARTH LIFE SCIENCE PVT LTD','ACETYLCYSTEINE','Yes','Ampoule','Ampoule',1,1,'3','000','000','SAMARTH','H','0','0',0,0),(54,'3','INJECTION','PROTAMINE SULPHATE','GLAND PHARMA','NEUTRA HEP','Yes','Ampoule','Ampoule',1,1,'3','000','000','GLAND PHARMA','H','0','0',0,0),(55,'3','INJECTION','LASIX','SANOFI INDIA LTD','frusemide inj','Yes','Ampoule','Ampoule',1,1,'3','000','000','SANOFI','H','0','0',0,0),(56,'3','INJECTION','SODIUM BICARBONATE','RATHI LAB','SODIUM BICARBONATE','Yes','Ampoule','Ampoule',1,1,'3','000','000','HINDUSTAN PVT LTD','H','0','0',0,0),(57,'3','INJECTION','TRANEXAMIC ACID','EMCURE PHARMA I','PAUSE INJ','Yes','Ampoule','Ampoule',1,1,'3','000','000','EMCURE PHARMA','H','0','0',0,0),(58,'3','INJECTION','DIGOXIN INJ','SAMARTH LIFE','DIXIN','Yes','Ampoule','Ampoule',1,1,'3','000','000','SAMARTH LIFE','H','0','0',0,0),(59,'3','injection','NORAD','NEON LABORATORIES','STERILE NORAD','Yes','Ampoule','Ampoule',1,1,'3','000','000','NEON','H','0','0',0,0),(60,'3','injection','RANTIDINE HYDROCHOLORIDE','LUPIN LTD','HELKOSS','Yes','Ampoule','Ampoule',1,1,'3','000','000','LUPIN LTD','H','0','0',0,0),(61,'3','INJECTION','PHENIRAMINE MALEATE','ZEE LABORITIES','PHENIRAMINE MALEATE INJ','Yes','Ampoule','Ampoule',1,1,'3','000','000','ZEE LABORATORIES','H','0','0',0,0),(62,'3','injection','DICLOFINAC','SEMUNS','DIKIEN','Yes','Ampoule','Ampoule',1,1,'3','000','000','SEMUNS','H','0','0',0,0),(63,'3','injection','GLYCOPYRROLATE INJ','CELON LABS','PYROLIN','Yes','Ampoule','Ampoule',1,1,'3','000','000','CELON LABS','H','0','0',0,0),(64,'3','INJECTION','ONDENSETRON / ZOFER','Cipla','EMESET','Yes','Ampoule','Ampoule',1,1,'3','000','000','CIPLA','H','0','0',0,0),(65,'3','injection','DIAZEPAM INJ','NEON LABORATORIES','LORI DIAZEPAM','Yes','Ampoule','Ampoule',1,1,'3','000','000','NEON','H','0','0',0,0),(66,'3','injection','EPTION','abbott pharma','phenytoin sodium inj','Yes','Ampoule','Ampoule',1,1,'3','000','000','ABBOTT PHARMA','H','0','0',0,0),(67,'3','injection','TRAMADOL INJ','SYNCOM PHARMA','TRAMOSYN','Yes','Ampoule','Ampoule',1,1,'3','000','000','SYNCON PHARMA','H','0','0',0,0),(68,'3','injection','BUSCOPAN','ZEE LABORITIES','Hyoscine butylibromide inj','Yes','Ampoule','Ampoule',1,1,'3','000','000','ZEE LABORITIES','H','0','0',0,0),(69,'3','injection','DERIPHYLLIN INJ','GERMAN REMEDIES','ETOFYLLINE AND THEOPHYLLINE ON','Yes','Ampoule','Ampoule',1,1,'3','000','000','GERMEN REMEDIES','H','0','0',0,0),(70,'3','injection','FEVASTIN','TABLETS INDIA','PARACETOMAL AND LINOCAINE','Yes','Ampoule','Ampoule',1,1,'3','000','000','TABLETS INDIA PVT LTD','H','0','0',0,0),(71,'3','injection','CATHFLUSH INJ','TROIKAA PHARMA','HEPARIN SOLUCTION','Yes','Ampoule','Ampoule',1,1,'3','000','000','TROIKAA PHARMA','H','0','0',0,0),(72,'3','injection','ADRENALINE','NEON LABORATORIES','VASOCON INJ','Yes','Ampoule','Ampoule',1,1,'3','000','000','NEON','H','0','0',0,0),(73,'3','injection','BETNESOL','GLAXO SMITHKLINE LTD','Betamethasone sodium','Yes','Ampoule','Ampoule',1,1,'3','000','000','GLAXO SMITHKLINE LTD','H','0','0',0,0),(74,'3','injection','VITAMIN K','SAMARTH LIFE','KENADION K','Yes','Ampoule','Ampoule',1,1,'3','000','000','SAMARTH LIFE','H','0','0',0,0),(75,'3','injection','ATROPINE','NEON LABORATORIES','ATROPINE SULPHATE INJ','Yes','Ampoule','Ampoule',1,1,'3','000','000','NEON','H','0','0',0,0),(76,'3','TABLETS','NITROCONTIN 2.6','MODI MUNDIPHARMA','CONTROLLED','Yes','Capsule','Capsule',1,1,'3','000','000','MODI MUNDIPHARMA PVT LTD','H','0','0',0,0),(77,'3','MASK','ADULT OXYGEN MASK','VINJOH HEALTH CARE','ADULT OXYGEN MASK','Yes','Nos','Nos',1,1,'3','000','000','VINJOH HEALTH CARE','H','0','0',0,0),(78,'3','KIT','OXYGEN RECOVERY KIT','LAKSHMI LIFE SCIENCES LTD','OXYGEN RECOVERY KIT','No','Nos','Nos',1,1,'3','000','000','LAKSHMI LIFE SCIENCE LTD','H','0','0',0,0),(79,'3','KIT','RAILES TUBE 12 SIZE','RAMSONS','RAILES TUBE 12 SIZE','No','Nos','Nos',1,1,'3','000','000','RAMSONS','H','0','0',0,0),(80,'3','KIT','RAILES TUBE 10 SIZE','RAMSONS','RAILES TUBE 10 SIZE','Yes','Nos','Nos',1,1,'3','000','000','RAMSONS','','0','0',0,0),(81,'3','KIT','ADULT OXYGEN KIT SMALL SIZE','VINJOH HEALTH CARE','ADULT OXYGEN KIT SMALL SIZE','Yes','Nos','Nos',1,1,'3','000','000','VINJOH HEALTH CARE','H','0','0',0,0),(82,'3','MASK','NEBULIZER MASK KIT','VINJOH HEALTH CARE','NEBULIZER MASK','Yes','Nos','Nos',1,1,'3','000','000','VINJOH HEALTH CARE','H','0','0',0,0),(83,'3','KIT','BURET SETS','ROMSONS','BURET SET','Yes','Nos','Nos',1,1,'2','000','000','ROMSONS','H','0','0',0,0),(84,'3','SYRINGE','50 CC SYRINGE','DISPO VAN','50 CC SYRIGNE','Yes','Nos','Nos',1,1,'2','000','000','DISPO VAN','H','0','0',0,0),(85,'3','KIT','PM-O-LINE','ROMSONS','PM-O-LINE','Yes','Nos','Nos',1,1,'2','000','000','ROMSONS','H','0','0',0,0),(86,'3','KIT','C V P LINE','ARROW','C V P LINE','Yes','Nos','Nos',1,1,'2','000','000','ARROW','H','0','0',0,0),(87,'3','KIT','VENTILATOR TUBES','BAIN COAXIAL CIRCUIT','VENTILATOR TUBES','Yes','Nos','Nos',1,1,'1','000','000','BAIN COAXIAL CIRCUIT','H','0','0',0,0),(88,'3','KIT','NASUAL CANNULA','RAMSONS','NASUL CANNULA','Yes','Nos','Nos',1,1,'1','000','000','RAMSONS','H','1','0',1,0);
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines_podata`
--

DROP TABLE IF EXISTS `medicines_podata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicines_podata` (
  `mpo_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mpo_item_id` int(11) DEFAULT NULL,
  `mpo_units` varchar(50) DEFAULT NULL,
  `mpo_qty` int(11) DEFAULT NULL,
  `mpo_bonus` int(11) DEFAULT NULL,
  `mpo_mrp` double(16,4) DEFAULT NULL,
  `mpo_pp` double(16,4) DEFAULT NULL,
  `medicine_po_id` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `mpo_qty_received` int(11) DEFAULT '0',
  PRIMARY KEY (`mpo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines_podata`
--

LOCK TABLES `medicines_podata` WRITE;
/*!40000 ALTER TABLE `medicines_podata` DISABLE KEYS */;
INSERT INTO `medicines_podata` VALUES (1,1,NULL,8,NULL,10.0000,9.0000,1,1,8),(2,3,NULL,100,NULL,10.0000,9.0000,2,1,100),(3,20,NULL,23,NULL,23.0000,23.0000,3,1,0),(4,23,NULL,23,NULL,26.0000,26.0000,3,1,0),(5,26,NULL,20,NULL,45.0000,45.0000,4,1,0),(6,7,NULL,20,NULL,20.0000,18.0000,5,1,20),(7,88,NULL,4,NULL,20.0000,15.0000,6,1,4);
/*!40000 ALTER TABLE `medicines_podata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines_pos`
--

DROP TABLE IF EXISTS `medicines_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicines_pos` (
  `medicinepo_id` int(11) NOT NULL AUTO_INCREMENT,
  `medicinepo_date` date DEFAULT NULL,
  `medicinepo_supplier_id` int(11) DEFAULT NULL,
  `medicinepo_status` varchar(60) DEFAULT 'Issued',
  `medicinepo_authorised_by` int(1) DEFAULT NULL,
  `medicinepo_price` double(16,4) DEFAULT NULL,
  `medicinepo_net_price` double(16,4) DEFAULT NULL,
  `medicinepo_discount` int(11) DEFAULT NULL,
  PRIMARY KEY (`medicinepo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines_pos`
--

LOCK TABLES `medicines_pos` WRITE;
/*!40000 ALTER TABLE `medicines_pos` DISABLE KEYS */;
INSERT INTO `medicines_pos` VALUES (1,'2018-05-25',1,'Received',1,72.0000,84.9600,0),(2,'2018-05-27',2,'Received',1,900.0000,1062.0000,0),(3,'2018-05-27',9,'Issued',1,1127.0000,1303.2628,2),(4,'2018-05-27',5,'Issued',1,900.0000,1062.0000,0),(5,'2018-06-02',1,'Received',1,360.0000,424.8000,0),(6,'2018-06-02',1,'Received',1,60.0000,70.8000,0);
/*!40000 ALTER TABLE `medicines_pos` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Masters',1,'fa fa-th-list','Users',1,'team.png','#users','/users','users.html','users_ctrl',1,0),(51,'Masters',1,'fa fa-th-list','Organization',5,'hospital2.png','#organization','/organization','hospitals.html','hospitals_ctrl',8,0),(52,'Masters',1,'fa fa-th-list','Specialities',2,'medicine.png','#specialities','/specialities','specialities.html','specialities_ctrl',8,0),(53,'Masters',1,'fa fa-th-list','Facilities',4,'patient.png','#facilities','/facilities','facilities.html','facilities_ctrl',8,0),(54,'Masters',1,'fa fa-th-list','Facilities Group',3,'hospital-bed.png','#facilitiesgroup','/facilitiesgroup','facilitiesgroup.html','facilitiesgroup_ctrl',8,0),(57,'Inventory',2,'stock.png','Units',1,'scale.png','#inventoryunits','/inventoryunits','inventoryunits.html','inventoryunits_ctrl',8,0),(58,'Masters',1,'fa fa-th-list','Locations',6,'placeholder.png','#locations','/locations','locations.html','locations_ctrl',8,0),(60,'Dashboard',0,'fa fa-th-list','Dashboard',1,'fa fa-angle-right','#dashboard','/dashboard','dashboard.html','dashboard_ctrl',1,1),(62,'Labs',4,'021-test-tubes.png','Lab Tests',1,'046-medical-history.png','#labtests','/labtests','labtests.html','labtests_ctrl',8,0),(64,'Masters',1,'fa fa-th-list','Referrals',9,'082-ambulance-1.png','#referrals','/referrals','referrals.html','referrals_ctrl',8,0),(66,'Masters',1,'fa fa-th-list','Beds',10,'084-hospital-bed.png','#beds','/beds','beds.html','beds_ctrl',8,0),(67,'Inventory',2,'fa fa-th-list','Asset Inward',7,'asset_inward.png','#inward','/inward','inward.html','inward_ctrl',8,0),(72,'Patient',3,'patient1.png','New Patient',1,'patient.png','#newpaitent','/newpaitent','newpaitent.html','newpaitent_ctrl',8,0),(74,'Inventory',2,'fa fa-th-list','Stores',3,'store.png','#stores','/stores','stores.html','stores_ctrl',8,0),(77,'Inventory',2,'fa fa-th-list','Supplier',2,'supplier.png','#supplier','/supplier','supplier.html','supplier_ctrl',8,0),(78,'Inventory',2,'fa fa-th-list','Inventory Group',4,'inventory.png','#itemgroup','/itemgroup','itemgroup.html','itemgroup_ctrl',8,0),(79,'Inventory',2,'fa fa-th-list','Assets',5,'assets.png','#assets','/assets','assets.html','assets_ctrl',8,0),(80,'Inventory',2,'fa fa-th-list','Medicines',10,'medicine-7.png','#medicines','/medicines','medicines.html','medicines_ctrl',8,0),(82,'Inventory',2,'fa fa-th-list','Assets PO',6,'asset_purchaseorder.png','#assetspo','/assetspo','assetspo.html','assetspo_ctrl',8,0),(84,'Inventory',2,'fa fa-th-list','Asset Outward',8,'asset_outward.png','#assetoutward','/assetoutward','assetoutward.html','assetoutward_ctrl',8,0),(85,'Inventory',2,'fa fa-th-list','Asset Stock',9,'stock2.png','#assetstock','/assetstock','assetstock.html','assetstock_ctrl',8,0),(86,'Inventory',2,'fa fa-th-list','Medicine POS',11,'medical_po.png','#medicinepos','/medicinepos','medicinepos.html','medicinepos_ctrl',8,0),(87,'Inventory',2,'fa fa-th-list','Medicine Inward',12,'medical_inward.png','#medicineinward','/medicineinward','medicineinward.html','medicineinward_ctrl',8,0),(90,'Inventory',2,'fa fa-th-list','Medicine Stock',13,'stock.png','#medicinestock','/medicinestock','medicinestock.html','medicinestock_ctrl',8,0),(91,'Patient',3,'fa fa-th-list','Consultation Charges',2,'doctor_red.png','#doctorconsultation','/doctorconsultation','doctorconsultation.html','doctorconsultation_ctrl',8,0),(92,'Patient',3,'fa fa-th-list','In Patient',3,'fa fa-angle-right','#inpatient','/inpatient','inpatient.html','inpatient_ctrl',8,1),(95,'Finance',5,'finance.png','Collection',1,'income.png','#collection','/collection','collection.html','collection_ctrl',8,0),(96,'Finance',5,'fa fa-th-list','DCR',2,'daily_cash.png','#dailycashregister','/dailycashregister','dailycashregister.html','dailycashregister_ctrl',8,0),(97,'Finance',5,'fa fa-th-list','Cancel Receipt',3,'cancel.png','#cancelreceipt','/cancelreceipt','cancelreceipt.html','cancelreceipt_ctrl',8,0),(98,'Finance',5,'fa fa-th-list','Collection Info',4,'doctor_collection.png','#doctorcollection','/doctorcollection','doctorcollection.html','doctorcollection_ctrl',8,0),(99,'Labs',4,'fa fa-th-list','Lab Pricing',13,'lab_price.png','#testpricing','/testpricing','testpricing.html','testpricing_ctrl',8,0),(100,'Masters',1,'fa fa-th-list','Expenditure',11,'expan.png','#expenditure','/expenditure','expenditure.html','expenditure_ctrl',8,0),(101,'Masters',1,'fa fa-th-list','Scheme',12,'scheme.png','#scheme','/scheme','scheme.html','scheme_ctrl',8,0),(103,'Finance',5,'fa fa-th-list','Payments',13,'payments.png','#payment','/payment','payment.html','payment_ctrl',8,0),(104,'Patient',3,'fa fa-th-list','Case Sheet',5,'case_sheet.png','#casesheet','/casesheet','casesheet.html','casesheet_ctrl',8,0),(105,'Labs',4,'fa fa-th-list','Lab Results',14,'lab_result.png','#labresults','/labresults','labresults.html','labresults_ctrl',8,0),(106,'Finance',5,'fa fa-th-list','Pharmacy Account',14,'pharmacy.png','#pharmacyaccount','/pharmacyaccount','pharmacyaccount.html','pharmacyaccount_ctrl',8,0),(107,'Finance',5,'fa fa-th-list','Pharmacy Billing',15,'Pharmacy_bill.png','#pharmacybilling','/pharmacybilling','pharmacybilling.html','pharmacybilling_ctrl',8,0),(108,'Inventory',2,'fa fa-th-list','Medicine Outward',14,'medicine_out.png','#medicineoutward','/medicineoutward','medicineoutward.html','medicineoutward_ctrl',8,0),(109,'Masters',1,'fa fa-th-list','Staff',13,'staff.png','#staff','/staff','staff.html','staff_ctrl',8,0),(110,'Inventory',2,'fa fa-th-list','Direct Purchase',15,'direct_purchase.png','#directpurchase','/directpurchase','directpurchase.html','directpurchase_ctrl',8,0),(111,'Patient',3,'fa fa-th-list','Appointment',2,'agenda.png','#appointment','/appointment','appointment.html','appointment_ctrl',8,0),(112,'Patient',3,'fa fa-th-list','Casualty Medicine',6,'pill.png','#casualtymedicine','/casualtymedicine','casualtymedicine.html','casualtymedicine_ctrl',8,0),(113,'Finance ',5,'fa fa-th-list','Information Sheet',16,'fa fa-angle-right','#informationsheet','/informationsheet','informationsheet.html','informationsheet_ctrl',8,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_bills`
--

DROP TABLE IF EXISTS `patient_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_bills` (
  `patient_bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `p_visit_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `total_package` double DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  PRIMARY KEY (`patient_bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_bills`
--

LOCK TABLES `patient_bills` WRITE;
/*!40000 ALTER TABLE `patient_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_consultation`
--

DROP TABLE IF EXISTS `patient_consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_consultation` (
  `p_consult_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `p_visit_id` int(11) DEFAULT NULL,
  `dr_id` int(11) DEFAULT NULL,
  `visit_type` varchar(50) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `dr_consult_id` int(11) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `isCasualty` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`p_consult_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_consultation`
--

LOCK TABLES `patient_consultation` WRITE;
/*!40000 ALTER TABLE `patient_consultation` DISABLE KEYS */;
INSERT INTO `patient_consultation` VALUES (1,1,1,16,'1','2018-05-29 11:11:09',200,1,'A positive TB skin test or TB blood test only tells that a person has been infected with TB bacteria. It does not tell whether the person has latent TB infection (LTBI) or has progressed to TB disease.',NULL),(3,3,3,20,'1','2018-05-29 11:42:13',300,5,'Skin Rashes.',NULL),(4,2,4,19,'1','2018-05-29 18:43:26',200,3,'Normal Check Up',NULL),(5,4,5,26,'1','2018-05-30 05:04:27',300,7,'fever',NULL),(6,5,6,16,'1','2018-05-30 07:02:15',1000,22,'operation for appendicitis',NULL),(7,6,7,20,'1','2018-05-30 08:10:40',300,5,'Normal CheckUp',NULL),(8,7,8,20,'1','2018-05-30 08:16:48',300,5,'Normal Check Up',NULL),(9,8,9,19,'1','2018-05-30 09:00:25',200,3,'test',NULL),(10,9,10,20,'1','2018-05-30 11:35:27',300,5,'fever',NULL),(11,10,11,16,'1','2018-05-31 11:30:01',200,1,'fever',NULL),(12,11,12,16,'1','2018-05-01 12:14:17',200,1,'Medical checkup',NULL),(13,12,13,16,'1','2018-05-31 17:18:19',1000,22,'stomach pain',NULL),(14,7,14,19,'1','2018-05-31 17:46:13',200,3,'Normal',NULL),(15,13,15,20,'1','2018-05-31 19:29:24',300,5,'test',NULL),(16,14,16,19,'1','2018-06-01 10:12:55',200,3,'noramal checkup',NULL),(17,15,17,16,'1','2018-06-02 12:45:44',1000,22,'Sun Stroke',NULL);
/*!40000 ALTER TABLE `patient_consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_info`
--

DROP TABLE IF EXISTS `patient_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_info` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_code` varchar(30) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `father_name` varchar(60) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `house_no` varchar(30) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `loc` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `mobile` bigint(14) DEFAULT NULL,
  `aadhar_no` bigint(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `patient_status` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_info`
--

LOCK TABLES `patient_info` WRITE;
/*!40000 ALTER TABLE `patient_info` DISABLE KEYS */;
INSERT INTO `patient_info` VALUES (1,NULL,'Ravana','Vibishan',NULL,24,'M',NULL,NULL,NULL,'Lanka',NULL,NULL,NULL,9889089090,NULL,NULL,1),(2,NULL,'Prakash Raj','Appa Rao',NULL,40,'M',NULL,NULL,NULL,'Hyderabad',NULL,NULL,NULL,7872347234,NULL,NULL,1),(3,NULL,'Mahesh','Pandu',NULL,24,'M',NULL,NULL,NULL,'Kakinada',NULL,NULL,NULL,9234923940,NULL,NULL,1),(4,NULL,'ramu','rao',NULL,32,'M',NULL,NULL,NULL,'rajamundry',NULL,NULL,NULL,8792342442,NULL,NULL,1),(5,NULL,'rani','ramu',NULL,19,'F',NULL,NULL,NULL,'kakinada',NULL,NULL,NULL,8953434224,NULL,NULL,1),(6,NULL,'Shailendra','Prem Singh',NULL,22,'M',NULL,NULL,NULL,'Kkd',NULL,NULL,NULL,3453453453,NULL,NULL,1),(7,NULL,'Bhanu','Rakash',NULL,26,'M',NULL,NULL,NULL,'Kakinada',NULL,NULL,NULL,7734523234,NULL,NULL,1),(8,NULL,'pandu','ram',NULL,34,'M',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,3463456784,NULL,NULL,1),(9,NULL,'kiran ','murthy',NULL,28,'M',NULL,NULL,NULL,'rajamundry',NULL,NULL,NULL,7895564566,NULL,NULL,1),(10,NULL,'rahul','varma',NULL,29,'M',NULL,NULL,NULL,'kakinada',NULL,NULL,NULL,9567432345,NULL,NULL,1),(11,NULL,'Sri Ram','Kumar',NULL,24,'M',NULL,NULL,NULL,'Kakinada',NULL,NULL,NULL,8987877878,NULL,NULL,1),(12,NULL,'K.M.K.Murthy','K.M.K.Rao',NULL,45,'M',NULL,NULL,NULL,'rajamundry',NULL,NULL,NULL,8765565445,NULL,NULL,1),(13,NULL,'kamal','raja',NULL,34,'M',NULL,NULL,NULL,'mathura',NULL,NULL,NULL,4565342342,NULL,NULL,1),(14,NULL,'radha','prajapati',NULL,45,'F',NULL,NULL,NULL,'guntur',NULL,NULL,NULL,7654356346,NULL,NULL,1),(15,NULL,'Syam','Kumar',NULL,24,'M',NULL,NULL,NULL,'Kakinada',NULL,NULL,NULL,9008909089,NULL,NULL,1);
/*!40000 ALTER TABLE `patient_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_room_allocation`
--

DROP TABLE IF EXISTS `patient_room_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_room_allocation` (
  `patient_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `p_room_locname` varchar(20) DEFAULT NULL,
  `p_room_bed_id` int(11) DEFAULT NULL,
  `p_room_doctor` varchar(40) DEFAULT NULL,
  `p_room_date` datetime DEFAULT NULL,
  `p_block_name` varchar(30) DEFAULT NULL,
  `p_room_status` tinyint(4) DEFAULT '1',
  `p_room_visit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_room_allocation`
--

LOCK TABLES `patient_room_allocation` WRITE;
/*!40000 ALTER TABLE `patient_room_allocation` DISABLE KEYS */;
INSERT INTO `patient_room_allocation` VALUES (1,14,'Ward-1',2,'10','2018-03-17 15:26:45','1st Floor',1,0),(2,14,'general',10,'7','2018-03-19 19:51:57','4th Floor',1,0),(3,5,'Room-5',7,'9','2018-03-19 19:53:42','2nd Floor',1,0),(4,15,'surgeory',11,'7','2018-03-19 20:00:15','5th Floor',1,0),(5,13,'Ward-3',8,'6','2018-03-19 20:03:55','2nd Floor',1,48);
/*!40000 ALTER TABLE `patient_room_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_services`
--

DROP TABLE IF EXISTS `patient_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_services` (
  `p_sevice_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `p_service_fcid` int(11) DEFAULT NULL,
  `p_service_fcgid` int(11) DEFAULT NULL,
  `p_visit_id` int(11) DEFAULT NULL,
  `amount` double(16,4) DEFAULT NULL,
  PRIMARY KEY (`p_sevice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_services`
--

LOCK TABLES `patient_services` WRITE;
/*!40000 ALTER TABLE `patient_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_transactions`
--

DROP TABLE IF EXISTS `patient_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `bcid` int(10) DEFAULT NULL,
  `purpose_of_payment` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `receipt_no` bigint(20) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `p_visit_id` int(11) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  `receipt_status` tinyint(1) DEFAULT '0',
  `cancelled_user_id` int(11) DEFAULT NULL,
  `cancelled_time` datetime DEFAULT NULL,
  `receipt_code` varchar(30) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `financial_year` varchar(10) DEFAULT NULL,
  `patient_name` varchar(60) DEFAULT NULL,
  `fcid` int(11) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_transactions`
--

LOCK TABLES `patient_transactions` WRITE;
/*!40000 ALTER TABLE `patient_transactions` DISABLE KEYS */;
INSERT INTO `patient_transactions` VALUES (1,1,1,'OP Consultation',200,'Cash','2018-05-29 11:14:02','2018-05-29',1,1,16,1,NULL,0,NULL,NULL,'BRM/18-19/1',1,'18-19',NULL,1),(3,3,1,'OP Consultation',300,'Cash','2018-05-29 11:43:15','2018-05-29',1,3,20,3,NULL,0,NULL,NULL,'BRM/18-19/3',1,'18-19',NULL,1),(4,3,2,'Advance',5000,'Cash','2018-05-29 11:45:04','1970-01-01',1,4,20,3,'',0,NULL,NULL,'BRM/18-19/4',1,'18-19',NULL,NULL),(5,2,1,'OP Consultation',200,'Cash','2018-05-29 18:44:15','2018-05-29',1,5,19,4,NULL,0,NULL,NULL,'BRM/18-19/5',1,'18-19',NULL,1),(6,4,1,'OP Consultation',300,'Cash','2018-05-30 05:05:19','2018-05-30',1,6,26,5,NULL,0,NULL,NULL,'BRM/18-19/6',1,'18-19',NULL,1),(7,5,1,'OP Consultation',1000,'Cash','2018-05-30 07:03:39','2018-05-30',1,7,16,6,NULL,0,NULL,NULL,'BRM/18-19/7',1,'18-19',NULL,4),(8,6,1,'OP Consultation',300,'Cash','2018-05-30 08:11:41','2018-05-30',1,8,20,7,NULL,0,NULL,NULL,'BRM/18-19/8',1,'18-19',NULL,1),(9,7,1,'OP Consultation',300,'Cash','2018-05-30 08:18:19','2018-05-30',1,9,20,8,NULL,0,NULL,NULL,'BRM/18-19/9',1,'18-19',NULL,1),(10,8,1,'OP Consultation',200,'Cash','2018-05-30 09:01:07','2018-05-30',1,10,19,9,NULL,0,NULL,NULL,'BRM/18-19/10',1,'18-19',NULL,1),(11,9,1,'OP Consultation',300,'Cash','2018-05-30 11:36:35','2018-05-30',1,11,20,10,NULL,0,NULL,NULL,'BRM/18-19/11',1,'18-19',NULL,1),(12,6,4,'PHARMACY',4,'Cash','2018-05-31 09:00:17','1970-01-01',1,12,20,7,'',0,NULL,NULL,'BRM/18-19/12',1,'18-19',NULL,NULL),(13,6,4,'PHARMACY',120,'Cash','2018-05-31 09:02:29','1970-01-01',1,13,20,7,'',0,NULL,NULL,'BRM/18-19/13',1,'18-19',NULL,NULL),(14,1,2,'Advance',2000,'Cash','2018-05-31 10:00:58','2018-05-31',1,14,16,1,'',0,NULL,NULL,'BRM/18-19/14',1,'18-19',NULL,NULL),(15,1,2,'Advance',1000,'Cash','2018-05-31 10:04:03','2018-05-31',1,15,16,1,'',0,NULL,NULL,'BRM/18-19/15',1,'18-19',NULL,NULL),(16,1,3,'LABS',50,'Cash','2018-05-31 11:23:45','2018-05-31',1,16,16,1,'',0,NULL,NULL,'BRM/18-19/16',1,'18-19',NULL,NULL),(17,1,3,'LABS',50,'Cash','2018-05-31 11:26:27','2018-05-31',1,17,16,1,'',0,NULL,NULL,'BRM/18-19/17',1,'18-19',NULL,NULL),(18,10,1,'OP Consultation',200,'Cash','2018-05-31 11:30:46','2018-05-31',1,18,16,11,NULL,0,NULL,NULL,'BRM/18-19/18',1,'18-19',NULL,1),(19,10,3,'LABS',50,'Cash','2018-05-31 11:34:12','1970-01-01',1,19,16,11,'',0,NULL,NULL,'BRM/18-19/19',1,'18-19',NULL,NULL),(20,11,1,'OP Consultation',200,'Cash','2018-05-31 12:22:11','2018-05-01',1,20,16,12,NULL,0,NULL,NULL,'BRM/18-19/20',1,'18-19',NULL,1),(21,11,2,'Advance',5000,'Cash','2018-05-31 12:29:01','2018-05-31',1,21,16,12,'',1,1,'2018-05-31 12:30:48','BRM/18-19/21',1,'18-19',NULL,NULL),(22,11,2,'Advance',5000,'Cash','2018-05-31 12:32:26','2018-05-01',1,22,16,12,'',0,NULL,NULL,'BRM/18-19/22',1,'18-19',NULL,NULL),(23,12,1,'OP Consultation',1000,'Cash','2018-05-31 17:20:20','2018-05-31',1,23,16,13,NULL,0,NULL,NULL,'BRM/18-19/23',1,'18-19',NULL,4),(24,7,1,'OP Consultation',200,'Cash','2018-05-31 17:48:51','2018-05-31',1,24,19,14,NULL,0,NULL,NULL,'BRM/18-19/24',1,'18-19',NULL,1),(25,13,1,'OP Consultation',300,'Cash','2018-05-31 19:30:01','2018-05-31',1,25,20,15,NULL,0,NULL,NULL,'BRM/18-19/25',1,'18-19',NULL,1),(26,13,4,'PHARMACY',5,'Cash','2018-05-31 19:36:44','1970-01-01',1,26,20,15,'',0,NULL,NULL,'BRM/18-19/26',1,'18-19',NULL,NULL),(27,13,4,'PHARMACY',12,'Cash','2018-05-31 19:50:04','1970-01-01',1,27,20,15,'',0,NULL,NULL,'BRM/18-19/27',1,'18-19',NULL,NULL),(28,14,1,'OP Consultation',200,'Cash','2018-06-01 10:14:05','2018-06-01',1,28,19,16,NULL,0,NULL,NULL,'BRM/18-19/28',1,'18-19',NULL,1),(29,14,4,'PHARMACY',11,'Cash','2018-06-01 10:15:20','2018-01-06',1,29,19,16,'',0,NULL,NULL,'BRM/18-19/29',1,'18-19',NULL,NULL),(30,14,4,'PHARMACY',6,'Cash','2018-06-01 10:18:03','2018-01-06',1,30,19,16,'',0,NULL,NULL,'BRM/18-19/30',1,'18-19',NULL,NULL),(31,1,4,'PHARMACY',50,'Cash','2018-06-01 11:29:50','2018-01-06',1,31,16,1,'',1,1,'2018-06-01 12:42:00','BRM/18-19/31',1,'18-19',NULL,NULL),(32,14,4,'PHARMACY',11,'Cash','2018-06-01 12:45:45','2018-01-06',1,32,19,16,'',0,NULL,NULL,'BRM/18-19/32',1,'18-19',NULL,NULL),(33,3,4,'PHARMACY',8,'Cash','2018-06-01 12:46:54','2018-01-06',1,33,20,3,'',0,NULL,NULL,'BRM/18-19/33',1,'18-19',NULL,NULL),(34,9,4,'PHARMACY',60,'Cash','2018-06-01 12:55:03','2018-01-06',1,34,20,10,'',0,NULL,NULL,'BRM/18-19/34',1,'18-19',NULL,NULL),(35,13,4,'PHARMACY',60,'Cash','2018-06-01 12:55:41','2018-01-06',1,35,20,15,'',0,NULL,NULL,'BRM/18-19/35',1,'18-19',NULL,NULL),(36,1,4,'PHARMACY',14,'Cash','2018-06-01 13:00:20','2018-06-01',1,36,16,1,'',0,NULL,NULL,'BRM/18-19/36',1,'18-19',NULL,NULL),(37,NULL,4,'PHARMACY',27,'Cash','2018-06-02 10:49:16','2018-06-02',1,37,32,NULL,'',0,NULL,NULL,'BRM/18-19/37',1,'18-19','kjhjkhkjhj',NULL),(38,15,1,'OP Consultation',1000,'Cash','2018-06-02 12:46:25','2018-06-02',1,38,16,17,NULL,0,NULL,NULL,'BRM/18-19/38',1,'18-19',NULL,4);
/*!40000 ALTER TABLE `patient_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_visit`
--

DROP TABLE IF EXISTS `patient_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_visit` (
  `p_visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `visit_type` int(11) DEFAULT NULL,
  `visit_date` datetime DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `check_in_out` tinyint(1) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_visit_id`),
  KEY `fk_fecilities_group` (`visit_type`),
  CONSTRAINT `patient_visit_ibfk_1` FOREIGN KEY (`visit_type`) REFERENCES `fecilities_group` (`fcgid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_visit`
--

LOCK TABLES `patient_visit` WRITE;
/*!40000 ALTER TABLE `patient_visit` DISABLE KEYS */;
INSERT INTO `patient_visit` VALUES (1,1,2,'2018-05-29 11:11:09',2,0,1,NULL),(3,3,2,'2018-05-29 11:42:13',2,0,1,NULL),(4,2,1,'2018-05-29 18:43:26',NULL,1,1,NULL),(5,4,1,'2018-05-30 05:04:27',2,1,1,NULL),(6,5,2,'2018-05-30 07:02:15',NULL,0,1,NULL),(7,6,2,'2018-05-30 08:10:40',NULL,0,1,NULL),(8,7,1,'2018-05-30 08:16:48',NULL,1,1,NULL),(9,8,1,'2018-05-30 09:00:25',NULL,1,1,NULL),(10,9,1,'2018-05-30 11:35:27',NULL,1,1,NULL),(11,10,1,'2018-05-31 11:30:01',NULL,1,1,NULL),(12,11,2,'2018-05-01 12:14:17',6,0,1,NULL),(13,12,1,'2018-05-31 17:18:19',NULL,1,1,NULL),(14,7,1,'2018-05-31 17:46:13',NULL,1,1,NULL),(15,13,2,'2018-05-31 19:29:24',NULL,0,1,NULL),(16,14,1,'2018-06-01 10:12:55',NULL,1,1,NULL),(17,15,1,'2018-06-02 12:45:44',NULL,1,1,NULL);
/*!40000 ALTER TABLE `patient_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_vitals`
--

DROP TABLE IF EXISTS `patient_vitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_vitals` (
  `p_vital_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) DEFAULT NULL,
  `p_vital_temperature` double DEFAULT NULL,
  `p_vital_pulse` double DEFAULT NULL,
  `p_vital_bloodpressure` double DEFAULT NULL,
  `p_vital_height` double DEFAULT NULL,
  `p_vital_weight` double DEFAULT NULL,
  `p_vital_BMI` double DEFAULT NULL,
  `p_vital_smoking_habit` varchar(10) DEFAULT NULL,
  `p_vital_drinking_habit` varchar(10) DEFAULT NULL,
  `others` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`p_vital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_vitals`
--

LOCK TABLES `patient_vitals` WRITE;
/*!40000 ALTER TABLE `patient_vitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_vitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_billing`
--

DROP TABLE IF EXISTS `pharmacy_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_billing` (
  `pharmacy_billing_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `receipt_code` varchar(30) DEFAULT NULL,
  `medicine_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paid_amount` double(16,2) DEFAULT NULL,
  `quantity` tinyint(4) DEFAULT NULL,
  `medicine_stock_id` int(11) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  PRIMARY KEY (`pharmacy_billing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_billing`
--

LOCK TABLES `pharmacy_billing` WRITE;
/*!40000 ALTER TABLE `pharmacy_billing` DISABLE KEYS */;
INSERT INTO `pharmacy_billing` VALUES (1,12,'BRM/18-19/12',14,1,4.00,1,19,4),(2,13,'BRM/18-19/13',2,1,12.00,10,35,10),(3,26,'BRM/18-19/26',20,1,5.00,1,22,5),(4,27,'BRM/18-19/27',2,1,12.00,1,35,10),(5,29,'BRM/18-19/29',11,1,11.00,1,16,11),(6,30,'BRM/18-19/30',16,1,6.00,1,11,6),(7,31,'BRM/18-19/31',3,1,10.00,5,42,9),(8,32,'BRM/18-19/32',11,1,11.00,1,16,11),(9,33,'BRM/18-19/33',25,1,4.00,2,13,4),(10,34,'BRM/18-19/34',2,1,12.00,5,36,10),(11,35,'BRM/18-19/35',2,1,12.00,5,36,10),(12,36,'BRM/18-19/36',24,1,14.00,1,15,14),(13,37,'BRM/18-19/37',25,1,4.00,1,13,4),(14,37,'BRM/18-19/37',6,1,23.00,1,6,23);
/*!40000 ALTER TABLE `pharmacy_billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_master`
--

DROP TABLE IF EXISTS `referral_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referral_master` (
  `ref_id` int(10) NOT NULL AUTO_INCREMENT,
  `ref_code` varchar(20) DEFAULT NULL,
  `ref_name` varchar(100) DEFAULT NULL,
  `ref_occupation` varchar(100) DEFAULT NULL,
  `ref_org_type` varchar(30) DEFAULT NULL,
  `ref_org_name` varchar(100) DEFAULT NULL,
  `ref_address` text,
  `ref_city` varchar(30) DEFAULT NULL,
  `ref_mobile` varchar(30) DEFAULT NULL,
  `ref_whatsapp` varchar(30) DEFAULT NULL,
  `ref_email` varchar(100) DEFAULT NULL,
  `ref_srb` varchar(30) DEFAULT NULL,
  `ref_is_deleted` tinyint(1) DEFAULT '1',
  `ref_acc_hol_name` varchar(30) DEFAULT NULL,
  `ref_account_no` varchar(30) DEFAULT NULL,
  `ref_branch` varchar(30) DEFAULT NULL,
  `ref_ifsc_code` varchar(30) DEFAULT NULL,
  `ref_image_name` varchar(30) DEFAULT NULL,
  `ref_bank_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_master`
--

LOCK TABLES `referral_master` WRITE;
/*!40000 ALTER TABLE `referral_master` DISABLE KEYS */;
INSERT INTO `referral_master` VALUES (1,'REF1','dorababu','RMP','HOSPITAL','none','sanjivini mitra','kakinada','7013404554','7013404554','tk.dorababu@gmail.com','Send',1,'dorbabu','02800123456','Kakinada','ICIC12356',NULL,'ICICI'),(2,'REF2','Md Alisha','STAFF','CLINIC','Alisha clinic','Rk Rao peta','kakinada','7013982777','7013982777','Alishabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(3,'REF3','M V srinivas','RMP','CLINIC','Srinivas clinic','chollangi','chollangi','8790510640','8790510640','srinivasbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'REF4','K Sudhakar','RMP','CLINIC','sudhakar clinic','vomanngi','vomangi','9581395913','9581395913','sudhkarbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(5,'REF5','U sitharama raju apsp','RMP','CLINIC','sai priya clinic','near apsp','kakinada','9949183132','9949183132','rajubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(6,'REF6','Paul prasad pastor','RMP','CLINIC','paul clinic','near jerusalem church','nadakuduru','9959462307','9959462307','paulbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(7,'REF7','P Raju','RMP','CLINIC','raju clinic','chollangi','chollangi','9948087351','9948087351','prajubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(8,'REF8','P Bhashkar Rao','RMP','CLINIC','Bhaskar clinic','near ramalayam','komarigiri','7288033033','7288033033','bhashkarbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(9,'REF9','Chimmili srinivasulu','RMP','CLINIC','srinivas clinic','yellangi peta','Tondangi mandalam','9490262231','9490262231','srinivasbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(10,'REF10','Vailapali Venkateshwaao','RMP','CLINIC','venkateshwara clinic','durgam cheruvu','kajuluru mandalam','9949188762','9949188762','venkateshwarabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(11,'REF10','Kamarada Badam rao','RMP','CLINIC','santhi clinic','pedadda','Rajolu mandalam','9440441169','9440441169','Badamraobrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(12,'REF10','J S Prasad','RMP','CLINIC','Prasad clinic','pallepalam','yanam','9912562190','9912562190','Prasadbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(13,'REF10','P Satti Babu','RMP','CLINIC','sattibabu clinic','chitrada','chitrada','9951105469','9951105469','sattibabubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(14,'REF10','Masina Bhimeswara rao','RMP','CLINIC','bhimeshwara clinic','Matam Center','Samalkota','9849014686','9849014686','bhimeshwarabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(15,'REF10','D Prasad','RMP','CLINIC','Prasad clinic','Uppada','Uppada','7095776676','7095776676','prasadbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(16,'REF10','M V Satyanarayana','RMP','CLINIC','Satyanarayana clinic','valasapakala','valasapakala','9100230939','9100230939','satyanarayanabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(17,'REF10','Raju kakinada','RMP','CLINIC','New Arogya clinic','Sanjay NAgar','kakinada','9848549481','9848549481','rajupmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(18,'REF10','M Babji','RMP','CLINIC','Babji clinic','Gudivada village','peddapuram madalam','7416727626','7416727626','babjibrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(19,'REF10','Dr pampala satyanarayana','RMP','HOSPITAL','Suvarna clinic','N kottapalli','Uppala guptam','9949714243','9949714243','Suvarnabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(20,'REF10','Y Srinivas','RMP','CLINIC','Srinivasa clinic','Dairyform center','kakinada','9866662225','9866662225','srinivasbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(21,'REF10','P Govind','RMP','CLINIC','govind clinic','Bikkavolu','Bikkavolu','9849579405','9849579405','govindbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(22,'REF10','N Siva','RMP','CLINIC','Siva clinic','cheediga','kakinada','7396315289','7396315289','sivabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(23,'REF10','P Siva Reddy','RMP','CLINIC','siva reddy clinic','Indrapalem','kakinada','9652525353','9652525353','sivareddybrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(24,'REF10','G Srinu','RMP','CLINIC','srinu clinic','Veldurti','pithapuram','9848859496','9848859496','srinubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(25,'REF10','Dr Madhu','RMP','CLINIC','madhu hospital','vakalapudi','vakalapudi','9247222575','9247222575','madhubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(26,'REF10','G Srinivasa Rao','RMP','CLINIC','GSR clinic','venkata nagar','kakinada','9491891831','9491891831','gsrbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(27,'REF10','Sivakeshava pmp','RMP','CLINIC','sivakeshava clinic','Draksharamam','Draksharamam','9550119709','9550119709','sivapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(28,'REF10','Kumar pmp','RMP','CLINIC','kumar clinic','Chebrolu','chebrolu','9948047048','9948047048','kumarpmp@gnail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(29,'REF10','R Vara Prasad pmp','RMP','CLINIC','varaprasad clinic','near somavaram','yeleshwaram','9494957103','9494957103','varaprasadpmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(30,'REF10','Tata Rao pmp','RMP','CLINIC','Tatarao clinic','Jaganaikpur','kakinada','9949318797','9949318797','tataraopmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(31,'REF10','Kasi garu PMP','RMP','CLINIC','kasi clinic','kakinada','kakinada','9133388105','9133388105','kasipmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(32,'REF10','Lokeshwarao','RMP','CLINIC','Madhuri Clinic','peddapuram','peddapuram','9866464353','9866464353','lokeshwaraormp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(33,'REF10','Nagendhra pro','RMP','CLINIC','nagendhra clinic','kajuluru','kajuluru','7095021112','7095021112','nagendhrapro@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(34,'REF10','Samba sivarao pmp','RMP','CLINIC','sambasiva clinic','kerlampudi','kerlampudi','9949383426','9949383426','sambapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(35,'REF10','VENKATA RAO GARU PMP','DOCTOR','CLINIC','venkateshwara clinic','Goddatipalem','karapa mandalam','9177833419','9177833419','venkateshwararaopmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(36,'REF10','Chandu pmp','RMP','CLINIC','chandu clinic','dairy form center rajiv gruhakalpa center','kakinada','9849762004','9849762004','chandupmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(37,'REF10','Mahesh pmp','DOCTOR','CLINIC','mahesh clinic','opp spandana studio','kakinada','9441324309','9441324309','maheshpmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(38,'REF10',' Vijay pmp','DOCTOR','CLINIC','vijay clinic','kandaregula','karapa mandalam','9949565946','9949565946','vijaypmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(39,'REF10','Ismail pmp','DOCTOR','CLINIC','Ismail clinic','Ommangi','Ommangi','9949430514','9949430514','ismailpmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(40,'REF10','Narasimha pmp','DOCTOR','CLINIC','Narasimha clinic','Talla revu','kakinada','9441420494','9441420494','narasimhapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(41,'REF10','Ramana pmp','RMP','CLINIC','Ramana clinic','Sarpavaram','kakinada','9666889521','9666889521','ramanapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(42,'REF10','Sankar pmp','RMP','CLINIC','Sankar clinic','Gandhi Nagar','kakinada','9848549552','9848549552','sankarpmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(43,'REF10','D saleem pmp','RMP','CLINIC','saleem clinic','Tallarevu main Road','main road Tallarevu','9618054231','9618054231','saleempmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(44,'REF10','Srnivas chanti pmp','RMP','CLINIC','chanti clinic','Sitaramapuram','Tallarevu','9849002291','9849002291','chantipmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(45,'REF10','v satyanarayana pmp','RMP','CLINIC','siva clinic','dumulapeta','kakinada','9652390960','9652390960','vsatyanarayanapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(46,'REF10','SRINIVAS KARAPA','RMP','CLINIC','SRI SAI DURGA CLINIC','KARAPA','KARAPA','9666222003','9666222003','bobbilisrinivasarao@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(47,'REF10','Rajesh karpa','RMP','CLINIC','sai durga clinic','karapa','karapa','9959200833','9959200833','rajesh@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(48,'REF10','B KUMAR Kirlampudi','RMP','CLINIC','kumar clinic','Kirlampudi','kirlampudi','9848655080','9848655080','kumar@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(49,'REF10','RAGHUNATH komarigiri','RMP','CLINIC','ragunath clinic','Komarigiri','komarigiri','7288033033','7288033033','ragunath@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(50,'REF10','Sastry Katravulapalli','RMP','CLINIC','sastry clinic','katravulapalli','katravulapalli','9849338822','9849338822','sastry@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(51,'REF10','SITHARAMARJU  Vemavaram','RMP','CLINIC','Sai ram clinic','VEMAVARAM','VEMAVARAM','9866049149','9866049149','sitharamaraju@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(52,'REF10','V SRINU Yanam','RMP','CLINIC','avanthika clinic','yanam three cases','yanam','9573208050','9573208050','vsrinuyanam@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(53,'REF10','MURTHY BH V N   Velagi','RMP','CLINIC','murthyclinic','VELAGI','VELAGI','9014351113','9014351113','murthy@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(54,'REF10','PRASAD JAGGAMPETA HAND','RMP','CLINIC','prasad clinic','JAGGAMPETA','JAGGMPETA','7989931548','7989931548','prasad@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(55,'REF10','TATAJI  OT  CARM','RMP','CLINIC','tataji clinic','KAKINADA','KAKINADA','8341926210','8341926210','tataji@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(56,'REF10','SUDHKAR VOMANGGI ARUNA','RMP','CLINIC','sudhkar clinic','VOMANGGI','VOMANGGI','9581395913','9581395913','sudhkar@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(57,'REF10','SURYANARAYANA G  TURANGI','RMP','CLINIC','ALAIKYA CLINIC','TURANGI','TURANGI','9948846768','9948846768','suryanarayana@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(60,'REF10','ss','RMP','CLINIC','ss','ss','ss','1111111111','1111111111','','Send',1,'test','111111','abg','sdf3434','60.jpg','ICICI'),(61,'REF10','raju','DOCTOR','HOSPITAL','raju clinic','main road','kakinada','7799329729','7799329729','','Send',1,'subrahmanyam','0280001021','indrapalem','ICIC0280','61.jpg','ICICI'),(62,'REF10','ravi kumar','RMP','CLINIC','ravi hospital','11/234','kakinada','7856755747','7856755747','ravi@gmail.com','Send',1,'rao','094141804124','personal','004532','62.jpg','sbi'),(63,'REF10','rani','RMP','CLINIC','ravi clinic','venkat nagar','rajamundry','8963464334','8963464334','','Send',1,'','','','','63.jpg','undefined'),(64,'REF10','rammohan','RMP','CLINIC','jothi clinic','dada nagar','kakinada','6745434343','6745434343','','Send',1,'','','','','64.jpg','undefined');
/*!40000 ALTER TABLE `referral_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialities`
--

DROP TABLE IF EXISTS `specialities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialities` (
  `spid` int(11) NOT NULL AUTO_INCREMENT,
  `spname` varchar(100) DEFAULT NULL,
  `spdesc` text,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`spid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialities`
--

LOCK TABLES `specialities` WRITE;
/*!40000 ALTER TABLE `specialities` DISABLE KEYS */;
INSERT INTO `specialities` VALUES (1,'General medicine','general medicine (in Commonwealth nations) is the medical specialty dealing with the prevention, diagnosis, and treatment of adult diseases. Physicians specializing in internal medicine are called internists, or physicians (without a modifier) in Commonwealth nations.',1),(2,'ORTHO','medicine concerned with the correction or prevention of deformities, disorders, or injuries of the skeleton and associated structures (such as tendons and ligaments)',1),(3,'Dermatology','The branch of medicine concerned with the diagnosis, treatment, and prevention of diseases of the skin, hair, nails, oral cavity and genitals. 2. Sometimes also, cosmetic care and enhancement.\nDermatology is literally the study of the skin.',1),(4,'physiotherapy','The treatment of disease, injury, or deformity by physical methods such as massage, heat treatment, and exercise rather than by drugs or surgery.\nUS term physical therapy',1),(5,'Gynecologist','medical science that deals with the health maintenance and diseases of women, especially of the reproductive organs',1),(6,'urology','Urology is a surgical speciality that deals with the treatment of conditions involving the male and female urinary tract and the male reproductive organs',1),(7,'cardiology','The medical study of the structure, function, and disorders of the heart. cardiology in Science. cardiology The branch of medicine that deals with diagnosis and treatment of disorders of the heart.',1),(8,'neurology','A neurologist is a medical doctor who specializes in treating diseases of the nervous system. The nervous system is made of two parts: the central and peripheral nervous system. It includes the brain and spinal cord.',1),(9,'pulmonology','Pulmonology is a medical speciality that deals with diseases involving the respiratory tract. ... Pulmonology is synonymous with pneumology respirology and respiratory medicine. Pulmonology is known as chest medicine and respiratory medicine in some countries and areas.',1),(10,'Laparoscopic surgery','A flexible fiberoptic instrument, passed through a small incision in the abdominal wall and equipped with biopsy forceps, an obturator, scissors or the like, with which to examine the abdominal cavity or perform minor surgery.',1);
/*!40000 ALTER TABLE `specialities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(40) DEFAULT NULL,
  `staff_department` varchar(40) DEFAULT NULL,
  `staff_salary` double DEFAULT NULL,
  `staff_status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'kiran','boy',5600,1),(2,'jojo','cleaning',3400,NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_type` varchar(100) DEFAULT NULL,
  `store_name` varchar(100) DEFAULT NULL,
  `store_account_group` int(11) DEFAULT NULL,
  `tin_no` varchar(40) DEFAULT NULL,
  `drug_no` varchar(40) DEFAULT NULL,
  `is_super_store` varchar(20) DEFAULT NULL,
  `sales_unit` varchar(20) DEFAULT NULL,
  `store_status` tinyint(4) DEFAULT '1',
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Inventory','CASUALITY',1,'1','1','No','Yes',1,8),(2,'Inventory','OT MODULAR THEATRE',1,'1','1','No','Yes',1,7),(3,'Inventory','BRM MEDICAL STORE',1,'1','1','Yes','Yes',1,2),(4,'Inventory','General ward Male',1,'12345','12345','No','Yes',1,5),(5,'Inventory','ICU MEDICALS',NULL,'','','No','No',1,4),(6,'Inventory','MINOR OT',1,'12345','12345','No','Yes',1,27),(7,'Inventory','LAB',1,'12345','12345','No','Yes',1,2),(8,'Inventory','X RAY LAB',1,'12345','12345','No','Yes',1,20);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '',
  `address` varchar(70) DEFAULT '',
  `city` varchar(30) DEFAULT '',
  `contact_person` varchar(30) DEFAULT '',
  `mobile` varchar(16) DEFAULT NULL,
  `gst_no` varchar(16) DEFAULT NULL,
  `tin_no` varchar(16) DEFAULT NULL,
  `supply_status` tinyint(4) DEFAULT '1',
  `category` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'SRI NAVYA MEDICAL AGENCY','Opp RTC Complx road','KAKINADA','BOSU BABU','9866077630','37ARUPA0957D1ZR','1234567536',1,NULL),(2,'SRI SURYA MEDICAL STORES','RAMANAYYAPETA','KAKINADA','SURYA','9849672303','37AACHB0025N1ZK','12345',1,NULL),(3,'DEV MEDICARE','JAWAHAR STREET','KAKINADA','DEV','9490887325','37AESPM1552K1ZO','12345',1,NULL),(4,'SRI SRINIVASA SURGICALS','KEDARESWARA PETA','VIJAYAWADA','SRINIVAS','9542699499','37AVAPA1592N1ZH','12345',1,NULL),(5,'CLAY CHEMICAL COMPANY','KOTHAPETA MARKET STREET','KAKINADA','A','9848221911','37AEVPM6608M1ZM','12345',1,NULL),(6,'V L K ENTERPRISES','Vempativari street','KAKINADA','','9885039944','37AHIPN0603R1ZZ','12345',1,NULL),(7,'SRI VENKATESHWARA AGENCIES PVT','OPP HDFC BANK DANAVAI PETA','RAJAHMUNDRY','','0883247376','37AADCS1211K1ZK','12345',1,NULL),(8,'LABNOVA DIAGNOSTICS  HEALTHCA','REVENUE COLONY','KAKINADA','','9848287415','37BWZPD2351R1ZN','12345',1,NULL),(9,'UDAYA BHASKAR ENTERPRISES','RAMARAO STREET','KAKINADA','','9640146888','37AMLPC9827A1Z3','12345',1,NULL),(10,'SANA ENTERPRISERS','DASPALLA LAYOUT','VISHAKAPATNAM','','9393129818','37AABPZ4967C1ZC','12345',1,NULL),(11,'SRI KARTHIK MEDICAL  SURGICAL','SRINIVASA NAGAR','NANDYAL','','9676777877','37DBLPS5604D1ZI','12345',1,NULL),(12,'SURANA ENTERPRISES','MAIN ROAD','KAKINADA','','0884237720','136434646435653','12345',1,NULL),(13,'SRI SOLUTIONS','SUBHADRA ARCADE','KAKINADA','','9959030578','37AHZPR5017Q1Z6','123454234234234',1,''),(14,'EVB TECHNOLOGIES','HUKUMPETA','RAJAHMUNDRY','','9866810099','123456879012345','12345',1,NULL),(15,'R L HANSRAJ AND CO','GANESH COMPLEX','CHENNAI','','2535654825','33AAFFR5797L1ZK','12345',1,NULL),(16,'KUMARS COLOUR CORNER','RAJAJI STREET','KAKINADA','','9246693306','37AAHFK6430F1ZE','12345',1,NULL),(17,'A ONE FURNITURE','JAWAHAR STREET','KAKINADA','','7396494444','37AEUPV9762Q1ZT','12345',1,NULL),(18,'BHARAT ENTP SURGICALS','TIRUMALA THEATRE','KAKINADA','','9000357888','37AAIFN9956G1ZN','12345',1,NULL),(19,'P L K ENTERPRISES','','KAKINADA','ravi kumar','8667656555','T54626885635355','Tin423442423242',1,'samples');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_master`
--

DROP TABLE IF EXISTS `tax_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_master` (
  `tax_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_name` varchar(50) DEFAULT NULL,
  `tax_data` json DEFAULT NULL,
  `tax_percent` double DEFAULT NULL,
  PRIMARY KEY (`tax_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_master`
--

LOCK TABLES `tax_master` WRITE;
/*!40000 ALTER TABLE `tax_master` DISABLE KEYS */;
INSERT INTO `tax_master` VALUES (1,'GST18','{\"CGST\": \"9\", \"SGST\": \"9\"}',18),(2,'GST28','{\"CGST\": \"14\", \"SGST\": \"14\"}',28),(3,'GST0','{}',0),(4,'GST5','{\"CGST\": 2.5, \"SGST\": 2.5}',5),(5,'GST12','{\"CGST\": 6, \"SGST\": 6}',12);
/*!40000 ALTER TABLE `tax_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_billing`
--

DROP TABLE IF EXISTS `test_billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_billing` (
  `test_billing_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `receipt_code` varchar(30) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `paid_amount` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`test_billing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_billing`
--

LOCK TABLES `test_billing` WRITE;
/*!40000 ALTER TABLE `test_billing` DISABLE KEYS */;
INSERT INTO `test_billing` VALUES (1,16,'BRM/18-19/16',3,1,50.00),(2,17,'BRM/18-19/17',4,1,50.00),(3,19,'BRM/18-19/19',7,1,50.00);
/*!40000 ALTER TABLE `test_billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data`
--

DROP TABLE IF EXISTS `test_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data`
--

LOCK TABLES `test_data` WRITE;
/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
INSERT INTO `test_data` VALUES (1,'pandu','ankani','pandu@g.com','pandu','male','2018-03-27'),(2,'Srikanth','Uppalapu','srikanth.u@gmail.com','password','male','1980-02-14'),(3,'Gowtham','Sagar','gowtham.t@gmail.com','password','male','2000-04-02'),(4,'Srijanya','T','srijanya.t@gmail.com','password','female','1997-04-02'),(5,'Lakshmi','U','lakshmi.u@gmail.com','pwd','female','1960-01-01');
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_pricing`
--

DROP TABLE IF EXISTS `test_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_pricing` (
  `test_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_pricing`
--

LOCK TABLES `test_pricing` WRITE;
/*!40000 ALTER TABLE `test_pricing` DISABLE KEYS */;
INSERT INTO `test_pricing` VALUES (1,3,50,22),(2,4,50,22),(3,5,150,15),(4,6,50,22),(5,7,50,22),(6,8,50,22),(7,9,50,22),(8,10,250,22),(9,11,100,22),(10,12,300,22),(11,13,300,22),(12,14,350,22),(13,15,350,22),(14,16,150,22),(15,17,200,22),(16,18,50,22),(17,19,50,22),(18,20,50,22),(19,22,50,22),(20,24,200,22),(21,25,100,22),(22,27,100,22),(23,28,100,22),(24,29,200,22),(25,30,100,22),(26,31,100,22),(27,32,100,22),(28,33,150,22),(29,34,150,22),(30,35,150,22),(31,36,500,22),(32,37,750,22),(33,38,100,22),(34,39,100,22),(35,40,200,22),(36,41,200,22),(37,42,150,22),(38,43,150,22),(39,44,150,22),(40,45,350,22),(41,46,400,22),(42,48,250,22),(43,49,100,22),(44,50,1000,22),(45,51,300,22),(46,52,150,22),(47,53,1000,22),(48,54,750,22),(49,71,1000,22),(50,55,300,22),(51,57,300,22),(52,56,300,22),(53,58,1000,22),(54,59,1000,22),(55,59,1000,22),(56,60,400,22),(57,61,350,22),(58,62,100,22),(59,63,200,22),(60,64,60,22),(61,65,100,22),(62,66,500,22),(63,67,200,22),(64,68,60,22),(65,69,60,22),(66,70,60,22),(67,72,300,22),(68,73,500,22),(69,74,300,22),(70,75,600,22),(71,76,500,22),(72,77,600,22),(73,78,500,22),(74,79,250,22),(75,80,400,22),(76,81,400,22),(77,82,400,22),(78,83,400,22),(79,100,400,22),(80,84,400,22),(81,86,400,22),(82,87,400,22),(83,88,400,22),(84,89,400,22),(85,90,400,22),(86,91,400,22),(87,92,800,22),(88,94,1000,22),(89,95,400,22),(90,96,500,22),(91,97,500,22),(92,98,350,22),(93,99,350,22),(94,101,350,22),(95,102,500,22),(96,103,500,22),(97,104,500,22),(98,105,500,22);
/*!40000 ALTER TABLE `test_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `mobile` varchar(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `qualification` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  `whatsapp` varchar(12) DEFAULT NULL,
  `is_deleted` varchar(1) DEFAULT 'N',
  `doj` varchar(50) DEFAULT NULL,
  `outer_staff` varchar(1) DEFAULT 'N',
  `username` varchar(20) DEFAULT NULL,
  `login_status` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ADM1','PSR KUMAR','kumar@cobrain.tech','cobrain','9694202815','Srinagar','Kakinada',1,1,'M.Tech','Computer Science',NULL,NULL,'N','1978-02-02','N','kumar','Y'),(15,'AC1','Pavan Kumar','pavankumar56595@gmail.com','kumar','9866527428','Kakinada','Kakinada',10,1,'MBA','Finance',NULL,'9866527428','N','2018-05-02','N','pavan','Y'),(16,'DR1','Ram Murthy','bollapragada.rm@gmail.com','brm','9989802199','Kakinada','Kakinada',3,1,'M.B.B.S, M.A, M.S','General Medicine',NULL,'9989802199','N','2018-05-02','N','ram','N'),(17,'ADM2','Subrahmanyam Salumuri','salmuri@gmail.com','admin','7799329729','Main Road','kakinada',1,1,'B.Sc','Computers',NULL,'7799329729','N','2018-05-02','N','salmuri','Y'),(18,'PR1','ganesh','s@gmail.com','123','9899989999','main road','kkd',8,1,'MBA','HRM',NULL,'9899989999','N','2017-03-24','N','ganesh','N'),(19,'DR2','Jagan mohan','jagan.brm@gmail.com','brm','9154326696','100 building','kakinada',3,1,'md','general medicine',NULL,'9154326696','N','2018-05-03','N','jagan','N'),(20,'DR3','kishore kumar','brm.kishore@gmail.com','brm','8888999900','kakinada','kakinada',3,1,'mbbs','General Surgery',NULL,'8888999900','N','2018-05-03','N','kishore','N'),(21,'DR4','satish','sathish@gmail.com','brm','8888999900','ds','sd',3,1,'mbbs','Anesthesia',NULL,'8888999900','N','2018-05-03','N','satish','N'),(22,'LT1','SAI KUMAR','ksai6278@gmail.com','brm','9966864533','j ramarao peta','KAKINADA',5,1,'MLT','MLT',NULL,'9966864533','N','2018-05-04','N','sai','Y'),(23,'IT1','P SATYANARAYANA','satya515253@gmail.com','brm','9493882512','SURYANARAYANA PURAM','KAKINADA',6,1,'CRA','X-RAY TECH',NULL,'9493882512','N','2018-05-04','N','satyanarayana','Y'),(24,'ADM3','RAVICHANDRA','brmcarewell@gmail.com','silicon','9704799992','GUDIMETLA VARI STREET','KAKINADA',1,1,'MBA','director',NULL,'9063995999','N',NULL,'Y','ravichandra','Y'),(25,'OS1','B DURGA DEVI','durgadevi1998727@gmail.com','brm','8499042337','mamatha scaning centre','kakinada',9,1,'CARDIOLOGY TECHNISION','cardiology','a','8499042337','N','2018-05-05','N','devi','N'),(26,'DR5','T.RAMESH',NULL,'BRM123','9912841114','KAKINADA','KAKINADA',3,1,'MBBS, MS ORTHO','ORTHOPEDIC SURGERY',NULL,'9912841114','N',NULL,'Y','DR. T.RAMESH','N'),(27,'DR6','G.PRAVEENNATH','syamuchandu@gmail.com','BRM123','9654957468','KAKINADA','KAKINADA',3,1,'DNB( PULUMONOLOGY ),MNAMS,FCCS','DNB PULOMONOLOGY',NULL,'9654957468','N',NULL,'Y','DR.G.PRAVEENNATH','N'),(28,'DR7','P.HARI PRASAD',NULL,'BRM123','9654957468','KAKINADA','KAKINADA',3,1,'MS., M.CH NEURO SURGEN','NEURO SURGEN',NULL,'9654957468','N',NULL,'Y','P.HARI PRASAD','N'),(29,'DR8','D.RAMAKISHORE',NULL,'BRM123','9052299923','kakinada','kakinada',3,1,'MS ortho','ORTHOPEDIC SURGERY','9885951019 wife','9052299923','N',NULL,'N','D.RAMAKISHORE','N'),(30,'DR9','N.SRINIVAS',NULL,'BRM123','9848277361','KAKINADA','KAKINADA',3,1,'MS GENERAL SURGEN','MS GENERAL SURGERY',NULL,'9052299923','N',NULL,'N','N.SRINIVAS','N'),(31,'DR10','SPANDANA',NULL,'BRM123','9246695245','KAKINADA','KAKINADA',3,1,'MD,DVL','DERMOTOLOGY',NULL,'9246695245','N',NULL,'N','DERMOTOLOGY','N'),(32,'DR11','RAMJI NARENDHRA',NULL,'BRM123','9488352586','KAKINADA','KAKINADA',3,1,'MS GENERAL SURGEN','GENERAL SURGEN',NULL,'9488352586','N',NULL,'Y','GENERAL SUREN','N'),(33,'DR12','TEJO KRISHNA',NULL,'BRM123','9441785212','KAKINADA','KAKINADA',3,1,'MS,NEPROLOGY','NEPROLOGIST',NULL,'9441785212','N',NULL,'Y','NEPROLOGY','N'),(34,'DR13','GOPI KRISHNA',NULL,'BRM123','9908834660','KAKINADA','KAKINADA',3,1,'MD NEURO PHYSICIAN','NEURO PHYSICIAN','9398888989','9908834660','N',NULL,'Y','NEURO PHYSICIAN','N'),(35,'DR14','GOUTHAM PRAVEEN',NULL,'BRM123','9000592588','KAKINADA','KAKINADA',3,1,'MD NEURO PHYSICIAN','NEURO PHYSICIAN',NULL,'9000592588','N',NULL,'Y','GOUTHAM PRAVEEN','N'),(36,'DR15','GANESH',NULL,'BRM123','9493882515','KAKINADA','KAKINADA',3,1,'MS UROLOGY','UROLOGIST',NULL,'9493882515','N',NULL,'N','UROLOGY','N'),(37,'DR16','B.SURENDRA BABU',NULL,'BRM123','9848528954','KAKINADA','KAKINADA',3,1,'MS UROLOGY','UROLOGIST','9441811442','9848528954','N',NULL,'Y','B.SURENDRA BABU','N'),(38,'DR17','ANJI NAYAK',NULL,'BRM123','9494573105','KAKINADA','KAKINADA',3,1,'MS UROLOGY','UROLOGIST',NULL,'9494573105','N',NULL,'N','DR.ANJI NAYAK','N'),(39,'DR18',' VENKATA REDDY',NULL,'BRM123','9948124102','KAKINADA','KAKINADA',3,1,'MD GASTROENTROLOGY','GASTRO',NULL,'9948124102','N',NULL,'N','GASTROENTROLOGY','N'),(40,'DR19',' PHANI',NULL,'BRM123','8978067181','KAKINADA','KAKINADA',3,1,'MD ANASTECIA','ANASTHECIA',NULL,'8978067181','N',NULL,'Y','ANASTHECIA','N'),(41,'DR20','ANAL KUMAR',NULL,'BRM123','9848233155','KAKINADA','KAKINADA',3,1,'MD ANASTECIA','ANASTHECIA',NULL,'9848233155','N',NULL,'N',' ANAL KUMAR','N'),(42,'DR21','SIVA ANVESH junior doctor',NULL,'BRM123','8074888801','kakinada','KAKINADA',3,1,'ANASTECIA','ANASTHECIA',NULL,'8074888801','N',NULL,'N',' SIVA ANVESH','N'),(43,'DR22','AMRUTHA',NULL,'BRM123','8008448333','KAKINADA','KAKINADA',3,1,'GYNECOLOGOST','GYNOCOLOGY','9966647179','8008448333','N',NULL,'N','GYNAECOLOGIST','N'),(44,'DR23',' VIJAYA LAKSHMI',NULL,'BRM123','9959040180','KAKINADA','KAKINADA',3,1,'GYNECOLOGOST','MD, GYNOCOLOGY',NULL,'9959040180','N',NULL,'N',' VIJAYA LAKSHMI','N'),(45,'DR24',' TUSHAR AGARWAL',NULL,'BRM123','9676160632','KAKINADA','KAKINADA',3,1,'MS ORTHO','ORTHOPHYSICIAN','9391467020','9676160632','N',NULL,'Y',' TUSHAR AGARWAL','N'),(46,'DR25',' ANAND CHOWDARY',NULL,'BRM123','9959691999','RAJHAMUNDRY','RAJHAMUNDRY',3,1,'MS ORTHO','ORTHOPHYSICIAN',NULL,'9959691999','N',NULL,'Y','ANAND CHOWDARY','N'),(47,'DR26','T. S. R. MURTHY',NULL,'BRM123','9440110422','KAKINADA','KAKINADA',3,1,'DIPLOMO ORTHO','ORTHOPHYSICIAN',NULL,'9440110422','N',NULL,'N','T. S. R. MURTHY','N'),(48,'DR27','BHASHKAR REDDY',NULL,'BRM123','9848061941','KAKINADA','KAKINADA',3,1,'MS PEDIATRIC','PEDIATRICIAN',NULL,'9848061941','N',NULL,'N','PEDIATRIC','N'),(49,'DR28',' SRIDHAR',NULL,'BRM123','9849756888','KAKINADA','KAKINADA',3,1,'MS PEDIATRIC','PEDIATRICIAN',NULL,'9849756888','N',NULL,'N','SRIDHAR','N'),(50,'DR29',' VASANTH',NULL,'BRM123','8142435236','KAKINADA','KAKINADA',3,1,'GENERAL MEDICIAN','GENERAL MEDICIAN','9491847491','8142435236','N',NULL,'N','GENERAL MEDICIAN','N'),(51,'DR30','b krishna santosh','krrishent@yahoo.com','brm123','9553056058','vinukonda vari street','kakinada',3,1,'mbbs ms ent','ent','','9553056058','N','','Y','ent speciality','N'),(52,'DR31','Sushimitha','','brm123','9878987898','main road','kakinada',3,1,'M.S','Gynecologist','','9878987898','N','','N','Sushimitha','N'),(53,'DR32','D S L V NARASIMHAM','','BRM123','1234567890','KAKINADA','KAKINADA',3,1,'MS','GENERAL SURGEON','','1234567890','N','','N','D S V L NARASIMHAM','N'),(54,'NS1','S NAVEEN',NULL,'BRM123','8686665125','PITHPURAM','PITHAPURAM',4,1,'DEGREE','CASUALITY ANASTECIA TECH',NULL,'8686665125','N',NULL,'N','NAVEEN','Y'),(55,'DR33',' SRIMANARAYANA',NULL,'BRM123','9848642642','KAKINADA','KAKINADA',3,1,'MS ORTHO','MS ORTHO',NULL,'9848642642','N',NULL,'Y','SRIMANARAYANA','N'),(57,'ADM4','V Tarun Kumar','','cobrain','7386071070','','Kakinada',1,1,'B.Sc','','','7386071070','N','','N','tarun','Y'),(58,'ADM5','Shailendra ShinY','','cobrain','7799329729','','kakinada',1,1,'B.Sc','','','7799329729','N','','N','sunny','Y');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hospital`
--

DROP TABLE IF EXISTS `user_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `default` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hospital`
--

LOCK TABLES `user_hospital` WRITE;
/*!40000 ALTER TABLE `user_hospital` DISABLE KEYS */;
INSERT INTO `user_hospital` VALUES (57,10,1,0),(106,11,1,0),(107,11,2,0),(108,11,6,0),(115,24,1,0),(117,25,1,0),(120,22,1,0),(121,15,1,0),(122,58,1,0),(123,58,2,0);
/*!40000 ALTER TABLE `user_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_level`
--

DROP TABLE IF EXISTS `user_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_level` (
  `ul_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_code` varchar(10) NOT NULL DEFAULT '',
  `level_name` varchar(50) NOT NULL,
  PRIMARY KEY (`ul_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_level`
--

LOCK TABLES `user_level` WRITE;
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
INSERT INTO `user_level` VALUES (1,'ADM','Administrator'),(2,'CMO','Chief Medical Officer'),(3,'DR','Doctor'),(4,'NS','Nursing Staff'),(5,'LT','Lab Technician'),(6,'IT','Imaging Technician'),(7,'SK','Store Keeper'),(8,'PR','PRO'),(9,'OS','Office Staff'),(10,'AC','Accounts Staff'),(11,'PH','Pharmacy Staff');
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
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu`
--

LOCK TABLES `user_menu` WRITE;
/*!40000 ALTER TABLE `user_menu` DISABLE KEYS */;
INSERT INTO `user_menu` VALUES (267,23,57),(268,23,77),(269,23,74),(270,23,78),(271,23,79),(272,23,82),(273,23,67),(274,23,84),(275,23,85),(276,23,80),(277,23,86),(278,23,87),(279,23,90),(280,23,108),(428,24,60),(429,24,1),(430,24,52),(431,24,54),(432,24,53),(433,24,51),(434,24,58),(435,24,64),(436,24,66),(437,24,100),(438,24,101),(439,24,57),(440,24,77),(441,24,74),(442,24,78),(443,24,79),(444,24,82),(445,24,67),(446,24,84),(447,24,85),(448,24,80),(449,24,86),(450,24,87),(451,24,90),(452,24,108),(453,24,72),(454,24,91),(455,24,92),(456,24,104),(457,24,62),(458,24,99),(459,24,105),(460,24,95),(461,24,96),(462,24,97),(463,24,98),(464,24,103),(465,24,106),(466,24,107),(509,22,92),(510,22,104),(511,22,62),(512,22,99),(513,22,105),(514,15,52),(515,15,54),(516,15,53),(517,15,51),(518,15,58),(519,15,64),(520,15,66),(521,15,100),(522,15,101),(523,15,57),(524,15,77),(525,15,74),(526,15,78),(527,15,79),(528,15,82),(529,15,67),(530,15,84),(531,15,85),(532,15,80),(533,15,86),(534,15,87),(535,15,90),(536,15,108),(537,15,72),(538,15,91),(539,15,92),(540,15,104),(541,15,62),(542,15,99),(543,15,105),(544,15,95),(545,15,96),(546,15,97),(547,15,98),(548,15,103),(549,15,106),(550,15,107),(676,1,60),(677,1,1),(678,1,52),(679,1,54),(680,1,53),(681,1,51),(682,1,58),(683,1,64),(684,1,66),(685,1,100),(686,1,101),(687,1,57),(688,1,77),(689,1,74),(690,1,78),(691,1,79),(692,1,82),(693,1,67),(694,1,84),(695,1,85),(696,1,80),(697,1,86),(698,1,87),(699,1,90),(700,1,108),(701,1,110),(702,1,72),(703,1,111),(704,1,91),(705,1,92),(706,1,104),(707,1,112),(708,1,62),(709,1,99),(710,1,105),(711,1,95),(712,1,96),(713,1,97),(714,1,98),(715,1,103),(716,1,106),(717,1,107),(718,1,113),(719,17,60),(720,17,1),(721,17,52),(722,17,54),(723,17,53),(724,17,51),(725,17,58),(726,17,64),(727,17,66),(728,17,100),(729,17,101),(730,17,109),(731,17,57),(732,17,77),(733,17,74),(734,17,78),(735,17,79),(736,17,82),(737,17,67),(738,17,84),(739,17,85),(740,17,80),(741,17,86),(742,17,87),(743,17,90),(744,17,108),(745,17,110),(746,17,72),(747,17,91),(748,17,111),(749,17,92),(750,17,104),(751,17,112),(752,17,62),(753,17,99),(754,17,105),(755,17,95),(756,17,96),(757,17,97),(758,17,98),(759,17,103),(760,17,106),(761,17,107),(762,17,113),(763,57,60),(764,57,1),(765,57,52),(766,57,54),(767,57,53),(768,57,51),(769,57,58),(770,57,64),(771,57,66),(772,57,100),(773,57,101),(774,57,109),(775,57,57),(776,57,77),(777,57,74),(778,57,78),(779,57,79),(780,57,82),(781,57,67),(782,57,84),(783,57,85),(784,57,80),(785,57,86),(786,57,87),(787,57,90),(788,57,108),(789,57,110),(790,57,72),(791,57,91),(792,57,111),(793,57,92),(794,57,104),(795,57,112),(796,57,62),(797,57,99),(798,57,105),(799,57,95),(800,57,96),(801,57,97),(802,57,98),(803,57,103),(804,57,106),(805,57,107),(806,57,113),(807,58,60),(808,58,1),(809,58,52),(810,58,54),(811,58,53),(812,58,51),(813,58,58),(814,58,64),(815,58,66),(816,58,100),(817,58,101),(818,58,109),(819,58,57),(820,58,77),(821,58,74),(822,58,78),(823,58,79),(824,58,82),(825,58,67),(826,58,84),(827,58,85),(828,58,80),(829,58,86),(830,58,87),(831,58,90),(832,58,108),(833,58,110),(834,58,72),(835,58,111),(836,58,91),(837,58,92),(838,58,104),(839,58,112),(840,58,62),(841,58,99),(842,58,105),(843,58,95),(844,58,96),(845,58,97),(846,58,98),(847,58,103),(848,58,106),(849,58,107),(850,58,113);
/*!40000 ALTER TABLE `user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'medwise'
--

--
-- Dumping routines for database 'medwise'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-23 10:35:46
