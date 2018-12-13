-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: fast_order
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `beacon`
--

DROP TABLE IF EXISTS `beacon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beacon` (
  `beacon_uuid` varchar(100) DEFAULT NULL,
  `distance` int(20) DEFAULT NULL,
  `beacon_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `beacon_ip` varchar(30) DEFAULT NULL,
  `beacon_uid` int(5) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`beacon_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beacon`
--

LOCK TABLES `beacon` WRITE;
/*!40000 ALTER TABLE `beacon` DISABLE KEYS */;
/*!40000 ALTER TABLE `beacon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customer_uid` int(6) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(30) DEFAULT NULL,
  `customer_pw` varchar(30) DEFAULT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_name` varchar(30) DEFAULT NULL,
  `customer_type` varchar(30) DEFAULT NULL,
  `customer_language` varchar(30) DEFAULT NULL,
  `seller_place` varchar(30) DEFAULT NULL,
  `salt` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customer_uid`),
  UNIQUE KEY `seller_place` (`seller_place`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (10002,'marie111','1111','2018-09-28 15:04:17','전혜린','사용자','한국어',NULL,NULL),(10004,'m134','1111','2018-10-02 00:03:02','양승목','사용자','한국어',NULL,NULL),(10005,'admin_food1','1234','2018-10-02 00:48:18','언니네사장','판매자',NULL,'언니네',NULL),(10006,'admin_food2','1111','2018-10-02 05:15:47','마늘사장','판매자',NULL,'마늘떡볶이',NULL),(10007,'aaa1','1234','2018-11-10 16:17:41','장쯔이','사용자','English',NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dump`
--

DROP TABLE IF EXISTS `dump`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dump` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `txt` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dump`
--

LOCK TABLES `dump` WRITE;
/*!40000 ALTER TABLE `dump` DISABLE KEYS */;
/*!40000 ALTER TABLE `dump` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_login_log`
--

DROP TABLE IF EXISTS `member_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_login_log` (
  `customer_id` varchar(20) DEFAULT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_login_log`
--

LOCK TABLES `member_login_log` WRITE;
/*!40000 ALTER TABLE `member_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_uid` int(5) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(30) NOT NULL,
  `menu_detail` varchar(30) DEFAULT NULL,
  `menu_price` int(30) DEFAULT NULL,
  `store_uid` int(5) NOT NULL,
  PRIMARY KEY (`menu_uid`),
  UNIQUE KEY `menu_uid` (`menu_uid`),
  KEY `fk_store_uid` (`store_uid`),
  CONSTRAINT `fk_store_uid` FOREIGN KEY (`store_uid`) REFERENCES `store` (`store_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'분식','떡볶이',3000,1111),(2,'분식','순대',3000,1111),(3,'분식','튀김',4000,1111),(4,'분식','어묵',3000,1111),(5,'분식','떡볶이',4000,1112),(6,'분식','라볶이',4000,1112),(7,'분식','새우튀김',5000,1112),(8,'분식','쫄면',3500,1112),(9,'분식','국물떡볶이',4000,1113),(10,'분식','병천순대',5000,1113),(11,'분식','김밥',2500,1113),(12,'분식','라면',3000,1113),(13,'국밥','순댓국',6000,1114),(14,'국밥','김치순댓국',6500,1114),(15,'국밥','소머리국밥',6000,1114),(16,'국밥','뼈해장국',7000,1114),(17,'국밥','태평순댓국',7000,1115),(18,'국밥','태평순대',8000,1115),(19,'국밥','얼큰순댓국',7000,1115),(20,'국밥','된장찌개',6000,1116),(21,'국밥','김치찌개',6000,1116),(22,'국밥','부대찌개',9000,1116),(23,'국밥','육개장',6000,1116),(24,'치킨/피자','후라이드',15000,1117),(25,'치킨/피자','양념치킨',16000,1117),(26,'치킨/피자','감자튀김',10000,1117),(27,'치킨/피자','캔콜라(500ml)',1000,1117),(28,'커피','아메리카노',2000,1118),(29,'커피','카페라떼',3000,1118),(30,'커피','카페모카',3000,1118),(31,'커피','카푸치노',4000,1118),(32,'육류','삼겹살(200g)',4500,1119),(33,'육류','등심(100g)',5000,1119),(34,'육류','불고기(200g)',3000,1119),(35,'육류','생닭(마리)',3000,1119),(36,'청과물','배추',4000,1120),(37,'청과물','상추(100g)',2000,1120),(38,'청과물','무',1800,1120),(39,'청과물','오이',1300,1120);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_pay`
--

DROP TABLE IF EXISTS `order_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_pay` (
  `customer_uid` int(6) DEFAULT NULL,
  `order_uid` int(5) NOT NULL AUTO_INCREMENT,
  `payment` varchar(30) DEFAULT NULL,
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_price` varchar(30) DEFAULT NULL,
  `order_state` varchar(10) DEFAULT NULL,
  `order_togo` varchar(30) DEFAULT NULL,
  `order_amount` varchar(30) DEFAULT NULL,
  `order_detail` varchar(30) DEFAULT NULL,
  `order_place` varchar(30) DEFAULT NULL,
  `order_menu` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`order_uid`),
  KEY `fk_customer_id` (`customer_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_pay`
--

LOCK TABLES `order_pay` WRITE;
/*!40000 ALTER TABLE `order_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `store_uid` int(5) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(30) DEFAULT NULL,
  `store_type` varchar(30) DEFAULT NULL,
  `store_detail` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`store_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1111,'언니네','음식점','분식'),(1112,'마늘떡볶이','음식점','분식'),(1113,'리라네분식','음식점','분식'),(1114,'허수아비순대','음식점','국밥'),(1115,'태평순대','음식점','국밥'),(1116,'선미식당','음식점','국밥'),(1117,'옛날통닭','음식점','치킨/피자'),(1118,'별다방','카페','커피'),(1119,'한양정육점','청과물/육류','육류'),(1120,'싱싱청과물','청과물/육류','청과물');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 20:28:40
