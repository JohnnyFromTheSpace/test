-- MySQL dump 10.13  Distrib 5.7.32, for Linux (x86_64)
--
-- Host: localhost    Database: test_citrus_system
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,13,'Marko','makro@gmail.com','some comment<br />\r\ncomment',1,'2020-12-04 00:00:00'),(2,9,'Nikola','nikola@gmail.com','some comment, some comment, some comment<br />\r\nsome comment, some comment<br />\r\nsome comment',1,'2020-12-04 00:00:00');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Lenovo','2020-12-04 16:14:06'),(2,'HP','2020-12-04 16:14:06'),(3,'Asus','2020-12-04 16:14:06'),(4,'Acer','2020-12-04 16:14:06'),(5,'Dell','2020-12-04 16:15:41'),(6,'AMD','2020-12-04 16:15:41'),(7,'Sony','2020-12-04 16:15:41'),(8,'Bosch','2020-12-04 16:15:41'),(9,'Toshiba','2020-12-04 16:15:41');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `short_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,9,'HDWD110UZSVA.jpg','SATA3 1TB, 7200rpm, 64MB','Oblik 3.5 inča, Kapacitet 1TB, RPMS 7200 rpm - Kapacitet diska: 1TB Interfejs: SATA III Protok: 6 Gbps (600 MB/s) Keš memorija: 64MB Broj obrtaja po minutu: 7.200rpm Ostale karakteristike - Serija: P300 series Reklamacioni period - Reklamacioni period: 24 meseca','2020-12-04 17:14:21'),(2,8,'WTW85461BY.jpg','WTW85461BY.jpg','Bosch WTW 85461BY Punjenje veša Frontalno, Energetski razred A++, Kapacitet sušenja 9 kg, Dimenzije (ŠxVxD) 59.8 x 84.2 x 59.9 cm','2020-12-04 17:14:21'),(3,8,'TAT3A014.jpg','TAT3A014','Bosch TAT 3A014 Snaga 980 - Priključna snaga: najviše 825-980 W Za 2 kriške tosta Pljosnati grejni elementi Automatsko centriranje hleba za jednakomerno pečenje Ugrađen nastavak za žemljice od nerđajućeg čelika Elektronsko regulisanje stepena pečenja Ergonomsko oblikovan bezstepeni regulator','2020-12-04 17:14:21'),(4,7,'KD-55XH8096.jpg','KD-55XH8096 BAEP 4K Ultra HD','Veličina 55\", 3840 x 2160, HD ready, KD55XH8096BAEP Full HD - Ekran Dijagonala ekrana 55” 139 cm Rezolucija 3840 x 2160 4K Ultra HD Tip panela VA Smart funkci','2020-12-04 17:14:21'),(5,6,'5-PRO-4650G.jpg','Ryzen 5 PRO 4650G, 6 Cores','Podnožje Socket AM4, Vrsta procesora AMD Ryzen 5, Brzina procesora 3.7 GHz, Jezgro AMD Ryzen, Proces proizvodnje 7 nm, Broj jezgra','2020-12-04 17:14:21'),(6,1,'Y27gq-25.jpg','Legion Y27gq-25','Tip panela TN, Dijagonala ekrana u inčima 27, Maksimalna rezolucija 2560 x 1440, Osvežavanje 240 Hz, Odziv 0.5 ms, LEGIONY27GQ25 Full HD','2020-12-04 17:14:21'),(7,2,'HP-Neverstop.jpg','Neverstop Laser MFP 1200w','Boja štampe Mono Tip štampača Laser Multifunkcijski Da Format A4 Wi-Fi Da LAN Ne ŠTAMPAČ Rezolucija štampe mono do 600 x 600 dpi Brzina štampe mono do 20 str min Prva strana','2020-12-04 17:14:21'),(8,7,'32WE615B.jpg','KDL-32WE615B LED','Sony KDL32WE615B LED, Veličina 32\", 1366 x 768, HD ready, 400 - Model: Sony KDL 32WE615BAEP Dijagonala ekrana 32 (80.0 cm) Rezolucija ekrana 1366x768 piksela Tehnologija ekrana LED Smart Da Operativni sistem Linux Tjuner','2020-12-04 17:14:21'),(9,4,'Predator-X34P.jpg','Predator X34P Zakrivljeni IPS','Tip panela IPS, Dijagonala ekrana u inčima 34, Maksimalna rezolucija 3440 x 1440, Full HD','2020-12-04 17:14:21'),(10,1,'61F4GAT1EU.jpg','ThinkVision P24h-20','Tip panela IPS, Dijagonala ekrana u inčima 23.8, Maksimalna rezolucija 2560 x 1440, Osvežavanje 60 Hz, Odziv 4 ms, Full HD','2020-12-04 17:14:21'),(11,6,'Ryzen-7-5800X.jpg','Ryzen 7 5800X 8 cores','Podnožje Socket AM4, Vrsta procesora AMD Ryzen 7, Brzina procesora 3.8 GHz, Jezgro AMD Ryzen, Proces proizvodnje 7 nm, Broj jezgra','2020-12-04 17:14:21'),(12,3,'GTX1050.jpg','GeForce GTX 1050 Ti Cerberus OC','Grafički procesor - Grafika: nVidia GeForce Model: GTX 1050 Ti Broj unificiranih procesora: 768 Radni takt: 1,341MHz (1,455MHz boost clock) Memorija - Količina memorije: 4GB Tip memorije: GDDR5 Širina memorijske magistrale: 128bit Takt memorije: 7,008MHz Priključci - DisplayPort priključci: 1x DisplayPort','2020-12-04 17:14:21'),(13,2,'5QG35AA.jpg','ProDisplay P244 IPS 5QG35AA','Ekran Dijagonala 23,8” Pozadinsko osvetljenje LED Tip panela IPS Rezolucija 1,920 x 1,080 FHD Odnos stranica 16 9 Vreme odziva 5ms Osvežavanje 60Hz Veličina piksela 0,274 mm Osvetljenje 250 cd m2 Kontrast 1000','2020-12-04 17:14:21'),(14,5,'SE2219HIPS.jpg','SE2219H IPS','Rezolucija: 1,920 x 1,080 Tip ekrana: TFT LCD Tip panela: IPS Pozadinsko osvetljenje: LED Odnos stranica: 16:9 Nativni kontrast: 1,000:1 Osvetljenje: 250cd/m Odziv: 5ms Uglovi gledanja: 178 horizontalni, 178 vertikalni Vertikalno osvežavanje: 60Hz Veličina piksela: 0,24795mm Paleta boja: 16,7 miliona boja Ostalo: 3H, Anti-glare Priključci / Slotovi - Ukupno HDMI priključaka: 1 HDMI priključci','2020-12-04 17:14:21');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-04 22:37:30
