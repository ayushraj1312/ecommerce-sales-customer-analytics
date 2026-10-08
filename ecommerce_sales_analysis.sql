-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_analytics
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics'),(2,'Clothing'),(3,'Home & Kitchen'),(4,'Books'),(5,'Sports'),(6,'Beauty');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `signup_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rahul','Sharma','Male',28,'Delhi','Delhi','2024-01-15'),(2,'Priya','Verma','Female',25,'Mumbai','Maharashtra','2024-02-10'),(3,'Amit','Kumar','Male',32,'Patna','Bihar','2024-02-18'),(4,'Sneha','Singh','Female',29,'Lucknow','Uttar Pradesh','2024-03-05'),(5,'Arjun','Mehta','Male',35,'Bangalore','Karnataka','2024-03-20'),(6,'Neha','Gupta','Female',27,'Jaipur','Rajasthan','2024-04-11'),(7,'Rohit','Yadav','Male',31,'Noida','Uttar Pradesh','2024-04-25'),(8,'Anjali','Patel','Female',24,'Ahmedabad','Gujarat','2024-05-08'),(9,'Vikas','Mishra','Male',38,'Kolkata','West Bengal','2024-05-19'),(10,'Pooja','Das','Female',30,'Chennai','Tamil Nadu','2024-06-02');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1001,101,1,2499.00),(2,1001,104,2,999.00),(3,1002,103,1,3999.00),(4,1002,119,2,499.00),(5,1003,115,1,899.00),(6,1003,114,1,799.00),(7,1004,106,2,799.00),(8,1004,108,1,1799.00),(9,1005,102,1,1799.00),(10,1005,111,1,1899.00),(11,1006,101,2,2499.00),(12,1006,105,1,1499.00),(13,1007,109,1,2499.00),(14,1007,118,2,799.00),(15,1008,117,1,2499.00),(16,1008,116,1,999.00),(17,1009,103,1,3999.00),(18,1010,112,1,3499.00),(19,1010,110,2,1299.00),(20,1011,120,2,699.00),(21,1011,119,1,499.00),(22,1012,101,1,2499.00),(23,1012,107,1,849.00),(24,1013,113,2,699.00),(25,1013,115,1,899.00),(26,1014,103,1,3999.00),(27,1014,104,1,999.00),(28,1015,108,2,1799.00),(29,1015,106,1,799.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `shipping_city` varchar(50) DEFAULT NULL,
  `shipping_state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1001,1,'2024-06-10','Delivered','Delhi','Delhi'),(1002,2,'2024-06-12','Delivered','Mumbai','Maharashtra'),(1003,3,'2024-06-15','Delivered','Patna','Bihar'),(1004,4,'2024-06-18','Delivered','Lucknow','Uttar Pradesh'),(1005,5,'2024-06-20','Shipped','Bangalore','Karnataka'),(1006,1,'2024-06-25','Delivered','Delhi','Delhi'),(1007,6,'2024-06-28','Delivered','Jaipur','Rajasthan'),(1008,7,'2024-07-02','Delivered','Noida','Uttar Pradesh'),(1009,8,'2024-07-05','Cancelled','Ahmedabad','Gujarat'),(1010,9,'2024-07-08','Delivered','Kolkata','West Bengal'),(1011,10,'2024-07-10','Delivered','Chennai','Tamil Nadu'),(1012,2,'2024-07-15','Delivered','Mumbai','Maharashtra'),(1013,3,'2024-07-18','Shipped','Patna','Bihar'),(1014,5,'2024-07-20','Delivered','Bangalore','Karnataka'),(1015,1,'2024-07-25','Delivered','Delhi','Delhi');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `category_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (101,'Wireless Headphones',1,2499.00,1600.00,50),(102,'Bluetooth Speaker',1,1799.00,1100.00,40),(103,'Smart Watch',1,3999.00,2600.00,30),(104,'USB-C Charger',1,999.00,550.00,80),(105,'Power Bank',1,1499.00,900.00,60),(106,'Men T-Shirt',2,799.00,400.00,100),(107,'Women T-Shirt',2,849.00,450.00,90),(108,'Denim Jeans',2,1799.00,1000.00,70),(109,'Running Shoes',2,2499.00,1500.00,45),(110,'Non-Stick Pan',3,1299.00,750.00,55),(111,'Electric Kettle',3,1899.00,1200.00,35),(112,'Coffee Maker',3,3499.00,2200.00,25),(113,'Data Analytics Book',4,699.00,350.00,80),(114,'Python Programming Book',4,799.00,400.00,65),(115,'SQL Complete Guide',4,899.00,450.00,75),(116,'Football',5,999.00,550.00,50),(117,'Cricket Bat',5,2499.00,1500.00,30),(118,'Yoga Mat',5,799.00,400.00,60),(119,'Face Wash',6,499.00,250.00,100),(120,'Moisturizer',6,699.00,350.00,85);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-08 15:19:16
