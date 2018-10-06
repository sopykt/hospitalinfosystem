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
-- Table structure for table `booking`
--
Use db_prs;
DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `bookingtime` datetime NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`bid`),
  KEY `pid_idx` (`pid`),
  KEY `did_idx` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,18,4,'1984-09-11 10:10:00','2018-09-17 22:01:13','2018-09-17 22:01:13'),(2,18,7,'2018-09-14 13:34:43','2018-09-17 22:02:08','2018-09-17 22:02:08'),(3,18,4,'2018-09-14 13:34:43','2018-09-17 22:02:42','2018-09-17 22:02:42'),(4,24,7,'2018-09-14 13:34:43','2018-09-17 22:07:22','2018-09-17 22:07:22'),(5,21,9,'2018-09-14 13:34:43','2018-09-17 22:10:36','2018-09-17 22:10:36'),(6,21,4,'2018-09-14 13:34:43','2018-09-17 22:12:01','2018-09-17 22:12:01'),(7,21,8,'2018-09-14 13:34:43','2018-09-17 22:12:56','2018-09-17 22:12:56'),(8,24,8,'2018-09-18 06:15:26','2018-09-18 08:15:26','2018-09-18 08:15:26'),(9,12,11,'2018-09-18 06:35:42','2018-09-18 08:35:42','2018-09-18 08:35:42'),(10,24,8,'2018-09-18 16:00:08','2018-09-18 18:00:08','2018-09-18 18:00:08'),(11,27,7,'2018-09-18 18:26:01','2018-09-18 20:26:01','2018-09-18 20:26:01'),(12,27,12,'2018-09-18 18:43:03','2018-09-18 20:43:03','2018-09-18 20:43:03'),(13,27,4,'2018-09-18 18:49:59','2018-09-18 20:49:59','2018-09-18 20:49:59'),(14,27,10,'2018-09-18 18:53:04','2018-09-18 20:53:04','2018-09-18 20:53:04'),(15,27,4,'2018-09-18 19:04:39','2018-09-18 21:04:39','2018-09-18 21:04:39'),(16,27,7,'2018-09-18 19:06:28','2018-09-18 21:06:28','2018-09-18 21:06:28'),(17,27,8,'2018-09-18 19:06:45','2018-09-18 21:06:45','2018-09-18 21:06:45'),(18,27,9,'2018-09-18 21:08:16','2018-09-18 21:08:16','2018-09-18 21:08:16'),(19,27,10,'2018-09-18 21:10:37','2018-09-18 21:10:37','2018-09-18 21:10:37'),(20,27,12,'2018-09-18 23:01:05','2018-09-18 23:01:05','2018-09-18 23:01:05'),(21,32,10,'2018-09-18 23:41:16','2018-09-18 23:41:16','2018-09-18 23:41:16'),(22,32,10,'2018-09-18 23:42:56','2018-09-18 23:42:56','2018-09-18 23:42:56'),(23,33,10,'2018-09-19 06:48:47','2018-09-19 06:48:47','2018-09-19 06:48:47'),(24,27,38,'2018-09-20 03:33:42','2018-09-20 03:33:42','2018-09-20 03:33:42'),(25,35,39,'2018-09-20 23:45:34','2018-09-20 23:45:34','2018-09-20 23:45:34'),(26,24,4,'2018-09-21 00:09:53','2018-09-21 00:09:53','2018-09-21 00:09:53'),(27,24,18,'2018-09-27 18:40:36','2018-09-27 18:40:36','2018-09-27 18:40:36'),(28,24,12,'2018-09-27 18:44:18','2018-09-27 18:44:18','2018-09-27 18:44:18'),(29,24,23,'2018-09-27 18:46:37','2018-09-27 18:46:37','2018-09-27 18:46:37'),(30,39,41,'2018-09-27 19:55:02','2018-09-27 19:55:02','2018-09-27 19:55:02'),(31,42,43,'2018-09-28 02:26:40','2018-09-28 02:26:40','2018-09-28 02:26:40'),(32,46,48,'2018-09-28 02:39:44','2018-09-28 02:39:44','2018-09-28 02:39:44'),(33,48,49,'2018-09-28 02:51:41','2018-09-28 02:51:41','2018-09-28 02:51:41'),(34,19,44,'2018-09-28 03:00:47','2018-09-28 03:00:47','2018-09-28 03:00:47'),(35,50,44,'2018-09-28 05:48:35','2018-09-28 05:48:35','2018-09-28 05:48:35'),(36,48,47,'2018-09-28 07:25:51','2018-09-28 07:25:51','2018-09-28 07:25:51'),(37,41,46,'2018-09-28 07:31:48','2018-09-28 07:31:48','2018-09-28 07:31:48'),(38,11,43,'2018-09-28 07:36:01','2018-09-28 07:36:01','2018-09-28 07:36:01'),(39,49,43,'2018-09-28 07:38:02','2018-09-28 07:38:02','2018-09-28 07:38:02'),(40,42,44,'2018-09-28 09:12:00','2018-09-28 09:12:00','2018-09-28 09:12:00');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,9,'M.B.,B.S(YGN), M.Med.,Sc(Micro)','Neurologist','','2018-09-12 15:22:04','2018-09-28 01:56:39',0,0,0,1,1,1,0,'18:00:00','20:00:00'),(13,29,'MBBS','OG','test','2018-09-16 22:32:13','2018-09-16 22:32:13',1,1,0,0,0,0,0,'10:30:00','11:30:00'),(27,54,'MBBS','general physician','','2018-09-18 20:25:21','2018-09-27 22:16:45',1,1,1,1,0,0,0,'15:30:00','16:00:00'),(38,102,'M.B.,B.S, M.Med.Sc(Int.Med), Internal Medicin','General Physician &amp; Endocrinologist','','2018-09-27 19:30:14','2018-09-27 19:30:14',1,1,1,1,1,1,1,'16:00:00','19:00:00'),(39,103,'B.D.S(Ygn), MDSc, F.I.C.D','Dentist','','2018-09-27 19:36:47','2018-09-27 19:36:47',1,1,1,0,0,1,1,'17:00:00','20:00:00'),(41,105,'M.B.B.S, M.Med.Sc(Int.Med), M.R.C.P(UK), M.Sc','Cardiologists','','2018-09-27 19:43:25','2018-09-28 07:34:14',0,0,0,0,1,1,1,'12:04:13','12:04:13'),(42,106,'M.B.B.S, M.Med.Sc(Int.Med), M.R.C.P(UK), F.R.','Chest Physician','','2018-09-27 19:48:12','2018-09-27 19:48:12',0,1,0,1,0,1,0,'15:00:00','17:00:00'),(43,107,'M.B.B.S, M,Med.Sc(Surgery), F.R.C.S(Glasgow)','Neurosurgeons','','2018-09-27 19:54:21','2018-09-27 19:54:21',0,1,0,1,0,1,0,'14:30:00','17:50:00'),(45,110,'M.B.B.S, M.Med.Sc(Medical Oncology)','Oncologists','','2018-09-28 01:55:25','2018-09-28 01:55:25',0,0,0,1,1,1,0,'14:00:00','17:00:00'),(46,111,'M,.B.B.S, M.Med.Sc(Paed)','Paediatrician','','2018-09-28 02:00:29','2018-09-28 02:00:29',1,1,0,0,0,1,0,'12:00:00','15:00:00'),(48,113,'M.B.B.S, M.Med.Sc(mental health)','Psychiatrist','','2018-09-28 02:05:29','2018-09-28 02:05:55',0,0,1,1,1,1,0,'06:35:55','06:35:55'),(49,114,'M.B.B.S, M.Med.Sc(Radiology),EYGH','Radiologist','','2018-09-28 02:08:54','2018-09-28 02:08:54',0,1,0,0,1,1,0,'15:00:00','17:00:00'),(50,115,'M.B.B.S, M.Med.Sc(Surgery), F.R.C.S(Edin), Dr','Cardiac and vascular surgeon','','2018-09-28 02:13:15','2018-09-28 02:13:15',0,1,0,1,0,1,0,'17:00:00','20:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (41,100,'00000001','B+','160',146,'2018-09-27 19:19:41','2018-09-27 19:19:41'),(43,109,'00000002','A','140',180,'2018-09-27 23:56:17','2018-09-27 23:56:17'),(44,116,'00000003','B-','170',156,'2018-09-28 02:14:40','2018-09-28 02:15:29'),(45,117,'00000004','B-','140',150,'2018-09-28 02:16:31','2018-09-28 02:16:31'),(46,118,'00000005','B+','170',154,'2018-09-28 02:17:48','2018-09-28 02:17:48'),(47,119,'00000006','O','120',150,'2018-09-28 02:19:02','2018-09-28 02:19:02'),(48,120,'00000007','B-','40',56,'2018-09-28 02:20:49','2018-09-28 02:20:49'),(49,121,'00000008','A','178',157,'2018-09-28 02:23:02','2018-09-28 02:23:02'),(50,122,'00000009','AB','180',156,'2018-09-28 02:24:28','2018-09-28 02:24:28'),(51,123,'00000010','O','130',160,'2018-09-28 02:26:02','2018-09-28 02:26:02');
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
INSERT INTO `role` VALUES (1,'Administrator'),(2,'Doctor'),(3,'Pharmacist'),(4,'Cashier'),(5,'Staff'),(6,'Patient');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `history` longtext,
  `treatment` longtext,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `issuepharm` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1,4,18,'Headage','Biogesic','2018-09-18 00:52:22','2018-09-18 00:52:22',1),(2,9,37,'Pain bone','Biogesic,\nSeloxogen','2018-09-18 00:57:00','2018-09-18 00:57:00',1),(3,8,37,'sdfsfs sdfsdfsdf sdfs','sfsdf sdfsdf','2018-09-18 01:10:57','2018-09-18 01:10:57',0),(4,4,37,'dsfs asfsdfs','sdfsdfsfds','2018-09-18 12:00:33','2018-09-18 12:00:33',0),(5,4,37,'dsfs asfsdfs','sdfsdfsfds','2018-09-18 12:05:08','2018-09-18 12:05:08',0),(6,4,37,'trbert ertert ertert rtyerte','gdfg ertd\nfhfg fh t 5/10 5 day\nnfghffhhf','2018-09-18 12:08:00','2018-09-18 12:08:00',1),(7,10,54,'hvoueygoeyg','ccdlifyruigryogh','2018-09-18 23:08:57','2018-09-18 23:08:57',1),(8,12,54,'Pain labour','Biogesic, Surogen, Micro','2018-09-18 23:32:50','2018-09-18 23:32:50',1),(9,41,103,'akf lslfsla sldf','ldsfsldf dsfs','2018-09-27 23:00:00','2018-09-27 23:00:00',0),(10,44,115,'Headache','Biogesic','2018-09-28 06:00:25','2018-09-28 06:00:25',1),(11,43,106,'Stomach Pain','Kramal S','2018-09-28 06:02:32','2018-09-28 06:02:32',0),(12,49,113,'Hypertension','Amlodipine 10 mg od, folic acid, B6, atorvastatin 10 mg HS','2018-09-28 07:28:35','2018-09-28 07:28:35',1),(13,49,113,'Acute Bronchitis','Para, Denzo, Cephalexin 500 mg, Cough tablet, Vitacee','2018-09-28 07:29:44','2018-09-28 07:29:44',0),(14,44,115,'Colle\'s Fracture (Rt)','Inj. IM Diclo stat, Ampiclox, Aceclofenac 100 mg BD, X\' Ray, Refer to Hospita','2018-09-28 07:42:01','2018-09-28 07:42:01',0);
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'ARC2_2222','arc2@mail.com','1234567','0000-00-00','Yangon',0,'eefec26f83fbc8318a6af7c3c9b07ec9','2018-09-11 04:56:01','2018-09-18 19:57:03',1),(9,'admin11','admin11@mail.com','1234567','1999-01-01','Yangon',0,'e00cf25ad42683b3df678c61f42c6bda','2018-09-11 06:58:04','2018-09-28 01:56:39',2),(29,'Dr. Win Win Mya','win@mail.com','959884455','1960-04-04','Hlaing',1,'0b08bd98d279b88859b628cd8c061ae0','2018-09-16 22:32:13','2018-09-16 22:32:13',2),(50,'ARC1_1234','arc1@mail.com','1234567','1998-12-29','Yangon',0,'d41d8cd98f00b204e9800998ecf8427e','2018-09-18 18:45:31','2018-09-19 15:54:19',1),(53,'test2','test2@mail.com','3434234','1980-05-03','Yangon',1,'ad0234829205b9033196ba818f7a872b','2018-09-18 19:04:44','2018-09-18 19:06:36',3),(54,'Daw Nu Nu Maw','nunumaw@gmail.com','1234567','1978-02-06','insein',1,'a63135edc7ed5ad32511a4dbbdf0c5b6','2018-09-18 20:25:21','2018-09-27 22:16:45',2),(67,'sawsaw','sawsaw@gmail.com','123567','1999-11-20','nlha',1,'5ae610a1be26097586aa39838366a7b3','2018-09-18 22:51:26','2018-09-18 22:51:26',5),(78,'sawsaw','sawsaw@gmail.com','123456','1996-04-11','north dagon',1,'5ae610a1be26097586aa39838366a7b3','2018-09-19 06:22:49','2018-09-19 06:22:49',5),(88,'mg gyi','gyi@mail.com','342342','1980-04-23','dfsdfs',0,'e33dbc09571ff0f9d52df015827289a5','2018-09-19 15:55:02','2018-09-19 15:55:18',3),(93,'chuu','chuu@gmail.com','9594565677','1996-12-05','huli',1,'729747d48431ec61dd3471fcb62e7695','2018-09-20 23:40:04','2018-09-20 23:40:04',5),(97,'kyi','kyi@gmail.com','0987654','1996-02-12','khk',1,'3041d0ac4f8165f3a3c971bf7769a797','2018-09-20 23:44:19','2018-09-20 23:44:19',3),(100,'U Htun Htun','','959445681481','1956-02-11','Yankin , Yangon',0,'d41d8cd98f00b204e9800998ecf8427e','2018-09-27 19:19:41','2018-09-27 20:30:31',6),(102,'Dr. Tet Tun Chit','tettunchit@gmail.com','959441023864','1975-04-12','SanChaung',0,'367040a0528e1721b88eae773a2dfd03','2018-09-27 19:30:14','2018-09-27 19:30:14',2),(103,'Dr. Aye Mya Thida','ayemyathida@gmail.com','959781023443','1958-08-23','Tarmwae',1,'637b2a9f5a01cb595a43bee25909d465','2018-09-27 19:36:47','2018-09-27 19:36:47',2),(105,'Prof. Nwe Nwe','nwenwe@gmailcom','959445672181','1950-05-23','South Oaklar Township',1,'682c45fc3d9587aa9c87aa482cf60cce','2018-09-27 19:43:25','2018-09-28 07:34:14',2),(106,'Prof. Yee Yee Naing','yeeyeenaing@gmail.com','959448017659','1964-03-25','Kyimyintdaing',1,'679bc3040c2e709be53e854a3c05e2d6','2018-09-27 19:48:12','2018-09-27 19:48:12',2),(107,'Dr. Maung Thant','maungthant@gmail.com','959245678954','1955-05-05','Bahan Township',0,'c2df80c972956c5300721d0ff392bf70','2018-09-27 19:54:21','2018-09-27 19:54:21',2),(109,'U Myo Aung','','898979790','1980-02-25','fdlfkjslf',0,'d41d8cd98f00b204e9800998ecf8427e','2018-09-27 23:56:17','2018-09-27 23:56:17',6),(110,'Dr. Myo Khine','myokhine@gmail.com','959457639665','1956-06-06','North Dagon',0,'cb9ef64b0bda5a5b5a572ffc5e1120b5','2018-09-28 01:55:25','2018-09-28 01:55:25',2),(111,'Dr. Chaw Su Hlaing','chawsuhlaing@gmail.com','9595104213','1975-08-07','Yankin',1,'06bb30fe05200b5852e715227ce7e506','2018-09-28 02:00:29','2018-09-28 02:00:29',2),(113,'Dr Shin Shin Mon','shinshinmon@gmail.com','959420150876','1958-03-31','Kyout Myoung',1,'56ce87d294a6b7ac054537ce67b02559','2018-09-28 02:05:29','2018-09-28 02:05:55',2),(114,'Dr Khine Ye Mon','khineyemon@gmail.com','959453219765','1971-04-23','Bago',1,'a3809c944dff90a61d0a299ee8925b4b','2018-09-28 02:08:54','2018-09-28 02:08:54',2),(115,'Dr Win Win Kyaw','winwinkyaw@gmail.com','986742335','1969-05-06','Dawpon',1,'f0325cabeaeb6b588520adecf4119caf','2018-09-28 02:13:15','2018-09-28 02:13:15',2),(116,'U Win Sein','','959424130843','1978-03-30','Yangon',0,'d41d8cd98f00b204e9800998ecf8427e','2018-09-28 02:14:40','2018-09-28 02:15:29',6),(117,'Daw Thida','','98765433','1960-04-04','North Dagon',1,'d41d8cd98f00b204e9800998ecf8427e','2018-09-28 02:16:31','2018-09-28 02:16:31',6),(118,'Daw Mya Thet','','959453219664','1968-09-09','Inndakaw',1,'d41d8cd98f00b204e9800998ecf8427e','2018-09-28 02:17:48','2018-09-28 02:17:48',6),(119,'Ma Yuya','','95022457654','1999-04-04','north oakalar',1,'d41d8cd98f00b204e9800998ecf8427e','2018-09-28 02:19:02','2018-09-28 02:19:02',6),(120,'Mg Kaung Wai Yan','','95944718141','2016-02-21','Sanchaung',0,'d41d8cd98f00b204e9800998ecf8427e','2018-09-28 02:20:49','2018-09-28 02:20:49',6),(121,'Daw Aye Aye','','959457802335','1969-04-18','Pazundaung',1,'d41d8cd98f00b204e9800998ecf8427e','2018-09-28 02:23:02','2018-09-28 02:23:02',6),(122,'U Soe Hlaing','','956785422','1959-05-05','Yankin',0,'d41d8cd98f00b204e9800998ecf8427e','2018-09-28 02:24:28','2018-09-28 02:24:28',6),(123,'Ma Thaw Thaw','','95942811956','1993-03-31','South Oakalar',1,'d41d8cd98f00b204e9800998ecf8427e','2018-09-28 02:26:02','2018-09-28 02:26:02',6),(125,'Yuwah','yuwah@gmail.com','959457209665','1996-06-06','tharkayta',1,'a621af95be57b8530071a88be48f48d1','2018-09-28 02:55:03','2018-09-28 02:55:03',5),(126,'Thuzar','thuzar@gmail.com','9597845677','1996-05-05','north dagon',1,'71d3654f8922dcc7f2e4bf8ac8bb2ff7','2018-09-28 02:57:26','2018-09-28 02:57:26',3);
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

-- Dump completed on 2018-10-05 16:03:26
