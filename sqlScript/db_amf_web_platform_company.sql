-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_amf_web_platform
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `idCompany` char(36) NOT NULL DEFAULT (uuid()),
  `companyName` varchar(128) NOT NULL,
  `nif` varchar(45) NOT NULL,
  `address` varchar(256) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `state` int NOT NULL DEFAULT '1',
  `dtReg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('2e34314d-ad4c-11ea-ab9d-0a002700000b','Rebelo Produtions','PT502987654','Rua de Santo Antonio, nr 696 4450-321 Matosinhos, Portugal','+351 227 356 951',1,'2020-06-13 09:02:09'),('2e358a84-ad4c-11ea-ab9d-0a002700000b','Texteis Gomes','PT509453299','Rua de Todos os Santos, nº 32 4999-876 Gondomar, Portugal','+351 224 658 951',1,'2020-06-13 09:02:09'),('6e1bbb37-accd-11ea-964a-c46516fe8f34','AMF, LDA','PT504465767','Rua de S. Cipriano, nº 658 4835-461 Guimarães, Portugal','+351 253 527 163',1,'2020-06-12 17:54:50'),('965a0e9f-b3ff-11ea-94d7-0a002700000b','Garces & Soares','222333666','Rua de um lado','+351222333444',1,'2020-06-21 21:41:30'),('b563bd9b-ad4b-11ea-ab9d-0a002700000b','Soares, Inc','PT500222333','Rua de Santa Susana, nº 777 4472-794 Maia, Portugal','+351 229 485 084',1,'2020-06-13 08:58:46'),('ea758203-b077-11ea-8a5e-0a002700000b','Marinho Web Solutions','PT503665995','Rua de Santa Catarina, 234 4000-002 Porto, Portugal','+351 226 018 920',1,'2020-06-17 09:52:46');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-26  1:25:10
