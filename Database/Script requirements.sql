-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: socia
-- ------------------------------------------------------
-- Server version	5.5.53

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
  `date_created` date DEFAULT NULL,
  `client_type` char(1) DEFAULT 'P',
  `crm_user_id` int(11) NOT NULL,
  `crm_bdm_id2` int(11) DEFAULT NULL,
  `rfc` varchar(15) DEFAULT NULL,
  `business_turn` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `ext_num` varchar(45) DEFAULT NULL,
  `int_num` varchar(45) DEFAULT NULL,
  `suburb` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `employees` int(11) DEFAULT NULL,
  `annual_sales` decimal(12,4) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_client_id`),
  KEY `fk_crm_client_crm_users1_idx` (`crm_bdm_id`),
  KEY `fk_crm_client_crm_users2_idx` (`crm_user_id`),
  KEY `fk_crm_user_id_crmusers2_idx` (`crm_user_id`),
  CONSTRAINT `fk_crm_client_crm_users1` FOREIGN KEY (`crm_bdm_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_client_crm_users2` FOREIGN KEY (`crm_user_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_user_id_crm_users2` FOREIGN KEY (`crm_user_id`) REFERENCES `crm_user` (`crm_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_client`
--

LOCK TABLES `crm_client` WRITE;
/*!40000 ALTER TABLE `crm_client` DISABLE KEYS */;
INSERT INTO `crm_client` VALUES (1,'PRUEBA S.A. DE C.V.','A',1,NULL,'P',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'PRUEBA 2 S.A. DE C.V.','A',1,NULL,'P',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'OTRO S.A. DE C.V.','A',1,NULL,'A',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'Unix S.A.','A',1,NULL,'A',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'SERPAPROSA','A',1,NULL,'A',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'Bimbo S.A. de C.V.','A',1,NULL,'P',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `crm_client` ENABLE KEYS */;
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
  `cellphone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `id_position` int(11) DEFAULT NULL,
  `company_division_id` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`crm_contact_id`),
  KEY `fk_id_position_idx` (`id_position`),
  KEY `fk_company_division_id_idx` (`company_division_id`),
  CONSTRAINT `fk_company_division_id` FOREIGN KEY (`company_division_id`) REFERENCES `crm_company_division` (`company_division_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_position` FOREIGN KEY (`id_position`) REFERENCES `crm_position` (`id_position`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_contact`
--

LOCK TABLES `crm_contact` WRITE;
/*!40000 ALTER TABLE `crm_contact` DISABLE KEYS */;
INSERT INTO `crm_contact` VALUES (1,'Ana','Bobana','12345678',NULL,'ana@company.com','A',NULL,5,1,NULL),(2,'Pepe','Pecas','87654321',NULL,'pepe@company.com','A',NULL,3,3,NULL),(3,'Lalo','Landa','75930248',NULL,'lalo@company.com','A',NULL,2,4,NULL),(6,'Bruno D¡az','lastName','12345678',NULL,'bruno@socia.com.mx','A',NULL,1,2,NULL),(7,'Bruno D¡az','lastName','12345678',NULL,'bruno@socia.com.mx','A',NULL,6,1,NULL),(8,'Jos‚','Ramos','56785678',NULL,'jose.ramos@test.com','A','2016-11-29',1,2,NULL),(11,'Ricardo','Madrazo','56273000',NULL,'ricardo.madrazod@panamericano.com','A','2017-01-09',1,3,NULL),(14,'Rosa','Mendiola','55657690ext.9700',NULL,'rosa.mendiola@bimbo.com','A','2017-01-16',2,1,NULL);
/*!40000 ALTER TABLE `crm_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_reg_req`
--

DROP TABLE IF EXISTS `crm_reg_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_reg_req` (
  `client_id` int(11) NOT NULL,
  `id_requirement` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `load_date` date DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_id`,`id_requirement`),
  KEY `fk_reg_req_idx` (`id_user`),
  KEY `fk_requirement_2_idx` (`id_requirement`),
  CONSTRAINT `fk_requirement_2` FOREIGN KEY (`id_requirement`) REFERENCES `crm_requirement` (`id_requeriment`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_reg_req`
--

LOCK TABLES `crm_reg_req` WRITE;
/*!40000 ALTER TABLE `crm_reg_req` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_reg_req` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_requirement`
--

DROP TABLE IF EXISTS `crm_requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_requirement` (
  `id_requeriment` int(11) NOT NULL,
  `requirement` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_requeriment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_requirement`
--

LOCK TABLES `crm_requirement` WRITE;
/*!40000 ALTER TABLE `crm_requirement` DISABLE KEYS */;
INSERT INTO `crm_requirement` VALUES (1,'Acta constitutiva'),(2,'RFC'),(3,'R1'),(4,'COMPROBANTE DE DOMICILIO'),(5,'ESTADOS FINANCIEROS'),(6,'FORMATO ESPECIAL'),(7,'ID REPRESENTANTE LEGAL'),(8,'CARATULA CUENTA BANCO');
/*!40000 ALTER TABLE `crm_requirement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-29 21:59:26
