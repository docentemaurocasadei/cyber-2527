-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: ricambi_mc
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (2,'Sospensioni','Componenti per il sistema di sospensione'),(3,'Sistema Elettrico','Sistema Elettrico di un autoveicolo');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_id` int DEFAULT NULL,
  `table_name` varchar(45) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,8,'orders','INSERT','2026-02-09 09:10:32','inserimento di workshop_id4'),(2,0,'products','insert','2026-02-09 20:27:18','ins'),(3,6,'products','insert','2026-02-09 20:28:41','ins'),(4,9,'orders','INSERT','2026-02-10 09:21:53','inserimento di workshop_id1'),(5,10,'orders','INSERT','2026-02-10 10:00:13','inserimento di workshop_id1'),(6,11,'orders','INSERT','2026-02-10 10:40:17','inserimento di workshop_id2'),(7,12,'orders','INSERT','2026-02-10 10:41:07','inserimento di workshop_id2'),(8,13,'orders','INSERT','2026-02-10 10:41:27','inserimento di workshop_id2'),(9,7,'products','insert','2026-02-10 10:41:27','ins'),(12,16,'orders','INSERT','2026-02-10 11:07:53','inserimento di workshop_id7'),(14,18,'orders','INSERT','2026-02-10 11:20:24','inserimento di workshop_id10'),(15,19,'orders','INSERT','2026-02-10 12:53:18','inserimento di workshop_id10');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_orders_has_products_products1_idx` (`product_id`),
  KEY `fk_orders_has_products_orders1_idx` (`order_id`),
  CONSTRAINT `fk_orders_has_products_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_orders_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,2,19.99),(1,2,4,50.00),(1,3,5,89.99),(2,2,1,49.99),(2,4,2,89.99),(3,1,3,19.99),(3,2,1,49.99),(4,1,5,25.99),(4,3,2,89.99),(4,4,1,89.99),(5,1,1,19.99),(5,4,2,89.99),(6,1,5,25.30),(6,2,10,35.00),(7,1,5,25.30),(7,2,10,35.00),(10,1,2,50.00),(10,2,2,50.00),(10,3,1,100.00),(11,1,2,50.00),(11,2,5,22.50),(12,1,2,50.00),(12,2,5,22.50),(13,1,2,50.00),(13,2,5,22.50),(13,3,1,98.90),(13,7,11,145.90),(16,5,3,50.00),(16,6,2,22.50),(18,5,3,50.00),(18,6,2,22.50);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_logs`
--

DROP TABLE IF EXISTS `order_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_logs`
--

