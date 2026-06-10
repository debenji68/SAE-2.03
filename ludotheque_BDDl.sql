/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ludotheque
-- ------------------------------------------------------
-- Server version	11.8.6-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `auteurs`
--

DROP TABLE IF EXISTS `auteurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auteurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `photos` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auteurs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auteurs` WRITE;
/*!40000 ALTER TABLE `auteurs` DISABLE KEYS */;
INSERT INTO `auteurs` VALUES
(1,'Miyamoto','Shigeru',71,'miyamoto.jpg'),
(2,'Kojima','Hideo',60,'kojima.jpg'),
(3,'Mikami','Shinji',51,'mikami.jpg'),
(4,'Notch','Markus',45,'notch.jpg'),
(5,'Carmack','John',54,'carmack.jpg');
/*!40000 ALTER TABLE `auteurs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES
(1,'Can add auteur',1,'add_auteur'),
(2,'Can change auteur',1,'change_auteur'),
(3,'Can delete auteur',1,'delete_auteur'),
(4,'Can view auteur',1,'view_auteur'),
(5,'Can add categorie',2,'add_categorie'),
(6,'Can change categorie',2,'change_categorie'),
(7,'Can delete categorie',2,'delete_categorie'),
(8,'Can view categorie',2,'view_categorie'),
(9,'Can add joueur',5,'add_joueur'),
(10,'Can change joueur',5,'change_joueur'),
(11,'Can delete joueur',5,'delete_joueur'),
(12,'Can view joueur',5,'view_joueur'),
(13,'Can add jeu',4,'add_jeu'),
(14,'Can change jeu',4,'change_jeu'),
(15,'Can delete jeu',4,'delete_jeu'),
(16,'Can view jeu',4,'view_jeu'),
(17,'Can add commentaire',3,'add_commentaire'),
(18,'Can change commentaire',3,'change_commentaire'),
(19,'Can delete commentaire',3,'delete_commentaire'),
(20,'Can view commentaire',3,'view_commentaire'),
(21,'Can add liste jeux',6,'add_listejeux'),
(22,'Can change liste jeux',6,'change_listejeux'),
(23,'Can delete liste jeux',6,'delete_listejeux'),
(24,'Can view liste jeux',6,'view_listejeux'),
(25,'Can add log entry',7,'add_logentry'),
(26,'Can change log entry',7,'change_logentry'),
(27,'Can delete log entry',7,'delete_logentry'),
(28,'Can view log entry',7,'view_logentry'),
(29,'Can add permission',9,'add_permission'),
(30,'Can change permission',9,'change_permission'),
(31,'Can delete permission',9,'delete_permission'),
(32,'Can view permission',9,'view_permission'),
(33,'Can add group',8,'add_group'),
(34,'Can change group',8,'change_group'),
(35,'Can delete group',8,'delete_group'),
(36,'Can view group',8,'view_group'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add content type',11,'add_contenttype'),
(42,'Can change content type',11,'change_contenttype'),
(43,'Can delete content type',11,'delete_contenttype'),
(44,'Can view content type',11,'view_contenttype'),
(45,'Can add session',12,'add_session'),
(46,'Can change session',12,'change_session'),
(47,'Can delete session',12,'delete_session'),
(48,'Can view session',12,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `descriptif` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(1,'Strategie','Jeux de strategie'),
(2,'FPS','Jeux a la premiere personne'),
(3,'Cooperatif','Jeux en Coop'),
(4,'Horreur','Jeux d\'Horreur'),
(5,'Action','Jeux d\'action');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jeu` int(11) NOT NULL,
  `id_joueur` int(11) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `commentaire` varchar(1000) DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_jeu` (`id_jeu`),
  KEY `id_joueur` (`id_joueur`),
  CONSTRAINT `commentaires_ibfk_1` FOREIGN KEY (`id_jeu`) REFERENCES `jeux` (`id`),
  CONSTRAINT `commentaires_ibfk_2` FOREIGN KEY (`id_joueur`) REFERENCES `joueurs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaires`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `commentaires` WRITE;
/*!40000 ALTER TABLE `commentaires` DISABLE KEYS */;
INSERT INTO `commentaires` VALUES
(17,9,1,8,'Tres bon jeu, j\'adore l\'aventure','2026-05-28 14:49:37'),
(18,9,2,9,'Excellent, un chef d\'oeuvre','2026-05-28 14:49:37'),
(19,10,1,7,'Bonne histoire mais long','2026-05-28 14:49:37'),
(20,10,3,8,'Tres immersif','2026-05-28 14:49:37'),
(21,11,2,10,'Meilleur Resident Evil ever','2026-05-28 14:49:37'),
(22,11,4,6,'Bien mais trop facile','2026-05-28 14:49:37'),
(23,12,1,7,'Sympa mais repetitif','2026-05-28 14:49:37'),
(24,12,3,8,'Fun a jouer','2026-05-28 14:49:37'),
(25,13,2,9,'DOOM au top !','2026-05-28 14:49:37'),
(26,13,4,10,'Incroyable, tres nerveux','2026-05-28 14:49:37'),
(27,14,1,10,'Zelda parfait','2026-05-28 14:49:37'),
(28,14,2,9,'Magnifique open world','2026-05-28 14:49:37'),
(29,15,3,8,'Digne successeur','2026-05-28 14:49:37'),
(30,15,4,7,'Bien mais moins bien que le 1','2026-05-28 14:49:37'),
(31,16,1,9,'Remake reussi','2026-05-28 14:49:37'),
(32,16,2,10,'Meilleur remake ever','2026-05-28 14:49:37');
/*!40000 ALTER TABLE `commentaires` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES
(7,'admin','logentry'),
(8,'auth','group'),
(9,'auth','permission'),
(10,'auth','user'),
(11,'contenttypes','contenttype'),
(1,'ludotheque','auteur'),
(2,'ludotheque','categorie'),
(3,'ludotheque','commentaire'),
(4,'ludotheque','jeu'),
(5,'ludotheque','joueur'),
(6,'ludotheque','listejeux'),
(12,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES
(1,'contenttypes','0001_initial','2026-06-07 21:18:04.616871'),
(2,'auth','0001_initial','2026-06-07 21:18:05.370302'),
(3,'admin','0001_initial','2026-06-07 21:18:05.531173'),
(4,'admin','0002_logentry_remove_auto_add','2026-06-07 21:18:05.540444'),
(5,'admin','0003_logentry_add_action_flag_choices','2026-06-07 21:18:05.546392'),
(6,'contenttypes','0002_remove_content_type_name','2026-06-07 21:18:05.650082'),
(7,'auth','0002_alter_permission_name_max_length','2026-06-07 21:18:05.749154'),
(8,'auth','0003_alter_user_email_max_length','2026-06-07 21:18:05.790779'),
(9,'auth','0004_alter_user_username_opts','2026-06-07 21:18:05.797006'),
(10,'auth','0005_alter_user_last_login_null','2026-06-07 21:18:05.862083'),
(11,'auth','0006_require_contenttypes_0002','2026-06-07 21:18:05.865535'),
(12,'auth','0007_alter_validators_add_error_messages','2026-06-07 21:18:05.870820'),
(13,'auth','0008_alter_user_username_max_length','2026-06-07 21:18:05.910467'),
(14,'auth','0009_alter_user_last_name_max_length','2026-06-07 21:18:05.949420'),
(15,'auth','0010_alter_group_name_max_length','2026-06-07 21:18:05.988797'),
(16,'auth','0011_update_proxy_permissions','2026-06-07 21:18:05.998966'),
(17,'auth','0012_alter_user_first_name_max_length','2026-06-07 21:18:06.037627'),
(18,'ludotheque','0001_initial','2026-06-07 21:18:06.737681'),
(19,'ludotheque','0002_jeu_description','2026-06-07 21:18:06.780283'),
(20,'ludotheque','0003_auteur_biographie_alter_jeu_description','2026-06-07 21:18:06.823500'),
(21,'sessions','0001_initial','2026-06-07 21:18:06.895726');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `jeux`
--

DROP TABLE IF EXISTS `jeux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jeux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `annee_sortie` year(4) DEFAULT NULL,
  `photo_boite` varchar(255) DEFAULT NULL,
  `editeur` varchar(150) DEFAULT NULL,
  `id_auteur` int(11) DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_auteur` (`id_auteur`),
  KEY `id_categorie` (`id_categorie`),
  CONSTRAINT `jeux_ibfk_1` FOREIGN KEY (`id_auteur`) REFERENCES `auteurs` (`id`),
  CONSTRAINT `jeux_ibfk_2` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jeux`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `jeux` WRITE;
/*!40000 ALTER TABLE `jeux` DISABLE KEYS */;
INSERT INTO `jeux` VALUES
(9,'The Legend of Zelda Breath of the Wild',2017,'zelda_botw.jpg','Nintendo',1,1),
(10,'Death Stranding',2019,'death_stranding.jpg','Kojima Productions',2,1),
(11,'Resident Evil Village',2021,'re_village.jpg','Capcom',3,1),
(12,'Minecraft Dungeons',2020,'mc_dungeons.jpg','Mojang',4,1),
(13,'DOOM Eternal',2020,'doom_eternal.jpg','id Software',5,1),
(14,'The Legend of Zelda Tears of the Kingdom',2023,'zelda_totk.jpg','Nintendo',1,1),
(15,'Death Stranding 2',2025,'ds2.jpg','Kojima Productions',2,1),
(16,'Resident Evil 4 Remake',2023,'re4_remake.jpg','Capcom',3,1);
/*!40000 ALTER TABLE `jeux` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `joueurs`
--

DROP TABLE IF EXISTS `joueurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `joueurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `mail` varchar(150) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `type` enum('professionnel','particulier') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joueurs`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `joueurs` WRITE;
/*!40000 ALTER TABLE `joueurs` DISABLE KEYS */;
INSERT INTO `joueurs` VALUES
(1,'evan@mail.com','Dupont','Evan','evan@mail.com','31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66','particulier'),
(2,'benjamin@mail.com','Martin','Benjamin','benjamin@mail.com','31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66','professionnel'),
(3,'amaury@mail.com','Durand','Amaury','amaury@mail.com','31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66','particulier'),
(4,'max@mail.com','Leroy','Max','max@mail.com','31f7a65e315586ac198bd798b6629ce4903d0899476d5741a9f32e2e521b6a66','professionnel');
/*!40000 ALTER TABLE `joueurs` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `liste_jeux`
--

DROP TABLE IF EXISTS `liste_jeux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `liste_jeux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_joueur` int(11) NOT NULL,
  `id_jeu` int(11) NOT NULL,
  `date_ajout` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_joueur` (`id_joueur`,`id_jeu`),
  KEY `id_jeu` (`id_jeu`),
  CONSTRAINT `liste_jeux_ibfk_1` FOREIGN KEY (`id_joueur`) REFERENCES `joueurs` (`id`),
  CONSTRAINT `liste_jeux_ibfk_2` FOREIGN KEY (`id_jeu`) REFERENCES `jeux` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liste_jeux`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `liste_jeux` WRITE;
/*!40000 ALTER TABLE `liste_jeux` DISABLE KEYS */;
INSERT INTO `liste_jeux` VALUES
(1,1,9,'2026-05-28 14:50:47'),
(2,1,14,'2026-05-28 14:50:47'),
(3,1,16,'2026-05-28 14:50:47'),
(4,2,10,'2026-05-28 14:50:47'),
(5,2,13,'2026-05-28 14:50:47'),
(6,2,16,'2026-05-28 14:50:47'),
(7,3,11,'2026-05-28 14:50:47'),
(8,3,15,'2026-05-28 14:50:47'),
(9,3,12,'2026-05-28 14:50:47'),
(10,4,13,'2026-05-28 14:50:47'),
(11,4,14,'2026-05-28 14:50:47'),
(12,4,9,'2026-05-28 14:50:47');
/*!40000 ALTER TABLE `liste_jeux` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ludotheque_auteur`
--

DROP TABLE IF EXISTS `ludotheque_auteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ludotheque_auteur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `biographie` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ludotheque_auteur`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ludotheque_auteur` WRITE;
/*!40000 ALTER TABLE `ludotheque_auteur` DISABLE KEYS */;
INSERT INTO `ludotheque_auteur` VALUES
(3,'Faidutti','Bruno',65,'auteurs/bruno-faidutti.webp','Bruno Faidutti est au auteur et concepteur de jeux né le 23 octobre 1961 à Cannes. Professeur agrégé de sciences sociales et docteur en histoire, il voue une certaine passion à la licorne à qui il dédiera même une thèse.\r\n\r\nIl créé son premier jeu en 1991 (La Vallée des Mammouths). Il réalisera ensuite par lui-même de grands titres comme Citadelles (2000), Mascarde (2013) et Dragons (2018). Le créatif français a aussi à son actif de jolis collaborations avec Leo Colovini (Valbanque), Antoine Bauza (Pony express), Serge Lget (Ad Astra) et Bruno Cathala (Raptor).\r\n\r\nDepuis quelques années Bruno Faidutti gère un blog où il parle de ses réalisations et de grands sujets de conception autour du jeu de société.');
/*!40000 ALTER TABLE `ludotheque_auteur` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ludotheque_categorie`
--

DROP TABLE IF EXISTS `ludotheque_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ludotheque_categorie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `descriptif` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ludotheque_categorie`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ludotheque_categorie` WRITE;
/*!40000 ALTER TABLE `ludotheque_categorie` DISABLE KEYS */;
INSERT INTO `ludotheque_categorie` VALUES
(3,'Cartes','Jeux de société utilisant des cartes'),
(4,'Plateau','Jeu de société utilisant des plateaux'),
(5,'Jeu de dés','Jeux de société utilisant des dés'),
(6,'Coopération','Jeu de société en coopération'),
(7,'Programmation','Jeu de société en rapport avec la programmation');
/*!40000 ALTER TABLE `ludotheque_categorie` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ludotheque_commentaire`
--

DROP TABLE IF EXISTS `ludotheque_commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ludotheque_commentaire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` int(10) unsigned NOT NULL CHECK (`note` >= 0),
  `commentaire` longtext DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `jeu_id` bigint(20) NOT NULL,
  `joueur_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ludotheque_commentaire_jeu_id_eaf6cf90_fk_ludotheque_jeu_id` (`jeu_id`),
  KEY `ludotheque_commentai_joueur_id_260cfec5_fk_ludothequ` (`joueur_id`),
  CONSTRAINT `ludotheque_commentai_joueur_id_260cfec5_fk_ludothequ` FOREIGN KEY (`joueur_id`) REFERENCES `ludotheque_joueur` (`id`),
  CONSTRAINT `ludotheque_commentaire_jeu_id_eaf6cf90_fk_ludotheque_jeu_id` FOREIGN KEY (`jeu_id`) REFERENCES `ludotheque_jeu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ludotheque_commentaire`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ludotheque_commentaire` WRITE;
/*!40000 ALTER TABLE `ludotheque_commentaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `ludotheque_commentaire` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ludotheque_jeu`
--

DROP TABLE IF EXISTS `ludotheque_jeu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ludotheque_jeu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `annee_sortie` int(11) NOT NULL,
  `photo_boite` varchar(100) DEFAULT NULL,
  `editeur` varchar(150) NOT NULL,
  `auteur_id` bigint(20) NOT NULL,
  `categorie_id` bigint(20) NOT NULL,
  `description` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ludotheque_jeu_auteur_id_efc7c8c4_fk_ludotheque_auteur_id` (`auteur_id`),
  KEY `ludotheque_jeu_categorie_id_59917b38_fk_ludotheque_categorie_id` (`categorie_id`),
  CONSTRAINT `ludotheque_jeu_auteur_id_efc7c8c4_fk_ludotheque_auteur_id` FOREIGN KEY (`auteur_id`) REFERENCES `ludotheque_auteur` (`id`),
  CONSTRAINT `ludotheque_jeu_categorie_id_59917b38_fk_ludotheque_categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `ludotheque_categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ludotheque_jeu`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ludotheque_jeu` WRITE;
/*!40000 ALTER TABLE `ludotheque_jeu` DISABLE KEYS */;
INSERT INTO `ludotheque_jeu` VALUES
(3,'Ad Astra',2009,'','Fantasy Flight Games',3,7,'Ad Astra est un jeu de programmation pour 3 à 5 joueurs de 12 ans et plus, édité en 2009 par Fantasy Flight Games, Edge Entertainment.');
/*!40000 ALTER TABLE `ludotheque_jeu` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ludotheque_joueur`
--

DROP TABLE IF EXISTS `ludotheque_joueur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ludotheque_joueur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type_joueur` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ludotheque_joueur`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ludotheque_joueur` WRITE;
/*!40000 ALTER TABLE `ludotheque_joueur` DISABLE KEYS */;
INSERT INTO `ludotheque_joueur` VALUES
(1,'BKgoatR','Evan','Dupont','evan@mail.com','toto','particulier'),
(2,'debenji68','Benjamin','Martin','benjamin@mail.com','toto','professionnel'),
(3,'Ameekop','Amaury','Durand','amaury@mail.com','toto','particulier'),
(4,'KY','Max','Leroy','max@mail.com','toto','professionnel');
/*!40000 ALTER TABLE `ludotheque_joueur` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ludotheque_listejeux`
--

DROP TABLE IF EXISTS `ludotheque_listejeux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ludotheque_listejeux` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime(6) NOT NULL,
  `joueur_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `joueur_id` (`joueur_id`),
  CONSTRAINT `ludotheque_listejeux_joueur_id_d2d6d78e_fk_ludotheque_joueur_id` FOREIGN KEY (`joueur_id`) REFERENCES `ludotheque_joueur` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ludotheque_listejeux`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ludotheque_listejeux` WRITE;
/*!40000 ALTER TABLE `ludotheque_listejeux` DISABLE KEYS */;
INSERT INTO `ludotheque_listejeux` VALUES
(1,'2026-06-07 21:52:56.716884',1);
/*!40000 ALTER TABLE `ludotheque_listejeux` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `ludotheque_listejeux_jeux`
--

DROP TABLE IF EXISTS `ludotheque_listejeux_jeux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ludotheque_listejeux_jeux` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `listejeux_id` bigint(20) NOT NULL,
  `jeu_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ludotheque_listejeux_jeux_listejeux_id_jeu_id_b1fe7d86_uniq` (`listejeux_id`,`jeu_id`),
  KEY `ludotheque_listejeux_jeux_jeu_id_175a1c04_fk_ludotheque_jeu_id` (`jeu_id`),
  CONSTRAINT `ludotheque_listejeux_jeux_jeu_id_175a1c04_fk_ludotheque_jeu_id` FOREIGN KEY (`jeu_id`) REFERENCES `ludotheque_jeu` (`id`),
  CONSTRAINT `ludotheque_listejeux_listejeux_id_f9d45241_fk_ludothequ` FOREIGN KEY (`listejeux_id`) REFERENCES `ludotheque_listejeux` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ludotheque_listejeux_jeux`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `ludotheque_listejeux_jeux` WRITE;
/*!40000 ALTER TABLE `ludotheque_listejeux_jeux` DISABLE KEYS */;
/*!40000 ALTER TABLE `ludotheque_listejeux_jeux` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-06-10 10:07:55
