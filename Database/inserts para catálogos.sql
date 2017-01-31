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
-- Table structure for table `crm_brand`
--

DROP TABLE IF EXISTS `crm_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_brand` (
  `crm_brand_id` int(11) NOT NULL,
  `crm_business_line_id` int(11) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_brand_id`),
  KEY `crm_brand_id` (`crm_brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_brand`
--

LOCK TABLES `crm_brand` WRITE;
/*!40000 ALTER TABLE `crm_brand` DISABLE KEYS */;
INSERT INTO `crm_brand` VALUES (1,1,'HP'),(2,1,'RICOH'),(3,1,'XEROX'),(4,1,'BROTHER'),(5,1,'KYOCERA'),(6,1,'TOSHIBA'),(7,1,'KODAK'),(8,1,'FUJITSU'),(9,1,'LEXMARK'),(10,1,'CANON'),(11,1,'KONICA MINOLTA'),(12,1,'EPSON'),(13,1,'SHARP'),(14,1,'SAMSUNG'),(15,1,'DELL'),(16,1,'PANASONIC'),(17,12,'XEROX ECOLOGICO'),(18,2,'HP'),(19,2,'LENOVO'),(20,2,'DELL'),(21,2,'ASUS'),(22,2,'ACER'),(23,2,'PANASONIC'),(24,2,'APPLE'),(25,2,'TOSHIBA'),(26,2,'SAMSUNG'),(27,4,'HP'),(28,4,'LENOVO'),(29,4,'IBM'),(30,4,'CISCO'),(31,4,'APPLE'),(32,4,'DELL'),(33,4,'HUAWEI'),(34,15,'HP'),(35,15,'CISCO'),(36,15,'DLINK'),(37,15,'LINKSIS'),(38,15,'HUAWEI'),(39,3,'PANASONIC'),(40,3,'HP'),(41,3,'LENOVO'),(42,6,'HIGH VISION'),(43,6,'PELCO'),(44,6,'PANASONIC'),(45,6,'SAMSUNG'),(46,6,'AXIS'),(47,6,'BOLIDE'),(48,6,'BOSCH'),(49,6,'VIVOTEK'),(50,6,'DAHUA'),(51,6,'MOBOTIX'),(52,6,'HIKVISION'),(53,9,'APPLE'),(54,9,'HP'),(55,9,'LENOVO'),(56,9,'SAMSUNG'),(57,9,'ASUS'),(58,9,'ACER'),(59,9,'GENERICA'),(60,13,'MICROSOFT'),(61,13,'KARSPERSKY'),(62,13,'MCAFFE'),(63,13,'ADOBE'),(64,1,'OTRO'),(65,2,'OTRO'),(66,3,'OTRO'),(67,4,'OTRO'),(68,5,'OTRO'),(69,6,'OTRO'),(70,7,'OTRO'),(71,8,'OTRO'),(72,9,'OTRO'),(73,10,'OTRO'),(74,11,'OTRO'),(75,12,'OTRO'),(76,13,'OTRO'),(77,14,'OTRO'),(78,15,'OTRO'),(79,16,'OTRO'),(80,17,'OTRO');
/*!40000 ALTER TABLE `crm_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_equipment_type`
--

DROP TABLE IF EXISTS `crm_equipment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_equipment_type` (
  `crm_equipment_type_id` int(11) NOT NULL,
  `crm_business_line_id` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`crm_equipment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_equipment_type`
--

LOCK TABLES `crm_equipment_type` WRITE;
/*!40000 ALTER TABLE `crm_equipment_type` DISABLE KEYS */;
INSERT INTO `crm_equipment_type` VALUES (1,1,'MULTIFUNCIONAL'),(2,1,'IMPRESORA'),(3,1,'SCANNER'),(4,1,'COPIADORA'),(5,2,'DESKTOP'),(6,2,'PORTATILES'),(7,2,'ALL IN ONE'),(8,15,'SWITCHES'),(9,15,'ROUTERS'),(10,15,'ACCESS POINT'),(11,3,'PORTATILES'),(12,3,'TABLETA'),(13,3,'PDA\'S'),(14,6,'CAMARA INTERIOR'),(15,6,'CAMARA CON INFRARROJOS'),(16,6,'CAMARAS ANTIVANDALICAS'),(17,6,'CAMARAS IP'),(18,6,'CAMARAS CON MOVIMIENTO Y ZOOM'),(19,6,'CAMARAS OCULTAS'),(20,9,'7\" / WIFI'),(21,9,'10\" / WIFI'),(22,9,'7\" / 3G O 4G'),(23,9,'10\" / 3G O 4G'),(24,13,'SISTEMA OPERATIVO'),(25,13,'LICENCIAS OFFICE'),(26,13,'ANTIVIRUS'),(27,13,'CRM DYNAMICS'),(28,13,'SOFTWARE PROGRAMACION'),(29,13,'SQL SERVER'),(30,1,'OTRO'),(31,2,'OTRO'),(32,3,'OTRO'),(33,4,'OTRO'),(34,5,'OTRO'),(35,6,'OTRO'),(36,7,'OTRO'),(37,8,'OTRO'),(38,9,'OTRO'),(39,10,'OTRO'),(40,11,'OTRO'),(41,12,'OTRO'),(42,13,'OTRO'),(43,14,'OTRO'),(44,15,'OTRO'),(45,16,'OTRO'),(46,17,'OTRO');
/*!40000 ALTER TABLE `crm_equipment_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-31  0:34:54
