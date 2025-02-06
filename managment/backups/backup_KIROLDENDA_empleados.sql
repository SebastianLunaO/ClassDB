-- MySQL dump 10.13  Distrib 8.4.2, for macos15.2 (arm64)
--
-- Host: localhost    Database: KIROLDENDA
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
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleadoID` smallint unsigned NOT NULL,
  `nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `puesto` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `jefe` smallint unsigned DEFAULT NULL,
  `fnac` date DEFAULT NULL,
  `salario` decimal(7,2) DEFAULT NULL,
  `comision` decimal(7,2) DEFAULT NULL,
  `departamentoID` tinyint unsigned NOT NULL,
  PRIMARY KEY (`empleadoID`),
  KEY `EMP_DEP_FK` (`departamentoID`),
  KEY `EMP_MGR_FK` (`jefe`),
  CONSTRAINT `EMP_DEP_FK` FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`),
  CONSTRAINT `EMP_MGR_FK` FOREIGN KEY (`jefe`) REFERENCES `empleados` (`empleadoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (7369,'Urcelai, Pedro','Oficinista',7902,'1980-12-17',800.00,NULL,40),(7499,'Alustiza, Ainhoa','Vendedor',7698,'1981-02-20',1600.00,300.00,30),(7521,'Alonso, Marcos','Vendedor',7698,'1981-02-22',1250.00,500.00,30),(7566,'Garcia, Ion','Coordinador',7839,'1981-04-02',2975.00,NULL,20),(7654,'Alonso, Peru','Vendedor',7698,'1981-09-28',1250.00,1400.00,30),(7698,'Anduaga, Ines','Coordinador',7839,'1981-05-01',2850.00,NULL,20),(7782,'Inda, Ane','Coordinador',7839,'1981-06-09',2450.00,NULL,20),(7788,'Madariaga, Gorka','Analista',7566,'1982-09-12',3000.00,NULL,20),(7839,'Arregi, Ion','Presidente',NULL,'1981-11-17',5000.00,NULL,10),(7844,'Gonzalez, Ion','Vendedor',7698,'1981-09-08',1500.00,0.00,30),(7876,'Adams, James','Oficinista',7788,'1983-01-12',1100.00,NULL,40),(7900,'Balzategi, Irene','Oficinista',7698,'1981-12-03',950.00,NULL,40),(7902,'Agirre, Saioa','Analista',7566,'1981-12-03',3000.00,NULL,20),(7934,'Altuna, Iker','Oficinista',7782,'1982-01-23',1300.00,NULL,40);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05 19:29:38
