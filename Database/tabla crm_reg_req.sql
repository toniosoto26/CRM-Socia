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
  `status` varchar(1) DEFAULT NULL,
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
INSERT INTO `crm_reg_req` VALUES (1234,1,'C:USERSVIDALDESKTOPDOCS1234ACTA-1234.PDF','2017-04-10',2333,'A'),(1234,2,'C:USERSVIDALDESKTOPDOCS1234RFC-1234.PDF','2017-04-10',2333,'A');
/*!40000 ALTER TABLE `crm_reg_req` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-10  0:49:44
