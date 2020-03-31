-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2020 at 09:37 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beopati`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_album`
--

CREATE TABLE `t_album` (
  `id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_album`
--

INSERT INTO `t_album` (`id`, `title`, `seotitle`, `active`) VALUES
(1, 'Nature', '20190527034902809554383216', 'Y'),
(2, 'Vintage', '20190527034958457628159932', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_category`
--

CREATE TABLE `t_category` (
  `id` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `picture` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_category`
--

INSERT INTO `t_category` (`id`, `id_parent`, `title`, `seotitle`, `description`, `picture`, `active`) VALUES
(1, 0, 'Uncategory', 'uncategory', 'Kategory tidak ditentukan', 'web.jpg', 'Y'),
(2, 0, 'Travel', 'travel', 'Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliquaUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliq', 'web.jpg', 'Y'),
(3, 0, 'Tekno', 'tekno', 'Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliquaUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliq', 'web.jpg', 'Y'),
(4, 0, 'Sport', 'sport', 'Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliquaUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliq', 'web.jpg', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_comment`
--

CREATE TABLE `t_comment` (
  `id` int(5) NOT NULL,
  `id_user` int(5) NOT NULL DEFAULT '0',
  `id_post` int(5) NOT NULL DEFAULT '0',
  `parent` int(5) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(30) NOT NULL DEFAULT '',
  `active` enum('N','Y','X') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_comment`
--

INSERT INTO `t_comment` (`id`, `id_user`, `id_post`, `parent`, `name`, `email`, `comment`, `date`, `ip`, `active`) VALUES
(1, 0, 4, 0, 'Adiman', 'adiman@cifirecms.local', 'Wah, lagi bahas makanan ya..? Enak juga tuh tinutuan kalo campur abon cakalang. hehe...', '2019-12-20 16:55:19', '127.0.0.1', 'Y'),
(2, 0, 2, 0, 'Livia', 'livia@cifirecms.local', 'Rumahku istanaku, jadi rindu kampung halaman yang jauh dimata namun tetap melekat dihati.', '2019-12-20 16:56:13', '127.0.0.1', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_component`
--

CREATE TABLE `t_component` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_gallery`
--

CREATE TABLE `t_gallery` (
  `id` int(5) NOT NULL,
  `id_album` int(5) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_gallery`
--

INSERT INTO `t_gallery` (`id`, `id_album`, `title`, `seotitle`, `picture`) VALUES
(1, 1, 'Nature2', 'nature2-8934506721', 'gallery/nature-1.jpg'),
(2, 1, 'Nature3', 'nature3-8527641309', 'gallery/nature-2.jpg'),
(3, 1, 'Nature4', 'nature4-5897463120', 'gallery/nature-3.jpg'),
(4, 1, 'Nature5', 'nature5-9847502136', 'gallery/nature-4.jpg'),
(5, 1, 'Nature6', 'nature6-3582649071', 'gallery/nature-5.jpg'),
(6, 2, 'Vintage2', 'vintage2-2906751438', 'gallery/vintage-1.jpg'),
(7, 2, 'Vintage3', 'vintage3-4170583296', 'gallery/vintage-2.jpg'),
(8, 2, 'Vintage4', 'vintage4-9208513647', 'gallery/vintage-3.jpg'),
(9, 2, 'Vintage5', 'vintage5-9587624310', 'gallery/vintage-4.jpg'),
(10, 2, 'Vintage6', 'vintage6-2651483079', 'gallery/vintage-5.jpg'),
(11, 2, 'Vintage7', 'vintage7-4936502781', 'gallery/vintage-6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `t_mail`
--

CREATE TABLE `t_mail` (
  `id` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(100) NOT NULL,
  `active` enum('N','Y') NOT NULL DEFAULT 'N',
  `box` enum('in','out') NOT NULL DEFAULT 'in'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `t_menu`
--

CREATE TABLE `t_menu` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `parent_id` int(5) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `position` int(10) NOT NULL,
  `group_id` tinyint(10) UNSIGNED NOT NULL DEFAULT '1',
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_menu`
--

INSERT INTO `t_menu` (`id`, `parent_id`, `title`, `url`, `class`, `position`, `group_id`, `active`) VALUES
(1, 0, 'DASHBOARD', '#', 'header', 1, 1, 'Y'),
(2, 0, 'Dashboard', 'dashboard', 'home', 1, 1, 'Y'),
(3, 0, 'CONTENT', '#', 'header', 1, 1, 'Y'),
(4, 0, 'Post', 'post', 'book-open', 1, 1, 'Y'),
(5, 0, 'Category', 'category', 'folder-plus', 1, 1, 'Y'),
(6, 0, 'Tag', 'tag', 'tag', 1, 1, 'Y'),
(7, 0, 'Comment', 'comment', 'message-square', 1, 1, 'Y'),
(8, 0, 'Pages', 'pages', 'file-text', 1, 1, 'Y'),
(9, 0, 'MEDIA', '#', 'header', 1, 1, 'Y'),
(10, 0, 'Gallery', 'gallery', 'image', 1, 1, 'Y'),
(11, 0, 'File Manager', 'filemanager', 'grid', 1, 1, 'Y'),
(12, 0, 'CONTACT', '#', 'header', 1, 1, 'Y'),
(13, 0, 'Mail', 'mail', 'mail', 1, 1, 'Y'),
(14, 0, 'USERS', '#', 'header', 1, 1, 'Y'),
(15, 0, 'User', 'user', 'users', 1, 1, 'Y'),
(16, 0, 'Permissions', 'permissions', 'shield', 1, 1, 'Y'),
(17, 0, 'MODULE', '#', 'header', 1, 1, 'Y'),
(18, 0, 'Component', 'component', 'box', 1, 1, 'Y'),
(20, 0, 'APPERANCE', '#', 'header', 1, 1, 'Y'),
(21, 0, 'Theme', 'theme', 'aperture', 1, 1, 'Y'),
(22, 0, 'Menu Manager', 'menumanager/?', 'list', 1, 1, 'Y'),
(23, 0, 'Setting', 'setting', 'settings', 1, 1, 'Y'),
(24, 0, 'Home', '/', '', 1, 2, 'Y'),
(25, 0, 'Travel', 'category/travel', '', 1, 2, 'Y'),
(26, 0, 'Tekno', 'category/tekno', '', 1, 2, 'Y'),
(27, 0, 'Sport', 'category/sport', '', 1, 2, 'Y'),
(28, 0, 'Gallery', 'gallery', '', 1, 2, 'Y'),
(29, 0, 'Index Post', 'index-post', '', 1, 2, 'Y'),
(30, 0, 'RSS', 'rss', '', 1, 2, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_menu_group`
--

CREATE TABLE `t_menu_group` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_menu_group`
--

INSERT INTO `t_menu_group` (`id`, `title`) VALUES
(1, 'Backend'),
(2, 'Web');

-- --------------------------------------------------------

--
-- Table structure for table `t_mod`
--

CREATE TABLE `t_mod` (
  `id` int(5) NOT NULL,
  `mod` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_mod`
--

INSERT INTO `t_mod` (`id`, `mod`) VALUES
(1, 'dashboard'),
(2, 'post'),
(3, 'category'),
(4, 'tag'),
(5, 'comment'),
(6, 'pages'),
(7, 'gallery'),
(8, 'filemanager'),
(9, 'mail'),
(10, 'user'),
(11, 'permissions'),
(12, 'component'),
(14, 'theme'),
(15, 'menumanager'),
(16, 'setting'),
(17, 'profile'),
(18, 'cogen');

-- --------------------------------------------------------

--
-- Table structure for table `t_pages`
--

CREATE TABLE `t_pages` (
  `id` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `picture` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_pages`
--

INSERT INTO `t_pages` (`id`, `title`, `seotitle`, `content`, `picture`, `active`) VALUES
(1, 'About Us', 'about-us', '&lt;p style=&quot;text-align: justify;&quot;&gt;CiFIreCMS adalah content management system open source yang di bangun dengan konsep yang menarik dan mudah digunakan. Sangat cocok bagi para developer pemula maupun yang sudah familiar dengan konsep MVC. Meskipun platform CiFireCMS adalah gratis namun tidak kalah dengan platform berbayar lainnya karena dengan dukungan komunitas yang besar maka setiap pengguna pemula maupun advance bisa membangun aplikasi web nya dengan performa premium.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Dengan hadirnya platform CiFireCMS, semoga bisa menjadi solusi bagi anda dalam mengembangkan website.&lt;/p&gt;', 'web.jpg', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_post`
--

CREATE TABLE `t_post` (
  `id` int(5) NOT NULL,
  `id_category` int(5) NOT NULL DEFAULT '0',
  `id_user` int(5) NOT NULL DEFAULT '0',
  `tag` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `datepost` date NOT NULL,
  `timepost` time NOT NULL,
  `picture` text NOT NULL,
  `image_caption` text NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '0',
  `headline` enum('N','Y') NOT NULL DEFAULT 'N',
  `comment` enum('N','Y') NOT NULL DEFAULT 'Y',
  `active` enum('N','Y') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_post`
--

INSERT INTO `t_post` (`id`, `id_category`, `id_user`, `tag`, `title`, `seotitle`, `content`, `datepost`, `timepost`, `picture`, `image_caption`, `hits`, `headline`, `comment`, `active`) VALUES
(1, 2, 1, 'indonesia,jogja,goapindul,wisata', 'Wisata Kekinian di Jogja yang Seru dan Memanjakan Mata', 'wisata-kekinian-di-jogja-yang-seru-dan-memanjakan-mata', '&lt;p&gt;Yogyakarta merupakan salah satu kota yang berada di pulau Jawa. Di mana kota ini memiliki kebudayaan yang sangat kental dan sebagian besar penduduk disana memiliki sifat lemah lembut dan sangat ramah. Tak heran jika para wisatawan betah untuk berlama-lama di kota ini. Selain penduduknya yang ramah, masalah kuliner pun juga tak bisa dikalahkan. Olahan makanan disini sangat beragam dan mereka cenderung tidak pelit akan penggunaan bumbu-bumnya. Sehingga menjadikan rasa makanan yang sangat khas dengan cita rasa lain dari pada yang lain.&lt;/p&gt;\r\n&lt;p&gt;Keistimewaan Yogyakarta tertuang mulai dari keberagaman budaya, adat, kuliner serta wisata nya. Nah, di samping itu semua disini saya akan memberikan informasi tentang daya tarik wisata di kota Yogyakarta ini, yang mampu membuatmu makin betah tinggal disini. Mari kita simak!&lt;/p&gt;\r\n&lt;p&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;br /&gt;&lt;strong&gt;1. Bukit Pengilon&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Bukit Pengilon terkenal akan panorama alamnya yang sangat memukau. Wisata ini bisa terbilang baru, meskipun begitu di media sosial sudah banyak para wisatawan yang mengabadikan foto di tempat ini sehingga dapat menarik minat para wisatawan lain untuk berkunjung ke bukit ini. Lokasi nya berada di Tepus, Purwodadai, Gunung /kidul. Selamat mencoba!&lt;/p&gt;\r\n&lt;p&gt;&lt;br /&gt;&lt;strong&gt;2. Jembatan Pantai Timang&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Selain unik, jembatan ini juga menantang mental para wisatawan lho. Pasalnya jembatan yang menguhubungkan antar pulau ini berada diatas pantai dengan ombak ganas yang menjadi khas Pantai Selatan. Kamu bisa mengunjungi wisata ini di Jalan Pantai Selatan Jawa, Tepus, Gunung kidul. Gimana, kamu berani coba?&lt;/p&gt;\r\n&lt;p&gt;&lt;br /&gt;&lt;strong&gt;3. The Lost World Castle&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Nah, hiburan keluarga yang satu ini berada di Desa Kepuharjo, Cangkringan, Sleman. Tak perlu jauh-jauh ke Eropa, kamu bisa menemukan segala macam castle dengan tema yang unik di sini. Selain itu kamu juga bisa menemukan rumah hobbit yang baru-baru ini menjadi spot paling populer dan juga ada Galeri 3D serta Paradise Gate. Dijamin pasti kamu akan betah di sini!&lt;/p&gt;\r\n&lt;p&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;br /&gt;&lt;strong&gt;4. Pantai Wedi Ombo&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Salah satu pantai di Jogja ini memiliki spot khasnya yaitu kolam alami di tepi laut. Kolam yang berada di tengah-tengah karang yang berjajar rapi ini, berada pas disamping lautan. Kamu bisa dengan tenang menikmati segarnya air dan pemandangan yang eksotik. Namun, kamu harus tetap berhaati-hati meskpiun aman terkadang ombak ganas bisa mencapai kolam ini sehingga ditakutkan dapat menarik kamu ke tengah laut atau bahkan mendorong kamu ke batu karang yang keras. Lokasi pantai ini berada di Desa Jepitu, Gunung Kidul.&lt;/p&gt;\r\n&lt;p&gt;&lt;br /&gt;&lt;strong&gt;5. Goa Jomblang&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Jika kamu suka tantangan, kunjungi wisata yang satu ini. Disini kamu akan disuguhkan suasana alam berbeda dari biasanya. Tempat yang pernah dijadikan lokasi syuting film Amazing Race season 19 ini, merupakan sebuah goa yang sudah memiliki umur mencapai puluhan tahun. Jika kamu ingin mengunjungi tempat ini, alangkah baiknya kamu reservasi terlebih dahulu. Karena pengunjung disini dibatasi dan persiapakan beberapa pekaian ganti pula. Wisata ini berlokasikan di Semanu, Gunung Kidul. Jangan lupa siapkan kamera untuk mengabadikan momen indah di sini&lt;/p&gt;\r\n&lt;p&gt;&lt;br /&gt;&lt;strong&gt;6. Candi&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Di Jogja kamu bisa menemui 2 candi terbesar di Asia. Yaitu candi prambanan dan candi Borobudur. Situs ini juga menjadi situs warisan budaya dunia oleh UNESCO. Dua candi tersebut mengusung kebudayaan berbeda. Di mana Candi Prambanan merupakan Candi Hindu dan Candi Borobudur merupakan Candi Budha. Saat hari-hari besar, ke-2 candi ini sering dikunjungi baik itu untuk kegiatan kebudayaan maupun sekedar berwisata. lokasinya pun berbeda, Candi Prambanan terletak di prambanan sedangkan Candi Borobudur berada di Magelang.&lt;/p&gt;\r\n&lt;p&gt;Itulah objek wisata di Jogja yang sangat memukau. Bagaimana? Kamu tertarik untuk mengunjunginya? Sebelum itu, jangan lupa nabung dulu ya! Biar makin banyak tabungan untuk dana liburan. Tentu, kamu gak mau kan kalau sudah jauh-jauh ke jogja tapi hanya beberapa objek wisata saja yang terkunjungi. Padahal yang lain juga masih banyak yang bagus. Hehehe&lt;/p&gt;\r\n&lt;p style=&quot;text-align: right;&quot;&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;strong&gt;sastrawacana&lt;/strong&gt;&lt;/span&gt;&lt;br /&gt;&lt;a href=&quot;https://www.hipwee.com/list/7-wisata-kekinian-di-jogja-yang-seru-dan-memanjakan-mata-nggak-bakal-nyesel-liburan-ke-sana&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;https://www.hipwee.com/list/7-wisata-kekinian-di-jogja-yang-seru-dan-memanjakan-mata-nggak-bakal-nyesel-liburan-ke-sana&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;', '2019-06-12', '10:14:09', 'travel-5.jpg', 'Goa Pindul', 0, 'N', 'Y', 'Y'),
(2, 2, 1, 'poso,sulteng,festivaldanauposo,budaya,wisata', 'Pesona Tana Sintuwu Maroso', 'pesona-tana-sintuwu-maroso', '&lt;p style=&quot;text-align: justify;&quot;&gt;Bak permata&amp;nbsp; yang belum diasah, mungkin pepetah tersebut kiranya cocok untuk menggambarkan potensi wisata yang dimiliki Poso. Kabupaten dengan semboyan Tana Sintuwu Maroso ini memiliki pesona pantai yang luar biasa indah. Salah satunya adalah Pantai Imboek, yang terletak diperbatasan Kelurahan Lawangan dan Tegal Rejo atau sekitar 5 km dari Kota Poso.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Apabila Anda mengunjungi pantai ini mata anda akan dimanjakan dengan laut biru yang jernih dengan pasir putih yang halus. Bahkan saat ini sudah ada wahana permainan seperti banana boat yang di kelola oleh investor lokal di Pantai Imboek. Selain menikmati wahana permainan banana boat, anda juga dapat menyewa perahu batang yang disewakan oleh warga sekitar. Namun, bila anda datang ke Pantai Imboek sekedar ingin menikmati suasana alam pantai, anda dapat datang di sore hari untuk menyaksikan sunset sambil menikmati gorengan.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Apabila Pantai Imboek belum cukup memuaskan, anda dapat menikmati Pantai Siuri. Pantai ini terletak di Desa Toinasa, kecamatan Pamona Barat. Untuk mencapai pantai tersebut diperlukan waktu sekitar 57 km dari Poso Kota. Akses menuju pantai tersebut cukup mudah, pengunjung dapat menggunakan kendaraan roda dua atau roda empat. Namun, jalur yang dilalui cukup sempit sehingga mungkin hanya cukup dilalui sebuah kendaraan. Selain sempit, jalur menuju pantai Siuri cukup berliku. Tapi anda tak perlu khawatir, jauhnnya perjalanan yang ditempuh sesuai dengan keindahan alam yang ditawarkan Pantai Siuri.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Berbeda dengan Pantai Imboek yang memiliki pasir putih, pasir di Pantai Siuri berwarna keemasan. Pesona laut yang ditawarkan pun tak kalah indah dari Pantai Imboek. Selain kedua pantai diatas Anda juga dapat menikmati beberapa pantai lain Pantai Karawasa di Madale yang menawarkan kemolekan alam bawah laut.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Pantai Karawasa merupakan &lt;em&gt;spot diving&lt;/em&gt; yang sangat indah. Bagi anda yang ingin menikmati kekayaan bahari di Poso, pantai ini merupakan tujuan yang tepat. Ada juga pantai lain seperti Pantai Toini yang terletak di Desa Toini, &amp;nbsp;Pantai Seribu Bintang yang terletak di desa Sa&amp;rsquo;atu dan lainnya. Kedua pantai ini menyajikan&amp;nbsp; suasana pantai yang masih alami dan jauh dari tangan-tangan nakal para wisatawan. Hal ini karena kedua pantai ini memang kurang populer dibanding pantai lain di Poso. Selain dapat menikmati suasana pantai yang masih alami, di Pantai Seribu Bintang anda juga dapat melihat ratusan atau bahkan mungkin ribuan bintang laut. Inilah mungkin yang menginspirasi nama dari pantai Seribu Bintang. Bukankah terasa menyenangkan dapat menikmati eksotisme kedua pantai yang masih alami ini.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Bagi Anda yang tidak begitu menyukai wisata bahari, Poso masih memiliki objek wisata lain yang dapat Anda nikmati seperti Danau Poso. Bila anda sedang berada di Poso, Danau Poso merupakan salah satu destinasi yang harus Anda kunjungi. Danau dengan luas 32.300 hektar ini memiliki keunikan yaitu berpasir putih dan emas serta bergelombang. Panorama alam berupa bukit dengan pepohonan yang rimbun akan membuat segala beban pikiran anda hilang.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Di Danau Poso terdapat suatu acara adat yang tiap tahun diadakan, yaitu Festival Danau Poso. Festival danau poso merupakan wujud rasa syukur masyarakat atas pemberian Tuhan Yang Maha Esa. Festival yang diselenggarakan oleh Dinas Pariwisata Poso ini rutin diperingati tiap bulan Agustus. Untuk dapat melihat Festival Danau Poso, pengunjung tidak perlu repot-repot mendaftar terlebih dahulu, karena Festival Danau Poso terbuka untuk umum. Festival Danau Poso menampilkan beragam kesenian dan budaya khas Poso, pemilihan putra-putri pariwisata Sulawesi Tengah, serta bazaar beragam souvenir dan kuliner khas Poso.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Selain wisata pantai dan danau, Poso masih memiliki objek wisata lain yang dapat anda masukkan kedalam daftar liburan Anda, seperti Bancea (Taman Anggrek) yang terletak di Tentena, Air terjun Saluopa. Air Terjun Kilo, Taman Nasional Lore Lindu, Gua Tangkaboba, Situs megalitik di Lore, dan Lembah Napu.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Serta masih banyak destinasi wisata lain yang dimiliki Poso. Semuanya menawarkan keindahan alam yang masih asli. Namun sayang, pengelolaan pariwisata di Poso belum menjadi perhatian utama pemerintah, sehingga beberapa objek wisata menjadi kurang terawat.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Nah, ternyata cukup banyak destinasi wisata asik yang dimiliki Poso bukan! Jadi tidak salah untuk memasukkan Poso menjadi salah satu kota tujuan anda ketika berlibur ke Sulawesi Tengah.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: right;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;Lavia Farareta&lt;/span&gt;&lt;/strong&gt;&lt;br /&gt;&lt;em&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;&lt;a title=&quot;Pesona Tana Sintuwu Maroso&quot; href=&quot;https://travelnatic.com/wisata-poso-pesona-tana-sintuwu-maroso/&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;https://travelnatic.com/wisata-poso-pesona-tana-sintuwu-maroso&lt;/a&gt;&lt;/span&gt;&lt;/em&gt;&lt;/p&gt;', '2019-06-29', '13:19:35', 'travel-4.jpg', 'Penari Tarian Poso di Festival Danau Poso. Dok. Lavia Farareta', 7, 'Y', 'Y', 'Y'),
(3, 2, 1, 'wedding,article,wisata', 'Destinasi Wisata Hits yang Cocok Buat Foto Pre Wedding', 'destinasi-wisata-hits-yang-cocok-buat-foto-pre-wedding', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipiscing elit curabitur nec enim id enim imperdiet commodo. Nunc id ante ac leo tempor facilisis. Mauris vulputate interdum ipsum, eu laoreet augue. Sed vestibulum a urna at fermentum. Nullam blandit dolor sollicitudin elit rutrum dictum. Pellentesque eleifend finibus lacus, vel mollis libero rutrum sed. Sed quam orci, euismod ac ipsum eu, malesuada pellentesque nunc. AdimanCifi zorbi egestas ligula a elit aliquet, a commodo quam fermentum. Aenean eget dictum purus. Sed libero nisi, euismod non semper a, bibendum vitae nulla.&lt;/p&gt;\r\n&lt;p&gt;Praesent dignissim lacinia enim non blandit suspendisse potenent esque commodo tristique ipsum ut tincidunt. Nam dapibus neque mi, sit amet euismod arcu vestibulum vel. Suspendisse vulputate congue ante ac condimentum. Praesent ultrices semper nunc eget facilisis. Donec quis leo et ex convallis pellentesque non quis mauris. Aenean a diam viverra, maximus est id, tempor diam. Praesent placerat pharetra orci et facilisis. Livia Etiam ipsum tellus, lacinia at augue aliquam, iaculis cursus est. Elinda Quisque vel justo vestibulum, tristique purus in, fermentum ante. Duis fermentum nibh vitae nulla iaculis, et blandit lectus varius. Nunc eget quam consectetur nisi eleifend maximus ut eget urna. Morbi fringilla ultricies nulla, non malesuada tellus faucibus vitae. In ipsum dolor, suscipit eu lobortis non, condimentum eget est. Nullam dictum ante eu eros lobortis mattis.&lt;/p&gt;', '2019-06-04', '09:20:25', 'travel-3.jpg', 'stone garden via www.instagram.com', 0, 'Y', 'Y', 'Y'),
(4, 2, 1, 'manado,indonesia,tinutuan,kuliner,wisata', 'Kuliner Halal yang Wajib Dicicipi di Manado', 'kuliner-halal-yang-wajib-dicicipi-di-manado', '&lt;p&gt;Tak afdol rasanya jika datang ke Manado hanya untuk menikmati alam, budaya dan kerahaman warganya tanpa mencicipi kuliner khasnya. Berikut KompasTravel rangkum 10 kuliner yang wajib Anda cicipi saat bertandang ke Manado. Tentu, makanan dalam daftar ini adalah kuliner halal.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;1. Tinutuan&lt;br /&gt;&lt;br /&gt;&lt;/strong&gt;Ini yang pertama, masakan khas Manado yang sudah sangat tersohor. Tinutuan merupakan makanan yang dibuat dari campuran berbagai sayuran hijau, dimasak dengan bubur beras dan labu kuning. Sangat cocok disantap sebagai sarapan.&lt;/p&gt;\r\n&lt;p&gt;Di hotel-hotel bintang 3 ke atas, biasanya tinutuan menjadi salah satu menu untuk breakfast. Di Manado ada pusat kuliner tinutuan. Datangilah wakeke, ada puluhan warung makan mulai dari yang sederhana sampai mewah menawarkan menu tinutuan.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;2. Cakalang Fufu&lt;br /&gt;&lt;/strong&gt;&lt;br /&gt;Ikan cakalang (Katsuwonus pelamis) atau tongkol putih yang diasapi (fufu) merupakan salah satu menu khas di Manado. Ikan yang masih segar dan langsung diasapi ini kemudian diolah menjadi berbagai menu. Salah satu olahan paling enak adalah cakalang fufu saus, atau diolah menjadi cakalang fufu santan.&lt;/p&gt;\r\n&lt;p&gt;Sajian menu ini sangat lezat disantap saat masih panas. Banyak warung makan tradisional yang menyajikan menu cakalang fufu. Jika ingin membawa pulang, bisa mendatangi pasar tradisional atau ke jembatan Sario. Di sana banyak penjual cakalang fufu yang siap di-packing untuk dibawa pulang sebagai oleh-oleh.&lt;/p&gt;\r\n&lt;p&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;3. Dabu-dabu&lt;br /&gt;&lt;/strong&gt;&lt;br /&gt;Orang Manado nyaris tak bisa makan tanpa ditemani rasa pedas. Cabe (rica) menjadi salah satu bumbu yang paling berfluktuasi harganya karena paling dicari. Cabe diolah menjadi dabu-dabu (sambal).&lt;/p&gt;\r\n&lt;p&gt;Berbeda dengan sambal di daerah lain, dabu-dabu Manado sangat pedas. Beberapa macam dabu-dabu seperti dabu-dabu bakar, dabu-dabu iris, dabu-dabu lemong dan dabu-dabu lilang mudah dijumpai di rumah makan yang menyajikan ikan bakar.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;4. Sambal Roa&lt;br /&gt;&lt;/strong&gt;&lt;br /&gt;Ini adalah salah satu sambal khas Manado lainnya. Sangat khas, karena dibuat dari cabe yang dicampur dengan ikan roa (sejenis ikan terbang) yang sebelumnya diasap hingga kering sekali. Ikan roa yang dicampur dengan cabe itu sebelumnya ditumbuk menjadi sangat halus, lalu dimasak dengan sedikit minyak. Adonan dicampur dengan cabe rawit, bawang merah, bawang putih, tomat, garam serta gula, kemudian ditumis. Sambal roa sangat cocok menjadi pelengkap kala menyantap tinutuan. Jangan heran jika sambal roa harganya lumayan mahal.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;5. Woku Blanga&lt;br /&gt;&lt;/strong&gt;&lt;br /&gt;Ini merupakan salah satu cara orang Manado mengolah ikan. Woku blanga sejatinya dimasak di dalam belanga yang terbuat dari tanah liat. Woku merupakan campuran bumbu daun jeruk, daun pandan, daun kunyit, daun serai, kemangi dan ditambah dengan bumbu-bumbu lainnya sehingga beraroma wangi dan bercitrarasa pedas dan terasa segar. Beberapa jenis ikan yang biasa diolah menjadi masakan woku blanga adalah ikan kerapu, ikan nila, ikan mas, termasuk kepiting dan udang. Anda bisa menjumpai woku blanga di restoran khas Minahasa dan warung-warung makan tradisional.&lt;/p&gt;\r\n&lt;p&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;6. Nasi Kuning&lt;br /&gt;&lt;/strong&gt;&lt;br /&gt;Berbeda dengan nasi kuning di daerah lain, nasi kuning khas Manado mengandalkan pelengkapnya berupa irisan ikan cakalang, serta daging sapi yang diolah dalam bentuk irisan kecil-kecil. Telur rebus juga menjadi pelengkap serta ditaburi berbagai bumbu lainnya. Nasi kuning khas Manado sering disajikan atau dibungkus di daun woka (sejenis janur). Di Wakeke juga banyak disajikan menu nasi kuning selain tinutuan. Tetapi yang paling terkenal adalah nasi kuning di Kampung Kodo atau di Rumah Makan Saroja dan Rumah Makan Selamat Pagi. Jika malam hari, puluhan penjual nasi kuning bertaburan di Komo, yang membuka lapak hingga subuh.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;7. Pisang Goreng&lt;br /&gt;&lt;/strong&gt;&lt;br /&gt;Apa yang istimewa dengan pisang goreng? Jangan salah, di Manado, pisang goreng disantap dengan dabu-dabu (sambal). Terutama sambal roa. Selain pisang sepatu yang umum, di Manado ada pisang goreng yang sangat khas. Pisang goreng goroho namanya. Pisang ini digoreng justru saat belum masak.&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;Penulis : &lt;strong&gt;Kontributor Manado, Ronny Adolof Buol&lt;/strong&gt;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;Sumber &lt;a href=&quot;https://travel.kompas.com/read/2017/02/16/130300727/10.kuliner.halal.yang.wajib.dicicipi.di.manado&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;https://travel.kompas.com/read/2017/02/16/130300727/10.kuliner.halal.yang.wajib.dicicipi.di.manado&lt;/a&gt;&lt;/span&gt;&lt;/p&gt;', '2019-06-27', '07:21:05', 'travel-1.jpg', 'Kuliner khas Manado, Tinutuan atau dikenal juga dengan sebutan Bubur Manado.', 9, 'N', 'Y', 'Y'),
(5, 2, 1, 'article,liburan,wisata', 'Destinasi Wisata Jepang yang Wajib Dikunjungi', 'destinasi-wisata-jepang-yang-wajib-dikunjungi', '&lt;p&gt;Jepang terdiri dari 6.852 pulau di Samudra Pasifik, dengan 43 prefektur berbeda. Ada begitu banyak yang bisa dilihat dan dilakukan di Jepang, kamu mungkin tidak bisa menyelesaikan semuanya dalam sekali kunjungan. Jika kamu merencanakan perjalanan ke sana, pastikan untuk mempertimbangkan mengunjungi 10 destinasi wisata Jepang teratas ini saat kamu berada di sana.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Hotel sumber mata air panas&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Jika kamu mencari liburan yang santai, sebaiknya mempertimbangkan untuk menginap di &quot;Onsen Ryokan,&quot; yang merupakan hotel sumber air panas. Mata air panas Jepang terkenal karena khasiat penyembuhannya. Beberapa bahkan mengklaim bahwa airnya membersihkan kulit dan membalikkan penuaan. Ada hotel sumber air panas gaya modern dan tradisional untuk kamu pilih, dan ke mana pun kamu pergi di Jepang, dijamin mendapatkan sumber air panas terdekat.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Gunung Fuji&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Jika kamu menyukai alam bebas, pertimbangkan untuk mendaki Gunung Fuji setinggi 12.388 kaki. Jalan setapak hanya buka dari Juli hingga September, karena cuaca menjadi sangat dingin di puncak gunung. Jika hanya di sana selama sehari, kamu dapat naik ke stasiun ke-5, yang merupakan perjalanan pulang pergi 12 jam. Jika merasa ingin bertualang, kamu dapat memesan akomodasi di dekat puncak gunung, sehingga dapat menyaksikan matahari terbit bersama dengan pendaki gunung lainnya. Perlu diingat bahwa ini membutuhkan waktu 24 jam penuh untuk mendaki ke puncak. Jika tidak siap untuk mendaki puncak, kamu masih dapat mengambil gambar dari jauh. Tempat paling populer untuk foto Gunung Fuji adalah Gotemba Peace Park di Gotemba City, yang buka sepanjang tahun.&lt;/p&gt;\r\n&lt;p&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Tokyo DisneySea&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Tokyo DisneySea, taman bertema akuatik, menjadikannya tempat sempurna untuk dikunjungi selama musim panas. Tempat ini menampilkan banyak film bertema air Disney seperti The Little Mermaid, Finding Nemo, dan 20.000 Leagues Under the Sea, serta beberapa film remaster, seperti The Tower of Terror. Ada juga seluruh area yang didedikasikan untuk Aladdin yang disebut &quot;The Arabian Coast,&quot; yang akan membuatmu merasa seolah benar-benar berjalan di sekitar kota Agrabah. Selain wahana, akomodasi taman sangat rinci, seperti Hotel Miracosta, yang merupakan rekreasi pelabuhan Mediterania. Banyak orang menyebut Tokyo DisneySea sebagai &quot;taman hiburan terbaik dunia&quot;, tetapi kamu hanya perlu mengunjungi untuk menilainya sendiri.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Akihabara dan Harajuku&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Akihabara adalah impian penggemar anime yang menjadi kenyataan. Jalanan dipenuhi toko-toko besar yang bertema cosplay, anime, manga, dan elektronik. Tempat ini benar-benar normal untuk melihat penggemar berjalan-jalan mengenakan cosplay lengkap. Bagi kamu yang tidak tertarik dengan anime, Harajuku adalah distrik mode, dan ini adalah tempat sempurna untuk membeli pakaian yang tidak dapat kamu temukan di rumah.&lt;/p&gt;\r\n&lt;p&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Menara Tokyo dan SkyTree&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Tempat wisata paling terkenal di Jepang adalah Menara Tokyo, yang dibangun pada 1950-an sebagai antena untuk siaran TV. Desainnya terinspirasi oleh Menara Eiffel di Prancis. Wisatawan naik menara ke dek observasi teratas setiap hari. Namun, Menara Tokyo masih jauh dari titik tertinggi di kota. Menara tertinggi disebut SkyTree. Kedua menara ini memberikan pemandangan Tokyo yang menakjubkan, dan SkyTree bahkan memiliki pusat perbelanjaan serta akuarium sendiri. Perlu diingat bahwa tiket untuk kedua bangunan ini bisa cukup mahal, dan antreannya sangat panjang.&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;Kastil Matsumoto&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Kastil Matsumoto adalah salah satu kastil yang tersisa di Jepang. Kastil itu dibangun pada tahun 1500-an, dan menampung 23 penguasa feodal yang berbeda selama masa hidupnya. Musim semi adalah salah satu waktu paling populer untuk dikunjungi, karena bunga sakura di sekitar perkebunan mekar penuh. Bagian dalam kastil telah diubah menjadi museum, menampilkan senjata yang digunakan dalam pertempuran di halaman kastil.&lt;/p&gt;\r\n&lt;p&gt;&lt;em&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;Oleh : Rangga Dio Hayyunuski&lt;br /&gt;&lt;/span&gt;&lt;/strong&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;Sumber : &lt;/span&gt;&lt;a href=&quot;https://www.idntimes.com/travel/destination/rangga-dio-hayyunuski/10-destinasi-wisata-menarik-yang-wajib-kamu-kunjungi-di-jepang-c1c2/full&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;&lt;span style=&quot;font-size: 12px;&quot;&gt;idntimes.com&lt;/span&gt;&lt;/a&gt;&lt;/em&gt;&lt;/p&gt;', '2019-07-05', '09:10:50', 'travel-2.jpg', '', 0, 'N', 'Y', 'Y'),
(6, 3, 1, 'intel,article,tekno', 'Intel Perkenalkan Arsitektur GPU &quot;Ponte Vecchio&quot;', 'intel-perkenalkan-arsitektur-gpu-ponte-vecchio', '&lt;p style=&quot;text-align: justify;&quot;&gt;Praesent dignissim lacinia enim non blandit suspendisse potenent esque commodo tristique ipsum ut tincidunt. Nam dapibus neque mi, sit amet euismod arcu vestibulum vel. Suspendisse vulputate congue ante ac condimentum. Praesent ultrices semper nunc eget facilisis. Donec quis leo et ex convallis pellentesque non quis mauris. Aenean a diam viverra, maximus est id, tempor diam. Praesent placerat pharetra orci et facilisis. Livia Etiam ipsum tellus, lacinia at augue aliquam, iaculis cursus est. Elinda Quisque vel justo vestibulum, tristique purus in, fermentum ante. Duis fermentum nibh vitae nulla iaculis, et blandit lectus varius. Nunc eget quam consectetur nisi eleifend maximus ut eget urna. Morbi fringilla ultricies nulla, non malesuada tellus faucibus vitae. In ipsum dolor, suscipit eu lobortis non, condimentum eget est. Nullam dictum ante eu eros lobortis mattis.&lt;/p&gt;\r\n&lt;p&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Lillycitudin convallis diam in tincidunt. Mauris vehicula vel tellus a imperdiet. Sed sed rhoncus ipsum. Pellentesque vulputate lectus porttitor tellus sagittis fringilla nec non mi. Duis mattis suscipit tellus. Quisque ullamcorper viverra ultricies. Curabitur sit amet elit eget sapien hendrerit pellentesque eget a arcu. In sapien felis, tempus sit amet justo aliquet, blandit condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent tempus nisi nec leo varius ornare. Donec sit amet erat fringilla ex luctus dapibus vestibulum commodo lectus. Curabitur enim eros, dapibus eget volutpat in, euismod id felis. Nunc elementum posuere eros in molestie. Vivamus ultricies porttitor lacus, vel fermentum ipsum lacinia nec. Etiam vitae maximus justo.&lt;/p&gt;', '2019-11-21', '10:30:20', 'tekno-3.jpg', '', 0, 'N', 'Y', 'Y'),
(7, 3, 1, 'tekno,asusrog,article', 'Mengintip Isi Kemasan Asus ROG Phone II', 'mengintip-isi-kemasan-asus-rog-phone-ii', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipiscing elit curabitur nec enim id enim imperdiet commodo. Nunc id ante ac leo tempor facilisis. Mauris vulputate interdum ipsum, eu laoreet augue. Sed vestibulum a urna at fermentum. Nullam blandit dolor sollicitudin elit rutrum dictum. Pellentesque eleifend finibus lacus, vel mollis libero rutrum sed. Sed quam orci, euismod ac ipsum eu, malesuada pellentesque nunc. AdimanCifi zorbi egestas ligula a elit aliquet, a commodo quam fermentum. Aenean eget dictum purus. Sed libero nisi, euismod non semper a, bibendum vitae nulla.&lt;/p&gt;\r\n&lt;p&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p&gt;Praesent dignissim lacinia enim non blandit suspendisse potenent esque commodo tristique ipsum ut tincidunt. Nam dapibus neque mi, sit amet euismod arcu vestibulum vel. Suspendisse vulputate congue ante ac condimentum. Praesent ultrices semper nunc eget facilisis. Donec quis leo et ex convallis pellentesque non quis mauris. Aenean a diam viverra, maximus est id, tempor diam. Praesent placerat pharetra orci et facilisis. Livia Etiam ipsum tellus, lacinia at augue aliquam, iaculis cursus est. Elinda Quisque vel justo vestibulum, tristique purus in, fermentum ante. Duis fermentum nibh vitae nulla iaculis, et blandit lectus varius. Nunc eget quam consectetur nisi eleifend maximus ut eget urna. Morbi fringilla ultricies nulla, non malesuada tellus faucibus vitae. In ipsum dolor, suscipit eu lobortis non, condimentum eget est. Nullam dictum ante eu eros lobortis mattis.&lt;/p&gt;\r\n&lt;p&gt;&lt;!-- pagebreak --&gt;&lt;/p&gt;\r\n&lt;p&gt;Lillycitudin convallis diam in tincidunt. Mauris vehicula vel tellus a imperdiet. Sed sed rhoncus ipsum. Pellentesque vulputate lectus porttitor tellus sagittis fringilla nec non mi. Duis mattis suscipit tellus. Quisque ullamcorper viverra ultricies. Curabitur sit amet elit eget sapien hendrerit pellentesque eget a arcu. In sapien felis, tempus sit amet justo aliquet, blandit condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent tempus nisi nec leo varius ornare. Donec sit amet erat fringilla ex luctus dapibus vestibulum commodo lectus. Curabitur enim eros, dapibus eget volutpat in, euismod id felis. Nunc elementum posuere eros in molestie. Vivamus ultricies porttitor lacus, vel fermentum ipsum lacinia nec. Etiam vitae maximus justo.&lt;/p&gt;', '2019-12-06', '04:23:07', 'tekno-2.jpg', 'Asus ROG Phone II', 0, 'N', 'Y', 'Y'),
(8, 3, 1, 'article,facebook,tekno', 'Facebook Tetap Bisa Melacak Lokasi Pengguna Meski Tanpa Izin', 'facebook-tetap-bisa-melacak-lokasi-pengguna-meski-tanpa-izin', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipiscing elit curabitur nec enim id enim imperdiet commodo. Nunc id ante ac leo tempor facilisis. Mauris vulputate interdum ipsum, eu laoreet augue. Sed vestibulum a urna at fermentum. Nullam blandit dolor sollicitudin elit rutrum dictum. Pellentesque eleifend finibus lacus, vel mollis libero rutrum sed. Sed quam orci, euismod ac ipsum eu, malesuada pellentesque nunc. AdimanCifi zorbi egestas ligula a elit aliquet, a commodo quam fermentum. Aenean eget dictum purus. Sed libero nisi, euismod non semper a, bibendum vitae nulla.&lt;/p&gt;\r\n&lt;p&gt;Praesent dignissim lacinia enim non blandit suspendisse potenent esque commodo tristique ipsum ut tincidunt. Nam dapibus neque mi, sit amet euismod arcu vestibulum vel. Suspendisse vulputate congue ante ac condimentum. Praesent ultrices semper nunc eget facilisis. Donec quis leo et ex convallis pellentesque non quis mauris. Aenean a diam viverra, maximus est id, tempor diam. Praesent placerat pharetra orci et facilisis. Livia Etiam ipsum tellus, lacinia at augue aliquam, iaculis cursus est. Elinda Quisque vel justo vestibulum, tristique purus in, fermentum ante. Duis fermentum nibh vitae nulla iaculis, et blandit lectus varius. Nunc eget quam consectetur nisi eleifend maximus ut eget urna. Morbi fringilla ultricies nulla, non malesuada tellus faucibus vitae. In ipsum dolor, suscipit eu lobortis non, condimentum eget est. Nullam dictum ante eu eros lobortis mattis.ulum molestie turpis a commodo imperdiet. Praesent ac ante lectus.&lt;/p&gt;', '2019-12-20', '06:23:47', 'tekno-1.jpg', '', 0, 'N', 'Y', 'Y'),
(9, 4, 1, 'article,olimpiade', 'Olimpiade Musim Panas', 'olimpiade-musim-panas', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipiscing elit curabitur nec enim id enim imperdiet commodo. Nunc id ante ac leo tempor facilisis. Mauris vulputate interdum ipsum, eu laoreet augue. Sed vestibulum a urna at fermentum. Nullam blandit dolor sollicitudin elit rutrum dictum. Pellentesque eleifend finibus lacus, vel mollis libero rutrum sed. Sed quam orci, euismod ac ipsum eu, malesuada pellentesque nunc. AdimanCifi zorbi egestas lig&lt;/p&gt;\r\n&lt;p&gt;Lillycitudin convallis diam in tincidunt. Mauris vehicula vel tellus a imperdiet. Sed sed rhoncus ipsum. Pellentesque vulputate lectus porttitor tellus sagittis fringilla nec non mi. Duis mattis suscipit tellus. Quisque ullamcorper viverra ultricies. Curabitur sit amet elit eget sapien hendrerit pellentesque eget a arcu. In sapien felis, tempus sit amet justo aliquet, blandit condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Prelit ut condimentum vulputate. Vestibulum molestie turpis a commodo imperdiet. Praesent ac ante lectus.&lt;/p&gt;', '2019-08-15', '08:15:02', 'sport-4.jpg', '', 0, 'N', 'Y', 'Y'),
(10, 4, 1, 'alessandrodelpiero,bola,sport', 'Melihat Aktivitas Alessandro Del Piero Setelah Gantung Sepatu', 'melihat-aktivitas-alessandro-del-piero-setelah-gantung-sepatu', '&lt;p&gt;Lorem ipsum dolor sit amet consectetur adipiscing elit curabitur nec enim id enim imperdiet commodo. Nunc id ante ac leo tempor facilisis. Mauris vulputate interdum ipsum, eu laoreet augue. Sed vestibulum a urna at fermentum. Nullam blandit dolor sollicitudin elit rutrum dictum. Pellentesque eleifend finibus lacus, vel mollis libero rutrum sed. Sed quam orci, euismod ac ipsum eu, malesuada pellentesque nunc. AdimanCifi zorbi egestas ligula a elit aliquet, a commodo quam fermentum. Aenean eget dictum purus. Sed libero nisi, euismod non semper a, bibendum vitae nulla.&lt;/p&gt;\r\n&lt;p&gt;Praesent dignissim lacinia enim non blandit suspendisse potenent esque commodo tristique ipsum ut tincidunt. Nam dapibus neque mi, sit amet euismod arcu vestibulum vel. Suspendisse vulputate congue ante ac condimentum. Praesent ultrices semper nunc eget facilisis. Donec quis leo et ex convallis pellentesque non quis mauris. Aenean a diam viverra, maximus est id, tempor diam. Praesent placerat pharetra orci et facilisis. Livia Etiam ipsum tellus, lacinia at augue aliquam, iaculis cursus est. Elinda Quisque vel justo vestibulum, tristique purus in, fermentum ante. Duis fermentum nibh vitae nulla iaculis, et blandit lectus varius. Nunc eget quam consectetur nisi eleifend maximus ut eget urna. Morbi fringilla ultricies nulla, non malesuada tellus faucibus vitae. In ipsum dolor, suscipit eu lobortis non, condimentum eget est. Nullam dictum ante eu eros lobortis mattis.ulum molestie turpis a commodo imperdiet. Praesent ac ante lectus.&lt;/p&gt;', '2019-11-27', '10:00:12', 'sport-1.jpg', 'Alessandro Del Piero, Juventus.', 0, 'N', 'Y', 'Y'),
(11, 4, 1, 'article,sport,f1', '5 Pembalap F1 Paling Tajir Sepanjang Masa', '5-pembalap-f1-paling-tajir-sepanjang-masa', '&lt;p style=&quot;text-align: justify;&quot;&gt;Lillycitudin convallis diam in tincidunt. Mauris vehicula vel tellus a imperdiet. Sed sed rhoncus ipsum. Pellentesque vulputate lectus porttitor tellus sagittis fringilla nec non mi. Duis mattis suscipit tellus. Quisque ullamcorper viverra ultricies. Curabitur sit amet elit eget sapien hendrerit pellentesque eget a arcu. In sapien felis, tempus sit amet justo aliquet, blandit condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent tempus nisi nec leo varius ornare. Donec sit amet erat fringilla ex luctus dapibus vestibulum commodo lectus. Curabitur enim eros, dapibus eget volutpat in, euismod id felis. Nunc elementum posuere eros in molestie. Vivamus ultricies porttitor lacus, vel fermentum ipsum lacinia nec. Etiam vitae maximus justo.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Sed id massa ipsum. Praesent pulvinar sem euismod turpis aliquam interdum. Morbi vulputate odio eu dignissim ultricies. Vivamus id dui metus. Donec iaculis at est quis gravida. Aenean nisi nulla, scelerisque et aliquam id, vulputate ac sapien. Praesent iaculis ligula ac nunc pretium, non eleifend dui luctus. Phasellus dictum dolor ex, ut elementum mi tempor quis. Vestibulum aliquet erat aliquet, lacinia sapien eu, tristique urna. Fusce ut purus accumsan, posuere est commodo, porta ipsum. Nullam viverra elit ut condimentum vulputate. Vestibulum molestie turpis a commodo imperdiet. Praesent ac ante lectus.&lt;/p&gt;', '2019-09-25', '17:50:37', 'sport-3.jpg', '', 0, 'Y', 'Y', 'Y'),
(12, 4, 1, 'rossi,motogp,article', 'Rossi Disebut Selalu Punya Gairah di MotoGP', 'rossi-disebut-selalu-punya-gairah-di-motogp', '&lt;p style=&quot;text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet consectetur adipiscing elit curabitur nec enim id enim imperdiet commodo. Nunc id ante ac leo tempor facilisis. Mauris vulputate interdum ipsum, eu laoreet augue. Sed vestibulum a urna at fermentum. Nullam blandit dolor sollicitudin elit rutrum dictum. Pellentesque eleifend finibus lacus, vel mollis libero rutrum sed. Sed quam orci, euismod ac ipsum eu, malesuada pellentesque nunc. AdimanCifi zorbi egestas ligula a elit aliquet, a commodo quam fermentum. Aenean eget dictum purus. Sed libero nisi, euismod non semper a, bibendum vitae nulla.&lt;/p&gt;\r\n&lt;p style=&quot;text-align: justify;&quot;&gt;Praesent dignissim lacinia enim non blandit suspendisse potenent esque commodo tristique ipsum ut tincidunt. Nam dapibus neque mi, sit amet euismod arcu vestibulum vel. Suspendisse vulputate congue ante ac condimentum. Praesent ultrices semper nunc eget facilisis. Donec quis leo et ex convallis pellentesque non quis mauris. Aenean a diam viverra, maximus est id, tempor diam. Praesent placerat pharetra orci et facilisis. Livia Etiam ipsum tellus, lacinia at augue aliquam, iaculis cursus est. Elinda Quisque vel justo vestibulum, tristique purus in, fermentum ante. Duis fermentum nibh vitae nulla iaculis, et blandit lectus varius. Nunc eget quam consectetur nisi eleifend maximus ut eget urna. Morbi fringilla ultricies nulla, non malesuada tellus faucibus vitae. In ipsum dolor, suscipit eu lobortis non, condimentum eget est. Nullam dictum ante eu eros lobortis mattipis a commodo imperdiet. Praesent ac ante lectus.&lt;/p&gt;', '2019-03-28', '02:45:54', 'sport-2.jpg', 'Valentino Rossi disebut selalu punya gairah besar di MotoGP', 1, 'Y', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_roles`
--

CREATE TABLE `t_roles` (
  `id` int(10) NOT NULL,
  `group` varchar(255) NOT NULL DEFAULT '_NO_GROUPS_',
  `module` varchar(255) NOT NULL DEFAULT '_NO_MODULE_',
  `read_access` smallint(1) NOT NULL DEFAULT '0',
  `write_access` smallint(1) NOT NULL DEFAULT '0',
  `modify_access` smallint(1) NOT NULL DEFAULT '0',
  `delete_access` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_roles`
--

INSERT INTO `t_roles` (`id`, `group`, `module`, `read_access`, `write_access`, `modify_access`, `delete_access`) VALUES
(1, 'admin', 'dashboard', 1, 1, 1, 1),
(2, 'admin', 'post', 1, 1, 1, 1),
(3, 'admin', 'category', 1, 1, 1, 1),
(4, 'admin', 'tag', 1, 1, 0, 1),
(5, 'admin', 'comment', 1, 1, 1, 1),
(6, 'admin', 'pages', 1, 1, 1, 1),
(7, 'admin', 'gallery', 1, 1, 1, 1),
(8, 'admin', 'filemanager', 1, 1, 1, 1),
(9, 'admin', 'mail', 1, 1, 1, 1),
(10, 'admin', 'user', 1, 1, 1, 0),
(11, 'admin', 'component', 1, 0, 0, 0),
(12, 'admin', 'theme', 1, 0, 0, 0),
(13, 'admin', 'setting', 1, 0, 0, 0),
(14, 'admin', 'menumanager', 0, 0, 0, 0),
(35, 'admin', 'profile', 1, 1, 1, 1),
(36, 'admin', 'permissions', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_setting`
--

CREATE TABLE `t_setting` (
  `id` int(10) NOT NULL,
  `groups` varchar(100) NOT NULL,
  `options` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(100) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_setting`
--

INSERT INTO `t_setting` (`id`, `groups`, `options`, `value`, `type`, `content`) VALUES
(1, 'local', 'timezone', 'Asia/Jakarta', 'timezone', ''),
(2, 'general', 'web_name', 'ianatut thalibin', 'text', ''),
(3, 'general', 'web_url', 'http://localhost/devrsi/web', 'text', ''),
(4, 'general', 'web_slogan', '-', 'otehr', ''),
(5, 'general', 'web_description', '-', 'other', ''),
(6, 'general', 'web_keyword', 'CifireCMS, CMS Codeigniter, CMS Indonesia, CMS Open Source', 'text', ''),
(7, 'general', 'web_author', 'CiFireCMS', 'text', ''),
(8, 'general', 'web_email', 'nadhifbeo@gmail.com', 'text', ''),
(9, 'general', 'telephone', '0123456789', 'text', ''),
(10, 'general', 'fax', '000-0000-0000', 'text', ''),
(11, 'general', 'address', 'Jakarta Indonesia', 'other', ''),
(12, 'general', 'map_latitude', '123456789', 'text', ''),
(13, 'general', 'map_longitude', '123456789', 'text', ''),
(14, 'image', 'favicon', 'favicon.png', 'file', ''),
(15, 'image', 'web_logo', 'logo.png', 'file', ''),
(16, 'image', 'web_image', 'web-image.png', 'file', ''),
(17, 'local', 'country', 'Indonesia', 'text', ''),
(18, 'mail', 'mail_protocol', 'smtp', 'select', 'smtp|sendmail|mail'),
(19, 'mail', 'mail_hostname', '', 'text', ''),
(20, 'mail', 'mail_username', '', 'text', ''),
(21, 'mail', 'mail_password', '', 'password', ''),
(22, 'mail', 'mail_port', '465', 'text', ''),
(23, 'config', 'maintenance_mode', 'N', 'select', 'N|Y'),
(24, 'config', 'page_item', '5', 'text', ''),
(25, 'config', 'slug_url', 'slug/seotitle', 'slug', ''),
(26, 'config', 'slug_title', 'detailpost', 'text', ''),
(27, 'config', 'post_comment', 'Y', 'select', 'Y|N'),
(28, 'config', 'recaptcha', 'Y', 'select', 'Y|N'),
(29, 'config', 'recaptcha_site_key', '6LfJzIoUAAAAAN1-sOfEpehjAE5YAwGiWXT0ydh-', 'text', ''),
(30, 'config', 'recaptcha_secret_key', '6LfJzIoUAAAAAA6eXmTd7oINHnPjOQok-cIQ0rQ-', 'text', ''),
(31, 'other', 'web_analytics', 'N', 'select', 'Y|N'),
(32, 'other', 'google_analytics', 'your google analytics code', 'text', ''),
(33, 'other', 'web_cache', 'N', 'select', 'N|Y'),
(34, 'other', 'sitemap', '&lt;form id=&quot;_formSiteMapz&quot; method=&quot;POST&quot; action=&quot;&quot; class=&quot;form-inline&quot;&gt; &lt;input id=&quot;_csrf&quot; type=&quot;hidden&quot; name=&quot;csrf_name&quot;/&gt; &lt;div class=&quot;input-group&quot;&gt; &lt;div class=&quot;input-group-prepend&quot;&gt; &lt;span class=&quot;input-group-text&quot;&gt;Frequency&lt;/span&gt; &lt;/div&gt; &lt;select name=&quot;changefreq&quot; class=&quot;form-control&quot;&gt; &lt;option value=&quot;&quot; selected&gt;None&lt;/option&gt; &lt;option value=&quot;always&quot;&gt;Always&lt;/option&gt; &lt;option value=&quot;hourly&quot;&gt;Hourly&lt;/option&gt; &lt;option value=&quot;daily&quot;&gt;Daily&lt;/option&gt; &lt;option value=&quot;weekly&quot;&gt;Weekly&lt;/option&gt; &lt;option value=&quot;monthly&quot;&gt;Monthly&lt;/option&gt; &lt;option value=&quot;yearly&quot;&gt;Yearly&lt;/option&gt; &lt;option value=&quot;never&quot;&gt;Never&lt;/option&gt; &lt;/select&gt; &lt;div class=&quot;input-group-prepend&quot;&gt; &lt;span class=&quot;input-group-text&quot;&gt;Priority&lt;/span&gt; &lt;/div&gt; &lt;select name=&quot;priority&quot; class=&quot;form-control&quot;&gt; &lt;option value=&quot;0.1&quot; selected&gt;0.1&lt;/option&gt; &lt;option value=&quot;0.2&quot;&gt;0.2&lt;/option&gt; &lt;option value=&quot;0.3&quot;&gt;0.3&lt;/option&gt; &lt;option value=&quot;0.4&quot;&gt;0.4&lt;/option&gt; &lt;option value=&quot;0.5&quot;&gt;0.5&lt;/option&gt; &lt;option value=&quot;0.6&quot;&gt;0.6&lt;/option&gt; &lt;option value=&quot;0.7&quot;&gt;0.7&lt;/option&gt; &lt;option value=&quot;0.8&quot;&gt;0.8&lt;/option&gt; &lt;option value=&quot;0.9&quot;&gt;0.9&lt;/option&gt; &lt;option value=&quot;1.0&quot;&gt;1.0&lt;/option&gt; &lt;/select&gt; &lt;div class=&quot;mg-l-5&quot;&gt; &lt;button type=&quot;submit&quot; name=&quot;pk&quot; value=&quot;sitemap&quot; class=&quot;btn btn-success&quot;&gt;Create Site Map&lt;/button&gt; &lt;/div&gt; &lt;/div&gt; &lt;/form&gt; &lt;script&gt; $(document).ready(function(){ var _formSiteMapAction = admin_url + a_mod + \'/createsitemap\'; $(\'#_formSiteMapz\').attr(\'action\', _formSiteMapAction); $(\'#_csrf\').val(csrfToken); }); &lt;/script&gt;', 'html', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_slug`
--

CREATE TABLE `t_slug` (
  `id` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_slug`
--

INSERT INTO `t_slug` (`id`, `title`, `slug`) VALUES
(1, 'slug/seotitle', 'slug/([a-z0-9-]+)'),
(2, 'yyyy/seotitle', '([0-9-]+)/([a-z0-9-]+)'),
(3, 'yyyy/mm/seotitle', '([0-9-]+)/([0-9-]+)/([a-z0-9-]+)'),
(4, 'yyyy/mm/dd/seotitle', '([0-9-]+)/([0-9-]+)/([0-9-]+)/([a-z0-9-]+)'),
(5, 'seotitle', '([a-z0-9-]+)');

-- --------------------------------------------------------

--
-- Table structure for table `t_tag`
--

CREATE TABLE `t_tag` (
  `id` int(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `seotitle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_tag`
--

INSERT INTO `t_tag` (`id`, `title`, `seotitle`) VALUES
(1, 'CiFireCMS', 'cifirecms'),
(2, 'Article', 'article'),
(3, 'Manado', 'manado'),
(4, 'Indonesia', 'indonesia'),
(5, 'Liburan', 'liburan'),
(6, 'Facebook', 'facebook'),
(7, 'Intel', 'intel'),
(8, 'Wedding', 'wedding'),
(9, 'Tinutuan', 'tinutuan'),
(10, 'Poso', 'poso'),
(11, 'Sulteng', 'sulteng'),
(12, 'Festival Danau Poso', 'festivaldanauposo'),
(13, 'Budaya', 'budaya'),
(14, 'Jogja', 'jogja'),
(15, 'Goa Pindul', 'goapindul'),
(16, 'Rossi', 'rossi'),
(17, 'MotoGP', 'motogp'),
(18, 'Sport', 'sport'),
(19, 'F1', 'f1'),
(20, 'Alessandro Del Piero', 'alessandrodelpiero'),
(21, 'Bola', 'bola'),
(22, 'Olimpiade', 'olimpiade'),
(23, 'Wisata', 'wisata'),
(24, 'Kuliner', 'kuliner'),
(25, 'Tekno', 'tekno'),
(26, 'Asus ROG', 'asusrog');

-- --------------------------------------------------------

--
-- Table structure for table `t_theme`
--

CREATE TABLE `t_theme` (
  `id` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_theme`
--

INSERT INTO `t_theme` (`id`, `title`, `folder`, `active`) VALUES
(1, 'Sovi', 'sovi', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `t_timezone`
--

CREATE TABLE `t_timezone` (
  `id` int(5) NOT NULL,
  `value` varchar(100) NOT NULL,
  `text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_timezone`
--

INSERT INTO `t_timezone` (`id`, `value`, `text`) VALUES
(1, 'Pacific/Midway', '(UTC -11:00) Pacific/Midway'),
(2, 'Pacific/Niue', '(UTC -11:00) Pacific/Niue'),
(3, 'Pacific/Pago_Pago', '(UTC -11:00) Pacific/Pago_Pago'),
(4, 'America/Adak', '(UTC -10:00) America/Adak'),
(5, 'Pacific/Honolulu', '(UTC -10:00) Pacific/Honolulu'),
(6, 'Pacific/Johnston', '(UTC -10:00) Pacific/Johnston'),
(7, 'Pacific/Rarotonga', '(UTC -10:00) Pacific/Rarotonga'),
(8, 'Pacific/Tahiti', '(UTC -10:00) Pacific/Tahiti'),
(9, 'Pacific/Marquesas', '(UTC -09:30) Pacific/Marquesas'),
(10, 'America/Anchorage', '(UTC -09:00) America/Anchorage'),
(11, 'America/Juneau', '(UTC -09:00) America/Juneau'),
(12, 'America/Nome', '(UTC -09:00) America/Nome'),
(13, 'America/Sitka', '(UTC -09:00) America/Sitka'),
(14, 'America/Yakutat', '(UTC -09:00) America/Yakutat'),
(15, 'Pacific/Gambier', '(UTC -09:00) Pacific/Gambier'),
(16, 'America/Dawson', '(UTC -08:00) America/Dawson'),
(17, 'America/Los_Angeles', '(UTC -08:00) America/Los_Angeles'),
(18, 'America/Metlakatla', '(UTC -08:00) America/Metlakatla'),
(19, 'America/Santa_Isabel', '(UTC -08:00) America/Santa_Isabel'),
(20, 'America/Tijuana', '(UTC -08:00) America/Tijuana'),
(21, 'America/Vancouver', '(UTC -08:00) America/Vancouver'),
(22, 'America/Whitehorse', '(UTC -08:00) America/Whitehorse'),
(23, 'Pacific/Pitcairn', '(UTC -08:00) Pacific/Pitcairn'),
(24, 'America/Boise', '(UTC -07:00) America/Boise'),
(25, 'America/Cambridge_Bay', '(UTC -07:00) America/Cambridge_Bay'),
(26, 'America/Chihuahua', '(UTC -07:00) America/Chihuahua'),
(27, 'America/Creston', '(UTC -07:00) America/Creston'),
(28, 'America/Dawson_Creek', '(UTC -07:00) America/Dawson_Creek'),
(29, 'America/Denver', '(UTC -07:00) America/Denver'),
(30, 'America/Edmonton', '(UTC -07:00) America/Edmonton'),
(31, 'America/Hermosillo', '(UTC -07:00) America/Hermosillo'),
(32, 'America/Inuvik', '(UTC -07:00) America/Inuvik'),
(33, 'America/Mazatlan', '(UTC -07:00) America/Mazatlan'),
(34, 'America/Ojinaga', '(UTC -07:00) America/Ojinaga'),
(35, 'America/Phoenix', '(UTC -07:00) America/Phoenix'),
(36, 'America/Yellowknife', '(UTC -07:00) America/Yellowknife'),
(37, 'America/Bahia_Banderas', '(UTC -06:00) America/Bahia_Banderas'),
(38, 'America/Belize', '(UTC -06:00) America/Belize'),
(39, 'America/Cancun', '(UTC -06:00) America/Cancun'),
(40, 'America/Chicago', '(UTC -06:00) America/Chicago'),
(41, 'America/Costa_Rica', '(UTC -06:00) America/Costa_Rica'),
(42, 'America/El_Salvador', '(UTC -06:00) America/El_Salvador'),
(43, 'America/Guatemala', '(UTC -06:00) America/Guatemala'),
(44, 'America/Indiana/Knox', '(UTC -06:00) America/Indiana/Knox'),
(45, 'America/Indiana/Tell_City', '(UTC -06:00) America/Indiana/Tell_City'),
(46, 'America/Managua', '(UTC -06:00) America/Managua'),
(47, 'America/Matamoros', '(UTC -06:00) America/Matamoros'),
(48, 'America/Menominee', '(UTC -06:00) America/Menominee'),
(49, 'America/Merida', '(UTC -06:00) America/Merida'),
(50, 'America/Mexico_City', '(UTC -06:00) America/Mexico_City'),
(51, 'America/Monterrey', '(UTC -06:00) America/Monterrey'),
(52, 'America/North_Dakota/Beulah', '(UTC -06:00) America/North_Dakota/Beulah'),
(53, 'America/North_Dakota/Center', '(UTC -06:00) America/North_Dakota/Center'),
(54, 'America/North_Dakota/New_Salem', '(UTC -06:00) America/North_Dakota/New_Salem'),
(55, 'America/Rainy_River', '(UTC -06:00) America/Rainy_River'),
(56, 'America/Rankin_Inlet', '(UTC -06:00) America/Rankin_Inlet'),
(57, 'America/Regina', '(UTC -06:00) America/Regina'),
(58, 'America/Resolute', '(UTC -06:00) America/Resolute'),
(59, 'America/Swift_Current', '(UTC -06:00) America/Swift_Current'),
(60, 'America/Tegucigalpa', '(UTC -06:00) America/Tegucigalpa'),
(61, 'America/Winnipeg', '(UTC -06:00) America/Winnipeg'),
(62, 'Pacific/Galapagos', '(UTC -06:00) Pacific/Galapagos'),
(63, 'America/Atikokan', '(UTC -05:00) America/Atikokan'),
(64, 'America/Bogota', '(UTC -05:00) America/Bogota'),
(65, 'America/Cayman', '(UTC -05:00) America/Cayman'),
(66, 'America/Detroit', '(UTC -05:00) America/Detroit'),
(67, 'America/Eirunepe', '(UTC -05:00) America/Eirunepe'),
(68, 'America/Grand_Turk', '(UTC -05:00) America/Grand_Turk'),
(69, 'America/Guayaquil', '(UTC -05:00) America/Guayaquil'),
(70, 'America/Havana', '(UTC -05:00) America/Havana'),
(71, 'America/Indiana/Indianapolis', '(UTC -05:00) America/Indiana/Indianapolis'),
(72, 'America/Indiana/Marengo', '(UTC -05:00) America/Indiana/Marengo'),
(73, 'America/Indiana/Petersburg', '(UTC -05:00) America/Indiana/Petersburg'),
(74, 'America/Indiana/Vevay', '(UTC -05:00) America/Indiana/Vevay'),
(75, 'America/Indiana/Vincennes', '(UTC -05:00) America/Indiana/Vincennes'),
(76, 'America/Indiana/Winamac', '(UTC -05:00) America/Indiana/Winamac'),
(77, 'America/Iqaluit', '(UTC -05:00) America/Iqaluit'),
(78, 'America/Jamaica', '(UTC -05:00) America/Jamaica'),
(79, 'America/Kentucky/Louisville', '(UTC -05:00) America/Kentucky/Louisville'),
(80, 'America/Kentucky/Monticello', '(UTC -05:00) America/Kentucky/Monticello'),
(81, 'America/Lima', '(UTC -05:00) America/Lima'),
(82, 'America/Nassau', '(UTC -05:00) America/Nassau'),
(83, 'America/New_York', '(UTC -05:00) America/New_York'),
(84, 'America/Nipigon', '(UTC -05:00) America/Nipigon'),
(85, 'America/Panama', '(UTC -05:00) America/Panama'),
(86, 'America/Pangnirtung', '(UTC -05:00) America/Pangnirtung'),
(87, 'America/Port-au-Prince', '(UTC -05:00) America/Port-au-Prince'),
(88, 'America/Rio_Branco', '(UTC -05:00) America/Rio_Branco'),
(89, 'America/Thunder_Bay', '(UTC -05:00) America/Thunder_Bay'),
(90, 'America/Toronto', '(UTC -05:00) America/Toronto'),
(91, 'Pacific/Easter', '(UTC -05:00) Pacific/Easter'),
(92, 'America/Caracas', '(UTC -04:30) America/Caracas'),
(93, 'America/Anguilla', '(UTC -04:00) America/Anguilla'),
(94, 'America/Antigua', '(UTC -04:00) America/Antigua'),
(95, 'America/Aruba', '(UTC -04:00) America/Aruba'),
(96, 'America/Barbados', '(UTC -04:00) America/Barbados'),
(97, 'America/Blanc-Sablon', '(UTC -04:00) America/Blanc-Sablon'),
(98, 'America/Boa_Vista', '(UTC -04:00) America/Boa_Vista'),
(99, 'America/Curacao', '(UTC -04:00) America/Curacao'),
(100, 'America/Dominica', '(UTC -04:00) America/Dominica'),
(101, 'America/Glace_Bay', '(UTC -04:00) America/Glace_Bay'),
(102, 'America/Goose_Bay', '(UTC -04:00) America/Goose_Bay'),
(103, 'America/Grenada', '(UTC -04:00) America/Grenada'),
(104, 'America/Guadeloupe', '(UTC -04:00) America/Guadeloupe'),
(105, 'America/Guyana', '(UTC -04:00) America/Guyana'),
(106, 'America/Halifax', '(UTC -04:00) America/Halifax'),
(107, 'America/Kralendijk', '(UTC -04:00) America/Kralendijk'),
(108, 'America/La_Paz', '(UTC -04:00) America/La_Paz'),
(109, 'America/Lower_Princes', '(UTC -04:00) America/Lower_Princes'),
(110, 'America/Manaus', '(UTC -04:00) America/Manaus'),
(111, 'America/Marigot', '(UTC -04:00) America/Marigot'),
(112, 'America/Martinique', '(UTC -04:00) America/Martinique'),
(113, 'America/Moncton', '(UTC -04:00) America/Moncton'),
(114, 'America/Montserrat', '(UTC -04:00) America/Montserrat'),
(115, 'America/Port_of_Spain', '(UTC -04:00) America/Port_of_Spain'),
(116, 'America/Porto_Velho', '(UTC -04:00) America/Porto_Velho'),
(117, 'America/Puerto_Rico', '(UTC -04:00) America/Puerto_Rico'),
(118, 'America/Santo_Domingo', '(UTC -04:00) America/Santo_Domingo'),
(119, 'America/St_Barthelemy', '(UTC -04:00) America/St_Barthelemy'),
(120, 'America/St_Kitts', '(UTC -04:00) America/St_Kitts'),
(121, 'America/St_Lucia', '(UTC -04:00) America/St_Lucia'),
(122, 'America/St_Thomas', '(UTC -04:00) America/St_Thomas'),
(123, 'America/St_Vincent', '(UTC -04:00) America/St_Vincent'),
(124, 'America/Thule', '(UTC -04:00) America/Thule'),
(125, 'America/Tortola', '(UTC -04:00) America/Tortola'),
(126, 'Atlantic/Bermuda', '(UTC -04:00) Atlantic/Bermuda'),
(127, 'America/St_Johns', '(UTC -03:30) America/St_Johns'),
(128, 'America/Araguaina', '(UTC -03:00) America/Araguaina'),
(129, 'America/Argentina/Buenos_Aires', '(UTC -03:00) America/Argentina/Buenos_Aires'),
(130, 'America/Argentina/Catamarca', '(UTC -03:00) America/Argentina/Catamarca'),
(131, 'America/Argentina/Cordoba', '(UTC -03:00) America/Argentina/Cordoba'),
(132, 'America/Argentina/Jujuy', '(UTC -03:00) America/Argentina/Jujuy'),
(133, 'America/Argentina/La_Rioja', '(UTC -03:00) America/Argentina/La_Rioja'),
(134, 'America/Argentina/Mendoza', '(UTC -03:00) America/Argentina/Mendoza'),
(135, 'America/Argentina/Rio_Gallegos', '(UTC -03:00) America/Argentina/Rio_Gallegos'),
(136, 'America/Argentina/Salta', '(UTC -03:00) America/Argentina/Salta'),
(137, 'America/Argentina/San_Juan', '(UTC -03:00) America/Argentina/San_Juan'),
(138, 'America/Argentina/San_Luis', '(UTC -03:00) America/Argentina/San_Luis'),
(139, 'America/Argentina/Tucuman', '(UTC -03:00) America/Argentina/Tucuman'),
(140, 'America/Argentina/Ushuaia', '(UTC -03:00) America/Argentina/Ushuaia'),
(141, 'America/Asuncion', '(UTC -03:00) America/Asuncion'),
(142, 'America/Bahia', '(UTC -03:00) America/Bahia'),
(143, 'America/Belem', '(UTC -03:00) America/Belem'),
(144, 'America/Campo_Grande', '(UTC -03:00) America/Campo_Grande'),
(145, 'America/Cayenne', '(UTC -03:00) America/Cayenne'),
(146, 'America/Cuiaba', '(UTC -03:00) America/Cuiaba'),
(147, 'America/Fortaleza', '(UTC -03:00) America/Fortaleza'),
(148, 'America/Godthab', '(UTC -03:00) America/Godthab'),
(149, 'America/Maceio', '(UTC -03:00) America/Maceio'),
(150, 'America/Miquelon', '(UTC -03:00) America/Miquelon'),
(151, 'America/Paramaribo', '(UTC -03:00) America/Paramaribo'),
(152, 'America/Recife', '(UTC -03:00) America/Recife'),
(153, 'America/Santarem', '(UTC -03:00) America/Santarem'),
(154, 'America/Santiago', '(UTC -03:00) America/Santiago'),
(155, 'Antarctica/Palmer', '(UTC -03:00) Antarctica/Palmer'),
(156, 'Antarctica/Rothera', '(UTC -03:00) Antarctica/Rothera'),
(157, 'Atlantic/Stanley', '(UTC -03:00) Atlantic/Stanley'),
(158, 'America/Montevideo', '(UTC -02:00) America/Montevideo'),
(159, 'America/Noronha', '(UTC -02:00) America/Noronha'),
(160, 'America/Sao_Paulo', '(UTC -02:00) America/Sao_Paulo'),
(161, 'Atlantic/South_Georgia', '(UTC -02:00) Atlantic/South_Georgia'),
(162, 'America/Scoresbysund', '(UTC -01:00) America/Scoresbysund'),
(163, 'Atlantic/Azores', '(UTC -01:00) Atlantic/Azores'),
(164, 'Atlantic/Cape_Verde', '(UTC -01:00) Atlantic/Cape_Verde'),
(165, 'Africa/Abidjan', '(UTC -00:00) Africa/Abidjan'),
(166, 'Africa/Accra', '(UTC -00:00) Africa/Accra'),
(167, 'Africa/Bamako', '(UTC -00:00) Africa/Bamako'),
(168, 'Africa/Banjul', '(UTC -00:00) Africa/Banjul'),
(169, 'Africa/Bissau', '(UTC -00:00) Africa/Bissau'),
(170, 'Africa/Casablanca', '(UTC -00:00) Africa/Casablanca'),
(171, 'Africa/Conakry', '(UTC -00:00) Africa/Conakry'),
(172, 'Africa/Dakar', '(UTC -00:00) Africa/Dakar'),
(173, 'Africa/El_Aaiun', '(UTC -00:00) Africa/El_Aaiun'),
(174, 'Africa/Freetown', '(UTC -00:00) Africa/Freetown'),
(175, 'Africa/Lome', '(UTC -00:00) Africa/Lome'),
(176, 'Africa/Monrovia', '(UTC -00:00) Africa/Monrovia'),
(177, 'Africa/Nouakchott', '(UTC -00:00) Africa/Nouakchott'),
(178, 'Africa/Ouagadougou', '(UTC -00:00) Africa/Ouagadougou'),
(179, 'Africa/Sao_Tome', '(UTC -00:00) Africa/Sao_Tome'),
(180, 'America/Danmarkshavn', '(UTC -00:00) America/Danmarkshavn'),
(181, 'Antarctica/Troll', '(UTC -00:00) Antarctica/Troll'),
(182, 'Atlantic/Canary', '(UTC -00:00) Atlantic/Canary'),
(183, 'Atlantic/Faroe', '(UTC -00:00) Atlantic/Faroe'),
(184, 'Atlantic/Madeira', '(UTC -00:00) Atlantic/Madeira'),
(185, 'Atlantic/Reykjavik', '(UTC -00:00) Atlantic/Reykjavik'),
(186, 'Atlantic/St_Helena', '(UTC -00:00) Atlantic/St_Helena'),
(187, 'Europe/Dublin', '(UTC -00:00) Europe/Dublin'),
(188, 'Europe/Guernsey', '(UTC -00:00) Europe/Guernsey'),
(189, 'Europe/Isle_of_Man', '(UTC -00:00) Europe/Isle_of_Man'),
(190, 'Europe/Jersey', '(UTC -00:00) Europe/Jersey'),
(191, 'Europe/Lisbon', '(UTC -00:00) Europe/Lisbon'),
(192, 'Europe/London', '(UTC -00:00) Europe/London'),
(193, 'UTC', '(UTC -00:00) UTC'),
(194, 'Africa/Algiers', '(UTC +01:00) Africa/Algiers'),
(195, 'Africa/Bangui', '(UTC +01:00) Africa/Bangui'),
(196, 'Africa/Brazzaville', '(UTC +01:00) Africa/Brazzaville'),
(197, 'Africa/Ceuta', '(UTC +01:00) Africa/Ceuta'),
(198, 'Africa/Douala', '(UTC +01:00) Africa/Douala'),
(199, 'Africa/Kinshasa', '(UTC +01:00) Africa/Kinshasa'),
(200, 'Africa/Lagos', '(UTC +01:00) Africa/Lagos'),
(201, 'Africa/Libreville', '(UTC +01:00) Africa/Libreville'),
(202, 'Africa/Luanda', '(UTC +01:00) Africa/Luanda'),
(203, 'Africa/Malabo', '(UTC +01:00) Africa/Malabo'),
(204, 'Africa/Ndjamena', '(UTC +01:00) Africa/Ndjamena'),
(205, 'Africa/Niamey', '(UTC +01:00) Africa/Niamey'),
(206, 'Africa/Porto-Novo', '(UTC +01:00) Africa/Porto-Novo'),
(207, 'Africa/Tunis', '(UTC +01:00) Africa/Tunis'),
(208, 'Arctic/Longyearbyen', '(UTC +01:00) Arctic/Longyearbyen'),
(209, 'Europe/Amsterdam', '(UTC +01:00) Europe/Amsterdam'),
(210, 'Europe/Andorra', '(UTC +01:00) Europe/Andorra'),
(211, 'Europe/Belgrade', '(UTC +01:00) Europe/Belgrade'),
(212, 'Europe/Berlin', '(UTC +01:00) Europe/Berlin'),
(213, 'Europe/Bratislava', '(UTC +01:00) Europe/Bratislava'),
(214, 'Europe/Brussels', '(UTC +01:00) Europe/Brussels'),
(215, 'Europe/Budapest', '(UTC +01:00) Europe/Budapest'),
(216, 'Europe/Busingen', '(UTC +01:00) Europe/Busingen'),
(217, 'Europe/Copenhagen', '(UTC +01:00) Europe/Copenhagen'),
(218, 'Europe/Gibraltar', '(UTC +01:00) Europe/Gibraltar'),
(219, 'Europe/Ljubljana', '(UTC +01:00) Europe/Ljubljana'),
(220, 'Europe/Luxembourg', '(UTC +01:00) Europe/Luxembourg'),
(221, 'Europe/Madrid', '(UTC +01:00) Europe/Madrid'),
(222, 'Europe/Malta', '(UTC +01:00) Europe/Malta'),
(223, 'Europe/Monaco', '(UTC +01:00) Europe/Monaco'),
(224, 'Europe/Oslo', '(UTC +01:00) Europe/Oslo'),
(225, 'Europe/Paris', '(UTC +01:00) Europe/Paris'),
(226, 'Europe/Podgorica', '(UTC +01:00) Europe/Podgorica'),
(227, 'Europe/Prague', '(UTC +01:00) Europe/Prague'),
(228, 'Europe/Rome', '(UTC +01:00) Europe/Rome'),
(229, 'Europe/San_Marino', '(UTC +01:00) Europe/San_Marino'),
(230, 'Europe/Sarajevo', '(UTC +01:00) Europe/Sarajevo'),
(231, 'Europe/Skopje', '(UTC +01:00) Europe/Skopje'),
(232, 'Europe/Stockholm', '(UTC +01:00) Europe/Stockholm'),
(233, 'Europe/Tirane', '(UTC +01:00) Europe/Tirane'),
(234, 'Europe/Vaduz', '(UTC +01:00) Europe/Vaduz'),
(235, 'Europe/Vatican', '(UTC +01:00) Europe/Vatican'),
(236, 'Europe/Vienna', '(UTC +01:00) Europe/Vienna'),
(237, 'Europe/Warsaw', '(UTC +01:00) Europe/Warsaw'),
(238, 'Europe/Zagreb', '(UTC +01:00) Europe/Zagreb'),
(239, 'Europe/Zurich', '(UTC +01:00) Europe/Zurich'),
(240, 'Africa/Blantyre', '(UTC +02:00) Africa/Blantyre'),
(241, 'Africa/Bujumbura', '(UTC +02:00) Africa/Bujumbura'),
(242, 'Africa/Cairo', '(UTC +02:00) Africa/Cairo'),
(243, 'Africa/Gaborone', '(UTC +02:00) Africa/Gaborone'),
(244, 'Africa/Harare', '(UTC +02:00) Africa/Harare'),
(245, 'Africa/Johannesburg', '(UTC +02:00) Africa/Johannesburg'),
(246, 'Africa/Kigali', '(UTC +02:00) Africa/Kigali'),
(247, 'Africa/Lubumbashi', '(UTC +02:00) Africa/Lubumbashi'),
(248, 'Africa/Lusaka', '(UTC +02:00) Africa/Lusaka'),
(249, 'Africa/Maputo', '(UTC +02:00) Africa/Maputo'),
(250, 'Africa/Maseru', '(UTC +02:00) Africa/Maseru'),
(251, 'Africa/Mbabane', '(UTC +02:00) Africa/Mbabane'),
(252, 'Africa/Tripoli', '(UTC +02:00) Africa/Tripoli'),
(253, 'Africa/Windhoek', '(UTC +02:00) Africa/Windhoek'),
(254, 'Asia/Amman', '(UTC +02:00) Asia/Amman'),
(255, 'Asia/Beirut', '(UTC +02:00) Asia/Beirut'),
(256, 'Asia/Damascus', '(UTC +02:00) Asia/Damascus'),
(257, 'Asia/Gaza', '(UTC +02:00) Asia/Gaza'),
(258, 'Asia/Hebron', '(UTC +02:00) Asia/Hebron'),
(259, 'Asia/Jerusalem', '(UTC +02:00) Asia/Jerusalem'),
(260, 'Asia/Nicosia', '(UTC +02:00) Asia/Nicosia'),
(261, 'Europe/Athens', '(UTC +02:00) Europe/Athens'),
(262, 'Europe/Bucharest', '(UTC +02:00) Europe/Bucharest'),
(263, 'Europe/Chisinau', '(UTC +02:00) Europe/Chisinau'),
(264, 'Europe/Helsinki', '(UTC +02:00) Europe/Helsinki'),
(265, 'Europe/Istanbul', '(UTC +02:00) Europe/Istanbul'),
(266, 'Europe/Kiev', '(UTC +02:00) Europe/Kiev'),
(267, 'Europe/Mariehamn', '(UTC +02:00) Europe/Mariehamn'),
(268, 'Europe/Riga', '(UTC +02:00) Europe/Riga'),
(269, 'Europe/Sofia', '(UTC +02:00) Europe/Sofia'),
(270, 'Europe/Tallinn', '(UTC +02:00) Europe/Tallinn'),
(271, 'Europe/Uzhgorod', '(UTC +02:00) Europe/Uzhgorod'),
(272, 'Europe/Vilnius', '(UTC +02:00) Europe/Vilnius'),
(273, 'Europe/Zaporozhye', '(UTC +02:00) Europe/Zaporozhye'),
(274, 'Africa/Addis_Ababa', '(UTC +03:00) Africa/Addis_Ababa'),
(275, 'Africa/Asmara', '(UTC +03:00) Africa/Asmara'),
(276, 'Africa/Dar_es_Salaam', '(UTC +03:00) Africa/Dar_es_Salaam'),
(277, 'Africa/Djibouti', '(UTC +03:00) Africa/Djibouti'),
(278, 'Africa/Juba', '(UTC +03:00) Africa/Juba'),
(279, 'Africa/Kampala', '(UTC +03:00) Africa/Kampala'),
(280, 'Africa/Khartoum', '(UTC +03:00) Africa/Khartoum'),
(281, 'Africa/Mogadishu', '(UTC +03:00) Africa/Mogadishu'),
(282, 'Africa/Nairobi', '(UTC +03:00) Africa/Nairobi'),
(283, 'Antarctica/Syowa', '(UTC +03:00) Antarctica/Syowa'),
(284, 'Asia/Aden', '(UTC +03:00) Asia/Aden'),
(285, 'Asia/Baghdad', '(UTC +03:00) Asia/Baghdad'),
(286, 'Asia/Bahrain', '(UTC +03:00) Asia/Bahrain'),
(287, 'Asia/Kuwait', '(UTC +03:00) Asia/Kuwait'),
(288, 'Asia/Qatar', '(UTC +03:00) Asia/Qatar'),
(289, 'Asia/Riyadh', '(UTC +03:00) Asia/Riyadh'),
(290, 'Europe/Kaliningrad', '(UTC +03:00) Europe/Kaliningrad'),
(291, 'Europe/Minsk', '(UTC +03:00) Europe/Minsk'),
(292, 'Indian/Antananarivo', '(UTC +03:00) Indian/Antananarivo'),
(293, 'Indian/Comoro', '(UTC +03:00) Indian/Comoro'),
(294, 'Indian/Mayotte', '(UTC +03:00) Indian/Mayotte'),
(295, 'Asia/Tehran', '(UTC +03:30) Asia/Tehran'),
(296, 'Asia/Baku', '(UTC +04:00) Asia/Baku'),
(297, 'Asia/Dubai', '(UTC +04:00) Asia/Dubai'),
(298, 'Asia/Muscat', '(UTC +04:00) Asia/Muscat'),
(299, 'Asia/Tbilisi', '(UTC +04:00) Asia/Tbilisi'),
(300, 'Asia/Yerevan', '(UTC +04:00) Asia/Yerevan'),
(301, 'Europe/Moscow', '(UTC +04:00) Europe/Moscow'),
(302, 'Europe/Samara', '(UTC +04:00) Europe/Samara'),
(303, 'Europe/Simferopol', '(UTC +04:00) Europe/Simferopol'),
(304, 'Europe/Volgograd', '(UTC +04:00) Europe/Volgograd'),
(305, 'Indian/Mahe', '(UTC +04:00) Indian/Mahe'),
(306, 'Indian/Mauritius', '(UTC +04:00) Indian/Mauritius'),
(307, 'Indian/Reunion', '(UTC +04:00) Indian/Reunion'),
(308, 'Asia/Kabul', '(UTC +04:30) Asia/Kabul'),
(309, 'Antarctica/Mawson', '(UTC +05:00) Antarctica/Mawson'),
(310, 'Asia/Aqtau', '(UTC +05:00) Asia/Aqtau'),
(311, 'Asia/Aqtobe', '(UTC +05:00) Asia/Aqtobe'),
(312, 'Asia/Ashgabat', '(UTC +05:00) Asia/Ashgabat'),
(313, 'Asia/Dushanbe', '(UTC +05:00) Asia/Dushanbe'),
(314, 'Asia/Karachi', '(UTC +05:00) Asia/Karachi'),
(315, 'Asia/Oral', '(UTC +05:00) Asia/Oral'),
(316, 'Asia/Samarkand', '(UTC +05:00) Asia/Samarkand'),
(317, 'Asia/Tashkent', '(UTC +05:00) Asia/Tashkent'),
(318, 'Indian/Kerguelen', '(UTC +05:00) Indian/Kerguelen'),
(319, 'Indian/Maldives', '(UTC +05:00) Indian/Maldives'),
(320, 'Asia/Colombo', '(UTC +05:30) Asia/Colombo'),
(321, 'Asia/Kolkata', '(UTC +05:30) Asia/Kolkata'),
(322, 'Asia/Kathmandu', '(UTC +05:45) Asia/Kathmandu'),
(323, 'Antarctica/Vostok', '(UTC +06:00) Antarctica/Vostok'),
(324, 'Asia/Almaty', '(UTC +06:00) Asia/Almaty'),
(325, 'Asia/Bishkek', '(UTC +06:00) Asia/Bishkek'),
(326, 'Asia/Dhaka', '(UTC +06:00) Asia/Dhaka'),
(327, 'Asia/Qyzylorda', '(UTC +06:00) Asia/Qyzylorda'),
(328, 'Asia/Thimphu', '(UTC +06:00) Asia/Thimphu'),
(329, 'Asia/Yekaterinburg', '(UTC +06:00) Asia/Yekaterinburg'),
(330, 'Indian/Chagos', '(UTC +06:00) Indian/Chagos'),
(331, 'Asia/Rangoon', '(UTC +06:30) Asia/Rangoon'),
(332, 'Indian/Cocos', '(UTC +06:30) Indian/Cocos'),
(333, 'Antarctica/Davis', '(UTC +07:00) Antarctica/Davis'),
(334, 'Asia/Bangkok', '(UTC +07:00) Asia/Bangkok'),
(335, 'Asia/Ho_Chi_Minh', '(UTC +07:00) Asia/Ho_Chi_Minh'),
(336, 'Asia/Hovd', '(UTC +07:00) Asia/Hovd'),
(337, 'Asia/Jakarta', '(UTC +07:00) Asia/Jakarta'),
(338, 'Asia/Novokuznetsk', '(UTC +07:00) Asia/Novokuznetsk'),
(339, 'Asia/Novosibirsk', '(UTC +07:00) Asia/Novosibirsk'),
(340, 'Asia/Omsk', '(UTC +07:00) Asia/Omsk'),
(341, 'Asia/Phnom_Penh', '(UTC +07:00) Asia/Phnom_Penh'),
(342, 'Asia/Pontianak', '(UTC +07:00) Asia/Pontianak'),
(343, 'Asia/Vientiane', '(UTC +07:00) Asia/Vientiane'),
(344, 'Indian/Christmas', '(UTC +07:00) Indian/Christmas'),
(345, 'Antarctica/Casey', '(UTC +08:00) Antarctica/Casey'),
(346, 'Asia/Brunei', '(UTC +08:00) Asia/Brunei'),
(347, 'Asia/Choibalsan', '(UTC +08:00) Asia/Choibalsan'),
(348, 'Asia/Chongqing', '(UTC +08:00) Asia/Chongqing'),
(349, 'Asia/Harbin', '(UTC +08:00) Asia/Harbin'),
(350, 'Asia/Hong_Kong', '(UTC +08:00) Asia/Hong_Kong'),
(351, 'Asia/Kashgar', '(UTC +08:00) Asia/Kashgar'),
(352, 'Asia/Krasnoyarsk', '(UTC +08:00) Asia/Krasnoyarsk'),
(353, 'Asia/Kuala_Lumpur', '(UTC +08:00) Asia/Kuala_Lumpur'),
(354, 'Asia/Kuching', '(UTC +08:00) Asia/Kuching'),
(355, 'Asia/Macau', '(UTC +08:00) Asia/Macau'),
(356, 'Asia/Makassar', '(UTC +08:00) Asia/Makassar'),
(357, 'Asia/Manila', '(UTC +08:00) Asia/Manila'),
(358, 'Asia/Shanghai', '(UTC +08:00) Asia/Shanghai'),
(359, 'Asia/Singapore', '(UTC +08:00) Asia/Singapore'),
(360, 'Asia/Taipei', '(UTC +08:00) Asia/Taipei'),
(361, 'Asia/Ulaanbaatar', '(UTC +08:00) Asia/Ulaanbaatar'),
(362, 'Asia/Urumqi', '(UTC +08:00) Asia/Urumqi'),
(363, 'Australia/Perth', '(UTC +08:00) Australia/Perth'),
(364, 'Australia/Eucla', '(UTC +08:45) Australia/Eucla'),
(365, 'Asia/Dili', '(UTC +09:00) Asia/Dili'),
(366, 'Asia/Irkutsk', '(UTC +09:00) Asia/Irkutsk'),
(367, 'Asia/Jayapura', '(UTC +09:00) Asia/Jayapura'),
(368, 'Asia/Pyongyang', '(UTC +09:00) Asia/Pyongyang'),
(369, 'Asia/Seoul', '(UTC +09:00) Asia/Seoul'),
(370, 'Asia/Tokyo', '(UTC +09:00) Asia/Tokyo'),
(371, 'Pacific/Palau', '(UTC +09:00) Pacific/Palau'),
(372, 'Australia/Darwin', '(UTC +09:30) Australia/Darwin'),
(373, 'Antarctica/DumontDUrville', '(UTC +10:00) Antarctica/DumontDUrville'),
(374, 'Asia/Khandyga', '(UTC +10:00) Asia/Khandyga'),
(375, 'Asia/Yakutsk', '(UTC +10:00) Asia/Yakutsk'),
(376, 'Australia/Brisbane', '(UTC +10:00) Australia/Brisbane'),
(377, 'Australia/Lindeman', '(UTC +10:00) Australia/Lindeman'),
(378, 'Pacific/Chuuk', '(UTC +10:00) Pacific/Chuuk'),
(379, 'Pacific/Guam', '(UTC +10:00) Pacific/Guam'),
(380, 'Pacific/Port_Moresby', '(UTC +10:00) Pacific/Port_Moresby'),
(381, 'Pacific/Saipan', '(UTC +10:00) Pacific/Saipan'),
(382, 'Australia/Adelaide', '(UTC +10:30) Australia/Adelaide'),
(383, 'Australia/Broken_Hill', '(UTC +10:30) Australia/Broken_Hill'),
(384, 'Antarctica/Macquarie', '(UTC +11:00) Antarctica/Macquarie'),
(385, 'Asia/Sakhalin', '(UTC +11:00) Asia/Sakhalin'),
(386, 'Asia/Ust-Nera', '(UTC +11:00) Asia/Ust-Nera'),
(387, 'Asia/Vladivostok', '(UTC +11:00) Asia/Vladivostok'),
(388, 'Australia/Currie', '(UTC +11:00) Australia/Currie'),
(389, 'Australia/Hobart', '(UTC +11:00) Australia/Hobart'),
(390, 'Australia/Lord_Howe', '(UTC +11:00) Australia/Lord_Howe'),
(391, 'Australia/Melbourne', '(UTC +11:00) Australia/Melbourne'),
(392, 'Australia/Sydney', '(UTC +11:00) Australia/Sydney'),
(393, 'Pacific/Efate', '(UTC +11:00) Pacific/Efate'),
(394, 'Pacific/Guadalcanal', '(UTC +11:00) Pacific/Guadalcanal'),
(395, 'Pacific/Kosrae', '(UTC +11:00) Pacific/Kosrae'),
(396, 'Pacific/Noumea', '(UTC +11:00) Pacific/Noumea'),
(397, 'Pacific/Pohnpei', '(UTC +11:00) Pacific/Pohnpei'),
(398, 'Pacific/Norfolk', '(UTC +11:30) Pacific/Norfolk'),
(399, 'Asia/Anadyr', '(UTC +12:00) Asia/Anadyr'),
(400, 'Asia/Kamchatka', '(UTC +12:00) Asia/Kamchatka'),
(401, 'Asia/Magadan', '(UTC +12:00) Asia/Magadan'),
(402, 'Pacific/Fiji', '(UTC +12:00) Pacific/Fiji'),
(403, 'Pacific/Funafuti', '(UTC +12:00) Pacific/Funafuti'),
(404, 'Pacific/Kwajalein', '(UTC +12:00) Pacific/Kwajalein'),
(405, 'Pacific/Majuro', '(UTC +12:00) Pacific/Majuro'),
(406, 'Pacific/Nauru', '(UTC +12:00) Pacific/Nauru'),
(407, 'Pacific/Tarawa', '(UTC +12:00) Pacific/Tarawa'),
(408, 'Pacific/Wake', '(UTC +12:00) Pacific/Wake'),
(409, 'Pacific/Wallis', '(UTC +12:00) Pacific/Wallis'),
(410, 'Antarctica/McMurdo', '(UTC +13:00) Antarctica/McMurdo'),
(411, 'Pacific/Auckland', '(UTC +13:00) Pacific/Auckland'),
(412, 'Pacific/Enderbury', '(UTC +13:00) Pacific/Enderbury'),
(413, 'Pacific/Fakaofo', '(UTC +13:00) Pacific/Fakaofo'),
(414, 'Pacific/Tongatapu', '(UTC +13:00) Pacific/Tongatapu'),
(415, 'Pacific/Chatham', '(UTC +13:45) Pacific/Chatham'),
(416, 'Pacific/Apia', '(UTC +14:00) Pacific/Apia'),
(417, 'Pacific/Kiritimati', '(UTC +14:00) Pacific/Kiritimati');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `id` int(5) NOT NULL,
  `key_group` varchar(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birthday` date NOT NULL DEFAULT '1999-01-01',
  `about` text NOT NULL,
  `address` text NOT NULL,
  `tlpn` varchar(50) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'avatar.jpg',
  `active` enum('Y','N') NOT NULL DEFAULT 'N',
  `activation_key` varchar(255) NOT NULL DEFAULT '0',
  `forgot_key` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id`, `key_group`, `username`, `password`, `email`, `name`, `gender`, `birthday`, `about`, `address`, `tlpn`, `photo`, `active`, `activation_key`, `forgot_key`) VALUES
(1, 'root', 'admin', 'b9fca2ca65ebe7a63c6803f311df20c8440a514ab35c44b601cec80d6b3daadf2b9d20625eabe658b6435e53ff0f7eacd8f6b7d1178d0f734dcd9d20acd8e1bcRqtObPqetFPeQN2gqKE0+c9bFPEk/ozfo6ewy1wUYOc=', 'nadhifbeo@gmail.com', 'Super Admin', 'M', '2020-03-31', 'Lorem ipsum dolor sit amet consectetur adipiscing elit fusce eget turpis pulvinar interdum tellus blandit imperdiet velit.', 'Lorem ipsum dolor sit amet consectetur adipiscing elit fusce eget turpis pulvinar interdum tellus blandit imperdiet velit.', '08123456789', 'd023996ceb715242fc5f344e0a506ff9.jpg', 'Y', '0', '0'),
(2, 'admin', 'admin2', '7957b87eb77b9dba5c35394501229297efea29d124a34aacdf3ad3317f3375e03f2f1016818ca7817c377a8d45a12ec49e9d7aa098a3dc15eca545e5bca99b98y+U/fSIPazgjpUpnHF7pwMsPxKdBaUDBNPXevSTiE80=', 'admin2@cifirecms.local', 'Admin2', 'M', '2019-12-12', 'Lorem ipsum dolor sit amet consectetur adipiscing elit curabitur nec enim id enim imperdiet commodo. Nunc id ante ac leo tempor facilisis.', 'Manado SULUT, Indonesia', '08123456789', 'user-18259486642050377193.jpg', 'Y', '0', '0'),
(3, 'guest', 'sovia', '79ccc7354057183ef17e235f531ab7e6d79b0646114df0df83f05f00a88875a37cf29fcb1cc4c82e293d2c6fd9ad066af5f10ffe0bded50cc1846d7d485d8b2dYRCdKEgVEIgPKHqt9/LKGdYTu2UPES3q5rrQDw1iN24=', 'sovia@cifirecms.local', 'Sovia', 'F', '2019-12-12', 'Lorem ipsum dolor sit amet consectetur adipiscing elit curabitur nec enim id enim imperdiet commodo. Nunc id ante ac leo tempor facilisis.', 'Sulteng, Indonesia', '08123456789', 'user-62595808177649332041.jpg', 'Y', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `t_user_group`
--

CREATE TABLE `t_user_group` (
  `id` int(5) NOT NULL,
  `pk` varchar(10) NOT NULL,
  `title` varchar(100) NOT NULL,
  `group` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_user_group`
--

INSERT INTO `t_user_group` (`id`, `pk`, `title`, `group`) VALUES
(1, 'root', 'Root', 'root'),
(2, 'admin', 'Admin', 'admin'),
(3, 'guest', 'Guest', 'guest');

-- --------------------------------------------------------

--
-- Table structure for table `t_visitor`
--

CREATE TABLE `t_visitor` (
  `id` int(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `os` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hits` int(50) NOT NULL,
  `online` int(50) NOT NULL,
  `url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_album`
--
ALTER TABLE `t_album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_category`
--
ALTER TABLE `t_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_comment`
--
ALTER TABLE `t_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_component`
--
ALTER TABLE `t_component`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_gallery`
--
ALTER TABLE `t_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_mail`
--
ALTER TABLE `t_mail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_menu`
--
ALTER TABLE `t_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_menu_group`
--
ALTER TABLE `t_menu_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_mod`
--
ALTER TABLE `t_mod`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_pages`
--
ALTER TABLE `t_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_post`
--
ALTER TABLE `t_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_roles`
--
ALTER TABLE `t_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_setting`
--
ALTER TABLE `t_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_slug`
--
ALTER TABLE `t_slug`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_tag`
--
ALTER TABLE `t_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_theme`
--
ALTER TABLE `t_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_timezone`
--
ALTER TABLE `t_timezone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_user_group`
--
ALTER TABLE `t_user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_visitor`
--
ALTER TABLE `t_visitor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_album`
--
ALTER TABLE `t_album`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_category`
--
ALTER TABLE `t_category`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_comment`
--
ALTER TABLE `t_comment`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_component`
--
ALTER TABLE `t_component`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_gallery`
--
ALTER TABLE `t_gallery`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `t_mail`
--
ALTER TABLE `t_mail`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_menu`
--
ALTER TABLE `t_menu`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `t_menu_group`
--
ALTER TABLE `t_menu_group`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_mod`
--
ALTER TABLE `t_mod`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_pages`
--
ALTER TABLE `t_pages`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_post`
--
ALTER TABLE `t_post`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_roles`
--
ALTER TABLE `t_roles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `t_setting`
--
ALTER TABLE `t_setting`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `t_slug`
--
ALTER TABLE `t_slug`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `t_tag`
--
ALTER TABLE `t_tag`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `t_theme`
--
ALTER TABLE `t_theme`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_timezone`
--
ALTER TABLE `t_timezone`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=418;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_user_group`
--
ALTER TABLE `t_user_group`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_visitor`
--
ALTER TABLE `t_visitor`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
