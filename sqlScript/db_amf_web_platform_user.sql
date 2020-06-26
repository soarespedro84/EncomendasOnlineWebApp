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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idUser` char(36) NOT NULL DEFAULT (uuid()),
  `name` varchar(128) NOT NULL,
  `fk_company` char(36) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `permission` int NOT NULL DEFAULT '0',
  `state` int NOT NULL DEFAULT '1',
  `dtReg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUser`),
  KEY `fk_user_company1_idx` (`fk_company`),
  CONSTRAINT `fk_user_company1` FOREIGN KEY (`fk_company`) REFERENCES `company` (`idCompany`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('070cec6b-b21b-11ea-828b-0a002700000b','Filipe Soares','b563bd9b-ad4b-11ea-ab9d-0a002700000b','fsoares@soaresinc.pt','ad96867c5e0550dfa2379a4353560f19',1,1,'2020-06-19 11:52:54'),('09ddb8b6-b21c-11ea-828b-0a002700000b','Ricardo Marinho','ea758203-b077-11ea-8a5e-0a002700000b','rmarinho@mws.com','46429568e0a6ec0a1b1443c11840f387',1,1,'2020-06-19 12:00:08'),('1c09a5c9-b21c-11ea-828b-0a002700000b','System Admin','6e1bbb37-accd-11ea-964a-c46516fe8f34','admin@amfshoes.com','21232f297a57a5a743894a0e4a801fc3',5,1,'2020-06-19 12:00:38'),('2a34b9dc-b21c-11ea-828b-0a002700000b','Sofia Marinho','ea758203-b077-11ea-8a5e-0a002700000b','smarinho@mws.com','5526213c9ee5e01de9e547d88cf96ec8',1,1,'2020-06-19 12:01:02'),('354e6205-b21c-11ea-828b-0a002700000b','Bruno Rebelo','2e34314d-ad4c-11ea-ab9d-0a002700000b','brebelo@brp.pt','9f9ace55f5e61e3a6de7c1a3b396bf8b',1,1,'2020-06-19 12:01:21'),('3fbea3cf-b21c-11ea-828b-0a002700000b','Maria Rebelo','2e34314d-ad4c-11ea-ab9d-0a002700000b','mrebelo@rbp.pt','30ec3bebb8630b5ec5fcbd923447d4c0',1,1,'2020-06-19 12:01:38'),('54cc1dea-b21c-11ea-828b-0a002700000b','Pedro Soares','b563bd9b-ad4b-11ea-ab9d-0a002700000b','psoares@soaresinc.pt','dacf8b95ce7e3e2f1f90aca5f9360801',1,1,'2020-06-19 12:02:13'),('627a3434-b21b-11ea-828b-0a002700000b','TempAdmin','6e1bbb37-accd-11ea-964a-c46516fe8f34','admin@amf.pt','21232f297a57a5a743894a0e4a801fc3',5,1,'2020-06-19 11:55:27'),('6568b3e7-b537-11ea-94d7-0a002700000b','Rita Guedes','965a0e9f-b3ff-11ea-94d7-0a002700000b','rguedes@gs.pt','4381b32531c850bb34a7985acf0b3509',1,1,'2020-06-23 10:53:31'),('6dea1d9e-b21c-11ea-828b-0a002700000b','Carla Gomes','2e358a84-ad4c-11ea-ab9d-0a002700000b','cgomes@gomes.pt','e4fd5cadb403eaa2ceed277f72060a1e',1,1,'2020-06-19 12:02:56'),('8107f103-b23b-11ea-828b-0a002700000b','Ana Campos','b563bd9b-ad4b-11ea-ab9d-0a002700000b','acampos@soaresinc.pt','45f1e4cf5e9f7cb797d13109b840f87c',1,1,'2020-06-19 15:45:22'),('b46a03be-b21b-11ea-828b-0a002700000b','Sergii Silva','6e1bbb37-accd-11ea-964a-c46516fe8f34','sergiisilva@amf.pt','2d038124bdf227078f6aef1a758b9a5c',2,1,'2020-06-19 11:57:44'),('cbe568ba-b533-11ea-94d7-0a002700000b','Paulo Garces','965a0e9f-b3ff-11ea-94d7-0a002700000b','pgarces@gs.pt','78388f6977c1747a3d608e387007ebc8',1,1,'2020-06-23 10:27:45'),('d56a6955-b238-11ea-828b-0a002700000b','Sergii Sobral','6e1bbb37-accd-11ea-964a-c46516fe8f34','sergiisobral@amf.pt','91591323417233656845608314e44ad9',2,1,'2020-06-19 15:26:15'),('d6b2522a-b21b-11ea-828b-0a002700000b','Sergii Santos','6e1bbb37-accd-11ea-964a-c46516fe8f34','sergiisantos@amf.pt','416309c527968819266366b56b8787af',2,1,'2020-06-19 11:58:42'),('e5ecfe67-b21b-11ea-828b-0a002700000b','Sergii Sousa','6e1bbb37-accd-11ea-964a-c46516fe8f34','sergiisousa@amf.pt','8d5b9a75c112ea7b99ba791eb3e19d58',2,1,'2020-06-19 11:59:07');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-26  1:25:11
