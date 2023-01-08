-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: nailpolishapp
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `bname` varchar(25) NOT NULL,
  `country` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'A England','UK'),(2,'Barry M','UK'),(3,'Cadillacquer','Switzerland'),(4,'China Glaze','USA'),(5,'Colour Alike','Poland'),(6,'Essie','USA'),(7,'FUN Lacquer','Singapore'),(8,'Kinetics','Lithuania'),(9,'Masura','Russia'),(10,'OPI','USA'),(11,'Orly','USA'),(12,'Picture Polish','Australia'),(13,'Sally Hansen','USA'),(14,'Zoya','USA');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `collection_id` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `brand_id` int NOT NULL,
  `year_released` int DEFAULT NULL,
  `season` varchar(25) DEFAULT NULL,
  `line` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`collection_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `collections_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
INSERT INTO `collections` VALUES (1,'Tudoresque',1,2017,NULL,'Core'),(2,'Under the sea',2,2018,NULL,'Core'),(3,'Green origin',2,2019,NULL,'Core'),(4,'Summer Flowers',3,2021,'Summer','Core'),(5,'OMG Flashback',4,2018,NULL,'Core'),(6,'Fashion Fairy',4,2005,NULL,'Core'),(7,'Havanna Nights',4,2021,'Summer','Core'),(8,'La Collection de France',10,2008,'Autumn','Core'),(9,'Gwen Stefani',10,2014,'Holidays','Core'),(10,'South America',10,2002,'Spring','Core'),(11,'Iceland',10,2017,'Autumn','Core'),(12,'Complete Salon Manicure',13,NULL,NULL,'Complete Salon Manicure'),(13,'HD Hi-Definition',13,NULL,NULL,'HD Hi-Definition'),(14,'Xtreme Wear',13,NULL,NULL,'Xtreme Wear'),(15,'Hypnotic Trio',14,2022,'Holidays','Core'),(16,'Bridal x Reem Acra',6,2018,NULL,'Gel Couture'),(17,'Seaglass Shimmers',6,2018,'Summer','Core'),(18,'Bon boy-age',6,2018,'Spring','Core'),(19,'Ignite',14,2014,'Autumn','Core');
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `my_collection`
--

