CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_customerID` varchar(45) NOT NULL,
  `Iid` varchar(45) DEFAULT NULL,
  `Iname` varchar(45) DEFAULT NULL,
  `Iprice` int DEFAULT NULL,
  `num` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`,`customer_customerID`),
  KEY `fk_cart_customer1_idx` (`customer_customerID`),
  CONSTRAINT `fk_customerID` FOREIGN KEY (`customer_customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` varchar(45) NOT NULL,
  `passwords` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `nickname` char(20) DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1043843535','aoe8223106','13269111120','1043843535@qq.com','123'),('123','123','13269111120','964512pb@nf369.com','1234'),('1234','123','13269111120','1111113333','12345'),('3120543','202cb962ac59075b964b07152d234b70','13263184954','2018212981@bupt.edu.cn','1232');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `Iid` varchar(45) NOT NULL,
  `superclass` varchar(45) DEFAULT NULL,
  `subclass` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `USER_Uid` varchar(45) NOT NULL,
  `Ltime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Iid`,`USER_Uid`),
  KEY `fk_ITEM_USER1_idx` (`USER_Uid`),
  CONSTRAINT `fk_item_user1` FOREIGN KEY (`USER_Uid`) REFERENCES `user` (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('001','Piano',NULL,'20','QAQ',NULL,'001','2014-09-02 13:59:07'),('002','Piano',NULL,'40','OPO',NULL,'001','2014-09-03 13:59:07'),('003','Piano',NULL,'10','SDS',NULL,'001','2014-02-04 13:59:07'),('004','Piano',NULL,'44','DCX',NULL,'001','2014-09-04 13:29:07'),('005','Piano',NULL,'42','ASX',NULL,'001','2014-09-04 13:59:02'),('006','Piano',NULL,'12','VVV',NULL,'001','2014-09-04 13:19:07'),('007','guitar',NULL,'56','DER',NULL,'001','2014-09-04 23:59:07'),('008','guitar',NULL,'88','WW',NULL,'001','2014-09-04 14:59:07'),('009','guitar',NULL,'56','SDF',NULL,'001','2014-09-04 11:59:07'),('010','violin',NULL,'150','OMD',NULL,'002','2020-09-04 11:59:07'),('011','violin',NULL,'215','JKL',NULL,'002','2020-09-30 11:59:07'),('012','violin',NULL,'2','UNMD',NULL,'002','2020-09-04 11:59:07'),('013','violin',NULL,'777','WDD',NULL,'002','2010-09-04 11:59:07');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_order`
--

DROP TABLE IF EXISTS `item_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_order` (
  `Iid` varchar(45) NOT NULL,
  `Oid` int NOT NULL,
  `Uid` varchar(45) NOT NULL,
  `Iname` varchar(45) DEFAULT NULL,
  `num` int NOT NULL,
  `Iprice` int DEFAULT NULL,
  PRIMARY KEY (`Iid`,`Oid`,`Uid`),
  KEY `fk_ITEM_has_USER_USER1_idx` (`Uid`),
  KEY `fk_ITEM_has_USER_ITEM1_idx` (`Iid`),
  KEY `fk_oID_idx` (`Oid`),
  CONSTRAINT `fk_ITEM_has_USER` FOREIGN KEY (`Uid`) REFERENCES `user` (`Uid`),
  CONSTRAINT `fk_item_orderID` FOREIGN KEY (`Oid`) REFERENCES `my_order` (`Oid`),
  CONSTRAINT `fk_my_order_item1` FOREIGN KEY (`Iid`) REFERENCES `item` (`Iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_order`
--

LOCK TABLES `item_order` WRITE;
/*!40000 ALTER TABLE `item_order` DISABLE KEYS */;
INSERT INTO `item_order` VALUES ('001',7,'001','QAQ',10,20),('001',8,'001','QAQ',10,20),('001',12,'001','QAQ',1,20),('002',7,'001','OPO',5,40),('002',8,'001','OPO',5,40),('002',12,'001','OPO',1,40),('002',16,'001','OPO',1,40),('003',7,'001','SDS',2,10),('003',8,'001','SDS',2,10),('003',16,'001','SDS',1,10),('005',11,'001','ASX',2,42),('006',10,'001','VVV',1,12),('006',11,'001','VVV',3,12),('013',13,'001','WDD',1,777),('013',14,'001','WDD',1,777),('013',15,'001','WDD',1,777),('013',16,'001','WDD',1,777);
/*!40000 ALTER TABLE `item_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_order`
--

DROP TABLE IF EXISTS `my_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_order` (
  `Oid` int NOT NULL AUTO_INCREMENT,
  `customer_customerID` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `Otime` varchar(45) NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Oid`,`customer_customerID`),
  KEY `customer_customerID_idx` (`customer_customerID`),
  CONSTRAINT `customer_customerID` FOREIGN KEY (`customer_customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_order`
--

LOCK TABLES `my_order` WRITE;
/*!40000 ALTER TABLE `my_order` DISABLE KEYS */;
INSERT INTO `my_order` VALUES (7,'123','XIAN',420,'2020-05-07 09:18:15','chenyu','liu','13098287517'),(8,'123','&#35199;&#22303;&#22478;10&#21495;',420,'2019-05-07 09:27:19','chenyu','liu','13269111120'),(10,'123','&#21271;&#37038;',12,'2020-07-05 10:38:58','chenyu','liu','13269111120'),(11,'1043843535','&#25764;&#30889;',2451,'2020-07-05 11:03:39','shuojie','wang','11111111111'),(12,'123','&#35199;&#22303;&#22478;10&#21495;',60,'2020-07-05 11:41:35','chenyu','liu','13269111120'),(13,'123','&#35199;&#22303;&#22478;10&#21495;',777,'2020-07-05 14:28:13','chenyu','liu','13269111120'),(14,'123','&#35199;&#22303;&#22478;10&#21495;',777,'2020-07-05 14:29:28','chenyu','liu','13269111120'),(15,'123','&#35199;&#22303;&#22478;10&#21495;',777,'2020-07-05 14:43:55','chenyu','liu','13269111120'),(16,'123','&#35199;&#22303;&#22478;10&#21495;',827,'2020-07-05 14:46:06','chenyu','liu','13269111120');
/*!40000 ALTER TABLE `my_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Uid` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `permit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('001','123',NULL),('002','123',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-09 17:59:03
