-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: design_and_3d_printing_company
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) DEFAULT NULL,
  `family_name` varchar(60) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `sign_up_date` date DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `contact_id` (`contact_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contact_details` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Tolu','Morohunfola','2000-07-26','2023-07-29',1),(2,'Adeola','Morohunfola','1971-12-10','2023-07-29',2),(3,'David','Morohunfola','1971-04-22','2023-07-29',3),(4,'David','Morohunfola','2002-11-10','2023-07-29',4),(5,'Emiri','Leong','2000-07-28','2023-07-29',5),(6,'Meher','Lota','1999-11-16','2023-07-29',6);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_details`
--

DROP TABLE IF EXISTS `contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_details` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `email_address` varchar(70) DEFAULT NULL,
  `phone_number` bigint DEFAULT NULL,
  `post_code` varchar(8) DEFAULT NULL,
  `town` varchar(30) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `email_address` (`email_address`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_details`
--

LOCK TABLES `contact_details` WRITE;
/*!40000 ALTER TABLE `contact_details` DISABLE KEYS */;
INSERT INTO `contact_details` VALUES (1,'taemorohunfola@gmail.com',7879545557,'LU5 6GN','Luton','31 Centurion Way'),(2,'adeolamor@yahoo.com',7988492172,'LU5 6GN','Luton','391 Centurion Way'),(3,'davdelmor@yahoo.com',7722485793,'WD25 7DG','Watford','7 Queenswood Crescent'),(4,'davidmoro@gmail.com',7274889308,'WD25 7DG','Watford','8 Queenswood Crescent'),(5,'emiii@outlook.com',7448593023,'KH39 6EJ','Dreams','88 Dreamies Road'),(6,'mehersloe@yahoo.com',7959379672,'KJ4 8KF','Computers','3625 Computer Avenue');
/*!40000 ALTER TABLE `contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_colour` varchar(20) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `client_id` (`client_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,4,2,'red',4,'2023-07-29 00:00:00'),(2,4,4,'blue',1,'2023-07-30 00:00:00'),(3,5,3,'gold',1,'2023-07-31 00:00:00'),(4,2,1,'gold',3,'2023-07-31 00:00:00'),(5,1,5,'blue',5,'2023-07-31 00:00:00'),(6,6,3,'green',2,'2023-08-03 00:00:00'),(7,3,4,'grey',1,'2023-08-04 00:00:00'),(8,5,2,'purple',1,'2023-08-04 00:00:00'),(9,2,1,'purple',1,'2023-08-05 00:00:00'),(10,6,2,'red',3,'2023-08-08 00:00:00'),(11,3,4,'purple',2,'2023-08-09 00:00:00'),(198,2,3,'red',4,'2023-08-17 00:00:00'),(199,2,3,'purple',3,'2023-08-17 01:29:03');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `stock_check` BEFORE INSERT ON `orders` FOR EACH ROW begin
			insert into stock_check values(New.order_datetime, 
				New.product_colour, 
                New.quantity, 
                New.product_id);
		end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plastic_used`
--

DROP TABLE IF EXISTS `plastic_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plastic_used` (
  `plastic_used_id` int NOT NULL AUTO_INCREMENT,
  `plastic_cost` decimal(6,2) DEFAULT NULL,
  `plastic_weight_in_grams` int DEFAULT NULL,
  PRIMARY KEY (`plastic_used_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plastic_used`
--

LOCK TABLES `plastic_used` WRITE;
/*!40000 ALTER TABLE `plastic_used` DISABLE KEYS */;
INSERT INTO `plastic_used` VALUES (1,0.30,300),(2,0.40,400),(3,0.60,600),(4,0.75,750),(5,1.60,1600),(6,1.80,1800),(7,1.90,1900),(8,2.00,2000),(9,18.00,18000),(10,19.00,19000),(11,20.00,20000),(12,30.00,30000),(13,40.00,40000);
/*!40000 ALTER TABLE `plastic_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `product_size_id` int NOT NULL AUTO_INCREMENT,
  `mailer_title` varchar(14) DEFAULT NULL,
  `length_in_cm` int DEFAULT NULL,
  `width_in_cm` int DEFAULT NULL,
  `height_in_cm` int DEFAULT NULL,
  `weight_in_grams` int DEFAULT NULL,
  `cost` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`product_size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` VALUES (1,'Large Letters',35,25,2,750,0.53),(2,'Small Parcels',45,35,16,2000,1.09),(3,'Medium Parcels',61,46,46,20000,2.59),(4,'Large Collect',100,60,60,40000,0.00);
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(30) DEFAULT NULL,
  `product_price` decimal(6,2) DEFAULT NULL,
  `product_description` varchar(100) DEFAULT NULL,
  `product_size_id` int DEFAULT NULL,
  `plastic_used_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name` (`product_name`),
  KEY `product_size_id` (`product_size_id`),
  KEY `plastic_used_id` (`plastic_used_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`product_size_id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`plastic_used_id`) REFERENCES `plastic_used` (`plastic_used_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Mini Rabbit',10.00,'A 2x20x30cm 400g small rabbit, useful as an flat ornament.',1,2),(2,'Small Rabbit',20.00,'A 40x30x15cm 1.8kg rabbit useful as a car ornament.',2,6),(3,'Medium Rabbit',40.00,'A 60x45x45cm 19kg rabbit useful as a home ornament',3,10),(4,'Large Rabbit',60.00,'A 80x50x50cm 30kg rabbit useful as a home ornament. This item must be collected.',4,12),(5,'Extra Large Rabbit',100.00,'A 100x60x60cm 40kg rabbit useful as a home ornament. This item must be collected.',4,13);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_check`
--

DROP TABLE IF EXISTS `stock_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_check` (
  `order_time` datetime DEFAULT NULL,
  `order_colour` varchar(20) DEFAULT NULL,
  `order_quantity` int DEFAULT NULL,
  `product_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_check`
--

LOCK TABLES `stock_check` WRITE;
/*!40000 ALTER TABLE `stock_check` DISABLE KEYS */;
INSERT INTO `stock_check` VALUES ('2023-08-17 00:00:00','red',4,3),('2023-08-17 01:29:03','purple',3,3);
/*!40000 ALTER TABLE `stock_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_product_details`
--

DROP TABLE IF EXISTS `vw_product_details`;
/*!50001 DROP VIEW IF EXISTS `vw_product_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_product_details` AS SELECT 
 1 AS `order_id`,
 1 AS `product_id`,
 1 AS `product_colour`,
 1 AS `quantity`,
 1 AS `mailer_title`,
 1 AS `product_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_product_details`
--

/*!50001 DROP VIEW IF EXISTS `vw_product_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_product_details` AS select `orders`.`order_id` AS `order_id`,`orders`.`product_id` AS `product_id`,`orders`.`product_colour` AS `product_colour`,`orders`.`quantity` AS `quantity`,`product_size`.`mailer_title` AS `mailer_title`,`products`.`product_name` AS `product_name` from ((`orders` join `products` on((`orders`.`product_id` = `products`.`product_id`))) join `product_size` on((`products`.`product_size_id` = `product_size`.`product_size_id`))) */;
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

-- Dump completed on 2023-08-17 23:13:38
