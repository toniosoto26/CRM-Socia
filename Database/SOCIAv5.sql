-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: socia
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `company_division`
--

DROP TABLE IF EXISTS `company_division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_division` (
  `company_division_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`company_division_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_division`
--

LOCK TABLES `company_division` WRITE;
/*!40000 ALTER TABLE `company_division` DISABLE KEYS */;
INSERT INTO `company_division` VALUES (1,'Sistemas'),(2,'Cuentas por pagar'),(3,'Compras');
/*!40000 ALTER TABLE `company_division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_address`
--

DROP TABLE IF EXISTS `crm_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_address` (
  `crm_address_id` int(11) NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `ext_num` varchar(45) DEFAULT NULL,
  `int_num` varchar(45) DEFAULT NULL,
  `suburb` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_address`
--

LOCK TABLES `crm_address` WRITE;
/*!40000 ALTER TABLE `crm_address` DISABLE KEYS */;
INSERT INTO `crm_address` VALUES (1,'Calle 21','101','102','San Pedro de los Pinos','Benito Juarez','Ciudad de México','México',3800,'A'),(2,'Calle 23','103','104','San Pedro de los Pinos','Benito Juarez','Ciudad de México','México',3800,'A');
/*!40000 ALTER TABLE `crm_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_appointment`
--

DROP TABLE IF EXISTS `crm_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_appointment` (
  `crm_appointment_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `crm_client_id` int(11) NOT NULL,
  `crm_user_id` int(11) NOT NULL,
  `crm_contact_id` int(11) NOT NULL,
  `crm_bdm_id` int(11) NOT NULL,
  PRIMARY KEY (`crm_appointment_id`),
  KEY `fk_crm_appointments_crm_client1_idx` (`crm_client_id`),
  KEY `fk_crm_appointments_crm_users1_idx` (`crm_user_id`),
  KEY `fk_crm_appointments_crm_contact1_idx` (`crm_contact_id`),
  KEY `fk_crm_appointment_crm_user1_idx` (`crm_bdm_id`),
  CONSTRAINT `fk_crm_appointment_crm_user1` FOREIGN KEY (`crm_bdm_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_appointments_crm_client1` FOREIGN KEY (`crm_client_id`) REFERENCES `crm_client` (`crm_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_appointments_crm_contact1` FOREIGN KEY (`crm_contact_id`) REFERENCES `crm_contact` (`crm_contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_appointments_crm_users1` FOREIGN KEY (`crm_user_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_appointment`
--

LOCK TABLES `crm_appointment` WRITE;
/*!40000 ALTER TABLE `crm_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_brand`
--

DROP TABLE IF EXISTS `crm_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_brand` (
  `crm_brand_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_brand`
--

LOCK TABLES `crm_brand` WRITE;
/*!40000 ALTER TABLE `crm_brand` DISABLE KEYS */;
INSERT INTO `crm_brand` VALUES (1,'HP');
/*!40000 ALTER TABLE `crm_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_business_line`
--

DROP TABLE IF EXISTS `crm_business_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_business_line` (
  `crm_business_line_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_business_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_business_line`
--

LOCK TABLES `crm_business_line` WRITE;
/*!40000 ALTER TABLE `crm_business_line` DISABLE KEYS */;
INSERT INTO `crm_business_line` VALUES (1,'Servidores');
/*!40000 ALTER TABLE `crm_business_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_call`
--

DROP TABLE IF EXISTS `crm_call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_call` (
  `crm_call_id` int(11) NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `crm_client_id` int(11) NOT NULL,
  `crm_user_id` int(11) NOT NULL,
  `crm_contact_id` int(11) NOT NULL,
  PRIMARY KEY (`crm_call_id`),
  KEY `fk_crm_call_crm_client1_idx` (`crm_client_id`),
  KEY `fk_crm_call_crm_users1_idx` (`crm_user_id`),
  KEY `fk_crm_call_crm_contact1_idx` (`crm_contact_id`),
  CONSTRAINT `fk_crm_call_crm_client1` FOREIGN KEY (`crm_client_id`) REFERENCES `crm_client` (`crm_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_call_crm_contact1` FOREIGN KEY (`crm_contact_id`) REFERENCES `crm_contact` (`crm_contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_call_crm_users1` FOREIGN KEY (`crm_user_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_call`
--

LOCK TABLES `crm_call` WRITE;
/*!40000 ALTER TABLE `crm_call` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_client`
--

DROP TABLE IF EXISTS `crm_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_client` (
  `crm_client_id` int(11) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `crm_bdm_id` int(11) NOT NULL,
  PRIMARY KEY (`crm_client_id`),
  KEY `fk_crm_client_crm_users1_idx` (`crm_bdm_id`),
  CONSTRAINT `fk_crm_client_crm_users1` FOREIGN KEY (`crm_bdm_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_client`
--

LOCK TABLES `crm_client` WRITE;
/*!40000 ALTER TABLE `crm_client` DISABLE KEYS */;
INSERT INTO `crm_client` VALUES (1,'PRUEBA SA de CV','A',1);
/*!40000 ALTER TABLE `crm_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_client_consecutives`
--

DROP TABLE IF EXISTS `crm_client_consecutives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_client_consecutives` (
  `crm_client_id` int(11) NOT NULL,
  `table` varchar(45) DEFAULT NULL,
  `consecutive` int(11) DEFAULT NULL,
  PRIMARY KEY (`crm_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_client_consecutives`
--

LOCK TABLES `crm_client_consecutives` WRITE;
/*!40000 ALTER TABLE `crm_client_consecutives` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_client_consecutives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_consecutives`
--

DROP TABLE IF EXISTS `crm_consecutives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_consecutives` (
  `concept` varchar(45) NOT NULL,
  `consecutive` int(11) NOT NULL,
  PRIMARY KEY (`concept`,`consecutive`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_consecutives`
--

LOCK TABLES `crm_consecutives` WRITE;
/*!40000 ALTER TABLE `crm_consecutives` DISABLE KEYS */;
INSERT INTO `crm_consecutives` VALUES ('clients',2),('quotations',2);
/*!40000 ALTER TABLE `crm_consecutives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_contact`
--

DROP TABLE IF EXISTS `crm_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_contact` (
  `crm_contact_id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_contact`
--

LOCK TABLES `crm_contact` WRITE;
/*!40000 ALTER TABLE `crm_contact` DISABLE KEYS */;
INSERT INTO `crm_contact` VALUES (1,'Ana','Bobana','12345678','ana@company.com','A'),(2,'Pepe','Pecas','87654321','pepe@company.com','A'),(3,'Lalo','Landa','75930248','lalo@company.com','A');
/*!40000 ALTER TABLE `crm_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_directory`
--

DROP TABLE IF EXISTS `crm_directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_directory` (
  `crm_directory_id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `cell_phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `comments` varchar(45) DEFAULT NULL,
  `company_division_id` int(11) NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `crm_client_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_directory_id`),
  KEY `fk_crm_directory_company_division1_idx` (`company_division_id`),
  KEY `fk_crm_directory_crm_client1_idx` (`crm_client_id`),
  CONSTRAINT `fk_crm_directory_company_division1` FOREIGN KEY (`company_division_id`) REFERENCES `company_division` (`company_division_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_directory_crm_client1` FOREIGN KEY (`crm_client_id`) REFERENCES `crm_client` (`crm_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_directory`
--

LOCK TABLES `crm_directory` WRITE;
/*!40000 ALTER TABLE `crm_directory` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_goal`
--

DROP TABLE IF EXISTS `crm_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_goal` (
  `crm_goal_id` int(11) NOT NULL,
  `calls` int(11) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `quotations` int(11) DEFAULT NULL,
  `calls_scope` decimal(12,2) DEFAULT NULL,
  `appointments_scope` decimal(12,2) DEFAULT NULL,
  `quotations_scope` decimal(12,2) DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `crm_client_id` int(11) NOT NULL,
  PRIMARY KEY (`crm_goal_id`),
  KEY `fk_crm_goal_crm_client1_idx` (`crm_client_id`),
  CONSTRAINT `fk_crm_goal_crm_client1` FOREIGN KEY (`crm_client_id`) REFERENCES `crm_client` (`crm_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_goal`
--

LOCK TABLES `crm_goal` WRITE;
/*!40000 ALTER TABLE `crm_goal` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_item`
--

DROP TABLE IF EXISTS `crm_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_item` (
  `crm_item_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `crm_brand_id` int(11) NOT NULL,
  `crm_business_line_id` int(11) NOT NULL,
  PRIMARY KEY (`crm_item_id`),
  KEY `fk_crm_item_crm_brand1_idx` (`crm_brand_id`),
  KEY `fk_crm_item_crm_business_line1_idx` (`crm_business_line_id`),
  CONSTRAINT `fk_crm_item_crm_brand1` FOREIGN KEY (`crm_brand_id`) REFERENCES `crm_brand` (`crm_brand_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_item_crm_business_line1` FOREIGN KEY (`crm_business_line_id`) REFERENCES `crm_business_line` (`crm_business_line_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_item`
--

LOCK TABLES `crm_item` WRITE;
/*!40000 ALTER TABLE `crm_item` DISABLE KEYS */;
INSERT INTO `crm_item` VALUES (1,'Servidor','Servidor',1,1);
/*!40000 ALTER TABLE `crm_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_mvs_address`
--

DROP TABLE IF EXISTS `crm_mvs_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_mvs_address` (
  `crm_client_id` int(11) NOT NULL,
  `crm_address_id` int(11) NOT NULL,
  KEY `fk_crm_mvs_address_crm_client1_idx` (`crm_client_id`),
  KEY `fk_crm_mvs_address_crm_address1_idx` (`crm_address_id`),
  CONSTRAINT `fk_crm_mvs_address_crm_address1` FOREIGN KEY (`crm_address_id`) REFERENCES `crm_address` (`crm_address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_mvs_address_crm_client1` FOREIGN KEY (`crm_client_id`) REFERENCES `crm_client` (`crm_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_mvs_address`
--

LOCK TABLES `crm_mvs_address` WRITE;
/*!40000 ALTER TABLE `crm_mvs_address` DISABLE KEYS */;
INSERT INTO `crm_mvs_address` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `crm_mvs_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_mvs_contact`
--

DROP TABLE IF EXISTS `crm_mvs_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_mvs_contact` (
  `crm_client_id` int(11) NOT NULL,
  `crm_contact_id` int(11) NOT NULL,
  KEY `fk_crm_mvs_contact_crm_client1_idx` (`crm_client_id`),
  KEY `fk_crm_mvs_contact_crm_contact1_idx` (`crm_contact_id`),
  CONSTRAINT `fk_crm_mvs_contact_crm_client1` FOREIGN KEY (`crm_client_id`) REFERENCES `crm_client` (`crm_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_mvs_contact_crm_contact1` FOREIGN KEY (`crm_contact_id`) REFERENCES `crm_contact` (`crm_contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_mvs_contact`
--

LOCK TABLES `crm_mvs_contact` WRITE;
/*!40000 ALTER TABLE `crm_mvs_contact` DISABLE KEYS */;
INSERT INTO `crm_mvs_contact` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `crm_mvs_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_mvs_user`
--

DROP TABLE IF EXISTS `crm_mvs_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_mvs_user` (
  `crm_user_id` int(11) NOT NULL,
  `crm_user_role_id` int(11) NOT NULL,
  KEY `fk_crm_mvs_users_crm_users1_idx` (`crm_user_id`),
  KEY `fk_crm_mvs_users_crm_user_role1_idx` (`crm_user_role_id`),
  CONSTRAINT `fk_crm_mvs_users_crm_user_role1` FOREIGN KEY (`crm_user_role_id`) REFERENCES `crm_user_role` (`crm_user_role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_mvs_users_crm_users1` FOREIGN KEY (`crm_user_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_mvs_user`
--

LOCK TABLES `crm_mvs_user` WRITE;
/*!40000 ALTER TABLE `crm_mvs_user` DISABLE KEYS */;
INSERT INTO `crm_mvs_user` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `crm_mvs_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_quotation`
--

DROP TABLE IF EXISTS `crm_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_quotation` (
  `crm_quotation_id` int(11) NOT NULL,
  `crm_address_id` int(11) NOT NULL,
  `crm_contact_id` int(11) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `exchange_rate` decimal(12,2) DEFAULT NULL,
  `crm_user_id` int(11) NOT NULL,
  PRIMARY KEY (`crm_quotation_id`),
  KEY `fk_crm_quotation_crm_users1_idx` (`crm_user_id`),
  KEY `fk_crm_quotation_crm_address1_idx` (`crm_address_id`),
  KEY `fk_crm_quotation_crm_contact1_idx` (`crm_contact_id`),
  CONSTRAINT `fk_crm_quotation_crm_address1` FOREIGN KEY (`crm_address_id`) REFERENCES `crm_address` (`crm_address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_quotation_crm_contact1` FOREIGN KEY (`crm_contact_id`) REFERENCES `crm_contact` (`crm_contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_quotation_crm_users1` FOREIGN KEY (`crm_user_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_quotation`
--

LOCK TABLES `crm_quotation` WRITE;
/*!40000 ALTER TABLE `crm_quotation` DISABLE KEYS */;
INSERT INTO `crm_quotation` VALUES (1,2,1,'MXN',0.00,1);
/*!40000 ALTER TABLE `crm_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_quotation_detail`
--

DROP TABLE IF EXISTS `crm_quotation_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_quotation_detail` (
  `crm_quotation_id` int(11) NOT NULL,
  `crm_item_id` int(11) NOT NULL,
  `warranty` varchar(45) DEFAULT NULL,
  `unit_price` decimal(12,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `estimatedShipping` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_quotation_id`,`crm_item_id`),
  KEY `fk_crm_quotation_detail_crm_item1_idx` (`crm_item_id`),
  CONSTRAINT `fk_crm_quotation_detail_crm_item1` FOREIGN KEY (`crm_item_id`) REFERENCES `crm_item` (`crm_item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_quotation_detail_crm_quotation_id1` FOREIGN KEY (`crm_quotation_id`) REFERENCES `crm_quotation` (`crm_quotation_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_quotation_detail`
--

LOCK TABLES `crm_quotation_detail` WRITE;
/*!40000 ALTER TABLE `crm_quotation_detail` DISABLE KEYS */;
INSERT INTO `crm_quotation_detail` VALUES (1,1,'1',1.00,1,'1');
/*!40000 ALTER TABLE `crm_quotation_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_registration_requirement`
--

DROP TABLE IF EXISTS `crm_registration_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_registration_requirement` (
  `crm_registration_requirement_id` int(11) NOT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `crm_client_id` int(11) NOT NULL,
  PRIMARY KEY (`crm_registration_requirement_id`),
  KEY `fk_registration_requirement_crm_client1_idx` (`crm_client_id`),
  CONSTRAINT `fk_registration_requirement_crm_client1` FOREIGN KEY (`crm_client_id`) REFERENCES `crm_client` (`crm_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_registration_requirement`
--

LOCK TABLES `crm_registration_requirement` WRITE;
/*!40000 ALTER TABLE `crm_registration_requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_registration_requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_tender`
--

DROP TABLE IF EXISTS `crm_tender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_tender` (
  `crm_tender_id` int(11) NOT NULL,
  `start_up_date` datetime DEFAULT NULL,
  `deadline` datetime DEFAULT NULL,
  `requirements` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `crm_client_id` int(11) NOT NULL,
  `crm_user_id` int(11) NOT NULL,
  `crm_business_line_id` int(11) NOT NULL,
  `crm_directory_decision_maker` int(11) NOT NULL,
  PRIMARY KEY (`crm_tender_id`),
  KEY `fk_crm_tender_crm_client1_idx` (`crm_client_id`),
  KEY `fk_crm_tender_crm_user1_idx` (`crm_user_id`),
  KEY `fk_crm_tender_crm_business_line1_idx` (`crm_business_line_id`),
  KEY `fk_crm_tender_crm_directory1_idx` (`crm_directory_decision_maker`),
  CONSTRAINT `fk_crm_tender_crm_business_line1` FOREIGN KEY (`crm_business_line_id`) REFERENCES `crm_business_line` (`crm_business_line_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_tender_crm_client1` FOREIGN KEY (`crm_client_id`) REFERENCES `crm_client` (`crm_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_tender_crm_directory1` FOREIGN KEY (`crm_directory_decision_maker`) REFERENCES `crm_directory` (`crm_directory_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_tender_crm_user1` FOREIGN KEY (`crm_user_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_tender`
--

LOCK TABLES `crm_tender` WRITE;
/*!40000 ALTER TABLE `crm_tender` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_tender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_user`
--

DROP TABLE IF EXISTS `crm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_user` (
  `crm_user_id` int(11) NOT NULL,
  `user` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_user`
--

LOCK TABLES `crm_user` WRITE;
/*!40000 ALTER TABLE `crm_user` DISABLE KEYS */;
INSERT INTO `crm_user` VALUES (1,'admin','1234','Administrador','Socia','admin@socia.com.mx','2016-10-04 00:00:00',NULL),(2,'ejecutivo','1234','Ejecutivo','Socia','ejecutivo@socia.com.mx','2016-10-04 00:00:00',NULL);
/*!40000 ALTER TABLE `crm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_user_role`
--

DROP TABLE IF EXISTS `crm_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_user_role` (
  `crm_user_role_id` int(11) NOT NULL,
  `roleDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_user_role`
--

LOCK TABLES `crm_user_role` WRITE;
/*!40000 ALTER TABLE `crm_user_role` DISABLE KEYS */;
INSERT INTO `crm_user_role` VALUES (1,'BDM'),(2,'Ejecutivo');
/*!40000 ALTER TABLE `crm_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-17 22:58:36
