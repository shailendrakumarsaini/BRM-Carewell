-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: lunia
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
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) DEFAULT NULL,
  `block_name` varchar(512) NOT NULL,
  `block_status` int(11) DEFAULT '1',
  `block_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`block_id`),
  KEY `block_id` (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES (1,1,'8M-1',1,'8M-1'),(2,2,'B-1',1,'B-1');
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(30) DEFAULT NULL,
  `company_address` varchar(100) DEFAULT NULL,
  `company_city` varchar(30) DEFAULT NULL,
  `company_mobile` bigint(20) DEFAULT NULL,
  `company_gst` varchar(30) DEFAULT NULL,
  `company_status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Lunia Marketing Pvt Ltd','Bara Bazar , Near Cherra Bus Stand','kakinada',3642544370,'',1),(2,'Lunia Enterprise','Bara Bazar','west bengal',3642544275,'',1),(3,'Anuvrat Food Products LLP','Near Cheera','Shillong',3642544275,'',1),(4,'Kiran Enterprise pvt ltd','Near Cherra Bus Stand','kakinada1',9573161242,'',1),(5,'ravi logistics','Near College Bus Stand','rajmundry',9823133231,'',1),(6,'Ragu logistics','Near lal Street','kakinada',8943423434,'',1),(7,'Ragu Enterprise Pvt Ltd','10-1323,Near Cherra','banglore',8787657675,'',1),(8,'bhanu pvt','123-22','kakinada',89434244,'T124994ewoe',1),(9,'kiranEnterprise','12-123/A','kakinada',8943432423,'TG123123RWER',1),(10,'Ravi Enterprise Pvt Ltd','11-23/A','Rajmundry',9874234423,'TG12321313TRDR1',1);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(30) DEFAULT NULL,
  `customer_address` varchar(100) DEFAULT NULL,
  `customer_city` varchar(30) DEFAULT NULL,
  `customer_mobile` bigint(20) DEFAULT NULL,
  `customer_gst` varchar(30) DEFAULT NULL,
  `customer_status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Laxmi Bhandar','Near Main road','Agartala',9684224242,'CKJAAA32133JADA',1),(2,'New Laxmi Bhandar','Near Laxmi Street','Agartala',9894842141,'UFSFS344SFSFS43',1),(3,'Promod Ranjan shah','Near Cherra Street','Agartala',8942344424,'UFFJ2121KKJB532',1),(4,'Arup Bhandar','Cherra Bus stop','Barpeta',8932442347,'CD21231FSDFJD32',1),(5,'Maran Chandra Das','Near Barpeta Bus stop','Barpeta',9523443343,'U123FSDS3434FSD',1),(6,'Nirmal Kumar Shah','Near Main Road','Dhubri',8344490444,'U523SFSF23323DG',1),(7,'S.S.Enterprise','Near Lal Street','Dhubri',9334435343,'U53FSDFF3423GFF',1),(8,'Achumi Enterprise','Near Tilik Street','Dimapur',8943353124,'U4JWDAS121323FG',1),(9,'Balaji Store','Near Goalpara Bus Stop','Goalpara',9823478841,'U153HFS223HFSGD',1),(10,'Girija Traders','Near Bustand','Guwahati',8943423427,'USF13JFSF231239',1),(11,'Jyothi Enterprise','Main Road','Guwahati',8325234228,'U1532FJSF424DFJ',1),(12,'Kamrup Trade and Agency','Near cherra Bus Stand','Guwahati',8931332178,'U53FJF443FSFFSF',1),(13,'Sri Mahalaxmi Mill','Near Naga Street','Guwahati',8943424332,'UFSF342JFJS4112',1),(14,'Askaran Rakesh Kumar','Lal colony','Johrat',9943244387,'U12JS34JFSD9442',1),(15,'Likmichand lshwarlal','Near Main Road','Johrat',8943898334,'U55LFS434232JDG',1),(16,'Vivek Kumar Singh','Bus Stop','Shillong',8934324423,'UFSJF12JFS23KFS',1),(17,'Ratan Chandra Shah','cherra Street','Shillong',9676865756,'U145FSF23FDFSD4',1),(18,'Mahadev Bhandar','Lal street','Shillong',9532432803,'U25LFL2313JFLSD',1),(19,'Puja Agency','Near Bus Stop','Nagaon',9830242855,'U1232KKA434FDKS',1),(20,'Moolchand Manikchand','charra street','Shillong',8923447390,'U1234JHKHSF34FS',1),(21,'Narayanmal Bimal Kumar','Near Main Road','Shillong',9353523232,'U14WFDS233RJE34',1),(22,'Abhay Store','Near Bus stand','Shillong',9843243479,'U12JSJ324DSJ34D',1),(23,'B.K.Enterprise','Near Mohan Street','Shillong',9532282300,'U12JDD23JFLS23F',1),(24,'C.B.Syiem','Near Nirmal School Stop','Shillong',9873652382,'U12KJ3DKS43JJ2J',1),(25,'Sitily Khonji','Near Gandhi Street','Shillong',9342920852,'U15JKD233JJF43G',1),(26,'Abdul Rakib and Sons','Near Gandhi School','Silchar',8983133794,'U1233DF21382JK2',1),(27,'M.M.Enterprise','Near Main Road','Silchar',8973432691,'U12HAE122DSJK12',1),(28,'Dipesh Sugar Pvt. Ltd.','Near Gandhi Nagar Street','Calcutta',8994320844,'U13KHDAS23KHKF3',1),(29,'Uma Shankar Jhawar','Near College Road','Tihu',8944489414,'U12KK32KJ33LD33',1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispatch`
