-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: dev_brm
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
  `consultationType` varchar(32) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CaseSheet`
--

LOCK TABLES `CaseSheet` WRITE;
/*!40000 ALTER TABLE `CaseSheet` DISABLE KEYS */;
INSERT INTO `CaseSheet` VALUES (111,181,195,NULL,'2018-06-20',19,NULL,NULL,'[{\"test_id\": \"3\", \"$$hashKey\": \"object:2750\", \"test_name\": \"LIPID PROFILE\", \"ref_values\": [{\"Gender\": \"All\", \"endRange\": \"200\", \"$$hashKey\": \"object:3411\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"25\", \"subInvestigation\": \"TRIGLYCERIDES\"}, {\"Gender\": \"All\", \"endRange\": \"250\", \"$$hashKey\": \"object:3562\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"130\", \"subInvestigation\": \"TOTAL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:3578\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"35\", \"subInvestigation\": \"HDL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"120\", \"$$hashKey\": \"object:3594\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"LDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"27\", \"$$hashKey\": \"object:3610\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"VLDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"4.3\", \"$$hashKey\": \"object:3626\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"2.9\", \"endNumerator\": \"0.7\", \"startNumerator\": \"3.6\", \"subInvestigation\": \"TOTAL/HDL CHOLESTEROL RATIO\"}, {\"Gender\": \"All\", \"endRange\": \"2.7\", \"$$hashKey\": \"object:3690\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.5\", \"subInvestigation\": \"LDL/HDL CHOLESTEROL RATIO\"}], \"paid_amount\": \"450\"}]','[{\"test_id\": \"3\", \"$$hashKey\": \"object:2750\", \"test_name\": \"LIPID PROFILE\", \"ref_values\": [{\"Gender\": \"All\", \"endRange\": \"200\", \"$$hashKey\": \"object:3411\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"25\", \"subInvestigation\": \"TRIGLYCERIDES\"}, {\"Gender\": \"All\", \"endRange\": \"250\", \"$$hashKey\": \"object:3562\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"130\", \"subInvestigation\": \"TOTAL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:3578\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"35\", \"subInvestigation\": \"HDL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"120\", \"$$hashKey\": \"object:3594\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"LDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"27\", \"$$hashKey\": \"object:3610\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"VLDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"4.3\", \"$$hashKey\": \"object:3626\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"2.9\", \"endNumerator\": \"0.7\", \"startNumerator\": \"3.6\", \"subInvestigation\": \"TOTAL/HDL CHOLESTEROL RATIO\"}, {\"Gender\": \"All\", \"endRange\": \"2.7\", \"$$hashKey\": \"object:3690\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.5\", \"subInvestigation\": \"LDL/HDL CHOLESTEROL RATIO\"}], \"paid_amount\": \"450\", \"resultGiven\": false}]',NULL,NULL,NULL,NULL,'2018-06-20 07:18:18','2018-06-20 07:18:18',1,1),(112,181,195,NULL,'2018-06-20',27,NULL,NULL,'[{\"test_id\": \"7\", \"$$hashKey\": \"object:9876\", \"test_name\": \"DENGUE\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}], \"paid_amount\": \"1000\"}]','[{\"test_id\": \"7\", \"$$hashKey\": \"object:9876\", \"test_name\": \"DENGUE\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}], \"paid_amount\": \"1000\", \"resultGiven\": false}]',NULL,NULL,NULL,NULL,'2018-06-20 09:17:11','2018-06-20 09:17:11',59,59),(113,181,195,22,'2018-06-20',19,'4','','[{\"price\": \"1000\", \"test_id\": \"7\", \"test_name\": \"DENGUE\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}]}]','[{\"price\": \"1000\", \"test_id\": \"7\", \"$$hashKey\": \"object:13184\", \"test_name\": \"DENGUE\", \"ref_values\": [{\"Gender\": \"All\", \"result\": \"NEGATIVE\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"result\": \"POSITIVE\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"result\": \"POSITIVE\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}], \"resultGiven\": true}]','[{\"AB\": \"false\", \"AD\": \"false\", \"AL\": \"false\", \"BB\": \"true\", \"BD\": \"true\", \"BL\": \"false\", \"med_id\": \"1\", \"med_name\": \"D5 DEXTROSE INJ\", \"quantity\": \"2\", \"$$hashKey\": \"object:7971\"}]',NULL,NULL,'','2018-06-20 09:17:56','2018-06-22 03:42:48',59,59),(114,181,195,NULL,'2018-06-20',28,NULL,NULL,'[{\"test_id\": \"69\", \"$$hashKey\": \"object:18957\", \"test_name\": \"GLUCOSE\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:27037\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"GLUCOSE\"}], \"paid_amount\": \"60\"}]','[{\"test_id\": \"69\", \"$$hashKey\": \"object:18957\", \"test_name\": \"GLUCOSE\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:27037\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"GLUCOSE\"}], \"paid_amount\": \"60\", \"resultGiven\": false}]',NULL,NULL,NULL,NULL,'2018-06-20 09:25:44','2018-06-20 09:25:44',59,59),(115,181,195,NULL,'2018-06-20',28,NULL,NULL,'[{\"test_id\": \"16\", \"$$hashKey\": \"object:307\", \"test_name\": \"BLEEDING TIME\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:1407\", \"rangeType\": \"Time\", \"unit_name\": \"minutes\", \"endMinutes\": \"3\", \"endSeconds\": \"00\", \"startMinutes\": \"1\", \"startSeconds\": \"30\", \"subInvestigation\": \"BLEEDING TIME\"}], \"paid_amount\": \"50\"}]','[{\"test_id\": \"16\", \"$$hashKey\": \"object:307\", \"test_name\": \"BLEEDING TIME\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:1407\", \"rangeType\": \"Time\", \"unit_name\": \"minutes\", \"endMinutes\": \"3\", \"endSeconds\": \"00\", \"startMinutes\": \"1\", \"startSeconds\": \"30\", \"subInvestigation\": \"BLEEDING TIME\"}], \"paid_amount\": \"50\", \"resultGiven\": false}]',NULL,NULL,NULL,NULL,'2018-06-20 09:28:55','2018-06-20 09:28:55',59,59),(116,181,195,22,'2018-06-20',16,'2','','[{\"price\": \"200\", \"test_id\": \"78\", \"test_name\": \"X-RAY\", \"test_type_id\": \"10\"}]','[{\"price\": \"200\", \"test_id\": \"78\", \"test_name\": \"X-RAY\", \"resultGiven\": false, \"test_type_id\": \"10\"}]','null',NULL,NULL,'','2018-06-20 16:34:52','2018-06-20 16:34:52',1,1),(117,185,199,NULL,'2018-06-22',26,NULL,NULL,'[{\"test_id\": \"23\", \"$$hashKey\": \"object:307\", \"test_name\": \"G.T.T\", \"ref_values\": [{\"Gender\": \"All\", \"endRange\": \"110\", \"$$hashKey\": \"object:168\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"70\", \"subInvestigation\": \"FASTING\"}, {\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:319\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"-\", \"subInvestigation\": \"GLUCOSE( 1ST 1 HOUR)\"}, {\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:335\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"-\", \"subInvestigation\": \"GLUCOSE(2ND 1 HOUR)\"}], \"paid_amount\": \"250\"}]','[{\"test_id\": \"23\", \"$$hashKey\": \"object:307\", \"test_name\": \"G.T.T\", \"ref_values\": [{\"Gender\": \"All\", \"endRange\": \"110\", \"$$hashKey\": \"object:168\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"70\", \"subInvestigation\": \"FASTING\"}, {\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:319\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"-\", \"subInvestigation\": \"GLUCOSE( 1ST 1 HOUR)\"}, {\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:335\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"-\", \"subInvestigation\": \"GLUCOSE(2ND 1 HOUR)\"}], \"paid_amount\": \"250\", \"resultGiven\": false}]',NULL,NULL,NULL,NULL,'2018-06-22 05:56:23','2018-06-22 05:56:23',59,59),(118,185,199,NULL,'2018-06-22',28,NULL,NULL,'[{\"test_id\": \"25\", \"$$hashKey\": \"object:1416\", \"test_name\": \"BLOOD UREA\", \"ref_values\": [{\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:1099\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"14\", \"subInvestigation\": \"BLOOD UREA\"}, {\"Gender\": \"All\", \"endRange\": \"21.0\", \"$$hashKey\": \"object:1250\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"6.5\", \"subInvestigation\": \"BLOOD UREA NITROGEN (BUN)\"}], \"paid_amount\": \"100\"}]','[{\"test_id\": \"25\", \"$$hashKey\": \"object:1416\", \"test_name\": \"BLOOD UREA\", \"ref_values\": [{\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:1099\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"14\", \"subInvestigation\": \"BLOOD UREA\"}, {\"Gender\": \"All\", \"endRange\": \"21.0\", \"$$hashKey\": \"object:1250\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"6.5\", \"subInvestigation\": \"BLOOD UREA NITROGEN (BUN)\"}], \"paid_amount\": \"100\", \"resultGiven\": false}]',NULL,NULL,NULL,NULL,'2018-06-22 05:57:26','2018-06-22 05:57:26',59,59),(119,187,203,20,'2018-06-22',27,'15','','[{\"price\": \"1000\", \"test_id\": \"4\", \"test_name\": \"VIROLOGY\", \"test_type_id\": \"2\"}]','[{\"price\": \"1000\", \"test_id\": \"4\", \"test_name\": \"VIROLOGY\", \"resultGiven\": false, \"test_type_id\": \"2\"}]','null',NULL,NULL,'','2018-06-22 07:19:45','2018-06-22 07:19:45',59,59),(120,192,218,NULL,'2018-06-23',27,NULL,NULL,'[{\"test_id\": \"7\", \"$$hashKey\": \"object:3439\", \"test_name\": \"DENGUE\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}], \"paid_amount\": \"1000\"}]','[{\"test_id\": \"7\", \"$$hashKey\": \"object:3439\", \"test_name\": \"DENGUE\", \"ref_values\": [{\"Gender\": \"All\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}], \"paid_amount\": \"1000\", \"resultGiven\": false}]',NULL,NULL,NULL,NULL,'2018-06-23 03:00:27','2018-06-23 03:00:27',59,59),(121,192,218,NULL,'2018-06-23',28,NULL,NULL,'[{\"test_id\": \"13\", \"$$hashKey\": \"object:281\", \"test_name\": \"HEMOGLOBIN\", \"ref_values\": [{\"Gender\": \"M\", \"endRange\": \"18\", \"$$hashKey\": \"object:118\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"13\", \"subInvestigation\": \"HEMOGLOBIN\"}, {\"Gender\": \"F\", \"endRange\": \"16\", \"$$hashKey\": \"object:269\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"11\", \"subInvestigation\": \"HEMOGLOBIN\"}, {\"Gender\": \"P\", \"endRange\": \"19\", \"$$hashKey\": \"object:285\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"13.5\", \"subInvestigation\": \"HEMOGLOBIN\"}], \"paid_amount\": \"50\"}]','[{\"test_id\": \"13\", \"$$hashKey\": \"object:281\", \"test_name\": \"HEMOGLOBIN\", \"ref_values\": [{\"Gender\": \"M\", \"endRange\": \"18\", \"$$hashKey\": \"object:118\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"13\", \"subInvestigation\": \"HEMOGLOBIN\"}, {\"Gender\": \"F\", \"endRange\": \"16\", \"$$hashKey\": \"object:269\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"11\", \"subInvestigation\": \"HEMOGLOBIN\"}, {\"Gender\": \"P\", \"endRange\": \"19\", \"$$hashKey\": \"object:285\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"13.5\", \"subInvestigation\": \"HEMOGLOBIN\"}], \"paid_amount\": \"50\", \"resultGiven\": false}]',NULL,NULL,NULL,NULL,'2018-06-23 03:03:25','2018-06-23 03:03:25',59,59),(122,188,204,23,'2018-06-23',19,'4','Diagnosis','[{\"price\": \"1000\", \"test_id\": \"4\", \"test_name\": \"VIROLOGY\", \"test_type_id\": \"2\"}]','[{\"price\": \"1000\", \"test_id\": \"4\", \"test_name\": \"VIROLOGY\", \"resultGiven\": false, \"test_type_id\": \"2\"}]','null',NULL,NULL,'','2018-06-23 04:44:14','2018-06-23 04:44:14',59,59);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CasualtyDoctors`
--

LOCK TABLES `CasualtyDoctors` WRITE;
/*!40000 ALTER TABLE `CasualtyDoctors` DISABLE KEYS */;
INSERT INTO `CasualtyDoctors` VALUES (1,151,157,16,100),(2,151,157,35,200),(3,151,157,16,100),(4,151,157,34,200),(5,151,157,16,100),(6,151,157,35,200),(7,155,166,16,100),(8,155,166,19,20),(9,155,166,16,50),(10,155,166,19,53),(11,155,166,16,2500),(12,155,166,19,1500),(13,155,166,16,2500),(14,155,166,19,1500),(15,155,166,19,5000),(16,155,166,19,5000),(17,155,166,19,5000),(18,155,166,19,5222),(19,155,166,19,100),(20,155,166,21,100),(21,155,166,21,100),(22,155,166,31,150),(23,155,166,21,100),(24,155,166,31,150),(25,155,166,21,100),(26,155,166,31,150),(27,155,166,21,100),(28,155,166,31,150),(29,155,166,21,100),(30,155,166,31,150),(31,155,166,21,100),(32,155,166,31,150),(33,155,166,21,100),(34,155,166,31,150),(35,155,166,21,100),(36,155,166,31,150),(37,155,166,21,100),(38,155,166,31,150),(39,155,166,21,100),(40,155,166,31,150),(41,155,166,21,100),(42,155,166,31,150),(43,155,166,21,100),(44,155,166,31,150),(45,155,166,21,100),(46,155,166,31,150),(47,155,166,21,100),(48,155,166,31,150),(49,155,166,21,100),(50,155,166,31,150),(51,155,166,21,100),(52,155,166,31,150),(53,155,166,21,100),(54,155,166,31,150),(55,155,166,21,100),(56,155,166,31,150),(57,155,166,26,150),(58,155,166,26,150),(59,155,166,26,150),(60,155,166,26,150),(61,155,166,26,150),(62,155,166,26,150),(63,155,166,26,150),(64,165,177,20,150),(65,165,177,16,200);
/*!40000 ALTER TABLE `CasualtyDoctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CasualtyPayments`
--

DROP TABLE IF EXISTS `CasualtyPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CasualtyPayments` (
  `cpId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `receiptCode` varchar(20) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `fcId` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  `amount` double DEFAULT '0',
  PRIMARY KEY (`cpId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  KEY `doctorId` (`doctorId`),
  KEY `fcId` (`fcId`),
  CONSTRAINT `CasualtyPayments_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `CasualtyPayments_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`),
  CONSTRAINT `CasualtyPayments_ibfk_3` FOREIGN KEY (`doctorId`) REFERENCES `user` (`uid`),
  CONSTRAINT `CasualtyPayments_ibfk_4` FOREIGN KEY (`fcId`) REFERENCES `fecilities` (`fcid`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CasualtyPayments`
--

LOCK TABLES `CasualtyPayments` WRITE;
/*!40000 ALTER TABLE `CasualtyPayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `CasualtyPayments` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DirectPO`
--

LOCK TABLES `DirectPO` WRITE;
/*!40000 ALTER TABLE `DirectPO` DISABLE KEYS */;
INSERT INTO `DirectPO` VALUES (1,2,3,44444,'2018-06-02',0,500,590,'2018-06-02 12:51:14','2018-06-02 12:51:14',58,58),(2,3,3,7777,'2018-06-12',0,800,944,'2018-06-12 08:38:36','2018-06-12 08:38:36',59,59),(3,15,3,34567,'2018-06-20',0,1300,1534,'2018-06-20 11:14:02','2018-06-20 11:14:02',59,59);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DirectPODetails`
--

LOCK TABLES `DirectPODetails` WRITE;
/*!40000 ALTER TABLE `DirectPODetails` DISABLE KEYS */;
INSERT INTO `DirectPODetails` VALUES (1,1,14,'78787878',50,0,'2018-06-02',12,10,500,590,1,'2018-06-02 12:51:14','2018-06-02 12:51:14',58,58),(2,NULL,20,'3434',30,0,'2018-06-02',12,11,330,389.4,1,'2018-06-02 12:51:46','2018-06-02 12:51:46',58,58),(3,2,11,'4545',20,0,'2018-06-12',45,40,800,944,1,'2018-06-12 08:38:36','2018-06-12 08:38:36',59,59),(4,3,15,'6456',10,0,'2018-06-20',10,10,100,118,1,'2018-06-20 11:14:02','2018-06-20 11:14:02',59,59),(5,3,33,'076456',40,0,'2018-06-20',30,30,1200,1416,1,'2018-06-20 11:14:02','2018-06-20 11:14:02',59,59);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DischargeSummary`
--

