-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: contador_geiger_database
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `contador_geiger`
--

DROP TABLE IF EXISTS `contador_geiger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contador_geiger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nivel_radiacion` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `zona` varchar(50) DEFAULT NULL,
  `operador` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operador` (`operador`),
  CONSTRAINT `contador_geiger_ibfk_1` FOREIGN KEY (`operador`) REFERENCES `operadores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contador_geiger`
--

LOCK TABLES `contador_geiger` WRITE;
/*!40000 ALTER TABLE `contador_geiger` DISABLE KEYS */;
INSERT INTO `contador_geiger` VALUES (1,50,'2024-01-13 00:00:00','Russia',1),(2,15,'2022-05-03 00:00:00','Alemania',2),(3,8000,'1986-04-26 00:00:00','Chernobyl',3),(4,1000,'2021-02-15 00:00:00','Somalia',4),(5,30,'2021-02-15 00:00:00','Reino Unido',5),(6,3000,'2018-07-21 00:00:00','Central nuclear de Fukushima',6),(7,6000,'2016-03-25 00:00:00','Semipalátinsk',8),(8,500,'2023-07-31 00:00:00','Siberia',9),(9,40,'2023-03-31 00:00:00','Mayak',10),(10,2,'2024-09-07 05:18:26','Argentina',7);
/*!40000 ALTER TABLE `contador_geiger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operadores`
--

DROP TABLE IF EXISTS `operadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operadores`
--

LOCK TABLES `operadores` WRITE;
/*!40000 ALTER TABLE `operadores` DISABLE KEYS */;
INSERT INTO `operadores` VALUES (1,'Francisco','Argentina'),(2,'Fernando','Argentina'),(3,'Martin','Argentina'),(4,'Jule','Alemania'),(5,'Reus','Alemania'),(6,'Frank','Alemania'),(7,'John','Estados Unidos'),(8,'Bryan','Estados Unidos'),(9,'Tom','Estados Unidos'),(10,'Myle','Estados Unidos');
/*!40000 ALTER TABLE `operadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-07  5:27:04
