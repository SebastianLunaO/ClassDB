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
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `articuloID` smallint unsigned NOT NULL,
  `descripcion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `stock` smallint DEFAULT NULL,
  `stock_min` smallint DEFAULT NULL,
  `stock_medio` smallint DEFAULT NULL,
  `categoriaID` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`articuloID`),
  KEY `ART_CAT__FK` (`categoriaID`),
  CONSTRAINT `ART_CAT__FK` FOREIGN KEY (`categoriaID`) REFERENCES `categorias` (`categoriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoriaID` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nombre` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`categoriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `clienteID` smallint unsigned NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `domicilio` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `poblacion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cod_postal` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `telefono` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `empleadoID` smallint unsigned DEFAULT NULL,
  `nacionalidad` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`clienteID`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `CLI_EMP_FK` (`empleadoID`),
  CONSTRAINT `CLI_EMP_FK` FOREIGN KEY (`empleadoID`) REFERENCES `empleados` (`empleadoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `departamentoID` tinyint unsigned NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`departamentoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `dos`
--

DROP TABLE IF EXISTS `dos`;
/*!50001 DROP VIEW IF EXISTS `dos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dos` AS SELECT 
 1 AS `nombre`,
 1 AS `pedidoID`,
 1 AS `importe`*/;
SET character_set_client = @saved_cs_client;

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
-- Table structure for table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineas` (
  `pedidoID` smallint unsigned NOT NULL,
  `articuloID` smallint unsigned NOT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`pedidoID`,`articuloID`),
  KEY `LINEAS_PRO_FK` (`articuloID`),
  CONSTRAINT `LINEAS_PED_FK` FOREIGN KEY (`pedidoID`) REFERENCES `pedidos` (`pedidoID`),
  CONSTRAINT `LINEAS_PRO_FK` FOREIGN KEY (`articuloID`) REFERENCES `articulos` (`articuloID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new`
--

DROP TABLE IF EXISTS `new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new` (
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedidoID` smallint unsigned NOT NULL,
  `fecha` date DEFAULT NULL,
  `clienteID` smallint unsigned NOT NULL,
  PRIMARY KEY (`pedidoID`),
  KEY `PED_CLI_FK` (`clienteID`),
  CONSTRAINT `PED_CLI_FK` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `tres`
--

DROP TABLE IF EXISTS `tres`;
/*!50001 DROP VIEW IF EXISTS `tres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tres` AS SELECT 
 1 AS `nombre`,
 1 AS `SUM(l.cantidad*l.precio)`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `dos`
--

/*!50001 DROP VIEW IF EXISTS `dos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dos` AS select `c`.`nombre` AS `nombre`,`p`.`pedidoID` AS `pedidoID`,(`l`.`precio` * `l`.`cantidad`) AS `importe` from ((`clientes` `c` join `pedidos` `p` on((`p`.`clienteID` = `c`.`clienteID`))) join `lineas` `l` on((`l`.`pedidoID` = `p`.`pedidoID`))) order by (`l`.`precio` * `l`.`cantidad`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tres`
--

/*!50001 DROP VIEW IF EXISTS `tres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tres` AS select `c`.`nombre` AS `nombre`,sum((`l`.`cantidad` * `l`.`precio`)) AS `SUM(l.cantidad*l.precio)` from ((`clientes` `c` join `pedidos` `p` on((`p`.`clienteID` = `c`.`clienteID`))) join `lineas` `l` on((`l`.`pedidoID` = `p`.`pedidoID`))) group by `c`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05 19:11:15
