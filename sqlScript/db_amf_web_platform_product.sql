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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` char(36) NOT NULL DEFAULT (uuid()),
  `ref` varchar(45) NOT NULL,
  `description` varchar(128) NOT NULL,
  `name` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `initSize` int NOT NULL,
  `finSize` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `foto` varchar(512) NOT NULL,
  `state` int NOT NULL DEFAULT '1',
  `dtReg` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('7dd3e1db-af5b-11ea-ab9d-0a002700000b','6A03.10','Full Grain Leather Upper, Michelin Rubber Sole - S3 SRC HRO','PIT STOP','Black',39,48,35.70,'6A0310.jpg',1,'2020-06-15 23:56:47'),('7dd4af1b-af5b-11ea-ab9d-0a002700000b','6A03.12','Nubuck Leather Upper, Michelin Rubber Sole - S3 SRC HRO','PISTON','Brown',39,48,35.70,'6A0312.jpg',1,'2020-06-15 23:56:47'),('7dd5918f-af5b-11ea-ab9d-0a002700000b','6C03.10','Full Grain Leather Upper, Michelin Rubber Sole - S3 SRC HRO','KART','Black',39,48,44.60,'6C0310.jpg',1,'2020-06-15 23:56:47'),('b970bbe6-af5a-11ea-ab9d-0a002700000b','8A00.20','Microfiber Upper, LADY ATOMIC Sole - S3 SRC','BOND STREET','Black',35,42,29.90,'8A0020.jpg',1,'2020-06-15 23:51:18'),('b971f886-af5a-11ea-ab9d-0a002700000b','8A00.21','Microfiber Upper, LADY ATOMIC Sole - S1P SRC','FIFTH AVENUE','Grey',35,42,29.90,'8A0021.jpg',1,'2020-06-15 23:51:18'),('b972eeb1-af5a-11ea-ab9d-0a002700000b','8A00.22','Microfiber Upper, LADY ATOMIC Sole - S1P SRC','AVENUE','Blue',35,42,29.90,'8A0022.jpg',1,'2020-06-15 23:51:18'),('b973ba66-af5a-11ea-ab9d-0a002700000b','8A01.20','Microfiber Upper, Safety EVA Sole - S3 SRC HRO','X-O2','Black',35,48,33.10,'8A0120.jpg',1,'2020-06-15 23:51:18'),('b9747e47-af5a-11ea-ab9d-0a002700000b','8A01.23','Microfiber Upper, Safety EVA Sole - S3 SRC HRO','X-AR','Blue',35,48,33.10,'8A0123.jpg',1,'2020-06-15 23:51:18'),('b97532bb-af5a-11ea-ab9d-0a002700000b','8A01.80','Arbol Hydro Fabric Upper, Safety EVA Sole - S3 SRC HRO WR','X-N2','Black',35,48,34.70,'8A0180.jpg',1,'2020-06-15 23:51:18');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
