-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: socia
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
-- Table structure for table `crm_bl_details`
--

DROP TABLE IF EXISTS `crm_bl_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_bl_details` (
  `crm_daignosis_id` int(11) NOT NULL DEFAULT '0',
  `crm_client_id` int(11) DEFAULT NULL,
  `crm_business_line_id` int(11) DEFAULT NULL,
  `currentBrand` int(11) DEFAULT NULL,
  `equipmentBrand` varchar(50) DEFAULT NULL,
  `equipmentType` int(11) DEFAULT NULL,
  `equipmentQty` int(11) DEFAULT NULL,
  `unitPrice` decimal(12,2) DEFAULT NULL,
  `currentVendor` varchar(50) DEFAULT NULL,
  `serviceContract` varchar(3) DEFAULT NULL,
  `specialConfig` varchar(255) DEFAULT NULL,
  `requirementsNeeded` varchar(3) DEFAULT NULL,
  `demo` varchar(3) DEFAULT NULL,
  `sales` varchar(3) DEFAULT NULL,
  `executive` varchar(50) DEFAULT NULL,
  `gainFactor` varchar(50) DEFAULT NULL,
  `decisionMaker` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `requirements` varchar(50) DEFAULT NULL,
  `nextStep` varchar(50) DEFAULT NULL,
  `commercialProposal` varchar(50) DEFAULT NULL,
  KEY `fk_crm_client_id_idx` (`crm_client_id`),
  KEY `fk_crm_business_line_id_idx` (`crm_business_line_id`),
  KEY `fk_crm_diagnosis_id_idx` (`crm_daignosis_id`),
  CONSTRAINT `fk_crm_business_line_id` FOREIGN KEY (`crm_business_line_id`) REFERENCES `crm_business_line` (`crm_business_line_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_client_id` FOREIGN KEY (`crm_client_id`) REFERENCES `crm_client` (`crm_client_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crm_diagnosis_id` FOREIGN KEY (`crm_daignosis_id`) REFERENCES `crm_diagnosis` (`crm_diagnosis_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Detalles de lineas de negocio del diagnostico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_bl_details`
--

LOCK TABLES `crm_bl_details` WRITE;
/*!40000 ALTER TABLE `crm_bl_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_bl_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-29  1:03:56