LOCK TABLES `DischargeSummary` WRITE;
/*!40000 ALTER TABLE `DischargeSummary` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dr_consultation`
--

LOCK TABLES `Dr_consultation` WRITE;
/*!40000 ALTER TABLE `Dr_consultation` DISABLE KEYS */;
INSERT INTO `Dr_consultation` VALUES (1,16,1,200,1,15,1),(2,16,4,300,1,15,1),(3,19,1,200,1,15,1),(4,19,4,500,1,15,1),(5,20,1,300,1,15,1),(6,21,1,300,1,15,1),(7,26,1,300,1,15,1),(8,26,4,500,1,5,1),(9,28,1,300,1,15,1),(10,28,4,1000,1,15,1),(11,29,1,0,1,0,1),(12,29,4,0,1,15,1),(13,31,1,200,1,15,1),(14,27,1,200,1,15,1),(15,27,4,200,1,15,1),(16,51,1,300,1,15,1),(17,53,1,300,1,15,1),(18,53,4,500,1,5,1),(19,36,1,300,1,15,1),(20,36,4,500,1,15,1),(21,30,1,300,1,15,1),(22,16,2,1000,1,15,1),(23,61,1,400,1,15,1);
/*!40000 ALTER TABLE `Dr_consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DueTransactions`
--

DROP TABLE IF EXISTS `DueTransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DueTransactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `receiptCode` varchar(20) DEFAULT NULL,
  `paidAmount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT '0',
  `advance` double DEFAULT '0',
  `cash` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  CONSTRAINT `DueTransactions_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `DueTransactions_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DueTransactions`
--

LOCK TABLES `DueTransactions` WRITE;
/*!40000 ALTER TABLE `DueTransactions` DISABLE KEYS */;
INSERT INTO `DueTransactions` VALUES (309,181,195,'BRM/18-19/1',200,'2018-06-20','2018-06-20 07:14:14','2018-06-20 07:14:14',1,NULL,0,0,200),(310,181,195,'BRM/18-19/2',200,'2018-06-20','2018-06-20 07:14:58','2018-06-20 07:14:58',1,NULL,0,0,200),(311,181,195,'BRM/18-19/3',350,'2018-06-20','2018-06-20 07:15:05','2018-06-20 07:15:05',1,NULL,0,0,350),(312,181,195,'BRM/18-19/5',12,'2018-06-20','2018-06-20 07:15:50','2018-06-20 07:15:50',1,NULL,0,12,0),(313,181,195,'BRM/18-19/6',300,'2018-06-20','2018-06-20 07:18:03','2018-06-20 07:18:03',1,NULL,0,300,0),(314,181,195,'BRM/18-19/7',450,'2018-06-20','2018-06-20 07:18:18','2018-06-20 07:18:18',1,NULL,0,450,0),(315,182,196,'BRM/18-19/9',300,'2018-06-20','2018-06-20 09:04:52','2018-06-20 09:04:52',59,NULL,0,0,300),(316,182,196,'BRM/18-19/10',12,'2018-06-20','2018-06-20 09:06:40','2018-06-20 09:06:40',59,NULL,0,0,12),(317,183,197,'BRM/18-19/11',200,'2018-06-20','2018-06-20 09:08:59','2018-06-20 09:08:59',59,NULL,0,0,200),(318,183,197,'BRM/18-19/13',450,'2018-06-20','2018-06-20 09:11:15','2018-06-20 09:11:15',59,NULL,0,0,450),(319,181,195,'BRM/18-19/16',500,'2018-06-20','2018-06-20 09:17:56','2018-06-20 09:17:56',59,NULL,0,500,0),(320,181,195,'BRM/18-19/17',1000,'2018-06-20','2018-06-20 09:17:56','2018-06-20 09:17:56',59,NULL,0,1000,0),(321,181,195,'BRM/18-19/19',60,'2018-06-20','2018-06-20 09:25:44','2018-06-20 09:25:44',59,NULL,0,60,0),(322,181,195,'BRM/18-19/20',50,'2018-06-20','2018-06-20 09:28:55','2018-06-20 09:28:55',59,NULL,0,50,0),(323,183,197,'BRM/18-19/21',12,'2018-06-20','2018-06-20 11:19:11','2018-06-20 11:19:11',59,NULL,0,12,0),(324,183,197,'BRM/18-19/22',12,'2018-06-20','2018-06-20 11:35:58','2018-06-20 11:35:58',59,NULL,0,12,0),(325,181,195,'BRM/18-19/23',12,'2018-06-20','2018-06-20 11:41:01','2018-06-20 11:41:01',59,NULL,0,12,0),(326,184,198,'BRM/18-19/24',200,'2018-06-20','2018-06-20 11:42:52','2018-06-20 11:42:52',1,NULL,0,0,200),(327,181,195,'BRM/18-19/25',300,'2018-06-20','2018-06-20 11:44:08','2018-06-20 11:44:08',1,NULL,0,300,0),(328,181,195,'BRM/18-19/26',300,'2018-06-20','2018-06-20 11:45:43','2018-06-20 11:45:43',1,NULL,0,300,0),(329,181,195,'BRM/18-19/27',12,'2018-06-20','2018-06-20 11:46:48','2018-06-20 11:46:48',59,NULL,0,12,0),(330,181,195,'BRM/18-19/28',12,'2018-06-20','2018-06-20 11:47:45','2018-06-20 11:47:45',59,NULL,0,12,0),(331,181,195,'BRM/18-19/29',300,'2018-06-20','2018-06-20 16:34:52','2018-06-20 16:34:52',1,NULL,0,300,0),(332,181,195,'BRM/18-19/30',200,'2018-06-20','2018-06-20 16:34:52','2018-06-20 16:34:52',1,NULL,0,200,0),(333,185,199,'BRM/18-19/31',200,'2018-06-21','2018-06-21 16:35:44','2018-06-21 16:35:44',1,NULL,0,0,200),(334,185,199,'BRM/18-19/32',200,'2018-06-21','2018-06-21 16:58:56','2018-06-21 16:58:56',1,NULL,0,0,200),(337,186,202,'BRM/18-19/35',200,'2018-06-22','2018-06-22 04:22:22','2018-06-22 04:22:22',1,NULL,0,0,200),(338,187,203,'BRM/18-19/36',200,'2018-06-22','2018-06-22 04:29:07','2018-06-22 04:29:07',59,NULL,0,0,200),(339,187,203,'BRM/18-19/37',500,'2018-06-22','2018-06-22 04:31:15','2018-06-22 04:31:15',59,NULL,0,0,500),(340,187,203,'BRM/18-19/37',500,'2018-06-22','2018-06-22 04:34:07','2018-06-22 04:34:07',59,NULL,0,0,0),(341,187,203,'BRM/18-19/39',700,'2018-06-22','2018-06-22 05:51:52','2018-06-22 05:51:52',1,NULL,0,700,0),(342,187,203,'BRM/18-19/40',310,'2018-06-22','2018-06-22 05:52:41','2018-06-22 05:52:41',1,NULL,0,0,310),(343,185,199,'BRM/18-19/32',300,'2018-06-22','2018-06-22 05:53:45','2018-06-22 05:53:45',59,NULL,0,0,0),(344,187,203,'BRM/18-19/42',310,'2018-06-22','2018-06-22 05:54:15','2018-06-22 05:54:15',1,NULL,0,0,310),(345,185,199,'BRM/18-19/32',100,'2018-06-22','2018-06-22 05:54:29','2018-06-22 05:54:29',59,NULL,0,0,0),(346,185,199,'BRM/18-19/44',150,'2018-06-22','2018-06-22 05:56:23','2018-06-22 05:56:23',59,NULL,0,100,50),(347,187,203,'BRM/18-19/46',310,'2018-06-22','2018-06-22 06:04:25','2018-06-22 06:04:25',1,NULL,0,0,310),(348,187,203,'BRM/18-19/48',200,'2018-06-22','2018-06-22 06:07:20','2018-06-22 06:07:20',1,NULL,0,0,200),(349,187,203,'BRM/18-19/49',210,'2018-06-22','2018-06-22 06:08:15','2018-06-22 06:08:15',1,NULL,0,0,210),(350,187,203,'BRM/18-19/51',285,'2018-06-22','2018-06-22 06:09:59','2018-06-22 06:09:59',1,NULL,0,0,285),(351,187,203,'BRM/18-19/52',1000,'2018-06-22','2018-06-22 06:11:18','2018-06-22 06:11:18',1,NULL,0,1000,0),(352,187,203,'BRM/18-19/53',300,'2018-06-22','2018-06-22 06:12:15','2018-06-22 06:12:15',1,NULL,0,0,300),(353,187,203,'BRM/18-19/54',100,'2018-06-22','2018-06-22 06:13:42','2018-06-22 06:13:42',1,NULL,0,0,100),(354,187,203,'BRM/18-19/56',300,'2018-06-22','2018-06-22 06:14:44','2018-06-22 06:14:44',1,NULL,0,0,300),(355,187,203,'BRM/18-19/56',190,'2018-06-22','2018-06-22 06:15:03','2018-06-22 06:15:03',59,NULL,0,0,0),(356,187,203,'BRM/18-19/54',250,'2018-06-22','2018-06-22 06:15:04','2018-06-22 06:15:04',59,NULL,0,0,0),(357,187,203,'BRM/18-19/53',275,'2018-06-22','2018-06-22 06:15:04','2018-06-22 06:15:04',59,NULL,0,0,0),(358,187,203,'BRM/18-19/51',275,'2018-06-22','2018-06-22 06:15:04','2018-06-22 06:15:04',59,NULL,0,0,0),(359,187,203,'BRM/18-19/49',175,'2018-06-22','2018-06-22 06:15:04','2018-06-22 06:15:04',59,NULL,0,0,0),(360,187,203,'BRM/18-19/48',475,'2018-06-22','2018-06-22 06:15:04','2018-06-22 06:15:04',59,NULL,0,0,0),(361,187,203,'BRM/18-19/46',1030,'2018-06-22','2018-06-22 06:15:04','2018-06-22 06:15:04',59,NULL,0,0,0),(362,187,203,'BRM/18-19/42',330,'2018-06-22','2018-06-22 06:15:04','2018-06-22 06:15:04',59,NULL,0,0,0),(363,187,203,'BRM/18-19/57',200,'2018-06-22','2018-06-22 06:22:42','2018-06-22 06:22:42',1,NULL,0,0,200),(364,187,203,'BRM/18-19/58',60,'2018-06-22','2018-06-22 06:22:53','2018-06-22 06:22:53',59,NULL,0,0,60),(365,187,203,'BRM/18-19/59',400,'2018-06-22','2018-06-22 06:23:45','2018-06-22 06:23:45',1,NULL,0,0,400),(366,187,203,'BRM/18-19/60',200,'2018-06-22','2018-06-22 06:24:23','2018-06-22 06:24:23',1,NULL,0,0,200),(367,187,203,'BRM/18-19/60',350,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(368,187,203,'BRM/18-19/57',150,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(369,187,203,'BRM/18-19/56',80,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(370,187,203,'BRM/18-19/54',175,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(371,187,203,'BRM/18-19/53',250,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(372,187,203,'BRM/18-19/51',265,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(373,187,203,'BRM/18-19/49',140,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(374,187,203,'BRM/18-19/48',250,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(375,187,203,'BRM/18-19/46',703.3333333333301,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(376,187,203,'BRM/18-19/42',1403.33333333333,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(377,187,203,'BRM/18-19/40',1233.3333333333396,'2018-06-22','2018-06-22 06:25:18','2018-06-22 06:25:18',59,NULL,0,0,0),(378,187,203,'BRM/18-19/62',500,'2018-06-22','2018-06-22 06:38:32','2018-06-22 06:38:32',59,NULL,0,0,500),(379,188,204,'BRM/18-19/67',200,'2018-06-22','2018-06-22 08:32:39','2018-06-22 08:32:39',1,NULL,0,0,200),(380,189,205,'BRM/18-19/68',300,'2018-06-22','2018-06-22 08:33:12','2018-06-22 08:33:12',59,NULL,0,0,300),(381,189,205,'BRM/18-19/73',24,'2018-06-22','2018-06-22 08:35:00','2018-06-22 08:35:00',59,NULL,0,24,0),(382,190,206,'BRM/18-19/74',300,'2018-06-22','2018-06-22 11:48:23','2018-06-22 11:48:23',59,NULL,0,0,300),(383,191,207,'BRM/18-19/75',200,'2018-06-22','2018-06-22 11:49:24','2018-06-22 11:49:24',59,NULL,0,0,200),(384,192,208,'BRM/18-19/76',300,'2018-06-22','2018-06-22 11:51:37','2018-06-22 11:51:37',59,NULL,0,0,300),(385,193,209,'BRM/18-19/76',200,'2018-06-22','2018-06-22 11:54:46','2018-06-22 11:54:46',59,NULL,0,0,200),(386,194,210,'BRM/18-19/76',300,'2018-06-22','2018-06-22 11:56:08','2018-06-22 11:56:08',59,NULL,0,0,300),(388,196,212,'BRM/18-19/76',200,'2018-06-22','2018-06-22 12:00:09','2018-06-22 12:00:09',59,NULL,0,0,200),(389,184,198,'BRM/18-19/77',24,'2018-06-22','2018-06-22 12:05:35','2018-06-22 12:05:35',59,NULL,0,0,24),(390,188,204,'BRM/18-19/71',200,'2018-06-22','2018-06-22 12:09:57','2018-06-22 12:09:57',1,NULL,0,0,200),(392,188,204,'BRM/18-19/71',800,'2018-06-22','2018-06-22 12:18:39','2018-06-22 12:18:39',1,NULL,0,0,800),(393,188,204,'BRM/18-19/79',400,'2018-06-22','2018-06-22 12:27:06','2018-06-22 12:27:06',1,NULL,0,0,400),(394,188,204,'BRM/18-19/80',200,'2018-06-22','2018-06-22 12:27:38','2018-06-22 12:27:38',1,NULL,0,0,200),(395,188,204,'BRM/18-19/80',200,'2018-06-22','2018-06-22 12:28:06','2018-06-22 12:28:06',1,NULL,0,0,200),(396,188,204,'BRM/18-19/81',4000,'2018-06-22','2018-06-22 13:20:28','2018-06-22 13:20:28',1,NULL,0,4000,0),(397,188,204,'BRM/18-19/83',2200,'2018-06-22','2018-06-22 13:22:34','2018-06-22 13:22:34',1,NULL,0,1000,1200),(398,188,204,'BRM/18-19/84',800,'2018-06-22','2018-06-22 13:23:51','2018-06-22 13:23:51',1,NULL,0,800,0),(399,189,205,'BRM/18-19/86',800,'2018-06-22','2018-06-22 13:37:50','2018-06-22 13:37:50',1,NULL,0,800,0),(400,189,205,'BRM/18-19/70',176,'2018-06-22','2018-06-22 13:37:50','2018-06-22 13:37:50',1,NULL,0,176,0),(401,184,215,'BRM/18-19/87',200,'2018-06-23','2018-06-23 00:25:59','2018-06-23 00:25:59',1,NULL,0,0,200),(402,184,215,'BRM/18-19/88',600,'2018-06-23','2018-06-23 00:26:28','2018-06-23 00:26:28',1,NULL,0,0,600),(403,186,216,'BRM/18-19/90',200,'2018-06-23','2018-06-23 02:50:19','2018-06-23 02:50:19',59,NULL,0,0,200),(404,194,217,'BRM/18-19/91',200,'2018-06-23','2018-06-23 02:53:48','2018-06-23 02:53:48',59,NULL,0,0,200),(405,193,219,'BRM/18-19/92',200,'2018-06-23','2018-06-23 02:55:57','2018-06-23 02:55:57',59,NULL,0,0,200),(406,192,218,'BRM/18-19/94',500,'2018-06-23','2018-06-23 03:00:27','2018-06-23 03:00:27',59,NULL,0,0,500),(407,192,218,'BRM/18-19/94',500,'2018-06-23','2018-06-23 03:01:21','2018-06-23 03:01:21',59,NULL,0,500,0),(408,192,218,'BRM/18-19/93',500,'2018-06-23','2018-06-23 03:01:21','2018-06-23 03:01:21',59,NULL,0,500,0),(409,192,218,'BRM/18-19/96',50,'2018-06-23','2018-06-23 03:04:12','2018-06-23 03:04:12',59,NULL,0,50,0),(410,192,218,'BRM/18-19/93',50,'2018-06-23','2018-06-23 03:04:12','2018-06-23 03:04:12',59,NULL,0,50,0),(411,186,216,'BRM/18-19/98',200,'2018-06-23','2018-06-23 03:06:42','2018-06-23 03:06:42',59,NULL,0,200,0),(412,186,216,'BRM/18-19/100',36,'2018-06-23','2018-06-23 03:09:01','2018-06-23 03:09:01',59,NULL,0,0,36),(413,194,217,'BRM/18-19/101',350,'2018-06-23','2018-06-23 03:11:26','2018-06-23 03:11:26',59,NULL,0,0,350),(414,194,217,'BRM/18-19/102',150,'2018-06-23','2018-06-23 03:12:12','2018-06-23 03:12:12',59,NULL,0,150,0),(415,184,215,'BRM/18-19/105',12,'2018-06-23','2018-06-23 03:28:32','2018-06-23 03:28:32',59,NULL,0,12,0),(416,193,219,'BRM/18-19/109',12,'2018-06-23','2018-06-23 04:41:09','2018-06-23 04:41:09',59,NULL,0,12,0),(417,188,204,'BRM/18-19/110',200,'2018-06-23','2018-06-23 04:44:14','2018-06-23 04:44:14',59,NULL,0,200,0),(418,185,199,'BRM/18-19/45',50,'2018-06-23','2018-06-23 04:48:10','2018-06-23 04:48:10',59,NULL,0,50,0),(419,185,199,'BRM/18-19/44',50,'2018-06-23','2018-06-23 04:48:10','2018-06-23 04:48:10',59,NULL,0,50,0),(420,185,199,'BRM/18-19/32',400,'2018-06-23','2018-06-23 04:48:10','2018-06-23 04:48:10',59,NULL,0,400,0),(421,183,197,'BRM/18-19/12',976,'2018-06-23','2018-06-23 04:51:28','2018-06-23 04:51:28',59,NULL,0,976,0),(422,198,220,'BRM/18-19/113',200,'2018-06-23','2018-06-23 04:52:55','2018-06-23 04:52:55',1,NULL,0,0,200),(423,199,221,'BRM/18-19/114',200,'2018-06-23','2018-06-23 04:56:14','2018-06-23 04:56:14',17,NULL,0,0,200);
/*!40000 ALTER TABLE `DueTransactions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExpenditureCategories`
--

LOCK TABLES `ExpenditureCategories` WRITE;
/*!40000 ALTER TABLE `ExpenditureCategories` DISABLE KEYS */;
INSERT INTO `ExpenditureCategories` VALUES (3,'Water','2018-06-12 10:39:27','2018-06-12 10:39:38',1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthSchemes`
--

LOCK TABLES `HealthSchemes` WRITE;
/*!40000 ALTER TABLE `HealthSchemes` DISABLE KEYS */;
INSERT INTO `HealthSchemes` VALUES (1,'NTR VAIDYA SEVA','Reimbursment','Government','2018-05-04 10:25:40','2018-05-04 10:25:40',15,15),(2,'AROGYA RAKSHA','Reimbursment','Government','2018-05-04 10:26:02','2018-05-04 10:26:02',15,15),(3,'EHS ( Employe health scheme )','Reimbursment','Government','2018-05-04 10:26:47','2018-05-04 10:26:47',15,15),(4,'VIPUL','Reimbursment','Insurance','2018-05-04 10:27:16','2018-05-04 10:27:16',15,15),(5,'PRIVATE','Cash','General','2018-05-10 07:13:25','2018-05-12 10:46:34',15,24);
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
  `notes` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`isId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  CONSTRAINT `InformationSheet_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `InformationSheet_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformationSheet`
--

LOCK TABLES `InformationSheet` WRITE;
/*!40000 ALTER TABLE `InformationSheet` DISABLE KEYS */;
INSERT INTO `InformationSheet` VALUES (33,183,197,'{\"notes\": \"Sample des other data sample data of desp\", \"Others\": \"1200\", \"userId\": \"1\", \"physician\": {\"paid\": \"true\", \"dr_id\": \"27\", \"amount\": \"2500\", \"dr_name\": \"DR.G.PRAVEENNATH\", \"remarks\": \"sample Data\", \"tempDate\": \"Sat Jun 23 2018 00:00:00 GMT+0530 (India Standard Time)\", \"visitCount\": \"1\", \"qualification\": \"DNB( PULUMONOLOGY ),MNAMS,FCCS\"}, \"ptdetails\": {\"age\": \"23\", \"city\": \"kkd\", \"name\": \"Neelam\", \"gender\": \"F\", \"mobile\": \"8342487978\", \"visitId\": \"197\", \"patientId\": \"183\", \"admit_date\": \"Wed Jun 20 2018 17:02:58 GMT+0530 (India Standard Time)\", \"schemeName\": \"PRIVATE\", \"father_name\": \"Haresh\", \"package_or_regular\": \"regular\", \"surgery_or_medical\": \"medical\", \"total_package_amount\": \"25000\"}, \"LabCharges\": \"5000\", \"OTMedicines\": \"1500\", \"paidDetails\": {\"paidAmount\": \"3674\", \"receivedAmount\": \"2000\"}, \"roomHistory\": [{\"bed_code\": \"BED 27\", \"noOfDays\": \"3\", \"$$hashKey\": \"object:3813\", \"enteredDate\": \"2018-06-20\", \"vacatedDate\": \"\", \"bed_loc_name\": \"General Ward ( Female )\"}], \"GeneralMedicines\": \"650\"}','2018-06-23 03:28:25','2018-06-23 03:28:25',1,1,'Sample des other data sample data of desp');
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
  `isPaid` varchar(100) DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `dateOfPayment` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`isdpId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  KEY `doctorId` (`doctorId`),
  CONSTRAINT `InformationSheetDoctorPayments_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `InformationSheetDoctorPayments_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`),
  CONSTRAINT `InformationSheetDoctorPayments_ibfk_3` FOREIGN KEY (`doctorId`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformationSheetDoctorPayments`
--

LOCK TABLES `InformationSheetDoctorPayments` WRITE;
/*!40000 ALTER TABLE `InformationSheetDoctorPayments` DISABLE KEYS */;
INSERT INTO `InformationSheetDoctorPayments` VALUES (140,183,197,27,1,2,2500,'true','sample Data','2018-06-23 00:00:00','2018-06-23 03:28:25','2018-06-23 03:28:25',1,NULL);
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
  `facilityId` int(11) DEFAULT NULL,
  `amountPaid` double DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `dateOfPayment` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`ispId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  CONSTRAINT `InformationSheetPayments_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `InformationSheetPayments_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InformationSheetPayments`
--

LOCK TABLES `InformationSheetPayments` WRITE;
/*!40000 ALTER TABLE `InformationSheetPayments` DISABLE KEYS */;
INSERT INTO `InformationSheetPayments` VALUES (84,183,197,10,13,1500,NULL,'2018-06-23 08:58:25','2018-06-23 03:28:25','2018-06-23 03:28:25',1,NULL),(85,183,197,10,14,650,NULL,'2018-06-23 08:58:25','2018-06-23 03:28:25','2018-06-23 03:28:25',1,NULL),(86,183,197,10,15,5000,NULL,'2018-06-23 08:58:25','2018-06-23 03:28:25','2018-06-23 03:28:25',1,NULL),(87,183,197,10,16,1200,NULL,'2018-06-23 08:58:25','2018-06-23 03:28:25','2018-06-23 03:28:25',1,NULL);
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
  `isPaid` varchar(100) DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `dateOfPayment` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
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
  `initial_diagnosis` varchar(100) DEFAULT NULL,
  `isBillSettled` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`inpatient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inpatient`
--

LOCK TABLES `Inpatient` WRITE;
/*!40000 ALTER TABLE `Inpatient` DISABLE KEYS */;
INSERT INTO `Inpatient` VALUES (50,'medical','regular',5,16,NULL,NULL,0,NULL,NULL,'2018-06-20 12:47:55',NULL,NULL,0,1,181,195,1,'Fever',0),(51,'medical','regular',5,27,NULL,NULL,0,NULL,NULL,'2018-06-20 17:02:58',NULL,NULL,0,59,183,197,5,'test',0),(52,'medical','regular',5,19,NULL,NULL,0,NULL,NULL,'2018-06-21 22:27:11',NULL,NULL,0,1,185,199,1,'Fever',0),(53,'surgery','package',5,26,30,34,8000,NULL,NULL,'2018-06-22 09:14:46','2018-06-22 17:10:04',NULL,1,59,182,196,3,'test',0),(54,'surgery','package',5,31,30,41,8000,NULL,NULL,'2018-06-22 12:06:19',NULL,NULL,0,59,187,203,7,'test',0),(55,'medical','regular',5,16,NULL,NULL,0,NULL,NULL,'2018-06-22 14:03:04',NULL,NULL,0,1,188,204,1,'Fever',0),(56,'surgery','regular',5,27,30,42,0,NULL,NULL,'2018-06-22 17:30:12',NULL,NULL,0,59,196,212,6,'check',0),(57,'medical','regular',5,27,NULL,NULL,0,NULL,NULL,'2018-06-23 08:24:30',NULL,NULL,0,59,192,218,3,'diagnosis',0);
/*!40000 ALTER TABLE `Inpatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OutsideReferrals`
--

DROP TABLE IF EXISTS `OutsideReferrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OutsideReferrals` (
  `orId` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `referralId` int(11) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `testName` varchar(32) DEFAULT NULL,
  `isCollected` tinyint(1) DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`orId`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  KEY `referralId` (`referralId`),
  KEY `doctorId` (`doctorId`),
  CONSTRAINT `OutsideReferrals_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `OutsideReferrals_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`),
  CONSTRAINT `OutsideReferrals_ibfk_3` FOREIGN KEY (`referralId`) REFERENCES `referral_master` (`ref_id`),
  CONSTRAINT `OutsideReferrals_ibfk_4` FOREIGN KEY (`doctorId`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OutsideReferrals`
--

LOCK TABLES `OutsideReferrals` WRITE;
/*!40000 ALTER TABLE `OutsideReferrals` DISABLE KEYS */;
INSERT INTO `OutsideReferrals` VALUES (1,181,195,46,33,'2018-06-01','mri',0,'2018-06-22 09:41:31','2018-06-22 09:41:31',17,NULL),(2,181,195,48,21,'2018-06-02','ECG',0,'2018-06-22 12:22:20','2018-06-22 12:22:20',17,NULL),(3,181,195,47,21,'2018-06-16','Sugar',0,'2018-06-22 12:24:23','2018-06-22 12:24:23',17,NULL),(4,181,195,48,37,'2018-06-23','mri',0,'2018-06-23 03:24:18','2018-06-23 03:24:18',17,NULL),(5,183,197,49,20,'2018-06-23','BP',0,'2018-06-23 03:46:33','2018-06-23 03:46:33',17,NULL);
/*!40000 ALTER TABLE `OutsideReferrals` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
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
INSERT INTO `RoomAllotment` VALUES (181,195,19,1000,'checkOut','2018-06-20 07:17:31','2018-06-20 09:15:04',1,59,'2018-06-20','2018-06-20'),(181,195,21,1000,'checkOut','2018-06-20 09:15:04','2018-06-20 09:15:44',59,59,'2018-06-20','2018-06-20'),(181,195,22,1000,'checkIn','2018-06-20 09:15:44','2018-06-20 09:15:44',59,59,'2018-06-20',NULL),(183,197,31,1000,'checkIn','2018-06-20 11:33:24','2018-06-20 11:33:24',59,59,'2018-06-20',NULL),(185,199,27,1000,'checkIn','2018-06-21 16:57:42','2018-06-21 16:57:42',1,1,'2018-06-21',NULL),(182,196,28,1000,'checkOut','2018-06-22 03:45:36','2018-06-22 11:40:24',59,59,'2018-06-22','2018-06-22'),(187,203,20,1000,'checkOut','2018-06-22 06:37:11','2018-06-22 06:59:40',59,59,'2018-06-22','2018-06-22'),(187,203,25,1000,'checkOut','2018-06-22 06:59:40','2018-06-22 07:02:31',59,59,'2018-06-22','2018-06-22'),(187,203,20,1000,'checkOut','2018-06-22 07:02:31','2018-06-22 07:15:07',59,59,'2018-06-22','2018-06-22'),(187,203,23,4454,'checkOut','2018-06-22 07:15:07','2018-06-22 07:15:51',59,59,'2018-06-22','2018-06-22'),(187,203,20,1000,'checkOut','2018-06-22 07:15:51','2018-06-22 07:21:13',59,59,'2018-06-22','2018-06-22'),(187,203,24,1000,'checkIn','2018-06-22 07:21:13','2018-06-22 07:21:13',59,59,'2018-06-22',NULL),(188,204,23,4454,'checkIn','2018-06-22 08:33:24','2018-06-22 08:33:24',1,1,'2018-06-22',NULL),(196,212,25,1000,'checkIn','2018-06-22 12:00:45','2018-06-22 12:00:45',59,59,'2018-06-22',NULL),(192,218,21,1000,'checkIn','2018-06-23 02:55:02','2018-06-23 02:55:02',59,59,'2018-06-23',NULL);
/*!40000 ALTER TABLE `RoomAllotment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WalletBalance`
--

DROP TABLE IF EXISTS `WalletBalance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WalletBalance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientId` int(11) DEFAULT NULL,
  `visitId` int(11) DEFAULT NULL,
  `Advance` double DEFAULT '0',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int(11) DEFAULT NULL,
  `updatedUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientId` (`patientId`),
  KEY `visitId` (`visitId`),
  CONSTRAINT `WalletBalance_ibfk_1` FOREIGN KEY (`patientId`) REFERENCES `patient_info` (`patient_id`),
  CONSTRAINT `WalletBalance_ibfk_2` FOREIGN KEY (`visitId`) REFERENCES `patient_visit` (`p_visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WalletBalance`
--

LOCK TABLES `WalletBalance` WRITE;
/*!40000 ALTER TABLE `WalletBalance` DISABLE KEYS */;
INSERT INTO `WalletBalance` VALUES (14,181,195,4104,'2018-06-20 07:15:32','2018-06-20 16:34:52',1,1),(15,183,197,0,'2018-06-20 09:11:30','2018-06-23 04:51:28',59,NULL),(16,182,196,100,'2018-06-20 09:21:44','2018-06-20 09:21:44',59,NULL),(17,187,203,0,'2018-06-22 04:32:26','2018-06-22 06:25:18',59,59),(18,185,199,0,'2018-06-22 05:53:31','2018-06-23 04:48:10',59,59),(19,189,205,0,'2018-06-22 08:34:39','2018-06-22 13:37:51',59,NULL),(20,188,204,0,'2018-06-22 13:20:08','2018-06-23 04:44:14',1,1),(21,184,215,4988,'2018-06-23 02:50:09','2018-06-23 03:28:32',1,NULL),(22,192,218,0,'2018-06-23 03:00:46','2018-06-23 03:04:12',59,59),(23,186,216,0,'2018-06-23 03:06:25','2018-06-23 03:06:42',59,NULL),(24,194,217,0,'2018-06-23 03:12:04','2018-06-23 03:12:12',59,NULL),(25,193,219,88,'2018-06-23 04:40:32','2018-06-23 04:41:09',59,NULL);
/*!40000 ALTER TABLE `WalletBalance` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_inward_register`
--

LOCK TABLES `asset_inward_register` WRITE;
/*!40000 ALTER TABLE `asset_inward_register` DISABLE KEYS */;
INSERT INTO `asset_inward_register` VALUES (1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-05-08',15,3,10,1,10,1500.0000),(2,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-05-08',15,3,20,11,30,350.0000),(3,NULL,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,'2018-05-18',1,2,1,31,31,1.0000),(4,NULL,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,'2018-05-18',1,2,1,32,32,1.0000),(5,NULL,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,'2018-05-18',1,2,1,33,33,1.0000),(6,NULL,NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,'2018-05-18',1,2,1,34,34,1.0000),(7,NULL,NULL,NULL,NULL,NULL,36,NULL,NULL,NULL,'2018-05-18',1,2,2,35,36,2.0000),(8,NULL,NULL,NULL,NULL,NULL,37,NULL,NULL,NULL,'2018-05-18',1,2,1,37,37,1.0000),(9,NULL,NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,'2018-05-18',1,2,1,38,38,1.0000),(10,NULL,NULL,NULL,NULL,NULL,39,NULL,NULL,NULL,'2018-05-18',1,2,1,39,39,1.0000),(11,NULL,NULL,NULL,NULL,NULL,40,NULL,NULL,NULL,'2018-05-18',1,2,1,40,40,1.0000),(12,NULL,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,'2018-05-18',1,3,1,41,41,1.0000),(13,NULL,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,'2018-05-18',1,3,1,42,42,1.0000),(14,NULL,NULL,NULL,NULL,NULL,46,NULL,NULL,NULL,'2018-05-18',1,3,1,43,43,1.0000),(15,NULL,NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,'2018-05-18',1,3,1,44,44,1.0000),(16,NULL,NULL,NULL,NULL,NULL,48,NULL,NULL,NULL,'2018-05-18',1,3,4,45,48,4.0000),(17,NULL,NULL,NULL,NULL,NULL,49,NULL,NULL,NULL,'2018-05-18',1,3,1,49,49,1.0000),(18,NULL,NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'2018-05-18',1,3,1,50,50,1.0000),(19,NULL,NULL,NULL,NULL,NULL,51,NULL,NULL,NULL,'2018-05-18',1,3,1,51,51,1.0000),(20,NULL,NULL,NULL,NULL,NULL,52,NULL,NULL,NULL,'2018-05-18',1,3,1,52,52,1.0000),(21,NULL,NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,'2018-05-18',1,3,2,53,54,2.0000),(22,NULL,NULL,NULL,NULL,NULL,53,NULL,NULL,NULL,'2018-05-18',1,3,1,55,55,1.0000),(23,NULL,NULL,NULL,NULL,NULL,54,NULL,NULL,NULL,'2018-05-18',1,3,1,56,56,1.0000),(24,NULL,NULL,NULL,NULL,NULL,55,NULL,NULL,NULL,'2018-05-18',1,3,1,57,57,1.0000),(25,NULL,NULL,NULL,NULL,NULL,56,NULL,NULL,NULL,'2018-05-18',1,3,1,58,58,1.0000),(26,NULL,NULL,NULL,NULL,NULL,57,NULL,NULL,NULL,'2018-05-18',1,3,1,59,59,1.0000),(27,NULL,NULL,NULL,NULL,NULL,58,NULL,NULL,NULL,'2018-05-18',1,3,1,60,60,1.0000),(28,NULL,NULL,NULL,NULL,NULL,59,NULL,NULL,NULL,'2018-05-18',1,3,2,61,62,2.0000),(29,NULL,NULL,NULL,NULL,NULL,60,NULL,NULL,NULL,'2018-05-18',1,3,3,63,65,3.0000),(30,NULL,NULL,NULL,NULL,NULL,61,NULL,NULL,NULL,'2018-05-18',1,3,2,66,67,2.0000),(31,NULL,NULL,NULL,NULL,NULL,62,NULL,NULL,NULL,'2018-05-18',1,3,1,68,68,1.0000),(32,NULL,NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,'2018-05-18',1,3,1,69,69,1.0000),(33,NULL,NULL,NULL,NULL,NULL,64,NULL,NULL,NULL,'2018-05-18',1,3,2,70,71,2.0000),(34,NULL,NULL,NULL,NULL,NULL,65,NULL,NULL,NULL,'2018-05-18',1,3,1,72,72,1.0000),(35,NULL,NULL,NULL,NULL,NULL,66,NULL,NULL,NULL,'2018-05-18',1,3,1,73,73,1.0000),(36,NULL,NULL,NULL,NULL,NULL,67,NULL,NULL,NULL,'2018-05-18',1,3,2,74,75,2.0000),(37,NULL,NULL,NULL,NULL,NULL,68,NULL,NULL,NULL,'2018-05-18',1,3,2,76,77,2.0000),(38,NULL,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,'2018-05-18',1,3,1,78,78,1.0000),(39,NULL,NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,'2018-05-18',1,3,1,79,79,1.0000),(40,NULL,NULL,NULL,NULL,NULL,36,NULL,NULL,NULL,'2018-05-18',1,3,2,80,81,2.0000),(41,NULL,NULL,NULL,NULL,NULL,37,NULL,NULL,NULL,'2018-05-18',1,3,1,82,82,1.0000),(42,NULL,NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,'2018-05-18',1,3,1,83,83,1.0000),(43,NULL,NULL,NULL,NULL,NULL,39,NULL,NULL,NULL,'2018-05-18',1,3,1,84,84,1.0000),(44,NULL,NULL,NULL,NULL,NULL,40,NULL,NULL,NULL,'2018-05-18',1,3,1,85,85,1.0000),(45,NULL,NULL,NULL,NULL,NULL,41,NULL,NULL,NULL,'2018-05-18',1,3,1,86,86,1.0000),(46,NULL,NULL,NULL,NULL,NULL,42,NULL,NULL,NULL,'2018-05-18',1,3,1,87,87,1.0000),(47,NULL,NULL,NULL,NULL,NULL,43,NULL,NULL,NULL,'2018-05-18',1,3,1,88,88,1.0000),(48,NULL,NULL,NULL,NULL,NULL,44,NULL,NULL,NULL,'2018-05-18',1,3,1,89,89,1.0000),(49,NULL,NULL,NULL,NULL,NULL,45,NULL,NULL,NULL,'2018-05-18',1,3,1,90,90,1.0000),(50,NULL,NULL,NULL,NULL,NULL,69,NULL,NULL,NULL,'2018-05-23',15,3,1,91,91,1.0000),(51,NULL,NULL,NULL,NULL,NULL,70,NULL,NULL,NULL,'2018-05-23',15,3,1,92,92,1.0000),(52,NULL,NULL,NULL,NULL,NULL,71,NULL,NULL,NULL,'2018-05-23',15,3,1,93,93,1.0000),(53,NULL,NULL,NULL,NULL,NULL,72,NULL,NULL,NULL,'2018-05-23',15,3,1,94,94,1.0000),(54,NULL,NULL,NULL,NULL,NULL,74,NULL,NULL,NULL,'2018-05-23',15,3,1,95,95,1.0000),(55,NULL,NULL,NULL,NULL,NULL,73,NULL,NULL,NULL,'2018-05-23',15,3,1,96,96,1.0000),(56,NULL,NULL,NULL,NULL,NULL,81,NULL,NULL,NULL,'2018-05-23',1,3,1,97,97,1.0000),(57,NULL,NULL,NULL,NULL,NULL,76,NULL,NULL,NULL,'2018-05-23',15,3,1,98,98,1.0000),(58,NULL,NULL,NULL,NULL,NULL,77,NULL,NULL,NULL,'2018-05-23',15,3,1,99,99,1.0000),(59,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'2018-05-23',15,3,1,100,100,1.0000),(60,NULL,NULL,NULL,NULL,NULL,75,NULL,NULL,NULL,'2018-05-23',15,3,1,101,101,1.0000),(61,NULL,NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,'2018-05-23',15,3,1,102,102,1.0000),(62,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-05-23',15,3,1,103,103,1.0000),(63,NULL,NULL,NULL,NULL,NULL,93,NULL,NULL,NULL,'2018-05-23',1,3,2,104,105,2.0000),(64,NULL,NULL,NULL,NULL,NULL,78,NULL,NULL,NULL,'2018-05-23',1,3,1,106,106,1.0000),(65,NULL,NULL,NULL,NULL,NULL,82,NULL,NULL,NULL,'2018-05-23',1,3,4,107,110,4.0000),(66,NULL,NULL,NULL,NULL,NULL,83,NULL,NULL,NULL,'2018-05-23',1,3,3,111,113,3.0000),(67,NULL,NULL,NULL,NULL,NULL,79,NULL,NULL,NULL,'2018-05-23',1,3,1,114,114,1.0000),(68,NULL,NULL,NULL,NULL,NULL,84,NULL,NULL,NULL,'2018-05-23',1,3,1,115,115,1.0000),(69,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-05-23',1,3,4,116,119,4.0000),(70,NULL,NULL,NULL,NULL,NULL,85,NULL,NULL,NULL,'2018-05-23',1,3,1,120,120,1.0000),(71,NULL,NULL,NULL,NULL,NULL,86,NULL,NULL,NULL,'2018-05-23',1,3,2,121,122,2.0000),(72,NULL,NULL,NULL,NULL,NULL,87,NULL,NULL,NULL,'2018-05-23',1,3,1,123,123,1.0000),(73,NULL,NULL,NULL,NULL,NULL,88,NULL,NULL,NULL,'2018-05-23',1,3,2,124,125,2.0000),(74,NULL,NULL,NULL,NULL,NULL,89,NULL,NULL,NULL,'2018-05-23',1,3,1,126,126,1.0000),(75,NULL,NULL,NULL,NULL,NULL,90,NULL,NULL,NULL,'2018-05-23',1,3,1,127,127,1.0000),(76,NULL,NULL,NULL,NULL,NULL,91,NULL,NULL,NULL,'2018-05-23',1,3,1,128,128,1.0000),(77,NULL,NULL,NULL,NULL,NULL,92,NULL,NULL,NULL,'2018-05-23',1,3,1,129,129,1.0000),(78,NULL,NULL,NULL,NULL,NULL,94,NULL,NULL,NULL,'2018-05-23',1,3,2,130,131,2.0000),(79,NULL,NULL,NULL,NULL,NULL,95,NULL,NULL,NULL,'2018-05-23',1,3,2,132,133,2.0000),(80,NULL,NULL,NULL,NULL,NULL,96,NULL,NULL,NULL,'2018-05-23',1,3,1,134,134,1.0000),(81,NULL,NULL,NULL,NULL,NULL,97,NULL,NULL,NULL,'2018-05-23',1,3,1,135,135,1.0000),(82,NULL,NULL,NULL,NULL,NULL,98,NULL,NULL,NULL,'2018-05-23',1,3,1,136,136,1.0000),(83,NULL,NULL,NULL,NULL,NULL,99,NULL,NULL,NULL,'2018-05-23',1,3,1,137,137,1.0000),(84,NULL,NULL,NULL,NULL,NULL,100,NULL,NULL,NULL,'2018-05-23',1,3,1,138,138,1.0000),(85,NULL,NULL,NULL,NULL,NULL,101,NULL,NULL,NULL,'2018-05-23',1,3,1,139,139,1.0000),(86,NULL,NULL,NULL,NULL,NULL,102,NULL,NULL,NULL,'2018-05-23',1,3,2,140,141,2.0000),(87,NULL,NULL,NULL,NULL,NULL,103,NULL,NULL,NULL,'2018-05-23',1,3,2,142,143,2.0000),(88,NULL,NULL,NULL,NULL,NULL,104,NULL,NULL,NULL,'2018-05-23',1,3,1,144,144,1.0000),(89,NULL,NULL,NULL,NULL,NULL,105,NULL,NULL,NULL,'2018-05-23',1,3,1,145,145,1.0000),(90,1,1,'1111','2018-06-02',14.16,1,1,1,14.16,'2018-06-02',1,3,2,146,146,NULL),(91,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,'2018-06-02',58,3,5,147,151,300.0000),(92,1,1,'54345345','2018-06-04',14.16,1,0,1,14.16,'2018-06-04',1,3,2,152,152,NULL),(93,3,3,'112233','2018-06-12',155.76,2,10,10,141.6,'1970-01-01',1,3,20,153,162,NULL),(94,3,3,'112233','2018-06-12',155.76,1,1,1,14.16,'1970-01-01',1,3,2,163,163,NULL),(95,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,'2018-06-12',59,3,1,164,164,1000.0000),(96,9,5,'445566','2018-06-20',56.64,1,3,2,28.32,'1970-01-01',1,3,5,165,166,NULL),(97,9,5,'445566','2018-06-20',56.64,2,3,2,28.32,'1970-01-01',1,3,5,167,168,NULL),(98,9,5,'665544','2018-06-20',28.32,1,2,1,14.16,'1970-01-01',1,3,5,169,169,NULL),(99,9,5,'665544','2018-06-20',28.32,2,2,1,14.16,'1970-01-01',1,3,5,170,170,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_outward_register`
--

LOCK TABLES `asset_outward_register` WRITE;
/*!40000 ALTER TABLE `asset_outward_register` DISABLE KEYS */;
INSERT INTO `asset_outward_register` VALUES (1,3,2,32,1,1,1,'2018-05-18 04:55:57',1,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(2,3,2,33,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(3,3,2,34,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(4,3,2,35,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(5,3,2,36,2,2,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(6,3,2,37,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(7,3,2,38,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(8,3,2,40,1,1,1,'2018-05-18 04:58:37',2,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(9,3,2,41,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(10,3,2,42,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(11,3,2,43,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(12,3,2,44,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(13,3,2,45,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(14,3,2,46,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(15,3,2,47,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(16,3,2,48,4,4,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(17,3,2,49,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(18,3,2,50,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(19,3,2,51,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(20,3,2,52,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(21,3,2,27,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(22,3,2,53,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(23,3,2,54,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(24,3,2,55,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(25,3,2,56,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(26,3,2,57,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(27,3,2,58,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(28,3,2,59,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(29,3,2,60,3,3,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(30,3,2,61,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(31,3,2,62,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(32,3,2,63,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(33,3,2,64,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(34,3,2,65,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(35,3,2,66,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(36,3,2,67,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(37,3,2,68,2,2,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(38,3,2,39,1,1,1,'2018-05-18 05:08:10',3,'BRM MEDICAL STORE','OT MODULAR THEATRE'),(39,3,7,69,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(40,3,7,70,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(41,3,7,71,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(42,3,7,72,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(43,3,7,74,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(44,3,7,73,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(45,3,7,81,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(46,3,7,76,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(47,3,7,77,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(48,3,7,7,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(49,3,7,75,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(50,3,7,31,1,1,1,'2018-05-23 04:48:39',4,'BRM MEDICAL STORE','LAB'),(51,3,7,1,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(52,3,7,93,2,2,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(53,3,7,78,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(54,3,7,82,4,4,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(55,3,7,83,3,3,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(56,3,7,79,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(57,3,7,84,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(58,3,7,2,4,4,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(59,3,7,85,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(60,3,7,86,2,2,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(61,3,7,87,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(62,3,7,88,2,2,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(63,3,7,89,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(64,3,7,90,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(65,3,7,91,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(66,3,7,92,1,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(67,3,7,94,2,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(68,3,7,95,2,1,1,'2018-05-23 04:50:19',5,'BRM MEDICAL STORE','LAB'),(69,3,7,94,1,1,1,'2018-05-23 05:15:14',6,'BRM MEDICAL STORE','LAB'),(70,3,7,95,1,1,1,'2018-05-23 05:18:45',7,'BRM MEDICAL STORE','LAB'),(71,3,8,96,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(72,3,8,97,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(73,3,8,98,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(74,3,8,99,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(75,3,8,100,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(76,3,8,101,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(77,3,8,102,2,2,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(78,3,8,103,2,2,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(79,3,8,104,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(80,3,8,105,1,1,1,'2018-05-23 06:49:23',8,'BRM MEDICAL STORE','X RAY LAB'),(81,3,1,3,5,3,58,'2018-06-02 06:07:53',9,'BRM MEDICAL STORE','CASUALITY'),(82,3,5,1,2,1,1,'2018-06-04 09:54:33',10,'BRM MEDICAL STORE','ICU MEDICALS'),(83,3,5,3,2,1,59,'2018-06-12 01:02:19',11,'BRM MEDICAL STORE','ICU MEDICALS'),(84,3,7,4,1,1,59,'2018-06-20 04:31:29',12,'BRM MEDICAL STORE','LAB');
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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_sequence_nos`
--

LOCK TABLES `asset_sequence_nos` WRITE;
/*!40000 ALTER TABLE `asset_sequence_nos` DISABLE KEYS */;
INSERT INTO `asset_sequence_nos` VALUES (1,NULL,1,1),(2,NULL,1,2),(3,NULL,1,3),(4,NULL,1,4),(5,NULL,1,5),(6,NULL,1,6),(7,NULL,1,7),(8,NULL,1,8),(9,NULL,1,9),(10,NULL,1,10),(11,NULL,2,11),(12,NULL,2,12),(13,NULL,2,13),(14,NULL,2,14),(15,NULL,2,15),(16,NULL,2,16),(17,NULL,2,17),(18,NULL,2,18),(19,NULL,2,19),(20,NULL,2,20),(21,NULL,2,21),(22,NULL,2,22),(23,NULL,2,23),(24,NULL,2,24),(25,NULL,2,25),(26,NULL,2,26),(27,NULL,2,27),(28,NULL,2,28),(29,NULL,2,29),(30,NULL,2,30),(31,NULL,32,31),(32,NULL,33,32),(33,NULL,34,33),(34,NULL,35,34),(35,NULL,36,35),(36,NULL,36,36),(37,NULL,37,37),(38,NULL,38,38),(39,NULL,39,39),(40,NULL,40,40),(41,NULL,32,41),(42,NULL,33,42),(43,NULL,46,43),(44,NULL,47,44),(45,NULL,48,45),(46,NULL,48,46),(47,NULL,48,47),(48,NULL,48,48),(49,NULL,49,49),(50,NULL,50,50),(51,NULL,51,51),(52,NULL,52,52),(53,NULL,27,53),(54,NULL,27,54),(55,NULL,53,55),(56,NULL,54,56),(57,NULL,55,57),(58,NULL,56,58),(59,NULL,57,59),(60,NULL,58,60),(61,NULL,59,61),(62,NULL,59,62),(63,NULL,60,63),(64,NULL,60,64),(65,NULL,60,65),(66,NULL,61,66),(67,NULL,61,67),(68,NULL,62,68),(69,NULL,63,69),(70,NULL,64,70),(71,NULL,64,71),(72,NULL,65,72),(73,NULL,66,73),(74,NULL,67,74),(75,NULL,67,75),(76,NULL,68,76),(77,NULL,68,77),(78,NULL,34,78),(79,NULL,35,79),(80,NULL,36,80),(81,NULL,36,81),(82,NULL,37,82),(83,NULL,38,83),(84,NULL,39,84),(85,NULL,40,85),(86,NULL,41,86),(87,NULL,42,87),(88,NULL,43,88),(89,NULL,44,89),(90,NULL,45,90),(91,NULL,69,91),(92,NULL,70,92),(93,NULL,71,93),(94,NULL,72,94),(95,NULL,74,95),(96,NULL,73,96),(97,NULL,81,97),(98,NULL,76,98),(99,NULL,77,99),(100,NULL,7,100),(101,NULL,75,101),(102,NULL,31,102),(103,NULL,1,103),(104,NULL,93,104),(105,NULL,93,105),(106,NULL,78,106),(107,NULL,82,107),(108,NULL,82,108),(109,NULL,82,109),(110,NULL,82,110),(111,NULL,83,111),(112,NULL,83,112),(113,NULL,83,113),(114,NULL,79,114),(115,NULL,84,115),(116,NULL,2,116),(117,NULL,2,117),(118,NULL,2,118),(119,NULL,2,119),(120,NULL,85,120),(121,NULL,86,121),(122,NULL,86,122),(123,NULL,87,123),(124,NULL,88,124),(125,NULL,88,125),(126,NULL,89,126),(127,NULL,90,127),(128,NULL,91,128),(129,NULL,92,129),(130,NULL,94,130),(131,NULL,94,131),(132,NULL,95,132),(133,NULL,95,133),(134,NULL,96,134),(135,NULL,97,135),(136,NULL,98,136),(137,NULL,99,137),(138,NULL,100,138),(139,NULL,101,139),(140,NULL,102,140),(141,NULL,102,141),(142,NULL,103,142),(143,NULL,103,143),(144,NULL,104,144),(145,NULL,105,145),(146,1,1,146),(147,NULL,3,147),(148,NULL,3,148),(149,NULL,3,149),(150,NULL,3,150),(151,NULL,3,151),(152,1,1,152),(153,3,2,153),(154,3,2,154),(155,3,2,155),(156,3,2,156),(157,3,2,157),(158,3,2,158),(159,3,2,159),(160,3,2,160),(161,3,2,161),(162,3,2,162),(163,3,1,163),(164,NULL,4,164),(165,5,1,165),(166,5,1,166),(167,5,2,167),(168,5,2,168),(169,5,1,169),(170,5,2,170);
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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_stock_register`
--

LOCK TABLES `asset_stock_register` WRITE;
/*!40000 ALTER TABLE `asset_stock_register` DISABLE KEYS */;
INSERT INTO `asset_stock_register` VALUES (12,3,32,0),(13,3,33,0),(14,3,46,0),(15,3,47,0),(16,3,48,0),(17,3,49,0),(18,3,50,0),(19,3,51,0),(20,3,52,0),(21,3,27,0),(22,3,53,0),(23,3,54,0),(24,3,55,0),(25,3,56,0),(26,3,57,0),(27,3,58,0),(28,3,59,0),(29,3,60,0),(30,3,61,0),(31,3,62,0),(32,3,63,0),(33,3,64,0),(34,3,65,0),(35,3,66,0),(36,3,67,0),(37,3,68,0),(38,3,34,0),(39,3,35,0),(40,3,36,0),(41,3,37,0),(42,3,38,0),(43,3,39,0),(44,3,40,0),(45,3,41,0),(46,3,42,0),(47,3,43,0),(48,3,44,0),(49,3,45,0),(50,2,32,1),(51,2,33,1),(52,2,34,1),(53,2,35,1),(54,2,36,2),(55,2,37,1),(56,2,38,1),(57,2,40,1),(58,2,41,1),(59,2,42,1),(60,2,43,1),(61,2,44,1),(62,2,45,1),(63,2,46,1),(64,2,47,1),(65,2,48,4),(66,2,49,1),(67,2,50,1),(68,2,51,1),(69,2,52,1),(70,2,27,2),(71,2,53,1),(72,2,54,1),(73,2,55,1),(74,2,56,1),(75,2,57,1),(76,2,58,1),(77,2,59,2),(78,2,60,3),(79,2,61,2),(80,2,62,1),(81,2,63,1),(82,2,64,2),(83,2,65,1),(84,2,66,1),(85,2,67,2),(86,2,68,2),(87,2,39,1),(88,3,69,0),(89,3,70,0),(90,3,71,0),(91,3,72,0),(92,3,74,0),(93,3,73,0),(94,3,81,0),(95,3,76,0),(96,3,77,0),(97,3,7,0),(98,3,75,0),(99,3,31,0),(100,3,1,5),(101,3,93,0),(102,3,78,0),(103,3,82,0),(104,3,83,0),(105,3,79,0),(106,3,84,0),(107,3,2,13),(108,3,85,0),(109,3,86,0),(110,3,87,0),(111,3,88,0),(112,3,89,0),(113,3,90,0),(114,3,91,0),(115,3,92,0),(116,3,94,0),(117,3,95,0),(118,7,69,1),(119,7,70,1),(120,7,71,1),(121,7,72,1),(122,7,74,1),(123,7,73,1),(124,7,81,1),(125,7,76,1),(126,7,77,1),(127,7,7,1),(128,7,75,1),(129,7,31,1),(130,7,1,1),(131,7,93,2),(132,7,78,1),(133,7,82,4),(134,7,83,3),(135,7,79,1),(136,7,84,1),(137,7,2,4),(138,7,85,1),(139,7,86,2),(140,7,87,1),(141,7,88,2),(142,7,89,1),(143,7,90,1),(144,7,91,1),(145,7,92,1),(146,7,94,2),(147,7,95,2),(148,3,96,0),(149,3,97,0),(150,3,98,0),(151,3,99,0),(152,3,100,0),(153,3,101,0),(154,3,102,0),(155,3,103,0),(156,3,104,0),(157,3,105,0),(158,8,96,1),(159,8,97,1),(160,8,98,1),(161,8,99,1),(162,8,100,1),(163,8,101,1),(164,8,102,2),(165,8,103,2),(166,8,104,1),(167,8,105,1),(168,3,3,1),(169,1,3,3),(170,5,1,1),(171,3,4,0),(172,5,3,1),(173,7,4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_podata`
--

LOCK TABLES `assets_podata` WRITE;
/*!40000 ALTER TABLE `assets_podata` DISABLE KEYS */;
INSERT INTO `assets_podata` VALUES (1,1,'Fan',NULL,2,NULL,12,12,1,18,2),(2,2,'Bulbs and tubes',NULL,20,NULL,12,12,2,18,0),(3,2,'Bulbs and tubes',NULL,20,NULL,12,12,3,18,10),(4,1,'Fan',NULL,2,NULL,12,12,3,18,1),(5,3,'Cloths',NULL,5,NULL,200,180,4,18,0),(6,1,'Fan',NULL,5,NULL,12,12,5,18,3),(7,2,'Bulbs and tubes',NULL,5,NULL,12,12,5,18,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_pos`
--

LOCK TABLES `assets_pos` WRITE;
/*!40000 ALTER TABLE `assets_pos` DISABLE KEYS */;
INSERT INTO `assets_pos` VALUES (1,'2018-06-02',1,'Received',58,24,28.32),(2,'1970-01-01',2,'Issued',1,240,283.2),(3,'1970-01-01',3,'Issued',59,264,311.52),(4,'1970-01-01',4,'Issued',59,900,1062),(5,'1970-01-01',9,'Issued',59,120,141.6);
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
INSERT INTO `bed_master` VALUES (5,'BED 12',8,'CASUALITY','Off day 500\nFull day 1000',500.0000),(6,'BED 13',8,'CASUALITY','Off day 500\nFull day 1000',500.0000),(7,'BED 14',8,'CASUALITY','Off day 500',500.0000),(8,'BED 1',4,'I.C.U ROOM ( 1 )','ICU Rooms',3800.0000),(9,'BED 2',4,'I.C.U ROOM ( 1 )','ICU Room',3800.0000),(10,'BED 3',4,'I.C.U ROOM ( 1 )','ICU Room',3800.0000),(11,'BED 4',4,'I.C.U ROOM ( 1 )','ICU Room',3800.0000),(12,'BED 5',9,'I.C.U ROOM ( 2 )','ICU Room',3800.0000),(13,'BED 6',9,'I.C.U ROOM ( 2 )','ICU Room',3800.0000),(14,'BED 7',9,'I.C.U ROOM ( 2 )','ICU Room',3800.0000),(15,'BED 8',6,'Special Room ( 1 )','A/C  - 2500\nNON A/C - 1800',1800.0000),(16,'BED 9',11,'Special Room ( 2 )','A/C  - 2500\nNON A/C  - 1800',1800.0000),(17,'BED 10',12,'Special Room ( 3 )','A/C  - 2500\nNON A/C  - 1800',1800.0000),(18,'BED 11',13,'Special Room ( 4 )','A/C   - 2500\nNON A/C  - 1800',1800.0000),(19,'BED 15',5,'General ward ( MALE )','Per day - 1000',1000.0000),(20,'BED 16',5,'General ward ( MALE )','Per day 1000',1000.0000),(21,'BED 17',5,'General ward ( MALE )','Per day 1000',1000.0000),(22,'BED 18',5,'General ward ( MALE )','Per day 1000',1000.0000),(23,'BED 19',5,'General ward ( MALE )','Per day 1000',4454.0000),(24,'BED 20',5,'General ward ( MALE )','Per day 1000',1000.0000),(25,'BED 21',5,'General ward ( MALE )','Per day 1000',1000.0000),(26,'BED 22',5,'General ward ( MALE )','Per day 1000',1000.0000),(27,'BED 23',5,'General ward ( MALE )','Per day 1000',1000.0000),(28,'BED 24',5,'General ward ( MALE )','Per day 1000',1000.0000),(29,'BED 25',5,'General ward ( MALE )','Per day 1000',1000.0000),(30,'BED 26',5,'General ward ( MALE )','Per day 1000',1000.0000),(31,'BED 27',10,'General Ward ( Female )','Per day 1000',1000.0000),(32,'BED 28',10,'General Ward ( Female )','Per day 1000',1000.0000),(33,'BED 29',10,'General Ward ( Female )','Per day 1000',1000.0000),(34,'BED 30',10,'General Ward ( Female )','Per day 1000',1000.0000),(35,'BED 31',10,'General Ward ( Female )','Per day 1000',1000.0000),(36,'BED 32',10,'General Ward ( Female )','Per day 1000',1000.0000),(37,'EXAMINATION TABLE 1',15,'CONSULTATION ROOM 2','A',0.0000),(38,'EXAMINATION TABLE 2',25,'PHYSOTHEREPY ROOM','A',0.0000),(39,'EXAMINATION TABLE 3',25,'PHYSOTHEREPY ROOM','A',0.0000),(40,'EXAMINATION TABLE 4',25,'PHYSOTHEREPY ROOM','A',0.0000),(41,'BED 33',25,'PHYSOTHEREPY ROOM','bb',0.0000);
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
  `batch_no` varchar(30) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`casualty_medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casualty_medicines`
--

LOCK TABLES `casualty_medicines` WRITE;
/*!40000 ALTER TABLE `casualty_medicines` DISABLE KEYS */;
INSERT INTO `casualty_medicines` VALUES (41,4,1,31,1,'2018-06-07 00:00:00',0,158,NULL,NULL),(42,4,1,18,1,'2018-06-07 00:00:00',1,158,NULL,NULL),(43,1,1,40,1,'2018-06-08 00:00:00',0,150,NULL,NULL),(44,4,1,18,1,'2018-06-07 00:00:00',1,158,NULL,NULL),(45,4,3,39,2,'2018-06-07 00:00:00',1,158,'2000000000','2018-11-02'),(46,1,1,41,1,'2018-06-08 00:00:00',0,150,NULL,NULL),(47,147,3,39,1,'2018-06-08 00:00:00',0,153,NULL,NULL),(48,147,3,39,2,'2018-06-08 00:00:00',0,153,NULL,NULL),(49,157,1,46,2,'2018-05-27 00:00:00',0,168,NULL,NULL),(50,155,1,31,2,'2018-06-12 00:00:00',1,166,'6767','2020-06-12'),(51,156,1,8,1,'2018-06-12 00:00:00',1,169,'231123123','2020-07-16'),(52,153,3,45,1,'2018-06-12 00:00:00',0,164,NULL,NULL),(53,170,1,46,2,'2018-06-14 00:00:00',0,182,NULL,NULL),(54,155,1,46,1,'2018-06-14 00:00:00',0,166,NULL,NULL),(55,158,1,46,1,'2018-06-14 00:00:00',0,170,NULL,NULL),(56,159,1,46,1,'2018-06-14 00:00:00',0,171,NULL,NULL),(57,159,1,31,1,'2018-06-14 00:00:00',1,171,'1131212','2020-06-14'),(58,159,1,31,1,'2018-06-15 00:00:00',1,171,'343434','2020-06-15'),(59,173,1,48,1,'2018-06-12 00:00:00',0,185,NULL,NULL),(60,156,3,54,1,'2018-06-19 00:00:00',0,169,NULL,NULL),(61,156,3,43,1,'2018-06-19 00:00:00',0,169,NULL,NULL),(62,171,3,54,1,'2018-06-19 00:00:00',0,191,NULL,NULL),(63,171,3,45,1,'2018-06-19 00:00:00',0,191,NULL,NULL),(64,171,3,29,1,'2018-06-19 00:00:00',0,191,NULL,NULL),(65,171,1,20,1,'2018-06-19 00:00:00',0,191,NULL,NULL),(66,160,1,31,1,'2018-06-19 00:00:00',0,172,NULL,NULL),(67,156,3,45,1,'2018-06-19 00:00:00',0,169,NULL,NULL),(68,164,3,45,1,'2018-06-19 00:00:00',0,176,NULL,NULL),(69,158,3,45,1,'2018-06-19 00:00:00',0,170,NULL,NULL),(70,158,1,31,1,'2018-06-19 00:00:00',0,170,NULL,NULL),(71,158,3,45,1,'2018-06-19 00:00:00',0,170,NULL,NULL),(72,158,1,31,1,'2018-06-19 00:00:00',0,170,NULL,NULL),(73,168,1,48,1,'2018-06-19 00:00:00',0,180,NULL,NULL),(74,177,3,45,1,'2018-06-19 00:00:00',0,190,NULL,NULL),(75,177,3,29,2,'2018-06-19 00:00:00',0,190,NULL,NULL),(76,178,3,45,1,'2018-06-19 00:00:00',1,192,'2423','2020-06-19'),(77,178,3,44,2,'2018-06-19 00:00:00',0,192,NULL,NULL),(78,179,2,58,1,'2018-06-19 00:00:00',0,193,NULL,NULL),(79,179,2,59,1,'2018-06-19 00:00:00',0,193,NULL,NULL),(80,179,2,58,1,'2018-06-17 00:00:00',0,193,NULL,NULL),(81,179,2,59,1,'2018-06-17 00:00:00',0,193,NULL,NULL),(82,187,3,56,4,'2018-06-22 00:00:00',0,203,NULL,NULL),(83,189,2,58,2,'2018-06-22 00:00:00',1,205,'43534','2020-06-10'),(84,194,1,8,1,'2018-06-23 00:00:00',0,217,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecilities`
--

LOCK TABLES `fecilities` WRITE;
/*!40000 ALTER TABLE `fecilities` DISABLE KEYS */;
INSERT INTO `fecilities` VALUES (1,'FC1','General OP Consultation','General OP Consultation',1,1,'3'),(2,'FC2','Emergency OP Consultation','Emergency OP Consultation',1,1,'3'),(3,'FC3','Casualty OP Consultation','Casualty OP Consultation',1,1,'3'),(4,'FC4','General IP Consultation','General IP Consultation',2,1,'3'),(5,'FC5','Emergency IP Consultation','Emergency IP Consultation',2,1,'3'),(6,'FC6','Surgeon Charges','Surgeon Charges',2,1,'3'),(7,'FC7','Anesthesian Charges','Anesthesian Charges',2,1,'3'),(8,'FC8','Nursing Charges','Nursing Charges',2,1,'3'),(9,'FC9','Ventilator Charges','Ventilator Charges',2,1,'3'),(10,'FC10','Oxygen Charges','Oxygen Charges',2,1,'3'),(11,'FC11','Nebulization Charges','Nebulization Charges',2,1,'3'),(12,'FC12','Casualty Charges','Casualty Charges',3,1,'3'),(13,'FC13','OT Modular Charges','OT Modular Charges',4,1,'3'),(14,'FC14','Small OT Charges','Small OT Charges',4,1,'3'),(15,'FC15','Pharmacy','Pharmacy',5,1,'3'),(16,'FC16','Labs','Labs',6,1,'3'),(17,'FC17','ICU Room Charges','Room Charges',7,1,'3'),(18,'FC18','Advance','Advance',8,1,'3'),(19,'FC19','General Ward Charges','General Ward Charges',7,1,'3'),(20,'FC20','Special Room  Charges (Non-AC)','Special Room  Charges (Non-AC)',7,1,'3'),(21,'FC21','Special Room  Charges (AC)','Special Room  Charges (AC)',7,1,'3');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fecilities_group`
--

LOCK TABLES `fecilities_group` WRITE;
/*!40000 ALTER TABLE `fecilities_group` DISABLE KEYS */;
INSERT INTO `fecilities_group` VALUES (1,'Out Patient','Out Patient',1),(2,'In Patient','In Patient',1),(3,'Emergency or Casualty','Emergency or Casualty',1),(4,'Operation Theatre','Operation Theatre',1),(5,'Pharmacy','Pharmacy',1),(6,'Laboratory','Laboratory',1),(7,'Rooms','Rooms',1),(8,'Advance','Advance',1),(9,'Imaging Or Scanning','Imaging Or Scanning',1),(10,'Radiology','Radiology',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitals`
--

LOCK TABLES `hospitals` WRITE;
/*!40000 ALTER TABLE `hospitals` DISABLE KEYS */;
INSERT INTO `hospitals` VALUES (1,'BRM','Dr. BRM CareWell Hospital','100 building centre','Kakinada','0884235648','9063995999','brmcrewell@gmail.com',1,1),(2,'orgacode11','test11','test11','test11','test11','1111111111','test@gmail.com',0,1),(4,'SSC','Satya Scan center','sri','KKD','445454','9912345455','a@a.com',0,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_units`
--

LOCK TABLES `inventory_units` WRITE;
/*!40000 ALTER TABLE `inventory_units` DISABLE KEYS */;
INSERT INTO `inventory_units` VALUES (1,'Ampoule',1,'N'),(2,'Bag',1,'N'),(4,'Bottle',1,'N'),(5,'Box',0,'N'),(6,'Bundle',1,'Y'),(7,'Capsule',1,'Y'),(8,'Case',1,'N'),(9,'Container',1,'N'),(10,'Cream',1,'Y'),(11,'Each',1,'N'),(12,'Gel',1,'Y'),(13,'Nebule',1,'Y'),(14,'Ointment',1,'Y'),(15,'Pack',1,'N'),(16,'Pair',1,'N'),(17,'Pallet',1,'N'),(18,'Patch',1,'N'),(19,'Pcs',1,'N'),(20,'Pill',1,'Y'),(22,'Polyamp',1,'N'),(23,'Roll',1,'Y'),(24,'Spray',1,'Y'),(25,'Suspension',1,'N'),(26,'Setwet',1,'N'),(27,'Syrup',1,'Y'),(28,'Tablet',1,'Y'),(29,'Tray',1,'Y'),(30,'Tube',1,'N'),(31,'Vial',1,'N'),(32,'syrup',1,NULL),(33,'gml',1,NULL),(34,'ml',1,NULL),(35,'FLUID',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_group`
--

LOCK TABLES `item_group` WRITE;
/*!40000 ALTER TABLE `item_group` DISABLE KEYS */;
INSERT INTO `item_group` VALUES (1,'TABLES','Y','N',1),(2,'CHAIRS','Y','N',1),(3,'MEDICINE','N','Y',1),(4,'BUCKETS','Y','N',1),(5,'MUGS','Y','N',1),(6,'CHIPURLU','Y','N',1),(7,'BED SHEETS AND PILLOWS','Y','N',1),(8,'DRUG BOXES','Y','N',1),(9,'FAN','Y','N',1),(10,'LAND PHONES','Y','N',1),(11,'STEEL TROLLY','Y','N',1),(12,'WHEEL CHAIR','Y','N',1),(13,'FIRE EXTINGUISHER CYLINDER','Y','N',1),(14,'O2 cylinder','Y','N',1),(15,'COUNTER TABLE','Y','N',1),(16,'SILINE STANDS','Y','N',1),(17,'WEIGHING MACHINE','Y','N',1),(18,'ECG MACHINE AND TROLLY','Y','Y',1),(19,'NOTICE BOARD','Y','N',1),(20,'GLASS STAND','Y','N',1),(21,'PLANK STAND table','Y','N',1),(22,'JIO MOBILE PHONE','Y','N',1),(23,'STETHESCOPE','Y','N',1),(24,'BP Operater','Y','N',1),(25,'Thermo meter','Y','N',1),(26,'Dressing tray and forecheff','Y','N',1),(27,'Instruments box','Y','N',1),(28,'Scissore','Y','N',1),(29,'Napkin','Y','N',1),(30,'Punching Machine','Y','N',1),(31,'Needle burner','Y','N',1),(32,'Small tray','Y','N',1),(33,'Dust bin','Y','N',1),(34,'Bulb and tubes','Y','N',1),(35,'Bed curtains','Y','N',1),(36,'Glass Curtains','Y','N',1),(37,'Plastic Tray','Y','N',1),(38,'Electricals','Y','N',1),(39,'Cloths','Y','N',1),(40,'Stands','Y','N',1),(41,'For patient Utilities','Y','Y',1),(42,'Furniture','Y','N',1),(43,'Air conditionar AC','Y','N',1),(44,'Stationary','Y','N',1),(45,'OT modular','Y','N',1),(46,'Anastecia Station','Y','N',1),(47,'Monitor','Y','N',1),(48,'Surgery Table','Y','N',1),(49,'Put stool chair','Y','N',1),(50,'Touch Made LED lights','Y','N',1),(51,'CLOCK','Y','N',1),(52,'CRM','Y','N',1),(53,'INSTRUMENT TRALY BIG','Y','N',1),(54,'INSTRUMENT TRALY SMALL','Y','N',1),(55,'INSTRUMENT TRALY MEDIUM','Y','N',1),(56,'MAXER LAPROSCOPE TRALY','Y','N',1),(57,'VACCUM SECTION OPERATOR','Y','N',1),(58,'PENDENT','Y','N',1),(59,'AUTO CLAVE MACHINE BIG','Y','N',1),(60,'BOOSTER','Y','N',1),(61,'AaM REST','Y','N',1),(62,'TRUNK BOX','Y','N',1),(63,'PUT STOOL','Y','N',1),(64,'SURGEN STOOL','Y','N',1),(65,'LAPROSCOPE INSTRUMENT BOX','Y','N',1),(66,'X RAY LOBBY','Y','N',1),(67,'DY THERAMI','Y','N',1),(68,'BIN','Y','N',1),(69,'SCISSORS BOX','Y','N',1),(70,'PEMPCATION MACHINE BOX','Y','N',1),(71,'BASIN','Y','N',1),(72,'MAT','Y','N',1),(73,'STEEL SINC','Y','N',1),(74,'STEEL TAPS','Y','N',1),(75,'COMPUTERS','Y','N',1),(76,'PRINTERS','Y','N',1),(77,'CPU','Y','N',1),(78,'LAPROSCOPE MONITOR','Y','N',1),(79,'SECTION OPERATOR','Y','N',1),(80,'DRUG TRALLY TRASH CARD','Y','N',1),(81,'SIDEX TRAY','Y','N',1),(82,'PENDENT','Y','N',1),(83,'ERBA EM200','Y','N',1),(84,'BIO SYSTEM A 45 XP 100','Y','N',1),(85,'RADIANCE SEMI AUTOMATED ANALYZER','Y','N',1),(86,'EASYLYTE EXPOND ELECTROLATES','Y','N',1),(87,'NEEDLE BURNER','Y','N',1),(88,'PATHOLOGICAL MICROSCOPE','Y','N',1),(89,'COLORI METER','Y','N',1),(90,'COUNTING CELLS MACHINE','Y','N',1),(91,'ROTATED SAMPLE MACHINE','Y','N',1),(92,'PRINTER','Y','N',1),(93,'INVERTOR','Y','N',1),(94,'LG FRIDGE','Y','N',1),(95,'WATER TINS','Y','N',1),(96,'WEAST WATER TINS','Y','N',1),(97,'CLEANING SOLUCTION TIN','Y','N',1),(98,'HIMOGLOBIN SOLUCTION','Y','N',1),(99,'TUBE CLEANING HYPER SOLUCTION','Y','N',1),(100,'NS RL','Y','N',1),(101,'URIN STRIPS','Y','N',1),(102,'TEST TUBE STANDS','Y','N',1),(103,'STERILLIUM','Y','N',1),(104,'SPRIT','Y','N',1),(105,'P T MACHINE','Y','N',1),(106,'CENTRIFUGE','Y','N',1),(107,'COMPUTER','Y','N',1),(108,'NS RL','Y','N',1),(109,'Needle Stand','Y','N',1),(110,'Reeder Konika  Minolta Regius 2','Y','N',1),(111,'Printer DryPro','Y','N',1),(112,'Mobile X Ray Machine 100 ma','Y','N',1),(113,'X Ray Chest Stand','Y','N',1),(114,'X Ray Grid Table','Y','N',1),(115,'Lead Apperon','Y','N',1),(116,'14  17 casset','Y','N',1),(117,'12  10 casset','Y','N',1),(118,'Thread Mill TMT','Y','N',1),(119,'ACQUISITION BOX RMS','Y','N',1),(120,'STOOL','Y','N',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_test`
--

LOCK TABLES `lab_test` WRITE;
/*!40000 ALTER TABLE `lab_test` DISABLE KEYS */;
INSERT INTO `lab_test` VALUES (1,'1','COMPLETE BLOOD PICTURE','[{\"Gender\": \"All\", \"endRange\": \"17\", \"$$hashKey\": \"object:386\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"13\", \"subInvestigation\": \"HEMOGLOBIN\"}, {\"Gender\": \"All\", \"endRange\": \"5.5\", \"$$hashKey\": \"object:540\", \"rangeType\": \"Range\", \"unit_name\": \"million cells/cu.mm\", \"startRange\": \"4.5\", \"subInvestigation\": \"RBC COUNT\"}, {\"Gender\": \"All\", \"endRange\": \"50\", \"$$hashKey\": \"object:556\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"40\", \"subInvestigation\": \"HCT\"}, {\"Gender\": \"All\", \"endRange\": \"101\", \"$$hashKey\": \"object:572\", \"rangeType\": \"Range\", \"unit_name\": \"fl\", \"startRange\": \"83\", \"subInvestigation\": \"MCV\"}, {\"Gender\": \"All\", \"endRange\": \"32\", \"$$hashKey\": \"object:588\", \"rangeType\": \"Range\", \"unit_name\": \"pg\", \"startRange\": \"27\", \"subInvestigation\": \"MCH\"}, {\"Gender\": \"All\", \"endRange\": \"34\", \"$$hashKey\": \"object:604\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"31\", \"subInvestigation\": \"MCHC\"}, {\"Gender\": \"All\", \"endRange\": \"12000\", \"$$hashKey\": \"object:620\", \"rangeType\": \"Range\", \"unit_name\": \"cells/cu.mm\", \"startRange\": \"4,000\", \"subInvestigation\": \"TWBC COUNT\"}, {\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:636\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"40\", \"subInvestigation\": \"NEUTROPHILS\"}, {\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:652\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"20\", \"subInvestigation\": \"LYMPHOCYTES\"}, {\"Gender\": \"All\", \"endRange\": \"10\", \"$$hashKey\": \"object:668\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"2\", \"subInvestigation\": \"MONOCYTES\"}, {\"Gender\": \"All\", \"endRange\": \"6\", \"$$hashKey\": \"object:684\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"2\", \"subInvestigation\": \"EOSINOPHILS\"}, {\"Gender\": \"All\", \"endRange\": \"4.0\", \"$$hashKey\": \"object:700\", \"rangeType\": \"Range\", \"unit_name\": \"lakhs/cu.mm\", \"startRange\": \"1.5\", \"subInvestigation\": \"PLATELET COUNT\"}, {\"Gender\": \"All\", \"endRange\": \"10\", \"$$hashKey\": \"object:716\", \"rangeType\": \"Range\", \"unit_name\": \"mm in 1st hour\", \"startRange\": \"0\", \"subInvestigation\": \"ESR\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:748\", \"rangeType\": \"Time\", \"unit_name\": \"minutes\", \"endMinutes\": \"3\", \"endSeconds\": \"00\", \"startMinutes\": \"1\", \"startSeconds\": \"00\", \"subInvestigation\": \"BLEEDING TIME\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:776\", \"rangeType\": \"Time\", \"unit_name\": \"minutes\", \"endMinutes\": \"7\", \"endSeconds\": \"00\", \"startMinutes\": \"3\", \"startSeconds\": \"00\", \"subInvestigation\": \"CLOTTING TIME\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:396\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"5\", \"med_name\": \"20 M\", \"$$hashKey\": \"object:406\"}]',6),(2,'2','LIVER FUNCTION TEST(LFT)','[{\"Gender\": \"All\", \"endRange\": \"1.2\", \"$$hashKey\": \"object:2266\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.2\", \"subInvestigation\": \"SERUM BILIRUBIN TOTAL\"}, {\"Gender\": \"All\", \"endRange\": \"0.3\", \"$$hashKey\": \"object:2417\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.0\", \"subInvestigation\": \"SERUM BILIRUBIN DIRECT\"}, {\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:2433\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"SERUM BILIRUBIN INDIRECT\"}, {\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:2449\", \"rangeType\": \"Range\", \"unit_name\": \"u/l\", \"startRange\": \"05\", \"subInvestigation\": \"SGOT\"}, {\"Gender\": \"All\", \"endRange\": \"49\", \"$$hashKey\": \"object:2465\", \"rangeType\": \"Range\", \"unit_name\": \"u/l\", \"startRange\": \"0\", \"subInvestigation\": \"SGPT\"}, {\"Gender\": \"All\", \"endRange\": \"141\", \"$$hashKey\": \"object:2481\", \"rangeType\": \"Range\", \"unit_name\": \"u/l\", \"startRange\": \"36\", \"subInvestigation\": \"S.ALKALINE PHOSPHATASE\"}, {\"Gender\": \"All\", \"endRange\": \"8.0\", \"$$hashKey\": \"object:2497\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"6.0\", \"subInvestigation\": \"SERUM TOTAL PROTEIN\"}, {\"Gender\": \"All\", \"endRange\": \"5.0\", \"$$hashKey\": \"object:2513\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"3.5\", \"subInvestigation\": \"ALBUMIN\"}, {\"Gender\": \"All\", \"endRange\": \"3.7\", \"$$hashKey\": \"object:2529\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"2.3\", \"subInvestigation\": \"GLOBULIN\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:2276\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"5\", \"med_name\": \"20 M\", \"$$hashKey\": \"object:2286\"}]',2),(3,'2','LIPID PROFILE','[{\"Gender\": \"All\", \"endRange\": \"200\", \"$$hashKey\": \"object:3411\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"25\", \"subInvestigation\": \"TRIGLYCERIDES\"}, {\"Gender\": \"All\", \"endRange\": \"250\", \"$$hashKey\": \"object:3562\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"130\", \"subInvestigation\": \"TOTAL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:3578\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"35\", \"subInvestigation\": \"HDL CHOLESTEROL\"}, {\"Gender\": \"All\", \"endRange\": \"120\", \"$$hashKey\": \"object:3594\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"LDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"27\", \"$$hashKey\": \"object:3610\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"VLDL CHOLESTEROL(CALCULATED)\"}, {\"Gender\": \"All\", \"endRange\": \"4.3\", \"$$hashKey\": \"object:3626\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"2.9\", \"endNumerator\": \"0.7\", \"startNumerator\": \"3.6\", \"subInvestigation\": \"TOTAL/HDL CHOLESTEROL RATIO\"}, {\"Gender\": \"All\", \"endRange\": \"2.7\", \"$$hashKey\": \"object:3690\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.5\", \"subInvestigation\": \"LDL/HDL CHOLESTEROL RATIO\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:3421\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"9\", \"med_name\": \"Diken 3 ml inj\", \"$$hashKey\": \"object:3431\"}]',2),(4,'3','VIROLOGY','[{\"Gender\": \"All\", \"$$hashKey\": \"object:3973\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BLOOD FOR HIV(TRIDOT)\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:4309\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HEPATISIS B ANTIGEN(HbsAg)\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:4994\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HEPATITIS C VIRUS(HCV)\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:3983\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:3993\"}]',2),(5,'1','HEMOGLOBIN A1c','[{\"Gender\": \"All\", \"$$hashKey\": \"object:5261\", \"rangeType\": \"Description\", \"unit_name\": \"%\", \"Description\": \"NORMAL : 3.0-6.2%,GOOD DIABATIC CONTROL : 5.5-6.8%,FAIR CONTROL : 6.8 - 7.6%,POOR CONTROL : >7.6%\", \"subInvestigation\": \"GLYCOSYLATED HEMOGLOBIN A1c\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:5418\", \"rangeType\": \"Description\", \"unit_name\": \"mg/dl\", \"Description\": \"NORMAL : 3.0-6.2%,GOOD DIABATIC CONTROL : 5.5-6.8%,FAIR CONTROL : 6.8 - 7.6%,POOR CONTROL : >7.6%\", \"subInvestigation\": \"MEAN BLOOD GLUCOSE(MBG)\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"GLYCOSYLATED HEMOGLBIN SERVES AS AN INDICATOR OF METABOLIC CONTROL OF DIABETICS. THE MEASURE OF GLYCOSLATED HEMOGLOBIN REFLECTS THE AVERAGE BLOOD GLUCOSE CONCENTRATUINS OVER THE PRECEEDING  SERVERAL WEEKS. HENCE IT IS UNAFFECTED BY DIET, INSULIN OR EXERCISE ON THE TESTING. A FAIRLY RAPID RISE CAN OCCUR DURING POOR DIABETIC CONTROL\", \"$$hashKey\": \"object:5271\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:5281\"}]',2),(6,'1','BLOOD GROUPING','[{\"Array\": \"A,B,AB,0\", \"Gender\": \"All\", \"$$hashKey\": \"object:5677\", \"rangeType\": \"Array\", \"unit_name\": \"-\", \"subInvestigation\": \"BLOOD GROUP\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:5831\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"RH-TYPE\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:5687\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:5697\"}]',2),(7,'3','DENGUE','[{\"Gender\": \"All\", \"$$hashKey\": \"object:6094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/G ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6249\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"Ig/M ANTIBODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6269\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ANTIGEN(NS1)\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:6104\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:6114\"}]',2),(8,'3','MALARIAL','[{\"Gender\": \"All\", \"$$hashKey\": \"object:6535\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BLOOD FOR MALARIAL PARASITE(P.V &P.F CARD)\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:6545\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:6555\"}]',2),(9,'3','WIDAL','[{\"Gender\": \"All\", \"$$hashKey\": \"object:6939\", \"rangeType\": \"Ratio\", \"unit_name\": \"dilutions\", \"endNumerator\": \"1\", \"endDenominator\": \"320\", \"startNumerator\": \"1\", \"startDenominator\": \"20\", \"subInvestigation\": \"SALMONELLA TYPHI - O\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:7526\", \"rangeType\": \"Ratio\", \"unit_name\": \"dilutions\", \"endNumerator\": \"1\", \"endDenominator\": \"320\", \"startNumerator\": \"1\", \"startDenominator\": \"20\", \"subInvestigation\": \"SALMONELLA TYPHI - H\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:7552\", \"rangeType\": \"Ratio\", \"unit_name\": \"dilutions\", \"endNumerator\": \"1\", \"endDenominator\": \"320\", \"startNumerator\": \"1\", \"startDenominator\": \"20\", \"subInvestigation\": \"SALMONELLA  PARA TYPHI - AH\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:7578\", \"rangeType\": \"Ratio\", \"unit_name\": \"dilutions\", \"endNumerator\": \"1\", \"endDenominator\": \"320\", \"startNumerator\": \"1\", \"startDenominator\": \"20\", \"subInvestigation\": \"SALMONELLA  PARA TYPHI - BH\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:6949\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:6959\"}]',2),(10,'2','RENTAL FUNCTION TESTS(RFT)','[{\"Gender\": \"All\", \"endRange\": \"140\", \"$$hashKey\": \"object:7923\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"70\", \"subInvestigation\": \"BLOOD GLUCOSE(R)\"}, {\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:8074\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"14\", \"subInvestigation\": \"BLOOD UREA\"}, {\"Gender\": \"All\", \"endRange\": \"21.0\", \"$$hashKey\": \"object:8090\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"6.5\", \"subInvestigation\": \"BLOOD UREA NITROGEN (BUN)\"}, {\"Gender\": \"All\", \"endRange\": \"7.7\", \"$$hashKey\": \"object:8106\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"2.5\", \"subInvestigation\": \"SERUM URIC ACID\"}, {\"Gender\": \"All\", \"endRange\": \"10.8\", \"$$hashKey\": \"object:8122\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"8.2\", \"subInvestigation\": \"SERUM CALCIUM\"}, {\"Gender\": \"All\", \"endRange\": \"1.4\", \"$$hashKey\": \"object:8138\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.4\", \"subInvestigation\": \"SERUM CREA TININE\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:7933\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:7943\"}]',2),(11,'2','ELECTROLYTES','[{\"Gender\": \"All\", \"endRange\": \"155\", \"$$hashKey\": \"object:8409\", \"rangeType\": \"Range\", \"unit_name\": \"mmoI/L\", \"startRange\": \"135\", \"subInvestigation\": \"SERUM SODIUM\"}, {\"Gender\": \"All\", \"endRange\": \"5.5\", \"$$hashKey\": \"object:8560\", \"rangeType\": \"Range\", \"unit_name\": \"mmoI/L\", \"startRange\": \"3.5\", \"subInvestigation\": \"SERUM POTASSIUM\"}, {\"Gender\": \"All\", \"endRange\": \"108\", \"$$hashKey\": \"object:8576\", \"rangeType\": \"Range\", \"unit_name\": \"mmoI/L\", \"startRange\": \"98\", \"subInvestigation\": \"SERUM CHLORIDES\"}]','[{\"qty\": \"3\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:8419\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:8429\"}]',2),(12,'4','COMPLETE URINE EXAMINATION (CUE)','[{\"Gender\": \"All\", \"remarks\": \"micro\", \"$$hashKey\": \"object:8908\", \"rangeType\": \"T/F\", \"trueValue\": \"CLEAR\", \"unit_name\": \"-\", \"falseValue\": \"CLOUDY\", \"subInvestigation\": \"APPEARANCE\"}, {\"Array\": \"PALE YELLO\", \"Gender\": \"All\", \"$$hashKey\": \"object:9070\", \"rangeType\": \"T/F\", \"trueValue\": \"PALE YELLOW\", \"unit_name\": \"-\", \"falseValue\": \"REDDISH YELLOW\", \"subInvestigation\": \"COLOUR\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9093\", \"rangeType\": \"T/F\", \"trueValue\": \"ACIDIC\", \"unit_name\": \"-\", \"falseValue\": \"-\", \"subInvestigation\": \"REACTION\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9113\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BLOOD\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9133\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BILE SALTS\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9165\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BILE PIGMENTS\"}, {\"Array\": \"NORMAL,1+,2+,3+,4+\", \"Gender\": \"All\", \"$$hashKey\": \"object:9185\", \"rangeType\": \"Array\", \"unit_name\": \"-\", \"subInvestigation\": \"UROBILINOGEN\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9208\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"KETONE BODIES\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9228\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"PROTEINS\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9248\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"GLUCOSE\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9268\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"NITRITES\"}, {\"Gender\": \"All\", \"endRange\": \"9.0\", \"$$hashKey\": \"object:9288\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"5.0\", \"subInvestigation\": \"PH\"}, {\"Gender\": \"All\", \"endRange\": \"1.030\", \"$$hashKey\": \"object:9304\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.00\", \"subInvestigation\": \"SPECIFIC GRAVITY\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:9320\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"LEUKOCYTES\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:8918\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:8928\"}]',2),(13,'1','HEMOGLOBIN','[{\"Gender\": \"M\", \"endRange\": \"18\", \"$$hashKey\": \"object:118\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"13\", \"subInvestigation\": \"HEMOGLOBIN\"}, {\"Gender\": \"F\", \"endRange\": \"16\", \"$$hashKey\": \"object:269\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"11\", \"subInvestigation\": \"HEMOGLOBIN\"}, {\"Gender\": \"P\", \"endRange\": \"19\", \"$$hashKey\": \"object:285\", \"rangeType\": \"Range\", \"unit_name\": \"gms%\", \"startRange\": \"13.5\", \"subInvestigation\": \"HEMOGLOBIN\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:128\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:138\"}]',2),(14,'1','TOTAL COUNT','[{\"Gender\": \"M\", \"endRange\": \"6.0\", \"$$hashKey\": \"object:175\", \"rangeType\": \"Range\", \"unit_name\": \"million cells/cu.mm\", \"startRange\": \"4.5\", \"subInvestigation\": \"TOTAL COUNT\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:185\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"1\", \"med_name\": \"D5 DEXTROSE INJ\", \"$$hashKey\": \"object:195\"}]',2),(15,'1','PLATELET COUNT','[{\"Gender\": \"All\", \"endRange\": \"4.0\", \"$$hashKey\": \"object:967\", \"rangeType\": \"Range\", \"unit_name\": \"lakhs/cu.mm\", \"startRange\": \"1.5\", \"subInvestigation\": \"PLATELET COUNT\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:977\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:987\"}]',2),(16,'1','BLEEDING TIME','[{\"Gender\": \"All\", \"$$hashKey\": \"object:1407\", \"rangeType\": \"Time\", \"unit_name\": \"minutes\", \"endMinutes\": \"3\", \"endSeconds\": \"00\", \"startMinutes\": \"1\", \"startSeconds\": \"30\", \"subInvestigation\": \"BLEEDING TIME\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:1417\", \"unit_name\": \"ML\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:1427\"}]',2),(17,'1','CLOTING TIME','[{\"Gender\": \"All\", \"$$hashKey\": \"object:3070\", \"rangeType\": \"Time\", \"unit_name\": \"minutes\", \"endMinutes\": \"7\", \"endSeconds\": \"00\", \"startMinutes\": \"3\", \"startSeconds\": \"30\", \"subInvestigation\": \"CLOTING TIME\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:3080\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:3090\"}]',2),(18,'1','ESR','[{\"Gender\": \"All\", \"endRange\": \"10\", \"$$hashKey\": \"object:4443\", \"rangeType\": \"Range\", \"unit_name\": \"mm in 1st  hour\", \"startRange\": \"0\", \"subInvestigation\": \"ESR\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:4453\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"5\", \"med_name\": \"20 M\", \"$$hashKey\": \"object:4463\"}]',2),(19,'1','HCT (PCV)','[{\"Gender\": \"All\", \"endRange\": \"50\", \"$$hashKey\": \"object:4876\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"40\", \"subInvestigation\": \"HCT(PCV)\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:4886\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"1\", \"med_name\": \"D5 DEXTROSE INJ\", \"$$hashKey\": \"object:4896\"}]',2),(20,'1','PT','[{\"Gender\": \"All\", \"$$hashKey\": \"object:5312\", \"rangeType\": \"Time\", \"unit_name\": \"Seconds\", \"endMinutes\": \"15\", \"endSeconds\": \"00\", \"startMinutes\": \"11\", \"startSeconds\": \"00\", \"subInvestigation\": \"PT\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:5475\", \"rangeType\": \"Time\", \"unit_name\": \"Seconds\", \"endMinutes\": \"12\", \"endSeconds\": \"08\", \"startMinutes\": \"0\", \"startSeconds\": \"00\", \"subInvestigation\": \"CONTROL\"}, {\"Gender\": \"All\", \"endRange\": \"1.1\", \"$$hashKey\": \"object:5503\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"0.8\", \"subInvestigation\": \"I N R\"}]','[{\"qty\": \"2\", \"sample\": \"B LOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:5322\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:5332\"}]',2),(21,'1','APTT','[{\"Gender\": \"All\", \"$$hashKey\": \"object:5831\", \"rangeType\": \"Time\", \"unit_name\": \"Seconds\", \"endMinutes\": \"34\", \"endSeconds\": \"00\", \"startMinutes\": \"22\", \"startSeconds\": \"00\", \"subInvestigation\": \"T E S T\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:6010\", \"rangeType\": \"Time\", \"unit_name\": \"-\", \"endMinutes\": \"-\", \"endSeconds\": \"-\", \"startMinutes\": \"-\", \"startSeconds\": \"-\", \"subInvestigation\": \"CONTROL\"}]','[{\"qty\": \"2\", \"sample\": \"B LOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:5841\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:5851\"}]',2),(22,'2','BLOOD GLUCOSE','[{\"Gender\": \"All\", \"endRange\": \"110\", \"$$hashKey\": \"object:6638\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"70\", \"subInvestigation\": \"BLOOD SUGAR  (FASTING)\"}, {\"Gender\": \"All\", \"endRange\": \"160\", \"$$hashKey\": \"object:6967\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"110\", \"subInvestigation\": \"BLOOD SUGAR(POST PRANDIAL)\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:6648\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"13\", \"med_name\": \"GLUCI IV\", \"$$hashKey\": \"object:6658\"}]',2),(23,'2','G.T.T','[{\"Gender\": \"All\", \"endRange\": \"110\", \"$$hashKey\": \"object:168\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"70\", \"subInvestigation\": \"FASTING\"}, {\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:319\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"-\", \"subInvestigation\": \"GLUCOSE( 1ST 1 HOUR)\"}, {\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:335\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"-\", \"subInvestigation\": \"GLUCOSE(2ND 1 HOUR)\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:178\", \"unit_name\": \"ml\"}]','[{\"qty\": \"2\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:188\"}]',2),(24,'2','BLOOD GLUCOSE(R)','[{\"Gender\": \"All\", \"endRange\": \"160\", \"$$hashKey\": \"object:648\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"70\", \"subInvestigation\": \"BLOOD SUGAR RANDOM\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:658\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:668\"}]',2),(25,'2','BLOOD UREA','[{\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:1099\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"14\", \"subInvestigation\": \"BLOOD UREA\"}, {\"Gender\": \"All\", \"endRange\": \"21.0\", \"$$hashKey\": \"object:1250\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"6.5\", \"subInvestigation\": \"BLOOD UREA NITROGEN (BUN)\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:1109\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:1119\"}]',2),(26,'2','SERUM CREATININE','[{\"Gender\": \"All\", \"endRange\": \"1.4\", \"$$hashKey\": \"object:1569\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.4\", \"subInvestigation\": \"SERUM CREATININE\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:1579\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:1589\"}]',2),(27,'2','SERUM URIC ACID','[{\"Gender\": \"All\", \"endRange\": \"7.7\", \"$$hashKey\": \"object:2026\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"2.5\", \"subInvestigation\": \"SERUM URIC ACID\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:2036\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:2046\"}]',2),(28,'2','SERUM CALCIUM','[{\"Gender\": \"All\", \"endRange\": \"10.8\", \"$$hashKey\": \"object:3023\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"8.2\", \"subInvestigation\": \"SERUM CALCIUM\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:3033\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:3043\"}]',2),(29,'2','SERUM SODIUM','[{\"Gender\": \"All\", \"endRange\": \"155\", \"$$hashKey\": \"object:3486\", \"rangeType\": \"Range\", \"unit_name\": \"mmoI/L\", \"startRange\": \"135\", \"subInvestigation\": \"SERUM SODIUM\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:3496\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:3506\"}]',2),(30,'2','SERUM POTASSIUM','[{\"Gender\": \"All\", \"endRange\": \"5.5\", \"$$hashKey\": \"object:3952\", \"rangeType\": \"Range\", \"unit_name\": \"mmoI/L\", \"startRange\": \"3.5\", \"subInvestigation\": \"SERUM POTASSIUM\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:3962\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:3972\"}]',2),(31,'2','SERUM CHLORIDES','[{\"Gender\": \"All\", \"endRange\": \"108\", \"$$hashKey\": \"object:4421\", \"rangeType\": \"Range\", \"unit_name\": \"mmoI/L\", \"startRange\": \"98\", \"subInvestigation\": \"SERUM CHLORIDES\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:4431\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:4441\"}]',2),(32,'2','SERUM BILIRUBIN TOTAL','[{\"Gender\": \"All\", \"endRange\": \"1.2\", \"$$hashKey\": \"object:4893\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.2\", \"subInvestigation\": \"SERUM BILIRUBIN TOTAL\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:4903\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:4913\"}]',2),(33,'2','SERUM BILIRUBIN DIRECT','[{\"Gender\": \"All\", \"endRange\": \"0.3\", \"$$hashKey\": \"object:5371\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.0\", \"subInvestigation\": \"SERUM BILIRUBIN DIRECT\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:5381\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:5391\"}]',2),(34,'2','SERUM BILIRUBIN INDIRECT','[{\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:5849\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"-\", \"subInvestigation\": \"SERUM BILIRUBIN INDIRECT\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:5859\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:5869\"}]',2),(35,'2','SERUM BILIRUBIN TOTAL ,DIRECT, INDIRECT','[{\"Gender\": \"All\", \"endRange\": \"1.2\", \"$$hashKey\": \"object:6330\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.2\", \"subInvestigation\": \"SERUM BILIRUBIN TOTAL\"}, {\"Gender\": \"All\", \"endRange\": \"0.3\", \"$$hashKey\": \"object:6481\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0.0\", \"subInvestigation\": \"SERUM BILIRUBIN DIRECT\"}, {\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:6500\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"-\", \"subInvestigation\": \"SERUM BILIRUBIN INDIRECT\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:6340\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:6350\"}]',2),(36,'2','SGOT','[{\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:6849\", \"rangeType\": \"Range\", \"unit_name\": \"U/L\", \"startRange\": \"05\", \"subInvestigation\": \"SGOT\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:6859\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:6869\"}]',2),(37,'2','SGPT','[{\"Gender\": \"All\", \"endRange\": \"49\", \"$$hashKey\": \"object:7336\", \"rangeType\": \"Range\", \"unit_name\": \"U/L\", \"startRange\": \"0\", \"subInvestigation\": \"SGPT\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:7346\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:7356\"}]',2),(38,'2','SERUM ALKALINE PHOSPHATASE','[{\"Gender\": \"All\", \"endRange\": \"141\", \"$$hashKey\": \"object:8002\", \"rangeType\": \"Range\", \"unit_name\": \"U/L\", \"startRange\": \"36\", \"subInvestigation\": \"SERUM ALKALINE PHOSPHATASE\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:8012\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:8022\"}]',2),(39,'2','SERUM TOTAL PROTEIN','[{\"Gender\": \"All\", \"endRange\": \"8.0\", \"$$hashKey\": \"object:8495\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"6.0\", \"subInvestigation\": \"SERUM TOTAL PROTEIN\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:8505\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:8515\"}]',2),(40,'2','ALBUMIN','[{\"Gender\": \"All\", \"endRange\": \"5.0\", \"$$hashKey\": \"object:8991\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"3.5\", \"subInvestigation\": \"ALBUMIN\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:9001\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:9011\"}]',2),(41,'2','GLOBULIN','[{\"Gender\": \"All\", \"endRange\": \"3.7\", \"$$hashKey\": \"object:9490\", \"rangeType\": \"Range\", \"unit_name\": \"gm/dl\", \"startRange\": \"2.3\", \"subInvestigation\": \"GLOBULIN\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:9500\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:9510\"}]',2),(42,'2','TRIGLYCERIDES','[{\"Gender\": \"All\", \"endRange\": \"200\", \"$$hashKey\": \"object:10162\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"25\", \"subInvestigation\": \"TRIGLYCERIDES\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:10172\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:10182\"}]',2),(43,'2','TOTAL CHOLESTEROL','[{\"Gender\": \"All\", \"endRange\": \"250\", \"$$hashKey\": \"object:10667\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"130\", \"subInvestigation\": \"TOTAL CHOLESTEROL\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:10677\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:10687\"}]',2),(44,'2','HDL CHOLESTEROL','[{\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:11175\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"35\", \"subInvestigation\": \"HDL CHOLESTEROL\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:11185\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:11195\"}]',2),(45,'2','LDL CHOLESTEROL','[{\"Gender\": \"All\", \"endRange\": \"120\", \"$$hashKey\": \"object:11686\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"LDL CHOLESTEROL\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:11696\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:11706\"}]',2),(46,'2','VLDL CHOLESTEROL','[{\"Gender\": \"All\", \"endRange\": \"27\", \"$$hashKey\": \"object:12200\", \"rangeType\": \"Range\", \"unit_name\": \"mg/dl\", \"startRange\": \"0\", \"subInvestigation\": \"VLDL CHOLESTEROL\"}]','[{\"qty\": \"1\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:12210\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:12220\"}]',2),(47,'2','TOTAL/ HDL CHOLESTEROL RATIO','[{\"Gender\": \"All\", \"endRange\": \"4.3\", \"$$hashKey\": \"object:12717\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"2.9\", \"startNumerator\": \"2.9\", \"subInvestigation\": \"TOTAL/ HDL CHOLESTEROL RATIO\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:12727\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:12737\"}]',2),(48,'2','LDL/ HDL CHOLESTEROL RATIO','[{\"Gender\": \"All\", \"endRange\": \"2.7\", \"$$hashKey\": \"object:13513\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.5\", \"subInvestigation\": \"LDL/ HDL CHOLESTEROL RATIO\"}]','[{\"qty\": \"1\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:13523\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:13533\"}]',2),(49,'2','AMYLASE','[{\"Gender\": \"All\", \"endRange\": \"90\", \"$$hashKey\": \"object:14036\", \"rangeType\": \"Range\", \"unit_name\": \"U/L\", \"startRange\": \"0\", \"subInvestigation\": \"AMYLASE\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:14046\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:14056\"}]',2),(50,'3','HIV','[{\"Gender\": \"All\", \"$$hashKey\": \"object:14562\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HIV\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:14572\", \"unit_name\": \"ml\"}]','[{\"qty\": \"2\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:14582\"}]',2),(51,'3','HCV','[{\"Gender\": \"All\", \"$$hashKey\": \"object:15095\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HCV\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:15105\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:15115\"}]',2),(52,'3','HBSAG','[{\"Gender\": \"All\", \"$$hashKey\": \"object:15631\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"HBSAG\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:15641\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:15651\"}]',2),(53,'3','TPHA','[{\"Gender\": \"All\", \"$$hashKey\": \"object:16170\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"VRDL\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:16180\", \"unit_name\": \"ml\"}]','[{\"qty\": \"2\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:16190\"}]',2),(54,'3','TROPONIN-1','[{\"Gender\": \"All\", \"$$hashKey\": \"object:16712\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"TROPONIN-1\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:16722\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"1\", \"med_name\": \"D5 DEXTROSE INJ\", \"$$hashKey\": \"object:16732\"}]',2),(55,'3','CHIKUNGUNYA','[{\"Gender\": \"All\", \"$$hashKey\": \"object:17257\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"CHIKUNGUNYA\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:17267\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:17277\"}]',2),(56,'3','ASO','[{\"Gender\": \"All\", \"$$hashKey\": \"object:18758\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"ASO\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:18768\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:18778\"}]',2),(57,'3','RA FACTOR','[{\"Gender\": \"All\", \"$$hashKey\": \"object:19309\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"RA FACTOR\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:19319\", \"unit_name\": \"ml\"}]','[{\"qty\": \"2\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:19329\"}]',2),(58,'3','CRP','[{\"Gender\": \"All\", \"$$hashKey\": \"object:19863\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"CRP\"}]','[{\"qty\": \"2\", \"sample\": \"SERUM\", \"remarks\": \"\", \"$$hashKey\": \"object:19873\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:19883\"}]',2),(59,'1','DIFFERENTIAL COUNT','[{\"Gender\": \"All\", \"endRange\": \"70\", \"$$hashKey\": \"object:20423\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"40\", \"subInvestigation\": \"NEUTROPHILES\"}, {\"Gender\": \"All\", \"endRange\": \"45\", \"$$hashKey\": \"object:20756\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"20\", \"subInvestigation\": \"LYMPHOCYTES\"}, {\"Gender\": \"All\", \"endRange\": \"10\", \"$$hashKey\": \"object:20772\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"2\", \"subInvestigation\": \"MONOCYTES\"}, {\"Gender\": \"All\", \"endRange\": \"6\", \"$$hashKey\": \"object:20788\", \"rangeType\": \"Range\", \"unit_name\": \"%\", \"startRange\": \"2\", \"subInvestigation\": \"EOSINOPHILES\"}]','[{\"qty\": \"2\", \"sample\": \"EDTA BLOOD\", \"remarks\": \"\", \"$$hashKey\": \"object:20433\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:20443\"}]',2),(60,'4','PH','[{\"Gender\": \"All\", \"endRange\": \"9.0\", \"$$hashKey\": \"object:21814\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"5.0\", \"subInvestigation\": \"PH\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:21824\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:21834\"}]',2),(61,'4','SPECIFIC GRAVITY','[{\"Gender\": \"All\", \"endRange\": \"1.030\", \"$$hashKey\": \"object:22386\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"1.010\", \"subInvestigation\": \"SPECIFIC GRAVITY\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:22396\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:22406\"}]',2),(62,'4','24 HOURS PRITEIN','[{\"Gender\": \"All\", \"endRange\": \"-\", \"$$hashKey\": \"object:22953\", \"rangeType\": \"Range\", \"unit_name\": \"-\", \"startRange\": \"-\", \"subInvestigation\": \"24 HOURS PRITEIN\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:22963\", \"unit_name\": \"ML\"}]','[{\"qty\": \"2\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:22973\"}]',2),(63,'4','MICRO PROTEINS','[{\"Gender\": \"All\", \"$$hashKey\": \"object:23520\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"MICRO PROTEINS\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:23530\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:23540\"}]',2),(64,'4','MICRO ALBUMIN','[{\"Gender\": \"All\", \"$$hashKey\": \"object:24094\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"MICRO ALBUMIN\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:24104\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:24114\"}]',2),(65,'4','BENCE JONES PROTEINS','[{\"Gender\": \"All\", \"$$hashKey\": \"object:24671\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"BENCE JONES PROTEINS\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:24681\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:24691\"}]',2),(66,'4','CHYLE','[{\"Gender\": \"All\", \"$$hashKey\": \"object:25259\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"CHYLE\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:25269\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:25279\"}]',2),(67,'4','BILE SALT&BILE PIGMENTS','[{\"Gender\": \"All\", \"$$hashKey\": \"object:25842\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"B.SALT\"}, {\"Gender\": \"All\", \"$$hashKey\": \"object:25997\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"B.PIGMENTS\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:25852\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:25862\"}]',2),(68,'4','KETONE BODIES','[{\"Gender\": \"All\", \"$$hashKey\": \"object:26448\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"KETONE BODIES\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:26458\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"3\", \"med_name\": \"METRIS metronidazole\", \"$$hashKey\": \"object:26468\"}]',2),(69,'4','GLUCOSE','[{\"Gender\": \"All\", \"$$hashKey\": \"object:27037\", \"rangeType\": \"T/F\", \"trueValue\": \"POSITIVE\", \"unit_name\": \"-\", \"falseValue\": \"NEGATIVE\", \"subInvestigation\": \"GLUCOSE\"}]','[{\"qty\": \"3\", \"sample\": \"URINE\", \"remarks\": \"\", \"$$hashKey\": \"object:27047\", \"unit_name\": \"ml\"}]','[{\"qty\": \"1\", \"med_id\": \"4\", \"med_name\": \"RL 500 ML\", \"$$hashKey\": \"object:27057\"}]',2),(71,'1','s','[{\"$$hashKey\": \"object:617\", \"rangeType\": \"Range\"}]','[{\"remarks\": \"\", \"$$hashKey\": \"object:627\"}]','[{\"$$hashKey\": \"object:637\"}]',6),(72,'2','s','[{\"$$hashKey\": \"object:1050\", \"rangeType\": \"Range\"}]','[{\"remarks\": \"\", \"$$hashKey\": \"object:1060\"}]','[{\"$$hashKey\": \"object:1070\"}]',9),(73,'2','s','[{\"$$hashKey\": \"object:271\", \"rangeType\": \"Range\"}]','[{\"remarks\": \"\", \"$$hashKey\": \"object:281\"}]','[{\"$$hashKey\": \"object:291\"}]',9),(74,'3','dc','[{\"$$hashKey\": \"object:704\", \"rangeType\": \"Range\"}]','[{\"remarks\": \"\", \"$$hashKey\": \"object:714\"}]','[{\"$$hashKey\": \"object:724\"}]',6),(75,'2','ssssd','[{\"$$hashKey\": \"object:271\", \"rangeType\": \"Range\"}]','[{\"remarks\": \"\", \"$$hashKey\": \"object:281\"}]','[{\"$$hashKey\": \"object:291\"}]',9),(76,'2','sss','[{\"Gender\": \"M\", \"remarks\": \"sfasdfa sample data\", \"endRange\": \"341\", \"$$hashKey\": \"object:271\", \"rangeType\": \"Range\", \"unit_name\": \"431\", \"startRange\": \"331\", \"subInvestigation\": \"sss\"}, {\"Gender\": \"M\", \"endRange\": \"331\", \"$$hashKey\": \"object:603\", \"rangeType\": \"Range\", \"unit_name\": \"431\", \"startRange\": \"541\", \"subInvestigation\": \"fff\"}]','[{\"qty\": \"3341\", \"sample\": \"sss\", \"remarks\": \"sss\", \"$$hashKey\": \"object:281\", \"unit_name\": \"231\"}]','[{\"qty\": \"331\", \"med_id\": \"2\", \"med_name\": \"DNS 500 ML\", \"$$hashKey\": \"object:291\"}]',6),(77,'3','asdfsdf 1','[{\"$$hashKey\": \"object:1275\", \"rangeType\": \"Range\"}]','[{\"remarks\": \"\", \"$$hashKey\": \"object:1285\"}]','[{\"$$hashKey\": \"object:1295\"}]',9),(78,'6','X-RAY','[{\"$$hashKey\": \"object:274\", \"rangeType\": \"Range\"}]','[{\"remarks\": \"\", \"$$hashKey\": \"object:284\"}]','[{\"$$hashKey\": \"object:294\"}]',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_test_groups`
--

LOCK TABLES `lab_test_groups` WRITE;
/*!40000 ALTER TABLE `lab_test_groups` DISABLE KEYS */;
INSERT INTO `lab_test_groups` VALUES (1,'HEMOTOLOGY',1),(2,'BIO CHEMISTRY',1),(3,'SEROLOGY',1),(4,'URINE',1),(5,'MHC',1),(6,'X-RAY',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'LOC1','1st floor','Reception',1,1,1),(2,'LOC2','1st floor','LAB',1,1,5),(3,'LOC3','1st floor','NTR Vaidya seva room',1,1,2),(4,'LOC4','2nd floor','I.C.U ROOM ( 1 )',1,1,7),(5,'LOC5','3rd floor','General ward ( MALE )',1,1,6),(6,'LOC6','3rd floor','Special Room ( 1 )',1,1,6),(7,'LOC7','2nd floor','O.T ( MODULAR THEARTRE  )',1,1,2),(8,'LOC8','Ground Floor','CASUALITY',1,1,1),(9,'LOC9','2nd floor','I.C.U ROOM ( 2 )',1,1,NULL),(10,'LOC10','3rd Floor','General Ward ( Female )',1,1,NULL),(11,'LOC11','3rd Floor','Special Room ( 2 )',1,1,NULL),(12,'LOC12','3rd Floor','Special Room ( 3 )',1,1,NULL),(13,'LOC13','3rd Floor','Special Room ( 4 )',1,1,NULL),(14,'LOC14','1 st Floor','CONSULTATION ROOM 1',1,1,NULL),(15,'LOC15','1st Floor','CONSULTATION ROOM 2',1,1,NULL),(16,'LOC16','1st Floor','IN HOUSE PHARMACY',1,1,NULL),(17,'LOC17','1st Floor','ACCOUNTS ROOM',1,1,NULL),(18,'LOC18','1st Floor','IT ROOM',1,1,NULL),(19,'LOC19','1st Floor','CHAIRMAN ROOM',1,1,NULL),(20,'LOC20','1st Floor','X-RAY IMAGINING & THREDMILL ROOM',1,1,NULL),(21,'LOC21','1st Floor','DOCTORS TOILETS ROOM',1,1,NULL),(22,'LOC22','1st Floor','X-RAY ROOM',1,1,NULL),(23,'LOC23','1st Floor','RECEPTION & WAITING HALL',1,1,NULL),(24,'LOC24','1st Floor','PATIEANT TOILET',1,1,NULL),(25,'LOC25','1st Floor','PHYSOTHEREPY ROOM',1,1,NULL),(26,'LOC26','1st Floor','SMALL STORE ROOM',1,1,NULL),(27,'LOC27','2ND Floor','OT ( SMALL )',1,1,NULL),(28,'LOC28','2ND Floor','LABOUR ROOM',1,1,NULL),(29,'LOC29','2ND Floor','FEMALE DRESSING ROOM',1,1,NULL),(30,'LOC30','2ND Floor','DOCTORES REST ROOM',1,1,NULL),(31,'LOC31','2ND Floor','DUTY DOCTORS REST ROOM',1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_inward_register`
--

LOCK TABLES `medicine_inward_register` WRITE;
/*!40000 ALTER TABLE `medicine_inward_register` DISABLE KEYS */;
INSERT INTO `medicine_inward_register` VALUES (1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-05-05',15,1,4,'92229','2019-04-01',1,4,116.5200,29.13,29.13,NULL),(2,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-05-05',15,1,1,'1175323','2020-08-01',5,5,32.0000,32,32,NULL),(3,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,'2018-05-05',15,1,4,'17056','2020-04-01',6,9,52.0000,13,13,NULL),(4,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,'2018-05-05',15,1,4,'1174606','2020-10-01',10,13,188.0000,47,47,NULL),(5,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,'2018-05-05',15,1,6,'2171218','2020-07-01',14,19,180.0000,30,30,NULL),(6,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,'2018-05-05',15,1,3,'692025','2019-06-01',20,22,69.0000,23,23,NULL),(7,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,'2018-05-05',15,1,2,'263610','2018-05-01',23,24,38.0000,19,19,NULL),(8,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,'2018-05-05',15,1,2,'1090','2021-03-01',25,26,22.0000,17,11,NULL),(9,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,'2018-05-05',15,1,2,'7902','2019-07-01',27,28,10.0000,5,5,NULL),(10,NULL,NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,'2018-05-05',15,1,3,'6231','2018-06-01',29,31,15.0000,5,5,NULL),(11,NULL,NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,'2018-05-05',15,1,4,'17232','2019-01-01',32,35,24.0000,6,6,NULL),(12,NULL,NULL,NULL,NULL,NULL,26,NULL,NULL,NULL,'2018-05-05',15,1,4,'7102','2018-12-01',36,39,108.0000,27,27,NULL),(13,NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,'2018-05-05',15,1,3,'3162030','2018-11-01',40,42,12.0000,4,4,NULL),(14,NULL,NULL,NULL,NULL,NULL,23,NULL,NULL,NULL,'2018-05-05',15,1,2,'6016','2020-03-01',43,44,24.0000,12,12,NULL),(15,NULL,NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,'2018-05-05',15,1,1,'2708','2019-05-01',45,45,14.0000,14,14,NULL),(16,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,NULL,'2018-05-05',15,1,5,'17063','2019-08-01',46,50,55.0000,11,11,NULL),(17,NULL,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,'2018-05-05',15,1,1,'1169141','2019-03-01',51,51,48.0000,48,48,NULL),(18,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL,NULL,'2018-05-05',15,1,2,'670266','2020-07-01',52,53,40.0000,20,20,NULL),(19,NULL,NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,'2018-05-05',15,1,2,'2417108','2019-02-01',54,55,8.0000,4,4,NULL),(20,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,'2018-05-05',15,1,2,'38006','2019-01-01',56,57,8.0000,4,4,NULL),(21,NULL,NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,'2018-05-05',15,1,2,'1019','2019-08-01',58,59,10.0000,5,5,NULL),(22,NULL,NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,'2018-05-05',15,1,4,'896','2019-10-01',60,63,20.0000,5,5,NULL),(23,NULL,NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,'2018-05-05',15,1,3,'0088','2020-06-01',64,66,33.0000,11,11,NULL),(24,NULL,NULL,NULL,NULL,NULL,21,NULL,NULL,NULL,'2018-05-05',15,1,2,'1334061','2018-11-01',67,68,54.0000,27,27,NULL),(25,NULL,NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,'2018-05-05',15,1,4,'1614','2018-09-01',69,72,76.0000,19,19,NULL),(26,NULL,NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,'2018-05-05',15,1,2,'75206','2019-10-01',73,74,44.0000,22,22,NULL),(27,NULL,NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,'2018-05-05',15,1,1,'2172683','2020-10-01',75,75,29.0000,29,29,NULL),(28,NULL,NULL,NULL,NULL,NULL,29,NULL,NULL,NULL,'2018-05-05',15,1,1,'74074','2019-08-01',76,76,11.0000,11,11,NULL),(29,NULL,NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,'2018-05-22',1,3,2,'17004','2019-01-01',77,78,228.0000,114,114,NULL),(30,NULL,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,'2018-05-22',1,3,7,'90002','2018-11-01',79,85,2541.0000,363,363,NULL),(31,NULL,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,'2018-05-22',1,3,3,'675002','2019-08-01',86,88,804.0000,267,268,NULL),(32,NULL,NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,'2018-05-22',1,3,2,'17004','2019-01-01',89,90,228.0000,114,114,NULL),(33,NULL,NULL,NULL,NULL,NULL,32,NULL,NULL,NULL,'2018-05-22',1,3,7,'90002','2018-11-01',91,97,2541.0000,363,363,NULL),(34,NULL,NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,'2018-05-22',1,3,3,'675002','2019-08-01',98,100,804.0000,267,268,NULL),(35,NULL,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,'2018-05-22',1,3,3,'170033','2019-10-01',101,103,426.0000,142,142,NULL),(36,NULL,NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,'2018-05-22',1,3,3,'170033','2019-10-01',104,106,426.0000,142,142,NULL),(37,NULL,NULL,NULL,NULL,NULL,35,NULL,NULL,NULL,'2018-05-22',1,3,1,'102417','2019-10-01',107,107,846.0000,846,846,NULL),(38,1,1,'1212121','2018-06-02',505,2,50,50,505,'2018-06-02',1,3,100,'213123','2020-06-10',108,157,NULL,NULL,NULL,0.0000),(39,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-06-02',58,3,20,'5555','2020-06-11',158,177,200.0000,12,10,NULL),(40,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'1970-01-01',1,3,10,'2424242424','2018-08-03',178,187,NULL,20,18,NULL),(41,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'1970-01-01',1,3,10,'454544545','2018-08-10',188,197,NULL,20,18,NULL),(42,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-06-08',1,3,2,'656565656565656','2019-03-01',198,199,NULL,20,20,NULL),(43,3,2,'4567','2018-06-12',631.25,2,50,50,505,'1970-01-01',1,3,100,'4321','2020-06-17',198,247,NULL,NULL,NULL,0.0000),(44,3,2,'4567','2018-06-12',631.25,12,25,25,126.25,'1970-01-01',1,3,50,'5432','2020-06-30',248,272,NULL,NULL,NULL,0.0000),(45,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,'1970-01-01',59,3,40,'6868','2019-06-12',273,312,NULL,4,3,NULL),(46,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-06-12',59,1,2,'6767','2020-06-12',313,314,NULL,12,12,NULL),(47,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-06-15',59,1,1,'1131212','2020-06-14',313,313,NULL,12,12,NULL),(48,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2018-06-15',59,1,1,'343434','2020-06-15',313,313,NULL,12,12,NULL),(49,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,'2018-06-15',59,1,1,'231123123','2020-07-16',313,313,NULL,17,17,NULL),(50,2,3,'544545454','2018-06-15',121.2,1,0,10,121.2,'1970-01-01',1,3,10,'54545454','2018-08-11',313,322,NULL,NULL,NULL,0.0000),(51,NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,'2018-06-19',59,3,1,'2423','2020-06-19',323,323,NULL,4,4,NULL),(52,2,4,'565567676','2018-06-19',1131.2,1,0,10,121.2,'1970-01-01',1,3,10,'5656756','2018-09-22',323,332,NULL,NULL,NULL,0.0000),(53,2,4,'565567676','2018-06-19',1131.2,2,0,100,1010,'1970-01-01',1,3,100,'68655866','2018-09-22',333,432,NULL,NULL,NULL,0.0000),(54,10,5,'6767','2018-06-20',92.92,8,5,5,60.6,'1970-01-01',1,3,10,'1929','2020-06-20',433,437,NULL,NULL,NULL,0.0000),(55,10,5,'6767','2018-06-20',92.92,14,4,4,32.32,'1970-01-01',1,3,8,'2939','2020-06-20',438,441,NULL,NULL,NULL,0.0000),(56,10,5,'4556','2018-06-20',20.2,8,4,1,12.12,'1970-01-01',1,3,10,'8979','2020-07-14',442,442,NULL,NULL,NULL,0.0000),(57,10,5,'4556','2018-06-20',20.2,14,3,1,8.08,'1970-01-01',1,3,8,'6859','2020-06-17',443,443,NULL,NULL,NULL,0.0000),(58,2,NULL,'4534534534','2018-06-21',106.2,1,NULL,10,90,'2018-06-21',1,3,NULL,'423423423423','2018-08-15',444,454,NULL,NULL,NULL,NULL),(59,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,'2018-06-22',59,2,2,'43534','2020-06-10',444,445,NULL,12,12,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_outward_register`
--

LOCK TABLES `medicine_outward_register` WRITE;
/*!40000 ALTER TABLE `medicine_outward_register` DISABLE KEYS */;
INSERT INTO `medicine_outward_register` VALUES (1,3,1,1,20,10,58,'2018-06-02 06:19:43',1,'BRM MEDICAL STORE','CASUALITY','5555','2020-06-11'),(2,3,1,2,17,7,59,'2018-06-12 02:06:02',2,'BRM MEDICAL STORE','CASUALITY','213123','2020-06-10'),(3,3,5,2,6,2,1,'2018-06-15 05:39:40',3,'BRM MEDICAL STORE','ICU MEDICALS','213123','2020-06-10'),(4,3,5,12,25,2,1,'2018-06-15 05:39:40',3,'BRM MEDICAL STORE','ICU MEDICALS','5432','2020-06-30'),(5,3,2,2,49,10,1,'2018-06-19 08:00:57',4,'BRM MEDICAL STORE','OT MODULAR THEATRE','4321','2020-06-17'),(6,3,2,10,381,10,1,'2018-06-19 08:00:57',4,'BRM MEDICAL STORE','OT MODULAR THEATRE','6868','2019-06-12'),(7,3,2,10,371,10,1,'2018-06-19 08:01:16',5,'BRM MEDICAL STORE','OT MODULAR THEATRE','6868','2019-06-12'),(8,3,7,10,361,61,59,'2018-06-20 04:42:23',6,'BRM MEDICAL STORE','LAB','6868','2019-06-12');
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
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_sequence_nos`
--

LOCK TABLES `medicine_sequence_nos` WRITE;
/*!40000 ALTER TABLE `medicine_sequence_nos` DISABLE KEYS */;
INSERT INTO `medicine_sequence_nos` VALUES (1,NULL,1,1),(2,NULL,1,2),(3,NULL,1,3),(4,NULL,1,4),(5,NULL,2,5),(6,NULL,3,6),(7,NULL,3,7),(8,NULL,3,8),(9,NULL,3,9),(10,NULL,4,10),(11,NULL,4,11),(12,NULL,4,12),(13,NULL,4,13),(14,NULL,5,14),(15,NULL,5,15),(16,NULL,5,16),(17,NULL,5,17),(18,NULL,5,18),(19,NULL,5,19),(20,NULL,6,20),(21,NULL,6,21),(22,NULL,6,22),(23,NULL,7,23),(24,NULL,7,24),(25,NULL,10,25),(26,NULL,10,26),(27,NULL,9,27),(28,NULL,9,28),(29,NULL,12,29),(30,NULL,12,30),(31,NULL,12,31),(32,NULL,16,32),(33,NULL,16,33),(34,NULL,16,34),(35,NULL,16,35),(36,NULL,26,36),(37,NULL,26,37),(38,NULL,26,38),(39,NULL,26,39),(40,NULL,25,40),(41,NULL,25,41),(42,NULL,25,42),(43,NULL,23,43),(44,NULL,23,44),(45,NULL,24,45),(46,NULL,11,46),(47,NULL,11,47),(48,NULL,11,48),(49,NULL,11,49),(50,NULL,11,50),(51,NULL,13,51),(52,NULL,8,52),(53,NULL,8,53),(54,NULL,14,54),(55,NULL,14,55),(56,NULL,17,56),(57,NULL,17,57),(58,NULL,18,58),(59,NULL,18,59),(60,NULL,20,60),(61,NULL,20,61),(62,NULL,20,62),(63,NULL,20,63),(64,NULL,19,64),(65,NULL,19,65),(66,NULL,19,66),(67,NULL,21,67),(68,NULL,21,68),(69,NULL,22,69),(70,NULL,22,70),(71,NULL,22,71),(72,NULL,22,72),(73,NULL,27,73),(74,NULL,27,74),(75,NULL,28,75),(76,NULL,29,76),(77,NULL,31,77),(78,NULL,31,78),(79,NULL,32,79),(80,NULL,32,80),(81,NULL,32,81),(82,NULL,32,82),(83,NULL,32,83),(84,NULL,32,84),(85,NULL,32,85),(86,NULL,33,86),(87,NULL,33,87),(88,NULL,33,88),(89,NULL,31,89),(90,NULL,31,90),(91,NULL,32,91),(92,NULL,32,92),(93,NULL,32,93),(94,NULL,32,94),(95,NULL,32,95),(96,NULL,32,96),(97,NULL,32,97),(98,NULL,33,98),(99,NULL,33,99),(100,NULL,33,100),(101,NULL,34,101),(102,NULL,34,102),(103,NULL,34,103),(104,NULL,34,104),(105,NULL,34,105),(106,NULL,34,106),(107,NULL,35,107),(108,1,2,108),(109,1,2,109),(110,1,2,110),(111,1,2,111),(112,1,2,112),(113,1,2,113),(114,1,2,114),(115,1,2,115),(116,1,2,116),(117,1,2,117),(118,1,2,118),(119,1,2,119),(120,1,2,120),(121,1,2,121),(122,1,2,122),(123,1,2,123),(124,1,2,124),(125,1,2,125),(126,1,2,126),(127,1,2,127),(128,1,2,128),(129,1,2,129),(130,1,2,130),(131,1,2,131),(132,1,2,132),(133,1,2,133),(134,1,2,134),(135,1,2,135),(136,1,2,136),(137,1,2,137),(138,1,2,138),(139,1,2,139),(140,1,2,140),(141,1,2,141),(142,1,2,142),(143,1,2,143),(144,1,2,144),(145,1,2,145),(146,1,2,146),(147,1,2,147),(148,1,2,148),(149,1,2,149),(150,1,2,150),(151,1,2,151),(152,1,2,152),(153,1,2,153),(154,1,2,154),(155,1,2,155),(156,1,2,156),(157,1,2,157),(158,NULL,1,158),(159,NULL,1,159),(160,NULL,1,160),(161,NULL,1,161),(162,NULL,1,162),(163,NULL,1,163),(164,NULL,1,164),(165,NULL,1,165),(166,NULL,1,166),(167,NULL,1,167),(168,NULL,1,168),(169,NULL,1,169),(170,NULL,1,170),(171,NULL,1,171),(172,NULL,1,172),(173,NULL,1,173),(174,NULL,1,174),(175,NULL,1,175),(176,NULL,1,176),(177,NULL,1,177),(178,NULL,2,178),(179,NULL,2,179),(180,NULL,2,180),(181,NULL,2,181),(182,NULL,2,182),(183,NULL,2,183),(184,NULL,2,184),(185,NULL,2,185),(186,NULL,2,186),(187,NULL,2,187),(188,NULL,2,188),(189,NULL,2,189),(190,NULL,2,190),(191,NULL,2,191),(192,NULL,2,192),(193,NULL,2,193),(194,NULL,2,194),(195,NULL,2,195),(196,NULL,2,196),(197,NULL,2,197),(198,2,2,198),(199,2,2,199),(200,2,2,200),(201,2,2,201),(202,2,2,202),(203,2,2,203),(204,2,2,204),(205,2,2,205),(206,2,2,206),(207,2,2,207),(208,2,2,208),(209,2,2,209),(210,2,2,210),(211,2,2,211),(212,2,2,212),(213,2,2,213),(214,2,2,214),(215,2,2,215),(216,2,2,216),(217,2,2,217),(218,2,2,218),(219,2,2,219),(220,2,2,220),(221,2,2,221),(222,2,2,222),(223,2,2,223),(224,2,2,224),(225,2,2,225),(226,2,2,226),(227,2,2,227),(228,2,2,228),(229,2,2,229),(230,2,2,230),(231,2,2,231),(232,2,2,232),(233,2,2,233),(234,2,2,234),(235,2,2,235),(236,2,2,236),(237,2,2,237),(238,2,2,238),(239,2,2,239),(240,2,2,240),(241,2,2,241),(242,2,2,242),(243,2,2,243),(244,2,2,244),(245,2,2,245),(246,2,2,246),(247,2,2,247),(248,2,12,248),(249,2,12,249),(250,2,12,250),(251,2,12,251),(252,2,12,252),(253,2,12,253),(254,2,12,254),(255,2,12,255),(256,2,12,256),(257,2,12,257),(258,2,12,258),(259,2,12,259),(260,2,12,260),(261,2,12,261),(262,2,12,262),(263,2,12,263),(264,2,12,264),(265,2,12,265),(266,2,12,266),(267,2,12,267),(268,2,12,268),(269,2,12,269),(270,2,12,270),(271,2,12,271),(272,2,12,272),(273,NULL,10,273),(274,NULL,10,274),(275,NULL,10,275),(276,NULL,10,276),(277,NULL,10,277),(278,NULL,10,278),(279,NULL,10,279),(280,NULL,10,280),(281,NULL,10,281),(282,NULL,10,282),(283,NULL,10,283),(284,NULL,10,284),(285,NULL,10,285),(286,NULL,10,286),(287,NULL,10,287),(288,NULL,10,288),(289,NULL,10,289),(290,NULL,10,290),(291,NULL,10,291),(292,NULL,10,292),(293,NULL,10,293),(294,NULL,10,294),(295,NULL,10,295),(296,NULL,10,296),(297,NULL,10,297),(298,NULL,10,298),(299,NULL,10,299),(300,NULL,10,300),(301,NULL,10,301),(302,NULL,10,302),(303,NULL,10,303),(304,NULL,10,304),(305,NULL,10,305),(306,NULL,10,306),(307,NULL,10,307),(308,NULL,10,308),(309,NULL,10,309),(310,NULL,10,310),(311,NULL,10,311),(312,NULL,10,312),(313,3,1,313),(314,3,1,314),(315,3,1,315),(316,3,1,316),(317,3,1,317),(318,3,1,318),(319,3,1,319),(320,3,1,320),(321,3,1,321),(322,3,1,322),(323,4,1,323),(324,4,1,324),(325,4,1,325),(326,4,1,326),(327,4,1,327),(328,4,1,328),(329,4,1,329),(330,4,1,330),(331,4,1,331),(332,4,1,332),(333,4,2,333),(334,4,2,334),(335,4,2,335),(336,4,2,336),(337,4,2,337),(338,4,2,338),(339,4,2,339),(340,4,2,340),(341,4,2,341),(342,4,2,342),(343,4,2,343),(344,4,2,344),(345,4,2,345),(346,4,2,346),(347,4,2,347),(348,4,2,348),(349,4,2,349),(350,4,2,350),(351,4,2,351),(352,4,2,352),(353,4,2,353),(354,4,2,354),(355,4,2,355),(356,4,2,356),(357,4,2,357),(358,4,2,358),(359,4,2,359),(360,4,2,360),(361,4,2,361),(362,4,2,362),(363,4,2,363),(364,4,2,364),(365,4,2,365),(366,4,2,366),(367,4,2,367),(368,4,2,368),(369,4,2,369),(370,4,2,370),(371,4,2,371),(372,4,2,372),(373,4,2,373),(374,4,2,374),(375,4,2,375),(376,4,2,376),(377,4,2,377),(378,4,2,378),(379,4,2,379),(380,4,2,380),(381,4,2,381),(382,4,2,382),(383,4,2,383),(384,4,2,384),(385,4,2,385),(386,4,2,386),(387,4,2,387),(388,4,2,388),(389,4,2,389),(390,4,2,390),(391,4,2,391),(392,4,2,392),(393,4,2,393),(394,4,2,394),(395,4,2,395),(396,4,2,396),(397,4,2,397),(398,4,2,398),(399,4,2,399),(400,4,2,400),(401,4,2,401),(402,4,2,402),(403,4,2,403),(404,4,2,404),(405,4,2,405),(406,4,2,406),(407,4,2,407),(408,4,2,408),(409,4,2,409),(410,4,2,410),(411,4,2,411),(412,4,2,412),(413,4,2,413),(414,4,2,414),(415,4,2,415),(416,4,2,416),(417,4,2,417),(418,4,2,418),(419,4,2,419),(420,4,2,420),(421,4,2,421),(422,4,2,422),(423,4,2,423),(424,4,2,424),(425,4,2,425),(426,4,2,426),(427,4,2,427),(428,4,2,428),(429,4,2,429),(430,4,2,430),(431,4,2,431),(432,4,2,432),(433,5,8,433),(434,5,8,434),(435,5,8,435),(436,5,8,436),(437,5,8,437),(438,5,14,438),(439,5,14,439),(440,5,14,440),(441,5,14,441),(442,5,8,442),(443,5,14,443);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_stock_register`
--

LOCK TABLES `medicine_stock_register` WRITE;
/*!40000 ALTER TABLE `medicine_stock_register` DISABLE KEYS */;
INSERT INTO `medicine_stock_register` VALUES (1,1,1,0,'92229','2019-04-01'),(2,1,2,0,'1175323','2020-08-01'),(3,1,3,0,'17056','2020-04-01'),(4,1,4,4,'1174606','2020-10-01'),(5,1,5,6,'2171218','2020-07-01'),(6,1,6,0,'692025','2019-06-01'),(7,1,7,2,'263610','2018-05-01'),(8,1,10,0,'1090','2021-03-01'),(9,1,9,0,'7902','2019-07-01'),(10,1,12,3,'6231','2018-06-01'),(11,1,16,0,'17232','2019-01-01'),(12,1,26,0,'7102','2018-12-01'),(13,1,25,0,'3162030','2018-11-01'),(14,1,23,0,'6016','2020-03-01'),(15,1,24,0,'2708','2019-05-01'),(16,1,11,0,'17063','2019-08-01'),(17,1,13,0,'1169141','2019-03-01'),(18,1,8,0,'670266','2020-07-01'),(19,1,14,0,'2417108','2019-02-01'),(20,1,17,1,'38006','2019-01-01'),(21,1,18,0,'1019','2019-08-01'),(22,1,20,0,'896','2019-10-01'),(23,1,19,3,'0088','2020-06-01'),(24,1,21,0,'1334061','2018-11-01'),(25,1,22,0,'1614','2018-09-01'),(26,1,27,0,'75206','2019-10-01'),(27,1,28,1,'2172683','2020-10-01'),(28,1,29,0,'74074','2019-08-01'),(29,3,2,0,'213123','2020-06-10'),(30,3,1,1,'5555','2020-06-11'),(31,1,1,0,'5555','2020-06-11'),(32,3,14,0,'78787878','2018-06-02'),(33,3,20,0,'3434','2018-06-02'),(34,1,16,0,'12345','2018-07-06'),(35,1,11,0,'23456','2018-07-06'),(36,1,14,0,'34567','2018-07-06'),(37,1,1,0,'6546456','2020-07-22'),(38,3,2,0,'2424242424','2018-08-03'),(39,3,2,0,'454544545','2018-08-10'),(40,1,8,0,'1212121212121212','2018-09-07'),(41,1,8,0,'1212121212121212121','2018-11-02'),(42,3,2,0,'656565656565656','2019-03-01'),(43,3,2,39,'4321','2020-06-17'),(44,3,12,15,'5432','2020-06-30'),(45,3,10,300,'6868','2019-06-12'),(46,1,2,0,'213123','2020-06-10'),(47,3,11,8,'4545','2018-06-12'),(48,1,1,0,'6767','2020-06-12'),(49,1,1,0,'1131212','2020-06-14'),(50,1,1,0,'343434','2020-06-15'),(51,1,10,0,'231123123','2020-07-16'),(52,5,2,2,'213123','2020-06-10'),(53,5,12,2,'5432','2020-06-30'),(54,3,1,0,'54545454','2018-08-11'),(55,3,10,1,'2423','2020-06-19'),(56,3,1,0,'5656756','2018-09-22'),(57,3,2,88,'68655866','2018-09-22'),(58,2,2,6,'4321','2020-06-17'),(59,2,10,18,'6868','2019-06-12'),(60,3,8,3,'1929','2020-06-20'),(61,3,14,0,'2939','2020-06-20'),(62,3,8,1,'8979','2020-07-14'),(63,3,14,0,'6859','2020-06-17'),(64,7,10,61,'6868','2019-06-12'),(65,3,15,0,'6456','2018-06-20'),(66,3,33,0,'076456','2018-06-20'),(67,3,1,10,'423423423423','2018-08-15'),(68,2,2,2,'43534','2020-06-10');
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
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (1,'3','antibiotics','D5 DEXTROSE INJ','infutec health care limited','dextrose','Yes','FLUID','FLUID',1,1,'3','6KA92282','30048945','gghggh','H','1','',1,0),(2,'3','antibiotics','DNS 500 ML','ACULIFE','SODIUM CHLORIDE','Yes','FLUID','FLUID',1,1,'5','1175323','30045020','appolo','H','1','',1,0),(3,'3','antibiotics','METRIS metronidazole','Claris Otsuka','metronidazole','Yes','FLUID','FLUID',1,1,'3','C270728','90183892','Dr.reddys','H','1','',1,0),(4,'3','antibiotics','RL 500 ML','Claris Otsuka','compound sodium lactate inj','Yes','FLUID','FLUID',1,1,'3','C169537','30045020','sun pharmacy','H','1','',1,0),(5,'3','FLUID','20 M','Claris Otsuka','MANNITOL INJ','Yes','FLUID','FLUID',1,1,'3','1050003286','30049099','Dr.reddys','','1','',1,0),(6,'3','antibiotics','CIPROKEM 100ML INJ','ALKEM','CIPROFLOXACIN INJ','Yes','FLUID','FLUID',1,1,'3','7001','30042033','ALKA PHARMACEUTICALS','','1','',1,0),(7,'3','antibiotics','25 D','Claris Otsuka','DEXTROSE INJ','Yes','FLUID','FLUID',1,1,'3','1050002683','30049099','sun pharmacy','H','1','',1,0),(8,'3','antibiotics','Emeset 2ml','Cipla','Ondansetron inj','Yes','Ampoule','Ampoule',1,1,'3','670266','30049097','cipla','H','1','',1,0),(9,'3','antibiotics','Diken 3 ml inj','SEMUNS','Diclofenac sodium inj','Yes','Ampoule','Ampoule',1,1,'3','7902','84331110','SEMUNS','H','1','',1,0),(10,'3','injection','Epsolin 2 ml','Zydus','phenytoin sodium inj','Yes','Ampoule','Ampoule',1,1,'3','1090','30049099','ZYDUS','H','1','',10,1),(11,'3','injection','Buscogast inj','sansofi','Hyoscine butylibromide inj','Yes','Ampoule','Ampoule',1,1,'3','01003917','30045670','sansofi','','1','',1,3),(12,'3','injection','STEMIN INJ','Ind-Swift limited','Betamethasone sodium','Yes','Ampoule','Ampoule',1,1,'3','A16231','30045643','Ind-Swift limited','','1','',1,2),(13,'3','Ivs','GLUCI IV','NEON LABORATORIES','CALCIUM GLUCONATE','Yes','Ampoule','Ampoule',1,1,'3','1169141',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'3','injection','AVIL INJ','sansofi','PHENIRAMINE MALEATE INJ','Yes','Ampoule','Ampoule',1,1,'3','HP 173025',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'3','injection','VASOCAN INJ','NEON LABORATORIES','ADERNALINE BITARTARATE INJ','Yes','Ampoule','Ampoule',1,1,'3','85221',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'3','INJECTION','DEXASONE','CADILA PHARMA','Dexamethasone sodium phosphate','Yes','Ampoule','Ampoule',1,1,'3','1389',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'3','injection','TROPINE INJ','NEON LABORATORIES','ATROPINE SULPHATE INJ','Yes','Ampoule','Ampoule',1,1,'3','38006',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'3','injection','Deriphyllin  INJ','CADILA PHARMA','ETOFYLLINE THEOPHYLLINE','Yes','Ampoule','Ampoule',1,1,'3','BGS1019',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'3','injection','Eptoin inj','abbott pharma','phenytoin sodium inj','Yes','Ampoule','Ampoule',1,1,'3','apc0088',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'3','injection','BETNASOL','GSK','Betamethasone sodium phosphate','Yes','Ampoule','Ampoule',1,1,'3','GR 768',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'3','injection','DOMIN','NEON LABORATORIES','Sterile dopamine concentrate','Yes','Ampoule','Ampoule',1,1,'4','1334061',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'3','injection','Styptochrome inj','DR.Reddys','Estamsylate inj','Yes','Ampoule','Ampoule',1,1,'3','1614',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'3','injection','Hyocimax inj','Acme pharma','Hyoscine butylbromide inj','Yes','Ampoule','Ampoule',1,1,'3','HA6016',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'3','injection','KENADION 1','SAMARTH LIFE SCIENCE PVT LTD','phytomenadione inj','Yes','Ampoule','Ampoule',1,1,'3','2708',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'3','injection','FRUSIZEX INJ','ZEE LABORITIES','frusemide inj','Yes','Ampoule','Ampoule',1,1,'3','2038',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'3','injection','Tramosyn inj','senate laboratories','tramadol inj','Yes','Ampoule','Ampoule',1,1,'3','7102',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'3','BUDECORT','BUDECORT 2ml','CIPLA','Budesonide nebuliser','Yes','Ampoule','Ampoule',1,1,'3','209206',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'3','antibiotics','NS 500 ML','Otsuka pharmaceutical','SODIUM CHLORIDE','Yes','Ampoule','Ampoule',1,1,'3','2172683','30049099','sun pharmacy','H','1','',1,0),(29,'3','Inheller','duolin','Cipla','levosalbutamol and Ipratropium','Yes','Ampoule','Ampoule',1,1,'3','4074','9034','Cipla','H','1','',1,2),(30,'3','injection','LIZOLID','GLENMARK','LINEZOLID','Yes','Bottle','Bottle',1,1,'3','000','000','GLENMARK','H','0','',0,0),(31,'3','IP','OFLOKEM','AISHWARYA HEALTH CARE','OFLOXACIN IP','Yes','Bottle','Bottle',1,1,'3','000','000','ALKEM','H','0','0',0,0),(32,'3','IP','TOPMOL','INFUTEC','PARACETOMAL','Yes','Bottle','Bottle',1,1,'3','000','000','INFUTEC','H','0','0',0,0),(33,'3','IV','MOXIF IV','TORRENT','MOXIFLOXACIN','Yes','Bottle','Bottle',1,1,'3','000','000','TORRENT','','0','',0,0),(34,'3','IV','LEVOFLOX 500','CIPLA','LEVOFLOX 500','Yes','Bottle','Bottle',1,1,'3','000','000','CIPLA','H','0','',0,0),(35,'3','INJECTION','STROPIN','UNICHEM','CEREBROPROTEIN','Yes','Ampoule','Ampoule',1,1,'3','000','000','UNICHEM','','0','',0,0),(36,'3','INJECTION','CEFBACT S','CIPLA','CEFTRIAXONE','Yes','Vial','Vial',1,1,'3','000','000','CIPLA','H','0','0',0,0),(37,'3','INJECTION','CEZOSAL','NEON LABORATORIES','CEFOOERAZONE','Yes','Vial','Vial',1,1,'3','000','000','NEON LABORATORIES','H','0','0',0,0),(38,'3','INJECTION','EMICEL','CELON','IMIPENEM & CILASTAIN','Yes','Vial','Vial',1,1,'3','000','000','CELON','H','0','0',0,0),(39,'3','INJECTION','UNITAZ P','U LABS','PI[ERACILLIAN & TAZOBZCTAM','Yes','Vial','Vial',1,1,'3','000','000','U LABS','H','0','0',0,0),(40,'3','INJECTION','SULBACEF','BIOCHEM','SULBACTAM AND CEFOPERAZONE','Yes','Vial','Vial',1,1,'3','000','000','BIOCHEM','','0','0',0,0),(41,'3','INJECTION','FALCIGO','ZYDUS CADILA','ARTESUNATE INJ','Yes','Vial','Vial',1,1,'3','000','000','ZYDUS CADILA','','0','0',0,0),(42,'3','INJECTION','TAZOPEN','BIOCHEM','PIPERACILLIN AND TAZOBACTAM','Yes','Vial','Vial',1,1,'3','000','000','BIOCHEM','H','0','0',0,0),(43,'3','INJECTION','CORT S','NEON','HYDROCORTISONE','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(44,'3','INJECTION','PRIMACORT 100','MACLEODS PHARMA','HYDROCORTISONE','Yes','Vial','Vial',1,1,'3','000','000','MACLEODS PHARMA','H','0','0',0,0),(45,'3','INJECTION','AMIBIOTIC','NEON','AMIKACIN','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(46,'3','INJECTION','PANTOCAF IV','KNOLL HEALTH CARE','PANTOPRAZOLE','Yes','Vial','Vial',1,1,'3','000','000','KNOLL HEALTH CARE','H','0','0',0,0),(47,'3','INJECTION','CEFBACT-S','CIPLA','CEFTRIAXONE','Yes','Vial','Vial',1,1,'3','000','000','CIPLA','H','0','0',0,0),(48,'3','INJECTION','LOX 2%','NEON LABORATORIES','LINOCAINE HYDROCHLORIDE','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(49,'3','INJECTION','ANAWIN','NEON LABORATORIES','BUPIVACAINE','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(50,'3','INJECTION','COGNISTAR 60','LUPIN LTD','CEREBROPROTEIN','Yes','Vial','Vial',1,1,'3','000','000','LUIPIN LTD','H','0','0',0,0),(51,'3','INJECTION','MEDZOL','THEMIS MEDICARE','MIDAZOLAM','Yes','Vial','Vial',1,1,'3','000','000','THEMIS MEDICARE','H','0','0',0,0),(52,'3','INJECTION','LABLOL','NEON LABORATORIES','LABETALOL','Yes','Vial','Vial',1,1,'3','000','000','NEON','H','0','0',0,0),(53,'3','INJECTION','MUCOMIX','SAMARTH LIFE SCIENCE PVT LTD','ACETYLCYSTEINE','Yes','Ampoule','Ampoule',1,1,'3','000','000','SAMARTH','H','0','0',0,0),(54,'3','INJECTION','PROTAMINE SULPHATE','GLAND PHARMA','NEUTRA HEP','Yes','Ampoule','Ampoule',1,1,'3','000','000','GLAND PHARMA','H','0','0',0,0),(55,'3','INJECTION','LASIX','SANOFI INDIA LTD','frusemide inj','Yes','Ampoule','Ampoule',1,1,'3','000','000','SANOFI','H','0','0',0,0),(56,'3','INJECTION','SODIUM BICARBONATE','RATHI LAB','SODIUM BICARBONATE','Yes','Ampoule','Ampoule',1,1,'3','000','000','HINDUSTAN PVT LTD','H','0','0',0,0),(57,'3','INJECTION','TRANEXAMIC ACID','EMCURE PHARMA I','PAUSE INJ','Yes','Ampoule','Ampoule',1,1,'3','000','000','EMCURE PHARMA','H','0','0',0,0),(58,'3','INJECTION','DIGOXIN INJ','SAMARTH LIFE','DIXIN','Yes','Ampoule','Ampoule',1,1,'3','000','000','SAMARTH LIFE','H','0','0',0,0),(59,'3','injection','NORAD','NEON LABORATORIES','STERILE NORAD','Yes','Ampoule','Ampoule',1,1,'3','000','000','NEON','H','0','0',0,0),(60,'3','injection','RANTIDINE HYDROCHOLORIDE','LUPIN LTD','HELKOSS','Yes','Ampoule','Ampoule',1,1,'3','000','000','LUPIN LTD','H','0','0',0,0),(61,'3','INJECTION','PHENIRAMINE MALEATE','ZEE LABORITIES','PHENIRAMINE MALEATE INJ','Yes','Ampoule','Ampoule',1,1,'3','000','000','ZEE LABORATORIES','H','0','0',0,0),(62,'3','injection','DICLOFINAC','SEMUNS','DIKIEN','Yes','Ampoule','Ampoule',1,1,'3','000','000','SEMUNS','H','0','0',0,0),(63,'3','injection','GLYCOPYRROLATE INJ','CELON LABS','PYROLIN','Yes','Ampoule','Ampoule',1,1,'3','000','000','CELON LABS','H','0','0',0,0),(64,'3','INJECTION','ONDENSETRON / ZOFER','Cipla','EMESET','Yes','Ampoule','Ampoule',1,1,'3','000','000','CIPLA','H','0','0',0,0),(65,'3','injection','DIAZEPAM INJ','NEON LABORATORIES','LORI DIAZEPAM','Yes','Ampoule','Ampoule',1,1,'3','000','000','NEON','H','0','0',0,0),(66,'3','injection','EPTION','abbott pharma','phenytoin sodium inj','Yes','Ampoule','Ampoule',1,1,'3','000','000','ABBOTT PHARMA','H','0','0',0,0),(67,'3','injection','TRAMADOL INJ','SYNCOM PHARMA','TRAMOSYN','Yes','Ampoule','Ampoule',1,1,'3','000','000','SYNCON PHARMA','H','0','0',0,0),(68,'3','injection','BUSCOPAN','ZEE LABORITIES','Hyoscine butylibromide inj','Yes','Ampoule','Ampoule',1,1,'3','000','000','ZEE LABORITIES','H','0','0',0,0),(69,'3','injection','DERIPHYLLIN INJ','GERMAN REMEDIES','ETOFYLLINE AND THEOPHYLLINE ON','Yes','Ampoule','Ampoule',1,1,'3','000','000','GERMEN REMEDIES','H','0','0',0,0),(70,'3','injection','FEVASTIN','TABLETS INDIA','PARACETOMAL AND LINOCAINE','Yes','Ampoule','Ampoule',1,1,'3','000','000','TABLETS INDIA PVT LTD','H','0','0',0,0),(71,'3','injection','CATHFLUSH INJ','TROIKAA PHARMA','HEPARIN SOLUCTION','Yes','Ampoule','Ampoule',1,1,'3','000','000','TROIKAA PHARMA','H','0','0',0,0),(72,'3','injection','ADRENALINE','NEON LABORATORIES','VASOCON INJ','Yes','Ampoule','Ampoule',1,1,'3','000','000','NEON','H','0','0',0,0),(73,'3','injection','BETNESOL','GLAXO SMITHKLINE LTD','Betamethasone sodium','Yes','Ampoule','Ampoule',1,1,'3','000','000','GLAXO SMITHKLINE LTD','H','0','0',0,0),(74,'3','injection','VITAMIN K','SAMARTH LIFE','KENADION K','Yes','Ampoule','Ampoule',1,1,'3','000','000','SAMARTH LIFE','H','0','0',0,0),(75,'3','injection','ATROPINE','NEON LABORATORIES','ATROPINE SULPHATE INJ','Yes','Ampoule','Ampoule',1,1,'3','000','000','NEON','H','0','0',0,0),(76,'3','TABLETS','NITROCONTIN 2.6','MODI MUNDIPHARMA','CONTROLLED','Yes','Capsule','Capsule',1,1,'3','000','000','MODI MUNDIPHARMA PVT LTD','H','0','0',0,0),(77,'3','MASK','ADULT OXYGEN MASK','VINJOH HEALTH CARE','ADULT OXYGEN MASK','Yes','Nos','Nos',1,1,'3','000','000','VINJOH HEALTH CARE','H','0','0',0,0),(78,'3','KIT','OXYGEN RECOVERY KIT','LAKSHMI LIFE SCIENCES LTD','OXYGEN RECOVERY KIT','Yes','Nos','Nos',1,1,'3','000','000','LAKSHMI LIFE SCIENCE LTD','H','0','0',0,0),(79,'3','KIT','RAILES TUBE 12 SIZE','RAMSONS','RAILES TUBE 12 SIZE','Yes','Nos','Nos',1,1,'3','000','000','RAMSONS','H','0','0',0,0),(80,'3','KIT','RAILES TUBE 10 SIZE','RAMSONS','RAILES TUBE 10 SIZE','Yes','Nos','Nos',1,1,'3','000','000','RAMSONS','','0','0',0,0),(81,'3','KIT','ADULT OXYGEN KIT SMALL SIZE','VINJOH HEALTH CARE','ADULT OXYGEN KIT SMALL SIZE','Yes','Nos','Nos',1,1,'3','000','000','VINJOH HEALTH CARE','H','0','0',0,0),(82,'3','MASK','NEBULIZER MASK KIT','VINJOH HEALTH CARE','NEBULIZER MASK','Yes','Nos','Nos',1,1,'3','000','000','VINJOH HEALTH CARE','H','0','0',0,0),(83,'3','KIT','BURET SETS','ROMSONS','BURET SET','Yes','Nos','Nos',1,1,'2','000','000','ROMSONS','H','0','0',0,0),(84,'3','SYRINGE','50 CC SYRINGE','DISPO VAN','50 CC SYRIGNE','Yes','Nos','Nos',1,1,'2','000','000','DISPO VAN','H','0','0',0,0),(85,'3','KIT','PM-O-LINE','ROMSONS','PM-O-LINE','Yes','Nos','Nos',1,1,'2','000','000','ROMSONS','H','0','0',0,0),(86,'3','KIT','C V P LINE','ARROW','C V P LINE','Yes','Nos','Nos',1,1,'2','000','000','ARROW','H','0','0',0,0),(87,'3','KIT','VENTILATOR TUBES','BAIN COAXIAL CIRCUIT','VENTILATOR TUBES','Yes','Nos','Nos',1,1,'1','000','000','BAIN COAXIAL CIRCUIT','H','0','0',0,0),(88,'3','KIT','NASUAL CANNULA','RAMSONS','NASUL CANNULA','Yes','Nos','Nos',1,1,'1','4533','9018','RAMSONS','H','1','0',1,0),(89,'3','antibiotics','DEXONA','CADILA PHARMA','DEXOHETHDRA ZONE','Yes','Ampoule','Ampoule',5,1,'3','13267','3004','CADILA PHARMA','H','1','',1,0),(90,'3','STERIOD','DEX','NEON LABORATORIES','DEXONA','Yes','Ampoule','Ampoule',4,1,'3','7884','9035','NEON PHARMA','H','1','',1,0),(91,'3','ANTICID','RANITIDINE','TORRET','PANTOPRAZOLE','Yes','Ampoule','Ampoule',5,1,'3','3552','9099','TORRENT','H','1','',1,0),(92,'3','PAIN KILLER','DICLOWAL','WALLACE','Diclofenac sodium inj','Yes','Ampoule','Ampoule',5,1,'3','1544','9099','WALLACE','H','1','',1,0),(93,'3','EMERGENCY DRUG','VASOCAN','NEON LABORATORIES','ADRENALINE','Yes','Ampoule','Ampoule',5,1,'3','1545','3190','NEON','H','1','',1,0),(94,'3','PAIN KILLER','NACPHIN','CIPLA','NALBUPHIN','Yes','Ampoule','Ampoule',5,1,'3','12545','5085','CIPLA','H','1','0',1,0),(95,'3','BLOOD COAGULATION','KENADION 1','SAMARTH LIFE SCIENCE PVT LTD','phytomenadione inj','Yes','Ampoule','Ampoule',5,1,'3','2456','3004','SAMARTH LIFE SCIENCE PVT LTD','H','1','',1,0),(96,'3','anti-inflammatory','BETNASOL','GSK','Betamethasone sodium','Yes','Ampoule','Ampoule',5,1,'3','3004','9099','GSK','H','1','',1,0),(97,'3','Antispasmodics','Hyocimax','Acme pharma','Hyoscine butylibromide inj','Yes','Ampoule','Ampoule',1,1,'3','34543','9099','ACME PHARMA','H','1','',1,0),(98,'3','antibiotics','TROPINE','NEON LABORATORIES','ATROPINE SULPHATE INJ','Yes','Ampoule','Ampoule',1,1,'3','51546','3004','neon pharma','H','1','',1,0),(99,'3','beta-lactamase','TAZAR','LUPIN LTD','PIPERACILLIN AND TAZOBACTAM','Yes','Ampoule','Ampoule',1,1,'3','51253','3004','LUPIN LTD','H','1','',1,0),(100,'3','pain-relieving','WELSET','NITIN LIFE SCIENCES','PARACETOMAL AND LINOCAINE','Yes','Ampoule','Ampoule',1,1,'3','9099','3004','NITIN LIFE SCIENCES','H','1','',1,0),(101,'3','the final cure for impact headaches','HYTORC','ZEE LABORITIES','Hyoscine butylibromide inj','Yes','Ampoule','Ampoule',1,1,'3','34355','8467','ZEE PHARMA','H','1','',1,0),(102,'3','VITAMIN','VITAMIN K','INTEK','Phytonadione Injection','Yes','Ampoule','Ampoule',1,1,'3','2881','9099','INTEK','H','1','',1,0),(103,'3','Pheniramine','PHENTIX','ZEE LABORITIES','phytomenadione inj','Yes','Ampoule','Ampoule',2,1,'3','1325','3105','ZEE DRUGS','H','1','0',1,0),(104,'3','Glucocorticoid','BETAGEE','GERMAN REMEDIES','Betamethasone sodium','Yes','Ampoule','Ampoule',1,1,'3','35143','4100','GERMAN REMEDIES','H','1','',1,0),(105,'3','Sterile','POTASSIUM CHLORIDE','NEON LABORATORIES','potassium chloride','Yes','Ampoule','Ampoule',4,1,'3','2152','3004','NEON LABORATORIES','H','1','',1,0),(106,'3','Theophylline','DERIPHYLLIN','GERMAN REMEDIES','ETOFYLLINE THEOPHYLLINE','Yes','Ampoule','Ampoule',4,1,'3','124535','3004','GERMAN REMEDIES','H','1','',1,0),(107,'3','antibiotics','PARAWIN','R K LAB','PARACETOMAL','Yes','Ampoule','Ampoule',5,1,'3','12355','3006','R K LAB','H','1','',1,0),(108,'3','antibiotics','LEVOFLOXACIN 500MG','CIPLA','LEVOFLOX 500','Yes','Ampoule','Ampoule',1,1,'3','5146','9087','CIPLA','H','1','',1,0),(109,'3','Moxifloxacin','MOXIF 400MG','TORRENT','moxifilox acin','Yes','Ampoule','Ampoule',1,1,'3','5674','9099','TORENT','H','1','',1,0),(110,'3','Primapen','PRIMAPEN 500MG','NEON LABORATORIES','IMIPENEM & CILASTAIN','Yes','Ampoule','Ampoule',1,1,'3','5155','9099','NEON','H','1','',1,0),(111,'3','ARTESUNATE INJ','FALCIGO','ZYDUS CADILA','ARTESUNATE INJ','Yes','Ampoule','Ampoule',1,1,'3','51545','9099','ZYDUS CADILA','H','1','',1,0),(112,'3','Generic Alternatives','HAEMACCEL I.V 500M','abbott pharma','Haemaccel Infusion','Yes','Ampoule','Ampoule',1,1,'3','3474','3099','abbott pharma','H','1','',1,0),(113,'3','chemical kinetics','LINETIC INJ','NEON LABORATORIES','LINEZOLID','Yes','Ampoule','Ampoule',1,1,'3','1465','4100','NEON LAB','H','1','',1,0),(114,'3','Mechanism of Action','AXAZOLID','AXA PHARMA','LINEZOLID','Yes','Ampoule','Ampoule',1,1,'3','2353','2019','AXA PHARMA','H','1','',1,0),(115,'3','STERIOD','HYDROCORTISONE INJ','NEON LABORATORIES','HYPROCORTISONE SODIUM','Yes','Ampoule','Ampoule',2,1,'3','3246','9069','NEON LAB','H','1','',1,0),(116,'3','SYRUP','RACIGYL-O','MAINI KIND','RACECADOTRIL','Yes','Syrup','Syrup',1,1,'3','2776','9034','MAIN KIND','H','1','',1,0),(117,'3','anxiolysis and amnesia','MEZOLAM','NEON LABORATORIES','MIDAZOLAM','Yes','Vial','Vial',1,1,'3','6457','2017','NEON LABORATORIES','H','1','',1,0),(118,'3','Cardiac glycoside','TERMIN','NEON LABORATORIES','MEPHENTERMINE','Yes','Ampoule','Ampoule',1,1,'3','1345','3004','NEON LAB','H','1','',1,0),(119,'3','class of medications','LYCORTIN-S','HETERO','HYDROCORTISONE','Yes','Ampoule','Ampoule',1,1,'3','53246','3200','HETERO','H','1','',1,0),(120,'3','SIDE EFFECTS DRUG','PANTOPRAZOLE','THEMIS MEDICARE','PANTOPRAZOLE','Yes','Ampoule','Ampoule',1,1,'3','2345','9099','THEMIS MEDICARE','H','1','',1,0),(121,'3','antibiotics','ACEE PLUS','SELDOM PHARMA','acelofenac & paracetamol table','Yes','Tablet','Tablet',1,1,'3','45353','9039','SELDOM PHARMA','H','1','',1,0),(122,'3','antibiotics','ACIKEM SP','SEMUNS PHARMA','Aceclofenac is a non-steroida','Yes','Tablet','Tablet',1,1,'3','262635','5143','SEMUNS PHARMA','H','1','',1,0),(123,'3','antibiotics','KUFF Q','INTAS PHARMA','BROMHEXINE','Yes','Tablet','Tablet',1,1,'3','52535','2019','INTAS PHARMA','H','1','',1,0),(124,'3','antibiotics','ZYNOL 300MG TAB','MICRO LAB','RANTITDIUE','Yes','Tablet','Tablet',1,1,'3','6546','9099','MICRO LAB','H','1','',1,0),(125,'3','antibiotics','CHESTON COLD TAB','CIPLA','LEVOCETIRIZINE','Yes','Tablet','Tablet',2,1,'3','52435','5678','CIPLA','H','1','',1,0),(126,'3','antibiotics','CHESTON COLD','CIPLA','CETRIZINE DIHYDROCHOLORIDE','Yes','Tablet','Tablet',1,1,'3','5326','9099','CIPLA','H','1','',1,0),(127,'3','antibiotics','CIPROFLOXACIN','abbott pharma','FLORIP 500','Yes','Tablet','Tablet',1,1,'3','8487','2033','ABBOT PHARMA','H','1','',1,0),(128,'3','antibiotics','OFLOXACIN 200MG','LABORATE PHARMA','OFLOCIN TAB','Yes','Tablet','Tablet',1,1,'3','564275','2039','LABORATE PHARMA','H','1','',1,0),(129,'3','VITAMIN','VITAMIN B COMPLEX','INDIAN HARMLESS MEDICINES','VITAMIN B','Yes','Tablet','Tablet',1,1,'3','7457','9029','INDIAN HARMLESS MEDICINES','H','1','',1,0),(130,'3','CALCIUM TAB','CALOSHELL-500','EMSURE PHARMA','CALCIUM WITH VITAMIN D','Yes','Tablet','Tablet',4,1,'3','5436','5020','EMSURE PHARMA','H','1','',1,0),(131,'3','POTTASIUM  WITH ANTIBIOTIC','SAFEXIM 200MG','abbott pharma','CEFIXIME & POTASSIAM','Yes','Tablet','Tablet',5,1,'3','6266','9099','ABBOT PHARMA','H','1','',1,0),(132,'3','antibiotics','CEFACLASS  200','MANIKIND','CEFIXIME DISPERSIBLE','Yes','Tablet','Tablet',2,1,'3','6456','3099','MANIKIND','H','1','',1,0),(133,'3','SLEEPING TAB','ALNIX 0.25','LEENIX PHARMA','ALPRAZOLAM','Yes','Tablet','Tablet',1,1,'3','4353','3010','LEENIX PHARMA','H','1','',1,0),(134,'3','antibiotics','FLAGYL 400 MG','abbott pharma','metronidazole','Yes','Tablet','Tablet',1,1,'3','5624','3004','ABBOTT','','1','',1,0),(135,'3','antibiotics','ARICEF O PLUS TAB','VIRAT PHARMA','CEFIXIME AND OFLOXACIAN','Yes','Tablet','Tablet',2,1,'3','2346','2019','VIRAT PHARMA','','1','',1,0),(136,'3','PAIN KILLER FEVER','ULTRAX MR TAB','VIRAT PHARMA','acelofenac & paracetamol table','Yes','Tablet','Tablet',1,1,'3','7457','2019','VIRAT PHARMA','H','1','',1,0),(137,'3','PAIN KILLER FEVER','ULTRAX SP','VIRAT PHARMA','ACEFLONAC AND PARACETOMOL','Yes','Tablet','Tablet',1,1,'3','9765','3099','VIRAT PHARMA','H','1','',1,0),(138,'3','antibiotics','LIRIZ M','VIRAT PHARMA','LEVOCETIRIZINE & MONTELAKAST','Yes','Tablet','Tablet',1,1,'3','3475','2024','VIRAT PHARMA','H','1','',1,0),(139,'3','antibiotics','CARGIL 75','STAR PHARMA','CLOPIDOGEL','Yes','Tablet','Tablet',1,1,'3','53245','3010','STAR PHARMA','H','1','',1,0),(140,'3','antibiotics','Aldigesic TH','ALKEM LAB','ACECLOFENAC & THIOCLOCHICOSIDE','Yes','Tablet','Tablet',1,1,'3','41235','9069','ALKEM LAB','H','1','',1,0),(141,'3','antibiotics','TRAMACET','INTAS PHARMA','TRAMADOL HYDROCHLORIDE','Yes','Tablet','Tablet',1,1,'3','67457','9099','INTAS PHARMA','H','1','',1,0),(142,'3','antibiotics','CADIPLEX FORTE','ZYDUS CADILA','METHYLCOBALCIUM','Yes','Tablet','Tablet',1,1,'3','2346','3012','ZYDUS CADILA','H','1','',1,0),(143,'3','antibiotics','AMLIP','CIPLA PHARMA','AMLODOPINE BESILATE','Yes','Tablet','Tablet',1,1,'3','7742','3004','CIPLA PHARMA','H','1','',1,0),(144,'3','antibiotics','CEFIXIME TABLET','SUN PHARMA','RANIXIME 200','Yes','Tablet','Tablet',1,1,'3','8764','2019','SUN PHARMA','H','1','',1,0),(145,'3','VOMTINGS','VOMINON 4 MG','ALRED PHARMA','ONDANSETRON TAB','Yes','Tablet','Tablet',2,1,'3','5665','8471','ALRED PHARMA','H','1','',1,0),(146,'3','antibiotics','TORSINOL 10','KNOLL HEALTH CARE','torsemide tab','Yes','Tablet','Tablet',1,1,'3','5345','9079','KNOLL PHARMA','H','1','',1,0),(147,'3','antibiotics','O DOL SP','Asual Paharma','acelofenic & paracetomal','Yes','Tablet','Tablet',1,1,'3','2366','9099','Asual Pharma','H','1','',1,0),(148,'3','antibiotics','B 2 TABLET','Asual Paharma','RIBOFLAVINE','Yes','Tablet','Tablet',1,1,'3','2346','3010','ASUAL PHARMA','H','1','',1,0),(149,'3','FLUID','CIPROFLOXACIN','infutec health care limited','CIPROJAB','Yes','FLUID','FLUID',1,1,'3','3246','9099','INFUTEC HEALTH CARE LIMITED','H','1','',1,0),(150,'3','FLUID','20M','ACULIFE','MANNITOL INJ','Yes','Vial','Vial',1,1,'3','2346','9099','ACULIFE PHARMA','H','1','',1,0),(151,'3','OPERATION USE','SODIUM PHOSPHATES','GODJAY LAB','SODIUM PHOSPHATES','Yes','Bottle','Bottle',1,1,'3','6324','3004','GODJAY LAB','H','1','',1,0),(152,'3','MASKS','MASKS','MEDIKLIN HEALTHCARE LTD','MASKS','Yes','Nos','Nos',1,1,'3','53465','9099','MEDIKLIN HEALTHCARE LTD','H','1','',1,0),(153,'3','MASKS','CAPS','NEON LABORATORIES','CAPS','Yes','Nos','Nos',1,1,'3','4132','3085','NEON LABORATORIES','H','1','',1,0),(154,'3','SPIRIT','SPIRIT','NEON LABORATORIES','SPIRIT','Yes','Nos','Nos',1,1,'3','43455','3099','NEON LABORATORIES','H','1','',1,0),(155,'3','BETADIANE','BETADIANE','RANBAXY','BETADIANE','Yes','Bottle','Bottle',1,1,'3','5345','9099','RANBAXY','H','1','',1,0),(156,'3','WASHING SCRUB','BETADINE SCRUB','WOKHARDAT PHARMA','BETADIANE SCRUB','Yes','Bottle','Bottle',1,1,'3','2657','5672','WOKHARDAT PHARMA','H','1','',1,0),(157,'3','BLADE','SURGICAL BLADE 11','NIRAJ INDUSTIES PVT LTD','SURGICAL BLADE 11','Yes','Nos','Nos',1,1,'3','5356','9099','NIRAJ INDUSTIES PVT LTD','H','1','',1,0),(158,'3','BLADE','SURGICAL BLADE 15','NIRAJ INDUSTIES PVT LTD','SURGICAL BLADE 15','Yes','Nos','Nos',1,1,'3','41235','8935','NIRAJ INDUSTIES PVT LTD','H','1','',1,0),(159,'3','BLADE','SURGICAL BLADE 22','NIRAJ INDUSTIES PVT LTD','SURGICAL BLADE 22','Yes','Nos','Nos',1,1,'3','5564','8987','NIRAJ INDUSTIES PVT LTD','H','1','',1,0),(160,'3','CATHETER','NELATON CATHETER 12','RAMSONS','NELATON CATHETER 12','Yes','Nos','Nos',1,1,'3','1325','9099','RAMSONS','H','1','',1,0),(161,'3','CATHETER','NELATON CATHETER 14','RAMSONS','NELATON CATHETER 14','Yes','Nos','Nos',1,1,'3','1254','9099','RAMSONS','H','1','',1,0),(162,'3','CATHETER','NELATON CATHETER 16','RAMSONS','NELATON CATHETER 16','Yes','Nos','Nos',1,1,'3','5412','9099','RAMSONS','H','1','',1,0),(163,'3','FOLEY','FOLEY CATHETER 10','RUSE H GOLD PHARMA','FOLEY CATHETER 10','Yes','Nos','Nos',1,1,'3','1423','3099','RUSE H GOLD PHARMA','H','1','',1,0),(164,'3','FOLEY','FOLEY CATHETER 12','TRUCATH PHARMA','FOLEY CATHETER 12','Yes','Nos','Nos',1,1,'3','1235','3099','TRUCATH PHARMA','H','1','',1,0),(165,'3','FOLEY','FOLEY CATHETER 14','TRUCATH PHARMA','FOLEY CATHETER 14','Yes','Nos','Nos',1,1,'3','1235','3099','TRUCTH PHARMA','H','1','',1,0),(166,'3','FOLEY','FOLEY CATHETER 16','TRUCATH PHARMA','FOLEY CATHETER 16','Yes','Nos','Nos',1,1,'3','5123','3099','TRUCATH PHARMA','H','1','',1,0),(167,'3','FOLEY','FOLEY CATHETER 18','TRUCATH PHARMA','FOLEY CATHETER 18','Yes','Nos','Nos',1,1,'3','2346','9099','TRUCATH PHARMA','H','1','',1,0),(168,'3','BAG','URO BAG','SANGAM HEALTH CARE LTD','URON BAG','Yes','Bag','Bag',1,1,'3','1235','3099','SANGAM HEALTH CARE LTD','H','1','',1,0),(169,'3','SAFTEY','SURGICAL GLOVES 6','KANAM LATEX IND LTD','SURGICAL GLOVES 6','Yes','Box','Box',1,1,'3','5352','3523','KANAM LATEX IND LTD','H','1','',1,0),(170,'3','SAFTEY','SURGOCAL GLOVES 6.5','KANAM LATEX IND LTD','SURGOCAL GLOVES 6.5','Yes','Box','Box',1,1,'3','5234','3099','KANAM LATEX IND LTD','H','1','',1,0),(171,'3','SAFTEY','SURGICAL GLOVES 7','KANAM LATEX IND LTD','SURGICAL GLOVES 7','Yes','Box','Box',1,1,'3','1233','3099','KANAM LATEX LTD','H','1','',12,0),(172,'3','SAFTEY','SURGICAL GLOVES 7.5','KANAM LATEX IND LTD','SURGICAL GLOVES 7.5','Yes','Box','Box',1,1,'3','2364','3099','KANAM LATEX IND LTD','H','1','',1,0),(173,'3','CLEANING','MAAPS','DATT MEDIPRODUCTS PVT LTD','MAAPS','Yes','Bottle','Bottle',1,1,'3','6236','5573','DATT MEDIPRODUCTS PVT LTD','H','1','',1,0),(174,'3','TUBE','LOX 2% JELLY','NEON LABORATORIES','LIGNOCAINE HYDROCHLORIDE GEL','Yes','Gel','Gel',1,1,'3','4431','9099','NEON PHARMA','H','1','',1,0),(175,'3','BANDAGES','ROLLAR BANDAGES 4','G T RAJ TEX','ROLLAR BANDAGES 4','Yes','Nos','Nos',1,1,'3','6266','9099','G T RAJ TEX','H','1','',1,0),(176,'3','BANDAGES','ROLLER BANDAGES 6','THE RAMRAJ SURGICAL LTD','ROLLER BANDAGES 6','Yes','Nos','Nos',1,1,'3','4123','3099','THE RAMRAJ SURGICAL LTD','H','1','',1,0),(177,'3','SUTURE METERIAL','ETHILON 1','JOHNSON & JOHNSON','ETHILON 1','Yes','Nos','Nos',1,1,'3','5543','3909','JOHNSON & JOHNSON','H','1','',1,0),(178,'3','SUTURE METERIAL','ETHILON 2.0','HILL LIFE CARE LTD','ETHILON 2.0','Yes','Nos','Nos',1,1,'3','1235','3099','HILL LIFE CARE LTD','H','1','',1,0),(179,'3','SUTURE METERIAL','ETHILON  3.0','HILL LIFE CARE LTD','ETHILON  3.0','Yes','Nos','Nos',1,1,'3','9867','3099','HILL LIFE CARE LTD','H','1','',1,0),(180,'3','SUTURE METERIAL','VICRYL 0','HILL LIFE CARE LTD','VICRYL 0','Yes','Box','Box',1,1,'3','4325','9099','HILL LIFE CARE LTD','H','1','',3,0),(181,'3','SUTURE METERIAL','VICRYL 1','HILL LIFE CARE LTD','VICRYL 1','Yes','Box','Box',2,1,'3','8931','3099','HILL LIFE CARE LTD','H','1','',1,0),(182,'3','SUTURE METERIAL','VICRYL 2.0','HILL LIFE CARE LTD','VICRYL 2.0','Yes','Box','Box',1,1,'3','51325','4909','HILL LIFE CARE LTD','H','1','',1,0),(183,'3','SUTURE METERIAL','VICRYL 3.0','HILL LIFE CARE LTD','VICRYL 3.0','Yes','Box','Box',1,1,'3','6887','9099','HILL LIFE CARE LTD','H','1','',1,0),(184,'3','SUTURE METERIAL','VICRYL 4.0','SUTURES IND PVT LTD','VICRYL 4.0','Yes','Box','Box',1,1,'3','4512','3099','SUTURES IND PVT LTD','H','1','',1,0),(185,'3','SUTURE METERIAL','CHROMIC 0','JOHNSON & JOHNSON','CHROMIC 0','Yes','Box','Box',1,1,'3','8978','3099','JOHNSON & JOHNSON','H','1','',1,0),(186,'3','SUTURE METERIAL','CHROMIC 2.0','SUTURES IND PVT LTD','CHROMIC 2.0','Yes','Box','Box',1,1,'3','5125','9023','SUTURE IND PVT LTD','H','1','',1,0),(187,'3','SUTURE METERIAL','CHROMIC 1','SUTURES IND PVT LTD','CHROMIC 1','Yes','Box','Box',4,1,'3','7565','8054','SUTURES IND PVT LTD','H','1','',1,0),(188,'3','SUTURE METERIAL','CHROMIC 3.0','SUTURES IND PVT LTD','CHROMIC 3.0','Yes','Box','Box',1,1,'3','4576','3900','SUTURES IND PVT LTD','H','1','',1,0),(189,'3','SUTURE METERIAL','CHROMIC 4.0','JOHNSON & JOHNSON','CHROMIC 4.0','Yes','Box','Box',2,1,'3','8765','9033','JOHNSON & JOHNSON','H','1','',1,0),(190,'3','SUTURE METERIAL','CHROMIC 5.0','JOHNSON & JOHNSON','CHROMIC 5.0','Yes','Box','Box',1,1,'3','1258','9086','JOHNSON & JOHNSON','H','1','',1,0),(191,'3','SUTURE METERIAL','SILK 0','LOTUS SURGICALS','SILK 0','Yes','Box','Box',1,1,'3','6745','3099','LOTUS SURGICALS','H','1','',1,0),(192,'3','SUTURE METERIAL','SILK 1','HLL LIFE CARE LTD','SILK 1','Yes','Box','Box',1,1,'3','8756','3099','HLL LIFE CARE LTD','H','1','',1,0),(193,'3','SUTURE METERIAL','SILK 2.0','JOHNSON & JOHNSON','SILK 2.0','Yes','Box','Box',1,1,'3','8989','9099','JOHNSON & JOHNSON','H','1','',1,0),(194,'3','SUTURE METERIAL','SILK 3.0','JOHNSON & JOHNSON','SILK 3.0','Yes','Box','Box',1,1,'3','5677','3909','JOHNSON & JOHNSON','H','1','',1,0),(195,'3','SUTURE METERIAL','PROLIN 0','JOHNSON & JOHNSON','PROLIN 0','Yes','Box','Box',1,1,'3','8679','3099','JOHNSON & JOHNSON','H','1','',1,0),(196,'3','SUTURE METERIAL','PROLIN 1','JOHNSON & JOHNSON','PROLIN 1','Yes','Box','Box',1,1,'3','5367','3099','JOHNSON & JOHNSON','H','1','',1,0),(197,'3','SUTURE METERIAL','PROLIN 2.0','HALL LIFE CARE LTD','PROLIN 2.0','Yes','Box','Box',1,1,'3','6456','3099','HALL LIFE CARE LTD','H','1','',1,0),(198,'3','SUTURE METERIAL','PROLIN 3.0','SUTURES IND PVT LTD','PROLIN 3.0','Yes','Box','Box',1,1,'3','9876','3099','SUTURES IND PVT LTD','H','1','',1,0),(199,'3','SUTURE METERIAL','PROLIN 4.0','SUTURES IND PVT LTD','PROLIN 4.0','Yes','Box','Box',1,1,'3','7567','9099','SUTURES IND PVT LTD','H','1','',1,0),(200,'3','SUTURE METERIAL','PROLIN 5.0','JOHNSON & JOHNSON','PROLON 5.0','Yes','Box','Box',1,1,'3','8765','9099','JOHNSON & JOHNSON','H','1','',1,0),(201,'3','SUTURE METERIAL','PROLIN 6.0','JOHNSON & JOHNSON','PROLIN 6.0','Yes','Box','Box',1,1,'3','4269','3099','JOHNSON & JOHNSON','H','1','',1,0),(202,'3','CANNULA','I.V CATHETER CANNULA 18G','GLOBAL MEDIKIT LTD','I.V CATHETER CANNULA 18G','Yes','Box','Box',1,1,'3','6432','9098','GLOBAL MEDIKIT LTD','H','1','',1,0),(203,'3','CANNULA','I.V CATHETER CANNULA 20G','GLOBAL MEDIKIT LTD','I.V CATHETER CANNULA 20G','Yes','Box','Box',1,1,'3','6243','3088','GLOBAL MEDIKIT LTD','H','1','',1,0),(204,'3','CANNULA','I.V CATHETER CANNULA 22 G','GLOBAL MEDIKIT LTD','I.V CATHETER CANNULA 22 G','Yes','Box','Box',1,1,'3','3245','9099','GLOBAL MEDIKIT LTD','H','1','',1,0),(205,'3','CANNULA','I.V CATHETER 24 G','GLOBAL MEDIKIT LTD','I.V CATHETER 24 G','Yes','Box','Box',1,1,'3','2346','9099','GLOBAL MEDIKIT LTD','H','1','',1,0),(206,'3','SUPPORTING FOR I V CANNULA','EASY FIX','DYNAMIC TECHNO MEDICAL','EASY FIX','Yes','Pack','Pack',1,1,'3','1355','3099','DYNAMIC TECHNO MEDICAL','H','1','',1,0),(207,'3','NEEDLE','SPINAL NEEDLE 22','BEETON DICKINSAN','SPINAL NEEDLE 22','Yes','Nos','Nos',1,1,'3','7265','9099','BEETON DICKINSAN','H','1','',1,0),(208,'3','NEEDLE','SPINAL NEEDELS 23','BEETON DICKINSAN','SPINAL NEEDELS 23','Yes','Nos','Nos',1,1,'3','6368','9899','BEETON DICKINSAN','H','1','',1,0),(209,'3','NEEDLE','SPINEL NEEDELS 25','BEETON DICKINSAN','SPINEL NEEDELS 25','Yes','Nos','Nos',2,1,'3','6266','3098','BEETON DICKINSAN','H','1','',1,0),(210,'3','NEEDLE','SPINAL NEEDELS 26','BEETON DICKINSAN','SPINAL NEEDELS 26','No','Nos','Nos',1,1,'3','8759','9099','BEETON DICKINSAN','H','1','',1,0),(211,'3','SKIN PURPOSE','CUTICELL','ADESHWAR MEDITEX','CUTIICELL','Yes','Nos','Nos',1,1,'3','1563','7892','ADESHWAR MEDITEX','H','1','',1,0),(212,'3','TUBES','RYLES TUBE 10','ROMSONS','RYLES TUBE 10','Yes','Nos','Nos',1,1,'3','5345','3099','ROMSONS','H','1','',1,0),(213,'3','TUBES','RYLES TUBE 12','RAMSONS','RYLES TUBE 12','Yes','Nos','Nos',1,1,'3','8857','4577','RAMSONS','H','1','',1,0),(214,'3','TUBES','RYLES TUBES 14','RAMSONS','RYLES TUBES 14','Yes','Nos','Nos',1,1,'3','2367','9099','RAMSONS','H','1','',1,0),(215,'3','TUBES','RYLES TUBES 16','RAMSONS','RYLES TUBES 16','Yes','Nos','Nos',1,1,'3','6236','3099','RAMSONS','H','1','',1,0),(216,'3','TUBES','RYLES TUBES 18','RAMSONS','RYLES TUBES 18','Yes','Nos','Nos',1,1,'3','3246','3099','RAMONS','H','1','',1,0),(217,'3','TUBES','FEEDING TUBES 0.5','RAMSONS','FEEDING TUBES 0.5','Yes','Nos','Nos',1,1,'3','2646','9099','RAMSONS','H','1','',1,0),(218,'3','TUBES','FEEDING TUBES 6','RAMSONS','FEEDING TUBES 6','Yes','Nos','Nos',1,1,'3','556436','9099','RAMSONS','H','1','',1,0),(219,'3','TUBES','FEEDING TUBES 7','RAMSONS','FEEDING TUBES 7','Yes','Nos','Nos',2,1,'3','6324','5833','RAMSONS','H','1','',1,0),(220,'3','TUBES','FEEDING TUBES 8','RAMSONS','FEEDING TUBES 8','Yes','Nos','Nos',1,1,'3','7457','5346','RAMSONS','H','1','',1,0),(221,'3','FLUIDS','I.V METRO 100ML','Claris Otsuka','I.V METRO 100ML','Yes','FLUID','FLUID',1,1,'3','6324','3099','CLARIS OTSUKA','H','1','',1,0),(222,'3','FLUID','MANNITOL 100 ML','Claris Otsuka','MANNITOL 100 ML','Yes','FLUID','FLUID',1,1,'3','8678','9090','CLARIS OTSUKA','H','1','',1,0),(223,'3','IV','IV SET','SANGAM HEALTH CARE LTD','IV SET','Yes','Nos','Nos',1,1,'3','3242','3212','SANGAM HEALTH CARE LTD','H','1','',1,0),(224,'3','SYRINGE','SYRINGES 2 ML','DISPO VAN','SYRINGES 2 ML','Yes','Box','Box',1,1,'3','2368','3099','DISPO VAN','H','1','',1,0),(225,'3','SYRINGE','SYRINGE 5 ML','DISPO VAN','SYRINGE 5 ML','Yes','Box','Box',1,1,'3','8645','9099','DISPO VAN','H','1','',1,0),(226,'3','SYRINGE','SYRINGE 10 ML','BD EMERALD','SYRINGE 10 ML','Yes','Box','Box',1,1,'3','1435','9099','BD EMERALD','H','1','',1,0),(227,'3','SYRINGE','SYRINGE 20 ML','DISPO VAN','SYRINGE 20 ML','Yes','Box','Box',1,1,'3','8753','3900','DISPO VAN','H','1','',1,0),(228,'3','SYRINGE','SYRINGE 50 ML','DISPO VAN','SYRINGE 50 ML','Yes','Box','Box',1,1,'3','9868','3099','DISPO VAN','H','1','',1,0),(229,'3','FLUID','N S 1000 ML','Claris Otsuka','N S 1000 ML','Yes','FLUID','FLUID',1,1,'3','3246','3099','CLARIS OTSUKA','H','1','',1,0),(230,'3','SPINEL PURPOSE','EPIDURAL','BRAUN MELSUGEN','EPIDURAL','Yes','Box','Box',1,1,'3','3469','3030','BRAUN MELSUGEN','H','1','',1,0),(231,'3','SUTURE METERIAL','P M O LINE','RAMSONS','P M O LINE','Yes','Nos','Nos',2,1,'1','5123','9099','RAMSONS','H','1','',1,0),(232,'3','SUTURE METERIAL','3 WAY CANNULES 10 CM','RAMSONS','3 WAY CANNULES 10 CM','Yes','Nos','Nos',1,1,'3','8446','3090','RAMSONS','H','1','',1,0),(233,'3','WATER','STERILE WATER 10 ML','Claris Otsuka','STERILE WATER 10 ML','Yes','FLUID','FLUID',1,1,'3','8374','3099','CLARIS OTSUKA','H','1','',1,0),(234,'3','SUPPORTING FOR I V CANNULA','3 WAY CANNULES 100 CM','RAMSONS','3 WAY CANNULES 100 CM','Yes','Nos','Nos',1,1,'3','6262','3099','RAMSONS','H','1','',1,0),(235,'3','SUPPORTING FOR I V CANNULA','3 WAY CANNULES SMALL','NEOWAY','3 WAY CANNULES SMALL','Yes','Nos','Nos',1,1,'3','6476','3099','NEOWAY','H','1','',1,0),(236,'3','ECG PURPOSE','E C G LEEDS','DYNAMIC TECHNO MEDICAL','E C G LEEDS','Yes','Nos','Nos',1,1,'3','8755','7898','DYNAMIC TECHNO MEDICAL','H','1','',1,0),(237,'3','JELLYS','LOX 2% 30 ML','NEON LABORATORIES','LOX 2% 30 ML','Yes','Gel','Gel',1,1,'3','7647','9099','NEON LAB','H','1','',1,0),(238,'3','JELLYS','LOX 2 % CARD 30 ML WITH ADRENA','NEON LABORATORIES','LOX 2 % CARD 30 ML WITH ADRENA','Yes','Gel','Gel',1,1,'3','7257','3066','NEON LAB','H','1','',1,0),(239,'3','IV','ANAWAIN 0.5 %','NEON LABORATORIES','ANAWAIN 0.5 %','Yes','Nos','Nos',1,1,'3','4775','9099','NEON LAB','H','1','',1,0),(240,'3','IV','I V LOXCARD 50 ML','NEON LABORATORIES','I V LOXCARD 50 ML','Yes','Nos','Nos',1,1,'3','6543','7907','NEON LAB','H','1','',1,0),(241,'3','DRAINS','ROMOVAC SET DRAINS 10','ROMSONS','ROMOVAC SET DRAINS 10','Yes','Box','Box',1,1,'3','9768','3099','ROMSONS','H','1','',1,0),(242,'3','DRAINS','ROMOVAC SET DRAINS 12','RAMSONS','ROMOVAC SET DRAINS 12','Yes','Box','Box',1,1,'3','8765','3099','RAMSONS','H','1','',1,0),(243,'3','DRAINS','ROMOVAC SET DRAINS 14','RAMSONS','ROMOVAC SET DRAINS 14','Yes','Box','Box',1,1,'3','5355','3099','RAMSONS','H','1','',1,0),(244,'3','DRAINS','ROMOVAC SET DRAINS 16','RAMSONS','ROMOVAC SET DRAINS 16','Yes','Box','Box',1,1,'3','6268','3099','RAMSONS','H','1','',1,0),(245,'3','CATHETER','SUCTION CATHETER 12','RAMSONS','SUCTION CATHETER 12','Yes','Nos','Nos',1,1,'3','6256','9099','RAMSONS','H','1','',1,0),(246,'3','CATHETER','SUCTION CATHETER 14','RAMSONS','SUCTION CATHETER 14','Yes','Nos','Nos',1,1,'3','6456','9099','RAMSONS','H','1','',1,0),(247,'3','CATHETER','SUCTION CATHATER 16','RAMSONS','SUCTION CATHATER 16','Yes','Nos','Nos',1,1,'3','8765','3099','RAMSONS','H','1','',1,0),(248,'3','FLUID','HESTAR 500 ML','Claris Otsuka','HESTAR 500 ML','Yes','FLUID','FLUID',1,1,'3','5797','3737','CLARIS OTSUKA','H','1','',1,0),(249,'3','STAPLER','SKIN STAPLER','RAMSONS','SKIN STAPLER','Yes','Bundle','Bundle',1,1,'1','2467','3909','RAMSONS','H','1','',1,0),(250,'3','CHEST DRAIN','I C D CHEST DRAIN 28','RAMSONS','I C D CHEST DRAIN 28','Yes','Nos','Nos',1,1,'3','7457','3090','RAMSONS','H','1','',1,0),(251,'3','CHEST DRAIN','I C D CHEST DRAIN 32','RAMSONS','I C D CHEST DRAIN 32','Yes','Nos','Nos',1,1,'3','9876','3909','RAMSONS','H','1','',1,0),(252,'3','GEL','P O P ( GYPSONA ) 4','GYPSONA','P O P ( GYPSONA ) 4','Yes','Nos','Nos',1,1,'3','8654','4545','GYPSONA','H','1','',1,0),(253,'3','GEL','P O P GYPSONA 6','GYPSONA','P O P GYPSONA 6','Yes','Nos','Nos',1,1,'3','3588','9099','GYPSONA','H','1','',1,0),(254,'3','ROLLER','SOFT ROLLER 4','DATT MEDIPRODUCTS PVT LTD','SOFT ROLLER 4','Yes','Roll','Roll',1,1,'3','3737','3909','DATT MEDIPRODUCTS PVT LTD','H','1','',1,0),(255,'3','ROLLER','SOFT ROLLER 6','DATT MEDIPRODUCTS PVT LTD','SOFT ROLLER 6','Yes','Roll','Roll',1,1,'3','8384','3030','DATT MEDIPRODUCTS PVT LTD','H','1','',1,0),(256,'3','WAX','BONE WAX','ETHICAN','BONE WAX','Yes','Patch','Patch',2,1,'3','7275','9099','ETHICAN','H','1','',1,0),(257,'3','SKIN PURPOSE','SKIN GRAFT BLADE','BRAUN MELSUGEN','SKIN GRAFT BLADE','Yes','Nos','Nos',1,1,'3','2436','3542','BRAUN MELSUGEN','H','1','',1,0),(258,'3','GEL','AB GEL','SRI GOPAL KRISHNA PHARMA','AB GEL','Yes','Gel','Gel',1,1,'2','7345','9076','SRI GOPAL KRISHNA PHARMA','H','1','',1,0),(259,'3','FLUID','N S 3 LITTER','INFUTEC','N S 3 LITTER','Yes','FLUID','FLUID',1,1,'3','7345','3099','INFUTEC','H','1','',1,0),(260,'3','FLUID','GLYCINE 3 LITTER','INFUTEC','GLYCINE 3 LITTER','Yes','FLUID','FLUID',2,1,'2','9669','3898','INFUTEC','H','1','',1,0),(261,'3','VACCUMS','VACCUM SECTION SET','RAMSONS','VACCUM SECTION SET','Yes','Nos','Nos',1,1,'3','8758','6565','RAMSONS','H','1','',1,0),(262,'3','INJECTION','INJ CEFDUS-S 1.5 GM','RAMSONS','INJ CEFDUS-S 1.5 GM','Yes','Vial','Vial',1,1,'3','34577','9789','RAMSONS','H','1','',1,0),(263,'3','INJECTION','INJ PANTOP 40 MG','LABORATE PHARMA','INJ PANTOP 40 MG','Yes','Vial','Vial',1,1,'3','134646','9099','LABORATE PHARMA','H','1','',1,0),(264,'3','FLUID','P C M 100 ML','CELON LABS','P C M 100 ML','Yes','FLUID','FLUID',1,1,'2','7257','3098','CELON LABS','H','1','',1,0),(265,'3','SHEETS','P E BED SHEEET','MEDIKLIN HEALTHCARE LTD','P E BED SHEEET','Yes','Patch','Patch',1,1,'3','3266','9099','MEDIKLIN HEATH CARE LTD','H','1','',1,0),(266,'3','1212','121212','1212','1212','Yes','Bag','Bag',2,1,'1','121212','12212','1212','H','1','',1,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines_podata`
--

LOCK TABLES `medicines_podata` WRITE;
/*!40000 ALTER TABLE `medicines_podata` DISABLE KEYS */;
INSERT INTO `medicines_podata` VALUES (1,2,NULL,100,NULL,12.0000,10.0000,1,1,50),(2,2,NULL,100,NULL,12.0000,10.0000,2,1,50),(3,12,NULL,50,NULL,6.0000,5.0000,2,1,25),(4,1,NULL,10,NULL,12.0000,12.0000,3,1,10),(5,1,NULL,10,NULL,12.0000,12.0000,4,1,10),(6,2,NULL,100,NULL,12.0000,10.0000,4,1,100),(7,8,NULL,10,NULL,12.0000,12.0000,5,1,6),(8,14,NULL,8,NULL,8.0000,8.0000,5,1,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines_pos`
--

LOCK TABLES `medicines_pos` WRITE;
/*!40000 ALTER TABLE `medicines_pos` DISABLE KEYS */;
INSERT INTO `medicines_pos` VALUES (1,'2018-06-02',1,'Issued',58,1000.0000,1180.0000,0),(2,'2018-06-12',3,'Issued',59,1250.0000,1475.0000,0),(3,'2018-06-15',2,'Received',1,120.0000,141.6000,0),(4,'2018-06-15',2,'Received',1,1120.0000,1321.6000,0),(5,'2018-06-20',10,'Issued',59,184.0000,217.1200,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Masters',1,'fa fa-th-list','Users',1,'team.png','#users','/users','users.html','users_ctrl',1,0),(51,'Masters',1,'fa fa-th-list','Organization',5,'hospital2.png','#organization','/organization','hospitals.html','hospitals_ctrl',8,0),(52,'Masters',1,'fa fa-th-list','Specialities',2,'medicine.png','#specialities','/specialities','specialities.html','specialities_ctrl',8,0),(53,'Masters',1,'fa fa-th-list','Facilities',4,'patient.png','#facilities','/facilities','facilities.html','facilities_ctrl',8,0),(54,'Masters',1,'fa fa-th-list','Facilities Group',3,'hospital-bed.png','#facilitiesgroup','/facilitiesgroup','facilitiesgroup.html','facilitiesgroup_ctrl',8,0),(57,'Inventory',2,'stock.png','Units',1,'scale.png','#inventoryunits','/inventoryunits','inventoryunits.html','inventoryunits_ctrl',8,0),(58,'Masters',1,'fa fa-th-list','Locations',6,'placeholder.png','#locations','/locations','locations.html','locations_ctrl',8,0),(60,'Dashboard',0,'fa fa-th-list','Dashboard',1,'fa fa-angle-right','#dashboard','/dashboard','dashboard.html','dashboard_ctrl',1,1),(62,'Labs',4,'021-test-tubes.png','Lab Tests',1,'046-medical-history.png','#labtests','/labtests','labtests.html','labtests_ctrl',8,0),(64,'Masters',1,'fa fa-th-list','Referrals',9,'082-ambulance-1.png','#referrals','/referrals','referrals.html','referrals_ctrl',8,0),(66,'Masters',1,'fa fa-th-list','Beds',10,'084-hospital-bed.png','#beds','/beds','beds.html','beds_ctrl',8,0),(67,'Inventory',2,'fa fa-th-list','Asset Inward',7,'asset_inward.png','#inward','/inward','inward.html','inward_ctrl',8,0),(72,'Patient',3,'patient1.png','Patient List',1,'patient.png','#newpaitent','/newpaitent','newpaitent.html','newpaitent_ctrl',8,0),(74,'Inventory',2,'fa fa-th-list','Stores',3,'store.png','#stores','/stores','stores.html','stores_ctrl',8,0),(77,'Inventory',2,'fa fa-th-list','Supplier',2,'supplier.png','#supplier','/supplier','supplier.html','supplier_ctrl',8,0),(78,'Inventory',2,'fa fa-th-list','Inventory Group',4,'inventory.png','#itemgroup','/itemgroup','itemgroup.html','itemgroup_ctrl',8,0),(79,'Inventory',2,'fa fa-th-list','Assets',5,'assets.png','#assets','/assets','assets.html','assets_ctrl',8,0),(80,'Inventory',2,'fa fa-th-list','Medicines',10,'medicine-7.png','#medicines','/medicines','medicines.html','medicines_ctrl',8,0),(82,'Inventory',2,'fa fa-th-list','Assets PO',6,'asset_purchaseorder.png','#assetspo','/assetspo','assetspo.html','assetspo_ctrl',8,0),(84,'Inventory',2,'fa fa-th-list','Asset Outward',8,'asset_outward.png','#assetoutward','/assetoutward','assetoutward.html','assetoutward_ctrl',8,0),(85,'Inventory',2,'fa fa-th-list','Asset Stock',9,'stock2.png','#assetstock','/assetstock','assetstock.html','assetstock_ctrl',8,0),(86,'Inventory',2,'fa fa-th-list','Medicine POS',11,'medical_po.png','#medicinepos','/medicinepos','medicinepos.html','medicinepos_ctrl',8,0),(87,'Inventory',2,'fa fa-th-list','Medicine Inward',12,'medical_inward.png','#medicineinward','/medicineinward','medicineinward.html','medicineinward_ctrl',8,0),(90,'Inventory',2,'fa fa-th-list','Medicine Stock',13,'stock.png','#medicinestock','/medicinestock','medicinestock.html','medicinestock_ctrl',8,0),(91,'Patient',3,'fa fa-th-list','Consultation Charges',2,'doctor_red.png','#doctorconsultation','/doctorconsultation','doctorconsultation.html','doctorconsultation_ctrl',8,0),(92,'Patient',3,'fa fa-th-list','In Patient',3,'fa fa-angle-right','#inpatient','/inpatient','inpatient.html','inpatient_ctrl',8,1),(95,'Finance',5,'fa fa-th-list','Collection',1,'income.png','#collection','/collection','collection.html','collection_ctrl',8,1),(96,'Finance',5,'fa fa-th-list','Receipts',2,'daily_cash.png','#dailycashregister','/dailycashregister','dailycashregister.html','dailycashregister_ctrl',8,0),(97,'Finance',5,'fa fa-th-list','Cancel Receipt',3,'cancel.png','#cancelreceipt','/cancelreceipt','cancelreceipt.html','cancelreceipt_ctrl',8,1),(98,'Finance',5,'fa fa-th-list','Collection Info',4,'doctor_collection.png','#doctorcollection','/doctorcollection','doctorcollection.html','doctorcollection_ctrl',8,0),(99,'Labs',4,'fa fa-th-list','Lab Pricing',13,'lab_price.png','#testpricing','/testpricing','testpricing.html','testpricing_ctrl',8,0),(100,'Masters',1,'fa fa-th-list','Expenditure',11,'expan.png','#expenditure','/expenditure','expenditure.html','expenditure_ctrl',8,0),(101,'Masters',1,'fa fa-th-list','Scheme',12,'scheme.png','#scheme','/scheme','scheme.html','scheme_ctrl',8,0),(103,'Finance',5,'fa fa-th-list','Payments',5,'payments.png','#payment','/payment','payment.html','payment_ctrl',8,0),(104,'Patient',3,'fa fa-th-list','Case Sheet',5,'case_sheet.png','#casesheet','/casesheet','casesheet.html','casesheet_ctrl',8,0),(105,'Labs',4,'fa fa-th-list','Lab Results',14,'lab_result.png','#labresults','/labresults','labresults.html','labresults_ctrl',8,0),(106,'Finance',5,'fa fa-th-list','Pharmacy Account',6,'pharmacy.png','#pharmacyaccount','/pharmacyaccount','pharmacyaccount.html','pharmacyaccount_ctrl',8,0),(107,'Finance',5,'fa fa-th-list','Pharmacy Billing',7,'Pharmacy_bill.png','#pharmacybilling','/pharmacybilling','pharmacybilling.html','pharmacybilling_ctrl',8,0),(108,'Inventory',2,'fa fa-th-list','Medicine Outward',14,'medicine_out.png','#medicineoutward','/medicineoutward','medicineoutward.html','medicineoutward_ctrl',8,0),(109,'Masters',1,'fa fa-th-list','Staff',13,'staff.png','#staff','/staff','staff.html','staff_ctrl',8,0),(110,'Inventory',2,'fa fa-th-list','Direct Purchase',15,'direct_purchase.png','#directpurchase','/directpurchase','directpurchase.html','directpurchase_ctrl',8,0),(111,'Patient',3,'fa fa-th-list','Appointment',2,'agenda.png','#appointment','/appointment','appointment.html','appointment_ctrl',8,1),(112,'Patient',3,'fa fa-th-list','Medicine Issue',6,'pill.png','#casualtymedicine','/casualtymedicine','casualtymedicine.html','casualtymedicine_ctrl',8,1),(113,'Finance ',5,'fa fa-th-list','Information Sheet',8,'fa fa-angle-right','#informationsheet','/informationsheet','informationsheet.html','informationsheet_ctrl',8,1),(114,'Patient',3,'fa fa-th-list','Patient List',7,'fa fa-angle-right','#patientlist','/patientlist','patientlist.html','patientlist_ctrl',8,1),(115,'Finance',5,'fa fa-th-list','Debit Note',9,'debitnote.png','#debitnote','/debitnote','debitnote.html','debitnote_ctrl',8,0),(116,'Finance',5,'fa fa-th-list','Dues',10,'dues.png','#dues','/dues','dues.html','dues_ctrl',8,1);
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
  `datetime` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `dr_consult_id` int(11) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `isCasualty` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`p_consult_id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_consultation`
--

LOCK TABLES `patient_consultation` WRITE;
/*!40000 ALTER TABLE `patient_consultation` DISABLE KEYS */;
INSERT INTO `patient_consultation` VALUES (190,181,195,16,'2018-06-20 12:40:18',200,1,'Fever',0),(191,182,196,26,'2018-06-20 14:32:58',300,7,'checkup',0),(192,183,197,27,'2018-06-20 14:37:21',200,14,'test',1),(193,184,198,16,'2018-06-20 17:12:23',200,1,'Consultation',0),(194,185,199,19,'2018-06-21 22:04:49',200,3,'Consultation',0),(195,0,200,16,'2018-06-22 08:36:34',200,1,'ss',0),(196,0,201,19,'2018-06-22 08:37:26',200,3,'s',0),(198,187,203,31,'2018-06-22 09:56:35',200,13,'feaver',0),(199,188,204,16,'2018-06-22 14:02:16',200,1,'Fever',0),(200,189,205,28,'2018-06-22 14:01:45',300,9,'test',1),(205,196,212,27,'2018-06-22 17:29:16',200,14,'test',0),(207,184,0,16,'2018-06-22 22:33:25',0,1,'Fever',0),(208,184,0,16,'2018-06-22 23:09:24',0,1,'fever',0),(209,184,0,16,'2018-06-22 23:09:46',0,1,'fever',0),(210,184,214,16,'2018-06-22 23:18:39',0,1,'fever',0),(211,184,215,16,'2018-06-23 05:55:29',200,1,'Hello',0),(212,186,216,31,'2018-06-23 08:17:31',200,13,'feaver',0),(213,194,217,31,'2018-06-23 08:22:17',200,13,'test',1),(214,193,219,16,'2018-06-23 08:25:03',200,1,'checkup',0),(215,198,220,19,'2018-06-23 10:18:56',200,3,'sample desp',0),(216,199,221,16,'2018-06-23 10:23:31',200,1,'ssssss',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_info`
--

LOCK TABLES `patient_info` WRITE;
/*!40000 ALTER TABLE `patient_info` DISABLE KEYS */;
INSERT INTO `patient_info` VALUES (181,NULL,'Ram','Kishore',NULL,34,'M',NULL,NULL,NULL,'Kakinada',NULL,NULL,NULL,7878787878,NULL,NULL,1),(182,NULL,'Rajesh Kumar','Lakan',NULL,45,'M',NULL,NULL,NULL,'kakinada',NULL,NULL,NULL,4234623423,NULL,NULL,1),(183,NULL,'Neelam','Haresh',NULL,23,'F',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,8342487978,NULL,NULL,1),(184,NULL,'Syam','Kumar',NULL,34,'M',NULL,NULL,NULL,'Kakinada',NULL,NULL,NULL,7867786867,NULL,NULL,1),(185,NULL,'Laxman','Anji',NULL,34,'M',NULL,NULL,NULL,'Kakinada',NULL,NULL,NULL,4234324324,NULL,NULL,1),(186,NULL,'Virat','Kohli',NULL,29,'M',NULL,NULL,NULL,'Delhi',NULL,NULL,NULL,7878978797,NULL,NULL,1),(187,NULL,'Anil Kumar','Prakash',NULL,34,'M',NULL,NULL,NULL,'goa',NULL,NULL,NULL,1029384756,NULL,NULL,1),(188,NULL,'Virender','Sehwag',NULL,39,'M',NULL,NULL,NULL,'Kakinada',NULL,NULL,NULL,7897995464,NULL,NULL,1),(189,NULL,'Poonam','Pappu',NULL,12,'F',NULL,NULL,NULL,'Anaparti',NULL,NULL,NULL,5647382910,NULL,NULL,1),(190,NULL,'Bhanu','Raddy',NULL,25,'M',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,5643534534,NULL,NULL,1),(191,NULL,'Bhanu','Lokesh',NULL,25,'M',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,6463463463,NULL,NULL,1),(192,NULL,'Bhanu','Lokesh',NULL,25,'M',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,5645645653,NULL,NULL,1),(193,NULL,'Lala','Ramu',NULL,45,'M',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,5646345345,NULL,NULL,1),(194,NULL,'Pappu','Pappal',NULL,34,'M',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,9654312312,NULL,NULL,1),(195,NULL,'Neelam','Peelam',NULL,45,'F',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,8657564564,NULL,NULL,1),(196,NULL,'Rahul Sharma','Ritish Sharma',NULL,24,'M',NULL,NULL,NULL,'Anaparti',NULL,NULL,NULL,898092348,NULL,NULL,1),(197,NULL,'Tarak','Roshan Lal',NULL,45,'M',NULL,NULL,NULL,'kakinada',NULL,NULL,NULL,5464562132,NULL,NULL,1),(198,NULL,'rammi','rammi father',NULL,25,'M',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,7386071110,NULL,NULL,1),(199,NULL,'raju garu','raju father',NULL,78,'M',NULL,NULL,NULL,'kkd',NULL,NULL,NULL,7777777777,NULL,NULL,1);
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
  `isPaid` tinyint(4) DEFAULT NULL,
  `dueAmount` double DEFAULT '0',
  `discount` double DEFAULT '0',
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=773 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_transactions`
--

LOCK TABLES `patient_transactions` WRITE;
/*!40000 ALTER TABLE `patient_transactions` DISABLE KEYS */;
INSERT INTO `patient_transactions` VALUES (631,181,NULL,'General OP Consultation',200,'Cash','2018-06-20 12:44:14','2018-06-20',1,1,16,195,NULL,0,NULL,NULL,'BRM/18-19/1',1,'18-19',NULL,1,1,0,0),(632,181,NULL,'General OP Consultation',200,'Cash','2018-06-20 12:44:58','2018-06-20',1,2,16,195,'',0,NULL,NULL,'BRM/18-19/2',1,'18-19',NULL,1,1,0,0),(633,181,NULL,'Labs',350,'Cash','2018-06-20 12:45:05','2018-06-20',1,3,16,195,'',0,NULL,NULL,'BRM/18-19/3',1,'18-19',NULL,16,1,0,0),(634,181,NULL,'Advance',2000,'Cash','2018-06-20 12:45:32','2018-06-20',1,4,16,195,'',0,NULL,NULL,'BRM/18-19/4',1,'18-19',NULL,18,1,0,0),(635,181,NULL,'Pharmacy',12,'Cash','2018-06-20 12:45:50','2018-06-20',1,5,16,195,'',0,NULL,NULL,'BRM/18-19/5',1,'18-19',NULL,15,1,0,0),(636,181,NULL,'Nursing Charges',300,'Cash','2018-06-20 12:48:03','2018-06-20',1,6,16,195,'',0,NULL,NULL,'BRM/18-19/6',1,'18-19',NULL,8,1,0,0),(637,181,NULL,'Labs',450,'Cash','2018-06-20 12:48:18','2018-06-20',1,7,16,195,'',0,NULL,NULL,'BRM/18-19/7',1,'18-19',NULL,16,1,0,0),(638,181,NULL,'Advance',5000,'Cash','2018-06-20 12:48:34','2018-06-20',1,8,16,195,'',0,NULL,NULL,'BRM/18-19/8',1,'18-19',NULL,18,1,0,0),(639,182,NULL,'General OP Consultation',300,'Cash','2018-06-20 14:34:52','2018-06-20',59,9,26,196,NULL,0,NULL,NULL,'BRM/18-19/9',1,'18-19',NULL,1,1,0,0),(640,182,NULL,'Pharmacy',12,'Cash','2018-06-20 14:36:40','2018-06-20',59,10,26,196,'',0,NULL,NULL,'BRM/18-19/10',1,'18-19',NULL,15,1,0,0),(641,183,NULL,'General OP Consultation',200,'Cash','2018-06-20 14:38:59','2018-06-20',59,11,27,197,NULL,0,NULL,NULL,'BRM/18-19/11',1,'18-19',NULL,1,1,0,0),(642,183,NULL,'Casualty Charges',2000,'Cash','2018-06-20 14:40:11','2018-06-20',59,12,27,197,'',0,NULL,NULL,'BRM/18-19/12',1,'18-19',NULL,12,0,1010,14),(643,183,NULL,'Labs',450,'Cash','2018-06-20 14:41:15','2018-06-20',59,13,27,197,'',0,NULL,NULL,'BRM/18-19/13',1,'18-19',NULL,16,1,0,0),(644,183,NULL,'Advance',1000,'Cash','2018-06-20 14:41:30','2018-06-20',59,14,27,197,'',0,NULL,NULL,'BRM/18-19/14',1,'18-19',NULL,18,1,0,0),(645,181,NULL,'Labs',1000,'Cash','2018-06-20 14:47:11','2018-06-20',59,15,16,195,'weqe',0,NULL,NULL,'BRM/18-19/15',1,'18-19',NULL,16,0,1000,0),(646,181,NULL,'General IP Consultation',500,'Cash','2018-06-20 14:47:56','2018-06-20',59,16,19,195,'IP Consultation',0,NULL,NULL,'BRM/18-19/16',1,'18-19',NULL,4,1,0,0),(647,181,NULL,'Labs',1000,'Cash','2018-06-20 14:47:56','2018-06-20',59,17,19,195,'LABS',0,NULL,NULL,'BRM/18-19/17',1,'18-19',NULL,16,1,0,0),(648,182,NULL,'Advance',100,'Cash','2018-06-20 14:51:44','2018-06-20',59,18,26,196,'',0,NULL,NULL,'BRM/18-19/18',1,'18-19',NULL,18,1,0,0),(649,181,NULL,'Labs',60,'Cash','2018-06-20 14:55:44','2018-06-20',59,19,16,195,'',0,NULL,NULL,'BRM/18-19/19',1,'18-19',NULL,16,1,0,0),(650,181,NULL,'Labs',50,'Cash','2018-06-20 14:58:55','2018-06-20',59,20,16,195,'',0,NULL,NULL,'BRM/18-19/20',1,'18-19',NULL,16,1,0,0),(651,183,NULL,'Pharmacy',12,'Cash','2018-06-20 16:49:11','2018-06-20',59,21,27,197,'',0,NULL,NULL,'BRM/18-19/21',1,'18-19',NULL,15,1,0,0),(652,183,NULL,'Pharmacy',12,'Cash','2018-06-20 17:05:58','2018-06-20',59,22,27,197,'',0,NULL,NULL,'BRM/18-19/22',1,'18-19',NULL,15,1,0,0),(653,181,NULL,'Pharmacy',12,'Cash','2018-06-20 17:11:01','2018-06-20',59,23,16,195,'',1,1,'2018-06-20 17:23:29','BRM/18-19/23',1,'18-19',NULL,15,1,0,0),(654,184,NULL,'General OP Consultation',200,'Cash','2018-06-20 17:12:52','2018-06-20',1,24,16,198,NULL,0,NULL,NULL,'BRM/18-19/24',1,'18-19',NULL,1,1,0,0),(655,181,NULL,'Nursing Charges',300,'Cash','2018-06-20 17:14:08','2018-06-20',1,25,16,195,'',1,1,'2018-06-20 17:14:17','BRM/18-19/25',1,'18-19',NULL,8,1,0,0),(656,181,NULL,'Nursing Charges',300,'Cash','2018-06-20 17:15:43','2018-06-20',1,26,16,195,'',1,1,'2018-06-20 17:23:39','BRM/18-19/26',1,'18-19',NULL,8,1,0,0),(657,181,NULL,'Pharmacy',12,'Cash','2018-06-20 17:16:48','2018-06-20',59,27,16,195,'',0,NULL,NULL,'BRM/18-19/27',1,'18-19',NULL,15,1,0,0),(658,181,NULL,'Pharmacy',12,'Cash','2018-06-20 17:17:45','2018-06-20',59,28,16,195,'',0,NULL,NULL,'BRM/18-19/28',1,'18-19',NULL,15,1,0,0),(659,181,NULL,'General IP Consultation',300,'Cash','2018-06-20 22:04:52','2018-06-20',1,29,16,195,'IP Consultation',0,NULL,NULL,'BRM/18-19/29',1,'18-19',NULL,4,1,0,0),(660,181,NULL,'Labs',200,'Cash','2018-06-20 22:04:52','2018-06-20',1,30,16,195,'LABS',0,NULL,NULL,'BRM/18-19/30',1,'18-19',NULL,16,1,0,0),(661,185,NULL,'General OP Consultation',200,'Cash','2018-06-21 22:05:44','2018-06-21',1,31,19,199,NULL,0,NULL,NULL,'BRM/18-19/31',1,'18-19',NULL,1,1,0,0),(662,185,NULL,'Nursing Charges',300,'Cash','2018-06-21 22:28:28','2018-06-21',1,32,19,199,'',0,NULL,NULL,'BRM/18-19/32',1,'18-19',NULL,8,1,0,0),(663,185,NULL,'Nebulization Charges',300,'Cash','2018-06-21 22:28:28','2018-06-21',1,32,19,199,'',0,NULL,NULL,'BRM/18-19/32',1,'18-19',NULL,11,0,200,0),(664,0,NULL,'General OP Consultation',200,'Cash','2018-06-22 08:37:24','2018-06-22',1,33,16,200,NULL,0,NULL,NULL,'BRM/18-19/33',1,'18-19',NULL,1,1,0,0),(665,0,NULL,'General OP Consultation',200,'Cash','2018-06-22 08:38:29','2018-06-22',1,34,19,201,NULL,0,NULL,NULL,'BRM/18-19/34',1,'18-19',NULL,1,1,0,0),(667,187,NULL,'General OP Consultation',200,'Cash','2018-06-22 09:59:07','2018-06-22',59,36,31,203,NULL,0,NULL,NULL,'BRM/18-19/36',1,'18-19',NULL,1,1,0,0),(668,187,NULL,'Emergency OP Consultation',1000,'Cash','2018-06-22 10:01:15','2018-06-22',59,37,31,203,'',0,NULL,NULL,'BRM/18-19/37',1,'18-19',NULL,2,1,0,0),(669,187,NULL,'Advance',1200,'Cash','2018-06-22 10:02:26','2018-06-22',59,38,31,203,'',0,NULL,NULL,'BRM/18-19/38',1,'18-19',NULL,18,1,0,0),(670,187,NULL,'Casualty OP Consultation',700,'Cash','2018-06-22 11:21:52','2018-06-22',1,39,31,203,'',0,NULL,NULL,'BRM/18-19/39',1,'18-19',NULL,3,1,700,0),(671,187,NULL,'Emergency OP Consultation',300,'Cash','2018-06-22 11:22:41','2018-06-22',1,40,31,203,'',0,NULL,NULL,'BRM/18-19/40',1,'18-19',NULL,2,0,426.66666666666,150),(672,187,NULL,'Casualty OP Consultation',300,'Cash','2018-06-22 11:22:41','2018-06-22',1,40,31,203,'',0,NULL,NULL,'BRM/18-19/40',1,'18-19',NULL,3,0,330,30),(673,187,NULL,'Casualty Charges',300,'Cash','2018-06-22 11:22:41','2018-06-22',1,40,31,203,'',0,NULL,NULL,'BRM/18-19/40',1,'18-19',NULL,12,0,340,30),(674,185,NULL,'Advance',300,'Cash','2018-06-22 11:23:31','2018-06-22',59,41,19,199,'',0,NULL,NULL,'BRM/18-19/41',1,'18-19',NULL,18,1,0,0),(675,187,NULL,'Emergency OP Consultation',300,'Cash','2018-06-22 11:24:15','2018-06-22',1,42,31,203,'',0,NULL,NULL,'BRM/18-19/42',1,'18-19',NULL,2,1,0,83.33333333333499),(676,185,NULL,'Advance',200,'Cash','2018-06-22 11:24:15','2018-06-22',59,43,19,199,'',0,NULL,NULL,'BRM/18-19/43',1,'18-19',NULL,18,1,0,0),(677,187,NULL,'Casualty OP Consultation',300,'Cash','2018-06-22 11:24:15','2018-06-22',1,42,31,203,'',0,NULL,NULL,'BRM/18-19/42',1,'18-19',NULL,3,0,343.33333333333,16.666666666667),(678,187,NULL,'Casualty Charges',300,'Cash','2018-06-22 11:24:15','2018-06-22',1,42,31,203,'',0,NULL,NULL,'BRM/18-19/42',1,'18-19',NULL,12,0,360,16.666666666667),(679,185,NULL,'Labs',250,'Cash','2018-06-22 11:26:23','2018-06-22',59,44,19,199,'',0,NULL,NULL,'BRM/18-19/44',1,'18-19',NULL,16,1,0,50),(680,185,NULL,'Labs',100,'Cash','2018-06-22 11:27:26','2018-06-22',59,45,19,199,'',0,NULL,NULL,'BRM/18-19/45',1,'18-19',NULL,16,1,0,50),(681,187,NULL,'Emergency OP Consultation',300,'Cash','2018-06-22 11:34:25','2018-06-22',1,46,31,203,'',0,NULL,NULL,'BRM/18-19/46',1,'18-19',NULL,2,1,0,50.000000000000995),(682,187,NULL,'Casualty OP Consultation',300,'Cash','2018-06-22 11:34:25','2018-06-22',1,46,31,203,'',0,NULL,NULL,'BRM/18-19/46',1,'18-19',NULL,3,1,0,33.333333333334),(683,187,NULL,'Casualty Charges',300,'Cash','2018-06-22 11:34:25','2018-06-22',1,46,31,203,'',0,NULL,NULL,'BRM/18-19/46',1,'18-19',NULL,12,0,360,16.666666666667),(684,182,NULL,'Pharmacy',0,'Cash','2018-06-22 11:36:56','2018-06-22',59,47,26,196,'',0,NULL,NULL,'BRM/18-19/47',1,'18-19',NULL,15,1,0,0),(685,187,NULL,'Emergency OP Consultation',300,'Cash','2018-06-22 11:37:20','2018-06-22',1,48,31,203,'',0,NULL,NULL,'BRM/18-19/48',1,'18-19',NULL,2,1,0,50),(686,187,NULL,'Casualty OP Consultation',300,'Cash','2018-06-22 11:37:20','2018-06-22',1,48,31,203,'',0,NULL,NULL,'BRM/18-19/48',1,'18-19',NULL,3,1,0,25),(687,187,NULL,'Emergency OP Consultation',200,'Cash','2018-06-22 11:38:15','2018-06-22',1,49,31,203,'',0,NULL,NULL,'BRM/18-19/49',1,'18-19',NULL,2,1,0,50),(688,187,NULL,'Casualty OP Consultation',200,'Cash','2018-06-22 11:38:15','2018-06-22',1,49,31,203,'',0,NULL,NULL,'BRM/18-19/49',1,'18-19',NULL,3,1,0,25),(689,187,NULL,'Advance',1000,'Cash','2018-06-22 11:39:06','2018-06-22',59,50,31,203,'',0,NULL,NULL,'BRM/18-19/50',1,'18-19',NULL,18,1,0,0),(690,187,NULL,'Casualty OP Consultation',300,'Cash','2018-06-22 11:39:59','2018-06-22',1,51,31,203,'',0,NULL,NULL,'BRM/18-19/51',1,'18-19',NULL,3,1,0,50),(691,187,NULL,'Casualty Charges',300,'Cash','2018-06-22 11:39:59','2018-06-22',1,51,31,203,'',0,NULL,NULL,'BRM/18-19/51',1,'18-19',NULL,12,1,0,25),(692,187,NULL,'Emergency OP Consultation',500,'Cash','2018-06-22 11:41:18','2018-06-22',1,52,31,203,'',0,NULL,NULL,'BRM/18-19/52',1,'18-19',NULL,2,1,500,0),(693,187,NULL,'Casualty Charges',500,'Cash','2018-06-22 11:41:18','2018-06-22',1,52,31,203,'',0,NULL,NULL,'BRM/18-19/52',1,'18-19',NULL,12,1,0,0),(694,187,NULL,'Casualty OP Consultation',300,'Cash','2018-06-22 11:42:15','2018-06-22',1,53,31,203,'',0,NULL,NULL,'BRM/18-19/53',1,'18-19',NULL,3,1,0,50),(695,187,NULL,'Casualty Charges',300,'Cash','2018-06-22 11:42:15','2018-06-22',1,53,31,203,'',0,NULL,NULL,'BRM/18-19/53',1,'18-19',NULL,12,1,0,25),(696,187,NULL,'Casualty OP Consultation',200,'Cash','2018-06-22 11:43:42','2018-06-22',1,54,31,203,'',0,NULL,NULL,'BRM/18-19/54',1,'18-19',NULL,3,1,0,50),(697,187,NULL,'Casualty Charges',200,'Cash','2018-06-22 11:43:42','2018-06-22',1,54,31,203,'',0,NULL,NULL,'BRM/18-19/54',1,'18-19',NULL,12,1,0,25),(698,187,NULL,'Advance',3000,'Cash','2018-06-22 11:44:41','2018-06-22',59,55,31,203,'',0,NULL,NULL,'BRM/18-19/55',1,'18-19',NULL,18,1,0,0),(699,187,NULL,'Casualty OP Consultation',200,'Cash','2018-06-22 11:44:44','2018-06-22',1,56,31,203,'',0,NULL,NULL,'BRM/18-19/56',1,'18-19',NULL,3,1,0,20),(700,187,NULL,'Casualty Charges',200,'Cash','2018-06-22 11:44:44','2018-06-22',1,56,31,203,'',0,NULL,NULL,'BRM/18-19/56',1,'18-19',NULL,12,1,0,10),(701,187,NULL,'Emergency OP Consultation',200,'Cash','2018-06-22 11:52:42','2018-06-22',1,57,31,203,'',0,NULL,NULL,'BRM/18-19/57',1,'18-19',NULL,2,1,0,50),(702,187,NULL,'Casualty OP Consultation',200,'Cash','2018-06-22 11:52:42','2018-06-22',1,57,31,203,'',0,NULL,NULL,'BRM/18-19/57',1,'18-19',NULL,3,0,150,25),(703,187,NULL,'Pharmacy',60,'Cash','2018-06-22 11:52:53','2018-06-22',59,58,31,203,'',0,NULL,NULL,'BRM/18-19/58',1,'18-19',NULL,15,1,0,0),(704,187,NULL,'Emergency OP Consultation',200,'Cash','2018-06-22 11:53:45','2018-06-22',1,59,31,203,'',0,NULL,NULL,'BRM/18-19/59',1,'18-19',NULL,2,1,0,0),(705,187,NULL,'Casualty Charges',200,'Cash','2018-06-22 11:53:45','2018-06-22',1,59,31,203,'',0,NULL,NULL,'BRM/18-19/59',1,'18-19',NULL,12,1,0,0),(706,187,NULL,'Casualty OP Consultation',200,'Cash','2018-06-22 11:54:23','2018-06-22',1,60,31,203,'',0,NULL,NULL,'BRM/18-19/60',1,'18-19',NULL,3,1,0,50.000000000000995),(707,187,NULL,'Casualty Charges',200,'Cash','2018-06-22 11:54:23','2018-06-22',1,60,31,203,'',0,NULL,NULL,'BRM/18-19/60',1,'18-19',NULL,12,0,166.66666666667,16.666666666667),(708,187,NULL,'General OP Consultation',200,'Cash','2018-06-22 11:54:23','2018-06-22',1,60,31,203,'',0,NULL,NULL,'BRM/18-19/60',1,'18-19',NULL,1,0,183.33333333333,16.666666666667),(709,187,NULL,'Advance',5000,'Cash','2018-06-22 11:54:49','2018-06-22',59,61,31,203,'',0,NULL,NULL,'BRM/18-19/61',1,'18-19',NULL,18,1,0,0),(710,187,NULL,'Anesthesian Charges',1000,'Cash','2018-06-22 12:08:32','2018-06-22',59,62,31,203,'',0,NULL,NULL,'BRM/18-19/62',1,'18-19',NULL,7,0,500,0),(711,187,NULL,'General ward ( MALE ) - BED 16',1000,'Cash','2018-06-22 12:11:57','2018-06-22',59,63,31,203,'',0,NULL,NULL,'BRM/18-19/63',1,'18-19',NULL,11,0,1000,0),(712,187,NULL,'General ward ( MALE ) - BED 16',1000,'Cash','2018-06-22 12:12:33','2018-06-22',59,64,31,203,'',0,NULL,NULL,'BRM/18-19/64',1,'18-19',NULL,11,0,1000,0),(713,187,NULL,'General IP Consultation',200,'Cash','2018-06-22 12:49:45','2018-06-22',59,65,27,203,'IP Consultation',0,NULL,NULL,'BRM/18-19/65',1,'18-19',NULL,4,0,200,0),(714,187,NULL,'Labs',1000,'Cash','2018-06-22 12:49:45','2018-06-22',59,66,27,203,'LABS',0,NULL,NULL,'BRM/18-19/66',1,'18-19',NULL,16,0,1000,0),(715,188,NULL,'General OP Consultation',200,'Cash','2018-06-22 14:02:39','2018-06-22',1,67,16,204,NULL,0,NULL,NULL,'BRM/18-19/67',1,'18-19',NULL,1,1,0,0),(716,189,NULL,'General OP Consultation',300,'Cash','2018-06-22 14:03:12','2018-06-22',59,68,28,205,NULL,0,NULL,NULL,'BRM/18-19/68',1,'18-19',NULL,1,1,0,0),(717,189,NULL,'Casualty OP Consultation',500,'Cash','2018-06-22 14:04:03','2018-06-22',59,69,28,205,'',0,NULL,NULL,'BRM/18-19/69',1,'18-19',NULL,3,0,500,0),(718,189,NULL,'Labs',500,'Cash','2018-06-22 14:04:21','2018-06-22',59,70,28,205,'',0,NULL,NULL,'BRM/18-19/70',1,'18-19',NULL,16,0,324,0),(719,188,NULL,'Nursing Charges',300,'Cash','2018-06-22 14:04:27','2018-06-22',1,71,16,204,'',0,NULL,NULL,'BRM/18-19/71',1,'18-19',NULL,8,1,0,200),(720,188,NULL,'Oxygen Charges',1000,'Cash','2018-06-22 14:04:27','2018-06-22',1,71,16,204,'',0,NULL,NULL,'BRM/18-19/71',1,'18-19',NULL,10,1,0,200),(721,188,NULL,'Small OT Charges',300,'Cash','2018-06-22 14:04:27','2018-06-22',1,71,16,204,'',0,NULL,NULL,'BRM/18-19/71',1,'18-19',NULL,14,1,0,200),(722,189,NULL,'Advance',2000,'Cash','2018-06-22 14:04:39','2018-06-22',59,72,28,205,'',0,NULL,NULL,'BRM/18-19/72',1,'18-19',NULL,18,1,0,0),(723,189,NULL,'Pharmacy',24,'Cash','2018-06-22 14:05:00','2018-06-22',59,73,28,205,'',0,NULL,NULL,'BRM/18-19/73',1,'18-19',NULL,15,1,0,0),(724,190,NULL,'General OP Consultation',300,'Cash','2018-06-22 17:18:23','2018-06-22',59,74,36,206,NULL,0,NULL,NULL,'BRM/18-19/74',1,'18-19',NULL,1,1,0,0),(725,191,NULL,'General OP Consultation',200,'Cash','2018-06-22 17:19:24','2018-06-22',59,75,31,207,NULL,0,NULL,NULL,'BRM/18-19/75',1,'18-19',NULL,1,1,0,0),(730,196,NULL,'General OP Consultation',200,'Cash','2018-06-22 17:30:09','2018-06-22',59,76,27,212,NULL,0,NULL,NULL,'BRM/18-19/76',1,'18-19',NULL,1,1,0,0),(731,184,NULL,'Pharmacy',24,'Cash','2018-06-22 17:35:35','2018-06-22',59,77,16,198,'',0,NULL,NULL,'BRM/18-19/77',1,'18-19',NULL,15,1,0,0),(733,188,NULL,'Emergency IP Consultation',200,'Cash','2018-06-22 17:57:06','2018-06-22',1,79,16,204,'',0,NULL,NULL,'BRM/18-19/79',1,'18-19',NULL,5,1,0,0),(734,188,NULL,'Anesthesian Charges',200,'Cash','2018-06-22 17:57:06','2018-06-22',1,79,16,204,'',0,NULL,NULL,'BRM/18-19/79',1,'18-19',NULL,7,1,0,0),(735,188,NULL,'Anesthesian Charges',200,'Cash','2018-06-22 17:57:26','2018-06-22',1,80,16,204,'',0,NULL,NULL,'BRM/18-19/80',1,'18-19',NULL,7,1,0,0),(736,188,NULL,'Ventilator Charges',200,'Cash','2018-06-22 17:57:26','2018-06-22',1,80,16,204,'',0,NULL,NULL,'BRM/18-19/80',1,'18-19',NULL,9,1,0,0),(737,188,NULL,'ICU Room Charges',3800,'Cash','2018-06-22 18:49:11','2018-06-22',1,81,16,204,'',0,NULL,NULL,'BRM/18-19/81',1,'18-19',NULL,17,1,0,0),(738,188,NULL,'General Ward Charges',200,'Cash','2018-06-22 18:49:11','2018-06-22',1,81,16,204,'',0,NULL,NULL,'BRM/18-19/81',1,'18-19',NULL,19,1,0,0),(739,188,NULL,'Advance',5000,'Cash','2018-06-22 18:50:08','2018-06-22',1,82,16,204,'',0,NULL,NULL,'BRM/18-19/82',1,'18-19',NULL,18,1,0,0),(740,188,NULL,'Nursing Charges',2200,'Cash','2018-06-22 18:52:34','2018-06-22',1,83,16,204,'',0,NULL,NULL,'BRM/18-19/83',1,'18-19',NULL,8,1,0,0),(741,188,NULL,'Anesthesian Charges',1000,'Cash','2018-06-22 18:53:10','2018-06-22',1,84,16,204,'',0,NULL,NULL,'BRM/18-19/84',1,'18-19',NULL,7,1,0,200),(742,188,NULL,'Advance',1000,'Cash','2018-06-22 18:53:35','2018-06-22',1,85,16,204,'',0,NULL,NULL,'BRM/18-19/85',1,'18-19',NULL,18,1,0,0),(743,189,NULL,'Labs',800,'Cash','2018-06-22 19:07:32','2018-06-22',1,86,28,205,'',0,NULL,NULL,'BRM/18-19/86',1,'18-19',NULL,16,1,0,0),(744,184,NULL,'General OP Consultation',200,'Cash','2018-06-23 05:55:59','2018-06-23',1,87,16,215,NULL,0,NULL,NULL,'BRM/18-19/87',1,'18-19',NULL,1,1,0,0),(745,184,NULL,'Emergency OP Consultation',300,'Cash','2018-06-23 05:56:28','2018-06-23',1,88,16,215,'',0,NULL,NULL,'BRM/18-19/88',1,'18-19',NULL,2,1,0,0),(746,184,NULL,'Casualty OP Consultation',300,'Cash','2018-06-23 05:56:28','2018-06-23',1,88,16,215,'',0,NULL,NULL,'BRM/18-19/88',1,'18-19',NULL,3,1,0,0),(747,184,NULL,'Advance',5000,'Cash','2018-06-23 08:20:09','2018-06-23',1,89,16,215,'Sample Advance Data',0,NULL,NULL,'BRM/18-19/89',1,'18-19',NULL,18,1,0,0),(748,186,NULL,'General OP Consultation',200,'Cash','2018-06-23 08:20:19','2018-06-23',59,90,31,216,NULL,0,NULL,NULL,'BRM/18-19/90',1,'18-19',NULL,1,1,0,0),(749,194,NULL,'General OP Consultation',200,'Cash','2018-06-23 08:23:48','2018-06-23',59,91,31,217,NULL,0,NULL,NULL,'BRM/18-19/91',1,'18-19',NULL,1,1,0,0),(750,193,NULL,'General OP Consultation',200,'Cash','2018-06-23 08:25:57','2018-06-23',59,92,16,219,NULL,0,NULL,NULL,'BRM/18-19/92',1,'18-19',NULL,1,1,0,0),(751,192,NULL,'Surgeon Charges',700,'Cash','2018-06-23 08:29:57','2018-06-23',59,93,27,218,'',0,NULL,NULL,'BRM/18-19/93',1,'18-19',NULL,6,0,150,0),(752,192,NULL,'Labs',1000,'Cash','2018-06-23 08:30:27','2018-06-23',59,94,27,218,'',0,NULL,NULL,'BRM/18-19/94',1,'18-19',NULL,16,1,0,0),(753,192,NULL,'Advance',1000,'Cash','2018-06-23 08:30:46','2018-06-23',59,95,27,218,'',0,NULL,NULL,'BRM/18-19/95',1,'18-19',NULL,18,1,0,0),(754,192,NULL,'Labs',50,'Cash','2018-06-23 08:33:25','2018-06-23',59,96,27,218,'',0,NULL,NULL,'BRM/18-19/96',1,'18-19',NULL,16,1,0,0),(755,192,NULL,'Advance',100,'Cash','2018-06-23 08:33:41','2018-06-23',59,97,27,218,'',0,NULL,NULL,'BRM/18-19/97',1,'18-19',NULL,18,1,0,0),(756,186,NULL,'Labs',450,'Cash','2018-06-23 08:35:53','2018-06-23',59,98,31,216,'',0,NULL,NULL,'BRM/18-19/98',1,'18-19',NULL,16,0,250,0),(757,186,NULL,'Advance',200,'Cash','2018-06-23 08:36:25','2018-06-23',59,99,31,216,'',0,NULL,NULL,'BRM/18-19/99',1,'18-19',NULL,18,1,0,0),(758,186,NULL,'Pharmacy',36,'Cash','2018-06-23 08:39:00','2018-06-23',59,100,31,216,'',0,NULL,NULL,'BRM/18-19/100',1,'18-19',NULL,15,1,0,0),(759,194,NULL,'Labs',350,'Cash','2018-06-23 08:41:26','2018-06-23',59,101,31,217,'',0,NULL,NULL,'BRM/18-19/101',1,'18-19',NULL,16,1,0,0),(760,194,NULL,'Labs',300,'Cash','2018-06-23 08:41:48','2018-06-23',59,102,31,217,'',0,NULL,NULL,'BRM/18-19/102',1,'18-19',NULL,16,0,150,0),(761,194,NULL,'Advance',150,'Cash','2018-06-23 08:42:04','2018-06-23',59,103,31,217,'',0,NULL,NULL,'BRM/18-19/103',1,'18-19',NULL,18,1,0,0),(762,184,NULL,'Pharmacy',12,'Cash','2018-06-23 08:55:05','2018-06-23',59,104,16,215,'',0,NULL,NULL,'BRM/18-19/104',1,'18-19',NULL,15,0,12,0),(763,184,NULL,'Pharmacy',12,'Cash','2018-06-23 08:58:32','2018-06-23',59,105,16,215,'',0,NULL,NULL,'BRM/18-19/105',1,'18-19',NULL,15,1,0,0),(764,184,NULL,'Pharmacy',6,'Cash','2018-06-23 09:35:17','2018-06-23',1,106,16,215,'',0,NULL,NULL,'BRM/18-19/106',1,'18-19',NULL,15,0,6,0),(765,193,NULL,'Pharmacy',12,'Cash','2018-06-23 10:09:52','2018-06-23',59,107,16,219,'',0,NULL,NULL,'BRM/18-19/107',1,'18-19',NULL,15,0,12,0),(766,193,NULL,'Advance',100,'Cash','2018-06-23 10:10:31','2018-06-23',59,108,16,219,'',0,NULL,NULL,'BRM/18-19/108',1,'18-19',NULL,18,1,0,0),(767,193,NULL,'Pharmacy',12,'Cash','2018-06-23 10:11:09','2018-06-23',59,109,16,219,'',0,NULL,NULL,'BRM/18-19/109',1,'18-19',NULL,15,1,0,0),(768,188,NULL,'General IP Consultation',500,'Cash','2018-06-23 10:14:14','2018-06-23',59,110,19,204,'IP Consultation',0,NULL,NULL,'BRM/18-19/110',1,'18-19',NULL,4,0,300,0),(769,188,NULL,'Labs',1000,'Cash','2018-06-23 10:14:14','2018-06-23',59,111,19,204,'LABS',0,NULL,NULL,'BRM/18-19/111',1,'18-19',NULL,16,0,1000,0),(770,185,NULL,'Advance',500,'Cash','2018-06-23 10:16:46','2018-06-23',59,112,19,199,'',0,NULL,NULL,'BRM/18-19/112',1,'18-19',NULL,18,1,0,0),(771,198,NULL,'General OP Consultation',200,'Cash','2018-06-23 10:22:55','2018-06-23',1,113,19,220,NULL,0,NULL,NULL,'BRM/18-19/113',1,'18-19',NULL,1,1,0,0),(772,199,NULL,'General OP Consultation',200,'Cash','2018-06-23 10:26:14','2018-06-23',17,114,16,221,NULL,0,NULL,NULL,'BRM/18-19/114',1,'18-19',NULL,1,1,0,0);
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
  PRIMARY KEY (`p_visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_visit`
--

LOCK TABLES `patient_visit` WRITE;
/*!40000 ALTER TABLE `patient_visit` DISABLE KEYS */;
INSERT INTO `patient_visit` VALUES (195,181,2,'2018-06-20 12:40:18',NULL,0,1,NULL),(196,182,2,'2018-06-20 14:32:58',NULL,0,59,NULL),(197,183,2,'2018-06-20 14:37:21',NULL,0,59,NULL),(198,184,1,'2018-06-20 17:12:23',NULL,1,1,NULL),(199,185,2,'2018-06-21 22:04:49',NULL,0,1,NULL),(200,0,1,'2018-06-22 08:36:34',1,1,1,18),(201,0,1,'2018-06-22 08:37:26',1,1,1,18),(202,186,1,'2018-06-22 09:51:52',NULL,1,1,NULL),(203,187,2,'2018-06-22 09:56:35',15,0,59,18),(204,188,2,'2018-06-22 14:02:16',NULL,0,1,NULL),(205,189,1,'2018-06-22 14:01:45',NULL,1,59,NULL),(206,190,NULL,'2018-06-22 17:17:43',NULL,1,59,NULL),(207,191,NULL,'2018-06-22 17:18:34',NULL,1,59,NULL),(208,192,1,'2018-06-22 17:21:01',NULL,1,59,NULL),(209,193,1,'2018-06-22 17:24:09',NULL,1,59,NULL),(210,194,1,'2018-06-22 17:25:31',NULL,1,59,NULL),(212,196,2,'2018-06-22 17:29:16',NULL,0,59,NULL),(214,184,1,'2018-06-22 23:18:39',NULL,1,1,NULL),(215,184,1,'2018-06-23 05:55:29',NULL,1,1,NULL),(216,186,1,'2018-06-23 08:17:31',NULL,1,59,NULL),(217,194,1,'2018-06-23 08:22:17',NULL,1,59,NULL),(218,192,2,'2018-06-23 08:24:30',NULL,0,59,NULL),(219,193,1,'2018-06-23 08:25:03',NULL,1,59,NULL),(220,198,1,'2018-06-23 10:18:56',NULL,1,1,NULL),(221,199,1,'2018-06-23 10:23:31',3,1,17,18);
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_billing`
--

LOCK TABLES `pharmacy_billing` WRITE;
/*!40000 ALTER TABLE `pharmacy_billing` DISABLE KEYS */;
INSERT INTO `pharmacy_billing` VALUES (60,635,'BRM/18-19/5',1,1,12.00,1,56,12),(61,640,'BRM/18-19/10',1,59,12.00,1,50,12),(62,651,'BRM/18-19/21',1,59,12.00,1,30,10),(63,652,'BRM/18-19/22',2,59,12.00,1,57,10),(64,653,'BRM/18-19/23',2,59,12.00,1,57,10),(65,657,'BRM/18-19/27',2,59,12.00,1,57,10),(66,658,'BRM/18-19/28',2,59,12.00,1,57,10),(67,703,'BRM/18-19/58',2,59,12.00,5,57,10),(68,723,'BRM/18-19/73',8,59,12.00,2,60,12),(69,731,'BRM/18-19/77',1,59,12.00,2,56,12),(70,758,'BRM/18-19/100',1,59,12.00,3,56,12),(71,762,'BRM/18-19/104',12,59,6.00,2,44,5),(72,763,'BRM/18-19/105',2,59,12.00,1,57,10),(73,764,'BRM/18-19/106',12,1,6.00,1,44,5),(74,765,'BRM/18-19/107',2,59,12.00,1,57,10),(75,767,'BRM/18-19/109',1,59,12.00,1,49,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_master`
--

LOCK TABLES `referral_master` WRITE;
/*!40000 ALTER TABLE `referral_master` DISABLE KEYS */;
INSERT INTO `referral_master` VALUES (1,'REF1','dorababu','RMP','HOSPITAL','none','sanjivini mitra','kakinada','7013404554','7013404554','tk.dorababu@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'REF2','Md Alisha','STAFF','CLINIC','Alisha clinic','Rk Rao peta','kakinada','7013982777','7013982777','Alishabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(3,'REF3','M V srinivas','RMP','CLINIC','Srinivas clinic','chollangi','chollangi','8790510640','8790510640','srinivasbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'REF4','K Sudhakar','RMP','CLINIC','sudhakar clinic','vomanngi','vomangi','9581395913','9581395913','sudhkarbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(5,'REF5','U sitharama raju apsp','RMP','CLINIC','sai priya clinic','near apsp','kakinada','9949183132','9949183132','rajubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(6,'REF6','Paul prasad pastor','RMP','CLINIC','paul clinic','near jerusalem church','nadakuduru','9959462307','9959462307','paulbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(7,'REF7','P Raju','RMP','CLINIC','raju clinic','chollangi','chollangi','9948087351','9948087351','prajubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(8,'REF8','P Bhashkar Rao','RMP','CLINIC','Bhaskar clinic','near ramalayam','komarigiri','7288033033','7288033033','bhashkarbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(9,'REF9','Chimmili srinivasulu','RMP','CLINIC','srinivas clinic','yellangi peta','Tondangi mandalam','9490262231','9490262231','srinivasbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(10,'REF10','Vailapali Venkateshwaao','RMP','CLINIC','venkateshwara clinic','durgam cheruvu','kajuluru mandalam','9949188762','9949188762','venkateshwarabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(11,'REF10','Kamarada Badam rao','RMP','CLINIC','santhi clinic','pedadda','Rajolu mandalam','9440441169','9440441169','Badamraobrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(12,'REF10','J S Prasad','RMP','CLINIC','Prasad clinic','pallepalam','yanam','9912562190','9912562190','Prasadbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(13,'REF10','P Satti Babu','RMP','CLINIC','sattibabu clinic','chitrada','chitrada','9951105469','9951105469','sattibabubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(14,'REF10','Masina Bhimeswara rao','RMP','CLINIC','bhimeshwara clinic','Matam Center','Samalkota','9849014686','9849014686','bhimeshwarabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(15,'REF10','D Prasad','RMP','CLINIC','Prasad clinic','Uppada','Uppada','7095776676','7095776676','prasadbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(16,'REF10','M V Satyanarayana','RMP','CLINIC','Satyanarayana clinic','valasapakala','valasapakala','9100230939','9100230939','satyanarayanabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(17,'REF10','Raju kakinada','RMP','CLINIC','New Arogya clinic','Sanjay NAgar','kakinada','9848549481','9848549481','rajupmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(18,'REF10','M Babji','RMP','CLINIC','Babji clinic','Gudivada village','peddapuram madalam','7416727626','7416727626','babjibrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(19,'REF10','Dr pampala satyanarayana','RMP','HOSPITAL','Suvarna clinic','N kottapalli','Uppala guptam','9949714243','9949714243','Suvarnabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(20,'REF10','Y Srinivas','RMP','CLINIC','Srinivasa clinic','Dairyform center','kakinada','9866662225','9866662225','srinivasbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(21,'REF10','P Govind','RMP','CLINIC','govind clinic','Bikkavolu','Bikkavolu','9849579405','9849579405','govindbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(22,'REF10','N Siva','RMP','CLINIC','Siva clinic','cheediga','kakinada','7396315289','7396315289','sivabrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(23,'REF10','P Siva Reddy','RMP','CLINIC','siva reddy clinic','Indrapalem','kakinada','9652525353','9652525353','sivareddybrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(24,'REF10','G Srinu','RMP','CLINIC','srinu clinic','Veldurti','pithapuram','9848859496','9848859496','srinubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(25,'REF10','Dr Madhu','RMP','CLINIC','madhu hospital','vakalapudi','vakalapudi','9247222575','9247222575','madhubrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(26,'REF10','G Srinivasa Rao','RMP','CLINIC','GSR clinic','venkata nagar','kakinada','9491891831','9491891831','gsrbrm@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(27,'REF10','Sivakeshava pmp','RMP','CLINIC','sivakeshava clinic','Draksharamam','Draksharamam','9550119709','9550119709','sivapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(28,'REF10','Kumar pmp','RMP','CLINIC','kumar clinic','Chebrolu','chebrolu','9948047048','9948047048','kumarpmp@gnail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(29,'REF10','R Vara Prasad pmp','RMP','CLINIC','varaprasad clinic','near somavaram','yeleshwaram','9494957103','9494957103','varaprasadpmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(30,'REF10','Tata Rao pmp','RMP','CLINIC','Tatarao clinic','Jaganaikpur','kakinada','9949318797','9949318797','tataraopmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(31,'REF10','Kasi garu PMP','RMP','CLINIC','kasi clinic','kakinada','kakinada','9133388105','9133388105','kasipmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(32,'REF10','Lokeshwarao','RMP','CLINIC','Madhuri Clinic','peddapuram','peddapuram','9866464353','9866464353','lokeshwaraormp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(33,'REF10','Nagendhra pro','RMP','CLINIC','nagendhra clinic','kajuluru','kajuluru','7095021112','7095021112','nagendhrapro@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(34,'REF10','Samba sivarao pmp','RMP','CLINIC','sambasiva clinic','kerlampudi','kerlampudi','9949383426','9949383426','sambapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(35,'REF10','VENKATA RAO GARU PMP','DOCTOR','CLINIC','venkateshwara clinic','Goddatipalem','karapa mandalam','9177833419','9177833419','venkateshwararaopmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(36,'REF10','Chandu pmp','RMP','CLINIC','chandu clinic','dairy form center rajiv gruhakalpa center','kakinada','9849762004','9849762004','chandupmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(37,'REF10','Mahesh pmp','DOCTOR','CLINIC','mahesh clinic','opp spandana studio','kakinada','9441324309','9441324309','maheshpmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(38,'REF10','DR Vijay pmp','DOCTOR','CLINIC','vijay clinic','kandaregula','karapa mandalam','9949565946','9949565946','vijaypmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(39,'REF10','Dr Ismail pmp','DOCTOR','CLINIC','Ismail clinic','Ommangi','Ommangi','9949430514','9949430514','ismailpmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(40,'REF10','Dr Narasimha pmp','DOCTOR','CLINIC','Narasimha clinic','Talla revu','kakinada','9441420494','9441420494','narasimhapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(41,'REF10','Dr Ramana pmp','RMP','CLINIC','Ramana clinic','Sarpavaram','kakinada','9666889521','9666889521','ramanapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(42,'REF10','Dr Sankar pmp','RMP','CLINIC','Sankar clinic','Gandhi Nagar','kakinada','9848549552','9848549552','sankarpmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(43,'REF10','Dr D saleem pmp','RMP','CLINIC','saleem clinic','Tallarevu main Road','main road Tallarevu','9618054231','9618054231','saleempmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(44,'REF10','Dr Srnivas chanti pmp','RMP','CLINIC','chanti clinic','Sitaramapuram','Tallarevu','9849002291','9849002291','chantipmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(45,'REF10','Dr v satyanarayana pmp','RMP','CLINIC','siva clinic','dumulapeta','kakinada','9652390960','9652390960','vsatyanarayanapmp@gmail.com','Send',1,NULL,NULL,NULL,NULL,NULL,NULL),(46,'REF10','SRINIVAS KARAPA','RMP','CLINIC','SRI SAI DURGA CLINIC','KARAPA','KARAPA','9666222003','9666222003','bobbilisrinivasarao@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(47,'REF10','Rajesh karpa','RMP','CLINIC','sai durga clinic','karapa','karapa','9959200833','9959200833','rajesh@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(48,'REF10','B KUMAR Kirlampudi','RMP','CLINIC','kumar clinic','Kirlampudi','kirlampudi','9848655080','9848655080','kumar@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(49,'REF10','RAGHUNATH komarigiri','RMP','CLINIC','ragunath clinic','Komarigiri','komarigiri','7288033033','7288033033','ragunath@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(50,'REF10','Sastry Katravulapalli','RMP','CLINIC','sastry clinic','katravulapalli','katravulapalli','9849338822','9849338822','sastry@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(51,'REF10','SITHARAMARJU  Vemavaram','RMP','CLINIC','Sai ram clinic','VEMAVARAM','VEMAVARAM','9866049149','9866049149','sitharamaraju@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(52,'REF10','V SRINU Yanam','RMP','CLINIC','avanthika clinic','yanam three cases','yanam','9573208050','9573208050','vsrinuyanam@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(53,'REF10','MURTHY BH V N   Velagi','RMP','CLINIC','murthyclinic','VELAGI','VELAGI','9014351113','9014351113','murthy@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(54,'REF10','PRASAD JAGGAMPETA HAND','RMP','CLINIC','prasad clinic','JAGGAMPETA','JAGGMPETA','7989931548','7989931548','prasad@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(55,'REF10','TATAJI  OT  CARM','RMP','CLINIC','tataji clinic','KAKINADA','KAKINADA','8341926210','8341926210','tataji@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(56,'REF10','SUDHKAR VOMANGGI ARUNA','RMP','CLINIC','sudhkar clinic','VOMANGGI','VOMANGGI','9581395913','9581395913','sudhkar@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL),(57,'REF10','SURYANARAYANA G  TURANGI','RMP','CLINIC','ALAIKYA CLINIC','TURANGI','TURANGI','9948846768','9948846768','suryanarayana@gmail.com','Both',1,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Inventory','CASUALITY',1,'123423423442342','123423423423','No','Yes',1,8),(2,'Inventory','OT MODULAR THEATRE',1,'132423432344343','1','No','Yes',1,7),(3,'Inventory','BRM MEDICAL STORE',1,'176854654343534','1','Yes','Yes',1,2),(4,'Inventory','General ward Male',1,'123452342364563','12345','No','Yes',1,5),(5,'Inventory','ICU MEDICALS',1,'12342342323','2343243','No','No',1,4),(6,'Inventory','MINOR OT',1,'123454234234234','12345','No','Yes',1,27),(7,'Inventory','LAB',1,'123451231231231','12345','No','Yes',1,2),(8,'Inventory','X RAY LAB',1,'123453450987654','12345','No','Yes',1,20);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'SRI NAVYA MEDICAL AGENCY','Opp RTC Complx road','KAKINADA','BOSU BABU','9866077630','37ARUPA0957D1ZR','1234567536',1,NULL),(2,'SRI SURYA MEDICAL STORES','RAMANAYYAPETA','KAKINADA','SURYA','9849672303','37AACHB0025N1ZK','12345',1,NULL),(3,'DEV MEDICARE','JAWAHAR STREET','KAKINADA','DEV','9490887325','37AESPM1552K1ZO','12345',1,NULL),(4,'SRI SRINIVASA SURGICALS','KEDARESWARA PETA','VIJAYAWADA','SRINIVAS','9542699499','37AVAPA1592N1ZH','12345',1,NULL),(5,'CLAY CHEMICAL COMPANY','KOTHAPETA MARKET STREET','KAKINADA','A','9848221911','37AEVPM6608M1ZM','12345',1,NULL),(6,'V L K ENTERPRISES','Vempativari street','KAKINADA','','9885039944','37AHIPN0603R1ZZ','12345',1,NULL),(7,'SRI VENKATESHWARA AGENCIES PVT','OPP HDFC BANK DANAVAI PETA','RAJAHMUNDRY','','0883247376','37AADCS1211K1ZK','12345',1,NULL),(8,'LABNOVA DIAGNOSTICS  HEALTHCA','REVENUE COLONY','KAKINADA','','9848287415','37BWZPD2351R1ZN','12345',1,NULL),(9,'UDAYA BHASKAR ENTERPRISES','RAMARAO STREET','KAKINADA','','9640146888','37AMLPC9827A1Z3','12345',1,NULL),(10,'SANA ENTERPRISERS','DASPALLA LAYOUT','VISHAKAPATNAM','','9393129818','37AABPZ4967C1ZC','12345',1,NULL),(11,'SRI KARTHIK MEDICAL  SURGICAL','SRINIVASA NAGAR','NANDYAL','','9676777877','37DBLPS5604D1ZI','12345',1,NULL),(12,'SURANA ENTERPRISES','MAIN ROAD','KAKINADA','','0884237720','136434646435653','12345',1,NULL),(13,'SRI SOLUTIONS','SUBHADRA ARCADE','KAKINADA','','9959030578','37AHZPR5017Q1Z6','12345',1,NULL),(14,'EVB TECHNOLOGIES','HUKUMPETA','RAJAHMUNDRY','','9866810099','123456879012345','12345',1,NULL),(15,'R L HANSRAJ AND CO','GANESH COMPLEX','CHENNAI','','2535654825','33AAFFR5797L1ZK','12345',1,NULL),(16,'KUMARS COLOUR CORNER','RAJAJI STREET','KAKINADA','','9246693306','37AAHFK6430F1ZE','12345',1,NULL),(17,'A ONE FURNITURE','JAWAHAR STREET','KAKINADA','','7396494444','37AEUPV9762Q1ZT','12345',1,NULL),(18,'BHARAT ENTP SURGICALS','TIRUMALA THEATRE','KAKINADA','','9000357888','37AAIFN9956G1ZN','12345',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_billing`
--

LOCK TABLES `test_billing` WRITE;
/*!40000 ALTER TABLE `test_billing` DISABLE KEYS */;
INSERT INTO `test_billing` VALUES (176,633,'BRM/18-19/3',1,1,350.00),(177,637,'BRM/18-19/7',3,1,450.00),(178,643,'BRM/18-19/13',3,59,450.00),(179,645,'BRM/18-19/15',7,59,1000.00),(180,647,'BRM/18-19/17',7,59,1000.00),(181,649,'BRM/18-19/19',69,59,60.00),(182,650,'BRM/18-19/20',16,59,50.00),(183,660,'BRM/18-19/30',78,1,200.00),(184,679,'BRM/18-19/44',23,59,250.00),(185,680,'BRM/18-19/45',25,59,100.00),(186,714,'BRM/18-19/66',4,59,1000.00),(187,718,'BRM/18-19/70',5,59,500.00),(188,743,'BRM/18-19/86',3,1,450.00),(189,743,'BRM/18-19/86',1,1,350.00),(190,752,'BRM/18-19/94',7,59,1000.00),(191,754,'BRM/18-19/96',13,59,50.00),(192,756,'BRM/18-19/98',3,59,450.00),(193,759,'BRM/18-19/101',8,59,350.00),(194,760,'BRM/18-19/102',11,59,300.00),(195,769,'BRM/18-19/111',4,59,1000.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_pricing`
--

LOCK TABLES `test_pricing` WRITE;
/*!40000 ALTER TABLE `test_pricing` DISABLE KEYS */;
INSERT INTO `test_pricing` VALUES (1,1,350,22),(2,2,1000,22),(3,3,450,22),(4,4,1000,22),(5,5,500,22),(6,6,50,22),(7,7,1000,22),(8,8,350,22),(9,9,150,22),(10,10,1000,22),(11,11,300,22),(12,12,200,22),(13,13,50,22),(14,14,50,22),(15,15,100,22),(16,16,50,22),(17,17,50,22),(18,18,50,22),(19,19,50,22),(20,20,300,22),(21,21,300,22),(22,22,100,22),(23,23,250,22),(24,24,50,22),(25,25,100,22),(26,26,100,22),(27,27,100,22),(28,28,200,22),(29,29,100,22),(30,30,100,22),(31,31,100,22),(32,32,100,22),(33,33,100,22),(34,34,100,22),(35,35,200,22),(36,36,150,22),(37,37,150,22),(38,38,150,22),(39,39,100,22),(40,40,100,22),(41,41,100,22),(42,42,150,22),(43,43,150,22),(44,44,100,22),(45,45,50,22),(46,46,50,22),(47,47,50,22),(48,48,50,22),(49,49,450,22),(50,50,350,22),(51,51,400,22),(52,52,250,22),(53,53,100,22),(54,54,1000,22),(55,55,1000,22),(56,56,300,22),(57,57,300,22),(58,58,300,22),(59,59,100,22),(60,60,60,22),(61,61,60,22),(62,62,300,22),(63,63,300,22),(64,64,300,22),(65,65,300,22),(66,66,200,22),(67,67,60,22),(68,68,60,22),(69,69,60,22),(70,78,200,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ADM1','PSR KUMAR','kumar@cobrain.tech','cobrain','9694202815','Srinagar','Kakinada',1,1,'M.Tech','Computer Science',NULL,NULL,'N','1978-02-02','N','kumar','Y'),(15,'AC1','Pavan Kumar','pavankumar56595@gmail.com','kumar','9866527428','Kakinada','Kakinada',10,1,'MBA','Finance',NULL,'9866527428','N','2018-05-02','N','pavan','Y'),(16,'DR1','Ram Murthy','bollapragada.rm@gmail.com','brm','9989802199','Kakinada','Kakinada',3,1,'M.B.B.S, M.A, M.S','General Medicine',NULL,'9989802199','N','2018-05-02','N','ram','N'),(17,'ADM2','Subrahmanyam Salumuri','salmuri@gmail.com','admin','7799329729','Main Road','kakinada',1,1,'B.Sc','Computers',NULL,'7799329729','N','2018-05-02','N','salmuri','Y'),(18,'PR1','ganesh','s@gmail.com','123','9899989999','main road','kkd',8,1,'MBA','HRM',NULL,'9899989999','N','2017-03-24','N','ganesh','N'),(19,'DR2','Jagan mohan','jagan.brm@gmail.com','brm','9154326696','100 building','kakinada',3,1,'md','general medicine',NULL,'9154326696','N','2018-05-03','N','jagan','N'),(20,'DR3','kishore kumar','brm.kishore@gmail.com','brm','8888999900','kakinada','kakinada',3,1,'mbbs','General Surgery',NULL,'8888999900','N','2018-05-03','N','kishore','N'),(21,'DR4','satish','sathish@gmail.com','brm','8888999900','ds','sd',3,1,'mbbs','Anesthesia',NULL,'8888999900','N','2018-05-03','N','satish','Y'),(22,'LT1','SAI KUMAR','ksai6278@gmail.com','brm','9966864533','j ramarao peta','KAKINADA',5,1,'MLT','MLT',NULL,'9966864533','N','2018-05-04','N','sai','Y'),(23,'IT1','P SATYANARAYANA','satya515253@gmail.com','brm','9493882512','SURYANARAYANA PURAM','KAKINADA',6,1,'CRA','X-RAY TECH',NULL,'9493882512','N','2018-05-04','N','satyanarayana','Y'),(24,'ADM3','RAVICHANDRA','brmcarewell@gmail.com','silicon','9704799992','GUDIMETLA VARI STREET','KAKINADA',1,1,'MBA','director',NULL,'9063995999','N',NULL,'Y','ravichandra','Y'),(25,'OS1','B DURGA DEVI','durgadevi1998727@gmail.com','brm','8499042337','mamatha scaning centre','kakinada',9,1,'CARDIOLOGY TECHNISION','cardiology','a','8499042337','N','2018-05-05','N','devi','N'),(26,'DR5','DR.T.RAMESH',NULL,'BRM123','9912841114','KAKINADA','KAKINADA',3,1,'MBBS, MS ORTHO','ORTHOPEDIC SURGERY',NULL,'9912841114','N',NULL,'Y','DR. T.RAMESH','N'),(27,'DR6','DR.G.PRAVEENNATH','syamuchandu@gmail.com','BRM123','9654957468','KAKINADA','KAKINADA',3,1,'DNB( PULUMONOLOGY ),MNAMS,FCCS','DNB PULOMONOLOGY','','9654957468','N','','Y','DR.G.PRAVEENNATH','N'),(28,'DR7','DR.P.HARI PRASAD','','BRM123','9654957468','KAKINADA','KAKINADA',3,1,'MS., M.CH NEURO SURGEN','NEURO SURGEN','','9654957468','N','','Y','DR.P.HARI PRASAD','N'),(29,'DR8','DR.D.RAMAKISHORE',NULL,'BRM123','9052299923','kakinada','kakinada',3,1,'MS ortho','ORTHOPEDIC SURGERY','9885951019 wife','9052299923','N',NULL,'N','DR.D.RAMAKISHORE','N'),(30,'DR9','DR.N.SRINIVAS','','BRM123','9848277361','KAKINADA','KAKINADA',3,1,'MS GEERAL SURGEN','MS GENERAL SURGERY','','9052299923','N','','N','DR.N.SRINIVAS','N'),(31,'DR10','DR.SPANDANA','','BRM123','9246695245','KAKINADA','KAKINADA',3,1,'MD,DVL','DERMOTOLOGY','','9246695245','N','','N','DERMOTOLOGY','N'),(32,'DR11','DR.RAMJI NARENDHRA','','BRM123','9488352586','KAKINADA','KAKINADA',3,1,'MS GENERAL SURGEN','GENERAL SURGEN','','9488352586','N','','Y','GENERAL SUREN','N'),(33,'DR12','DR.TEJO KRISHNA','','BRM123','9441785212','KAKINADA','KAKINADA',3,1,'MS,NEPROLOGY','NEPROLOGIST','','9441785212','N','','Y','NEPROLOGY','N'),(34,'DR13','DR.GOPI KRISHNA','','BRM123','9908834660','KAKINADA','KAKINADA',3,1,'MD NEURO PHYSICIAN','NEURO PHYSICIAN','9398888989','9908834660','N','','Y','NEURO PHYSICIAN','N'),(35,'DR14','DR.GOUTHAM PRAVEEN','','BRM123','9000592588','KAKINADA','KAKINADA',3,1,'MD NEURO PHYSICIAN','NEURO PHYSICIAN','','9000592588','N','','Y','DR.GOUTHAM PRAVEEN','N'),(36,'DR15','DR.GANESH','','BRM123','9493882515','KAKINADA','KAKINADA',3,1,'MS UROLOGY','UROLOGIST','','9493882515','N','','N','UROLOGY','N'),(37,'DR16','DR.B.SURENDRA BABU','','BRM123','9848528954','KAKINADA','KAKINADA',3,1,'MS UROLOGY','UROLOGIST','9441811442','9848528954','N','','Y','DR.B.SURENDRA BABU','N'),(38,'DR17','DR.ANJI NAYAK','','BRM123','9494573105','KAKINADA','KAKINADA',3,1,'MS UROLOGY','UROLOGIST','','9494573105','N','','N','DR.ANJI NAYAK','N'),(39,'DR18','DR. VENKATA REDDY','','BRM123','9948124102','KAKINADA','KAKINADA',3,1,'MD GASTROENTROLOGY','GASTRO','','9948124102','N','','N','GASTROENTROLOGY','N'),(40,'DR19','DR. PHANI','','BRM123','8978067181','KAKINADA','KAKINADA',3,1,'MD ANASTECIA','ANASTHECIA','','8978067181','N','','Y','ANASTHECIA','N'),(41,'DR20','DR. ANAL KUMAR','','BRM123','9848233155','KAKINADA','KAKINADA',3,1,'MD ANASTECIA','ANASTHECIA','','9848233155','N','','N','DR. ANAL KUMAR','N'),(42,'DR21','DR, SIVA ANVESH junior doctor','','BRM123','8074888801','kakinada','KAKINADA',3,1,'ANASTECIA','ANASTHECIA','','8074888801','N','','N','DR. SIVA ANVESH','N'),(43,'DR22','DR. AMRUTHA','','BRM123','8008448333','KAKINADA','KAKINADA',3,1,'GYNECOLOGOST','GYNOCOLOGY','9966647179','8008448333','N','','N','GYNAECOLOGIST','N'),(44,'DR23','DR. VIJAYA LAKSHMI','','BRM123','9959040180','KAKINADA','KAKINADA',3,1,'GYNECOLOGOST','MD, GYNOCOLOGY','','9959040180','N','','N','DR. VIJAYA LAKSHMI','N'),(45,'DR24','DR. TUSHAR AGARWAL','','BRM123','9676160632','KAKINADA','KAKINADA',3,1,'MS ORTHO','ORTHOPHYSICIAN','9391467020','9676160632','N','','Y','DR. TUSHAR AGARWAL','N'),(46,'DR25','DR. ANAND CHOWDARY','','BRM123','9959691999','RAJHAMUNDRY','RAJHAMUNDRY',3,1,'MS ORTHO','ORTHOPHYSICIAN','','9959691999','N','','Y','DR. ANAND CHOWDARY','N'),(47,'DR26','DR. T. S. R. MURTHY','','BRM123','9440110422','KAKINADA','KAKINADA',3,1,'DIPLOMO ORTHO','ORTHOPHYSICIAN','','9440110422','N','','N','DR. T. S. R. MURTHY','N'),(48,'DR27','DR. BHASHKAR REDDY','','BRM123','9848061941','KAKINADA','KAKINADA',3,1,'MS PEDIATRIC','PEDIATRICIAN','','9848061941','N','','N','PEDIATRIC','N'),(49,'DR28','DR. SRIDHAR','','BRM123','9849756888','KAKINADA','KAKINADA',3,1,'MS PEDIATRIC','PEDIATRICIAN','','9849756888','N','','N','DR, SRIDHAR','N'),(50,'DR29','DR. VASANTH','','BRM123','8142435236','KAKINADA','KAKINADA',3,1,'GENERAL MEDICIAN','GENERAL MEDICIAN','9491847491','8142435236','N','','N','GENERAL MEDICIAN','N'),(51,'DR30','b krishna santosh','krrishent@yahoo.com','brm123','9553056058','vinukonda vari street','kakinada',3,1,'mbbs ms ent','ent','','9553056058','N','','Y','ent speciality','N'),(52,'DR31','Sushimitha','','brm123','9878987898','main road','kakinada',3,1,'M.S','Gynecologist','','9878987898','N','','N','Sushimitha','N'),(53,'DR32','D S L V NARASIMHAM','','BRM123','1234567890','KAKINADA','KAKINADA',3,1,'MS','GENERAL SURGEON','','1234567890','N','','N','D S V L NARASIMHAM','N'),(54,'NS1','S NAVEEN',NULL,'BRM123','8686665125','PITHPURAM','PITHAPURAM',4,1,'DEGREE','CASUALITY ANASTECIA TECH',NULL,'8686665125','N',NULL,'N','NAVEEN','Y'),(55,'DR33','DR. SRIMANARAYANA','','BRM123','9848642642','KAKINADA','KAKINADA',3,1,'MS ORTHO','MS ORTHO','','9848642642','N','','Y','SRIMANARAYANA','N'),(56,'ADM4','ramamurthy','bollapragada.rm@gmail.com','','9989802199','gudimetla vari st','kakinada',1,1,'mbbs','mbbs','','9989802199','N','','N','','N'),(59,'ADM5','Shailendra','','cobrain','7078276728','','Mathura',1,1,'B.Sc','','','7078276728','N','','N','sunny','Y'),(60,'ADM6','tarun','','taruncool','7386071070','','KKD',1,1,'BSC','','','7386071070','N','','N','tarun','Y'),(61,'DR34','tarun babu','','cobrain','1111111111','','kkd',3,1,'mbbs','General medicine','','1111111111','N','','N','robo','Y'),(62,'AC2','robo','','123456','1222121212','','kkd',10,1,'BSC','','','1222121212','N','','N','roboaccount','Y');
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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hospital`
--

LOCK TABLES `user_hospital` WRITE;
/*!40000 ALTER TABLE `user_hospital` DISABLE KEYS */;
INSERT INTO `user_hospital` VALUES (57,10,1,0),(106,11,1,0),(107,11,2,0),(108,11,6,0),(115,24,1,0),(117,25,1,0),(120,22,1,0),(121,15,1,0),(122,60,1,0),(123,60,2,0),(124,17,1,0),(125,17,2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=1494 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu`
--

LOCK TABLES `user_menu` WRITE;
/*!40000 ALTER TABLE `user_menu` DISABLE KEYS */;
INSERT INTO `user_menu` VALUES (267,23,57),(268,23,77),(269,23,74),(270,23,78),(271,23,79),(272,23,82),(273,23,67),(274,23,84),(275,23,85),(276,23,80),(277,23,86),(278,23,87),(279,23,90),(280,23,108),(428,24,60),(429,24,1),(430,24,52),(431,24,54),(432,24,53),(433,24,51),(434,24,58),(435,24,64),(436,24,66),(437,24,100),(438,24,101),(439,24,57),(440,24,77),(441,24,74),(442,24,78),(443,24,79),(444,24,82),(445,24,67),(446,24,84),(447,24,85),(448,24,80),(449,24,86),(450,24,87),(451,24,90),(452,24,108),(453,24,72),(454,24,91),(455,24,92),(456,24,104),(457,24,62),(458,24,99),(459,24,105),(460,24,95),(461,24,96),(462,24,97),(463,24,98),(464,24,103),(465,24,106),(466,24,107),(509,22,92),(510,22,104),(511,22,62),(512,22,99),(513,22,105),(514,15,52),(515,15,54),(516,15,53),(517,15,51),(518,15,58),(519,15,64),(520,15,66),(521,15,100),(522,15,101),(523,15,57),(524,15,77),(525,15,74),(526,15,78),(527,15,79),(528,15,82),(529,15,67),(530,15,84),(531,15,85),(532,15,80),(533,15,86),(534,15,87),(535,15,90),(536,15,108),(537,15,72),(538,15,91),(539,15,92),(540,15,104),(541,15,62),(542,15,99),(543,15,105),(544,15,95),(545,15,96),(546,15,97),(547,15,98),(548,15,103),(549,15,106),(550,15,107),(676,56,60),(677,56,1),(678,56,52),(679,56,54),(680,56,53),(681,56,51),(682,56,58),(683,56,64),(684,56,66),(685,56,100),(686,56,101),(687,56,109),(688,56,57),(689,56,77),(690,56,74),(691,56,78),(692,56,79),(693,56,82),(694,56,67),(695,56,84),(696,56,85),(697,56,80),(698,56,86),(699,56,87),(700,56,90),(701,56,108),(702,56,110),(703,56,72),(704,56,91),(705,56,111),(706,56,92),(707,56,104),(708,56,112),(709,56,62),(710,56,99),(711,56,105),(712,56,95),(713,56,96),(714,56,97),(715,56,98),(716,56,103),(717,56,106),(718,56,107),(979,60,60),(980,60,1),(981,60,52),(982,60,54),(983,60,53),(984,60,51),(985,60,58),(986,60,64),(987,60,66),(988,60,100),(989,60,101),(990,60,109),(991,60,57),(992,60,77),(993,60,74),(994,60,78),(995,60,79),(996,60,82),(997,60,67),(998,60,84),(999,60,85),(1000,60,80),(1001,60,86),(1002,60,87),(1003,60,90),(1004,60,108),(1005,60,110),(1006,60,72),(1007,60,91),(1008,60,111),(1009,60,92),(1010,60,104),(1011,60,112),(1012,60,114),(1013,60,62),(1014,60,99),(1015,60,105),(1016,60,95),(1017,60,96),(1018,60,97),(1019,60,98),(1020,60,103),(1021,60,106),(1022,60,107),(1023,60,113),(1024,61,72),(1025,61,91),(1026,61,111),(1027,61,92),(1028,61,104),(1029,61,112),(1030,61,114),(1031,62,72),(1032,62,91),(1033,62,111),(1034,62,92),(1035,62,104),(1036,62,112),(1037,62,114),(1261,1,60),(1262,1,1),(1263,1,52),(1264,1,54),(1265,1,53),(1266,1,51),(1267,1,58),(1268,1,64),(1269,1,66),(1270,1,100),(1271,1,101),(1272,1,57),(1273,1,77),(1274,1,74),(1275,1,78),(1276,1,79),(1277,1,82),(1278,1,67),(1279,1,84),(1280,1,85),(1281,1,80),(1282,1,86),(1283,1,87),(1284,1,90),(1285,1,108),(1286,1,110),(1287,1,72),(1288,1,111),(1289,1,91),(1290,1,92),(1291,1,104),(1292,1,112),(1293,1,114),(1294,1,62),(1295,1,99),(1296,1,105),(1297,1,95),(1298,1,96),(1299,1,97),(1300,1,98),(1301,1,103),(1302,1,106),(1303,1,107),(1304,1,113),(1305,1,115),(1306,1,116),(1307,17,60),(1308,17,1),(1309,17,52),(1310,17,54),(1311,17,53),(1312,17,51),(1313,17,58),(1314,17,64),(1315,17,66),(1316,17,100),(1317,17,101),(1318,17,109),(1319,17,57),(1320,17,77),(1321,17,74),(1322,17,78),(1323,17,79),(1324,17,82),(1325,17,67),(1326,17,84),(1327,17,85),(1328,17,80),(1329,17,86),(1330,17,87),(1331,17,90),(1332,17,108),(1333,17,110),(1334,17,72),(1335,17,91),(1336,17,111),(1337,17,92),(1338,17,104),(1339,17,112),(1340,17,114),(1341,17,62),(1342,17,99),(1343,17,105),(1344,17,95),(1345,17,96),(1346,17,97),(1347,17,98),(1348,17,103),(1349,17,106),(1350,17,107),(1351,17,113),(1352,17,115),(1353,17,116),(1447,59,60),(1448,59,1),(1449,59,52),(1450,59,54),(1451,59,53),(1452,59,51),(1453,59,58),(1454,59,64),(1455,59,66),(1456,59,100),(1457,59,101),(1458,59,109),(1459,59,57),(1460,59,77),(1461,59,74),(1462,59,78),(1463,59,79),(1464,59,82),(1465,59,67),(1466,59,84),(1467,59,85),(1468,59,80),(1469,59,86),(1470,59,87),(1471,59,90),(1472,59,108),(1473,59,110),(1474,59,72),(1475,59,91),(1476,59,111),(1477,59,92),(1478,59,104),(1479,59,112),(1480,59,114),(1481,59,62),(1482,59,99),(1483,59,105),(1484,59,95),(1485,59,96),(1486,59,97),(1487,59,98),(1488,59,103),(1489,59,106),(1490,59,107),(1491,59,113),(1492,59,115),(1493,59,116);
/*!40000 ALTER TABLE `user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dev_brm'
--

--
-- Dumping routines for database 'dev_brm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-23 10:30:45
