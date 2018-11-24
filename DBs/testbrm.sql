-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: testbrm
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
-- Table structure for table `Regular_doctors`
--

DROP TABLE IF EXISTS `Regular_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regular_doctors` (
  `rdoctor_id` int(2) NOT NULL AUTO_INCREMENT,
  `rdoctor_name` varchar(30) DEFAULT NULL,
  `rdoctor_phone` varchar(12) DEFAULT NULL,
  `rdoctor_email` varchar(80) DEFAULT NULL,
  `rcreated_date` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`rdoctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regular_doctors`
--

LOCK TABLES `Regular_doctors` WRITE;
/*!40000 ALTER TABLE `Regular_doctors` DISABLE KEYS */;
INSERT INTO `Regular_doctors` VALUES (1,'ramarao','9563215896','ramarao@gmail.com','2011-02-12'),(2,'seetaram','9563215885','seeta@gmail.com','2011-02-12'),(3,'usha','9563214585','usha@gmail.com','2011-02-12');
/*!40000 ALTER TABLE `Regular_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anesthesia_doctors`
--

DROP TABLE IF EXISTS `anesthesia_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anesthesia_doctors` (
  `adoctor_id` int(2) NOT NULL AUTO_INCREMENT,
  `adoctor_name` varchar(30) DEFAULT NULL,
  `adoctor_phone` varchar(12) DEFAULT NULL,
  `adoctor_email` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`adoctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anesthesia_doctors`
--

LOCK TABLES `anesthesia_doctors` WRITE;
/*!40000 ALTER TABLE `anesthesia_doctors` DISABLE KEYS */;
INSERT INTO `anesthesia_doctors` VALUES (1,'syam','7845123696','syam@gmail.com','2011-02-12 00:00:00'),(2,'sundar','7412589635','sundar@gmail.com','2011-02-12 00:00:00'),(3,'srikanth','7412589678','srikanth@gmail.com','2011-02-12 00:00:00');
/*!40000 ALTER TABLE `anesthesia_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regular_patients`
--

DROP TABLE IF EXISTS `regular_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regular_patients` (
  `rpatient_id` int(2) NOT NULL AUTO_INCREMENT,
  `rpatient_name` varchar(30) DEFAULT NULL,
  `rpatient_phone` varchar(12) DEFAULT NULL,
  `rpatient_doctor_id` int(11) DEFAULT NULL,
  `rpatient_fee` int(10) DEFAULT NULL,
  `rpatient_fee_paid` tinyint(1) DEFAULT '0',
  `entered_on` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rpatient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regular_patients`
--

LOCK TABLES `regular_patients` WRITE;
/*!40000 ALTER TABLE `regular_patients` DISABLE KEYS */;
INSERT INTO `regular_patients` VALUES (1,'samuel','7894152236',1,200,1,'2018-03-26 18:05:14'),(2,'harini','7412589635',3,300,0,'2018-03-26 18:07:42');
/*!40000 ALTER TABLE `regular_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `special_patient_info`
--

DROP TABLE IF EXISTS `special_patient_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_patient_info` (
  `patient_id` int(2) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(20) DEFAULT NULL,
  `diag_type` int(1) DEFAULT NULL,
  `days` varchar(2) DEFAULT NULL,
  `admission_on` varchar(10) DEFAULT NULL,
  `discharge_on` varchar(10) DEFAULT NULL,
  `tot_package` varchar(10) DEFAULT NULL,
  `advance_amount` varchar(10) DEFAULT NULL,
  `received_amount` varchar(10) DEFAULT NULL,
  `doctor_id` int(2) DEFAULT NULL,
  `doc_fee` varchar(10) DEFAULT NULL,
  `doc_fee_paid` int(1) DEFAULT NULL,
  `surg_doctor_id` int(2) DEFAULT NULL,
  `surg_fee` varchar(10) DEFAULT NULL,
  `surg_fee_paid` int(1) DEFAULT NULL,
  `anst_doctor_id` int(2) DEFAULT NULL,
  `anst_fee` varchar(10) DEFAULT NULL,
  `anst_fee_paid` int(1) DEFAULT NULL,
  `pmp_name` varchar(20) DEFAULT NULL,
  `pmp_amount` varchar(10) DEFAULT NULL,
  `pmp_fee_paid` int(1) DEFAULT NULL,
  `pro_name` varchar(20) DEFAULT NULL,
  `pro_amount` varchar(10) DEFAULT NULL,
  `pro_fee_paid` int(1) DEFAULT NULL,
  `otmedicne_amount` varchar(10) DEFAULT NULL,
  `genmedicne_amount` varchar(10) DEFAULT NULL,
  `labcharge` varchar(10) DEFAULT NULL,
  `othercharge` varchar(10) DEFAULT NULL,
  `visiting_doctor_id` int(2) DEFAULT NULL,
  `entered_on` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `special_patient_info`
--

LOCK TABLES `special_patient_info` WRITE;
/*!40000 ALTER TABLE `special_patient_info` DISABLE KEYS */;
INSERT INTO `special_patient_info` VALUES (1,'apparao',1,'5','2018-02-10','2018-02-16','20000','2000','8000',1,'2000',1,5000,'4',1,4,'3000',1,'','',0,'','',0,'2000','1000','500','200',3,'2018-03-27'),(2,'apparao',1,'5','2018-02-10','2018-02-16','20000','2000','8000',1,'2000',1,5000,'4',1,4,'3000',1,'','',0,'','',0,'2000','1000','500','200',3,'2018-03-28'),(3,'apparao',1,'5','2018-02-10','2018-02-16','20000','2000','8000',1,'2000',1,5000,'4',1,4,'3000',1,'','',0,'','',0,'2000','1000','500','200',3,'2018-03-28');
/*!40000 ALTER TABLE `special_patient_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surgery_doctors`
--

DROP TABLE IF EXISTS `surgery_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surgery_doctors` (
  `sdoctor_id` int(2) NOT NULL AUTO_INCREMENT,
  `sdoctor_name` varchar(30) DEFAULT NULL,
  `sdoctor_phone` varchar(12) DEFAULT NULL,
  `sdoctor_email` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sdoctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgery_doctors`
--

LOCK TABLES `surgery_doctors` WRITE;
/*!40000 ALTER TABLE `surgery_doctors` DISABLE KEYS */;
INSERT INTO `surgery_doctors` VALUES (1,'suresh','741258963','suresh@gmail.com','2011-02-12 12:36:12'),(2,'prasad','741258978','prasad@gmail.com','2011-02-10 12:36:12'),(3,'chalam','8596741258','chalam@gmail.com','2011-02-08 12:36:13');
/*!40000 ALTER TABLE `surgery_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtb`
--

DROP TABLE IF EXISTS `testtb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testtb` (
  `sno` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtb`
--

LOCK TABLES `testtb` WRITE;
/*!40000 ALTER TABLE `testtb` DISABLE KEYS */;
INSERT INTO `testtb` VALUES (1,'sachin'),(2,'dravid');
/*!40000 ALTER TABLE `testtb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testbrm'
--

--
-- Dumping routines for database 'testbrm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-23 10:38:47