DROP TABLE IF EXISTS `my_collection`;
/*!50001 DROP VIEW IF EXISTS `my_collection`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_collection` AS SELECT 
 1 AS `Name`,
 1 AS `Brand`,
 1 AS `Collection`,
 1 AS `MainColour`,
 1 AS `Finish`,
 1 AS `DateofPurchase`,
 1 AS `Worn`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `my_wishlist`
--

DROP TABLE IF EXISTS `my_wishlist`;
/*!50001 DROP VIEW IF EXISTS `my_wishlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_wishlist` AS SELECT 
 1 AS `Name`,
 1 AS `Brand`,
 1 AS `Collection`,
 1 AS `MainColour`,
 1 AS `Finish`,
 1 AS `DateAdded`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nail_polish`
--

DROP TABLE IF EXISTS `nail_polish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nail_polish` (
  `np_id` int NOT NULL AUTO_INCREMENT,
  `npname` varchar(100) NOT NULL,
  `brand_id` int NOT NULL,
  `collection_id` int NOT NULL,
  `main_colour` varchar(25) NOT NULL,
  `secondary_colour` varchar(25) DEFAULT NULL,
  `topper` tinyint(1) DEFAULT NULL,
  `finish` varchar(25) NOT NULL,
  PRIMARY KEY (`np_id`),
  KEY `brand_id` (`brand_id`),
  KEY `collection_id` (`collection_id`),
  CONSTRAINT `nail_polish_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `nail_polish_ibfk_2` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nail_polish`
--

LOCK TABLES `nail_polish` WRITE;
/*!40000 ALTER TABLE `nail_polish` DISABLE KEYS */;
INSERT INTO `nail_polish` VALUES (1,'Anne Boleyn',1,1,'Red',NULL,0,'Holographic'),(2,'Anne of Cleves',1,1,'Pink',NULL,0,'Holographic'),(3,'Coral reef',2,2,'Pink',NULL,0,'Shimmer'),(4,'Dragonfish',2,2,'Purple',NULL,0,'Shimmer'),(5,'Evergreen',2,3,'Green',NULL,0,'Cream'),(6,'Lilac orchid',2,3,'Lilac',NULL,0,'Cream'),(7,'Pacific flame',2,2,'Red',NULL,0,'Shimmer'),(8,'Seahorse',2,2,'Purple','Grey',0,'Shimmer'),(9,'Gerbera Daisy',3,4,'Green','Red',0,'Crelly'),(10,'2NITE',4,5,'Blue',NULL,0,'Holographic'),(11,'BFF',4,5,'Pink',NULL,0,'Holographic'),(12,'DV8',4,5,'Teal',NULL,0,'Holographic'),(13,'IDK',4,5,'Purple',NULL,0,'Holographic'),(14,'OMG',4,5,'Silver',NULL,0,'Holographic'),(15,'TTYL',4,5,'Orange',NULL,0,'Holographic'),(16,'Golden enchantment',4,6,'Gold',NULL,1,'Holographic'),(17,'Cuba Diving',4,7,'Blue',NULL,0,'Neon'),(18,'Guava mama',4,7,'Pink',NULL,0,'Neon'),(19,'Tropic like it is hot',4,7,'Green',NULL,0,'Neon'),(20,'Parlez-vous OPI?',10,8,'Lilac',NULL,0,'Cream'),(21,'Comet In The Sky',10,9,'Black',NULL,1,'Glitter'),(22,'Dulce De Leche',10,10,'Beige',NULL,0,'Cream'),(23,'Aurora Berry-alis',10,11,'Pink',NULL,0,'Cream'),(24,'Check Out The Old Geysirs',10,11,'Blue',NULL,0,'Cream'),(25,'I will Have A Gin & Tectonic',10,11,'Beige',NULL,0,'Cream'),(26,'Icelanded A Bottle Of Opi',10,11,'Green',NULL,0,'Cream'),(27,'Copper Penny',13,12,'Bronze',NULL,1,'Glitter'),(28,'DVD',13,13,'Blue','Purple',0,'Shimmer'),(29,'Pacific Blue Original',13,14,'Blue',NULL,0,'Cream'),(30,'Clarice',14,15,'Green',NULL,0,'Metallic'),(31,'Metora',14,15,'Red','Burgundy',0,'Metallic'),(32,'Rosalind',14,15,'Blue',NULL,0,'Metallic'),(33,'Getting intricate',6,16,'Blue',NULL,0,'Cream'),(34,'Coral coast',6,17,'Orange','Peach',0,'Shimmer'),(35,'Dont be salty',6,17,'Pink',NULL,0,'Shimmer'),(36,'Krona-logical order',10,11,'Brown',NULL,0,'Cream'),(37,'Less is norse',10,11,'Purple',NULL,0,'Cream'),(38,'One heckla of a color',10,11,'Pink',NULL,0,'Cream'),(39,'Reykjavik has all the hot spots',10,11,'Pink',NULL,0,'Shimmer'),(40,'Suzi and the arctic fox',10,11,'Blue',NULL,0,'Cream'),(41,'That is what friends are for',10,11,'Brown',NULL,0,'Cream'),(42,'This is not Greenland',10,11,'Green',NULL,0,'Cream'),(43,'Turn on the northern lights',10,11,'Purple',NULL,0,'Shimmer'),(44,'Anchor down',6,18,'Blue',NULL,0,'Shimmer'),(45,'Bon boy-age',6,18,'Green',NULL,0,'Shimmer'),(46,'Autumn',14,19,'Brown','Bronze',0,'Shimmer'),(47,'India',14,19,'Red','Burgundy',0,'Shimmer'),(48,'Remy',14,19,'Blue','Teal',0,'Shimmer'),(49,'Sansa',14,19,'Purple',NULL,0,'Shimmer'),(50,'Teigen',14,19,'Red','Cranberry',0,'Shimmer'),(51,'Yuna',14,19,'Green','Olive',0,'Shimmer');
/*!40000 ALTER TABLE `nail_polish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `np_owned`
--

DROP TABLE IF EXISTS `np_owned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `np_owned` (
  `npowned_id` int NOT NULL AUTO_INCREMENT,
  `np_id` int NOT NULL,
  `quantity_owned` int DEFAULT '1',
  `date_of_purchase` date DEFAULT (curdate()),
  `worn` tinyint(1) DEFAULT '0',
  `cost` float NOT NULL,
  PRIMARY KEY (`npowned_id`),
  UNIQUE KEY `np_id` (`np_id`),
  CONSTRAINT `np_owned_ibfk_1` FOREIGN KEY (`np_id`) REFERENCES `nail_polish` (`np_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `np_owned`
--

LOCK TABLES `np_owned` WRITE;
/*!40000 ALTER TABLE `np_owned` DISABLE KEYS */;
INSERT INTO `np_owned` VALUES (1,1,1,'2022-02-10',0,7),(2,3,1,'2022-02-10',0,7),(3,4,1,'2022-02-10',0,6.5),(4,5,1,'2022-06-16',0,6.5),(5,6,1,'2022-09-15',0,3.99),(6,7,1,'2022-09-15',0,3.99),(7,8,1,'2022-06-16',1,3.99),(8,9,1,'2022-06-16',0,1),(9,10,1,'2022-09-15',0,1),(10,11,1,'2022-09-15',0,8.99),(11,16,2,'2022-09-15',0,12),(12,17,1,'2022-10-02',0,7),(13,18,1,'2022-06-08',0,7),(14,19,1,'2022-06-08',0,6),(15,21,1,'2022-07-01',0,5.5),(16,22,2,'2022-10-11',0,5.5),(17,23,1,'2022-10-11',0,5.5),(18,24,1,'2022-12-30',1,4.99),(19,26,1,'2022-08-19',0,4.99),(20,27,1,'2022-08-19',0,4.99),(21,29,3,'2022-10-02',0,3.59),(22,30,1,'2022-12-30',1,3.59),(23,31,1,'2022-12-30',0,7),(24,32,1,'2022-12-30',0,7),(25,33,1,'2022-12-30',0,7),(26,35,1,'2022-12-30',0,4.99),(27,37,1,'2022-11-30',0,4.99),(28,38,1,'2022-11-30',0,4.99),(29,39,1,'2022-11-30',0,4.99),(30,40,1,'2022-08-12',0,6.99),(31,41,1,'2022-08-30',0,5.99),(32,42,1,'2022-07-30',0,4.99),(33,43,1,'2022-07-30',0,4.99),(34,44,1,'2022-04-12',0,7),(35,45,1,'2022-05-30',0,9),(36,47,1,'2022-03-30',0,8.99),(37,48,1,'2022-05-30',0,9),(38,50,1,'2022-02-19',0,9);
/*!40000 ALTER TABLE `np_owned` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_if_np_exists` BEFORE INSERT ON `np_owned` FOR EACH ROW BEGIN
	IF NEW.np_id IN (
		SELECT wishlist.np_id FROM wishlist)
	THEN 
		DELETE FROM wishlist WHERE wishlist.np_id=NEW.np_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `np_id` int NOT NULL,
  `date_added` date DEFAULT (curdate()),
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `np_id` (`np_id`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`np_id`) REFERENCES `nail_polish` (`np_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,20,'2022-12-30'),(2,28,'2022-10-05'),(3,2,'2022-05-15'),(4,36,'2022-05-15'),(5,46,'2022-11-15'),(6,51,'2022-11-15');
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nailpolishapp'
--

--
-- Dumping routines for database 'nailpolishapp'
--
/*!50003 DROP FUNCTION IF EXISTS `np_suggestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `np_suggestion`(polishname VARCHAR(100), brandname VARCHAR(25)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
RETURN CONCAT('Today you should try: ', polishname, ' by ',brandname);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `colour_suggestion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `colour_suggestion`(colour VARCHAR(25))
BEGIN
SELECT np_suggestion(Name, Brand)
FROM my_collection
WHERE my_collection.MainColour=colour AND my_collection.Worn = FALSE
ORDER BY RAND()
LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `my_collection`
--

/*!50001 DROP VIEW IF EXISTS `my_collection`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_collection` AS select `nail_polish`.`npname` AS `Name`,`brands`.`bname` AS `Brand`,`collections`.`cname` AS `Collection`,`nail_polish`.`main_colour` AS `MainColour`,`nail_polish`.`finish` AS `Finish`,`np_owned`.`date_of_purchase` AS `DateofPurchase`,`np_owned`.`worn` AS `Worn` from (((`np_owned` left join `nail_polish` on((`np_owned`.`np_id` = `nail_polish`.`np_id`))) left join `brands` on((`nail_polish`.`brand_id` = `brands`.`brand_id`))) left join `collections` on((`nail_polish`.`collection_id` = `collections`.`collection_id`))) order by `brands`.`bname`,`nail_polish`.`npname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_wishlist`
--

/*!50001 DROP VIEW IF EXISTS `my_wishlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_wishlist` AS select `nail_polish`.`npname` AS `Name`,`brands`.`bname` AS `Brand`,`collections`.`cname` AS `Collection`,`nail_polish`.`main_colour` AS `MainColour`,`nail_polish`.`finish` AS `Finish`,`wishlist`.`date_added` AS `DateAdded` from (((`wishlist` left join `nail_polish` on((`wishlist`.`np_id` = `nail_polish`.`np_id`))) left join `brands` on((`nail_polish`.`brand_id` = `brands`.`brand_id`))) left join `collections` on((`nail_polish`.`collection_id` = `collections`.`collection_id`))) order by `brands`.`bname`,`nail_polish`.`npname` */;
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

-- Dump completed on 2023-01-08 23:03:38