LOCK TABLES `order_logs` WRITE;
/*!40000 ALTER TABLE `order_logs` DISABLE KEYS */;
INSERT INTO `order_logs` VALUES (1,19,'CREATED','Ordine creato da: root@localhost');
/*!40000 ALTER TABLE `order_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `workshop_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`workshop_id`),
  KEY `fk_orders_workshops1_idx` (`workshop_id`),
  CONSTRAINT `fk_orders_workshops1` FOREIGN KEY (`workshop_id`) REFERENCES `workshops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2026-01-15','In lavorazione','2026-02-03 09:24:10','2026-02-03 09:24:10',NULL),(2,2,'2026-01-20','Completato','2026-02-03 09:24:10','2026-02-03 09:24:10',NULL),(3,3,'2024-01-25','Spedito','2026-02-03 09:24:10',NULL,NULL),(4,1,'2024-02-01','In lavorazione','2026-02-03 09:24:10',NULL,NULL),(5,2,'2024-02-05','Completato','2026-02-03 09:24:10',NULL,NULL),(6,3,'2026-02-03','In Lavorazione','2026-02-03 09:24:52',NULL,NULL),(7,3,'2026-02-03','In Lavorazione','2026-02-03 09:32:42',NULL,NULL),(8,4,'2026-02-09','Spedito','2026-02-09 09:10:32',NULL,NULL),(9,1,'2026-02-10','pending','2026-02-10 09:21:53',NULL,NULL),(10,1,'2026-02-10','In Lavorazione','2026-02-10 10:00:13',NULL,NULL),(11,2,'2026-02-10','In Bozza','2026-02-10 10:40:17',NULL,NULL),(12,2,'2026-02-10','In Bozza','2026-02-10 10:41:07',NULL,NULL),(13,2,'2026-02-10','In Bozza','2026-02-10 10:41:27',NULL,NULL),(16,7,'2026-02-10','In Bozza','2026-02-10 11:07:53',NULL,NULL),(18,10,'2026-02-10','In Bozza','2026-02-10 11:20:24',NULL,NULL),(19,10,'2026-02-10','In Bozza','2026-02-10 12:53:18',NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_supplier` (
  `product_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `supply_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`supplier_id`),
  KEY `fk_products_has_suppliers_suppliers1_idx` (`supplier_id`),
  KEY `fk_products_has_suppliers_products1_idx` (`product_id`),
  CONSTRAINT `fk_products_has_suppliers_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_products_has_suppliers_suppliers1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supplier`
--

LOCK TABLES `product_supplier` WRITE;
/*!40000 ALTER TABLE `product_supplier` DISABLE KEYS */;
INSERT INTO `product_supplier` VALUES (1,1,12.50),(1,2,13.00),(1,5,35.00),(2,1,30.00),(2,3,28.50),(3,2,60.00),(3,3,58.00),(4,1,62.00),(4,2,61.50);
/*!40000 ALTER TABLE `product_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `sku` varchar(13) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `sell_price` decimal(10,2) DEFAULT NULL,
  `description` text,
  `stock_quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku_UNIQUE` (`sku`),
  KEY `fk_products_categories_idx` (`category_id`),
  CONSTRAINT `fk_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,3,'FRN-001','Pastiglie Freni Standard',19.99,'Pastiglie freni di alta qualità per veicoli standard.',93),(2,3,'FRN-002','Dischi Freni Ventilati',49.99,'Dischi freni ventilati per una migliore dissipazione del calore.',48),(3,2,'SPS-001','Ammortizzatori Anteriori',89.99,'Ammortizzatori anteriori per una guida confortevole.',59),(4,2,'SPS-002','Ammortizzatori Posteriori',89.99,'Ammortizzatori posteriori per una guida stabile.',60),(5,2,'FS-GH1','Fanali Xenon',15.80,'Fanali Xeno Luce molto bianca',25),(6,2,'FX-GG1','Fanali Xenon 2',22.30,'Fanali Xeno Luce extra bianca',20),(7,2,'KF123','Kit frizione',150.00,'Kit frizione completo per auto',20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `products_v`
--

DROP TABLE IF EXISTS `products_v`;
/*!50001 DROP VIEW IF EXISTS `products_v`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `products_v` AS SELECT 
 1 AS `id`,
 1 AS `category_id`,
 1 AS `sku`,
 1 AS `name`,
 1 AS `sell_price`,
 1 AS `description`,
 1 AS `stock_quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(80) NOT NULL,
  `vat_number` varchar(13) NOT NULL,
  `street_address` varchar(45) DEFAULT NULL,
  `street_number` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(2) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vat_number_UNIQUE` (`vat_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Supplier One Srl','12345678901','Via Milano','15','Roma','RM','0612345678','supplier.one@example.com'),(2,'Nuova Azienda','10987654321','Corso Napoli','22','Bologna','BO','05112345678','supplier.two@example.com'),(3,'Supplier Three Sas','11223344556','Piazza Torino','5','Torino','TO','01112345678','supplier.three@example.com'),(5,'Supp 5','0012121211',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshops`
--

DROP TABLE IF EXISTS `workshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `business_name` varchar(80) NOT NULL,
  `vat_number` varchar(13) NOT NULL,
  `street_address` varchar(45) DEFAULT NULL,
  `street_number` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(2) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `pec` varchar(255) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `legale_rappresentante` json DEFAULT NULL,
  `fiscal_code` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vat_number_u` (`vat_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshops`
--

LOCK TABLES `workshops` WRITE;
/*!40000 ALTER TABLE `workshops` DISABLE KEYS */;
INSERT INTO `workshops` VALUES (1,'Officina Meccanica Rossi','12345678901','Via Roma','10','Milano','MI','0245678901','officina.rossi@pec.it','info@officina.rossi.it','{\"nome\": \"Giovanni\", \"citta\": {\"cap\": \"00101\", \"nome\": \"Roma\"}, \"cognome\": \"Rossi\", \"anno_nascita\": 1990}','RSSGVN90C24L219Y'),(2,'Autofficina Bianchi','0987654321','Corso Venezia','25','Torino','TO','0112345678','autofficina.bianchi@pec.it','info@autofficina.bianchi.it','{\"nome\": \"Maria\", \"citta\": {\"cap\": \"20100\", \"nome\": \"Milano\"}, \"cognome\": \"Bianchi\", \"interessi\": [\"musica\", \"sport\", \"lettura\"], \"anno_nascita\": 1985, \"titolo_studio\": \"laurea\"}','BNCMRA85A55F205K'),(3,'Centro Revisioni Verdi','11223344556','Piazza Duomo','5','Firenze','FI','0551234567','centro.revisioni.verdi@pec.it','info@centro.revisioni.verdi.it',NULL,'TRCMBNL219K'),(4,'Officina Milano & Co','00255455215','Via Roma','10','Milano','MI','021231231',NULL,'info@officinamilano.it','{\"nome\": \"Luca\", \"citta\": {\"cap\": \"20100\", \"nome\": \"Milano\"}, \"cognome\": \"Verdi\", \"anno_nascita\": 1980}',NULL),(7,'Officina Ancona & Co','00023322558','Via Roma','10','Ancona',NULL,NULL,NULL,NULL,NULL,'00123123145'),(10,'Officina Ancona & Co','000443322558','Via Roma','10','Ancona',NULL,NULL,NULL,NULL,NULL,'00123123145');
/*!40000 ALTER TABLE `workshops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `products_v`
--

/*!50001 DROP VIEW IF EXISTS `products_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products_v` AS select `products`.`id` AS `id`,`products`.`category_id` AS `category_id`,`products`.`sku` AS `sku`,`products`.`name` AS `name`,`products`.`sell_price` AS `sell_price`,`products`.`description` AS `description`,`products`.`stock_quantity` AS `stock_quantity` from `products` */;
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

-- Dump completed on 2026-03-10 13:40:41
