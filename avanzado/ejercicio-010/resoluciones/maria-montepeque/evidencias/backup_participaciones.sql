-- MySQL dump 10.13  Distrib 8.4.10, for Linux (x86_64)
--
-- Host: localhost    Database: campuslands_mysql
-- ------------------------------------------------------
-- Server version	8.4.10

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
-- Table structure for table `participaciones_carreras_urbanas_backup`
--

DROP TABLE IF EXISTS `participaciones_carreras_urbanas_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participaciones_carreras_urbanas_backup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `piloto` varchar(80) NOT NULL,
  `vehiculo` varchar(80) NOT NULL,
  `circuito` varchar(80) NOT NULL,
  `posicion_llegada` int NOT NULL,
  `premio_ganado` decimal(10,2) NOT NULL DEFAULT '0.00',
  `penalizaciones` int NOT NULL DEFAULT '0',
  `estado` enum('finalizada','descalificado','abandono') NOT NULL,
  `fecha_carrera` date NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `chk_posicion_carreras_backup` CHECK ((`posicion_llegada` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participaciones_carreras_urbanas_backup`
--

LOCK TABLES `participaciones_carreras_urbanas_backup` WRITE;
/*!40000 ALTER TABLE `participaciones_carreras_urbanas_backup` DISABLE KEYS */;
INSERT INTO `participaciones_carreras_urbanas_backup` VALUES (1,'Kairo Vega','Nissan Silvia S15','Circuito Norte',1,1500.00,0,'finalizada','2026-05-01'),(2,'Kairo Vega','Nissan Silvia S15','Circuito Sur',2,900.00,0,'finalizada','2026-06-01'),(3,'Zara Nightfall','Mazda RX-7','Circuito Norte',3,500.00,1,'finalizada','2026-05-01'),(4,'Zara Nightfall','Mazda RX-7','Circuito Este',1,1600.00,0,'finalizada','2026-06-15'),(5,'Rex Turbo','Toyota Supra','Circuito Sur',1,1400.00,0,'finalizada','2026-06-01'),(6,'Rex Turbo','Toyota Supra','Circuito Oeste',99,0.00,3,'descalificado','2026-07-10'),(7,'Luna Drift','Honda Civic Type R','Circuito Este',2,700.00,0,'finalizada','2026-06-15'),(8,'Luna Drift','Honda Civic Type R','Circuito Norte',4,250.00,0,'finalizada','2026-05-01'),(9,'Mika Blaze','Subaru Impreza WRX','Circuito Oeste',3,450.00,1,'finalizada','2026-07-10'),(10,'Mika Blaze','Subaru Impreza WRX','Circuito Sur',99,0.00,0,'abandono','2026-06-01');
/*!40000 ALTER TABLE `participaciones_carreras_urbanas_backup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-23  0:49:35
