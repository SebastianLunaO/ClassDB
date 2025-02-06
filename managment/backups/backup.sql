-- MySQL dump 10.13  Distrib 8.4.2, for macos15.2 (arm64)
--
-- Host: localhost    Database: escuela
-- ------------------------------------------------------
-- Server version	8.4.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `DNI` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `año` int NOT NULL,
  PRIMARY KEY (`DNI`,`año`),
  CONSTRAINT `asistencia_FK_DNI` FOREIGN KEY (`DNI`) REFERENCES `compañero` (`DNI`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES ('1',2015),('3',2015),('4',2016);
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `DNI` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nombre` varchar(25) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `RFC` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `entrada` date NOT NULL,
  `salida` date DEFAULT NULL,
  `cargo` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`DNI`,`RFC`,`entrada`),
  CONSTRAINT `carrera_FK` FOREIGN KEY (`DNI`) REFERENCES `compañero` (`DNI`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES ('3','Leire Arrieta','E1','1992-01-02',NULL,'trabajador');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cena`
--

DROP TABLE IF EXISTS `cena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cena` (
  `año` int NOT NULL,
  `lugar` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `organizador1` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `organizador2` varchar(25) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`año`),
  KEY `cena_FK_org1` (`organizador1`),
  KEY `cena_FK_org2` (`organizador2`),
  CONSTRAINT `cena_FK_org1` FOREIGN KEY (`organizador1`) REFERENCES `compañero` (`DNI`) ON DELETE CASCADE,
  CONSTRAINT `cena_FK_org2` FOREIGN KEY (`organizador2`) REFERENCES `compañero` (`DNI`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cena`
--

LOCK TABLES `cena` WRITE;
/*!40000 ALTER TABLE `cena` DISABLE KEYS */;
INSERT INTO `cena` VALUES (2015,'Urtiagaian','1','3');
/*!40000 ALTER TABLE `cena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compañero`
--

DROP TABLE IF EXISTS `compañero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compañero` (
  `DNI` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compañero`
--

LOCK TABLES `compañero` WRITE;
/*!40000 ALTER TABLE `compañero` DISABLE KEYS */;
INSERT INTO `compañero` VALUES ('1','Ion Otaeza',10),('2','Ane Anduaga',20),('3','Leire Arrieta',30),('4','Iker Galarza',NULL);
/*!40000 ALTER TABLE `compañero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `RFC` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`RFC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('E1','Ulma Handling',10),('E2','Copreci',20);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05 19:01:46
