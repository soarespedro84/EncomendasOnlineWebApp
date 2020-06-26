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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `idCart` char(36) NOT NULL DEFAULT (uuid()),
  `fk_idUser` char(36) NOT NULL,
  `fk_idProduct` char(36) NOT NULL,
  `size` int NOT NULL,
  `qtd` int NOT NULL,
  PRIMARY KEY (`idCart`,`size`),
  KEY `fk_cart_user1_idx` (`fk_idUser`),
  KEY `fk_cart_product1_idx` (`fk_idProduct`),
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`fk_idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`fk_idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('688b9f65-66e9-48f3-91ba-0103827ffbb5','54cc1dea-b21c-11ea-828b-0a002700000b','7dd4af1b-af5b-11ea-ab9d-0a002700000b',41,2),('688b9f65-66e9-48f3-91ba-0103827ffbb5','54cc1dea-b21c-11ea-828b-0a002700000b','7dd4af1b-af5b-11ea-ab9d-0a002700000b',42,2),('688b9f65-66e9-48f3-91ba-0103827ffbb5','54cc1dea-b21c-11ea-828b-0a002700000b','7dd4af1b-af5b-11ea-ab9d-0a002700000b',43,2),('688b9f65-66e9-48f3-91ba-0103827ffbb5','54cc1dea-b21c-11ea-828b-0a002700000b','7dd4af1b-af5b-11ea-ab9d-0a002700000b',44,2),('faa58c7c-f66e-47e5-b6c0-c2c0238e128b','54cc1dea-b21c-11ea-828b-0a002700000b','b970bbe6-af5a-11ea-ab9d-0a002700000b',36,5),('faa58c7c-f66e-47e5-b6c0-c2c0238e128b','54cc1dea-b21c-11ea-828b-0a002700000b','b970bbe6-af5a-11ea-ab9d-0a002700000b',37,5),('faa58c7c-f66e-47e5-b6c0-c2c0238e128b','54cc1dea-b21c-11ea-828b-0a002700000b','b970bbe6-af5a-11ea-ab9d-0a002700000b',38,5),('faa58c7c-f66e-47e5-b6c0-c2c0238e128b','54cc1dea-b21c-11ea-828b-0a002700000b','b970bbe6-af5a-11ea-ab9d-0a002700000b',39,5),('faa58c7c-f66e-47e5-b6c0-c2c0238e128b','54cc1dea-b21c-11ea-828b-0a002700000b','b970bbe6-af5a-11ea-ab9d-0a002700000b',40,5);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
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
