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
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,'Articulo eliminado',0.00,NULL,NULL,NULL,'DL'),(1002,'Zapatillas Adidas',110.50,10,3,8,'CA'),(1003,'Zapatillas Merrell',225.00,1,3,8,'CA'),(1004,'Gorro Hombre',15.00,24,10,30,'NA'),(1005,'Gorro juvenil',22.00,35,10,20,'NA'),(1006,'Gorro Mujer',18.00,2,5,20,'NA'),(1007,'Carro',358.00,1,2,3,'GO'),(1008,'Carro con palos',1889.00,2,2,4,'GO'),(1009,'Botas Asolo',225.00,6,10,15,'MO'),(1010,'Botas Shalewa',350.00,6,10,15,'MO'),(1012,'Pantalon corto hombre',12.00,6,6,8,'AT'),(1013,'Pantalon corto mujer ',12.00,12,6,8,'AT'),(1014,'Camiseta Nike azul',24.00,24,5,15,'AT'),(1015,'Camiseta Reebook gris ',34.00,24,5,15,'AT'),(1016,'Camiseta Nike roja ',22.00,2,5,15,'AT');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES ('AT','Ateletisme'),('CA','Calzado'),('DL','Articulo Eliminado'),('GO','Golf'),('MO','Monte'),('NA','Natacion');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (101,'Loramendi','San Juan 23','Arrasate','20500','943764587',7844,'Euskadi'),(102,'Kirolak','B1 Olakua, 45','Eibar','20588','943498747',7844,'Euskadi'),(103,'Loreak','Azzgain , 12','Donosti','20000','945987577',7499,'Euskadi'),(104,'Erreala','Elizaurre 12','Donosti','20000','943454587',7499,'Euskadi'),(105,'Txuri','Foru plaza 3','Gasteiz','01500','945432587',7499,'Euskadi'),(106,'Bilbodep','San Pedro 8','Bilbo','48500','943764567',7844,'Euskadi'),(107,'Kirolat','Avda. Geiz 23','Bilbo','48500','945555587',7844,'Euskadi'),(108,'Korrika','Lorenzo 23','Irun','20440','934464587',7844,'Euskadi'),(109,'ADI','Zaharra 3','Lasarte','20220','923764587',7654,'Euskadi'),(110,'Naparra','Berria 2','Pamplona','26500','934123587',7654,'Euskadi'),(111,'Osasuna','Lazarraga, 35 bajo','Pamplona','26500','934444587',7844,'Euskadi'),(112,'Azkar','Maiatza 23','Estella','26550','943768887',7654,'Euskadi');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (10,'Direccion'),(20,'Coordinacion'),(30,'Ventas'),(40,'Administracion');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (7369,'Urcelai, Pedro','Oficinista',7902,'1980-12-17',800.00,NULL,40),(7499,'Alustiza, Ainhoa','Vendedor',7698,'1981-02-20',1600.00,300.00,30),(7521,'Alonso, Marcos','Vendedor',7698,'1981-02-22',1250.00,500.00,30),(7566,'Garcia, Ion','Coordinador',7839,'1981-04-02',2975.00,NULL,20),(7654,'Alonso, Peru','Vendedor',7698,'1981-09-28',1250.00,1400.00,30),(7698,'Anduaga, Ines','Coordinador',7839,'1981-05-01',2850.00,NULL,20),(7782,'Inda, Ane','Coordinador',7839,'1981-06-09',2450.00,NULL,20),(7788,'Madariaga, Gorka','Analista',7566,'1982-09-12',3000.00,NULL,20),(7839,'Arregi, Ion','Presidente',NULL,'1981-11-17',5000.00,NULL,10),(7844,'Gonzalez, Ion','Vendedor',7698,'1981-09-08',1500.00,0.00,30),(7876,'Adams, James','Oficinista',7788,'1983-01-12',1100.00,NULL,40),(7900,'Balzategi, Irene','Oficinista',7698,'1981-12-03',950.00,NULL,40),(7902,'Agirre, Saioa','Analista',7566,'1981-12-03',3000.00,NULL,20),(7934,'Altuna, Iker','Oficinista',7782,'1982-01-23',1300.00,NULL,40);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lineas`
--

LOCK TABLES `lineas` WRITE;
/*!40000 ALTER TABLE `lineas` DISABLE KEYS */;
INSERT INTO `lineas` VALUES (601,1,155.00,2),(602,1,145.00,3),(603,1,155.00,5),(604,1,150.00,5),(604,1003,220.00,5),(604,1006,18.00,6),(605,1,166.00,7),(605,1004,15.00,7),(605,1005,22.00,8),(605,1006,18.00,3),(605,1007,300.00,23),(605,1008,1500.00,2),(606,1,155.00,5),(607,1,150.00,5),(608,1,150.00,8),(608,1004,14.00,8),(609,1004,14.00,8),(609,1007,280.00,8),(609,1008,1650.00,1),(610,1,125.00,8),(610,1002,110.50,4),(610,1003,215.00,4),(611,1004,15.00,4),(612,1004,15.00,20),(612,1015,29.00,4),(612,1016,22.00,20),(613,1,150.00,20),(613,1006,12.00,20),(613,1007,290.00,12),(613,1008,1700.00,1),(614,1,150.00,12),(614,1006,14.00,12),(614,1007,290.00,2),(615,1,150.00,2),(615,1008,1250.00,2),(616,1002,105.10,5),(616,1003,222.00,5),(616,1009,220.00,2),(616,1012,11.00,5),(616,1013,12.00,2),(617,1,155.00,2),(617,1002,105.00,2),(617,1003,216.00,2),(617,1004,14.00,2),(617,1005,22.00,2),(617,1008,1250.00,2),(617,1009,210.00,6),(617,1010,330.00,6),(617,1012,10.00,6),(618,1,155.00,6),(618,1002,105.10,6),(618,1003,220.00,6),(619,1,155.00,6),(619,1002,100.00,6),(619,1003,200.00,1),(620,1,150.00,1),(620,1002,110.00,1),(620,1004,14.00,1),(621,1,155.00,2),(621,1005,21.00,2),(622,1,140.00,10),(622,1003,180.00,5);
/*!40000 ALTER TABLE `lineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `new`
--

LOCK TABLES `new` WRITE;
/*!40000 ALTER TABLE `new` DISABLE KEYS */;
/*!40000 ALTER TABLE `new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (601,'1986-05-01',106),(602,'1986-06-05',102),(603,'1986-06-05',102),(604,'1986-06-15',106),(605,'1986-07-14',106),(606,'1986-07-14',104),(607,'1986-07-18',104),(608,'1986-07-25',104),(609,'1986-08-01',104),(610,'1987-01-07',101),(611,'1987-01-11',102),(612,'1987-01-15',104),(613,'1987-02-01',108),(614,'1987-02-01',102),(615,'1987-02-01',107),(616,'1987-02-03',103),(617,'1987-02-05',105),(618,'1987-02-15',102),(619,'1987-02-22',104),(620,'1987-03-12',102),(621,'1987-03-15',102),(622,'2025-01-30',107);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05 19:12:19
