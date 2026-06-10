-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: db_portal
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
-- Table structure for table `agendas`
--

DROP TABLE IF EXISTS `agendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dresscode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal_mulai` datetime DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `opsi_waktu_selesai` enum('tentukan','selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'tentukan',
  `waktu_selesai_text` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu_selesai` time DEFAULT NULL,
  `tanggal_selesai` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendas`
--

LOCK TABLES `agendas` WRITE;
/*!40000 ALTER TABLE `agendas` DISABLE KEYS */;
INSERT INTO `agendas` VALUES (5,'2025-08-03 06:38:19','2025-09-26 00:20:05','Upacara Pengibaran Bendera HUT RI','Alun alun ','Korpri','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sagittis volutpat tortor. Integer in elementum elit. Sed massa ipsum, ultricies volutpat arcu nec, bibendum viverra nisi. Pellentesque non commodo arcu, sit amet efficitur ipsum. Donec varius ut turpis accumsan volutpat. Aenean sodales tortor a scelerisque blandit. Nunc sed tortor faucibus, eleifend purus sit amet, feugiat nulla. Ut non volutpat tellus, vel iaculis mi. Nulla id dictum sapien, vitae imperdiet ante. Maecenas elit sapien, volutpat sed quam id, convallis maximus quam.','2025-08-17 00:00:00','07:00:00','tentukan','s.d selesai','09:00:00','2025-08-17 00:00:00'),(6,'2025-08-03 07:44:14','2025-08-07 06:43:28','Upacara Penurunan Bendera HUT RI','Alun alun RANGKASBITUNG','KORPRI','pemberitahuan untuk semua asn kabupaten lebak yang mendapatkan jadwal upcara penurunan bendera, di himbau membawa bendera masing- masing','2025-08-17 00:00:00','17:00:00','selesai','s.d selesai',NULL,'2025-08-17 00:00:00'),(7,'2025-08-03 07:45:52','2025-08-03 07:45:52','Renungan Suci Di taman makam Pahlawan','Taman Makam Pahlawan Rangkasbitung Kab. Lebak','KORPRI','Untuk Semua ASN yang mendapatkan jadwal renungan suci, dilarang keras untuk menggunakan kamera tanpa se ijin penyelenggara','2025-08-16 00:00:00','23:00:00','selesai','s.d selesai',NULL,'2025-08-17 00:00:00'),(8,'2025-08-03 07:47:39','2025-08-04 01:41:49','Pawai Pembangunan','Alun alun ','sesuai yang sudah di tentukan','Untuk semua Instansi, Sekolah, dan instansi lainnya di pemerintah kabupaten lebak, di himbau agar mengikuti pawai pembangunan pada waktu yang sudah di tentukan ppp','2025-08-17 00:00:00','14:00:00','selesai','s.d selesai',NULL,'2025-08-17 00:00:00'),(9,'2025-08-07 05:54:59','2025-09-26 00:15:57','Seba baduy','Alun alun ','pakain adat Baduy','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sagittis volutpat tortor. Integer in elementum elit. Sed massa ipsum, ultricies volutpat arcu nec, bibendum viverra nisi. Pellentesque non commodo arcu, sit amet efficitur ipsum. Donec varius ut turpis accumsan volutpat. Aenean sodales tortor a scelerisque blandit. Nunc sed tortor faucibus, eleifend purus sit amet, feugiat nulla. Ut non volutpat tellus, vel iaculis mi. Nulla id dictum sapien, vitae imperdiet ante. Maecenas elit sapien, volutpat sed quam id, convallis maximus quam.','2025-08-07 00:00:00','20:54:47','selesai',NULL,NULL,'2025-08-09 00:00:00');
/*!40000 ALTER TABLE `agendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` enum('ucapan','infografis') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (5,'infograffis6','banner/imbauan idul fitri.png','infograffis6','infografis','ucapan','2025-07-28 18:59:34','2025-07-28 18:59:34'),(12,'Pendataan Penduduk','banner/pendataan penduduk.png','pendataan-penduduk','infografis','ucapan','2025-08-05 20:16:07','2025-08-05 20:16:07'),(14,'Ucapan hari konsumen','banner/hari konsumen 2022nnn.png','ucapan-hari-konsumen','ucapan','ucapan','2025-08-05 20:17:41','2025-08-05 20:17:41'),(17,'Ucapan Maulid 2025','banner/ucapan maulid 2025.png','ucapan-maulid-2025','ucapan','ucapan','2025-09-26 00:34:24','2025-09-26 00:34:24'),(19,'Hari jadi idi','banner/Hari jadi idi.png','hari-jadi-idi','ucapan','ucapan','2025-10-26 19:21:09','2025-10-26 19:21:09'),(20,'Alur Pelayanan Aduan Korban Kekerasan','banner/alur pelayanan pengaduan korban kekerasan.png','alur-pelayanan-aduan-korban-kekerasan','infografis','ucapan','2025-10-27 19:36:01','2025-10-27 19:36:01'),(21,'Rute angkutan kota dan angkutan desa','banner/Rute angkutan kota dan angkutan desa.png','rute-angkutan-kota-dan-angkutan-desa','infografis','ucapan','2025-11-27 21:50:39','2025-11-27 21:50:39'),(22,'Data Realisasi Investasi Periode januari- September 2025 di Kabupaten Lebak','banner/data realisasi investasi periode januari-september 2025.png','data-realisasi-investasi-periode-januari-september-2025-di-kabupaten-lebak','infografis','ucapan','2025-11-27 21:54:24','2025-11-27 21:54:24'),(23,'Ucapan Hari Guru Nasional tahun 2025','banner/ucapan hari guru nasional 2025.png','ucapan-hari-guru-nasional-tahun-2025','ucapan','ucapan','2025-11-27 21:57:23','2025-11-27 21:57:23'),(24,'Data kesehatan sektoral','banner/data kesehatan sektoral.png','data-kesehatan-sektoral','infografis','ucapan','2025-11-27 22:00:53','2025-11-27 22:00:53');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `berita_tag`
--

DROP TABLE IF EXISTS `berita_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `berita_tag` (
  `berita_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`berita_id`,`tag_id`),
  KEY `berita_tag_tag_id_foreign` (`tag_id`),
  CONSTRAINT `berita_tag_berita_id_foreign` FOREIGN KEY (`berita_id`) REFERENCES `beritas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `berita_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `berita_tag`
--

LOCK TABLES `berita_tag` WRITE;
/*!40000 ALTER TABLE `berita_tag` DISABLE KEYS */;
INSERT INTO `berita_tag` VALUES (21,1),(33,1),(34,1),(9,2),(21,2),(32,2),(33,2),(38,2);
/*!40000 ALTER TABLE `berita_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beritas`
--

DROP TABLE IF EXISTS `beritas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beritas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `penulis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_id` bigint unsigned DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `konten` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `status` enum('draft','published') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `tanggal_publish` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `beritas_slug_unique` (`slug`),
  KEY `beritas_kategori_id_foreign` (`kategori_id`),
  KEY `beritas_user_id_foreign` (`user_id`),
  CONSTRAINT `beritas_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategoris` (`id`) ON DELETE SET NULL,
  CONSTRAINT `beritas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beritas`
--

LOCK TABLES `beritas` WRITE;
/*!40000 ALTER TABLE `beritas` DISABLE KEYS */;
INSERT INTO `beritas` VALUES (9,NULL,'Bupati Lebak Kukuhkan Dekranasda, Bunda PAUD & Luncurkan Koperasi Merah Putih','bupati-lebak-kukuhkan-dekranasda-bunda-paud-luncurkan-koperasi-merah-putih',NULL,7,'berita/thumbnails/wP2x0HisJcePkZgggyv7wQjllDbepv-metaQnVwYXRpIExlYmFrIEt1a3Voa2FuIERla3JhbmFzZGEsIEJ1bmRhIFBBVUQgJiBMdW5jdXJrYW4gS29wZXJhc2kgTWVyYWggUHV0aWguanBlZw==-.jpeg','<p>Lebak, Kamis, 12 Juni 2025 — Pemerintah Kabupaten Lebak menggelar rangkaian kegiatan penting yang sarat nilai strategis dalam pembangunan daerah, bertempat di Pendopo Kabupaten Lebak, dengan tajuk Pengukuhan Pengurus Dewan Kerajinan Nasional Daerah (Dekranasda) Kabupaten Lebak &amp; Bunda PAUD Kabupaten Lebak, Pelantikan POKJA Bunda PAUD dan Bunda PAUD Kecamatan Masa Bakti 2025–2030, serta Penandatanganan Akta Pendirian Koperasi Desa/Kelurahan Merah Putih.</p><p>Kegiatan ini dihadiri langsung oleh Bupati Lebak, Sekretaris Daerah Kabupaten Lebak, Ketua DPRD Kabupaten Lebak, Perwakilan Dekranasda Provinsi Banten, serta diikuti oleh para Kepala Organisasi Perangkat Daerah (OPD) dan para Camat se-Kabupaten Lebak.</p><p>Rangkaian acara diawali dengan pengukuhan Pengurus Dekranasda Kabupaten Lebak yang bertujuan untuk memperkuat sinergi antara pemerintah daerah, pelaku UMKM, dan pengrajin lokal dalam upaya pelestarian dan pengembangan produk kerajinan khas Lebak. Pengurus yang baru dikukuhkan diharapkan dapat mendorong kemajuan sektor ekonomi kreatif serta memperluas pasar kerajinan daerah di level nasional maupun internasional.</p>',511,'published','2025-10-17',1,'2025-07-22 19:39:16','2026-04-06 19:41:39',NULL),(21,NULL,'Pemkab Lebak Gelar Musrenbang RPJMD 2025–2029, Dorong Sinergitas Menuju Indonesia Emas 2045','pemkab-lebak-gelar-musrenbang-rpjmd-2025-2029-dorong-sinergitas-menuju-indonesia-emas-2045',NULL,8,'berita/thumbnails/0nhqwGpuXr2iCIKLwDucuOguHiNacr-metaV2hhdHNBcHAtSW1hZ2UtMjAyNS0wNi0xMS1hdC0xMy4wMS40OC5qcGVn-.jpeg','<p>Lebak – Pemerintah Kabupaten Lebak melalui Badan Perencanaan Pembangunan, Riset, dan Inovasi Daerah (Baperida) menyelenggarakan Musyawarah Perencanaan Pembangunan Daerah (Musrenbang) dalam rangka penyusunan Rencana Pembangunan Jangka Menengah Daerah (RPJMD) Kabupaten Lebak Tahun 2025–2029. Kegiatan ini berlangsung pada Rabu, 11 Juni 2025 bertempat di Aula Multatuli, Sekretariat Daerah Kabupaten Lebak.</p><p>Musrenbang RPJMD kali ini menjadi momentum penting dalam menyelaraskan visi pembangunan daerah dengan Visi Indonesia 2029, menuju Indonesia Emas 2045.</p><p>Sekretaris Daerah Kabupaten Lebak, Budi Santoso, dalam sambutannya menyampaikan bahwa saat ini Pemerintah Daerah tengah menyusun tiga dokumen perencanaan utama, yakni RPJMD, Rencana Kerja Pemerintah Daerah (RKPD), dan Rancangan Perubahan Anggaran Pendapatan dan Belanja Daerah (R-PAPBD). “Ketiga dokumen ini menjadi fokus bersama dalam menjamin penganggaran yang terencana, akuntabel, dan tepat sasaran,” ujarnya.</p><p>Sementara itu, Bupati Lebak, H. Hasbi Asyidiki Jayabaya, sebelum membuka kegiatan secara resmi, menekankan pentingnya membangun sinergitas yang tidak hanya terbatas di tingkat pimpinan, melainkan juga melalui kepemimpinan yang kuat di seluruh lapisan pemerintahan.</p><p>“RPJMD yang disusun harus sederhana, realistis, dan mampu menjawab kebutuhan masyarakat. Anggaran pembangunan harus tepat guna dan tepat sasaran,” tegas Bupati.<br>Musrenbang RPJMD ini juga dilaksanakan secara virtual, menghadirkan narasumber dari Pemerintah Provinsi Banten dan Kementerian Perencanaan Pembangunan Nasional/Bappenas RI. Kegiatan ini bertujuan untuk menghimpun masukan dari berbagai pemangku kepentingan, guna memperkuat substansi RPJMD Kabupaten Lebak 2025–2029 agar lebih partisipatif, terarah, dan selaras dengan agenda pembangunan nasional.</p>',48,'published','2025-06-11',1,'2025-07-24 21:42:56','2026-06-09 17:36:21',NULL),(32,NULL,'Bupati Lebak Terima Audiensi Para Finalis Saija Adinda Kabupaten Lebak','bupati-lebak-terima-audiensi-para-finalis-saija-adinda-kabupaten-lebak',NULL,7,'berita/thumbnails/01K1W849KTGH5Z8511PXA76FB8.jpg','<p>Lebak,- Bupati Lebak Moch. Hasbi Asyidiki Jayabaya bersama Ketua TP. PKK Lebak Belia Hasbi Jayabaya menerima audiensi para finalis saija adinda Kabupaten Lebak Tahun 2025, bertempat di Gedung Negara Kabupaten Lebak, Jum\'at (01/08/2025) Audiensi ini merupakan rangkaian dari kegiatan karantina menjelang pemilihan Saija Adinda Kabupaten Lebak 2025.…</p>',50,'published','2025-10-17',1,'2025-08-04 21:34:12','2026-06-09 15:52:21',NULL),(33,NULL,'Wakil Bupati Lebak Sosialisasikan Penataan PKL Rangkasbitung','wakil-bupati-lebak-sosialisasikan-penataan-pkl-rangkasbitung',NULL,7,'berita/thumbnails/01K2EJBHQN64EX0XHFGM2GYM2R.jpeg','<p>Lebak, – Wakil Bupati Lebak, Amir Hamzah, memberikan sosialisasi lanjutan kepada para perwakilan Pedagang Kaki Lima (PKL) Pasar Kalijaga Rangkasbitung tentang rencana penataan dan relokasi pedagang. Bertempat di Ruang Kerja Wakil Bupati Lebak, Rabu (6/8/2025).</p><p>Sosialisasi ini membahas rencana pemindahan para pedagang kaki lima di wilayah Pasar Kalijaga Rangkasbitung ke Pasar Semi. Pemerintah memastikan akan memberikan fasilitas berupa tempat, kios dagang, keamanan, dan sarana pendukung lainnya.</p>',25,'published','2025-11-03',1,'2025-08-12 00:19:15','2026-06-09 16:01:52',NULL),(34,NULL,'Wakil bupati Lebak hadiri konferensi PGRI Kabupaten Lebak ke – XXIII masa Bakti 2025 – 2030','wakil-bupati-lebak-hadiri-konferensi-pgri-kabupaten-lebak-ke-xxiii-masa-bakti-2025-2030',NULL,8,'berita/thumbnails/01K2EJVTVBS1R8VYYGFV18M7EZ.jpeg','<p>Lebak,- Wakil Bupati Lebak, H. Amir Hamzah didampingi Kepala BKAD dan Kepala Bagian Kesra Setda Lebak menghadiri Konferensi Persatuan Guru Republik Indonesia (PGRI) Kabupaten Lebak ke-XXIII Masa Bhakti 2025–2030 yang diselenggarakan di Gedung Balai Penjaminan Mutu Pendidikan (BPMP) Provinsi Banten, pada Rabu (6/8/2025).</p><p>Konferensi ini merupakan momentum penting bagi PGRI Kabupaten Lebak untuk menetapkan program kerja dan kepengurusan baru guna menghadapi tantangan pendidikan ke depan, sekaligus memperkuat sinergi antara pemerintah daerah dan para pendidik dalam upaya meningkatkan mutu pendidikan di Kabupaten Lebak.</p><p>Dalam sambutannya, Wakil Bupati mengapresiasi peran aktif PGRI dalam meningkatkan kualitas pendidikan di Kabupaten Lebak. Ia menegaskan bahwa guru adalah ujung tombak dalam mencetak generasi unggul.</p><p>“Konferensi ini bukan hanya sekadar rutinitas organisasi, tetapi merupakan ajang konsolidasi dan refleksi untuk memperkuat peran PGRI dalam membangun dunia pendidikan yang lebih baik. Kami berharap, sinergi antara PGRI dan pemerintah daerah dapat terus ditingkatkan demi kemajuan pendidikan di Lebak,” ujar Wakil Bupati.</p><p>Melalui forum ini, diharapkan terbentuk kepengurusan PGRI yang solid dan mampu menjawab tantangan pendidikan ke depan, seiring dengan dinamika zaman dan kebutuhan peserta didik yang terus berkembang.</p><p>Konferensi PGRI ke-XXIII ini dihadiri Ketua PGRI Provinsi Banten, Ketua PGRI Kabupaten Lebak serta para pengurus cabang PGRI dari seluruh kecamatan di Kabupaten Lebak.</p>',23,'published','2025-11-03',1,'2025-08-12 00:28:09','2026-06-09 16:01:54',NULL),(38,NULL,'Test berita langsung ','test-berita-langsung',NULL,3,'berita/thumbnails/01K948V2RJ6AJ44184B6NC7DS3.png','<p>ini adalah berita terbaru</p>',0,'published','2025-11-03',1,'2025-11-03 00:10:27','2025-11-03 00:12:56','2025-11-03 00:12:56');
/*!40000 ALTER TABLE `beritas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_aplikasis`
--

DROP TABLE IF EXISTS `data_aplikasis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_aplikasis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis` enum('Website','Mobile') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opd_pelaksana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_aplikasis`
--

LOCK TABLES `data_aplikasis` WRITE;
/*!40000 ALTER TABLE `data_aplikasis` DISABLE KEYS */;
INSERT INTO `data_aplikasis` VALUES (1,'E-office','Mobile','Aplikasi absen online pemerintah kabupaten lebak','https://e-office.lebakkab.go.id','aplikasi/icons/01K1YKGCGXBCYWEJPT1CQ5YN58.webp','diskominfosp','2025-08-04 04:52:17','2025-09-18 19:46:39','Internal Pemerintah'),(2,'CEPLEO','Website','cepleo bapenda lebak','https://cepleo.lebakkab.go.id/','aplikasi/icons/01K1YKFTTYD7VX1A3SJG0ZS699.webp','Bapenda','2025-08-05 18:45:56','2025-08-05 19:31:13','Aplikasi Layanan Publik'),(3,'Simpal','Website','Sistem manajemen Pajak','https://simpal.lebakkab.go.id/','aplikasi/icons/01K1YKDKENHXJNG7KTE2E641FB.webp','Bapenda','2025-08-05 18:47:07','2025-08-05 19:30:00','Aplikasi Layanan Publik'),(4,'Simonev','Website','Sistem Informasi Monitoring, Evaluasi, Pengendalian dan pelaporan pelaksanaan pembangunan. ','https://simonev.lebakkab.go.id','aplikasi/icons/01K1YJWEY1QT42Q5AJDK5RTXJK.webp','Setda','2025-08-05 18:49:12','2025-08-12 19:19:22','Aplikasi Layanan Publik'),(5,'SP4N LAPOR','Website','Sistem Informasi layanan asporasi dan pengaduan online rakyat. media pengaduan, aspirasi dan permintaan informas','https://www.lapor.go.id/','aplikasi/icons/01K1YJMNPCZQXY70C5SSTQ3EW2.png','Kemendagri','2025-08-05 18:51:55','2025-08-05 19:30:45','Aplikasi Layanan Publik'),(6,'OSS','Mobile','Sistem Informasi penyelenggaraan perizinan berbasis resiko','https://oss.go.id/','aplikasi/icons/01K1YJHDEHQD4D4TGECQNERF41.webp','DPMPTSP','2025-08-05 19:14:36','2025-09-18 19:46:57','Aplikasi Layanan Publik'),(7,'Simponie2','Website','Sistem informasi perizinan online','https://simponie2.lebakkab.go.id','aplikasi/icons/01K1YPE93GH5V2BAW8E172MEYT.webp','DPMPTSP','2025-08-05 20:22:48','2025-08-05 20:22:48','Aplikasi Layanan Publik'),(8,'EBPHTB','Website','Permohonan dan pengecekan pajak','https://v1.ebphtb.lebakkab.go.id/login','aplikasi/icons/01K1YPGJKCYD7PDYVR56ESE80E.webp','Bapenda','2025-08-05 20:24:03','2025-08-12 19:17:58','Aplikasi Layanan Publik'),(9,'Open Data Lebak','Website','Data sektoral Lebak','https://opendata.lebakkab.go.id/','aplikasi/icons/01K2ERFZG9PRX47J6478Y4NVMA.webp','Diskominfosp','2025-08-12 02:06:32','2025-08-12 19:15:23','Aplikasi Layanan Publik');
/*!40000 ALTER TABLE `data_aplikasis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dokumens`
--

DROP TABLE IF EXISTS `dokumens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dokumens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_dokumen_id` bigint unsigned NOT NULL,
  `sumber` enum('upload','link') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'upload',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_drive` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `dokumens_kategori_dokumen_id_foreign` (`kategori_dokumen_id`),
  CONSTRAINT `dokumens_kategori_dokumen_id_foreign` FOREIGN KEY (`kategori_dokumen_id`) REFERENCES `kategori_dokumens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dokumens`
--

LOCK TABLES `dokumens` WRITE;
/*!40000 ALTER TABLE `dokumens` DISABLE KEYS */;
INSERT INTO `dokumens` VALUES (6878,'DPA & DPPA Tahun 2020','dpa-&-dppa-tahun-2020',1,'upload','dokumens/1Vcio8gx4s681dB-WIuYgc5FB1PZwXE4M',NULL,'2021-04-29 03:22:44','2021-04-29 03:22:44'),(6883,'DPA & DPPA Tahun 2021','dpa-&-dppa-tahun-2021',1,'upload','dokumens/a:1:{i:0;s:0:',NULL,'2021-04-29 03:50:02','2021-04-29 03:50:02'),(6884,'DPA & DPPA Tahun 2019','dpa-&-dppa-tahun-2019',1,'upload','dokumens/DPA2019.rar',NULL,'2021-04-29 03:52:30','2021-04-29 03:56:07'),(6886,'DPA & DPPA (P)  Tahun 2019','dpa-&-dppa-(p)--tahun-2019',1,'upload','dokumens/DPPA2019.rar',NULL,'2021-04-29 03:57:48','2021-04-29 03:57:48'),(7418,'Dokumen DIKPLHD Thn 2022','dokumen-dikplhd-thn-2022',1,'upload','dokumens/a:1:{i:0;s:0:',NULL,'2022-08-15 03:16:22','2022-08-15 03:16:22'),(9457,'Informasi Ringkasan Dokumen RKPD','informasi-ringkasan-dokumen-rkpd',1,'upload','dokumens/RKPD_2023_(Perubahan)_Kabupaten Lebak (1).pdf',NULL,'2023-08-07 00:53:53','2023-08-07 00:53:53'),(9462,'Informasi Kebijakan Umum Anggaran','informasi-kebijakan-umum-anggaran',1,'upload','dokumens/PERUBAHAN KUA 2023.pdf',NULL,'2022-08-28 01:27:48','2022-08-28 01:27:48'),(9464,'Informasi Ringkasan Dokumen Prioritas dan Plafon Anggaran','informasi-ringkasan-dokumen-prioritas-dan-plafon-anggaran',1,'upload','dokumens/PERUBAHAN PPAS 2023.pdf',NULL,'2023-08-20 01:30:48','2023-08-20 01:30:48'),(9467,'Informasi Ringkasan Dokumen Rancangan Peraturan Daerah Tentang APBD','informasi-ringkasan-dokumen-rancangan-peraturan-daerah-tentang-apbd',1,'upload','dokumens/RANCANGAN PERATURAN DAERAH PERUBAHAN ABPD TAHUN ANGGARAN 2023  Final.pdf',NULL,'2023-11-10 01:42:21','2023-11-10 01:42:21'),(9469,'Informasi Peraturan Daerah tentang APBD','informasi-peraturan-daerah-tentang-apbd',1,'upload','dokumens/PERDA APBD MURNI 2023.zip',NULL,'2023-01-10 01:44:55','2024-09-19 03:25:40'),(9471,'Informasi Peraturan Kepala Daerah tentang Penjabaran APBD','informasi-peraturan-kepala-daerah-tentang-penjabaran-apbd',1,'upload','dokumens/PERBUP PERUBAHAN PENJABARAN APBD 2023.pdf',NULL,'2023-11-03 01:47:50','2023-11-03 01:47:50'),(9473,'Informasi Ringkasan DPA SKPD','informasi-ringkasan-dpa-skpd',1,'upload','dokumens/RINGKASAN-DPA-SKPD-TAHUN-ANGGARAN-2023-DPPA.pdf',NULL,'2023-01-28 10:53:55','2023-01-28 10:53:55'),(9476,'Informasi DPA PPKD','informasi-dpa-ppkd',1,'upload','dokumens/DPA-PPKD-2023_Perubahan-1.pdf',NULL,'2023-01-27 18:59:00','2023-01-27 18:59:00'),(9479,'Informasi Realisasi Pendapatan Daerah','informasi-realisasi-pendapatan-daerah',1,'upload','dokumens/LKPD-AUDITED-TAHUN-2023.pdf',NULL,'2024-05-24 02:04:27','2024-05-24 02:04:27'),(9482,'Informasi Realisasi Belanja Daerah','informasi-realisasi-belanja-daerah',1,'upload','dokumens/LKPD-AUDITED-TAHUN-2023.pdf',NULL,'2024-05-24 02:06:41','2024-05-24 02:06:41'),(9485,'Informasi Realisasi Pembiayaan Daerah','informasi-realisasi-pembiayaan-daerah',1,'upload','dokumens/LKPD-AUDITED-TAHUN-2023.pdf',NULL,'2024-05-24 02:09:24','2024-05-24 02:09:24'),(9488,'Informasi Peraturan Kepala Daerah tentang Pejabat Pengelola Keuangan Daerah','informasi-peraturan-kepala-daerah-tentang-pejabat-pengelola-keuangan-daerah',1,'upload','dokumens/SK-BUPATI-TENTANG-PELIMPAHAN-KEWENANGAN-PA-KEPADA-KPA-2023.pdf',NULL,'2023-01-25 02:11:03','2023-01-25 02:11:03'),(9491,'Informasi Rencana Umum Pengadaan','informasi-rencana-umum-pengadaan',1,'upload','dokumens/Laporan-Penayangan-SiRUP-2023.pdf',NULL,'2023-04-06 02:13:13','2023-04-06 02:13:13'),(9495,'Informasi Peraturan Kepala Daerah tentang Kebijakan Akuntansi','informasi-peraturan-kepala-daerah-tentang-kebijakan-akuntansi',1,'upload','dokumens/KEBIJAKAN AKUNTANSI NO 72 TAHUN 2023.pdf',NULL,'2023-10-17 02:16:25','2023-10-17 02:16:25'),(9498,'Informasi Laporan Arus Kas','informasi-laporan-arus-kas',1,'upload','dokumens/ARUS KAS TA. 2023.pdf',NULL,'2024-05-24 02:21:10','2024-05-24 02:21:10'),(9501,'Informasi Laporan Realisasi Anggaran Seluruh SKPD','informasi-laporan-realisasi-anggaran-seluruh-skpd',1,'upload','dokumens/REALISASI ANGGARAN SELURUH SKPD TAHUN 2023.pdf',NULL,'2024-07-26 08:05:41','2024-07-26 08:05:41'),(9504,'Informasi Laporan Realisasi Anggaran PPKD','informasi-laporan-realisasi-anggaran-ppkd',1,'upload','dokumens/REALISASI ANGGARAN PPKD TA. 2023.pdf',NULL,'2024-07-26 08:05:41','2024-07-26 08:05:41'),(9507,'Informasi Neraca','informasi-neraca',1,'upload','dokumens/NERACA TA. 2023.pdf',NULL,'2024-05-24 02:27:31','2024-05-24 02:27:31'),(9510,'Informasi CALK Pemerintah Daerah','informasi-calk-pemerintah-daerah',1,'upload','dokumens/LKPD-AUDITED-TAHUN-2023 CALK.pdf',NULL,'2024-05-24 02:29:10','2024-05-24 02:29:10'),(9513,'Informasi Laporan Keuangan BUMD-Perusahaan Daerah','informasi-laporan-keuangan-bumd-perusahaan-daerah',1,'upload','dokumens/Laporan Keuangan PT. BPR Lebak 2023 Audited.pdf',NULL,'2024-02-20 02:32:37','2024-02-20 02:32:37'),(9516,'Informasi Laporan Akuntabilitas dan Kinerja Tahunan Pemerintah Daerah','informasi-laporan-akuntabilitas-dan-kinerja-tahunan-pemerintah-daerah',1,'upload','dokumens/BUKU-LPPD-TA.-2023-FIX.pdf',NULL,'2024-04-10 02:34:07','2024-04-10 07:44:38'),(9519,'Informasi Penetapan Perda Pertangggungjawaban Pelaksanaan APBD','informasi-penetapan-perda-pertangggungjawaban-pelaksanaan-apbd',1,'upload','dokumens/Perda Tentang LPPA TA 2023 No 4 Tahun 2024.pdf',NULL,'2024-07-24 02:38:23','2024-07-24 07:43:27'),(9522,'Informasi Opini BPK RI','informasi-opini-bpk-ri',1,'upload','dokumens/29. Informasi Opini BPK RI.zip',NULL,'2024-06-01 19:39:49','2024-06-01 19:39:49'),(9524,'Informasi Ringkasan Dokumen Rancangan Perubahan APBD','informasi-ringkasan-dokumen-rancangan-perubahan-apbd',1,'upload','dokumens/Ringkasan-Dokumen-Rancanan-Perbup-Perubahan-APBD-TA-2023.pdf',NULL,'2023-10-04 03:28:15','2023-10-04 03:28:15'),(9527,'Informasi Peraturan Daerah tentang Perubahan APBD','informasi-peraturan-daerah-tentang-perubahan-apbd',1,'upload','dokumens/PERDA-PERUBAHAN-APBD-2023.pdf',NULL,'2023-11-01 03:33:22','2023-11-01 03:33:22'),(9530,'Informasi Ringkasan RKA Perubahan APBD','informasi-ringkasan-rka-perubahan-apbd',1,'upload','dokumens/INFORMASI-RINGKASAN-PERUBAHAN-RKA-SKPD-2023.pdf',NULL,'2023-10-03 20:37:08','2023-10-03 20:37:08'),(9533,'Informasi SK Kepala  Daerah tentang Pejabat Pengelola Keuangan Daerah','informasi-sk-kepala--daerah-tentang-pejabat-pengelola-keuangan-daerah',1,'upload','dokumens/SK-BUPATI-TENTANG-PELIMPAHAN-KEWENANGAN-PA-KEPADA-KPA-2023-1.pdf',NULL,'2023-01-25 03:39:32','2023-01-25 03:39:32'),(9541,'Informasi Ringkasan Dokumen RKA SKPD','informasi-ringkasan-dokumen-rka-skpd',1,'upload','dokumens/INFORMASI RINGKASAN RKA SKPD TAHUN 2023.pdf',NULL,'2023-01-10 04:56:17','2023-01-10 04:56:17'),(9543,'Informasi Ringkasan Dokumen RKA PPKD','informasi-ringkasan-dokumen-rka-ppkd',1,'upload','dokumens/INFORMASI-RINGKASAN-RKA-PPKD-TAHUN-2023.pdf',NULL,'2023-01-10 07:40:26','2023-01-10 07:40:26'),(9549,'Informasi Realisasi Pendapatan, Belanja dan Pembiayaan Daerah','informasi-realisasi-pendapatan,-belanja-dan-pembiayaan-daerah',1,'upload','dokumens/LKPD-AUDITED-TAHUN-2023.pdf',NULL,'2024-05-24 08:01:18','2024-05-24 08:01:18'),(9669,'PERDA No. 9 Tahun 2024 Tentang APBD TA. 2025','perda-no.-9-tahun-2024-tentang-apbd-ta.-2025',1,'upload','dokumens/PERDA No 9 Tahun 2024 ttg APBD TA 2025.pdf',NULL,'2025-01-21 00:06:23','2025-01-21 04:51:41'),(9676,'PERBUP No. 61 Tahun 2024 Tentang Penjabaran APBD Tahun Anggaran 2025','perbup-no.-61-tahun-2024-tentang-penjabaran-apbd-tahun-anggaran-2025',1,'upload','dokumens/PERBUP-No.-61-Tahun-2024-ttg-Penjabaran-APBD-Tahun-Anggaran-2025.pdf',NULL,'2025-01-21 00:06:23','2025-08-12 02:24:56'),(9693,'Prioritas Dan Plafon Anggaran Sementara (PPAS) TA 2024','prioritas-dan-plafon-anggaran-sementara-(ppas)-ta-2024',1,'upload','dokumens/a:1:{i:1747215715830;s:22:',NULL,'2023-08-19 04:05:36','2023-08-19 09:50:33'),(9696,'Peraturan Bupati (PERBUP) No 57 tentang Penjabaran Anggaran Pendapatan dan Belanja Daerah (APBD) Tahun Anggaran 2024','peraturan-bupati-(perbup)-no-57-tentang-penjabaran-anggaran-pendapatan-dan-belanja-daerah-(apbd)-tahun-anggaran-2024',1,'upload',NULL,NULL,'2024-01-08 04:17:49','2025-05-14 04:18:15'),(9703,'Peraturan Daerah (PERDA) NO 9 Tahun 2023 Tentang APBD TA 2024','peraturan-daerah-(perda)-no-9-tahun-2023-tentang-apbd-ta-2024',1,'upload','dokumens/PERDA NO 9 TAHUN 2023 TENTANG APBD 2024 DAN LAMPIRANNYA.pdf',NULL,'2024-01-08 05:12:53','2024-01-08 09:54:08'),(9710,'Perbup No 97 Tahun 2023 Tentang Pernjabaran ABPD TA 2024','perbup-no-97-tahun-2023-tentang-pernjabaran-abpd-ta-2024',1,'upload','dokumens/a:1:{i:1747216759089;s:60:',NULL,'2024-01-08 09:59:55','2024-01-08 10:00:23'),(9712,'Perda No 6 Tahun 2024 Tentang Perubahan APBD Tahun 2024','perda-no-6-tahun-2024-tentang-perubahan-apbd-tahun-2024',1,'upload','dokumens/PERDA-Nomor-6-Tahun-2024-tentang-P-APBD-TA.-2024-fix.pdf',NULL,'2024-09-30 10:05:00','2024-09-30 10:05:00'),(9714,'Perbup No 57 tahun 2024 Tentang Perubahan atas Peraturan Bupati No 37 tahun 2024 Tentang Penjabaran Perubahan APBD TA 2024','perbup-no-57-tahun-2024-tentang-perubahan-atas-peraturan-bupati-no-37-tahun-2024-tentang-penjabaran-perubahan-apbd-ta-2024',1,'upload','dokumens/PERBUP-NO.-57-TAHUN-2024-TENTANG-PERUBAHAN-ATAS-PERATURAN-BUPATI-NO.-37-TAHUN-2024-TENTANG-PENJABARAN-PERUBAHAN-APBD-TA.-2024-fix.pdf',NULL,'2024-12-13 10:12:14','2024-12-13 09:22:41'),(9730,'Perubahan Prioritas dan Plafon Anggaran Sementara (PPAS) Tahun Anggaran 2024','perubahan-prioritas-dan-plafon-anggaran-sementara-(ppas)-tahun-anggaran-2024',1,'upload','dokumens/Buku-Perubahan-PPAS-TA-2024-fix3-1.pdf',NULL,'2024-08-21 04:32:01','2024-08-21 01:44:53'),(9732,'Kebijkan Umum APBD Tahun Anggaran 2024','kebijkan-umum-apbd-tahun-anggaran-2024',1,'upload','dokumens/a:1:{i:1747284585709;s:41:',NULL,'2023-08-19 04:47:09','2023-08-19 04:51:06'),(9910,'Perbup No. 13 Tentang Perubahan RKPD Tahun 2025','perbup-no.-13-tentang-perubahan-rkpd-tahun-2025',1,'upload','dokumens/PERBUP NOMOR 13 TAHUN 2025 TENTANG PERUBAHAN RKPD KABUPATEN LEBAK TAHUN 2025_update (1).pdf',NULL,'2025-06-25 02:28:11','2025-06-25 02:38:34'),(9985,'Perbup Nomor 7 Tahun 2025 Tentang Standar Satuan Harga, Standar Biaya Umum, Harga Satuan Pokok Kegiatan Dan Analisis Standar Belanja T.A 2026','perbup-nomor-7-tahun-2025-tentang-standar-satuan-harga,-standar-biaya-umum,-harga-satuan-pokok-kegiatan-dan-analisis-standar-belanja-t.a-2026',1,'upload','dokumens/PERBUB-7-TAHUN-2025-TENTANG-STANDAR-HARGA-SATUAN.pdf',NULL,'2025-03-26 04:02:08','2025-03-26 04:23:10'),(9990,'Perbup No 449 Tahun 2022 Tentang Analisis Standar Belanja Pemerintah Kabupaten Lebak','perbup-no-449-tahun-2022-tentang-analisis-standar-belanja-pemerintah-kabupaten-lebak',1,'upload',NULL,NULL,'2025-09-08 06:32:44','2022-12-22 06:32:44'),(9993,'Perbup Nomor 18 Tahun 2025, Tentang RKPD Kab. Lebak T.A 2026','perbup-nomor-18-tahun-2025,-tentang-rkpd-kab.-lebak-t.a-2026',1,'upload','dokumens/RKPD KABUPATEN LEBAK TAHUN 2026 (PERBUP NOMOR 18 TAHUN 2025).pdf',NULL,'2025-07-29 01:37:40','2025-07-29 01:51:41'),(10003,'Rencana Pembangunan Jangka Menengah Daerah (RPJMD) Th. 2025-2029','rencana-pembangunan-jangka-menengah-daerah-(rpjmd)-th.-2025-2029',1,'upload','dokumens/Perda No. 4 Tahun 2025 Tentang Rencana Pembangunan Jangka Menengah Daerah Th. 20250-2029.pdf',NULL,'2025-09-09 07:51:39','2025-09-09 07:51:39'),(10025,'Perbup No. 10 Tahun 2024 Tentang SSH, Standar Biaya Umum, Harga Satuan Pokok Kegiatan dan Analisis Standar Belanja T.A 2025','perbup-no.-10-tahun-2024-tentang-ssh,-standar-biaya-umum,-harga-satuan-pokok-kegiatan-dan-analisis-standar-belanja-t.a-2025',1,'upload','dokumens/PERATURAN BUPATI NOMOR 10 TAHUN 2024 TENTANG SSH.pdf',NULL,'2024-03-08 02:10:12','2024-03-08 02:21:58'),(10033,'Realisasi Dana Bantuan Pemerintah Tahun 2025','realisasi-dana-bantuan-pemerintah-tahun-2025',1,'upload','dokumens/DD_ADD-2025.pdf',NULL,'2025-09-02 02:49:35','2025-09-02 02:55:40'),(10035,'SK Penetapan Penerima Bantuan Stimulan Rumah Swadaya (BSRS) Berupa Uang Bersumber Dari APBD Kab Lebak T.A 2025','sk-penetapan-penerima-bantuan-stimulan-rumah-swadaya-(bsrs)-berupa-uang-bersumber-dari-apbd-kab-lebak-t.a-2025',1,'upload','dokumens/SK Penerima Bansos  BSRS 2025.pdf',NULL,'2025-02-09 23:28:27','2025-02-09 23:33:13'),(10037,'SK Penetapan Penerima Bantuan Sosial Bagi Penyandang Disabilitas T.A 2025','sk-penetapan-penerima-bantuan-sosial-bagi-penyandang-disabilitas-t.a-2025',1,'upload','dokumens/SK PENETAPAN PENERIMA BANSOS DISABILITAS 2025.pdf',NULL,'2025-07-06 23:40:09','2025-07-06 23:40:39'),(10043,'Daftar Usulan Hibah Tahun Anggaran 2025','daftar-usulan-hibah-tahun-anggaran-2025',1,'upload','dokumens/Daftar Usulan Hibah Tahun Anggaran 2025.pdf',NULL,'2025-10-01 08:32:21','2025-10-01 08:33:58'),(10046,'Laporan Strategi Pengadaan 2024, Strategi Pengadaan Melalui Reviu Rencana Umum Pengadaan','laporan-strategi-pengadaan-2024,-strategi-pengadaan-melalui-reviu-rencana-umum-pengadaan',1,'upload','dokumens/Laporan Strategi Pengadaan - Reviu RUP.pdf',NULL,'2024-01-22 01:16:46','2024-01-22 07:50:49'),(10048,'PERBUP No. 21 TAHUN 2025 Tentang PENJABARAN PERUBAHAN APBD TA. 2025','perbup-no.-21-tahun-2025-tentang-penjabaran-perubahan-apbd-ta.-2025',1,'upload','dokumens/PERBUP No. 21 TAHUN 2025 Tentang PENJABARAN PERUBAHAN APBD TA. 2025.pdf',NULL,'2025-08-15 01:33:22','2025-08-15 04:07:55'),(10050,'PERDA No. 3 TAHUN 2025 Tentang PERUBAHAN APBD TA. 2025','perda-no.-3-tahun-2025-tentang-perubahan-apbd-ta.-2025',1,'upload','dokumens/PERDA No. 3 TAHUN 2025 Tentang PERUBAHAN APBD TA. 2025_compressed-dikompresi.pdf',NULL,'2025-08-15 01:38:56','2025-08-15 04:36:10'),(10053,'Laporan Penyelenggaraan Pemerintah Daerah (LPPD) Kab. Lebak T.A. 2024','laporan-penyelenggaraan-pemerintah-daerah-(lppd)-kab.-lebak-t.a.-2024',1,'upload','dokumens/Buku LPPD Kab. Lebak TA. 2024-dikompresi.pdf',NULL,'2025-03-26 03:34:24','2025-03-26 03:36:17'),(10054,'Perda No. 1 Tahun 2022 Tentang Perubahan RPJMD Tahun 2019 - 2024','perda-no.-1-tahun-2022-tentang-perubahan-rpjmd-tahun-2019---2024',1,'upload','dokumens/PERDA PERUBAHAN RPJMD 2019-2024-dikompresi.pdf',NULL,'2022-01-28 03:43:35','2022-01-28 06:01:00'),(10055,'Perbup No. 29 Th. 2024 Tentang Perubahan RKPD Kab. Lebak Tahun 2024','perbup-no.-29-th.-2024-tentang-perubahan-rkpd-kab.-lebak-tahun-2024',1,'upload','dokumens/PERBUP 29 TAHUN 2024 TENTANG PERUBAHAN RKPD KABUPATEN LEBAK 2024-dikompresi.pdf',NULL,'2024-08-20 03:48:09','2024-08-20 06:03:22'),(10062,'Perda No. 2 Tahun 2025 Tentang Pertanggungjawaban Pelaksanaan APBD T.A 2024 (LPPA)','perda-no.-2-tahun-2025-tentang-pertanggungjawaban-pelaksanaan-apbd-t.a-2024-(lppa)',1,'upload','dokumens/PERDA NOMOR 2 TAHUN 2025 TENTANG LPPA TA.2024 (1).pdf',NULL,'2025-08-20 05:04:22','2025-08-20 05:23:29'),(10065,'Laporan Keuangan Pemerintah Daerah Kab. Lebak T.A 2024 (AUDITED)','laporan-keuangan-pemerintah-daerah-kab.-lebak-t.a-2024-(audited)',1,'upload','dokumens/LKPD AUDITED TA. 2024 (1).pdf',NULL,'2025-05-30 05:50:03','2025-05-30 05:51:09'),(10067,'Surat Wajar Tanpa Pengecualian (WTP) Tahun 2025','surat-wajar-tanpa-pengecualian-(wtp)-tahun-2025',1,'upload','dokumens/SURAT WTP TAHUN 2025.pdf',NULL,'2025-06-04 05:53:50','2025-06-04 05:57:04'),(10085,'Laporan Audit BPR Lebak Sejahtera Tahun 2024','laporan-audit-bpr-lebak-sejahtera-tahun-2024',1,'upload','dokumens/Laporan-Audit-BPR-Lebak-Sejahtera-2024.pdf',NULL,'2025-02-27 04:45:45','2025-02-27 05:46:50'),(10089,'DPA Perubahan SKPD 2024 Kabupaten Lebak','dpa-perubahan-skpd-2024-kabupaten-lebak',1,'upload','dokumens/DPA-PERUBAHAN-SKPD-2024-GABUNG-PERUBAHAN.pdf',NULL,'2024-10-05 08:49:48','2024-10-05 08:51:54'),(10094,'SK BUPATI No. 900-Kep. 20-BKAD-2024 Tentang Bendahara BOSP Tahun 2024','sk-bupati-no.-900-kep.-20-bkad-2024-tentang-bendahara-bosp-tahun-2024',1,'upload','dokumens/SK-BUPATI-No.-900-Kep.-20-BKAD-2024-TENTANG-BENDAHARA-BOSP-TAHUN-2024-LENGKAP-1.pdf',NULL,'2024-01-15 07:54:40','2024-01-15 07:57:52'),(10096,'SK Bupati Tentang Penetapan Bendahara Pengeluaran dan Rekening SKPD 2024','sk-bupati-tentang-penetapan-bendahara-pengeluaran-dan-rekening-skpd-2024',1,'upload','dokumens/SK-Bupati-Tentang-Penetapan-Bendahara-Pengeluaran-dan-Rekening-SKPD-2024-1.pdf',NULL,'2024-08-12 08:00:49','2024-08-12 08:03:20'),(10098,'SK BUPATI Tentang Pemegang KKPD dan Administrator KKPD Tahun 2024','sk-bupati-tentang-pemegang-kkpd-dan-administrator-kkpd-tahun-2024',1,'upload','dokumens/SK-BUPATI-Tentang-Pemegang-KKPD-dan-Administrator-KKPD-2024-1.pdf',NULL,'2024-01-13 08:07:33','2024-01-13 08:07:33'),(10120,'Laporan Keuangan Lebak Niaga 2024','laporan-keuangan-lebak-niaga-2024',1,'upload','dokumens/LAPORAN KEUANGAN LEBAK NIAGA 2024.pdf',NULL,'2025-01-13 02:19:59','2025-01-13 02:19:59'),(10139,'Perbup No. 56 Tahun 2023 Tentang Rencana Kerja Perangkat Daearah Kabupaten Lebak ( Renja PD ) T.A 2024','perbup-no.-56-tahun-2023-tentang-rencana-kerja-perangkat-daearah-kabupaten-lebak-(-renja-pd-)-t.a-2024',1,'upload','dokumens/SALINAN PERBUP 56 THN 2023 RENJA PERANGKAT DAERAH TAHUN ANGGARAN 2024.pdf',NULL,'2023-08-14 02:30:02','2023-08-14 02:30:02');
/*!40000 ALTER TABLE `dokumens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_foto_id` bigint unsigned NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fotos_kategori_foto_id_foreign` (`kategori_foto_id`),
  CONSTRAINT `fotos_kategori_foto_id_foreign` FOREIGN KEY (`kategori_foto_id`) REFERENCES `kategori_fotos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--

LOCK TABLES `fotos` WRITE;
/*!40000 ALTER TABLE `fotos` DISABLE KEYS */;
INSERT INTO `fotos` VALUES (2,'baduy',3,'yJxNRueQU39aYytr1ct5cLXm0PR6EU-metabGV1aXQuanBn-.jpg','baduy','2025-08-04 01:47:49','2025-08-04 01:47:49'),(3,'Upapacara hari A',4,'20kiwxnsJlsFntxw6IDfLK7XYZTUOe-metaYmFja2Jhd2FoLmpwZw==-.jpg','Bupati Lebak','2025-08-04 01:49:20','2025-08-04 01:49:20'),(4,'Sawarna',3,'brWK2VIS8rkzsPCqUDEs2Xh7iIsIad-metaUGFudGFpLVNhd2FybmEuanBn-.jpg','pantai sawarna','2025-08-04 01:49:51','2025-08-04 01:49:51');
/*!40000 ALTER TABLE `fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halaman_statis`
--

DROP TABLE IF EXISTS `halaman_statis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halaman_statis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halaman_statis`
--

LOCK TABLES `halaman_statis` WRITE;
/*!40000 ALTER TABLE `halaman_statis` DISABLE KEYS */;
INSERT INTO `halaman_statis` VALUES (1,'Tentang Kabupaten Lebak','Tentang Kabupaten Lebak','<p>lebak adalah kabupoaten lbalkal</p>','pages/6u0yI71hwzKedL0slXuyVVF1aHV1HI-metaaGVybzQucG5n-.png','2025-07-27 19:36:05','2025-07-27 19:36:05'),(2,'Struktur Organisasi','struktur-oganisasi','<p>Ini halaman Struktur Organisasi</p>','pages/01K2KQN2C1STXPG5BFH7V17Z1B.jpg','2025-07-28 02:46:49','2025-08-14 00:28:02'),(3,'Visi dan Misi Kabupaten Lebak','visi-dan-misi-kabupaten-lebak','<p><strong>: Visi Kabupaten Lebak 2019 – 2024 :</strong></p><p>“Lebak Sebagai Destinasi Wisata Unggulan Nasional Berbasis Potensi Lokal”</p><p><strong>.: Misi Kabupaten Lebak 2019 – 2024 :</strong></p><ol><li>Meningkatkan Kualitas dan Daya Saing SDM;</li><li>Meningkatkan Produktifitas Perekonomian Daerah Melalui Pengembangan Pariwisata;</li><li>Meningkatkan Ketersediaan Infrastruktur Wilayah;</li><li>Meningkatkan Kualitas Lingkungan Hidup;</li><li>Mewujudkan Tata Kelola Pemerintahan Yang Baik;</li></ol>','pages/01K2KGKHPRJ8N02MCYQ5X9P4BW.png','2025-07-28 18:33:57','2025-08-13 22:47:50'),(4,'Penghargaan kabupaten Lebak','penghargaan-kabupaten-lebak','<p>dffdfdf</p>',NULL,'2025-08-07 20:25:11','2025-08-07 20:25:11'),(6,'Sambutan Bupati dan Wakil Bupati Lebak','sambutan-bupati-dan-wakil-bupati-lebak','<p>Asalamualaikum...</p>',NULL,'2025-08-07 20:30:04','2025-08-20 20:37:51');
/*!40000 ALTER TABLE `halaman_statis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero_sliders`
--

DROP TABLE IF EXISTS `hero_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hero_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `order` int NOT NULL DEFAULT '0',
  `aktif` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero_sliders`
--

LOCK TABLES `hero_sliders` WRITE;
/*!40000 ALTER TABLE `hero_sliders` DISABLE KEYS */;
INSERT INTO `hero_sliders` VALUES (9,'WadukKarian Lebak','hero-sliders/01K3MRRXC6NRNDCPBTW4R75JFB.jpg',1,0,1,'2025-08-26 20:22:33','2025-08-26 20:22:33','WadukKarian Lebak'),(10,'Alun alun','hero-sliders/01K3MRSQ5GXP32R4KFRNG7DZJ7.jpg',1,0,1,'2025-08-26 20:22:59','2025-08-26 20:22:59','Alun alun'),(15,'karang bokor 5 cl','hero-sliders/01K94C959V9BSW95NMG8J7KYR8.png',1,0,1,'2025-11-03 01:10:34','2025-11-03 01:17:46','karang bokor 5'),(16,'Seba baduy','hero-sliders/01K94DSDV5NKC58VZC19JCJMAA.png',1,0,1,'2025-11-03 01:36:55','2025-11-03 01:36:55','Seba baduy');
/*!40000 ALTER TABLE `hero_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informasi_layanans`
--

DROP TABLE IF EXISTS `informasi_layanans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informasi_layanans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kontak` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_pelaksana` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informasi_layanans`
--

LOCK TABLES `informasi_layanans` WRITE;
/*!40000 ALTER TABLE `informasi_layanans` DISABLE KEYS */;
INSERT INTO `informasi_layanans` VALUES (1,'Informasi Pembuatan Kartu Keluarga','informasi-pembuatan-kartu-keluarga','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur condimentum libero vestibulum imperdiet. Morbi ante justo, imperdiet eu sapien vitae, tempus fermentum enim. Quisque vel magna sit amet felis ullamcorper pretium a vitae elit. Ut ut aliquet urna. Maecenas dignissim, lorem vel blandit efficitur, arcu augue blandit augue, eu vestibulum ipsum lorem sed tortor. Cras sit amet nulla mattis, tempor est id, interdum orci. Nam eros purus, laoreet sed ante id, placerat varius lorem. Sed blandit dictum nunc, ac accumsan nisl pretium nec. Etiam maximus vestibulum rutrum. Sed tincidunt molestie urna. Mauris sollicitudin mollis elit, quis consequat libero mollis sit amet. Pellentesque semper ante augue, et sollicitudin dui bibendum et.\n\nCras ornare felis eu massa finibus ultricies. Donec eget arcu porttitor, rutrum nisl nec, sollicitudin ex. Integer convallis diam eget purus posuere, in imperdiet elit viverra. Phasellus tristique elit vestibulum, facilisis mauris dapibus, aliquet orci. In eget nisi vulputate, pulvinar ex eu, facilisis lacus. Vivamus tincidunt eleifend est, id porta velit tempor et. Phasellus elementum, nisl et pretium porta, tellus mi finibus lacus, in aliquet risus lacus ut dui. Donec iaculis eu elit nec placerat. Mauris nec posuere libero, et facilisis odio. Donec mi orci, auctor nec nulla at, venenatis dapibus sapien. Morbi ac odio aliquam, consequat massa in, eleifend nisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nCurabitur ac convallis nulla. Mauris et molestie lorem. Morbi est arcu, venenatis finibus gravida non, luctus vel eros. Phasellus mollis diam in lacus facilisis porttitor. Etiam nec augue a odio tincidunt vehicula sed quis nisi. Morbi euismod tellus ut congue tempus. Fusce eget auctor nunc, non elementum ipsum. Duis sed tortor vitae mi maximus tempus ac tempor leo.\n\nVivamus eget mauris eu mi ullamcorper maximus. Ut gravida, dolor et porta luctus, arcu lectus consectetur quam, eu rhoncus odio dui eget.','informasi-layanan/cp2jZxf05UFJ80mqIaExeC5QXNWTu3-metabGViYWstYmFuay1kYXRhLnBuZw==-.png','12345678','Disdukcapil','aktif','2025-08-03 09:02:20','2025-08-28 18:00:12'),(2,'Informasi Pembuatan KTP','informasi-pembuatan-ktp','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur condimentum libero vestibulum imperdiet. Morbi ante justo, imperdiet eu sapien vitae, tempus fermentum enim. Quisque vel magna sit amet felis ullamcorper pretium a vitae elit. Ut ut aliquet urna. Maecenas dignissim, lorem vel blandit efficitur, arcu augue blandit augue, eu vestibulum ipsum lorem sed tortor. Cras sit amet nulla mattis, tempor est id, interdum orci. Nam eros purus, laoreet sed ante id, placerat varius lorem. Sed blandit dictum nunc, ac accumsan nisl pretium nec. Etiam maximus vestibulum rutrum. Sed tincidunt molestie urna. Mauris sollicitudin mollis elit, quis consequat libero mollis sit amet. Pellentesque semper ante augue, et sollicitudin dui bibendum et.\n\nCras ornare felis eu massa finibus ultricies. Donec eget arcu porttitor, rutrum nisl nec, sollicitudin ex. Integer convallis diam eget purus posuere, in imperdiet elit viverra. Phasellus tristique elit vestibulum, facilisis mauris dapibus, aliquet orci. In eget nisi vulputate, pulvinar ex eu, facilisis lacus. Vivamus tincidunt eleifend est, id porta velit tempor et. Phasellus elementum, nisl et pretium porta, tellus mi finibus lacus, in aliquet risus lacus ut dui. Donec iaculis eu elit nec placerat. Mauris nec posuere libero, et facilisis odio. Donec mi orci, auctor nec nulla at, venenatis dapibus sapien. Morbi ac odio aliquam, consequat massa in, eleifend nisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nCurabitur ac convallis nulla. Mauris et molestie lorem. Morbi est arcu, venenatis finibus gravida non, luctus vel eros. Phasellus mollis diam in lacus facilisis porttitor. Etiam nec augue a odio tincidunt vehicula sed quis nisi. Morbi euismod tellus ut congue tempus. Fusce eget auctor nunc, non elementum ipsum. Duis sed tortor vitae mi maximus tempus ac tempor leo.\n\nVivamus eget mauris eu mi ullamcorper maximus. Ut gravida, dolor et porta luctus, arcu lectus consectetur quam, eu rhoncus odio dui eget.','informasi-layanan/kKFBB8DoygGlRjJnVIPQmGg13pYjrR-metabGViYWstdmVjdG9yLWFnZW5kYS5wbmc=-.png','12345678','Disdukcapil','aktif','2025-08-03 17:20:34','2025-08-28 17:59:43'),(3,'Pendaftaran Pasien RSUD ','pendaftaran-pasien-rsud','<ol start=\"1\"><li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur </p></li><li><p>condimentum libero vestibulum imperdiet. Morbi ante justo, imperdiet eu sapien vitae, tempus fermentum enim. Quisque vel magna sit amet felis ullamcorper pretium a vitae elit. Ut ut aliquet urna. Maecenas dignissim, lorem vel blandit efficitur, arcu augue blandit augue, eu vestibulum ipsum lorem sed tortor. Cras sit amet nulla mattis, tempor est id, interdum orci. Nam eros purus, laoreet sed ante id, placerat varius lorem. Sed blandit dictum nunc, ac accumsan nisl pretium nec. Etiam maximus vestibulum rutrum. Sed tincidunt molestie urna. Mauris sollicitudin mollis elit, quis consequat libero mollis sit amet. Pellentesque semper ante augue, et sollicitudin dui bibendum et. </p></li><li><p>Cras ornare felis eu massa finibus ultricies. Donec eget arcu porttitor, rutrum nisl nec, sollicitudin ex. Integer convallis diam eget purus posuere, in imperdiet elit viverra. Phasellus tristique elit vestibulum, facilisis mauris dapibus, aliquet orci. In eget nisi vulputate, pulvinar ex eu, facilisis lacus. Vivamus tincidunt eleifend est, id porta velit tempor et. Phasellus elementum, nisl et pretium porta, tellus mi finibus lacus, in aliquet risus lacus ut dui. Donec iaculis eu elit nec placerat. Mauris nec posuere libero, et facilisis odio. Donec mi orci, auctor nec nulla at, venenatis dapibus sapien. Morbi ac odio aliquam, consequat massa in, eleifend nisi. </p></li><li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ac convallis nulla. Mauris et molestie lorem. Morbi est arcu, venenatis finibus gravida non, luctus vel eros. Phasellus mollis diam in lacus facilisis porttitor. Etiam nec augue a odio tincidunt vehicula sed quis nisi. Morbi euismod tellus ut congue tempus. Fusce eget auctor nunc, non elementum ipsum. Duis sed tortor vitae mi maximus tempus ac tempor leo. Vivamus eget mauris eu mi ullamcorper maximus. Ut gravida, dolor et porta luctus, arcu lectus consectetur quam, eu rhoncus odio dui eget.</p></li></ol>','informasi-layanan/xfzBD34kp2cGyBsL02EX2r45tyS1Tp-metabGViYWstYmFuay1kYXRhLnBuZw==-.png','0818123547','RSUD DR ADJIDARMO','aktif','2025-08-04 01:27:20','2025-08-29 00:58:01'),(4,'Akta Kelahiran','akta-kelahiran','Lokasi Pelayanan : Kantor Desa/Kelurahan\n\nWaktu Pelayanan : 5 hari kerja sejak tanggal diterimanya berkas persyaratan secara lengkap\n\nBiaya : Gratis\n\nSesuai dengan Undang-Undang No. 24 Tahun 2013 tentang Perubahan atas Undang-Undang No. 23 Tahun 2006 pencatatan kelahiran yang sebelumnya berdasarkan atas asa peristiwa, sejak ditetapkannya undang-undang ini berubah menjadi berdasarkan atas domisili, sehingga pencatatan dilakukan pada instansi pelaksanan sesuai dengan domisili pelapor.\n\nBayi yang dilaporkan kelahirannya akan terdaftar dalam Kartu Keluarga dan diberi Nomor Induk Kependudukan (NIK) sebagai dasar untuk memperoleh pelayanan masyarakat lainnya.\nSebagai hasil pelaporan kelahiran, diterbitkan Kartu Keluarga dan Akta Kelahiran.\n\nPersyaratan\n\nUntuk memperoleh Pelayanan Pelaporan Kelahiran harus memenuhi persyaratan berikut ini:\n\na. Surat Pengantar RT/RW;\nb. Surat Keterangan Kelahiran dari Rumah Sakit/Dokter/Bidan/Pilot/Nahkoda\nc. Asli dan Fotokopi KK bagi penduduk/SKSKPNP bagi penduduk non permanen;\nd. Asli dan Fotokopi KTP Orang tua/SKDS/Surat Keterangan Pelaporan Tamu;\ne. Asli dan Fotokopi Surat Nikah/Akta Perkawinan Orang tua;\nf. Asli dan Fotokopi Paspor bagi Orang Asing;\ng. Surat Keterangan Kepolisian untuk anak yang tidak diketahui asal-usulnya; dan\nh. Surat Keterangan dari lembaga sosial untuk kelahiran anak penduduk rentan.\n\nPelayanan Penerbitan Akta Kelahiran\n\nLokasi Pelayanan : Suku Dinas Kependudukan dan Catatan Sipil Kabupaten Lebak\n\nWaktu Pelayanan : 5 hari kerja sejak tanggal diterimanya berkas persyaratan secara lengkap.\n\nTarif : –\n\nAkta Kelahiran adalah Akta Catatan Sipil hasil pencatatan peristiwa kelahiran seseorang.\n\n \n\nBlangko Register Akta Kelahiran\n\nPersyaratan\n\nSangat disarankan mengurus akta kelahiran sesegera mungkin setelah bayi dilahirkan. Adapun persyaratan untuk membuat akta kelahiran adalah sebagai berikut :\n\na. Surat Keterangan Kelahiran dari Kelurahan\n\nb. Asli dan Fotokopi Surat Keterangan Kelahiran dari dokter/bidan/penolong kelahiran/Nakhoda Kapal Laut atau Pilot Pesawat Terbang dengan memperlihatkan aslinya Surat\n\nc. Nikah/Akta Perkawinan orang tua\n\nd. Fotokopi KK dan KTP orang tua\n\ne. Nama dan identitas saksi pelaporan kelahiran\n\nf. Persetujuan Kepala Dinas/Suku Dinas. dalam hal pelaporannya melebihi 60 (enam puluh) hari sejak tanggal kelahirannya, dan\n\nBerdasarkan  putusan Mahkamah Konstitusi Nomor 18 /PUU-XI/2013 tanggal 14 Maret 2013, ketentuan tentang batas waktu 1 (satu) tahun dan persyaratan penetapan pengadilan yang diisyaratkan dalam pasal 32 Undang-Undang Nomor 23 Tahun 2006 dibatalkan. Dengan demikian pencatatan kelahiran yang melampaui batas 1 (satu) tahun sejak tanggal kelahiran tidak melalui penetapan pengadilan.\nBerdasarkan Undang-Undang No. 24 tahun 2013 tentang Perubahan atas Undang-Undang No. 23 Tahun 2006 tentang Administrasi Kependudukan bahwa Pencatatan kelahiran wajib dilaporkan oleh penduduk pada Instansi pelaksana tempat terjadinya peristiwa diubah menjadi wajib dilaporkan oleh penduduk pada Instansi pelaksana tempat penduduk berdomisili.\n\n \n\nJenis Akta Kelahiran\n\nAkta kelahiran digolongkan menurut jarak waktu pelaporan dengan kelahiran. Ada  jenis-jenis akta kelahiran, yaitu :\n\nAkta Kelahiran Umum Akta kelahiran yang dibuat berdasarkan laporan kelahiran yang disampaikan dalam batas waktu selambat-lambatnya 60 (enam puluh) hari kerja bagi WNI dan 10 (sepuluh) hari kerja bagi WNA sejak tanggal kelahiran bayi.\nAkta Dengan Rekomendasi Akta Kelahiran yang dibuat berdasarkan Rekomendasi kepala Dinas atas laporan kelahiran yang telah melampaui batas waktu 60 (enam puluh) hari kerja','informasi-layanan/MN9IkAQCNSkhq4C9i2xJAS055BgZAa-metabGViYWstdmVjdG9yLWFnZW5kYS5wbmc=-.png','0819123456','Kantor Desa/Kelurahan','aktif','2025-08-04 01:34:06','2025-08-28 17:59:04'),(5,'Akta Perkawinan','akta-perkawinan','<p>Pelayanan Pencatatan Perkawinan Lokasi Pelayanan : </p><ol start=\"1\"><li><p>Kantor Dinas Kependudukan dan Catatan Sipil Provinsi dan </p></li><li><p>Kantor Suku Dinas Kependudukan dan Catatan Sipil Biaya : Gratis Dinas Kependudukan dan Catatan Sipil Propinsi DKI Jakarta melayani Pencatatan Perkawinan bagi mereka yang telah melangsungkan perkawinan menurut hukum dan tata cara agama selain agama Islam. </p></li></ol><p>Pencatatan Perkawinan didasarkan atas Undang-undang Nomor 1 Tahun 1974 tentang Perkawinan. Sesuai dengan Undang-Undang No. 24 Tahun 2013 tentang Perubahan atas Undang-Undang No. 23 Tahun 2006 Pencatatan perkawinan yang sebelumnya berdasarkan atas asa peristiwa, sejak ditetapkannya undang-undang ini berubah menjadi berdasarkan atas domisli. Sehingga pencatatan dilakukan pada instansi pelaksanan sesuai dengan domisili pelapor. </p><p>Sesuai dengan Undang-undang Nomor 1 Tahun 1974, usia perkawinan adalah 19 tahun bagi Pria dan 16 tahun bagi Wanita. </p><p>Jika Anda melangsungkan perkawinan dalam usia di bawah 21 tahun, maka Anda harus memperoleh ijin dari orang tua. Apabila Anda masih di bawah 19 tahun bagi Pria dan di bawah usia 16 tahun bagi Wanita, maka harus memperoleh Dispensasi dari Pengadilan Negeri. </p><p>Berdasarkan Undang-Undang No. 24 tahun 2013 tentang Perubahan atas Undang-Undang No. 23 Tahun 2006 tentang Administrasi Kependudukan bahwa Pencatatan kelahiran wajib dilaporkan oleh penduduk pada Instansi pelaksana tempat terjadinya peristiwa diubah menjadi wajib dilaporkan oleh penduduk pada Instansi pelaksana tempat penduduk berdomisili.</p>','informasi-layanan/01K1Z8JJTM6PY3SFZ088N5CRS2.png','11111111','Disdukcapil','aktif','2025-08-06 01:39:43','2025-08-29 00:56:52'),(6,'Izin Usaha','izin-usaha','Untuk Informasi tentang perizinan usaha, silahkan kunjungi website DPMPTSP ','informasi-layanan/01K3SNHWBBBVHG32JVZKRBCZ16.png','0252 207623','DPMPTSP','aktif','2025-08-28 02:07:49','2025-08-28 18:02:29');
/*!40000 ALTER TABLE `informasi_layanans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori_dokumens`
--

DROP TABLE IF EXISTS `kategori_dokumens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori_dokumens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kategori_dokumens_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_dokumens`
--

LOCK TABLES `kategori_dokumens` WRITE;
/*!40000 ALTER TABLE `kategori_dokumens` DISABLE KEYS */;
INSERT INTO `kategori_dokumens` VALUES (1,'Data IPKD','data-ipkd','2025-08-03 23:02:01','2025-09-26 01:58:37'),(8,'manual book','manual-book','2025-08-05 23:26:00','2025-08-06 00:00:09');
/*!40000 ALTER TABLE `kategori_dokumens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori_fotos`
--

DROP TABLE IF EXISTS `kategori_fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori_fotos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kategori_fotos_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_fotos`
--

LOCK TABLES `kategori_fotos` WRITE;
/*!40000 ALTER TABLE `kategori_fotos` DISABLE KEYS */;
INSERT INTO `kategori_fotos` VALUES (1,'Pembangunan Daerah','pembangunan-daerah','kategori-foto/5XaAjuxePYNK8O2NerkExZg7q5w2Sg-metabGViYWstdmVjdG9yLXN1cnZlaS5wbmc=-.png','2025-07-29 23:17:10','2025-08-04 01:46:15'),(2,'Sosialisasi','sosialisasi','kategori-foto/b7kIxbmcSUqshfwksfXF0yPJuNSFfI-metabGViYWstdmVjdG9yLWxheWFuYW4ucG5n-.png','2025-07-29 23:17:33','2025-08-04 01:45:46'),(3,'Wisata','wisata','kategori-foto/FiwP6Vnc8DDImYdcrkYMsv1uQSjz9w-metabGViYWstYmFuay1kYXRhLnBuZw==-.png','2025-08-04 01:44:28','2025-08-04 01:44:28'),(4,'Upacara Hari nasional','upacara-hari-nasional','kategori-foto/YCPRI7Az4WpcjE6UdmdrLU5gGi8KeV-metabGViYWstdmVjdG9yLWFnZW5kYS5wbmc=-.png','2025-08-04 01:45:21','2025-08-04 01:45:21');
/*!40000 ALTER TABLE `kategori_fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori_vidios`
--

DROP TABLE IF EXISTS `kategori_vidios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori_vidios` (
  `id_kategori_vidio` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama_kategori_vidio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug_kategori_vidio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_kategori_vidio`),
  UNIQUE KEY `kategori_vidios_slug_kategori_vidio_unique` (`slug_kategori_vidio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_vidios`
--

LOCK TABLES `kategori_vidios` WRITE;
/*!40000 ALTER TABLE `kategori_vidios` DISABLE KEYS */;
INSERT INTO `kategori_vidios` VALUES (2,'pemerintahan','pemerintahan',NULL,NULL),(3,'Tutorial','tutorial',NULL,NULL),(4,'Kegiatan','kegiatan',NULL,NULL),(5,'dokumentasi','dokumentasi',NULL,NULL);
/*!40000 ALTER TABLE `kategori_vidios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategoris`
--

DROP TABLE IF EXISTS `kategoris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategoris` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kategoris_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategoris`
--

LOCK TABLES `kategoris` WRITE;
/*!40000 ALTER TABLE `kategoris` DISABLE KEYS */;
INSERT INTO `kategoris` VALUES (3,'Kesehatan','kesehatan','2025-07-22 20:02:39','2025-07-22 20:02:39'),(7,'Pariwisata','pariwisata','2025-07-22 20:57:19','2025-07-22 20:57:19'),(8,'Pemerintahan','pemerintahan','2025-08-27 19:51:17','2025-08-27 19:51:17');
/*!40000 ALTER TABLE `kategoris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kecamatans`
--

DROP TABLE IF EXISTS `kecamatans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kecamatans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_kecamatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_camat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `alamat_kantor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_kantor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peta_embed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `urutan` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kecamatans_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kecamatans`
--

LOCK TABLES `kecamatans` WRITE;
/*!40000 ALTER TABLE `kecamatans` DISABLE KEYS */;
INSERT INTO `kecamatans` VALUES (1,'Kecamatan Malingping','kecamatan-malingping','36.02.01','Dadan Rusman Wardana','Malingping adalah kecamatan di Kabupaten Lebak, Provinsi Banten, Indonesia. Kecamatan ini terletak sekitar 74 km di sebelah selatan ibu kota Kabupaten Lebak yaitu Kecamatan Rangkasbitung.','Jl. Raya Saketi - Malingping, Malingping Sel., Kec. Malingping, Kabupaten Lebak, Banten 42391','malingpingkec@lebakkab.go.id','0252','https://malingping.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','kecamatan/foto_kantor/01K7K3T7VK4P57JVEA95X9ZDN3.jpg','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4740.902315208656!2d106.01687917499525!3d-6.778465893218512!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e4259002c0d8dfd%3A0x387cf5aebbb57ffd!2sKantor%20Kecamatan%20Malingping!5e1!3m2!1sid!2sid!4v1760504345377!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,'2025-08-03 21:38:05','2025-10-14 21:59:49'),(2,'Kecamatan Wanasalam','kecamatan-wanasalam','36.02.21','CECE SAPUTRA, S.IP., MM','Kecamatan Wanasalam','Kecamatan Wanasalam, Kabupaten Lebak, Provinsi Banten.','wanasalamkec@lebakkab.go.id','0252','https://wanasalam.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','kecamatan/foto_kantor/01KA01P68FZZBS716V9A4X670C.png','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3962.0259418605006!2d105.9232845140775!3d-6.7666911113377!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e4256e2009e68a3%3A0xc478c57107587e66!2sKantor%20Kecamatan%20Wanasalam!5e0!3m2!1sid!2sid!4v1763085838185!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,'2025-08-03 22:10:32','2025-11-13 19:05:00'),(3,'Kecamatan Panggarangan','kecamatan-panggarangan','36.02.02',NULL,'Kecamatan Panggarangan','Kecamatan Panggarangan, Kabupaten Lebak, Provinsi Banten.','panggarangankec@lebakkab.go.id','0252','https://panggarangan.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','kecamatan/foto_kantor/UqP6fpvT8yRy1RL8O1DCK9XnvEgSD2-metaYmVubmVyLWRpc2tvbWluZm8tMi5wbmc=-.png','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.25134243884!2d106.24460377576601!3d-6.3615073622340494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e4216d432ebe781%3A0xbef920dc5406e33d!2sBadan%20Perencanaan%20Pembangunan%20Daerah%20(Bappeda)%20Kabupaten%20Lebak!5e0!3m2!1sid!2sid!4v1754276545909!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,'2025-08-03 22:13:41','2025-08-03 22:13:41'),(4,'Kecamatan Cihara','kecamatan-cihara','36.02.26',NULL,'Kecamatan Cihara','Kecamatan Cihara, Kabupaten Lebak, Provinsi Banten.','ciharakec@lebakkab.go.id','0252','https://cihara.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','kecamatan/foto_kantor/01K9Y6B8RH2MZ5NC8WVXD53GR8.png','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1980.6360603429068!2d106.10597328208557!3d-6.8579529214437756!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42f5ab501db383%3A0x10e1ae61ed338d03!2sKantor%20Kecamatan%20Cihara!5e0!3m2!1sid!2sid!4v1763023642795!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,NULL,'2025-11-13 01:47:40'),(5,'Kecamatan Bayah','kecamatan-bayah','36.02.03',NULL,'Kecamatan Bayah','Kecamatan Bayah, Kabupaten Lebak, Provinsi Banten.','bayahkec@lebakkab.go.id','0252','https://bayah.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(6,'Kecamatan Cilograng','kecamatan-cilograng','36.02.20','Hendi Suhendi, S.IP','Kecamatan Cilograng','Jl. Raya Bayah - Cibareno Km 25 Gunungbatu. Kabupaten Lebak- Banten\n','cilograngkec@lebakkab.go.id','085721674734','https://cilograng.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','kecamatan/foto_kantor/01K9Y7077RM6XC824VEMV2DFSM.png','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.668654954505!2d106.369461677504!3d-6.930149849260475!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42856b5aacf5d9%3A0xb2e2c30d54530b59!2sKantor%20Kecamatan%20Cilograng!5e0!3m2!1sid!2sid!4v1763024332578!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,NULL,'2025-11-13 02:00:50'),(7,'Kecamatan Cibeber','kecamatan-cibeber','36.02.19',NULL,'Kecamatan Cibeber','Kecamatan Cibeber, Kabupaten Lebak, Provinsi Banten.','cibeberkec@lebakkab.go.id','0252','https://cibeber.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','kecamatan/foto_kantor/01K9Y79P80FEQFR02CV1Q4QXB8.png','<iframe src=\"https://www.google.com/maps/embed?pb=!4v1763024538274!6m8!1m7!1sFTnt3y1fdFo4Sc5ilC6z4g!2m2!1d-6.83356379370696!2d106.3280799604019!3f138.0348353299624!4f6.542592086072148!5f0.4000000000000002\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,NULL,'2025-11-13 02:03:43'),(8,'Kecamatan Cijaku','kecamatan-cijaku','36.02.16','H. CECE SAPUTRA, S.IP., MM','Kecamatan Cijaku','Kp. Sukamaju,, Kp. Sukamaju, Cijaku, Kec. Cijaku, Kabupaten Lebak, Banten 42395','cijakukec@lebakkab.go.id','0252','https://cijaku.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','kecamatan/foto_kantor/01K9Y7H4QBPKB363NMB7CBH9H3.png','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3962.5338788568283!2d106.070298726125!3d-6.704500219206194!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e425c7a0737b4fb%3A0x5fca64cae7fbf11a!2sKantor%20Kecamatan%20Cijaku!5e0!3m2!1sid!2sid!4v1763024828387!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,NULL,'2025-11-13 02:07:48'),(9,'Kecamatan Cigemblong','kecamatan-cigemblong','36.02.28',NULL,'Kecamatan Cigemblong','Kecamatan Cigemblong, Kabupaten Lebak, Provinsi Banten.','cigemblongkec@lebakkab.go.id','0252','https://cigemblong.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(10,'Kecamatan Banjarsari','kecamatan-banjarsari','36.02.09',NULL,'Kecamatan Banjarsari','Kecamatan Banjarsari, Kabupaten Lebak, Provinsi Banten.','banjarsarikec@lebakkab.go.id','0252','https://banjarsari.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(11,'Kecamatan Cileles','kecamatan-cileles','36.02.10',NULL,'Kecamatan Cileles','Kecamatan Cileles, Kabupaten Lebak, Provinsi Banten.','cileleskec@lebakkab.go.id','0252','https://cileles\n  .lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(12,'Kecamatan Gunungkencana','kecamatan-gunungkencana','36.02.08',NULL,'Kecamatan Gunungkencana','Kecamatan Gunungkencana, Kabupaten Lebak, Provinsi Banten.','gunungkencanakec@lebakkab.go.id','0252','https://gunungkencana.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(13,'Kecamatan Bojongmanik','kecamatan-bojongmanik','36.02.07',NULL,'Kecamatan Bojongmanik','Kecamatan Bojongmanik, Kabupaten Lebak, Provinsi Banten.','bojongmanikkec@lebakkab.go.id','0252','https://bojongmanik.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(14,'Kecamatan Cirinten','kecamatan-cirinten','36.02.27',NULL,'Kecamatan Cirinten','Kecamatan Cirinten, Kabupaten Lebak, Provinsi Banten.','cirintenkec@lebakkab.go.id','0252','https://cirinten.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(15,'Kecamatan Leuwidamar','kecamatan-leuwidamar','36.02.06',NULL,'Kecamatan Leuwidamar','Kecamatan Leuwidamar, Kabupaten Lebak, Provinsi Banten.','leuwidamarkec@lebakkab.go.id','0252','https://leuwidamar.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(16,'Kecamatan Muncang','kecamatan-muncang','36.02.05','VERRY MUKIMIN, S.ST','Kecamatan Muncang','Jalan Raya Muncang-Leuwidamar Km 0.2 Kode Pos 4236, Lebak-Banten','muncangkec@lebakkab.go.id','0252','https://muncang.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','kecamatan/foto_kantor/01KA01B60S6C4R089A7DBBETDD.png','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15855.228559065135!2d106.2895634598866!3d-6.546020021428326!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e426c3717c4dd3d%3A0x25748f956b4c85ff!2sKantor%20Kecamatan%20Muncang!5e0!3m2!1sid!2sid!4v1763085124158!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,NULL,'2025-11-13 18:58:10'),(17,'Kecamatan Sobang','kecamatan-sobang','36.02.22',NULL,'Kecamatan Sobang','Kecamatan Sobang, Kabupaten Lebak, Provinsi Banten.','sobangkec@lebakkab.go.id','0252','https://sobang.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(18,'Kecamatan Cipanas','kecamatan-cipanas','36.02.04',NULL,'Kecamatan Cipanas','Kecamatan Cipanas, Kabupaten Lebak, Provinsi Banten.','cipanaskec@lebakkab.go.id','0252','https://cipanas.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(19,'Kecamatan Lebakgedong','kecamatan-lebakgedong','36.02.25',NULL,'Kecamatan Lebakgedong','Kecamatan Lebakgedong, Kabupaten Lebak, Provinsi Banten.','lebakgedongkec@lebakkab.go.id','0252','https://lebakgedong.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(20,'Kecamatan Sajira','kecamatan-sajira','36.02.12',NULL,'Kecamatan Sajira','Kecamatan Sajira, Kabupaten Lebak, Provinsi Banten.','sajirakec@lebakkab.go.id','0252','https://sajira.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(21,'Kecamatan Cimarga','kecamatan-cimarga','36.02.11',NULL,'Kecamatan Cimarga','Kecamatan Cimarga, Kabupaten Lebak, Provinsi Banten.','cimargakec@lebakkab.go.id','0252','https://cimarga.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(22,'Kecamatan Cikulur','kecamatan-cikulur','36.02.17',NULL,'Kecamatan Cikulur','Kecamatan Cikulur, Kabupaten Lebak, Provinsi Banten.','cikulurkec@lebakkab.go.id','0252','https://cikulur.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(23,'Kecamatan Warunggunung','kecamatan-warunggunung','36.02.15',NULL,'Kecamatan Warunggunung','Kecamatan Warunggunung, Kabupaten Lebak, Provinsi Banten.','warunggunungkec@lebakkab.go.id','0252','https://warunggunung.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(24,'Kecamatan Cibadak','kecamatan-cibadak','36.02.18',NULL,'Kecamatan Cibadak','Kecamatan Cibadak, Kabupaten Lebak, Provinsi Banten.','cibadakkec@lebakkab.go.id','0252','https://cibadak.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(25,'Kecamatan Rangkasbitung','kecamatan-rangkasbitung','36.02.14',NULL,'Kecamatan Rangkasbitung','Kecamatan Rangkasbitung, Kabupaten Lebak, Provinsi Banten.','rangkasbitungkec@lebakkab.go.id','0252','https://rangkasbitung.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(26,'Kecamatan Kalanganyar','kecamatan-kalanganyar','36.02.24',NULL,'Kecamatan Kalanganyar','Kecamatan Kalanganyar, Kabupaten Lebak, Provinsi Banten.','kalanganyarkec@lebakkab.go.id','0252','https://kalanganyar.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(27,'Kecamatan Maja','kecamatan-maja','36.02.13',NULL,'Kecamatan Maja','Kecamatan Maja, Kabupaten Lebak, Provinsi Banten.','majakec@lebakkab.go.id','0252','https://maja.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(28,'Kecamatan Curug Bitung','kecamatan-curug-bitung','36.02.23',NULL,'Kecamatan Curug Bitung','Kecamatan Curug Bitung, Kabupaten Lebak, Provinsi Banten.','curugbitungkec@lebakkab.go.id','0252','https://curugbitung.lebakkab.go.id','logos/UjRg43GPSF6kQyaGlL9D7I2muVpuGH-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,NULL,0,NULL,NULL),(29,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `kecamatans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kritik_sarans`
--

DROP TABLE IF EXISTS `kritik_sarans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kritik_sarans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `judul` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isi_kritik` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `no_hpusr` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kritik_sarans`
--

LOCK TABLES `kritik_sarans` WRITE;
/*!40000 ALTER TABLE `kritik_sarans` DISABLE KEYS */;
INSERT INTO `kritik_sarans` VALUES (1,'rizki','putra.lebak@gmail.com','tentang jalan','Mohon perbaiki jalan seberang mesji alakabat','2025-10-08',1,'081245784512',NULL,'2025-10-08 00:58:02','2025-10-08 00:58:45'),(2,'Rizki','rizki@gmail.com','Jalan Rusak di daerah anu','kepada bapak bupati, agar ada perbaikan untuk jalan di arah jalan A menuju akses ke jalan B','2025-10-20',1,'08787878316','ok aduan sedang di tindak lanjuti','2025-10-19 22:49:04','2025-10-19 22:49:52'),(3,'rizki 2 cek','putra.lebak@gmail.com','Perbaikan jalan poros desa b','di tes saja','2025-10-30',1,'081925463875',NULL,'2025-10-29 19:01:07','2025-10-29 19:01:36');
/*!40000 ALTER TABLE `kritik_sarans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_type` enum('main','front','footer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'main',
  `parent_id` bigint unsigned DEFAULT NULL,
  `link_type` enum('home','halaman_statis','kategori_berita','modul','eksternal','parent','kategori_dokumen') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_ref` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menus_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Beranda','heroicon-o-home','main',NULL,'home',NULL,NULL,1,0,'2025-09-21 21:46:22','2025-09-24 18:48:23'),(2,'Profil',NULL,'main',NULL,'halaman_statis','2',NULL,1,1,'2025-09-21 21:46:22','2025-09-22 23:46:38'),(3,'Produk Hukum',NULL,'main',2,'eksternal','sejarah-kabupaten-lebak','https://jdih.lebakkab.go.id/',1,1,'2025-09-21 21:46:22','2025-11-10 20:51:04'),(4,'Visi & Misi',NULL,'main',2,'halaman_statis','visi-dan-misi-kabupaten-lebak',NULL,1,2,'2025-09-21 21:46:22','2025-09-22 01:59:09'),(5,'Berita Kab Lebak','lucide-newspaper','front',NULL,'modul','berita',NULL,1,1,'2025-09-21 21:46:22','2025-10-08 19:50:31'),(7,'Kontak Kami',NULL,'footer',NULL,'halaman_statis','5',NULL,1,1,'2025-09-21 21:46:22','2025-09-21 21:46:22'),(8,'Website OPD',NULL,'footer',NULL,'eksternal',NULL,'https://opd.lebakkab.go.id',1,2,'2025-09-21 21:46:22','2025-09-21 21:46:22'),(9,'Sambutan',NULL,'main',2,'halaman_statis','sambutan-bupati-dan-wakil-bupati-lebak',NULL,1,0,'2025-09-21 21:48:34','2025-09-22 01:59:50'),(11,'Informasi Publik',NULL,'main',NULL,'parent',NULL,NULL,1,3,'2025-09-22 18:34:12','2025-09-22 18:34:12'),(12,'Berita',NULL,'main',11,'modul','berita',NULL,1,4,'2025-09-22 18:34:54','2025-09-22 19:46:37'),(13,'Info Layanan Publik',NULL,'main',NULL,'modul','layanan',NULL,1,5,'2025-09-22 18:35:51','2025-09-22 19:31:17'),(14,'Data Aplilkasi',NULL,'main',NULL,'modul','aplikasi',NULL,1,6,'2025-09-22 18:45:22','2025-09-22 19:25:35'),(15,'IPKD',NULL,'main',11,'kategori_dokumen','data-ipkd',NULL,1,7,'2025-09-22 19:48:04','2025-09-29 00:43:15'),(16,'Agenda Pemerintahan',NULL,'main',11,'modul','agenda',NULL,1,8,'2025-09-22 20:33:23','2025-09-22 20:33:23'),(18,'Aduan',NULL,'main',NULL,'parent',NULL,'https://wbs.lebakkab.go.id/',1,10,'2025-09-22 20:52:59','2025-10-05 20:52:08'),(20,'PPID',NULL,'main',NULL,'eksternal',NULL,'https://ppid.lebakkab.go.id',1,11,'2025-09-22 21:28:11','2025-09-22 21:28:11'),(21,'Pengumuman',NULL,'main',11,'modul','pengumuman',NULL,1,12,'2025-09-22 21:30:11','2025-09-22 21:33:33'),(22,'Berita',NULL,'main',NULL,'parent',NULL,NULL,1,2,'2025-09-22 23:47:22','2025-09-22 23:47:22'),(23,'Pemerintahan',NULL,'main',22,'kategori_berita','pemerintahan',NULL,1,13,'2025-09-22 23:48:10','2025-09-23 20:50:28'),(24,'Kesehatan',NULL,'main',22,'kategori_berita','kesehatan',NULL,1,14,'2025-09-22 23:48:36','2025-09-23 20:40:34'),(25,'Data Aplikasi','heroicon-o-table-cells','front',NULL,'modul','aplikasi',NULL,1,3,'2025-09-23 18:52:40','2025-10-02 19:09:03'),(26,'Data Web Kecamatan','lucide-globe','front',NULL,'modul','kecamatan',NULL,1,4,'2025-09-23 19:03:37','2025-10-02 20:18:05'),(27,'Data Web OPD','heroicon-s-magnifying-glass-circle','front',NULL,'modul','opd',NULL,1,16,'2025-10-02 19:21:03','2025-10-02 19:21:03'),(28,'Agenda Pemerintahan','heroicon-o-calendar-days','front',NULL,'modul','agenda',NULL,1,17,'2025-10-02 19:27:09','2025-10-02 20:13:14'),(29,'Lebak Ruhay','lucide-link','front',NULL,'eksternal',NULL,'https://lebakruhay.lebakkab.go.id/',1,18,'2025-10-02 19:32:17','2025-10-02 19:32:17'),(30,'Layanan Kependudukan','heroicon-o-arrow-path','front',NULL,'eksternal',NULL,'https://lebak.dukcapil.online',1,19,'2025-10-02 19:35:09','2025-10-03 01:23:43'),(31,'JDIH Kab Lebak','heroicon-o-scale','front',NULL,'eksternal',NULL,'https://jdih.lebakkab.go.id/',1,20,'2025-10-02 19:45:10','2025-10-03 01:08:37'),(32,'Info Harga Pangan','lucide-vegan ','front',NULL,'eksternal',NULL,'https://disperindag.lebakkab.go.id/informasi-harga-bahan-pokok',1,21,'2025-10-02 19:53:59','2025-10-02 19:53:59'),(33,'E-BPHTB','lucide-pen-square','front',NULL,'eksternal',NULL,'https://v1.ebphtb.lebakkab.go.id/login',1,22,'2025-10-02 20:10:36','2025-10-02 20:10:36'),(34,'SIMPAL Lebak','heroicon-o-clipboard-document-list','front',NULL,'eksternal',NULL,'https://simpal.lebakkab.go.id/login',1,23,'2025-10-02 20:21:05','2025-10-02 20:21:05'),(35,'Data Kab. Lebak',NULL,'front',NULL,'eksternal',NULL,'https://opendata.lebakkab.go.id/',1,24,'2025-10-03 01:44:45','2025-10-08 19:51:56'),(36,'WBS Inspektorat',NULL,'main',18,'eksternal',NULL,'https://wbs.lebakkab.go.id/',1,25,'2025-10-05 20:53:07','2025-10-05 20:53:07'),(37,'SP4N Lapor',NULL,'main',18,'eksternal',NULL,'https://www.lapor.go.id/instansi/pemerintah-kabupaten-lebak',1,26,'2025-10-05 20:54:50','2025-10-05 20:54:50'),(38,'WhatsApp Lebak Ruhay',NULL,'main',18,'eksternal',NULL,'https://wa.me/6281944114581',1,27,'2025-10-05 21:33:03','2025-10-05 21:33:03');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2025_07_09_081808_create_beritas_table',1),(6,'2025_07_14_070039_create_galeris_table',1),(8,'2025_07_23_024137_create_kategoris_table',2),(9,'2025_07_23_024757_add_kategori_id_to_beritas_table',3),(10,'2025_07_24_043344_add_kategori_id_to_beritas_table',4),(11,'2025_07_24_064432_create_tags_table',5),(12,'2025_07_24_064553_create_berita_tag_table',5),(13,'2025_07_25_045708_add_status_to_beritas_table',6),(14,'2025_07_25_054741_add_penulis_to_beritas_table',7),(15,'2025_07_25_060238_add_user_id_to_beritas_table',8),(16,'2025_07_25_084133_add_deleted_at_to_beritas_table',9),(17,'2025_07_28_021116_create_halaman_statis_table',10),(18,'2025_07_28_023200_create_pages_table',11),(19,'2025_07_28_035634_create_banners_table',12),(20,'2025_07_28_045811_rename_title_to_judul_in_banners_table',13),(22,'2025_07_28_052151_add_kategori_to_banners_table',14),(23,'2025_07_29_054959_create_kategori_vidios_table',15),(24,'2025_07_29_055126_create_vidios_table',15),(25,'2025_07_30_032111_create_kategori_fotos_table',16),(26,'2025_07_30_032443_create_fotos_table',16),(27,'2025_07_31_013617_create_settings_table',17),(28,'2025_07_31_075143_create_menus_table',18),(29,'2025_07_31_085116_create_hero_sliders_table',19),(32,'2025_08_01_030754_update_hero_sliders_table_add_fields',20),(33,'2025_08_01_031536_rename_columns_in_hero_sliders_table',20),(34,'2025_08_03_040042_create_polings_table',21),(35,'2025_08_03_045915_create_kritik_sarans_table',22),(36,'2025_07_14_074644_create_pengumumen_table',23),(37,'2025_08_03_093153_create_agendas_table',24),(38,'2025_08_03_153620_create_informasi_layanans_table',25),(39,'2025_08_04_024519_create_opds_table',26),(40,'2025_08_04_033030_create_kecamatans_table',27),(41,'2025_08_04_055441_create_kategori_dokumens_table',28),(42,'2025_08_04_055452_create_dokumens_table',28),(43,'2025_08_04_061003_add_slug_to_kategori_dokumens_table',29),(44,'2025_08_04_091731_create_data_aplikasis_table',30),(45,'2025_08_08_085940_create_menus_table',31),(46,'2025_09_22_030215_create_menu_table',32),(47,'2025_09_22_030230_create_submenu_table',32),(48,'2025_09_22_030316_create_subsubmenu_table',32),(49,'2025_09_22_044248_create_menus_table',33),(50,'2025_10_21_080510_create_visitors_table',34),(51,'2025_11_12_040118_create_permission_tables',35);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opds`
--

DROP TABLE IF EXISTS `opds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `singkatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pimpinan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_kantor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `peta_embed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `urutan` int NOT NULL DEFAULT '0',
  `is_published` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opds_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opds`
--

LOCK TABLES `opds` WRITE;
/*!40000 ALTER TABLE `opds` DISABLE KEYS */;
INSERT INTO `opds` VALUES (1,'Inspektorat','inspektorat','INSPEKTORAT','Dr. RUSITO, S.Sos, M.Si','Inspektorat Daerah merupakan unsur pengawas penyelenggaraan pemerintahan daerah yang memiliki tugas utama melakukan pengawasan terhadap pelaksanaan urusan pemerintahan di lingkungan pemerintah daerah. Lembaga ini bertanggung jawab langsung kepada Kepala Daerah, serta berperan penting dalam memastikan terselenggaranya pemerintahan yang efektif, efisien, bersih, dan bebas dari praktik korupsi, kolusi, dan nepotisme (KKN).\n','diskominfosp@lebakkab.go.id','02525123456','https://inspektorat.lebakkab.go.id/','jl abdinegara no 3','opd/gujoub6p7SmeHUSzjgf9FTbgXXZ6O0-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','opd/G7f4uXb4tUW2cJxUyN0gfYyBT7t077-metadGFtcGFrMy5qcGc=-.jpg','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.252993328361!2d106.2425515749916!3d-6.361293393628772!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e4216d6650993ab%3A0x92291f2d5a85bb38!2sDiskominfo%20Kabupaten%20Lebak!5e0!3m2!1sid!2sid!4v1754276049935!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,1,'2025-08-03 19:54:32','2025-10-14 21:32:14'),(2,'Badan Pendapatan Daerah','badan-pendapatan-daerah',' BAPENDA',NULL,'	Badan Pendapatan Daerah','bapenda@lebakkab.go.id','025233344455','https://bapenda.lebakkab.go.id','jl rangkasbitng','opd/j7JCOJxrD7YqbR8IfBdxFOAYB4JBTc-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','opd/kantor bapenda lebak.png','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.3684160881194!2d106.23650717576598!3d-6.346315862091651!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42173a802c28ad%3A0xcc53fd92d86ae81b!2sBadan%20Pendapatan%20Daerah%20Kabupaten%20Lebak!5e0!3m2!1sid!2sid!4v1754276281997!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,1,'2025-08-03 19:58:24','2025-11-10 22:14:45'),(3,'Badan Keuangan Dan Aset Daerah ','badan-keuangan-dan-aset-daerah','BKAD',NULL,'Badan Keuangan Dan Aset Daerah ','bkad@lebakkab.go.id','0252123456','https://bkad.lebakkab.go.id','jl hardiwinangun','opd/7jauRJXNBXntutUvggyNQ44rCAwktt-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','opd/kantor bkad.png','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.2731043885346!2d106.24577197576613!3d-6.358686262207581!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42172a77bc5e3d%3A0x37dd0ac56413a06d!2sBPKAD%20Kab.%20Lebak!5e0!3m2!1sid!2sid!4v1754276402373!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,1,'2025-08-03 20:00:09','2025-11-10 22:07:34'),(4,'Badan Perencanaan Pembangunan RIset dan Inovasi Daerah ','badan-perencanaan-pembangunan-riset-dan-inovasi-daerah','Bapperida',NULL,'Badan Perencanaan Pembangunan RIset dan Inovasi Daerah ','Bapperida@lebakkab.go.id','0252555666','https://bapperida.lebakkab.go.id','jl abdinegara no sekian','opd/Sc3kXbSLoZN49mEb3TWVo2jM5848ug-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,'<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.25134243884!2d106.24460377576601!3d-6.3615073622340494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e4216d432ebe781%3A0xbef920dc5406e33d!2sBadan%20Perencanaan%20Pembangunan%20Daerah%20(Bappeda)%20Kabupaten%20Lebak!5e0!3m2!1sid!2sid!4v1754276545909!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,1,'2025-08-03 20:02:33','2025-08-03 20:02:33'),(5,'Dinas Lingkungan Hidup','dinas-lingkungan-hidup','DLH',NULL,'Dinas Lingkungan Hidup','dlh@lebakkab.go.id','0252123654','https://dlh.lebakkab.go.id','Jl Siliwangi Ona','opd/xP14Yj7jxOGAmKIQ1r5nXO304xLoaI-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png','opd/XvzC28ifS1dV5AU84qD9TWw4ENJ5v7-metaODRlMGYwNDY0MDY3MWIyYjRiNzkzOWI3NTE4ZTI5YjcuanBn-.jpg','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d126885.96927916248!2d106.17158498453512!3d-6.369900629847187!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e421130393fdf0f%3A0x8333284c39cb2ee!2sDinas%20Lingkungan%20Hidup!5e0!3m2!1sid!2sid!4v1754295623383!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>',0,1,'2025-08-04 01:20:34','2025-08-04 01:20:34');
/*!40000 ALTER TABLE `opds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pengumumen`
--

DROP TABLE IF EXISTS `pengumumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengumumen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_pelaksanaan` date DEFAULT NULL,
  `file_lampiran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mulai_tayang` datetime NOT NULL,
  `selesai_tayang` datetime NOT NULL,
  `status` enum('draft','publish') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pengumumen_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pengumumen`
--

LOCK TABLES `pengumumen` WRITE;
/*!40000 ALTER TABLE `pengumumen` DISABLE KEYS */;
INSERT INTO `pengumumen` VALUES (1,'Jalan Santai','jalan-santai','untukjkjkjk\nkjkjkkkj\njljjlkj \ntangall 12','pengumuman-gambar/01KA8FAZQSQGBR9D16BE8HF7XM.png','2026-04-06',NULL,'2025-08-03 00:00:00','2025-08-08 00:00:00','draft','2025-08-03 02:03:57','2026-04-07 01:04:30'),(13,'Informasi Penutupan Jalan Rute Pawai Budaya dan Pawai Taaruf','informasi-penutupan-jalan-rute-pawai-budaya-dan-pawai-taaruf','<p>Pemberitahuan Penutupan Jalan Rute Pawai Budaya dan Pawai Taaruf selengkapnya pada infografis berikut</p>','pengumuman-gambar/01KBGXQGYRWF0AQGWD6MNYHCCN.png','2025-12-01',NULL,'2025-12-01 00:00:00','2025-12-05 00:00:00','draft','2025-12-02 18:37:47','2025-12-02 18:40:23'),(14,'Pawai Budaya dan Pawai Taaruf dalam rangka HUT Lebak 2025','pawai-budaya-dan-pawai-taaruf-dalam-rangka-hut-lebak-2025','<p>Wargi Lebak, Ayo kita meriahkan pawai budaya dan pawai ta\'aruf dalam rangka Hari Jadi ke-197 Kabupaten Lebak.<br><br>Catat waktu dan lokasinya, ya. Kita jadi saksi kemeriahan peringatan hari jadi ke 197 Kabupaten Lebak</p>','pengumuman-gambar/01KBH72YN2PQQQ222CT4VWJY9D.png','2025-12-01',NULL,'2025-11-26 00:00:00','2025-12-05 00:00:00','draft','2025-12-02 21:21:19','2025-12-02 21:21:19'),(15,'Festiva Lebak Ruhay 2025','festiva-lebak-ruhay-2025','<p>Informasi untuk para pelari yang sudah melakukan pendaftaran Online melalui link SUDAH OTOMATIS terdaftar sebagai peserta Multatuli Run baik kategori pelajar,umum lokal ataupun umum nasional, tidak perlu menunggu balasan konfirmasi melalui email,&nbsp;</p><p>bagi peserta yang sudah mendaftar melalui online tahap selanjutnya adalah untuk mengambil BIB di Kantor Dispora Kabupaten Lebak dengan membawa Foto Copy KTP atau Kartu Pelajar dan Surat Keterangan Sehat,&nbsp;</p><p>Untuk Pengambilan nomor BIB sudah bisa di lakukan mulai Tanggal 22 Oktober 2025 pada hari kerja Senin s/d Jumat pukul 08.00 s/d 16.00,&nbsp;</p><p>bagi pendaftar yang sudah melakukan pendaftaran offline bisa langsung mengambil nomor BIB kepada panitia dengan cara menunjukan KTP atau Kartu Pelajar ,&nbsp;</p><p>Pendaftaran Multatuli Run melalui Offline di tutup pada tanggal 28 November 2025 pukul 16.00 dan&nbsp;</p><p>Pendaftaran Multatuli Run melalui Online di tutup pada tanggal 27 November 2025 pukul 23.59, Pelaksanaan Pada tanggal 30 November 2025 lokasi Start dan Finisih di depan Stadion Uwes Qorny Pasir Ona..Pendaftaran Gratissssssss&nbsp;</p>','pengumuman-gambar/01KBH79ZNZ2CFKS4VK4MDKD58Q.png','2025-11-30',NULL,'2025-11-17 00:00:00','2025-11-30 00:00:00','draft','2025-12-02 21:25:09','2025-12-02 21:25:09'),(16,'Test Pengumuman baru','test-pengumuman-baru','<p>Test Pengumuman baru cek gambar&nbsp;</p>','pengumuman-gambar/01KNKE00Z60CY03RGPD36R7AS4.png','2026-04-07','pengumuman/01KNKE00Z8979ARAT1YG10BF8H.xls','2026-04-08 00:00:00','2026-04-16 00:00:00','draft','2026-04-07 00:37:30','2026-04-07 00:37:30');
/*!40000 ALTER TABLE `pengumumen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(2,'view_any_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(3,'create_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(4,'update_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(5,'restore_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(6,'restore_any_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(7,'replicate_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(8,'reorder_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(9,'delete_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(10,'delete_any_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(11,'force_delete_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(12,'force_delete_any_agenda','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(13,'view_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(14,'view_any_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(15,'create_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(16,'update_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(17,'restore_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(18,'restore_any_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(19,'replicate_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(20,'reorder_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(21,'delete_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(22,'delete_any_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(23,'force_delete_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(24,'force_delete_any_banner','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(25,'view_berita','web','2025-11-11 21:05:22','2025-11-11 21:05:22'),(26,'view_any_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(27,'create_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(28,'update_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(29,'restore_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(30,'restore_any_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(31,'replicate_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(32,'reorder_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(33,'delete_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(34,'delete_any_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(35,'force_delete_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(36,'force_delete_any_berita','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(37,'view_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(38,'view_any_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(39,'create_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(40,'update_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(41,'restore_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(42,'restore_any_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(43,'replicate_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(44,'reorder_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(45,'delete_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(46,'delete_any_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(47,'force_delete_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(48,'force_delete_any_data::aplikasi','web','2025-11-11 21:05:23','2025-11-11 21:05:23'),(49,'view_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(50,'view_any_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(51,'create_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(52,'update_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(53,'restore_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(54,'restore_any_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(55,'replicate_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(56,'reorder_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(57,'delete_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(58,'delete_any_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(59,'force_delete_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(60,'force_delete_any_dokumen','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(61,'view_foto','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(62,'view_any_foto','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(63,'create_foto','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(64,'update_foto','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(65,'restore_foto','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(66,'restore_any_foto','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(67,'replicate_foto','web','2025-11-11 21:05:24','2025-11-11 21:05:24'),(68,'reorder_foto','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(69,'delete_foto','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(70,'delete_any_foto','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(71,'force_delete_foto','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(72,'force_delete_any_foto','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(73,'view_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(74,'view_any_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(75,'create_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(76,'update_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(77,'restore_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(78,'restore_any_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(79,'replicate_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(80,'reorder_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(81,'delete_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(82,'delete_any_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(83,'force_delete_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(84,'force_delete_any_halaman::statis','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(85,'view_hero::slider','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(86,'view_any_hero::slider','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(87,'create_hero::slider','web','2025-11-11 21:05:25','2025-11-11 21:05:25'),(88,'update_hero::slider','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(89,'restore_hero::slider','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(90,'restore_any_hero::slider','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(91,'replicate_hero::slider','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(92,'reorder_hero::slider','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(93,'delete_hero::slider','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(94,'delete_any_hero::slider','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(95,'force_delete_hero::slider','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(96,'force_delete_any_hero::slider','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(97,'view_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(98,'view_any_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(99,'create_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(100,'update_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(101,'restore_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(102,'restore_any_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(103,'replicate_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(104,'reorder_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(105,'delete_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(106,'delete_any_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(107,'force_delete_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(108,'force_delete_any_informasi::layanan','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(109,'view_kategori','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(110,'view_any_kategori','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(111,'create_kategori','web','2025-11-11 21:05:26','2025-11-11 21:05:26'),(112,'update_kategori','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(113,'restore_kategori','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(114,'restore_any_kategori','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(115,'replicate_kategori','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(116,'reorder_kategori','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(117,'delete_kategori','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(118,'delete_any_kategori','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(119,'force_delete_kategori','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(120,'force_delete_any_kategori','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(121,'view_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(122,'view_any_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(123,'create_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(124,'update_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(125,'restore_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(126,'restore_any_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(127,'replicate_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(128,'reorder_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(129,'delete_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(130,'delete_any_kategori::dokumen','web','2025-11-11 21:05:27','2025-11-11 21:05:27'),(131,'force_delete_kategori::dokumen','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(132,'force_delete_any_kategori::dokumen','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(133,'view_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(134,'view_any_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(135,'create_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(136,'update_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(137,'restore_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(138,'restore_any_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(139,'replicate_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(140,'reorder_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(141,'delete_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(142,'delete_any_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(143,'force_delete_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(144,'force_delete_any_kategori::foto','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(145,'view_kategori::vidio','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(146,'view_any_kategori::vidio','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(147,'create_kategori::vidio','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(148,'update_kategori::vidio','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(149,'restore_kategori::vidio','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(150,'restore_any_kategori::vidio','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(151,'replicate_kategori::vidio','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(152,'reorder_kategori::vidio','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(153,'delete_kategori::vidio','web','2025-11-11 21:05:28','2025-11-11 21:05:28'),(154,'delete_any_kategori::vidio','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(155,'force_delete_kategori::vidio','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(156,'force_delete_any_kategori::vidio','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(157,'view_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(158,'view_any_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(159,'create_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(160,'update_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(161,'restore_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(162,'restore_any_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(163,'replicate_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(164,'reorder_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(165,'delete_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(166,'delete_any_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(167,'force_delete_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(168,'force_delete_any_kecamatan','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(169,'view_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(170,'view_any_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(171,'create_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(172,'update_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(173,'restore_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(174,'restore_any_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(175,'replicate_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(176,'reorder_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(177,'delete_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(178,'delete_any_kritik::saran','web','2025-11-11 21:05:29','2025-11-11 21:05:29'),(179,'force_delete_kritik::saran','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(180,'force_delete_any_kritik::saran','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(181,'view_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(182,'view_any_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(183,'create_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(184,'update_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(185,'restore_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(186,'restore_any_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(187,'replicate_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(188,'reorder_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(189,'delete_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(190,'delete_any_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(191,'force_delete_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(192,'force_delete_any_menu','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(193,'view_opd','web','2025-11-11 21:05:30','2025-11-11 21:05:30'),(194,'view_any_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(195,'create_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(196,'update_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(197,'restore_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(198,'restore_any_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(199,'replicate_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(200,'reorder_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(201,'delete_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(202,'delete_any_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(203,'force_delete_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(204,'force_delete_any_opd','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(205,'view_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(206,'view_any_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(207,'create_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(208,'update_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(209,'restore_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(210,'restore_any_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(211,'replicate_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(212,'reorder_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(213,'delete_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(214,'delete_any_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(215,'force_delete_pengumuman','web','2025-11-11 21:05:31','2025-11-11 21:05:31'),(216,'force_delete_any_pengumuman','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(217,'view_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(218,'view_any_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(219,'create_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(220,'update_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(221,'restore_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(222,'restore_any_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(223,'replicate_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(224,'reorder_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(225,'delete_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(226,'delete_any_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(227,'force_delete_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(228,'force_delete_any_poling','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(229,'view_role','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(230,'view_any_role','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(231,'create_role','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(232,'update_role','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(233,'delete_role','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(234,'delete_any_role','web','2025-11-11 21:05:32','2025-11-11 21:05:32'),(235,'view_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(236,'view_any_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(237,'create_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(238,'update_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(239,'restore_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(240,'restore_any_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(241,'replicate_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(242,'reorder_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(243,'delete_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(244,'delete_any_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(245,'force_delete_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(246,'force_delete_any_setting','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(247,'view_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(248,'view_any_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(249,'create_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(250,'update_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(251,'restore_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(252,'restore_any_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(253,'replicate_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(254,'reorder_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(255,'delete_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(256,'delete_any_tag','web','2025-11-11 21:05:33','2025-11-11 21:05:33'),(257,'force_delete_tag','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(258,'force_delete_any_tag','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(259,'view_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(260,'view_any_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(261,'create_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(262,'update_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(263,'restore_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(264,'restore_any_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(265,'replicate_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(266,'reorder_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(267,'delete_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(268,'delete_any_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(269,'force_delete_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(270,'force_delete_any_vidio','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(271,'page_ManageSetting','web','2025-11-11 21:05:34','2025-11-11 21:05:34'),(272,'widget_DashboardStatsWidget','web','2025-11-11 21:05:35','2025-11-11 21:05:35'),(273,'widget_VisitorStatsWidget','web','2025-11-11 21:05:35','2025-11-11 21:05:35');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poling`
--

DROP TABLE IF EXISTS `poling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poling` (
  `poling_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pilihan` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`poling_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poling`
--

LOCK TABLES `poling` WRITE;
/*!40000 ALTER TABLE `poling` DISABLE KEYS */;
INSERT INTO `poling` VALUES (3,'Bagaimana Informasi di Website Ini?','Pertanyaan',0,'1',NULL),(4,'Baik','Jawaban',22,'1',3),(6,'Sangat Baik','Jawaban',3,'1',3),(7,'Kurang Baik','Jawaban',1,'1',3);
/*!40000 ALTER TABLE `poling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(210,1),(211,1),(212,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,1),(242,1),(243,1),(244,1),(245,1),(246,1),(247,1),(248,1),(249,1),(250,1),(251,1),(252,1),(253,1),(254,1),(255,1),(256,1),(257,1),(258,1),(259,1),(260,1),(261,1),(262,1),(263,1),(264,1),(265,1),(266,1),(267,1),(268,1),(269,1),(270,1),(271,1),(272,1),(273,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(97,2),(109,2),(121,2),(122,2),(133,2),(134,2),(145,2),(146,2),(147,2),(148,2),(149,2),(150,2),(151,2),(152,2),(153,2),(154,2),(155,2),(156,2),(157,2),(158,2),(159,2),(160,2),(161,2),(162,2),(163,2),(164,2),(165,2),(166,2),(167,2),(168,2),(169,2),(170,2),(193,2),(194,2),(195,2),(196,2),(197,2),(198,2),(199,2),(200,2),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(209,2),(210,2),(211,2),(212,2),(213,2),(214,2),(215,2),(216,2),(217,2),(218,2),(235,2),(236,2),(259,2),(260,2),(261,2),(262,2),(263,2),(264,2),(265,2),(266,2),(267,2),(268,2),(269,2),(270,2),(271,2),(272,2),(273,2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'super_admin','web','2025-11-11 21:01:56','2025-11-11 21:01:56'),(2,'editor','web','2025-11-11 21:29:10','2025-11-11 21:29:10');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT '0',
  `google_analytics_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maps_embed` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maps_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_bupati` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_wakil_bupati` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_tagline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan_kerja` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'LEBAKKAB.GO.ID','Situs resmi layanan & informasi pemerintah daerah.','settings/c6FknsB1zB1bIsIrn4y9uNGzvTnzUU-metaMTY0ODQ1MjQ5MF9hNmJlMTlkMTIwMjk0YjE5NjBkNy5wbmc=-.png',NULL,'Jalan Abdi Negara No. 3 Rangkasbitung, Kabupaten Lebak, Provinsi Banten','admin@lebakkab.go.id','(0252) 5552138','https://wa.me/6281234567890','https://www.facebook.com/lebakkab','https://www.instagram.com/lebak.kab/','https://x.com/lebakkab','https://www.youtube.com/@diskominfolebak2375','© 2025 Pemerintah Kabupaten lebak. All rights reserved.','pemerintah kabupaten lebak','Portal resmi layanan dan informasi Pemerintah Kabupaten lebak',1,'UA-XXXXXXXXX-X','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3965.257195219955!2d106.24506047576604!3d-6.360748762226899!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e4216d5d8954039%3A0x3c7f73c313376fef!2sSekretariat%20Daerah%20Kabupaten%20Lebak!5e0!3m2!1sid!2sid!4v1753938817166!5m2!1sid!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>','https://goo.gl/maps/abc123xyz','settings/01KBYK51WDSDCT7FSTDB3BXHJ7.png','settings/01K22NA7K1HG7Z4AB0MJK5P3PZ.png','Lebakruhay','settings/01K22P58ZQPZWQ0K1C80H5M9MY.png','Pemerintah Kabupaten Lebak','2025-07-30 18:50:28','2025-08-01 01:15:13');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'lebakruhay','lebakruhay','2025-07-24 00:36:48','2025-08-04 22:34:03'),(2,'beritaharini','beritaharini','2025-07-24 00:38:50','2025-08-04 22:34:13');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'moriuz','contact.moriuz@gmail.com',NULL,'$2y$10$ntS.KPMdf9f4xngPFpx3wOUs91Ezg9wg8sqFPG8vegIaJZGC7hLP.','obyL2SVPtWDnc8tiEDeHFhrMYuYMjZJf81yOOhAKPwos7cOPimoInjOEAvQa','2025-07-21 20:36:11','2025-07-21 20:36:11'),(2,'User Biasa','userbiasa@example.com',NULL,'$2y$10$IWe8nVd62ys71QmPFlmV/uGbfo4cMlECEfM.XnTceHxo4jScVpyuG','ELzmzpHl31BTKwmTJ2V6uaIe9kkrv0f8udUoeTXBkivIchuEeamke4qKQmkl','2025-11-11 21:24:41','2025-11-11 21:24:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vidios`
--

DROP TABLE IF EXISTS `vidios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vidios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kategori_vidio_id` bigint unsigned NOT NULL,
  `judul_vidio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sumber_youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vidios_kategori_vidio_id_foreign` (`kategori_vidio_id`),
  CONSTRAINT `vidios_kategori_vidio_id_foreign` FOREIGN KEY (`kategori_vidio_id`) REFERENCES `kategori_vidios` (`id_kategori_vidio`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vidios`
--

LOCK TABLES `vidios` WRITE;
/*!40000 ALTER TABLE `vidios` DISABLE KEYS */;
INSERT INTO `vidios` VALUES (2,2,'BIMBINGAN TEKNIS KELOMPOK INFORMASI MASYARAKAT (KIM) KABUPATEN LEBAK TAHUN 2024','kkkkkk','DairafmbPlo',1,'2025-07-28 23:44:36','2025-07-29 00:45:50'),(3,3,'Penggunaan TTE di ','ini adalah vidio poenggunakan TTD elektronik','2KTtq4ig9sg',1,'2025-07-29 00:44:37','2025-07-29 00:48:14'),(4,2,'Potensi dan Peluang Investasi di Kabupaten Lebak','Potensi dan Peluang Investasi di Kabupaten Lebak','K3PwlVkb8ZQ',1,'2025-07-29 02:34:32','2025-07-29 02:34:32'),(5,5,'wajah','xxxxxxxxxxx','8t8sDbhZMx0',1,'2025-07-29 02:40:43','2025-07-29 02:40:43'),(7,5,'Pemkab Lebak Gelar Upacara Peringati Hari Pahlawan Tahun 2023','Pemkab Lebak Gelar Upacara Peringati Hari Pahlawan Tahun 2023','9NiOuemkUH8',1,'2025-08-07 10:22:18','2025-08-07 10:25:24');
/*!40000 ALTER TABLE `vidios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (123,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','livewire/update',NULL,'2025-10-21 02:50:20'),(124,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-10-21 23:21:10'),(125,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-10-21 23:21:10'),(126,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','livewire/update',NULL,'2025-10-22 00:22:15'),(127,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','livewire/update',NULL,'2025-10-22 01:34:17'),(128,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','/',NULL,'2025-10-22 21:10:58'),(129,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0','api/menus/main',NULL,'2025-10-22 21:25:55'),(130,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/footer',NULL,'2025-10-23 00:34:18'),(131,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-10-23 02:05:59'),(132,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-10-23 02:05:59'),(133,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-10-23 04:45:00'),(134,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-10-23 04:45:00'),(135,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-10-26 18:16:42'),(136,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-10-26 18:16:42'),(137,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/beritas/create',NULL,'2025-10-26 19:16:45'),(138,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-26 20:19:13'),(139,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-26 21:22:13'),(140,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-26 22:23:12'),(141,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-26 23:28:13'),(142,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 00:29:13'),(143,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 01:34:13'),(144,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 02:35:13'),(145,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 03:40:13'),(146,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 04:41:13'),(147,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 05:46:13'),(148,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 06:47:13'),(149,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 07:52:13'),(150,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 08:53:13'),(151,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 09:58:13'),(152,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 10:59:13'),(153,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 12:04:13'),(154,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 13:05:13'),(155,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 14:10:13'),(156,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 15:11:13'),(157,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 16:16:13'),(158,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 17:17:13'),(159,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','storage/banner/Hari%20jadi%20idi.png',NULL,'2025-10-27 18:22:13'),(160,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','livewire/update',NULL,'2025-10-27 19:24:12'),(161,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin',NULL,'2025-10-29 18:53:59'),(162,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-02 19:32:14'),(163,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-02 19:32:14'),(164,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-02 20:38:07'),(165,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/beritas',NULL,'2025-11-02 21:40:16'),(166,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/beritas/create',NULL,'2025-11-02 23:59:11'),(167,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/hero-sliders',NULL,'2025-11-03 01:00:38'),(168,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/menus',NULL,'2025-11-03 02:01:11'),(169,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/data-aplikasis',NULL,'2025-11-03 19:27:14'),(170,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/login',NULL,'2025-11-04 02:10:34'),(171,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-04 20:48:32'),(172,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-04 20:48:32'),(173,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/login',NULL,'2025-11-05 18:23:23'),(174,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/login',NULL,'2025-11-05 22:32:23'),(175,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin/login',NULL,'2025-11-05 22:32:23'),(176,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-05 23:35:30'),(177,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','admin',NULL,'2025-11-06 00:52:59'),(178,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-06 02:06:51'),(179,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-06 02:06:51'),(180,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-06 17:49:20'),(181,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-06 19:53:14'),(182,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-06 19:53:14'),(183,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-06 20:56:45'),(184,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-07 00:37:25'),(185,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-07 00:37:25'),(186,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-09 19:44:35'),(187,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-09 19:44:35'),(188,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-09 20:06:04'),(189,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-09 20:06:04'),(190,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','/',NULL,'2025-11-10 20:44:30'),(191,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin',NULL,'2025-11-10 21:59:27'),(192,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/opds/badan-perencanaan-pembangunan-riset-dan-inovasi-daerah',NULL,'2025-11-10 23:35:16'),(193,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/opds/inspektorat',NULL,'2025-11-11 00:57:27'),(194,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-11 01:57:30'),(195,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-11 01:57:30'),(196,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-11 18:19:30'),(197,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-11 18:19:30'),(198,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36','api/data-aplikasi',NULL,'2025-11-11 19:26:13'),(199,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin/logout',NULL,'2025-11-11 21:05:01'),(200,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin/polings',NULL,'2025-11-12 01:47:05'),(201,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin',NULL,'2025-11-12 18:43:04'),(202,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-12 20:16:41'),(203,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-12 21:22:04'),(204,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-12 22:23:04'),(205,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-12 23:35:04'),(206,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-13 00:44:04'),(207,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/kecamatan/kecamatan-maja',NULL,'2025-11-13 01:44:29'),(208,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-13 18:41:18'),(209,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-13 18:41:18'),(210,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-13 21:05:57'),(211,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/kecamatan/kecamatan-bayah',NULL,'2025-11-13 21:05:57'),(212,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-13 22:21:29'),(213,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-13 22:21:29'),(214,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin',NULL,'2025-11-16 18:55:26'),(215,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-16 19:56:26'),(216,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-16 20:57:23'),(217,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-16 20:57:23'),(218,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36','api/settings/header',NULL,'2025-11-16 21:49:05'),(219,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-16 21:57:32'),(220,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-17 00:16:31'),(221,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/pengumuman',NULL,'2025-11-17 01:16:32'),(222,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin/pengumumen/1/edit',NULL,'2025-11-17 02:16:45'),(223,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','/',NULL,'2025-11-18 19:42:06'),(224,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-18 20:56:51'),(225,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-18 21:58:03'),(226,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/banner-sidebar',NULL,'2025-11-18 22:58:21'),(227,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-20 18:10:15'),(228,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-20 18:10:15'),(229,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36','api/layanan/pendaftaran-pasien-rsud',NULL,'2025-11-20 18:34:16'),(230,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-20 19:12:15'),(231,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-20 19:12:15'),(232,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36','api/menus/main',NULL,'2025-11-20 20:32:24'),(233,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-20 20:32:33'),(234,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin/login',NULL,'2025-11-23 19:31:34'),(235,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-24 18:26:48'),(236,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-24 18:26:48'),(237,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-25 17:27:38'),(238,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-25 17:27:38'),(239,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-11-27 19:13:48'),(240,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-11-27 19:13:48'),(241,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin',NULL,'2025-11-27 20:14:49'),(242,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','livewire/update',NULL,'2025-11-27 21:19:49'),(243,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-12-01 19:25:49'),(244,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-12-01 19:25:49'),(245,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-12-02 18:21:41'),(246,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-12-02 18:21:41'),(247,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-12-02 20:58:59'),(248,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-12-02 20:58:59'),(249,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-12-03 01:17:06'),(250,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-12-03 01:17:06'),(251,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/footer',NULL,'2025-12-04 20:14:43'),(252,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-12-04 20:14:43'),(253,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-12-05 00:44:35'),(254,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-12-05 00:44:35'),(255,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36','api/menus/main',NULL,'2025-12-05 01:13:27'),(256,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36','api/settings/header',NULL,'2025-12-05 01:13:27'),(257,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-12-05 01:45:10'),(258,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-12-05 01:45:10'),(259,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-12-08 01:24:02'),(260,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-12-08 01:24:02'),(261,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-12-08 17:50:21'),(262,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/header',NULL,'2025-12-08 17:50:21'),(263,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin/logout',NULL,'2025-12-09 05:34:28'),(264,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','admin',NULL,'2025-12-09 20:40:35'),(265,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/settings/footer',NULL,'2025-12-14 19:45:13'),(266,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','api/menus/main',NULL,'2025-12-14 19:45:13'),(267,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36','api/menus/main',NULL,'2025-12-14 20:17:46'),(268,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36','/',NULL,'2026-03-31 23:56:55'),(269,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-04-06 00:35:15'),(270,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-04-06 00:35:15'),(271,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-04-06 19:38:26'),(272,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36','api/settings/header',NULL,'2026-04-06 19:41:30'),(273,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-04-07 00:22:10'),(274,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-04-07 00:22:10'),(275,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36','admin/hero-sliders',NULL,'2026-04-07 19:29:55'),(276,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36','api/menus/main',NULL,'2026-04-07 20:19:04'),(277,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','/',NULL,'2026-05-12 19:39:37'),(278,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','admin/shield/roles',NULL,'2026-05-12 21:48:48'),(279,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','admin/shield/roles',NULL,'2026-05-17 17:12:48'),(280,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','admin/login',NULL,'2026-05-17 22:11:02'),(281,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','/',NULL,'2026-05-20 02:21:23'),(282,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','/',NULL,'2026-05-28 18:55:33'),(283,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-05-28 19:55:52'),(284,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-05-28 19:55:52'),(285,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36','/',NULL,'2026-05-28 23:32:08'),(286,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','admin',NULL,'2026-06-07 12:44:34'),(287,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0','admin',NULL,'2026-06-07 12:53:30'),(288,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-07 13:46:28'),(289,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-07 13:46:28'),(290,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-07 13:46:28'),(291,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-07 14:48:27'),(292,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-07 14:48:27'),(293,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-07 14:48:27'),(294,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-07 15:52:29'),(295,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-07 15:52:29'),(296,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-07 15:52:29'),(297,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0','api/settings/header',NULL,'2026-06-07 16:17:32'),(298,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0','api/menus/main',NULL,'2026-06-07 16:17:32'),(299,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0','api/settings/footer',NULL,'2026-06-07 16:17:32'),(300,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-07 16:54:11'),(301,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-07 16:54:11'),(302,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-07 16:54:11'),(303,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-07 17:55:29'),(304,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-07 17:55:29'),(305,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-07 17:55:29'),(306,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-07 19:00:29'),(307,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-07 19:00:29'),(308,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-07 19:00:29'),(309,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-07 20:05:25'),(310,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-07 20:05:25'),(311,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-07 20:05:25'),(312,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-07 21:08:00'),(313,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-07 21:08:00'),(314,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-07 21:08:00'),(315,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-07 22:10:27'),(316,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-07 22:10:27'),(317,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-07 22:10:27'),(318,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-08 11:10:57'),(319,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/hero-sliders',NULL,'2026-06-08 11:10:57'),(320,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-08 11:10:57'),(321,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/front',NULL,'2026-06-08 11:10:57'),(322,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-08 11:10:57'),(323,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-08 22:22:51'),(324,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-08 22:22:51'),(325,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-08 22:22:51'),(326,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-09 01:14:55'),(327,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-09 01:14:55'),(328,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-09 01:14:55'),(329,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/hero-sliders',NULL,'2026-06-09 14:13:17'),(330,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/front',NULL,'2026-06-09 14:13:17'),(331,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-09 14:13:17'),(332,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-09 14:13:17'),(333,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-09 14:13:17'),(334,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-09 15:13:19'),(335,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-09 15:13:19'),(336,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-09 15:13:19'),(337,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-09 16:14:18'),(338,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-09 16:14:18'),(339,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-09 16:14:18'),(340,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-09 17:15:22'),(341,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-09 17:15:22'),(342,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-09 17:15:22'),(343,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/front',NULL,'2026-06-10 00:37:36'),(344,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/footer',NULL,'2026-06-10 00:37:36'),(345,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/menus/main',NULL,'2026-06-10 00:37:36'),(346,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/hero-sliders',NULL,'2026-06-10 00:37:36'),(347,'172.19.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','api/settings/header',NULL,'2026-06-10 00:37:36');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-10  1:03:19
