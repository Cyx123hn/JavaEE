-- MySQL dump 10.13  Distrib 5.7.25, for Win32 (AMD64)
--
-- Host: localhost    Database: p2c
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `inventory` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `type_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'m1','小米9','2999','红/白/黑','4100','上架','m2'),(2,'m2','小米6','2499','红/白/黑','199','上架','m2'),(3,'tv1','小米高清电视','1699','14.0','264','上架','dianshi1501'),(4,'lu1','小米路由器','199','200M带宽','645','上架','lu1'),(5,'mb1','小米笔记本','5000','15.6','54','上架','miBen'),(6,'sao1','扫地机器人1','6799','清理灰尘','123','上架','jia1');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_img`
--

DROP TABLE IF EXISTS `goods_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_code` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_img`
--

LOCK TABLES `goods_img` WRITE;
/*!40000 ALTER TABLE `goods_img` DISABLE KEYS */;
INSERT INTO `goods_img` VALUES (1,'m2','74939565-5f4d-4461-b80c-e215fea1eb7b.jpg','1'),(2,'tv1','f06b2a80-2005-4cba-a3ce-15628ee4a5df.jpg','2'),(3,'tv1','04898d50-8a2d-4cc9-8da3-2a3f370b2b8e.jpg','1'),(4,'m1','e158ba9f-8ad5-41e6-9af9-9927ca2af96e.jpg','2'),(5,'m1','e6b29fae-ef31-48d2-8d26-26721f1706ee.jpg','1'),(6,'mb1','4f557d4d-6d81-42ec-97a0-babb7e9536bd.jpg','1'),(7,'mb1','0f834d67-b7e7-46e1-8c05-b42bb853a0c3.jpg','2'),(8,'mb1','196a9e80-03a8-4b79-95ec-1b63d072c9ab.jpg','2'),(9,'lu1','cbad0c04-c1e6-4570-8b2f-55fe3bd43a98.jpg','1'),(10,'lu1','37ebcc33-67d7-4281-8645-088b8d8c0e93.jpg','2'),(11,'sao1','61e9500e-8edf-4cea-b030-93825106ed62.jpg','1');
/*!40000 ALTER TABLE `goods_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_type`
--

DROP TABLE IF EXISTS `goods_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `descr` varchar(45) DEFAULT NULL,
  `parentcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_type`
--

LOCK TABLES `goods_type` WRITE;
/*!40000 ALTER TABLE `goods_type` DISABLE KEYS */;
INSERT INTO `goods_type` VALUES (1,'type1','一级分类','一级分类上级','type0'),(2,'jiadian','家电','一级分类','type1'),(3,'shouji','手机','一级分类','type1'),(4,'luyouqi','路由器','一级分类','type1'),(5,'bijiben','笔记本','一级分类','type1'),(6,'m2','小米手机','二级分类','shouji'),(7,'lu1','小米路由器2','二级分类','luyouqi'),(8,'miBen','小米游戏本','二级分类','bijiben'),(9,'jia1','扫地机器人','二级分类','jiadian'),(10,'dianshi1501','电视','二级分类','jiadian');
/*!40000 ALTER TABLE `goods_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `user_code` varchar(45) DEFAULT NULL,
  `entryTime` timestamp NULL DEFAULT NULL,
  `type_code` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'e19219f5-48c1-4905-8fd3-1cb3e037b654','1501',NULL,'','未发货'),(2,'0e4ef35c-4702-442a-be98-2daf79c39c65','1501',NULL,'','未发货'),(3,'a78c4dfb-36c6-48a9-ac46-90b9113bc5a8','1501',NULL,'','未发货'),(4,'cc8cdbad-6b8e-4b32-bec4-b7b7a8c54338','1502','2019-06-30 16:00:00','山东科技大学','未发货'),(5,'b2bc4993-dce0-486e-8310-1229fe08c481','1502','2019-07-01 03:47:02','青岛农业大学','未发货'),(7,'0cbd2d09-9ce6-4507-b61c-acedc291b862','1502','2019-07-01 08:18:10','','未发货'),(8,'35fd9ad2-1072-4b71-b4d0-55817e4cc3c5','1501','2019-07-01 09:07:39','山东科技大学','未发货');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_car`
--

DROP TABLE IF EXISTS `order_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(45) DEFAULT NULL,
  `goods_code` varchar(45) DEFAULT NULL,
  `num` varchar(45) DEFAULT NULL,
  `subtotal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_car`
--

LOCK TABLES `order_car` WRITE;
/*!40000 ALTER TABLE `order_car` DISABLE KEYS */;
INSERT INTO `order_car` VALUES (9,'','m1','2','5998'),(14,'','m2','1','2499');
/*!40000 ALTER TABLE `order_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_goods`
--

DROP TABLE IF EXISTS `order_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(45) DEFAULT NULL,
  `goods_code` varchar(45) DEFAULT NULL,
  `num` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_goods`
--

LOCK TABLES `order_goods` WRITE;
/*!40000 ALTER TABLE `order_goods` DISABLE KEYS */;
INSERT INTO `order_goods` VALUES (1,'37009d52-eed5-4413-9ff3-8289c2a3acb0','m2','1','2499'),(2,'e19219f5-48c1-4905-8fd3-1cb3e037b654','m2','1','2499'),(3,'0e4ef35c-4702-442a-be98-2daf79c39c65','m2','1','2499'),(4,'a78c4dfb-36c6-48a9-ac46-90b9113bc5a8','m2','1','2499'),(5,'cc8cdbad-6b8e-4b32-bec4-b7b7a8c54338','m2','1','2499'),(6,'b2bc4993-dce0-486e-8310-1229fe08c481','sao1','1','6799'),(7,'5fbf7e1b-fd80-4a48-97b2-295418c1e254','mb1','1','5000'),(8,'5fbf7e1b-fd80-4a48-97b2-295418c1e254','sao1','1','6799'),(9,'0cbd2d09-9ce6-4507-b61c-acedc291b862','m1','1','2999'),(10,'0cbd2d09-9ce6-4507-b61c-acedc291b862','m2','1','2499'),(11,'0cbd2d09-9ce6-4507-b61c-acedc291b862','lu1','1','199'),(12,'35fd9ad2-1072-4b71-b4d0-55817e4cc3c5','mb1','1','5000');
/*!40000 ALTER TABLE `order_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `admin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1501','陈洋(管理员)','lPOzoW2M4GTICLFr7lADxQ==','是'),(2,'1502','陈洋','lPOzoW2M4GTICLFr7lADxQ==','否');
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

-- Dump completed on 2019-07-13 12:58:08
