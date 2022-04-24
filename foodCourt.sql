CREATE DATABASE  IF NOT EXISTS `onlinefoodservice` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `onlinefoodservice`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: onlinefoodservice
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'APPETIZERS'),(2,'Soups and Salads'),(3,'Tandoori Breads'),(4,'Rice and Biryani'),(5,'Tandoori Specialities'),(6,'Chicken Entrees'),(7,'Lamb Entrees'),(8,'Sea Food'),(9,'Vegetable Delights'),(10,'Specials'),(11,'Beverages'),(12,'Beers'),(13,'Deserts'),(14,'Side Orders'),(15,'Fry'),(16,'chips');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `hotness` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id_fk` (`order_id`),
  CONSTRAINT `order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `userorder` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,'VEGETABLE SAMOSA',1,NULL,NULL),(2,'CHEESE PAKORA',1,NULL,NULL),(3,'PANEER TIKKA (CHEEESE)',1,NULL,NULL),(4,'LENTIL SOUP',1,NULL,NULL),(5,'VEGETABLE SAMOSA',1,NULL,NULL),(6,'FISH PAKORA',1,NULL,NULL),(7,'banana chips',2,NULL,NULL),(8,'CHICKEN SOUP',1,NULL,NULL),(9,'CHICKEN PAKORA',1,NULL,NULL);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_ctgy_id_fk` (`category_id`),
  CONSTRAINT `product_ctgy_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'VEGETABLE SAMOSA',20.00,1,'Crisp patties filled with mildly spiced potatoes and peas'),(2,'VEGETABLE PAKORA',20.00,1,'Mixed Vegetable Fritters dipped in batter and fried'),(3,'CHICKEN PAKORA',60.00,1,'Boneless chicken dipped in spiced batter and fried'),(4,'CHEESE PAKORA',50.00,1,'Delicately spiced fried cheese fritters'),(5,'FISH PAKORA',60.00,1,'Fish filets dipped in Spiced batter and fried'),(6,'CHICKEN SOUP',150.00,2,'Indian style, lightly spiced'),(7,'MULLIGATAWNY SOUP',200.00,2,'Delicately Spiced Lentil Soup Garnished with Rice & Chicken'),(8,'LENTIL SOUP',230.00,2,'Mildly spiced'),(9,'Vegeterian Salad',40.00,2,'Lettuce, cheese, cilantro, cucumber, tomatoes'),(10,'KACHUMBER/CHICK PEA SALAD',120.00,2,'Cucumbers, Onions, Tomatoes, Cilantro, Chickpeas & Lemon'),(117,'ASSORTED APPETIZERS ',350.00,1,'KABAB, SAMOSA, PAKORA, CHICKEN PAKORA, ONION BHAJI'),(118,'PANEER TIKKA (CHEEESE)',550.00,1,'Marinated in spices, cooked in clay over, sautéed in bell pepper & onion'),(119,'CHILI CHICKEN',170.00,1,'Boneless chicken sautéed with onion and Bell Pepper'),(120,'ONION BHAJI',40.00,1,'Chopped onions dipped in batter and fried'),(121,'GULAB JAMUN',20.00,13,'Indian Milk Cheese Balls, Fried & soaked in honey syrup'),(122,'KHEER',80.00,13,'Indian Rice Pudding'),(123,'PISTACHIO KULFI',90.00,13,'Indian Ice Cream With Pistachios'),(124,'MANGO KULFI',80.00,13,'Indian Ice Cream With Mango'),(125,'RAITA',50.00,14,'Cultured Yogurt with Cucumbers, Carrots & Spices'),(126,'Plain Yogurt',70.00,14,''),(127,'MANGO CHUTNEY',30.00,14,''),(128,'HOT PICKEL',20.00,14,''),(129,'PAPADDAM',20.00,14,''),(135,'asdf',664.00,NULL,'sadf'),(136,'food',500.00,NULL,'food'),(138,'Food',500.00,2,'12356'),(141,'banana chips',420.00,16,'So cripsy');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rule` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(10) DEFAULT NULL,
  `lname` varchar(10) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'Shariar','Alfaz','shariarb6@gmail.com','5115599513','21/1 Dhopakhola Mymensingh');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userorder`
--

DROP TABLE IF EXISTS `userorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userorder` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user_id_fk` (`user_id`),
  CONSTRAINT `order_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userorder`
--

LOCK TABLES `userorder` WRITE;
/*!40000 ALTER TABLE `userorder` DISABLE KEYS */;
INSERT INTO `userorder` VALUES (1,NULL,77.00,'2022-04-19 02:38:16'),(2,NULL,858.00,'2022-04-19 02:49:41'),(3,NULL,88.00,'2022-04-19 23:06:11'),(4,NULL,924.00,'2022-04-21 06:50:27'),(5,NULL,231.00,'2022-04-21 07:07:12');
/*!40000 ALTER TABLE `userorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-24 22:23:14
