CREATE DATABASE  IF NOT EXISTS `fcc_book_trading_club` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fcc_book_trading_club`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: fcc_book_trading_club
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `btcapp_books`
--

DROP TABLE IF EXISTS `btcapp_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `btcapp_books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(100) CHARACTER SET latin1 NOT NULL,
  `isbn` char(13) DEFAULT NULL,
  `thumbnail_url` varchar(200) DEFAULT NULL,
  `issuer_user_id` int(10) unsigned DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `btcapp_books`
--

LOCK TABLES `btcapp_books` WRITE;
/*!40000 ALTER TABLE `btcapp_books` DISABLE KEYS */;
INSERT INTO `btcapp_books` VALUES (26,2,'Cinderella','9780385408028','https://covers.openlibrary.org/b/id/2412035-M.jpg',NULL,NULL),(28,2,'The Hunger Games','9780439023481','https://covers.openlibrary.org/b/id/7890713-M.jpg',NULL,NULL),(30,2,'Eragon','9780375826689','https://covers.openlibrary.org/b/id/234012-M.jpg',NULL,NULL),(33,2,'Shiver','9780689823848','https://covers.openlibrary.org/b/id/435097-M.jpg',NULL,NULL),(34,2,'Delirium','9780786863419','https://covers.openlibrary.org/b/id/545522-M.jpg',4,1),(35,4,'Gone with the Wind','9780865546721','https://covers.openlibrary.org/b/id/656447-M.jpg',NULL,NULL);
/*!40000 ALTER TABLE `btcapp_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admin','Administrator'),(2,'members','General User');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('a2fafc917b8a6c2ae60746b6f490ceecbaa44ba5','::1',1487850877,'__ci_last_regenerate|i:1487850604;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|N;last_check|i:1487850623;'),('4e0473faaf85b23726396ed09edceda38dc2eb33','::1',1487855190,'__ci_last_regenerate|i:1487855190;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|N;last_check|i:1487850623;'),('0bc7267b003a888891d8c9cd0ff4817525b4d8dd','::1',1487952791,'__ci_last_regenerate|i:1487952533;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487850623\";last_check|i:1487952545;'),('facb0ffe0285d6341eca633a36aea40e7c336114','::1',1487953139,'__ci_last_regenerate|i:1487952915;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952545\";last_check|i:1487952921;'),('c311f5ff8a2d05f1ce6947235c33a8591faa7144','::1',1487953407,'__ci_last_regenerate|i:1487953294;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952545\";last_check|i:1487952921;'),('20567d01fa67c4dc901cb1a0172eee2fe8c206cd','::1',1487954808,'__ci_last_regenerate|i:1487954529;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952545\";last_check|i:1487952921;'),('11257a431679cc90235e0e4fffa58672bdc9fd33','::1',1487955109,'__ci_last_regenerate|i:1487954853;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952545\";last_check|i:1487952921;'),('31a0a3484a0c1aad8089d83d9e3d446d391303ad','::1',1487955413,'__ci_last_regenerate|i:1487955196;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952545\";last_check|i:1487952921;'),('23e5b6e3e2b1d60c4b9de92c910d6a27490a706e','::1',1488206674,'__ci_last_regenerate|i:1488206581;'),('578f1f894edc2def517fa807d6516bb5c818848e','::1',1488207445,'__ci_last_regenerate|i:1488207336;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952921\";last_check|i:1488207444;'),('f652c86a6664cbefae2100a2bc530dc879e46665','::1',1488207967,'__ci_last_regenerate|i:1488207854;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952921\";last_check|i:1488207444;'),('45c784df0ac33b6f73678135c9a5cf1c94953af7','::1',1488208393,'__ci_last_regenerate|i:1488208213;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952921\";last_check|i:1488207444;'),('1df608470eb9730cfd182a3a9d9f1f23feaab146','::1',1488208766,'__ci_last_regenerate|i:1488208541;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952921\";last_check|i:1488207444;'),('872571829e1bcc7d57b29a35554b09ffb5a34f4f','::1',1488209089,'__ci_last_regenerate|i:1488209070;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952921\";last_check|i:1488207444;'),('7f5c74b513a4fdbd5db0f0854da17c376c075ba3','::1',1488211635,'__ci_last_regenerate|i:1488211351;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952921\";last_check|i:1488207444;'),('0a125e93c042f10fd07c31d56b61ca295d330d13','::1',1488212260,'__ci_last_regenerate|i:1488211977;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952921\";last_check|i:1488207444;'),('0b46b273cd5de3c05cc699d30525e6e362dfe6fb','::1',1488213352,'__ci_last_regenerate|i:1488213313;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1487952921\";last_check|i:1488207444;'),('1a5782cb04b0834303d81c214fb7cfd35ef36392','::1',1488213393,'__ci_last_regenerate|i:1488213393;'),('8cb0a97c4a0462a0b1403f1a4e24ede08a6b9f42','::1',1488213472,'__ci_last_regenerate|i:1488213393;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488207444\";last_check|i:1488213401;'),('4b8ce278bb10506e9bbe3c13bdeeb2e7c467667e','::1',1488213772,'__ci_last_regenerate|i:1488213766;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488207444\";last_check|i:1488213401;'),('05e22834f467110f72d53c163b47b831fcbc447e','::1',1488273693,'__ci_last_regenerate|i:1488273637;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488213401\";last_check|i:1488273641;'),('32b2af26b96fc7575351835b862593664e3eaf87','::1',1488274503,'__ci_last_regenerate|i:1488274490;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488213401\";last_check|i:1488273641;'),('406d43d4b132d893377a3d9b14ff6fc593a3ae67','::1',1488274966,'__ci_last_regenerate|i:1488274929;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488273641\";last_check|i:1488274934;upd_prof_auth_message|s:0:\"\";'),('4761d93da8edbb387d383ef9d76396271711513a','::1',1488275377,'__ci_last_regenerate|i:1488275377;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488273641\";last_check|i:1488274934;upd_prof_auth_message|s:0:\"\";'),('e0e2332784b9eb8fc07776137971bbd160202797','::1',1488275895,'__ci_last_regenerate|i:1488275761;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488273641\";last_check|i:1488274934;upd_prof_auth_message|s:0:\"\";'),('3bafca9ea93e5d5a44675ec1b8a27a748567f71b','::1',1488277555,'__ci_last_regenerate|i:1488277553;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488273641\";last_check|i:1488274934;upd_prof_auth_message|s:0:\"\";'),('745c3548742d7b937a7bd9a2577a543d49dad7ae','::1',1488288388,'__ci_last_regenerate|i:1488288140;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488274934\";last_check|i:1488288171;'),('7bcef7ab719df831142e64fbe1f2fa734d2d9d89','::1',1488288795,'__ci_last_regenerate|i:1488288785;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488274934\";last_check|i:1488288171;'),('cda4176997fb677b0c4c5ef7ae792db8d8a2c120','::1',1488454150,'__ci_last_regenerate|i:1488454107;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488288171\";last_check|i:1488454144;'),('680108784559580a7da387b7c866cfa3d4e61fd2','::1',1488455149,'__ci_last_regenerate|i:1488455149;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488288171\";last_check|i:1488454144;'),('db3720ad67b8ccf9b9d335c2a32a1dd94a4665f7','::1',1488462106,'__ci_last_regenerate|i:1488462060;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488288171\";last_check|i:1488454144;'),('0a34884dc2370b26b266f24dff0ffa91ff50b539','::1',1488464501,'__ci_last_regenerate|i:1488464214;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488454144\";last_check|i:1488464225;'),('274f76308067a2fe62c23ac13a93e3c0cbe8bb4d','::1',1488464786,'__ci_last_regenerate|i:1488464519;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488454144\";last_check|i:1488464225;'),('c0b662dea8233521b4dc137dd0c6cccf06ba5039','::1',1488465130,'__ci_last_regenerate|i:1488464837;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488454144\";last_check|i:1488464225;'),('da32232920936858a9882c12c9d6a08ec6f125db','::1',1488465594,'__ci_last_regenerate|i:1488465302;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488454144\";last_check|i:1488464225;'),('3a3b0cd64b0b0f50000be3049b085ad68eaf47e6','::1',1488465749,'__ci_last_regenerate|i:1488465624;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488454144\";last_check|i:1488464225;'),('dc1df4bb5ee44043db306a6ea04e566843d9999a','::1',1488466583,'__ci_last_regenerate|i:1488466287;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488454144\";last_check|i:1488464225;'),('a268b56912de5846f17cc0f7821f89244ab22a33','::1',1488466972,'__ci_last_regenerate|i:1488466685;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('4a8feba8aadddc563ba879bd4775686e5d030130','::1',1488467264,'__ci_last_regenerate|i:1488467014;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('5a299093743f5d309267501752afee6f640824e1','::1',1488467598,'__ci_last_regenerate|i:1488467326;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('44ca7cd6bf47e534db4ebb2f93d984eb8af144df','::1',1488467751,'__ci_last_regenerate|i:1488467628;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('80a464c4e4e25f26e6e9bcd0bcd7f67befef08d3','::1',1488470723,'__ci_last_regenerate|i:1488470489;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('a2f9e68f763f51a9b7c31c73e686c31ad0633725','::1',1488471043,'__ci_last_regenerate|i:1488470795;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('32e123976903705e8f826370dc7b2e2c81157d0d','::1',1488471732,'__ci_last_regenerate|i:1488471500;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('6dfa761e333b94bdd2deb8dafa982eb584ac93e8','::1',1488471828,'__ci_last_regenerate|i:1488471828;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('a75237460204540dcf776d1e6390fb61c595687d','::1',1488472304,'__ci_last_regenerate|i:1488472137;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('4f1305441ebe559cd3e1e16db49689220379d366','::1',1488472720,'__ci_last_regenerate|i:1488472512;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466758\";last_check|i:1488466969;'),('caa9afe8f1a8fb221b12cdb820c59f045289da2c','::1',1488530459,'__ci_last_regenerate|i:1488530237;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466969\";last_check|i:1488530458;'),('39f42e2e66020d84b0784a5044bf7246667c1bfd','::1',1488537179,'__ci_last_regenerate|i:1488537174;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466969\";last_check|i:1488530458;'),('1bd586e584ff50648d1a777bbe8e2b89706609c7','::1',1488538299,'__ci_last_regenerate|i:1488538000;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488466969\";last_check|i:1488530458;'),('9ef1af1ac52211d0898de569f47c4d59aca78fd8','::1',1488538414,'__ci_last_regenerate|i:1488538349;identity|s:4:\"Axel\";username|s:4:\"Axel\";email|s:21:\"axel.power@merimp.com\";user_id|s:1:\"3\";old_last_login|N;last_check|i:1488538399;'),('bb2d38678edf8130d5a35a05f905abce040efaad','::1',1488540525,'__ci_last_regenerate|i:1488540502;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488530458\";last_check|i:1488540507;'),('2c1af84296e2cd527b23cf35dfc2e8452fd9d953','::1',1488541165,'__ci_last_regenerate|i:1488540960;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488530458\";last_check|i:1488540507;'),('fe00bac4b6363c90a360df9f0ba792334bc1de1a','::1',1488542332,'__ci_last_regenerate|i:1488542039;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488530458\";last_check|i:1488540507;'),('8f47acfdff2e23328d49f5147cb654bb952d3171','::1',1488547812,'__ci_last_regenerate|i:1488547531;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488530458\";last_check|i:1488540507;'),('108e07a369e4c39001866e9cf544ea43fc4457ab','::1',1488547907,'__ci_last_regenerate|i:1488547848;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488530458\";last_check|i:1488540507;'),('602e33acaaa2e01c6e541195ca197e5eec383505','::1',1488552448,'__ci_last_regenerate|i:1488552293;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488530458\";last_check|i:1488540507;'),('c93ad349adbf19504bc77748eeace980217113db','::1',1488552836,'__ci_last_regenerate|i:1488552741;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488530458\";last_check|i:1488540507;'),('1e397d5095f66c751118302140e760f1d027e1ca','::1',1488553153,'__ci_last_regenerate|i:1488553153;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488530458\";last_check|i:1488540507;'),('f06c5e96a507ec44f83076c557b218798820c6a5','::1',1488555124,'__ci_last_regenerate|i:1488555111;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488540507\";last_check|i:1488555120;'),('40c9aad47dd5df81c071ef7d3ad1f81e5f8afe93','::1',1488555508,'__ci_last_regenerate|i:1488555508;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488540507\";last_check|i:1488555120;'),('444b14c5594477a8976589c367dabe8496024c9d','::1',1488556073,'__ci_last_regenerate|i:1488555813;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488540507\";last_check|i:1488555120;'),('2560d8ec9353940208fe3d6d73656659af9af18d','::1',1488556318,'__ci_last_regenerate|i:1488556173;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488540507\";last_check|i:1488555120;'),('424123a6bf358970e05a11f55247ee9841c19733','::1',1489058824,'__ci_last_regenerate|i:1489058824;'),('e8d3ba56b129bf36b205f7a25f5f584b20aa13c3','::1',1489075397,'__ci_last_regenerate|i:1489075384;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1488555120\";last_check|i:1489075395;'),('e8a404aff0571481812ebbd51569b429ed11f615','::1',1490969314,'__ci_last_regenerate|i:1490969101;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1489075395\";last_check|i:1490969310;'),('22029cd871a136d8dc9da31a7c1256254340e44d','::1',1490970055,'__ci_last_regenerate|i:1490970055;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1489075395\";last_check|i:1490969310;'),('8fe394dd5668cc2ad272b6e58f1c2045bccf862c','::1',1490972414,'__ci_last_regenerate|i:1490972395;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1489075395\";last_check|i:1490969310;'),('8631b1fc5ce305a2d3b19a9a89c6c620a9c38258','::1',1490973526,'__ci_last_regenerate|i:1490973255;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1489075395\";last_check|i:1490969310;'),('d04b11b23de4690a39bc58328ae9e5261d0e8362','::1',1490973860,'__ci_last_regenerate|i:1490973580;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1489075395\";last_check|i:1490969310;'),('c9ae607a5cfa5a32ef121a3570103403230fc687','::1',1490974314,'__ci_last_regenerate|i:1490974261;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490969310\";last_check|i:1490974305;'),('0d6fa82bac8f2255bf85cfbe5090bfb329a2f572','::1',1490974873,'__ci_last_regenerate|i:1490974692;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1489075395\";last_check|i:1490969310;'),('71222fdef652f099be46159f224bbfa05f0dc6eb','::1',1490975307,'__ci_last_regenerate|i:1490975022;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1489075395\";last_check|i:1490969310;'),('7e882b01677631b79796a309299f2daab488b1b6','127.0.0.1',1490975156,'__ci_last_regenerate|i:1490975090;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490969310\";last_check|i:1490974305;'),('b1ebb803d20f863f169bb0b2646cdfcdfca15b1c','127.0.0.1',1490975095,'__ci_last_regenerate|i:1490975094;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490969310\";last_check|i:1490974305;'),('a108621a2face6fc39455ceaac7474b92b00a9e2','::1',1490975753,'__ci_last_regenerate|i:1490975552;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1489075395\";last_check|i:1490969310;'),('b39700eda0ac2128f1ea2dffeca88e6a80cfba59','::1',1491216688,'__ci_last_regenerate|i:1491216687;'),('0f48d8c721664c4417ce59bc3dc7514101bd7e09','::1',1491223144,'__ci_last_regenerate|i:1491222862;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('7ea1dffd335d34bd0422b7327d128f42533758d9','::1',1491223669,'__ci_last_regenerate|i:1491223372;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('86e85fd04f905ad930b327a1f0d1d95da2029bda','::1',1491223722,'__ci_last_regenerate|i:1491223705;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('25e795d20f1df1595b90032a88cdc5fb6e2daa32','::1',1491225129,'__ci_last_regenerate|i:1491225128;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('3cc6c9b18cb21f285095c3e83eee3d0896b0ca8e','::1',1491226408,'__ci_last_regenerate|i:1491226143;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('ba7f347043c585f2d589b101fa251b77abd033cb','::1',1491226522,'__ci_last_regenerate|i:1491226495;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('50a12621fe6720c96e13a61731f5da365f3ebd9e','::1',1491227871,'__ci_last_regenerate|i:1491227636;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('0c556b6ccebd7e55365aa1cb5ff6325258dd1b0e','::1',1491228886,'__ci_last_regenerate|i:1491228823;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('dfae76498a9dd07dbf00aa13d906b7b30e61bee3','::1',1491229933,'__ci_last_regenerate|i:1491229635;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('fd4b2a6634afc11935423cccac3f2f8e09cb25d6','::1',1491230090,'__ci_last_regenerate|i:1491229937;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('f3c7bc57047643887d57d00b028080b9dd108168','::1',1491230361,'__ci_last_regenerate|i:1491230310;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('720db3326a036e848bf80a0098e83f15172f7116','::1',1491230979,'__ci_last_regenerate|i:1491230681;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('46c4f9f00d95148a6ff363eff07ab65962f761fb','::1',1491231257,'__ci_last_regenerate|i:1491230990;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('48ab49c47a7790016e53973e01792fd12a043a84','::1',1491231470,'__ci_last_regenerate|i:1491231301;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('52d42a1916edf25ae4e48421586ce04adac3e083','::1',1491231753,'__ci_last_regenerate|i:1491231643;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('f275751af050e9208bdbec9eeb89b9cd7fb7a173','::1',1491232247,'__ci_last_regenerate|i:1491231963;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('b83ed5b23f936162ab48d9e2e849897bdad6f79d','::1',1491232320,'__ci_last_regenerate|i:1491232274;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('e71b9ccd7b06f80aa5185874331333989a06b2b6','::1',1491232960,'__ci_last_regenerate|i:1491232951;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('8bd001cee2bdfb6b0480addd46b6bd94632cf473','::1',1491233435,'__ci_last_regenerate|i:1491233326;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1490974305\";last_check|i:1491222862;'),('ecbe77904a36a3fa8f645d56b41a9c0bd4d4857d','::1',1491290410,'__ci_last_regenerate|i:1491290401;'),('cba2a706299b0f437d21f5937ea425c6c2b22b2c','::1',1491293794,'__ci_last_regenerate|i:1491293713;'),('4b1534d86fbdb5f47443788962a49d083066f185','::1',1491294260,'__ci_last_regenerate|i:1491294018;'),('78918162a54ae8a32dfc813f80788408b047b2e1','::1',1491294747,'__ci_last_regenerate|i:1491294735;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294600\";last_check|i:1491294741;'),('426f7cdefe2205e8a0f4017e103a125d06fc2b42','::1',1491295383,'__ci_last_regenerate|i:1491295318;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('df20ac08f5bdcdef403b950beb8af2a10bac39fd','::1',1491296110,'__ci_last_regenerate|i:1491296019;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('90dd97903bba6df5be63b4163698be24e300b1c8','::1',1491296357,'__ci_last_regenerate|i:1491296067;'),('d753a3e3203b07b64afca674e8fe57459599171b','::1',1491296614,'__ci_last_regenerate|i:1491296372;identity|s:5:\"Surge\";username|s:5:\"Surge\";email|s:18:\"lt.surge@gmail.com\";user_id|s:1:\"4\";old_last_login|N;last_check|i:1491296381;'),('f51badbd1220c3af8ae604d19441bf8ac88f6a05','::1',1491296691,'__ci_last_regenerate|i:1491296691;identity|s:5:\"Surge\";username|s:5:\"Surge\";email|s:18:\"lt.surge@gmail.com\";user_id|s:1:\"4\";old_last_login|N;last_check|i:1491296381;'),('259644bb11719ba53105dd1d2a57eef289db2c80','::1',1491296994,'__ci_last_regenerate|i:1491296698;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('a6b8257fe51d806396c15585b0cc1949d593cf22','::1',1491297286,'__ci_last_regenerate|i:1491297057;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('d23e5e3c189e372c6ad5e90002628a764d043833','::1',1491297303,'__ci_last_regenerate|i:1491297162;identity|s:5:\"Surge\";username|s:5:\"Surge\";email|s:18:\"lt.surge@gmail.com\";user_id|s:1:\"4\";old_last_login|N;last_check|i:1491296381;'),('27116bf3b958536df6304f725c22e3642b56b9f7','::1',1491298300,'__ci_last_regenerate|i:1491298027;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('8ec86d9383a0c6d56ef3f2166634387e74591b33','::1',1491298665,'__ci_last_regenerate|i:1491298370;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('926262cc0a78d656db076b73d6e8a376fc5a47d2','::1',1491298390,'__ci_last_regenerate|i:1491298390;identity|s:5:\"Surge\";username|s:5:\"Surge\";email|s:18:\"lt.surge@gmail.com\";user_id|s:1:\"4\";old_last_login|N;last_check|i:1491296381;'),('3ee37efa46df62921a4ba4b8ed8c7a99850b5154','::1',1491298996,'__ci_last_regenerate|i:1491298697;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('4c15d410ddda7002f8194d6f6bb89eee58707c06','::1',1491298886,'__ci_last_regenerate|i:1491298886;identity|s:5:\"Surge\";username|s:5:\"Surge\";email|s:18:\"lt.surge@gmail.com\";user_id|s:1:\"4\";old_last_login|N;last_check|i:1491296381;'),('9cd97db345ecbaab08b9d0a26a9c87f66fe7c286','::1',1491299677,'__ci_last_regenerate|i:1491299417;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('751ad1e60faa6d565fa23c8f4f523817a1687b29','::1',1491299447,'__ci_last_regenerate|i:1491299421;identity|s:5:\"Surge\";username|s:5:\"Surge\";email|s:18:\"lt.surge@gmail.com\";user_id|s:1:\"4\";old_last_login|N;last_check|i:1491296381;'),('9882fac9a9ce7dc7ac6872298e7d4c76d52995ed','::1',1491300547,'__ci_last_regenerate|i:1491300348;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('e9a27459fef89a6dc580e5936ec7a15cc80a9f3d','::1',1491300787,'__ci_last_regenerate|i:1491300685;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('fd2b292e43515ffff393235958aca3b0d2c8f9c9','::1',1491301496,'__ci_last_regenerate|i:1491301202;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('f4411b4e7daa93f28d80a850ad651b5ecf62c58a','::1',1491301245,'__ci_last_regenerate|i:1491301223;identity|s:5:\"Surge\";username|s:5:\"Surge\";email|s:18:\"lt.surge@gmail.com\";user_id|s:1:\"4\";old_last_login|N;last_check|i:1491296381;'),('1e29e2bc389ed29eb5f8167464ee5afb84317782','::1',1491301798,'__ci_last_regenerate|i:1491301577;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('d5082d9d9f9fb01893ab6a4f96d42466b13b9017','::1',1491301740,'__ci_last_regenerate|i:1491301736;identity|s:5:\"Surge\";username|s:5:\"Surge\";email|s:18:\"lt.surge@gmail.com\";user_id|s:1:\"4\";old_last_login|N;last_check|i:1491296381;'),('4154f41036505de2a8bebe5e1ecd224da2dd86c2','::1',1491302819,'__ci_last_regenerate|i:1491302544;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('68bb2e95f2f6e3e91e5a525423d06e1f433fe21b','::1',1491302970,'__ci_last_regenerate|i:1491302911;identity|s:4:\"Nova\";username|s:4:\"Nova\";email|s:23:\"valerio.noto@merimp.com\";user_id|s:1:\"2\";old_last_login|s:10:\"1491294741\";last_check|i:1491295375;'),('7c83de13ab61f3f67bd9157335bf48f0c90b0ff0','::1',1491302932,'__ci_last_regenerate|i:1491302930;identity|s:5:\"Surge\";username|s:5:\"Surge\";email|s:18:\"lt.surge@gmail.com\";user_id|s:1:\"4\";old_last_login|N;last_check|i:1491296381;'),('fc272c6de22803482cda3f20b73319f17b43ae9a','::1',1491313280,'__ci_last_regenerate|i:1491313280;');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'127.0.0.1','administrator','$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36','','admin@admin.com','',NULL,NULL,NULL,1268889823,1268889823,1,'Admin','istrator','ADMIN','0'),(2,'::1','Nova','$2y$08$uduJtjLhvkbP80dlCA4Uw.0mU.z6zZfhzOMr54TcetavZva41Pce2',NULL,'valerio.noto@merimp.com',NULL,NULL,NULL,'SyRvqU6.FBGJZV5Bii8DFe',1487850615,1491295375,1,NULL,NULL,NULL,NULL),(3,'::1','Axel','$2y$08$jUFgctRLAqSBejDJiXXpZuHXQzPwxnOmQtviQcWoc0U8lzxb1x5MG',NULL,'axel.power@merimp.com',NULL,NULL,NULL,NULL,1488538393,1488538399,1,NULL,NULL,NULL,NULL),(4,'::1','Surge','$2y$08$inWwRodN35Rlxq68cgjag.GYiIPMtN/v0BOZ/WCnbFesQ4dG11hBu',NULL,'lt.surge@gmail.com',NULL,NULL,NULL,NULL,1491296372,1491296381,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,1,1),(2,1,2),(3,2,2),(4,3,2),(5,4,2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-04 15:42:29
