-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_prs
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.16-MariaDB

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
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `degree` varchar(45) NOT NULL,
  `speciality` varchar(250) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `day0` int(11) DEFAULT NULL,
  `day1` int(11) DEFAULT NULL,
  `day2` int(11) DEFAULT NULL,
  `day3` int(11) DEFAULT NULL,
  `day4` int(11) DEFAULT NULL,
  `day5` int(11) DEFAULT NULL,
  `day6` int(11) DEFAULT NULL,
  `stime` time DEFAULT NULL,
  `etime` time DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `uid` (`uid`),
  CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,9,'M.B.,B.S(YGN), M.Med.,Sc(Micro)','Neurologist','','2018-09-12 15:22:04','2018-09-12 15:22:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,17,'M.B.,B.S , M.R.C.P(UK)','Surgery(Neuro)','','2018-09-12 22:37:16','2018-09-13 22:10:28',1,0,0,1,0,1,0,'10:30:00','12:00:00'),(11,18,'M.B.,B.S , M.R.C.P(Surgery),FRCS(Edin)','Paediatric Surgeons','','2018-09-13 22:13:59','2018-09-13 22:17:42',0,1,1,1,1,1,0,'11:30:00','13:00:00'),(12,28,'MBBS','Pathyo','','2018-09-16 22:27:21','2018-09-16 22:27:21',0,0,1,1,0,0,0,'13:00:00','00:00:00'),(13,29,'MBBS','OG','test','2018-09-16 22:32:13','2018-09-16 22:32:13',1,1,0,0,0,0,0,'10:30:00','11:30:00'),(14,30,'MBBS','Bone','','2018-09-16 22:34:35','2018-09-16 22:34:35',0,1,0,1,0,0,0,'11:30:00','13:00:00'),(15,31,'M.B.B.s','Child','','2018-09-16 22:45:59','2018-09-16 22:45:59',0,0,0,0,1,1,0,'11:10:00','12:00:00'),(16,32,'M.BBS','Child','','2018-09-16 22:48:06','2018-09-16 22:48:06',0,0,0,0,1,0,0,'11:00:00','13:00:00'),(17,33,'M.B.B.se','general','','2018-09-16 22:49:51','2018-09-16 22:49:51',0,1,0,0,0,0,0,'07:00:00','08:00:00');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `bloodtype` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL COMMENT 'lb',
  `height` int(11) DEFAULT NULL COMMENT 'cm',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `uid_idx` (`uid`),
  CONSTRAINT `userid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (4,22,'00000001','B','150',160,'2018-09-14 06:47:50','2018-09-14 06:47:50'),(7,25,'00000003','O','230',150,'2018-09-14 07:51:00','2018-09-14 13:33:53'),(8,26,'00000004','O','230',150,'2018-09-14 13:34:43','2018-09-14 13:34:43');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `regdate` datetime NOT NULL,
  `regcode` varchar(250) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `did` (`did`),
  KEY `pid` (`pid`),
  CONSTRAINT `did` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role` int(11) NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrator'),(2,'Doctor'),(3,'Pharmist'),(4,'Cashier'),(5,'Staff'),(6,'Patient');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) NOT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(250) NOT NULL,
  `gender` int(11) NOT NULL,
  `password` varchar(250) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `role` (`role`),
  CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role` (`role`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'ARC1','arc1@mail.com','1234567','1999-01-01','Yangon',0,'296ade920a676bdc3881b2005d3e999b','2018-09-11 04:16:40','2018-09-11 04:16:40',1),(3,'ARC2','arc2@mail.com','1234567','1999-01-01','Yangon',0,'eefec26f83fbc8318a6af7c3c9b07ec9','2018-09-11 04:56:01','2018-09-11 04:56:01',1),(9,'admin1','admin1@mail.com','1234567','1999-01-01','Yangon',0,'e00cf25ad42683b3df678c61f42c6bda','2018-09-11 06:58:04','2018-09-11 06:59:07',2),(17,'Dr.Soe Paing KT','sopykt@gmail.com','222333444','1984-09-11','Yangon',0,'7088660367c0304ff51a5c8b97f809ac','2018-09-12 22:37:16','2018-09-13 22:10:28',2),(18,'Prof. Htoo Han','htoohan@gmail.com','222333444','1984-09-11','Yangon',0,'d19241550b0a0087b4c65fe73491d7f5','2018-09-13 22:13:59','2018-09-13 22:17:42',2),(22,'U Hla','','222333444','1984-09-11','Yangon',0,'d41d8cd98f00b204e9800998ecf8427e','2018-09-14 06:47:50','2018-09-14 06:47:50',6),(25,'Daw Win Win','','9998887776','1984-09-11','Hlaing',1,'d41d8cd98f00b204e9800998ecf8427e','2018-09-14 06:54:28','2018-09-14 13:33:53',6),(26,'Daw Win Win','','9998887776','1984-09-11','Hlaing',1,'d41d8cd98f00b204e9800998ecf8427e','2018-09-14 13:34:43','2018-09-14 13:34:43',6),(27,'Sann Sann','sann@mail.com','959222333444','1980-08-09','Yangon',1,'44e5d2a87a4d43fd72dc9be25ca3a44c','2018-09-16 21:00:42','2018-09-16 21:00:42',5),(28,'Dr.Kyaw Hla','kyaw@mail.com','959887766','1970-04-04','Yangon',0,'3c782fcc2d466fcce64f75e3ac09fb81','2018-09-16 22:27:21','2018-09-16 22:27:21',2),(29,'Dr. Win Win Mya','win@mail.com','959884455','1960-04-04','Hlaing',1,'0b08bd98d279b88859b628cd8c061ae0','2018-09-16 22:32:13','2018-09-16 22:32:13',2),(30,'Dr. Hein','hein@mail.com','9598876543','1980-04-04','Kamayut',0,'817bc3184ef8b40cd73695fa4c05cc84','2018-09-16 22:34:35','2018-09-16 22:34:35',2),(31,'Dr.Hnin','hnin@mail.com','959448372','1980-05-05','Yangon',1,'42debe1e703501935aa2bd50b81acd60','2018-09-16 22:45:59','2018-09-16 22:45:59',2),(32,'Dr.Ei','ei@mail.com','959765433','1980-03-07','Yangon',1,'1ee2225a0118c6a8ff464cf2926cf352','2018-09-16 22:48:06','2018-09-16 22:48:06',2),(33,'Dr.Mgmg','mgmg@mail.com','9594238492','1979-04-05','slfsldf',0,'ab7057eed74eef5e9f230a27af9788c2','2018-09-16 22:49:51','2018-09-16 22:49:51',2);
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

-- Dump completed on 2018-09-17  3:25:00