--

DROP TABLE IF EXISTS `dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispatch` (
  `dispatch_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_order_id` int(11) DEFAULT NULL,
  `d_item_id` int(11) DEFAULT NULL,
  `order_quantity` int(11) DEFAULT NULL,
  `dispatch_quantity` int(11) DEFAULT NULL,
  `d_warehouse_id` int(11) DEFAULT NULL,
  `d_block_id` int(11) DEFAULT NULL,
  `transport_details` varchar(50) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`dispatch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispatch`
--

LOCK TABLES `dispatch` WRITE;
/*!40000 ALTER TABLE `dispatch` DISABLE KEYS */;
INSERT INTO `dispatch` VALUES (4,1,7,100,100,1,1,'AP25X2526','2018-04-07 12:39:48'),(5,1,8,100,100,1,1,'AP25X2526','2018-04-07 12:39:48'),(6,2,7,12,12,1,1,'AP5EL 5893','2018-04-07 15:48:44'),(7,3,8,100,100,1,1,'test','2018-04-07 16:48:51'),(8,7,7,100,100,1,1,'test','2018-04-07 19:50:18'),(9,18,10,123,123,2,2,'AP05 8989','2018-04-16 12:59:56');
/*!40000 ALTER TABLE `dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(30) DEFAULT NULL,
  `item_units` varchar(30) DEFAULT NULL,
  `item_quantity` double(16,0) DEFAULT NULL,
  `item_status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (7,'ANDHRA 50 KG','KGS',50,1),(8,'BPT 25KG','KGS',25,1),(10,'Andhra Rice 50 kgs','kg',50,1),(11,'Andhra Rice 100 kgs','kg',100,1),(12,'b.p.t rice 25 KGs','kgs',25,1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Masters',1,'fa fa-th-list','Users',1,'team.png','#users','/users','users.html','users_ctrl',1,0),(60,'Dashboard',0,'fa fa-th-list','Dashboard',1,'fa fa-angle-right','#dashboard','/dashboard','dashboard.html','dashboard_ctrl',3,1),(97,'Masters',1,'fa fa-th-list','Company',2,'bussiness.png','#company','/company','company.html','company_ctrl',8,0),(105,'Masters',1,'fa fa-th-list','Warehouse',3,'003-warehouse-3.png','#warehouse','/warehouse','warehouse.html','warehouse_ctrl',8,0),(106,'Masters',1,'fa fa-th-list','Items',5,'007-cart.png','#items','/items','items.html','items_ctrl',8,0),(110,'Masters',1,'fa fa-th-list','Blocks',4,'001-blocks.png','#blocks','/blocks','blocks.html','blocks_ctrl',8,0),(111,'Masters',1,'fa fa-th-list','Customers',6,'010-people.png','#customers','/customers','customers.html','customers_ctrl',8,0),(112,'Masters',1,'fa fa-th-list','Price List',7,'005-price-tag-2.png','#itemprice','/itemprice','itemprice.html','itemprice_ctrl',8,0),(113,'Masters',1,'fa fa-th-list','Orders',8,'015-calculator.png','#orders','/orders','orders.html','orders_ctrl',8,0),(114,'Masters',1,'fa fa-th-list','Stock',9,'016-warehouse.png','#stock','/stock','stock.html','stock_ctrl',8,0),(115,'Masters',1,'fa fa-th-list','Approvals',10,'004-approved.png','#ordersapproval','/ordersapproval','ordersapproval.html','ordersapproval_ctrl',8,0),(116,'Masters',1,'fa fa-th-list','Dispatches',11,'012-delivery-truck.png','#ordersdispatch','/ordersdispatch','ordersdispatch.html','ordersdispatch_ctrl',8,0),(121,'Masters',1,'fa fa-th-list','Practice1',13,'fa fa-angle-right','#practice1','/practice1','practice1.html','practice1_ctrl',8,0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `final_price` double DEFAULT NULL,
  `packets` int(11) DEFAULT NULL,
  `received_packets` int(11) DEFAULT '0',
  `quantity` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,7,3200,1,158400,100,100,50.00),(2,1,8,4000,2,98000,100,100,25.00),(3,2,7,3200,2,18816,12,12,6.00),(4,3,8,4000,1,99000,100,100,25.00),(9,7,7,3200,5,152000,100,100,50.00),(10,8,8,4000,4,118080,123,0,30.75),(11,9,8,4000,2,122500,125,0,31.25),(17,15,7,3200,1,158400,100,0,50.00),(20,17,10,1400,2,7546,11,0,5.50),(21,17,8,4000,1,11880,12,0,3.00),(22,18,10,1400,2,84378,123,123,61.50);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_remarks`
--

DROP TABLE IF EXISTS `order_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_remarks` (
  `o_r_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`o_r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_remarks`
--

LOCK TABLES `order_remarks` WRITE;
/*!40000 ALTER TABLE `order_remarks` DISABLE KEYS */;
INSERT INTO `order_remarks` VALUES (1,2,'Amount pending'),(2,4,'Amount Pending'),(3,5,'Insuffient fund'),(4,8,'insuffient fund');
/*!40000 ALTER TABLE `order_remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `order_status` tinyint(4) DEFAULT '0',
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,256400,'2018-04-07',3,1,19),(2,1,18816,'2018-04-07',3,9,19),(3,3,78000,'2018-04-07',3,11,19),(7,1,152000,'2018-04-07',3,3,19),(8,1,118080,'2018-04-07',2,12,19),(9,2,122500,'2018-04-07',1,11,19),(15,1,158400,'2018-04-09',1,1,19),(17,1,19426,'2018-04-10',0,9,19),(18,2,84378,'2018-04-16',3,13,19);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (7,3200,7),(8,4000,8),(9,1200,9),(10,1400,10),(11,2500,11),(12,1,12);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_backup`
--

DROP TABLE IF EXISTS `price_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_backup` (
  `price_b_id` int(11) NOT NULL AUTO_INCREMENT,
  `price_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`price_b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_backup`
--

LOCK TABLES `price_backup` WRITE;
/*!40000 ALTER TABLE `price_backup` DISABLE KEYS */;
INSERT INTO `price_backup` VALUES (1,1,1200,1,'2018-04-04'),(2,2,1400,1,'2018-04-04'),(3,3,1000,1,'2018-04-04'),(4,4,1200,1,'2018-04-04'),(5,5,1000,1,'2018-04-04'),(6,6,1650,19,'2018-04-05'),(7,7,3200,19,'2018-04-07'),(8,8,4000,19,'2018-04-07'),(9,9,1200,19,'2018-04-07'),(10,10,1400,19,'2018-04-07'),(11,11,2500,19,'2018-04-07'),(12,12,1,19,'2018-05-27');
/*!40000 ALTER TABLE `price_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `stock_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_id` int(11) DEFAULT NULL,
  `block_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (11,1,1,7,788),(12,1,1,8,300),(13,2,2,10,377),(14,2,2,11,800);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_track`
--

DROP TABLE IF EXISTS `stock_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_track` (
  `stock_tr_id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`stock_tr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_track`
--

LOCK TABLES `stock_track` WRITE;
/*!40000 ALTER TABLE `stock_track` DISABLE KEYS */;
INSERT INTO `stock_track` VALUES (11,11,19,'2018-04-07',1000),(12,12,19,'2018-04-07',500),(13,13,19,'2018-04-07',500),(14,14,19,'2018-04-07',800);
/*!40000 ALTER TABLE `stock_track` ENABLE KEYS */;
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
  `email` varchar(255) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `level_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `note` varchar(500) DEFAULT NULL,
  `is_deleted` varchar(1) DEFAULT 'N',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (19,'','Admin','admin','1234567890','Street','City',1,1,'1234','N','admin123'),(20,NULL,'Sales','sales','1234567890','sales','sales',2,1,'1','N','sales321'),(21,'','Dispatch','dispatch','1234567890','dis','dispatch',3,1,'','N','dispath123');
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hospital`
--

LOCK TABLES `user_hospital` WRITE;
/*!40000 ALTER TABLE `user_hospital` DISABLE KEYS */;
INSERT INTO `user_hospital` VALUES (57,10,1,0),(58,11,1,0),(59,11,2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_level`
--

LOCK TABLES `user_level` WRITE;
/*!40000 ALTER TABLE `user_level` DISABLE KEYS */;
INSERT INTO `user_level` VALUES (1,'ADM','Administrator'),(2,'STM','Sales Team'),(3,'DPCH','Dispatch Team');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu`
--

LOCK TABLES `user_menu` WRITE;
/*!40000 ALTER TABLE `user_menu` DISABLE KEYS */;
INSERT INTO `user_menu` VALUES (17,20,60),(18,20,113),(19,21,60),(20,21,116),(34,19,60),(35,19,1),(36,19,97),(37,19,105),(38,19,110),(39,19,106),(40,19,111),(41,19,112),(42,19,113),(43,19,114),(44,19,115),(45,19,116),(46,19,120),(47,19,121);
/*!40000 ALTER TABLE `user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_name` varchar(30) DEFAULT NULL,
  `warehouse_address` varchar(100) DEFAULT NULL,
  `warehouse_city` varchar(30) DEFAULT NULL,
  `warehouse_mobile` bigint(20) DEFAULT NULL,
  `warehouse_status` tinyint(4) DEFAULT '1',
  `warehouse_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'8 MILES','8 TH MILE','KHANAPARA',9248055575,1,'8M'),(2,'Raju logistics','10-12/A','kakinada',9786786868,1,'WH-2');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lunia'
--

--
-- Dumping routines for database 'lunia'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-23 10:35:17
