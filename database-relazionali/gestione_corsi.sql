-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: gestione_corsi
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `aule`
--

DROP TABLE IF EXISTS `aule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `capienza` int NOT NULL,
  `numero` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aule`
--

LOCK TABLES `aule` WRITE;
/*!40000 ALTER TABLE `aule` DISABLE KEYS */;
INSERT INTO `aule` VALUES (1,'Aula Magna',100,'A01'),(2,'Laboratorio',30,'L02'),(3,'Aula Standard',50,'S03');
/*!40000 ALTER TABLE `aule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificazioni`
--

DROP TABLE IF EXISTS `certificazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificazioni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_certificazione` date NOT NULL,
  `punteggio_minimo` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificazioni`
--

LOCK TABLES `certificazioni` WRITE;
/*!40000 ALTER TABLE `certificazioni` DISABLE KEYS */;
INSERT INTO `certificazioni` VALUES (1,'Certificazione SQL','2023-04-15',70.00),(2,'Certificazione MySQL','2023-05-20',75.50),(3,'Certificazione PHP','2023-06-10',80.00);
/*!40000 ALTER TABLE `certificazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsi`
--

DROP TABLE IF EXISTS `corsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corsi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descrizione` text,
  `durata_ore` int NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsi`
--

LOCK TABLES `corsi` WRITE;
/*!40000 ALTER TABLE `corsi` DISABLE KEYS */;
INSERT INTO `corsi` VALUES (1,'SQL Base','Corso introduttivo a SQL',40,300.00,'2023-04-01','2023-04-30'),(2,'MySQL Avanzato','Approfondimenti su MySQL',60,450.50,'2023-05-01','2023-06-15'),(3,'Programmazione PHP','Corso di programmazione con PHP',50,350.75,'2023-06-01','2023-06-30');
/*!40000 ALTER TABLE `corsi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsi_frequentati`
--

DROP TABLE IF EXISTS `corsi_frequentati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corsi_frequentati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corsista_id` int NOT NULL,
  `corso_id` int NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  `voto_finale` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_corso_frequentato` (`corsista_id`,`corso_id`),
  KEY `fk_corso` (`corso_id`),
  CONSTRAINT `fk_corsista` FOREIGN KEY (`corsista_id`) REFERENCES `corsisti` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_corso` FOREIGN KEY (`corso_id`) REFERENCES `corsi` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsi_frequentati`
--

LOCK TABLES `corsi_frequentati` WRITE;
/*!40000 ALTER TABLE `corsi_frequentati` DISABLE KEYS */;
INSERT INTO `corsi_frequentati` VALUES (1,1,1,'2023-04-01','2023-04-30',8.50),(2,1,2,'2023-05-01','2023-06-15',7.00),(3,2,1,'2023-04-01','2023-04-30',9.00),(4,2,3,'2023-06-01','2023-06-30',8.00),(5,3,2,'2023-05-01','2023-06-15',6.50);
/*!40000 ALTER TABLE `corsi_frequentati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corsisti`
--

DROP TABLE IF EXISTS `corsisti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corsisti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `data_nascita` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corsisti`
--

LOCK TABLES `corsisti` WRITE;
/*!40000 ALTER TABLE `corsisti` DISABLE KEYS */;
INSERT INTO `corsisti` VALUES (1,'Mario','Rossi','1985-04-15','mario.rossi@example.com','1234567890'),(2,'Anna','Bianchi','1990-07-20','anna.bianchi@example.com','0987654321'),(3,'Luca','Verdi','1988-11-30','luca.verdi@example.com',NULL);
/*!40000 ALTER TABLE `corsisti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docenti`
--

DROP TABLE IF EXISTS `docenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `data_assunzione` date NOT NULL,
  `stipendio` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docenti`
--

LOCK TABLES `docenti` WRITE;
/*!40000 ALTER TABLE `docenti` DISABLE KEYS */;
INSERT INTO `docenti` VALUES (1,'Giovanni','Neri','2020-01-15',2500.00),(2,'Sara','Gialli','2021-03-10',2700.50),(3,'Marco','Blu','2019-07-25',3000.00);
/*!40000 ALTER TABLE `docenti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-13  9:30:34
