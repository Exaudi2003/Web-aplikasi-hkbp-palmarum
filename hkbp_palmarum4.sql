-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2023 at 02:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hkbp_palmarum4`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL,
  `nama_bank` varchar(75) NOT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `bank_gereja`
--

CREATE TABLE `bank_gereja` (
  `id_bank_gereja` int(11) NOT NULL,
  `id_gereja` int(11) NOT NULL,
  `id_bank` int(11) NOT NULL,
  `nama_pemilik` varchar(75) NOT NULL,
  `nomor_rekening` int(11) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `baptis`
--

CREATE TABLE `baptis` (
  `id_baptis` int(11) NOT NULL,
  `id_registrasi_baptis` int(11) NOT NULL,
  `id_jemaat` int(11) NOT NULL,
  `tgl_baptis` date NOT NULL,
  `no_surat_baptis` int(11) NOT NULL,
  `isHKBP` int(11) NOT NULL DEFAULT 0,
  `id_gereja_baptis` int(11) NOT NULL,
  `nama_gereja_non_HKBP` varchar(100) DEFAULT NULL,
  `nama_pendeta_baptis` varchar(70) NOT NULL,
  `file_surat_baptis` bigint(20) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `id_status` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `bidang_pendidikan`
--

CREATE TABLE `bidang_pendidikan` (
  `id_bidang_pendidikan` int(11) NOT NULL,
  `nama_bidang_pendidikan` varchar(70) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `bidang_pendidikan`
--

INSERT INTO `bidang_pendidikan` (`id_bidang_pendidikan`, `nama_bidang_pendidikan`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'Pendidikan Dasar', NULL, '2023-06-05 15:09:28', NULL, 0),
(2, 'Pendidikan Menengah', NULL, '2023-06-05 15:10:07', NULL, 0),
(3, 'Pendididkan Tinggi', NULL, '2023-06-05 15:10:22', NULL, 0),
(4, 'Pendidikan Vokasional', NULL, '2023-06-05 15:11:06', NULL, 0),
(5, 'Pendidikan Khusus', NULL, '2023-06-05 15:11:18', NULL, 0),
(6, 'Pendidikan Nonformal', NULL, '2023-06-05 15:11:40', NULL, 0),
(7, 'Pendidikan Dalam Jaringan', NULL, '2023-06-05 15:11:53', NULL, 0),
(8, 'Pendidikan Kejuruan', NULL, '2023-06-05 15:12:06', NULL, 0),
(9, 'Pendidikan Sains dan Teknologi', NULL, '2023-06-05 15:12:23', NULL, 0),
(10, 'Pendidikan Seni dan Budaya', NULL, '2023-06-05 15:12:36', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_code` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_code`, `province_id`, `province`, `type`, `city_name`, `postal_code`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 15, 34, 'Sumatera Utara', 'Kabupaten', 'Asahan', '21214', '2023-05-03 09:09:28', NULL, 0),
(2, 52, 34, 'Sumatera Utara', 'Kabupaten', 'Batu Bara', '21655', '2023-05-03 09:09:28', NULL, 0),
(3, 70, 34, 'Sumatera Utara', 'Kota', 'Binjai', '20712', '2023-05-03 09:09:28', NULL, 0),
(4, 110, 34, 'Sumatera Utara', 'Kabupaten', 'Dairi', '22211', '2023-05-03 09:09:28', NULL, 0),
(5, 112, 34, 'Sumatera Utara', 'Kabupaten', 'Deli Serdang', '20511', '2023-05-03 09:09:28', NULL, 0),
(6, 137, 34, 'Sumatera Utara', 'Kota', 'Gunungsitoli', '22813', '2023-05-03 09:09:28', NULL, 0),
(7, 146, 34, 'Sumatera Utara', 'Kabupaten', 'Humbang Hasundutan', '22457', '2023-05-03 09:09:28', NULL, 0),
(8, 173, 34, 'Sumatera Utara', 'Kabupaten', 'Karo', '22119', '2023-05-03 09:09:28', NULL, 0),
(9, 217, 34, 'Sumatera Utara', 'Kabupaten', 'Labuhan Batu', '21412', '2023-05-03 09:09:28', NULL, 0),
(10, 218, 34, 'Sumatera Utara', 'Kabupaten', 'Labuhan Batu Selatan', '21511', '2023-05-03 09:09:28', NULL, 0),
(11, 219, 34, 'Sumatera Utara', 'Kabupaten', 'Labuhan Batu Utara', '21711', '2023-05-03 09:09:28', NULL, 0),
(12, 229, 34, 'Sumatera Utara', 'Kabupaten', 'Langkat', '20811', '2023-05-03 09:09:28', NULL, 0),
(13, 268, 34, 'Sumatera Utara', 'Kabupaten', 'Mandailing Natal', '22916', '2023-05-03 09:09:28', NULL, 0),
(14, 278, 34, 'Sumatera Utara', 'Kota', 'Medan', '20228', '2023-05-03 09:09:28', NULL, 0),
(15, 307, 34, 'Sumatera Utara', 'Kabupaten', 'Nias', '22876', '2023-05-03 09:09:28', NULL, 0),
(16, 308, 34, 'Sumatera Utara', 'Kabupaten', 'Nias Barat', '22895', '2023-05-03 09:09:28', NULL, 0),
(17, 309, 34, 'Sumatera Utara', 'Kabupaten', 'Nias Selatan', '22865', '2023-05-03 09:09:28', NULL, 0),
(18, 310, 34, 'Sumatera Utara', 'Kabupaten', 'Nias Utara', '22856', '2023-05-03 09:09:28', NULL, 0),
(19, 319, 34, 'Sumatera Utara', 'Kabupaten', 'Padang Lawas', '22763', '2023-05-03 09:09:28', NULL, 0),
(20, 320, 34, 'Sumatera Utara', 'Kabupaten', 'Padang Lawas Utara', '22753', '2023-05-03 09:09:28', NULL, 0),
(21, 323, 34, 'Sumatera Utara', 'Kota', 'Padang Sidempuan', '22727', '2023-05-03 09:09:28', NULL, 0),
(22, 325, 34, 'Sumatera Utara', 'Kabupaten', 'Pakpak Bharat', '22272', '2023-05-03 09:09:28', NULL, 0),
(23, 353, 34, 'Sumatera Utara', 'Kota', 'Pematang Siantar', '21126', '2023-05-03 09:09:28', NULL, 0),
(24, 389, 34, 'Sumatera Utara', 'Kabupaten', 'Samosir', '22392', '2023-05-03 09:09:28', NULL, 0),
(25, 404, 34, 'Sumatera Utara', 'Kabupaten', 'Serdang Bedagai', '20915', '2023-05-03 09:09:28', NULL, 0),
(26, 407, 34, 'Sumatera Utara', 'Kota', 'Sibolga', '22522', '2023-05-03 09:09:28', NULL, 0),
(27, 413, 34, 'Sumatera Utara', 'Kabupaten', 'Simalungun', '21162', '2023-05-03 09:09:28', NULL, 0),
(28, 459, 34, 'Sumatera Utara', 'Kota', 'Tanjung Balai', '21321', '2023-05-03 09:09:28', NULL, 0),
(29, 463, 34, 'Sumatera Utara', 'Kabupaten', 'Tapanuli Selatan', '22742', '2023-05-03 09:09:28', NULL, 0),
(30, 464, 34, 'Sumatera Utara', 'Kabupaten', 'Tapanuli Tengah', '22611', '2023-05-03 09:09:28', NULL, 0),
(31, 465, 34, 'Sumatera Utara', 'Kabupaten', 'Tapanuli Utara', '22414', '2023-05-03 09:09:28', NULL, 0),
(32, 470, 34, 'Sumatera Utara', 'Kota', 'Tebing Tinggi', '20632', '2023-05-03 09:09:28', NULL, 0),
(33, 481, 34, 'Sumatera Utara', 'Kabupaten', 'Toba Samosir', '22316', '2023-05-03 09:09:28', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_code` char(3) DEFAULT NULL,
  `country_name` varchar(75) DEFAULT NULL,
  `code` char(2) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_code`, `country_name`, `code`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'AFG', 'Afghanistan', 'AF', NULL, NULL, 0),
(2, 'ALA', 'Åland', 'AX', NULL, NULL, 0),
(3, 'ALB', 'Albania', 'AL', NULL, NULL, 0),
(4, 'DZA', 'Algeria', 'DZ', NULL, NULL, 0),
(5, 'ASM', 'American Samoa', 'AS', NULL, NULL, 0),
(6, 'AND', 'Andorra', 'AD', NULL, NULL, 0),
(7, 'AGO', 'Angola', 'AO', NULL, NULL, 0),
(8, 'AIA', 'Anguilla', 'AI', NULL, NULL, 0),
(9, 'ATA', 'Antarctica', 'AQ', NULL, NULL, 0),
(10, 'ATG', 'Antigua and Barbuda', 'AG', NULL, NULL, 0),
(11, 'ARG', 'Argentina', 'AR', NULL, NULL, 0),
(12, 'ARM', 'Armenia', 'AM', NULL, NULL, 0),
(13, 'ABW', 'Aruba', 'AW', NULL, NULL, 0),
(14, 'AUS', 'Australia', 'AU', NULL, NULL, 0),
(15, 'AUT', 'Austria', 'AT', NULL, NULL, 0),
(16, 'AZE', 'Azerbaijan', 'AZ', NULL, NULL, 0),
(17, 'BHS', 'Bahamas', 'BS', NULL, NULL, 0),
(18, 'BHR', 'Bahrain', 'BH', NULL, NULL, 0),
(19, 'BGD', 'Bangladesh', 'BD', NULL, NULL, 0),
(20, 'BRB', 'Barbados', 'BB', NULL, NULL, 0),
(21, 'BLR', 'Belarus', 'BY', NULL, NULL, 0),
(22, 'BEL', 'Belgium', 'BE', NULL, NULL, 0),
(23, 'BLZ', 'Belize', 'BZ', NULL, NULL, 0),
(24, 'BEN', 'Benin', 'BJ', NULL, NULL, 0),
(25, 'BMU', 'Bermuda', 'BM', NULL, NULL, 0),
(26, 'BTN', 'Bhutan', 'BT', NULL, NULL, 0),
(27, 'BOL', 'Bolivia', 'BO', NULL, NULL, 0),
(28, 'BES', 'Bonaire', 'BQ', NULL, NULL, 0),
(29, 'BIH', 'Bosnia and Herzegovina', 'BA', NULL, NULL, 0),
(30, 'BWA', 'Botswana', 'BW', NULL, NULL, 0),
(31, 'BVT', 'Bouvet Island', 'BV', NULL, NULL, 0),
(32, 'BRA', 'Brazil', 'BR', NULL, NULL, 0),
(33, 'IOT', 'British Indian Ocean Territory', 'IO', NULL, NULL, 0),
(34, 'VGB', 'British Virgin Islands', 'VG', NULL, NULL, 0),
(35, 'BRN', 'Brunei', 'BN', NULL, NULL, 0),
(36, 'BGR', 'Bulgaria', 'BG', NULL, NULL, 0),
(37, 'BFA', 'Burkina Faso', 'BF', NULL, NULL, 0),
(38, 'BDI', 'Burundi', 'BI', NULL, NULL, 0),
(39, 'KHM', 'Cambodia', 'KH', NULL, NULL, 0),
(40, 'CMR', 'Cameroon', 'CM', NULL, NULL, 0),
(41, 'CAN', 'Canada', 'CA', NULL, NULL, 0),
(42, 'CPV', 'Cape Verde', 'CV', NULL, NULL, 0),
(43, 'CYM', 'Cayman Islands', 'KY', NULL, NULL, 0),
(44, 'CAF', 'Central African Republic', 'CF', NULL, NULL, 0),
(45, 'TCD', 'Chad', 'TD', NULL, NULL, 0),
(46, 'CHL', 'Chile', 'CL', NULL, NULL, 0),
(47, 'CHN', 'China', 'CN', NULL, NULL, 0),
(48, 'CXR', 'Christmas Island', 'CX', NULL, NULL, 0),
(49, 'CCK', 'Cocos [Keeling] Islands', 'CC', NULL, NULL, 0),
(50, 'COL', 'Colombia', 'CO', NULL, NULL, 0),
(51, 'COM', 'Comoros', 'KM', NULL, NULL, 0),
(52, 'COK', 'Cook Islands', 'CK', NULL, NULL, 0),
(53, 'CRI', 'Costa Rica', 'CR', NULL, NULL, 0),
(54, 'HRV', 'Croatia', 'HR', NULL, NULL, 0),
(55, 'CUB', 'Cuba', 'CU', NULL, NULL, 0),
(56, 'CUW', 'Curacao', 'CW', NULL, NULL, 0),
(57, 'CYP', 'Cyprus', 'CY', NULL, NULL, 0),
(58, 'CZE', 'Czech Republic', 'CZ', NULL, NULL, 0),
(59, 'COD', 'Democratic Republic of the Congo', 'CD', NULL, NULL, 0),
(60, 'DNK', 'Denmark', 'DK', NULL, NULL, 0),
(61, 'DJI', 'Djibouti', 'DJ', NULL, NULL, 0),
(62, 'DMA', 'Dominica', 'DM', NULL, NULL, 0),
(63, 'DOM', 'Dominican Republic', 'DO', NULL, NULL, 0),
(64, 'TLS', 'East Timor', 'TL', NULL, NULL, 0),
(65, 'ECU', 'Ecuador', 'EC', NULL, NULL, 0),
(66, 'EGY', 'Egypt', 'EG', NULL, NULL, 0),
(67, 'SLV', 'El Salvador', 'SV', NULL, NULL, 0),
(68, 'GNQ', 'Equatorial Guinea', 'GQ', NULL, NULL, 0),
(69, 'ERI', 'Eritrea', 'ER', NULL, NULL, 0),
(70, 'EST', 'Estonia', 'EE', NULL, NULL, 0),
(71, 'ETH', 'Ethiopia', 'ET', NULL, NULL, 0),
(72, 'FLK', 'Falkland Islands', 'FK', NULL, NULL, 0),
(73, 'FRO', 'Faroe Islands', 'FO', NULL, NULL, 0),
(74, 'FJI', 'Fiji', 'FJ', NULL, NULL, 0),
(75, 'FIN', 'Finland', 'FI', NULL, NULL, 0),
(76, 'FRA', 'France', 'FR', NULL, NULL, 0),
(77, 'GUF', 'French Guiana', 'GF', NULL, NULL, 0),
(78, 'PYF', 'French Polynesia', 'PF', NULL, NULL, 0),
(79, 'ATF', 'French Southern Territories', 'TF', NULL, NULL, 0),
(80, 'GAB', 'Gabon', 'GA', NULL, NULL, 0),
(81, 'GMB', 'Gambia', 'GM', NULL, NULL, 0),
(82, 'GEO', 'Georgia', 'GE', NULL, NULL, 0),
(83, 'DEU', 'Germany', 'DE', NULL, NULL, 0),
(84, 'GHA', 'Ghana', 'GH', NULL, NULL, 0),
(85, 'GIB', 'Gibraltar', 'GI', NULL, NULL, 0),
(86, 'GRC', 'Greece', 'GR', NULL, NULL, 0),
(87, 'GRL', 'Greenland', 'GL', NULL, NULL, 0),
(88, 'GRD', 'Grenada', 'GD', NULL, NULL, 0),
(89, 'GLP', 'Guadeloupe', 'GP', NULL, NULL, 0),
(90, 'GUM', 'Guam', 'GU', NULL, NULL, 0),
(91, 'GTM', 'Guatemala', 'GT', NULL, NULL, 0),
(92, 'GGY', 'Guernsey', 'GG', NULL, NULL, 0),
(93, 'GIN', 'Guinea', 'GN', NULL, NULL, 0),
(94, 'GNB', 'Guinea-Bissau', 'GW', NULL, NULL, 0),
(95, 'GUY', 'Guyana', 'GY', NULL, NULL, 0),
(96, 'HTI', 'Haiti', 'HT', NULL, NULL, 0),
(97, 'HMD', 'Heard Island and McDonald Islands', 'HM', NULL, NULL, 0),
(98, 'HND', 'Honduras', 'HN', NULL, NULL, 0),
(99, 'HKG', 'Hong Kong', 'HK', NULL, NULL, 0),
(100, 'HUN', 'Hungary', 'HU', NULL, NULL, 0),
(101, 'ISL', 'Iceland', 'IS', NULL, NULL, 0),
(102, 'IND', 'India', 'IN', NULL, NULL, 0),
(103, 'IDN', 'Indonesia', 'ID', NULL, NULL, 0),
(104, 'IRN', 'Iran', 'IR', NULL, NULL, 0),
(105, 'IRQ', 'Iraq', 'IQ', NULL, NULL, 0),
(106, 'IRL', 'Ireland', 'IE', NULL, NULL, 0),
(107, 'IMN', 'Isle of Man', 'IM', NULL, NULL, 0),
(108, 'ISR', 'Israel', 'IL', NULL, NULL, 0),
(109, 'ITA', 'Italy', 'IT', NULL, NULL, 0),
(110, 'CIV', 'Ivory Coast', 'CI', NULL, NULL, 0),
(111, 'JAM', 'Jamaica', 'JM', NULL, NULL, 0),
(112, 'JPN', 'Japan', 'JP', NULL, NULL, 0),
(113, 'JEY', 'Jersey', 'JE', NULL, NULL, 0),
(114, 'JOR', 'Jordan', 'JO', NULL, NULL, 0),
(115, 'KAZ', 'Kazakhstan', 'KZ', NULL, NULL, 0),
(116, 'KEN', 'Kenya', 'KE', NULL, NULL, 0),
(117, 'KIR', 'Kiribati', 'KI', NULL, NULL, 0),
(118, 'XKX', 'Kosovo', 'XK', NULL, NULL, 0),
(119, 'KWT', 'Kuwait', 'KW', NULL, NULL, 0),
(120, 'KGZ', 'Kyrgyzstan', 'KG', NULL, NULL, 0),
(121, 'LAO', 'Laos', 'LA', NULL, NULL, 0),
(122, 'LVA', 'Latvia', 'LV', NULL, NULL, 0),
(123, 'LBN', 'Lebanon', 'LB', NULL, NULL, 0),
(124, 'LSO', 'Lesotho', 'LS', NULL, NULL, 0),
(125, 'LBR', 'Liberia', 'LR', NULL, NULL, 0),
(126, 'LBY', 'Libya', 'LY', NULL, NULL, 0),
(127, 'LIE', 'Liechtenstein', 'LI', NULL, NULL, 0),
(128, 'LTU', 'Lithuania', 'LT', NULL, NULL, 0),
(129, 'LUX', 'Luxembourg', 'LU', NULL, NULL, 0),
(130, 'MAC', 'Macao', 'MO', NULL, NULL, 0),
(131, 'MKD', 'Macedonia', 'MK', NULL, NULL, 0),
(132, 'MDG', 'Madagascar', 'MG', NULL, NULL, 0),
(133, 'MWI', 'Malawi', 'MW', NULL, NULL, 0),
(134, 'MYS', 'Malaysia', 'MY', NULL, NULL, 0),
(135, 'MDV', 'Maldives', 'MV', NULL, NULL, 0),
(136, 'MLI', 'Mali', 'ML', NULL, NULL, 0),
(137, 'MLT', 'Malta', 'MT', NULL, NULL, 0),
(138, 'MHL', 'Marshall Islands', 'MH', NULL, NULL, 0),
(139, 'MTQ', 'Martinique', 'MQ', NULL, NULL, 0),
(140, 'MRT', 'Mauritania', 'MR', NULL, NULL, 0),
(141, 'MUS', 'Mauritius', 'MU', NULL, NULL, 0),
(142, 'MYT', 'Mayotte', 'YT', NULL, NULL, 0),
(143, 'MEX', 'Mexico', 'MX', NULL, NULL, 0),
(144, 'FSM', 'Micronesia', 'FM', NULL, NULL, 0),
(145, 'MDA', 'Moldova', 'MD', NULL, NULL, 0),
(146, 'MCO', 'Monaco', 'MC', NULL, NULL, 0),
(147, 'MNG', 'Mongolia', 'MN', NULL, NULL, 0),
(148, 'MNE', 'Montenegro', 'ME', NULL, NULL, 0),
(149, 'MSR', 'Montserrat', 'MS', NULL, NULL, 0),
(150, 'MAR', 'Morocco', 'MA', NULL, NULL, 0),
(151, 'MOZ', 'Mozambique', 'MZ', NULL, NULL, 0),
(152, 'MMR', 'Myanmar [Burma]', 'MM', NULL, NULL, 0),
(153, 'NAM', 'Namibia', 'NA', NULL, NULL, 0),
(154, 'NRU', 'Nauru', 'NR', NULL, NULL, 0),
(155, 'NPL', 'Nepal', 'NP', NULL, NULL, 0),
(156, 'NLD', 'Netherlands', 'NL', NULL, NULL, 0),
(157, 'NCL', 'New Caledonia', 'NC', NULL, NULL, 0),
(158, 'NZL', 'New Zealand', 'NZ', NULL, NULL, 0),
(159, 'NIC', 'Nicaragua', 'NI', NULL, NULL, 0),
(160, 'NER', 'Niger', 'NE', NULL, NULL, 0),
(161, 'NGA', 'Nigeria', 'NG', NULL, NULL, 0),
(162, 'NIU', 'Niue', 'NU', NULL, NULL, 0),
(163, 'NFK', 'Norfolk Island', 'NF', NULL, NULL, 0),
(164, 'PRK', 'North Korea', 'KP', NULL, NULL, 0),
(165, 'MNP', 'Northern Mariana Islands', 'MP', NULL, NULL, 0),
(166, 'NOR', 'Norway', 'NO', NULL, NULL, 0),
(167, 'OMN', 'Oman', 'OM', NULL, NULL, 0),
(168, 'PAK', 'Pakistan', 'PK', NULL, NULL, 0),
(169, 'PLW', 'Palau', 'PW', NULL, NULL, 0),
(170, 'PSE', 'Palestine', 'PS', NULL, NULL, 0),
(171, 'PAN', 'Panama', 'PA', NULL, NULL, 0),
(172, 'PNG', 'Papua New Guinea', 'PG', NULL, NULL, 0),
(173, 'PRY', 'Paraguay', 'PY', NULL, NULL, 0),
(174, 'PER', 'Peru', 'PE', NULL, NULL, 0),
(175, 'PHL', 'Philippines', 'PH', NULL, NULL, 0),
(176, 'PCN', 'Pitcairn Islands', 'PN', NULL, NULL, 0),
(177, 'POL', 'Poland', 'PL', NULL, NULL, 0),
(178, 'PRT', 'Portugal', 'PT', NULL, NULL, 0),
(179, 'PRI', 'Puerto Rico', 'PR', NULL, NULL, 0),
(180, 'QAT', 'Qatar', 'QA', NULL, NULL, 0),
(181, 'COG', 'Republic of the Congo', 'CG', NULL, NULL, 0),
(182, 'REU', 'Réunion', 'RE', NULL, NULL, 0),
(183, 'ROU', 'Romania', 'RO', NULL, NULL, 0),
(184, 'RUS', 'Russia', 'RU', NULL, NULL, 0),
(185, 'RWA', 'Rwanda', 'RW', NULL, NULL, 0),
(186, 'BLM', 'Saint Barthélemy', 'BL', NULL, NULL, 0),
(187, 'SHN', 'Saint Helena', 'SH', NULL, NULL, 0),
(188, 'KNA', 'Saint Kitts and Nevis', 'KN', NULL, NULL, 0),
(189, 'LCA', 'Saint Lucia', 'LC', NULL, NULL, 0),
(190, 'MAF', 'Saint Martin', 'MF', NULL, NULL, 0),
(191, 'SPM', 'Saint Pierre and Miquelon', 'PM', NULL, NULL, 0),
(192, 'VCT', 'Saint Vincent and the Grenadines', 'VC', NULL, NULL, 0),
(193, 'WSM', 'Samoa', 'WS', NULL, NULL, 0),
(194, 'SMR', 'San Marino', 'SM', NULL, NULL, 0),
(195, 'STP', 'São Tomé and Príncipe', 'ST', NULL, NULL, 0),
(196, 'SAU', 'Saudi Arabia', 'SA', NULL, NULL, 0),
(197, 'SEN', 'Senegal', 'SN', NULL, NULL, 0),
(198, 'SRB', 'Serbia', 'RS', NULL, NULL, 0),
(199, 'SYC', 'Seychelles', 'SC', NULL, NULL, 0),
(200, 'SLE', 'Sierra Leone', 'SL', NULL, NULL, 0),
(201, 'SGP', 'Singapore', 'SG', NULL, NULL, 0),
(202, 'SXM', 'Sint Maarten', 'SX', NULL, NULL, 0),
(203, 'SVK', 'Slovakia', 'SK', NULL, NULL, 0),
(204, 'SVN', 'Slovenia', 'SI', NULL, NULL, 0),
(205, 'SLB', 'Solomon Islands', 'SB', NULL, NULL, 0),
(206, 'SOM', 'Somalia', 'SO', NULL, NULL, 0),
(207, 'ZAF', 'South Africa', 'ZA', NULL, NULL, 0),
(208, 'SGS', 'South Georgia and the South Sandwich Islands', 'GS', NULL, NULL, 0),
(209, 'KOR', 'South Korea', 'KR', NULL, NULL, 0),
(210, 'SSD', 'South Sudan', 'SS', NULL, NULL, 0),
(211, 'ESP', 'Spain', 'ES', NULL, NULL, 0),
(212, 'LKA', 'Sri Lanka', 'LK', NULL, NULL, 0),
(213, 'SDN', 'Sudan', 'SD', NULL, NULL, 0),
(214, 'SUR', 'Suriname', 'SR', NULL, NULL, 0),
(215, 'SJM', 'Svalbard and Jan Mayen', 'SJ', NULL, NULL, 0),
(216, 'SWZ', 'Swaziland', 'SZ', NULL, NULL, 0),
(217, 'SWE', 'Sweden', 'SE', NULL, NULL, 0),
(218, 'CHE', 'Switzerland', 'CH', NULL, NULL, 0),
(219, 'SYR', 'Syria', 'SY', NULL, NULL, 0),
(220, 'TWN', 'Taiwan', 'TW', NULL, NULL, 0),
(221, 'TJK', 'Tajikistan', 'TJ', NULL, NULL, 0),
(222, 'TZA', 'Tanzania', 'TZ', NULL, NULL, 0),
(223, 'THA', 'Thailand', 'TH', NULL, NULL, 0),
(224, 'TGO', 'Togo', 'TG', NULL, NULL, 0),
(225, 'TKL', 'Tokelau', 'TK', NULL, NULL, 0),
(226, 'TON', 'Tonga', 'TO', NULL, NULL, 0),
(227, 'TTO', 'Trinidad and Tobago', 'TT', NULL, NULL, 0),
(228, 'TUN', 'Tunisia', 'TN', NULL, NULL, 0),
(229, 'TUR', 'Turkey', 'TR', NULL, NULL, 0),
(230, 'TKM', 'Turkmenistan', 'TM', NULL, NULL, 0),
(231, 'TCA', 'Turks and Caicos Islands', 'TC', NULL, NULL, 0),
(232, 'TUV', 'Tuvalu', 'TV', NULL, NULL, 0),
(233, 'UMI', 'U.S. Minor Outlying Islands', 'UM', NULL, NULL, 0),
(234, 'VIR', 'U.S. Virgin Islands', 'VI', NULL, NULL, 0),
(235, 'UGA', 'Uganda', 'UG', NULL, NULL, 0),
(236, 'UKR', 'Ukraine', 'UA', NULL, NULL, 0),
(237, 'ARE', 'United Arab Emirates', 'AE', NULL, NULL, 0),
(238, 'GBR', 'United Kingdom', 'GB', NULL, NULL, 0),
(239, 'USA', 'United States', 'US', NULL, NULL, 0),
(240, 'URY', 'Uruguay', 'UY', NULL, NULL, 0),
(241, 'UZB', 'Uzbekistan', 'UZ', NULL, NULL, 0),
(242, 'VUT', 'Vanuatu', 'VU', NULL, NULL, 0),
(243, 'VAT', 'Vatican City', 'VA', NULL, NULL, 0),
(244, 'VEN', 'Venezuela', 'VE', NULL, NULL, 0),
(245, 'VNM', 'Vietnam', 'VN', NULL, NULL, 0),
(246, 'WLF', 'Wallis and Futuna', 'WF', NULL, NULL, 0),
(247, 'ESH', 'Western Sahara', 'EH', NULL, NULL, 0),
(248, 'YEM', 'Yemen', 'YE', NULL, NULL, 0),
(249, 'ZMB', 'Zambia', 'ZM', NULL, NULL, 0),
(250, 'ZWE', 'Zimbabwe', 'ZW', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pemasukan`
--

CREATE TABLE `detail_pemasukan` (
  `id_pemasukan` int(11) NOT NULL,
  `induk_kategori_anggaran` varchar(255) DEFAULT NULL,
  `kategori_mata_anggaran` varchar(255) DEFAULT NULL,
  `mata_anggaran` varchar(255) DEFAULT NULL,
  `isSentralisasi` varchar(255) DEFAULT NULL,
  `tanggal_transaksi` varchar(10) DEFAULT NULL,
  `tanggal_warta` varchar(10) DEFAULT NULL,
  `nama_transaksi` varchar(255) DEFAULT NULL,
  `jenis_transaksi` varchar(255) DEFAULT NULL,
  `nomor_transaksi` varchar(255) DEFAULT NULL,
  `jumlah_uang` varchar(255) DEFAULT NULL,
  `jumlah_sentralisasi` varchar(255) DEFAULT NULL,
  `jumlah_gereja` varchar(255) DEFAULT NULL,
  `persembahanTahun` int(10) DEFAULT NULL,
  `bulan_awal` varchar(255) DEFAULT NULL,
  `bulan_akhir` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `create_at` varchar(100) DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_pemasukan`
--

INSERT INTO `detail_pemasukan` (`id_pemasukan`, `induk_kategori_anggaran`, `kategori_mata_anggaran`, `mata_anggaran`, `isSentralisasi`, `tanggal_transaksi`, `tanggal_warta`, `nama_transaksi`, `jenis_transaksi`, `nomor_transaksi`, `jumlah_uang`, `jumlah_sentralisasi`, `jumlah_gereja`, `persembahanTahun`, `bulan_awal`, `bulan_akhir`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(8, 'PENERIMAAN TRANSITORI', 'RESSORT - PEMASUKAN', '158', 'Tidak', '11/06/2023', '18/06/2023', 'Sumbangan Mendukung Program Ressort tanggal 11/06/2023', 'Tunai', '110620230002', '200000', '0', '200.000', 2023, '6', '6', NULL, '2023-06-20 09:44:54', NULL, 0),
(9, 'PENERIMAAN HURIA', 'PERSEMBAHAN KEBAKTIAN UMUM', '4', 'Ya', '02/04/2023', '09/04/2023', 'Persembahan I B pkl 08.30 tanggal 02/04/2023', 'Tunai', '020420230002', '10000000', '4.500.000', '5.500.000', 2023, '4', '4', NULL, '2023-06-20 09:45:24', NULL, 0),
(16, 'PENERIMAAN HURIA', 'PERSEMBAHAN PESTA GEREJANI', '12', 'Ya', '14/06/2023', '25/06/2023', 'Persembahan Tahun Baru tanggal 14/06/2023', 'Tunai', '140620230002', '100000000', '45.000.000', '55.000.000', 2023, '6', '6', NULL, '2023-06-20 11:32:13', NULL, 0),
(17, 'PENERIMAAN HURIA', 'PERSEMBAHAN PESTA GEREJANI', '12', 'Ya', '01/06/2023', '04/06/2023', 'Persembahan Tahun Baru tanggal 01/06/2023', 'Tunai', '010620230002', '10000000', '4.500.000', '5.500.000', 2023, '6', '6', NULL, '2023-06-20 14:28:01', NULL, 0),
(18, 'PENERIMAAN HURIA', 'PENERIMAAN PESTA GEREJANI', '53', 'Tidak', '02/06/2023', '09/06/2023', 'Penerimaan Perayaan Paskah tanggal 02/06/2023', 'Tunai', '020620230004', '2000000', '0', '2.000.000', 2023, '6', '5', NULL, '2023-06-20 16:40:02', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pengeluaran`
--

CREATE TABLE `detail_pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `induk_kategori_anggaran` varchar(255) DEFAULT NULL,
  `kategori_mata_anggaran` varchar(255) DEFAULT NULL,
  `mata_anggaran` varchar(255) DEFAULT NULL,
  `nama_transaksi` varchar(100) DEFAULT NULL,
  `jumlah_uang` varchar(100) DEFAULT NULL,
  `jumlah_gereja` varchar(100) DEFAULT NULL,
  `tanggal_transaksi` varchar(10) DEFAULT NULL,
  `tanggal_warta` varchar(10) DEFAULT NULL,
  `persembahanTahun` int(10) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `detail_pengeluaran`
--

INSERT INTO `detail_pengeluaran` (`id_pengeluaran`, `induk_kategori_anggaran`, `kategori_mata_anggaran`, `mata_anggaran`, `nama_transaksi`, `jumlah_uang`, `jumlah_gereja`, `tanggal_transaksi`, `tanggal_warta`, `persembahanTahun`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(4, 'PENGELUARAN TRANSITORI', 'RESSORT - PENGELUARAN', '236', 'Sumb. Mendukung Program Ressort tanggal 09/06/2023', '20000000', '20.000.000', '09/06/2023', '10/06/2023', 2023, NULL, '2023-06-20 04:20:26', NULL, 0),
(5, 'PENGELUARAN TRANSITORI', 'DISTRIK - PENGELUARAN', '234', 'Persembahan untuk PGI tanggal 19/06/2023', '15000000', '15.000.000', '19/06/2023', '25/06/2023', 2023, NULL, '2023-06-20 07:32:05', NULL, 0),
(6, 'PENGELUARAN TRANSITORI', 'PEMBANGUNAN /PENGEM. SARANA', '254', 'Persembahan / Aek Satetek/Uc. Syukur tanggal 01/06/2023', '12500000', '12.500.000', '01/06/2023', '25/06/2023', 2023, NULL, '2023-06-20 07:32:26', NULL, 0),
(7, 'PENGELUARAN TRANSITORI', 'DISTRIK - PENGELUARAN', '235', 'Penyaluran Sumb. Sosial Distrik tanggal 01/06/2023', '14000000', '14.000.000', '01/06/2023', '10/06/2023', 2023, NULL, '2023-06-20 07:33:06', NULL, 0),
(8, 'PENGELUARAN TRANSITORI', 'RESSORT - PENGELUARAN', '237', 'Sumbangan untuk Huria Pagaran tanggal 01/06/2023', '5000000', '5.000.000', '01/06/2023', '10/06/2023', 2023, NULL, '2023-06-20 07:34:43', NULL, 0),
(9, 'PENGELUARAN TRANSITORI', 'DANA SOSIAL BANTUAN GEREJA', '177', 'Sumbangan untuk Korban Bencana Alam tanggal 01/06/2023', '50000000', '50.000.000', '01/06/2023', '10/06/2023', 2023, NULL, '2023-06-20 07:34:56', NULL, 0),
(10, 'PENGELUARAN TRANSITORI', 'RESSORT - PENGELUARAN', '240', 'Beasiswa utk Anak Berpretasi tanggal 09/06/2023', '100000000', '100.000.000', '09/06/2023', '11/06/2023', 2023, NULL, '2023-06-20 07:35:14', NULL, 0),
(11, 'PENGELUARAN TRANSITORI', 'KANTOR PUSAT - PENGELUARAN', '230', 'Ulaon Hatopan HKBP tanggal 01/06/2023', '15000000', '15.000.000', '01/06/2023', '10/06/2023', 2023, NULL, '2023-06-20 09:41:21', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pindah`
--

CREATE TABLE `detail_pindah` (
  `id_det_reg_pindah` int(11) NOT NULL,
  `id_jemaat` int(11) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_mata_anggaran` int(11) NOT NULL,
  `jumlah_sentralisasi` int(11) NOT NULL DEFAULT 0,
  `jumlah_gereja` int(11) NOT NULL DEFAULT 0,
  `bulan_awal` int(11) NOT NULL,
  `bulan_akhir` int(11) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `det_registrasi_jemaat`
--

CREATE TABLE `det_registrasi_jemaat` (
  `id_det_registrasi` int(11) NOT NULL,
  `id_registrasi` int(11) NOT NULL COMMENT ' ',
  `id_jemaat` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `distrik`
--

CREATE TABLE `distrik` (
  `id_distrik` int(11) NOT NULL,
  `kode_distrik` varchar(100) NOT NULL,
  `nama_distrik` varchar(150) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `nama_pareses` varchar(100) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `distrik`
--

INSERT INTO `distrik` (`id_distrik`, `kode_distrik`, `nama_distrik`, `alamat`, `id_kota`, `nama_pareses`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, '02', 'Silindung', 'Tapanuli Utara', 31, 'Pdt. Hasudungan Manalu', '2023-05-08 04:53:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gereja`
--

CREATE TABLE `gereja` (
  `id_gereja` int(11) NOT NULL,
  `id_ressort` int(11) NOT NULL,
  `id_jenis_gereja` int(11) NOT NULL,
  `kode_gereja` varchar(25) NOT NULL,
  `nama_gereja` varchar(100) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `nama_pendeta` varchar(100) NOT NULL,
  `tgl_berdiri` date NOT NULL,
  `jenis_gereja` varchar(100) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `gereja`
--

INSERT INTO `gereja` (`id_gereja`, `id_ressort`, `id_jenis_gereja`, `kode_gereja`, `nama_gereja`, `alamat`, `id_kota`, `nama_pendeta`, `tgl_berdiri`, `jenis_gereja`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 1, 1, '0243', 'HKBP Palmarum', 'Stadion Tarutung, Hutatoruan VI, Kec. Tarutung, Kabupaten Tapanuli Utara, Sumatera Utara', 31, 'Pdt. Martin Gultom. SSi. Teol', '1999-06-20', 'Tanpa Pagaran', '2023-05-09 08:34:18', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `head_pindah`
--

CREATE TABLE `head_pindah` (
  `id_head_reg_pindah` int(11) NOT NULL,
  `id_registrasi` int(11) NOT NULL,
  `id_jemaat` int(11) DEFAULT NULL,
  `id_gereja` int(11) NOT NULL DEFAULT 1,
  `no_surat_pindah` int(11) DEFAULT NULL,
  `tgl_pindah` date NOT NULL,
  `tgl_warta` date DEFAULT NULL,
  `id_jenis_registrasi` int(11) DEFAULT 2,
  `id_gereja_tujuan` int(11) DEFAULT NULL,
  `nama_gereja` varchar(100) DEFAULT NULL,
  `file_surat_pindah` varchar(150) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `head_pindah`
--

INSERT INTO `head_pindah` (`id_head_reg_pindah`, `id_registrasi`, `id_jemaat`, `id_gereja`, `no_surat_pindah`, `tgl_pindah`, `tgl_warta`, `id_jenis_registrasi`, `id_gereja_tujuan`, `nama_gereja`, `file_surat_pindah`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(2, 107, 2, 1, NULL, '2023-06-04', NULL, 2, NULL, 'Parso', NULL, 'melayaa', '2023-06-06 04:14:54', NULL, 0),
(3, 55, 2, 1, NULL, '2023-05-28', NULL, 2, NULL, 'Parso', NULL, 'asdfg', '2023-06-06 04:26:27', NULL, 0),
(4, 1, 1, 1, NULL, '2023-05-28', NULL, 2, NULL, 'adsad', NULL, 'wwewe', '2023-06-06 04:27:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `head_transaksi`
--

CREATE TABLE `head_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `jenis_transaksi` varchar(150) NOT NULL,
  `no_transaksi` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `tahun_anggaran` varchar(20) NOT NULL,
  `tanggal_warta` date NOT NULL,
  `is_Jemaat` tinyint(1) DEFAULT 0,
  `id_jemaat` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `hubungan_keluarga`
--

CREATE TABLE `hubungan_keluarga` (
  `id_hub_keluarga` int(11) NOT NULL,
  `nama_hub_keluarga` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `hubungan_keluarga`
--

INSERT INTO `hubungan_keluarga` (`id_hub_keluarga`, `nama_hub_keluarga`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'Kepala Keluarga', '', '2023-05-10 08:48:26', NULL, 0),
(2, 'Istri', '', '2023-05-10 08:48:36', NULL, 0),
(3, 'Anak', '', '2023-05-10 08:48:41', NULL, 0),
(4, 'Tanggungan', '', '2023-05-10 08:48:46', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ibadah`
--

CREATE TABLE `jadwal_ibadah` (
  `id_jadwal_ibadah` int(11) NOT NULL,
  `tgl_ibadah` date NOT NULL,
  `id_jenis_minggu` int(11) DEFAULT NULL,
  `id_jam_kegiatan` int(11) DEFAULT NULL,
  `id_melayani` int(11) DEFAULT NULL,
  `jumlah_pelayan` int(11) NOT NULL,
  `waktu_mulai` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `nyanyian_1` varchar(255) DEFAULT NULL,
  `votum` varchar(255) DEFAULT NULL,
  `nyanyian_2` varchar(255) DEFAULT NULL,
  `hukum_taurat` varchar(255) DEFAULT NULL,
  `nyanyian_3` varchar(255) DEFAULT NULL,
  `pengakuan_dosa` varchar(255) DEFAULT NULL,
  `nyanyian_4` varchar(255) DEFAULT NULL,
  `epistel` varchar(255) DEFAULT NULL,
  `nyanyian_5` varchar(255) DEFAULT NULL,
  `pengakuan_iman` varchar(255) DEFAULT NULL,
  `nyanyian_6` varchar(255) DEFAULT NULL,
  `khotbah` varchar(255) DEFAULT NULL,
  `nyanyian_7` varchar(255) DEFAULT NULL,
  `doa_penutup` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jadwal_ibadah`
--

INSERT INTO `jadwal_ibadah` (`id_jadwal_ibadah`, `tgl_ibadah`, `id_jenis_minggu`, `id_jam_kegiatan`, `id_melayani`, `jumlah_pelayan`, `waktu_mulai`, `keterangan`, `create_at`, `update_at`, `is_deleted`, `nyanyian_1`, `votum`, `nyanyian_2`, `hukum_taurat`, `nyanyian_3`, `pengakuan_dosa`, `nyanyian_4`, `epistel`, `nyanyian_5`, `pengakuan_iman`, `nyanyian_6`, `khotbah`, `nyanyian_7`, `doa_penutup`) VALUES
(9, '2023-06-04', 1, NULL, 9, 2, '2023-06-08 03:26:12', NULL, '2023-06-08 03:20:52', NULL, 0, '559 : 1 - 3', 'A. XIV/A - D. XII/35', '113 : 1', '1 + Artinya', '688 : 1 - 2', 'B.5 - C.6 ', '128 : 1', 'MATIUS 11 : 25 - 27', '116 : 1 + 4', NULL, '112 : 1 .......... Persembahan 1A, 1B', 'KEJADIAN 1 : 1 -2, 26 - 28', '679 : 1 ......... Pelean 2', 'Amen, Amen, Amen');

-- --------------------------------------------------------

--
-- Table structure for table `jam_kegiatan`
--

CREATE TABLE `jam_kegiatan` (
  `id_jam_kegiatan` int(11) NOT NULL,
  `id_jenis_kegiatan` int(11) NOT NULL,
  `id_gereja` int(11) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jemaat`
--

CREATE TABLE `jemaat` (
  `id_jemaat` int(11) NOT NULL,
  `id_registrasi` int(11) DEFAULT NULL,
  `nama_depan` varchar(50) NOT NULL,
  `nama_belakang` varchar(50) NOT NULL,
  `gelar_depan` varchar(25) NOT NULL,
  `gelar_belakang` varchar(25) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(25) NOT NULL,
  `id_hub_keluarga` int(11) DEFAULT NULL,
  `id_status_pernikahan` int(11) DEFAULT NULL,
  `id_pendidikan` int(11) DEFAULT NULL,
  `id_bidang_pendidikan` int(11) DEFAULT NULL,
  `id_bidang_pendidikan_lain` int(11) DEFAULT NULL,
  `id_pekerjaan` int(11) DEFAULT NULL,
  `nama_pekerjaan_lain` varchar(100) DEFAULT NULL,
  `gol_darah` char(5) DEFAULT NULL,
  `alamat` varchar(250) DEFAULT NULL,
  `id_kota` int(11) DEFAULT 31,
  `no_telepon` varchar(20) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `isSidi` tinyint(1) DEFAULT 1,
  `isBaptis` tinyint(1) DEFAULT 1,
  `isMeninggal` tinyint(1) DEFAULT 0,
  `isRPP` tinyint(1) DEFAULT 0,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jemaat`
--

INSERT INTO `jemaat` (`id_jemaat`, `id_registrasi`, `nama_depan`, `nama_belakang`, `gelar_depan`, `gelar_belakang`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `id_hub_keluarga`, `id_status_pernikahan`, `id_pendidikan`, `id_bidang_pendidikan`, `id_bidang_pendidikan_lain`, `id_pekerjaan`, `nama_pekerjaan_lain`, `gol_darah`, `alamat`, `id_kota`, `no_telepon`, `keterangan`, `isSidi`, `isBaptis`, `isMeninggal`, `isRPP`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 1, 'Lidya', 'Simamora', '', '', '', '1975-09-16', 'Laki-Laki', 3, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl. S. Dis. Sitompul Hutabagot Simaungmaung Dolok', 31, '', NULL, 1, 1, 0, 1, '2023-05-11 01:43:02', NULL, 0),
(2, 2, 'Jahuari', 'Sianturi', '', '', '', '1952-03-11', 'Laki-Laki', 1, 4, NULL, NULL, 0, NULL, NULL, NULL, 'Jl. Guru Mangaloksa Gang Kompas Ujung', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 01:45:56', NULL, 0),
(3, 2, 'Ritual Delima', 'Sianturi', '', '', '', '1988-02-23', 'Perempuan', 2, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl. Guru Mangaloksa Gang Kompas Ujung', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 01:49:24', NULL, 0),
(4, 2, 'Nova Berta', 'Sianturi', '', '', '', '1991-11-06', 'Laki-Laki', 2, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl. Guru Mangaloksa Gang Kompas Ujung', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 01:56:22', NULL, 0),
(5, 3, 'Ny. Pardede', 'br. Manurung', 'CSt', 'STh', '', '1965-04-28', 'Laki-Laki', 1, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl. Farel Pasaribu', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 02:03:49', NULL, 0),
(6, 3, 'Talenta', 'Pardede', '', '', '', '1996-09-28', 'Perempuan', 3, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl. Farel Pasaribu', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 02:06:36', NULL, 0),
(7, 3, 'Ester', 'Pardede', '', '', '', '2000-06-22', 'Perempuan', 3, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl. Farel Pasaribu', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 02:06:58', NULL, 0),
(8, 4, 'Ny Nababan Rosbinaria', 'Sianturi / Op Hanna Nababan', '', '', '', '1968-06-06', 'Perempuan', 1, 4, NULL, NULL, 0, NULL, NULL, NULL, 'Jl S.Dis. Sitompul No 92', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 02:13:09', NULL, 0),
(9, 5, 'Juaja', 'br. Lumbantobing', '', '', '', '1961-06-01', 'Perempuan', 2, 4, NULL, NULL, 0, NULL, NULL, NULL, 'Jl S.Dis. Sitompul', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 02:14:17', NULL, 0),
(10, 5, 'Yansen Januar', 'Nababan', '', '', '', '0000-00-00', 'Laki-Laki', 3, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl S.Dis. Sitompul', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 02:16:52', NULL, 0),
(11, 5, 'Melissa', 'br. Nababan', '', '', '', '1991-01-04', 'Perempuan', 3, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl S.Dis. Sitompul', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 02:27:22', NULL, 0),
(12, 5, 'Christofel Pulutan', 'Nababan', '', '', '', '1994-12-09', 'Laki-Laki', 3, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl S.Dis. Sitompul', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 02:27:50', NULL, 0),
(13, 5, 'Theresia Megawati', 'Nababan', '', '', '', '1998-06-09', 'Perempuan', 3, 3, NULL, NULL, 0, NULL, NULL, NULL, 'Jl S.Dis. Sitompul', 31, '', NULL, 1, 1, 0, 0, '2023-05-11 02:28:29', NULL, 0),
(18, NULL, 'Josep', 'Napitupulu', 'Dr.', 'S.Tr', 'Parsoburan', '2003-09-07', 'Laki-Laki', 3, 2, 1, NULL, 1, 1, 'Paragat', 'O', 'Parsanggarahan, Parsoburan', 31, '082285393684', 'Mwehehehee', 0, 0, 0, 0, '2023-06-05 08:40:30', NULL, 0),
(19, NULL, 'Josep', 'Napitupulu', 'Dr.', 'S.Tr', 'Parsoburan', '2003-09-07', 'Laki-Laki', 3, 2, 1, NULL, 1, 1, 'Paragat', 'O', 'Parsanggarahan, Parsoburan', 31, '082285393684', 'Mwehehehee', 1, 1, 0, 0, '2023-06-05 08:47:34', NULL, 0),
(20, NULL, 'rendi', 'Napitupulu', 'Dr.', 'S.Tr', 'Laguboiti', '2003-09-07', 'Laki-Laki', 3, 2, 1, 1, NULL, 1, 'Paragat', 'A', 'Parsanggarahan, Parsoburan', 31, '082285393684', 'Mwehehehee', 1, 1, 0, 0, '2023-06-05 16:42:54', NULL, 0),
(21, NULL, 'Josep', 'Rendi', 'te', 'Sadj', 'parso', '2003-09-07', 'Laki-Laki', 3, 2, 1, 1, NULL, 1, 'Pamano', 'O', 'medan, Parsoburan', 31, '89897873', 'hahhaha', 1, 1, 0, 0, '2023-06-05 17:56:34', NULL, 0),
(22, NULL, 'sama', 'sda', 'Dr.', 'S.Tr', 'dsds', '2023-05-28', 'Laki-laki', 3, 1, 4, 7, NULL, 7, 'Mahasiswa', 'O', 'medan', 31, '095288367229', 'asdfghj', 1, 1, 0, 0, '2023-06-06 02:00:31', NULL, 0),
(23, NULL, 'COcep', 'Phyto', 'Dr.', 'S.Tr', 'Parsoburan', '2023-05-28', 'Laki-laki', 3, 1, 4, 8, NULL, 8, 'Mahasiswa', 'O', 'Laguboti', 31, '095288367229', 'mwehehehe', 1, 1, 0, 0, '2023-06-06 02:08:30', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jemaat_hadir`
--

CREATE TABLE `jemaat_hadir` (
  `id_jemaat_hadir` int(11) NOT NULL,
  `id_jadwal_ibadah` int(11) NOT NULL,
  `bapak` int(11) NOT NULL,
  `ibu` int(11) NOT NULL,
  `naposo_laki` int(11) NOT NULL,
  `naposo_perempuan` int(11) NOT NULL,
  `remaja_laki` int(11) NOT NULL,
  `remaja_perempuan` int(11) NOT NULL,
  `sekolah_minggu_laki` int(11) NOT NULL,
  `sekolah_minggu_perempuan` int(11) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_gereja`
--

CREATE TABLE `jenis_gereja` (
  `id_jenis_gereja` int(11) NOT NULL,
  `jenis_gereja` varchar(100) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jenis_gereja`
--

INSERT INTO `jenis_gereja` (`id_jenis_gereja`, `jenis_gereja`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'HKBP', 'Gereja Batak Protestan', '2023-04-23 08:10:31', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kegiatan`
--

CREATE TABLE `jenis_kegiatan` (
  `id_jenis_kegiatan` int(11) NOT NULL,
  `nama_jenis_kegiatan` varchar(250) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `lokasi_kegiatan` varchar(255) DEFAULT NULL,
  `tanggal_kegiatan` date DEFAULT NULL,
  `waktu_kegiatan` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jenis_kegiatan`
--

INSERT INTO `jenis_kegiatan` (`id_jenis_kegiatan`, `nama_jenis_kegiatan`, `keterangan`, `create_at`, `update_at`, `is_deleted`, `lokasi_kegiatan`, `tanggal_kegiatan`, `waktu_kegiatan`) VALUES
(1, 'Pesta Huria', 'Melaksanakan Acara Lelang', '2023-06-07 03:57:00', NULL, 0, 'Gedung Serbaguna HKBP Palmarum', '2023-05-31', '10:56:58'),
(2, 'Lelang', 'Lelang Tahunan', '2023-06-07 04:09:10', NULL, 0, 'HKBP Palmarum', '2023-05-28', '16:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_minggu`
--

CREATE TABLE `jenis_minggu` (
  `id_jenis_minggu` int(11) NOT NULL,
  `nama_jenis_minggu` varchar(255) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jenis_minggu`
--

INSERT INTO `jenis_minggu` (`id_jenis_minggu`, `nama_jenis_minggu`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'Minggu Trinitatis', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_registrasi`
--

CREATE TABLE `jenis_registrasi` (
  `id_jenis_registrasi` int(11) NOT NULL,
  `nama_jenis_registrasi` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `sub_jenis_registrasi` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `id_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jenis_registrasi`
--

INSERT INTO `jenis_registrasi` (`id_jenis_registrasi`, `nama_jenis_registrasi`, `sub_jenis_registrasi`, `keterangan`, `create_at`, `update_at`, `id_deleted`) VALUES
(1, 'Registrasi Jemaat Baru', 'Registrasi Jemaat', 'Digunakan Sebagai Jenis Registrasi dari Jemaat', '2023-05-08 09:08:00', NULL, 0),
(2, 'Registrasi Jemaat Pindah', 'Registrasi Jemaat', 'Digunakan Sebagai Jenis Registrasi dari Jemaat', '2023-05-08 09:08:23', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_rpp`
--

CREATE TABLE `jenis_rpp` (
  `id_jenis_rpp` int(11) NOT NULL,
  `jenis_rpp` varchar(100) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jenis_rpp`
--

INSERT INTO `jenis_rpp` (`id_jenis_rpp`, `jenis_rpp`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'Membunuh', 'Pelanggaran Berat', '2023-05-23 15:13:44', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_status`
--

CREATE TABLE `jenis_status` (
  `id_jenis_status` int(11) NOT NULL,
  `jenis_status` varchar(100) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `jenis_status`
--

INSERT INTO `jenis_status` (`id_jenis_status`, `jenis_status`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'Registrasi', 'Jenis Status Ini Digunakan Untuk Status Registrasi', '2023-04-23 02:25:38', NULL, 0),
(2, 'Pernikahan', 'Untuk Status Pernikahan', '2023-05-10 08:49:58', NULL, 0),
(3, 'Status Jemaat Aktif', '', '2023-05-17 03:27:59', NULL, 0),
(4, 'Status Jemaat Meninggal', '', '2023-05-17 03:27:59', NULL, 0),
(5, 'Status Jemaat Pindah', '', '2023-05-17 03:27:59', NULL, 0),
(6, 'Status Jemaat Rpp', '', '2023-05-17 03:27:59', NULL, 0),
(7, 'Status Majelis Aktif', '', '2023-05-17 03:27:59', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_mata_anggaran`
--

CREATE TABLE `kategori_mata_anggaran` (
  `induk_kategori_anggaran` varchar(255) NOT NULL,
  `id_kategori_anggaran` int(11) NOT NULL,
  `kode_kategori_anggaran` int(6) NOT NULL,
  `nama_kategori_anggaran` varchar(150) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kategori_mata_anggaran`
--

INSERT INTO `kategori_mata_anggaran` (`induk_kategori_anggaran`, `id_kategori_anggaran`, `kode_kategori_anggaran`, `nama_kategori_anggaran`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
('PENERIMAAN HURIA', 1, 410000, 'PERSEMBAHAN KEBAKTIAN UMUM', NULL, '2023-06-10 03:04:12', NULL, 0),
('PENERIMAAN HURIA', 2, 420000, 'PERSEMBAHAN PESTA GEREJANI', NULL, '2023-06-10 23:52:37', NULL, 0),
('PENERIMAAN HURIA', 3, 430000, 'PERSEMBAHAN LAINNYA', NULL, '2023-06-10 23:52:54', NULL, 0),
('PENERIMAAN HURIA', 4, 440000, 'PERSEMBAHAN BULANAN, PERPULUHAN, UCAPAN SYUKUR', NULL, '2023-06-10 23:53:18', NULL, 0),
('PENERIMAAN HURIA', 5, 450000, 'PENERIMAAN PESTA GEREJANI', NULL, '2023-06-10 23:53:55', NULL, 0),
('PENERIMAAN HURIA', 6, 460000, 'DEWAN KOINONIA - PEMASUKAN', NULL, '2023-06-11 22:02:21', NULL, 0),
('PENERIMAAN HURIA', 7, 470000, 'DEWAN MARTURIA - PEMASUKAN', NULL, '2023-06-11 22:02:44', NULL, 0),
('PENERIMAAN HURIA', 8, 480000, 'DEWAN DIAKONIA - PEMASUKAN', NULL, '2023-06-11 22:02:57', NULL, 0),
('PENERIMAAN HURIA', 9, 490000, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', NULL, '2023-06-11 22:03:14', NULL, 0),
('PENERIMAAN TRANSITORI', 19, 510000, 'KANTOR PUSAT - PEMASUKAN', NULL, '2023-06-13 03:47:18', NULL, 0),
('PENERIMAAN TRANSITORI', 21, 520000, 'DISTRIK - PEMASUKAN', NULL, '2023-06-13 06:45:28', NULL, 0),
('PENERIMAAN TRANSITORI', 22, 530000, 'RESSORT - PEMASUKAN', NULL, '2023-06-14 01:05:54', NULL, 0),
('PENERIMAAN TRANSITORI', 23, 540000, 'PROGRAM DANA BEASISWA', NULL, '2023-06-14 01:06:55', NULL, 0),
('PENERIMAAN TRANSITORI', 24, 550000, 'DANA SOSIAL BANTUAN GEREJA', NULL, '2023-06-14 01:07:03', NULL, 0),
('PENERIMAAN TRANSITORI', 25, 560000, 'UCAPAN SYUKUR', NULL, '2023-06-14 01:07:17', NULL, 0),
('PENERIMAAN TRANSITORI', 26, 570000, 'PEMBANGUNAN', NULL, '2023-06-14 01:07:49', NULL, 0),
('PENERIMAAN TRANSITORI', 27, 580000, 'KPJEL', NULL, '2023-06-14 01:08:30', NULL, 0),
('PENERIMAAN TRANSITORI', 28, 590000, 'PENGADAAN LAHAN PARKIR', NULL, '2023-06-14 01:08:39', NULL, 0),
('PENGELUARAN TRANSITORI', 45, 610000, 'KANTOR PUSAT - PENGELUARAN', NULL, '2023-06-19 01:17:32', NULL, 0),
('PENGELUARAN TRANSITORI', 46, 620000, 'DISTRIK - PENGELUARAN', NULL, '2023-06-19 01:17:46', NULL, 0),
('PENGELUARAN TRANSITORI', 47, 630000, 'RESSORT - PENGELUARAN', NULL, '2023-06-19 01:17:57', NULL, 0),
('PENGELUARAN TRANSITORI', 48, 640000, 'PENYALURAN DANA BEASISWA', NULL, '2023-06-19 01:18:09', NULL, 0),
('PENGELUARAN TRANSITORI', 49, 650000, 'DANA SOSIAL BANTUAN GEREJA', NULL, '2023-06-19 01:18:22', NULL, 0),
('PENGELUARAN TRANSITORI', 50, 660000, 'REALISASI UCAPAN SYUKUR', NULL, '2023-06-19 01:18:33', NULL, 0),
('PENGELUARAN TRANSITORI', 51, 670000, 'PEMBANGUNAN /PENGEM. SARANA', NULL, '2023-06-19 01:18:44', NULL, 0),
('PENGELUARAN TRANSITORI', 52, 680000, 'KOMISI KPJEL', NULL, '2023-06-19 01:18:54', NULL, 0),
('PENGELUARAN TRANSITORI', 53, 690000, 'PANITIA PENGADAAN LAHAN SERBAGUNA', NULL, '2023-06-19 01:19:04', NULL, 0),
('PENGELUARAN TRANSITORI', 54, 710000, 'DEWAN KOINONIA - PENGELUARAN', NULL, '2023-06-19 01:19:16', NULL, 0),
('PENGELUARAN HURIA', 55, 712000, 'Seksi Remaja', NULL, '2023-06-19 01:19:28', NULL, 0),
('PENGELUARAN HURIA', 56, 720000, 'DEWAN MARTURIA - PENGELUARAN', NULL, '2023-06-19 01:20:09', NULL, 0),
('PENGELUARAN TRANSITORI', 57, 730000, 'DEWAN DIAKONIA - PENGELUARAN', NULL, '2023-06-19 01:20:25', NULL, 0),
('SEKRETARIAT HURIA', 58, 810000, 'Tata Usaha - Adminitrasi', NULL, '2023-06-19 01:20:48', NULL, 0),
('PENGELUARAN HURIA', 59, 820000, 'Tata Usaha - Keuangan', NULL, '2023-06-19 01:21:02', NULL, 0),
('SEKRETARIAT HURIA', 60, 830000, 'Rumah Tangga / Pemeliharaan', NULL, '2023-06-19 01:21:13', NULL, 0),
('SEKRETARIAT HURIA', 61, 840000, 'RENUNGAN HARIAN', NULL, '2023-06-19 01:21:28', NULL, 0),
('SEKRETARIAT HURIA', 62, 850000, 'PELAJAR SIDI', NULL, '2023-06-19 01:21:38', NULL, 0),
('PERBENDAHARAAN (PARARTAON)', 63, 910000, 'BENDAHARA', NULL, '2023-06-19 01:21:53', NULL, 0),
('PERBENDAHARAAN (PARARTAON)', 64, 920000, 'PENGADAAN BARANG / INVENTARIS', NULL, '2023-06-19 01:22:04', NULL, 0),
('PERBENDAHARAAN (PARARTAON)', 65, 930000, 'KONTRIBUSI, GAJI/HONOR, PELAYANAN LAIN-LAIN', NULL, '2023-06-19 01:22:18', NULL, 0),
('PERBENDAHARAAN (PARARTAON)', 66, 940000, 'PESTA / PERAYAAN GEREJANI', NULL, '2023-06-19 01:22:53', NULL, 0),
('PENERIMAAN HURIA', 68, 400001, 'test case', NULL, '2023-06-20 09:35:19', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pemasukan`
--

CREATE TABLE `kategori_pemasukan` (
  `id_kategori_pemasukan` int(11) NOT NULL,
  `kategori_pemasukan` varchar(100) NOT NULL,
  `deskripsi` varchar(250) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `majelis`
--

CREATE TABLE `majelis` (
  `id_majelis` int(11) NOT NULL,
  `id_jemaat` int(11) NOT NULL,
  `id_pelayan` int(11) NOT NULL,
  `id_gereja` int(11) NOT NULL DEFAULT 1,
  `tgh_tahbis` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tgl_akhir_jawatan` date NOT NULL,
  `id_status_pelayanan` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `majelis`
--

INSERT INTO `majelis` (`id_majelis`, `id_jemaat`, `id_pelayan`, `id_gereja`, `tgh_tahbis`, `tgl_akhir_jawatan`, `id_status_pelayanan`, `create_at`, `update_at`, `is_deleted`) VALUES
(9, 12, 4, 1, '2023-06-08 03:15:17', '0000-00-00', 11, '2023-06-08 03:15:17', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mata_anggaran`
--

CREATE TABLE `mata_anggaran` (
  `id_mata_anggaran` int(11) NOT NULL,
  `kategori_mata_anggaran` varchar(150) NOT NULL,
  `kode_mata_anggaran` int(11) NOT NULL,
  `nama_mata_anggaran` varchar(150) NOT NULL,
  `jenis_anggaran` varchar(150) NOT NULL,
  `isSentralisasi` varchar(10) NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mata_anggaran`
--

INSERT INTO `mata_anggaran` (`id_mata_anggaran`, `kategori_mata_anggaran`, `kode_mata_anggaran`, `nama_mata_anggaran`, `jenis_anggaran`, `isSentralisasi`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'PERSEMBAHAN KEBAKTIAN UMUM', 410010, 'Persembahan I A pkl 06.00', 'Pemasukan', 'Ya', NULL, '2023-06-17 23:49:23', NULL, 0),
(2, 'PERSEMBAHAN KEBAKTIAN UMUM', 410020, 'Persembahan I B pkl 06.00', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:18', NULL, 0),
(3, 'PERSEMBAHAN KEBAKTIAN UMUM', 410030, 'Persembahan I A pkl 08.30', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:20', NULL, 0),
(4, 'PERSEMBAHAN KEBAKTIAN UMUM', 410040, 'Persembahan I B pkl 08.30', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:22', NULL, 0),
(5, 'PERSEMBAHAN KEBAKTIAN UMUM', 410045, 'Persembahan I A pkl 11.00', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:24', NULL, 0),
(6, 'PERSEMBAHAN KEBAKTIAN UMUM', 410047, 'Persembahan I B pkl 11.00', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:27', NULL, 0),
(7, 'PERSEMBAHAN KEBAKTIAN UMUM', 410050, 'Persembahan I A pkl 18.00', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:28', NULL, 0),
(8, 'PERSEMBAHAN KEBAKTIAN UMUM', 410060, 'Persembahan I B pkl 18.00', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:30', NULL, 0),
(9, 'PERSEMBAHAN KEBAKTIAN UMUM', 410070, 'Persembahan Ibadah Khusus pkl. 15.30', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:32', NULL, 0),
(10, 'PERSEMBAHAN KEBAKTIAN UMUM', 410080, 'Persembahan Sekolah Minggu', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:33', NULL, 0),
(11, 'PERSEMBAHAN KEBAKTIAN UMUM', 410090, 'Persembahan Kebaktian Umum Lainnya', 'Pemasukan', 'Ya', NULL, '2023-06-12 01:24:36', NULL, 0),
(12, 'PERSEMBAHAN PESTA GEREJANI', 420010, 'Persembahan Tahun Baru', 'Pemasukan', 'Ya', NULL, '2023-06-13 03:42:06', NULL, 0),
(13, 'PERSEMBAHAN PESTA GEREJANI', 420020, 'Persembahan Passion', 'Pemasukan', 'Ya', NULL, '2023-06-13 03:42:11', NULL, 0),
(14, 'PERSEMBAHAN PESTA GEREJANI', 420030, 'Persembahan Jumat Agung', 'Pemasukan', 'Ya', NULL, '2023-06-13 03:42:14', NULL, 0),
(15, 'PERSEMBAHAN PESTA GEREJANI', 420040, 'Persembahan Paskah', 'Pemasukan', 'Ya', NULL, '2023-06-13 03:42:16', NULL, 0),
(16, 'PERSEMBAHAN PESTA GEREJANI', 420050, 'Persembahan Hari Kenaikan', 'Pemasukan', 'Ya', NULL, '2023-06-13 03:42:19', NULL, 0),
(17, 'PERSEMBAHAN PESTA GEREJANI', 420060, 'Persembahan Turunnya Roh Kudus', 'Pemasukan', 'Ya', NULL, '2023-06-13 03:42:22', NULL, 0),
(18, 'PERSEMBAHAN PESTA GEREJANI', 420070, 'Persembahan Natal ( 24+25 Des )', 'Pemasukan', 'Ya', NULL, '2023-06-14 01:13:24', NULL, 0),
(19, 'PERSEMBAHAN PESTA GEREJANI', 420080, 'Persembahan Perjamuan Kudus', 'Pemasukan', 'Ya', NULL, '2023-06-16 01:19:28', NULL, 0),
(29, 'PERSEMBAHAN PESTA GEREJANI', 420090, 'Persembahan Akhir Tahun', 'Pemasukan', 'Ya', NULL, '2023-06-13 09:36:20', NULL, 0),
(30, 'PERSEMBAHAN LAINNYA', 430010, 'Persembahan Kebaktian Remaja Wijk', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:13:53', NULL, 0),
(31, 'PERSEMBAHAN LAINNYA', 430020, 'Persembahan Kebaktian Pemuda', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:14:10', NULL, 0),
(32, 'PERSEMBAHAN LAINNYA', 430030, 'Persembahan Sermon Ina', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:15:04', NULL, 0),
(33, 'PERSEMBAHAN LAINNYA', 430050, 'Persembahan Sermon Ina Hanna', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:15:22', NULL, 0),
(34, 'PERSEMBAHAN LAINNYA', 430060, 'Persembahan Sermon Ama', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:15:32', NULL, 0),
(35, 'PERSEMBAHAN LAINNYA', 430070, 'Persembahan Sermon Lansia', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:15:59', NULL, 0),
(36, 'PERSEMBAHAN LAINNYA', 430080, 'Persembahan Sermon Parhalado', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:16:08', NULL, 0),
(37, 'PERSEMBAHAN LAINNYA', 430090, 'Persembahan Kebaktian Pelajar Sidi', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:16:17', NULL, 0),
(38, 'PERSEMBAHAN LAINNYA', 430100, 'Persembahan Kebaktian Wijk', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:16:26', NULL, 0),
(39, 'PERSEMBAHAN LAINNYA', 430110, 'Kebaktian Ucapan Syukur Keluarga', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:16:40', NULL, 0),
(40, 'PERSEMBAHAN LAINNYA', 430120, 'Kebaktian Ucapan Syukur Punguan', 'Pemasukan', 'Tidak', NULL, '2023-06-16 04:05:49', NULL, 0),
(41, 'PERSEMBAHAN LAINNYA', 430130, 'Persembahan Janji Nikah/Martumpol', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:16:57', NULL, 0),
(42, 'PERSEMBAHAN LAINNYA', 430140, 'Persembahan Pemberkatan Nikah', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:17:07', NULL, 0),
(43, 'PERSEMBAHAN LAINNYA', 430150, 'Persem. Kebaktian Natal Kel / Punguan', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:17:16', NULL, 0),
(44, 'PERSEMBAHAN LAINNYA', 430215, 'Persembahan Sermon Ina Ester', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:17:26', NULL, 0),
(45, 'PERSEMBAHAN LAINNYA', 430730, 'Persembahan Ujung & Bona Taon Kel. / Punguan', 'Pemasukan', 'Tidak', NULL, '2023-06-14 01:17:36', NULL, 0),
(46, 'PERSEMBAHAN LAINNYA', 430740, 'Persembahan Kebaktian Duka', 'Pemasukan', 'Tidak', NULL, '2023-06-13 09:39:16', NULL, 0),
(47, 'PERSEMBAHAN BULANAN, PERPULUHAN, UCAPAN SYUKUR', 440010, 'Persembahan Daud', 'Pemasukan', 'Tidak', NULL, '2023-06-14 21:12:14', NULL, 0),
(48, 'PERSEMBAHAN BULANAN, PERPULUHAN, UCAPAN SYUKUR', 440020, 'Persembahan Perpuluhan', 'Pemasukan', 'Tidak', NULL, '2023-06-14 21:12:35', NULL, 0),
(49, 'PERSEMBAHAN BULANAN, PERPULUHAN, UCAPAN SYUKUR', 440030, 'Ucapan Syukur tu Huria', 'Pemasukan', 'Tidak', NULL, '2023-06-14 21:12:57', NULL, 0),
(50, 'PERSEMBAHAN BULANAN, PERPULUHAN, UCAPAN SYUKUR', 440040, 'Ucapan Syukur Natal Keluarga', 'Pemasukan', 'Tidak', NULL, '2023-06-14 21:13:12', NULL, 0),
(51, 'PERSEMBAHAN BULANAN, PERPULUHAN, UCAPAN SYUKUR', 440050, 'Uc. Syukur Akhir/Awal Tahun Keluarga', 'Pemasukan', 'Tidak', NULL, '2023-06-14 21:13:29', NULL, 0),
(52, 'PENERIMAAN PESTA GEREJANI', 450110, 'Natal & Tahun baru (SM,R/Naposo, Umum)', 'Pemasukan', 'Tidak', NULL, '2023-06-19 00:54:59', NULL, 0),
(53, 'PENERIMAAN PESTA GEREJANI', 450210, 'Penerimaan Perayaan Paskah', 'Pemasukan', 'Tidak', NULL, '2023-06-15 05:51:09', NULL, 0),
(54, 'PENERIMAAN PESTA GEREJANI', 450310, 'Penerimaan Pesta Huria / Gotilon', 'Pemasukan', 'Tidak', NULL, '2023-06-14 21:14:47', NULL, 0),
(55, 'PENERIMAAN PESTA GEREJANI', 450320, 'Program Khusus penggalangan Dana', 'Pemasukan', 'Tidak', NULL, '2023-06-15 05:50:15', NULL, 0),
(56, 'PENERIMAAN PESTA GEREJANI', 450330, 'Janji Iman', 'Pemasukan', 'Tidak', NULL, '2023-06-14 21:16:10', NULL, 0),
(57, 'DEWAN KOINONIA - PEMASUKAN', 460110, 'Ucapan Syukur Kategorial Sekolah Minggu', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:51:55', NULL, 0),
(58, 'DEWAN KOINONIA - PEMASUKAN', 460120, 'Parheheon Sekolah Minggu', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:02', NULL, 0),
(59, 'DEWAN KOINONIA - PEMASUKAN', 460130, 'Retret Sekolah Minggu', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:05', NULL, 0),
(60, 'DEWAN KOINONIA - PEMASUKAN', 460140, 'Kebaktian Padang Sekolah Minggu', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:06', NULL, 0),
(61, 'DEWAN KOINONIA - PEMASUKAN', 460150, 'Pelean Natal Sekolah Minggu', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:08', NULL, 0),
(62, 'DEWAN KOINONIA - PEMASUKAN', 460210, 'Ucapan Syukur untuk Remaja', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:09', NULL, 0),
(63, 'DEWAN KOINONIA - PEMASUKAN', 460220, 'Kegiatan Rutin', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:11', NULL, 0),
(64, 'DEWAN KOINONIA - PEMASUKAN', 460230, 'Kebangunan Rohani', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:13', NULL, 0),
(65, 'DEWAN KOINONIA - PEMASUKAN', 460250, 'Retreat Remaja', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:17', NULL, 0),
(66, 'DEWAN KOINONIA - PEMASUKAN', 460260, 'Bazaar Remaja', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:19', NULL, 0),
(67, 'DEWAN KOINONIA - PEMASUKAN', 460270, 'Parheheon Remaja', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:21', NULL, 0),
(68, 'DEWAN KOINONIA - PEMASUKAN', 460310, 'Ucapan Syukur untuk Naposobulung', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:22', NULL, 0),
(69, 'DEWAN KOINONIA - PEMASUKAN', 460320, 'Parheheon Naposobulung', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:24', NULL, 0),
(70, 'DEWAN KOINONIA - PEMASUKAN', 460330, 'Retret Naposobulung', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:26', NULL, 0),
(71, 'DEWAN KOINONIA - PEMASUKAN', 460340, 'Kebaktian Bulanan Naposobulung', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:27', NULL, 0),
(72, 'DEWAN KOINONIA - PEMASUKAN', 460350, 'Kebaktian Padang', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:29', NULL, 0),
(73, 'DEWAN KOINONIA - PEMASUKAN', 460360, 'Natal gabungan P. Sidi, Remaja, Naposobulung', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:30', NULL, 0),
(74, 'DEWAN KOINONIA - PEMASUKAN', 460370, 'Kunjungan Gerejani', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:32', NULL, 0),
(75, 'DEWAN KOINONIA - PEMASUKAN', 460380, 'Penerimaan Lain (bazaar, kebaktian, olahraga)', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:33', NULL, 0),
(76, 'DEWAN KOINONIA - PEMASUKAN', 460420, 'Ucapan Syukur Kategorial Ina', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:35', NULL, 0),
(77, 'DEWAN KOINONIA - PEMASUKAN', 460430, 'Parheheon Ina', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:36', NULL, 0),
(78, 'DEWAN KOINONIA - PEMASUKAN', 460440, 'Retreat / Wisata rohani punguan Ina', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:37', NULL, 0),
(79, 'DEWAN KOINONIA - PEMASUKAN', 460450, 'Partangiangan Bona Taon Punguan Ina', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:39', NULL, 0),
(80, 'DEWAN KOINONIA - PEMASUKAN', 460460, 'Kegiatan interaktif Punguan Ina Hanna', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:40', NULL, 0),
(81, 'DEWAN KOINONIA - PEMASUKAN', 460510, 'Punguan Koor Ama', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:41', NULL, 0),
(82, 'DEWAN KOINONIA - PEMASUKAN', 460520, 'Ucapan Syukur Kategorial Ama', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:43', NULL, 0),
(83, 'DEWAN KOINONIA - PEMASUKAN', 460530, 'Parheheon Ama', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:44', NULL, 0),
(84, 'DEWAN KOINONIA - PEMASUKAN', 460540, 'Kebaktian Bulanan Punguan Ama', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:46', NULL, 0),
(85, 'DEWAN KOINONIA - PEMASUKAN', 460550, 'Sermon Ama', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:48', NULL, 0),
(86, 'DEWAN KOINONIA - PEMASUKAN', 460610, 'Ucapan Syukur untuk Lansia', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:51', NULL, 0),
(87, 'DEWAN KOINONIA - PEMASUKAN', 460620, 'Penerimaan lain untuk Lansia', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:52', NULL, 0),
(88, 'DEWAN MARTURIA - PEMASUKAN', 470110, 'Ucapan Syukur utk pelayanan Ibadah', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:55', NULL, 0),
(89, 'DEWAN MARTURIA - PEMASUKAN', 470120, 'Penerimaan lain pelayanan Ibadah', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:57', NULL, 0),
(90, 'DEWAN MARTURIA - PEMASUKAN', 470210, 'Ucapan Syukur untuk Pekabaran Injil', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:52:58', NULL, 0),
(91, 'DEWAN MARTURIA - PEMASUKAN', 470220, 'Pelayanan Firman Tuhan kpd kaum Marjinal', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:00', NULL, 0),
(92, 'DEWAN MARTURIA - PEMASUKAN', 470230, 'Pertemuan/pelayanan Ibadah kel. Zending', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:01', NULL, 0),
(93, 'DEWAN MARTURIA - PEMASUKAN', 470240, 'Amplop untuk Renungan Harian', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:03', NULL, 0),
(94, 'DEWAN MARTURIA - PEMASUKAN', 470310, 'Ucapan Syukur untuk Musik dan Koor', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:05', NULL, 0),
(95, 'DEWAN MARTURIA - PEMASUKAN', 470320, 'Festival Koor', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:07', NULL, 0),
(96, 'DEWAN MARTURIA - PEMASUKAN', 470330, 'Malam Musik', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:09', NULL, 0),
(97, 'DEWAN DIAKONIA - PEMASUKAN', 480110, 'Ucapan Syukur untuk Diakoni Sosial', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:11', NULL, 0),
(98, 'DEWAN DIAKONIA - PEMASUKAN', 480120, 'Donatur Diakoni Sosial', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:13', NULL, 0),
(99, 'DEWAN DIAKONIA - PEMASUKAN', 480130, 'Sumbangan Ruas untuk Asuransi Kematian', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:14', NULL, 0),
(100, 'DEWAN DIAKONIA - PEMASUKAN', 480140, 'Kolekte ke depan', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:16', NULL, 0),
(101, 'DEWAN DIAKONIA - PEMASUKAN', 480150, 'Bulan Dana Sosial pada Jumat Agung', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:20', NULL, 0),
(102, 'DEWAN DIAKONIA - PEMASUKAN', 480160, 'Dana Awal Sosial Huria', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:22', NULL, 0),
(103, 'DEWAN DIAKONIA - PEMASUKAN', 480170, 'Penerimaan lain diakoni sosial', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:23', NULL, 0),
(104, 'DEWAN DIAKONIA - PEMASUKAN', 480210, 'Ucapan Syukur untuk seksi Pendidikan', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:25', NULL, 0),
(106, 'DEWAN DIAKONIA - PEMASUKAN', 480220, 'Swadaya pelatihan pengembangan Sintua', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:26', NULL, 0),
(107, 'DEWAN DIAKONIA - PEMASUKAN', 480230, 'Swadaya peserta seminar pendidikan Anak', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:28', NULL, 0),
(108, 'DEWAN DIAKONIA - PEMASUKAN', 480240, 'Penerimaan lain (ibadah pembekalan, dll)', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:30', NULL, 0),
(109, 'DEWAN DIAKONIA - PEMASUKAN', 480310, 'Ucapan Syukur untuk Dewan Kesehatan', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:32', NULL, 0),
(110, 'DEWAN DIAKONIA - PEMASUKAN', 480320, 'Penerimaan lain Seksi Kesehatan', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:34', NULL, 0),
(111, 'DEWAN DIAKONIA - PEMASUKAN', 480410, 'Ucapan Syukur untuk Seksi Kemasyarakatan', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:35', NULL, 0),
(112, 'DEWAN DIAKONIA - PEMASUKAN', 480430, 'Penerimaan lain Seksi Kemasyarakatan', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:53:37', NULL, 0),
(113, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490110, 'Penjualan buku, Alkitab, Buku Ende, dll', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:39:33', NULL, 0),
(114, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490120, 'Ucapan Syukur Martumpol/Pamasumasuon', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:39:48', NULL, 0),
(115, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490130, 'Buku Renungan', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:29:34', NULL, 0),
(116, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490210, 'Sumbangan Inventaris - Perabotan', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:40:26', NULL, 0),
(117, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490220, 'Sumbangan Inventaris - LCD (Infocus)', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:40:44', NULL, 0),
(118, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490230, 'Sumbangan Inventaris - Komputer', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:41:00', NULL, 0),
(119, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490240, 'Sumbangan lain', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:41:11', NULL, 0),
(120, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490310, 'Jasa Giro Bank', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:29:30', NULL, 0),
(121, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490320, 'Bunga Bank', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:41:44', NULL, 0),
(122, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490330, 'Penerimaan Lain -lain', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:42:03', NULL, 0),
(123, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490340, 'Pengembalian Pinjaman Panitia Lahan', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:42:31', NULL, 0),
(124, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490350, 'Pengembalian Pinjaman Pegawai', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:42:44', NULL, 0),
(125, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490410, 'Kegiatan interaktif (cerdas cermat, peragaan, dll )', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:29:40', NULL, 0),
(126, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490420, 'Retret Pelajar Sidi', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:29:42', NULL, 0),
(127, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490430, 'Ucapan Syukur untuk Huria', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:43:35', NULL, 0),
(128, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490510, 'Ucapan Syukur Kebersihan', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:29:44', NULL, 0),
(129, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490520, 'Ucapan Syukur untuk Keamanan', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:29:45', NULL, 0),
(130, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490530, 'Pemakaian Gedung SM + Fasilitas Gereja', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:29:47', NULL, 0),
(131, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490540, 'Pemakaian AC Gereja', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:29:50', NULL, 0),
(132, 'MAJELIS PERBENDAHARAAN & SEKRETARIAT', 490550, 'Sumbangan bantuan Gereja', 'Pemasukan', 'Tidak', NULL, '2023-06-15 07:45:24', NULL, 0),
(133, 'KANTOR PUSAT - PEMASUKAN', 510010, 'Pelean II', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:53:46', NULL, 0),
(134, 'KANTOR PUSAT - PEMASUKAN', 510020, 'Pelean Sekolah Minggu', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:53:49', NULL, 0),
(135, 'KANTOR PUSAT - PEMASUKAN', 510030, 'Namarboho - Dep. Sekolah Minggu', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:53:50', NULL, 0),
(136, 'KANTOR PUSAT - PEMASUKAN', 510040, 'Namarboho - Dep. NHKBP - PEMUDA', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:53:51', NULL, 0),
(137, 'KANTOR PUSAT - PEMASUKAN', 510050, 'Namarboho - Dep. Wanita', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:53:53', NULL, 0),
(138, 'KANTOR PUSAT - PEMASUKAN', 510060, 'Namarboho - Dep. AMA', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:53:55', NULL, 0),
(139, 'KANTOR PUSAT - PEMASUKAN', 510070, 'Namarboho - Dep. Pendidikan', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:53:56', NULL, 0),
(140, 'KANTOR PUSAT - PEMASUKAN', 510080, 'Namarboho - Dep. Kesehatan', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:53:57', NULL, 0),
(141, 'KANTOR PUSAT - PEMASUKAN', 510090, 'Namarboho - Dep. Diakoni Sosial', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:53:59', NULL, 0),
(142, 'KANTOR PUSAT - PEMASUKAN', 510100, 'Namarboho - Dep. Zending/P.I', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:00', NULL, 0),
(143, 'KANTOR PUSAT - PEMASUKAN', 510110, 'Namarboho - Dep. Musik', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:02', NULL, 0),
(144, 'KANTOR PUSAT - PEMASUKAN', 510120, 'Namarboho - Dep. PEGMAS', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:04', NULL, 0),
(145, 'KANTOR PUSAT - PEMASUKAN', 510130, 'Namarboho - Dep. DANA PENSIUN', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:06', NULL, 0),
(146, 'KANTOR PUSAT - PEMASUKAN', 510140, 'Namarboho - Radio Suara Bonapit HKBP', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:07', NULL, 0),
(147, 'KANTOR PUSAT - PEMASUKAN', 510150, 'Namarboho - Lembaga - lembaga', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:08', NULL, 0),
(148, 'KANTOR PUSAT - PEMASUKAN', 510160, 'Namarboho - STT HKBP/Sik. Pendeta', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:10', NULL, 0),
(149, 'KANTOR PUSAT - PEMASUKAN', 510170, 'Ulaon HATOPAN HKBP', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:13', NULL, 0),
(150, 'KANTOR PUSAT - PEMASUKAN', 510180, 'Ucapan Syukur untuk ELIM', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:54:14', NULL, 0),
(151, 'KANTOR PUSAT - PEMASUKAN', 510190, 'Ucapan Syukur untuk HEPATA', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:54:15', NULL, 0),
(152, 'KANTOR PUSAT - PEMASUKAN', 510200, 'Dana Abadi HKBP', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:17', NULL, 0),
(153, 'DISTRIK - PEMASUKAN', 520100, 'Persembahan untuk Distrik', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:54:30', NULL, 0),
(154, 'DISTRIK - PEMASUKAN', 520200, 'Rapat Distrik/Program Distrik', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:54:32', NULL, 0),
(155, 'DISTRIK - PEMASUKAN', 520300, 'Pertukaran Mimbar Distrik', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:54:34', NULL, 0),
(156, 'DISTRIK - PEMASUKAN', 520400, 'Persembahan untuk PGI', 'Pemasukan', 'Ya', NULL, '2023-06-19 21:54:35', NULL, 0),
(157, 'DISTRIK - PEMASUKAN', 520500, 'Sumbangan Sosial melalui Distrik', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:54:38', NULL, 0),
(158, 'RESSORT - PEMASUKAN', 530300, 'Sumbangan Mendukung Program Ressort', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:54:40', NULL, 0),
(159, 'RESSORT - PEMASUKAN', 530400, 'Sumbangan untuk Huria Pagaran', 'Pemasukan', 'Tidak', NULL, '2023-06-19 21:54:42', NULL, 0),
(174, 'PROGRAM DANA BEASISWA', 540100, 'Pelean Khusus Dana Beasiswa', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:07:51', NULL, 0),
(175, 'PROGRAM DANA BEASISWA', 540200, 'Sumbangan Donatur untuk Beasiswa', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:08:03', NULL, 0),
(176, 'PROGRAM DANA BEASISWA', 540300, 'Ucapan Syukur untuk Dana Beasiswa', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:02', NULL, 0),
(177, 'DANA SOSIAL BANTUAN GEREJA', 550100, 'Sumbangan untuk Korban Bencana Alam', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:08:26', NULL, 0),
(178, 'DANA SOSIAL BANTUAN GEREJA', 550200, 'Sumbangan untuk Korban bencana Lainnya', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:08:38', NULL, 0),
(179, 'DANA SOSIAL BANTUAN GEREJA', 550300, 'Sumbangan untuk Bantuan Gereja Lain', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:08:50', NULL, 0),
(180, 'UCAPAN SYUKUR', 560100, 'Ucapan Syukur untuk Sintua Wijk', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:05', NULL, 0),
(181, 'UCAPAN SYUKUR', 560200, 'Ucapan Syukur untuk Pendeta', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:07', NULL, 0),
(182, 'UCAPAN SYUKUR', 560300, 'Ucapan Syukur utk Sekretariat/TU/ADM', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:09', NULL, 0),
(183, 'UCAPAN SYUKUR', 560400, 'Ucapan Syukur untuk Parhalado', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:11', NULL, 0),
(184, 'UCAPAN SYUKUR', 560500, 'Ucapan Syukur untuk Pelayan Pensiun', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:14', NULL, 0),
(185, 'UCAPAN SYUKUR', 560600, 'Ucapan Syukur untuk Guru Sekolah Minggu', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:16', NULL, 0),
(186, 'UCAPAN SYUKUR', 560700, 'Ucapan Syukur untuk Pelajar Sidi', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:18', NULL, 0),
(187, 'UCAPAN SYUKUR', 560800, 'Ucapan Syukur untuk lain -lain', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:19', NULL, 0),
(188, 'UCAPAN SYUKUR', 560850, 'Panitia Tahun Anak', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:22', NULL, 0),
(189, 'PEMBANGUNAN', 570100, 'Ucapan Syukur untuk Pembangunan', 'Pemasukan', 'Tidak', NULL, '2023-06-18 19:22:40', NULL, 0),
(190, 'PEMBANGUNAN', 570200, 'Persembahan / Aek satetek', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:15:32', NULL, 0),
(191, 'PEMBANGUNAN', 570300, 'Malam Dana', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:15:36', NULL, 0),
(192, 'PEMBANGUNAN', 570400, 'Eksternal & Tournament Golf', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:30:24', NULL, 0),
(193, 'KPJEL', 580100, 'Dana Awal KPJEL', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:15:44', NULL, 0),
(194, 'KPJEL', 580200, 'Pelean Khusus Dana KPJEL', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:15:47', NULL, 0),
(195, 'KPJEL', 580300, 'Ucapan Syukur untuk Komisi KPJEL', 'Pemasukan', 'Tidak', NULL, '2023-06-19 01:23:44', NULL, 0),
(196, 'PENGADAAN LAHAN PARKIR', 590100, 'Pelean Khusus Pengadaan Lahan Parkir', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:15:56', NULL, 0),
(197, 'PENGADAAN LAHAN PARKIR', 590200, 'Ucapan Syukur utk Pengadaan Lahan Parkir', 'Pemasukan', 'Tidak', NULL, '2023-06-16 03:15:59', NULL, 0),
(214, 'KANTOR PUSAT - PENGELUARAN', 610010, 'Pelean II', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:42:31', NULL, 0),
(215, 'KANTOR PUSAT - PENGELUARAN', 610020, 'Pelean Sekolah Minggu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:42:49', NULL, 0),
(216, 'KANTOR PUSAT - PENGELUARAN', 610030, 'Namarboho - Dep. Sekolah Minggu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:43:05', NULL, 0),
(217, 'KANTOR PUSAT - PENGELUARAN', 610040, 'Namarboho - Dep. NHKBP - PEMUDA', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:43:16', NULL, 0),
(218, 'KANTOR PUSAT - PENGELUARAN', 610050, 'Namarboho - Dep. Wanita', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:43:26', NULL, 0),
(219, 'KANTOR PUSAT - PENGELUARAN', 610060, 'Namarboho - Dep. AMA', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:43:36', NULL, 0),
(220, 'KANTOR PUSAT - PENGELUARAN', 610070, 'Namarboho - Dep. Pendidikan', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:43:47', NULL, 0),
(221, 'KANTOR PUSAT - PENGELUARAN', 610080, 'Namarboho - Dep. Kesehatan', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:43:56', NULL, 0),
(222, 'KANTOR PUSAT - PENGELUARAN', 610090, 'Namarboho - Dep. Diakoni Sosial', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:44:07', NULL, 0),
(223, 'KANTOR PUSAT - PENGELUARAN', 610100, 'Namarboho - Dep. Zending/P.I', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:44:15', NULL, 0),
(224, 'KANTOR PUSAT - PENGELUARAN', 610110, 'Namarboho - Dep. Musik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:44:23', NULL, 0),
(225, 'KANTOR PUSAT - PENGELUARAN', 610120, 'Namarboho - Dep. PENGMAS', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:44:32', NULL, 0),
(226, 'KANTOR PUSAT - PENGELUARAN', 610130, 'Namarboho - Dep. DANA PENSIUN', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:44:43', NULL, 0),
(227, 'KANTOR PUSAT - PENGELUARAN', 610140, 'Namarboho - Radio Suara Bonapit HKBP', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:44:53', NULL, 0),
(228, 'KANTOR PUSAT - PENGELUARAN', 610150, 'Namarboho - Lembaga-lembaga', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:45:04', NULL, 0),
(229, 'KANTOR PUSAT - PENGELUARAN', 610160, 'Namarboho-STT HKBP/S. PENDETA', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:45:16', NULL, 0),
(230, 'KANTOR PUSAT - PENGELUARAN', 610170, 'Ulaon Hatopan HKBP', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:46:20', NULL, 0),
(231, 'KANTOR PUSAT - PENGELUARAN', 610180, 'Ucapan Syukur untuk ELIM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:47:23', NULL, 0),
(232, 'KANTOR PUSAT - PENGELUARAN', 610190, 'Ucapan Syukur untuk HEPATA', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:47:32', NULL, 0),
(233, 'DISTRIK - PENGELUARAN', 620100, 'Persembahan untuk Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:47:45', NULL, 0),
(234, 'DISTRIK - PENGELUARAN', 620200, 'Persembahan untuk PGI', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:47:59', NULL, 0),
(235, 'DISTRIK - PENGELUARAN', 620300, 'Penyaluran Sumb. Sosial Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:48:10', NULL, 0),
(236, 'RESSORT - PENGELUARAN', 630100, 'Sumb. Mendukung Program Ressort', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:49:31', NULL, 0),
(237, 'RESSORT - PENGELUARAN', 630200, 'Sumbangan untuk Huria Pagaran', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:50:28', NULL, 0),
(238, 'RESSORT - PENGELUARAN', 640100, 'Beasiswa utk. Kel. Kurang Mampu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:50:45', NULL, 0),
(239, 'RESSORT - PENGELUARAN', 640200, 'Beasiswa Mampu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:51:42', NULL, 0),
(240, 'RESSORT - PENGELUARAN', 640300, 'Beasiswa utk Anak Berpretasi', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:52:32', NULL, 0),
(241, 'DANA SOSIAL BANTUAN GEREJA', 650100, 'Sumbangan Korban Bencana Alam', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:52:47', NULL, 0),
(242, 'DANA SOSIAL BANTUAN GEREJA', 650200, 'Sumbangan utk Korban bencana Lainnya', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:52:59', NULL, 0),
(243, 'DANA SOSIAL BANTUAN GEREJA', 650300, 'Sumbangan utk Gereja lain,dll', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:53:12', NULL, 0),
(244, 'REALISASI UCAPAN SYUKUR', 660100, 'Ucapan Syukur utk Sintua Wijk', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:53:32', NULL, 0),
(245, 'RESSORT - PENGELUARAN', 660200, 'Ucapan Syukur untuk Pendeta', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:53:43', NULL, 0),
(246, 'REALISASI UCAPAN SYUKUR', 660300, 'Ucapan Syukur utk Sekretariat/TU/ADM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:54:00', NULL, 0),
(247, 'REALISASI UCAPAN SYUKUR', 660400, 'Ucapan Syukur utk Parhalado', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:54:27', NULL, 0),
(248, 'REALISASI UCAPAN SYUKUR', 660500, 'Ucapan Syukur utk Pelayan Pensiun', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:54:38', NULL, 0),
(249, 'REALISASI UCAPAN SYUKUR', 660600, 'Ucapan Syukur utk Sekolah Minggu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:54:50', NULL, 0),
(250, 'REALISASI UCAPAN SYUKUR', 660700, 'Ucapan Syukur utk Pengajar Sidi', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:55:04', NULL, 0),
(251, 'REALISASI UCAPAN SYUKUR', 660800, 'Ucapan Syukur utk lain - lain', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:55:25', NULL, 0),
(252, 'REALISASI UCAPAN SYUKUR', 660850, 'Panitia Tahun Anak 2013', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:55:38', NULL, 0),
(253, 'PEMBANGUNAN /PENGEM. SARANA', 670100, 'Ucapan Syukur utk Pembangunan', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:55:50', NULL, 0),
(254, 'PEMBANGUNAN /PENGEM. SARANA', 670200, 'Persembahan / Aek Satetek/Uc. Syukur', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:56:02', NULL, 0),
(255, 'PEMBANGUNAN /PENGEM. SARANA', 680100, 'Dana Awal KPJEL', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:56:14', NULL, 0),
(256, 'KOMISI KPJEL', 680200, 'Pelean Khusus KPJEL', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:56:34', NULL, 0),
(257, 'KOMISI KPJEL', 680300, 'Ucapan Syukur ke Komisi KPJEL', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:56:58', NULL, 0),
(258, 'PANITIA PENGADAAN LAHAN SERBAGUNA', 690100, 'Pelean Khusus Lahan Serbaguna', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:57:15', NULL, 0),
(259, 'PANITIA PENGADAAN LAHAN SERBAGUNA', 690200, 'Ucapan Syukur utk Lahan Serbaguna', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 01:57:31', NULL, 0),
(260, 'DEWAN KOINONIA - PENGELUARAN', 711010, 'Pesta Parheheon Sekolah Minggu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 09:59:28', NULL, 0),
(261, 'DEWAN KOINONIA - PENGELUARAN', 711020, 'Paskah Sekolah Minggu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 09:59:48', NULL, 0),
(262, 'DEWAN KOINONIA - PENGELUARAN', 711030, 'Kegiatan SM Tingkat Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:00:07', NULL, 0),
(263, 'DEWAN KOINONIA - PENGELUARAN', 711040, 'Retreat Sekolah Minggu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:00:17', NULL, 0),
(264, 'DEWAN KOINONIA - PENGELUARAN', 711050, 'Kebaktian Padang', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:00:31', NULL, 0),
(265, 'DEWAN KOINONIA - PENGELUARAN', 711060, 'Kunjungan Panti Asuhan', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:01:19', NULL, 0),
(266, 'DEWAN KOINONIA - PENGELUARAN', 711070, 'Natal Sekolah Minggu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:01:33', NULL, 0),
(267, 'DEWAN KOINONIA - PENGELUARAN', 711080, 'Transport Guru Sek. Minggu', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:01:48', NULL, 0),
(268, 'DEWAN KOINONIA - PENGELUARAN', 711090, 'Studi Banding ke Gereja lain', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:02:06', NULL, 0),
(269, 'DEWAN KOINONIA - PENGELUARAN', 711100, 'Snack Mingguan SM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:02:18', NULL, 0),
(270, 'DEWAN KOINONIA - PENGELUARAN', 711110, 'Ibadah khusus Ibadah ASM kelas jauh', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:02:31', NULL, 0),
(271, 'DEWAN KOINONIA - PENGELUARAN', 711130, 'Pengadaan Buku Pedoman Guru SM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:02:51', NULL, 0),
(272, 'DEWAN KOINONIA - PENGELUARAN', 711140, 'Alat Peraga SM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:03:06', NULL, 0),
(273, 'DEWAN KOINONIA - PENGELUARAN', 711150, 'Ucapan Syukur kenaikan kelas ASM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:03:24', NULL, 0),
(274, 'DEWAN KOINONIA - PENGELUARAN', 711160, 'Bengkel Aktivitas (seni: musik, tari, peran)', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:03:53', NULL, 0),
(275, 'DEWAN KOINONIA - PENGELUARAN', 711170, 'Konsumsi Minggu Guru SM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:04:04', NULL, 0),
(276, 'DEWAN KOINONIA - PENGELUARAN', 711180, 'Hari Anak Nasional-kunjugi Panti Asuhan', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:04:16', NULL, 0),
(277, 'DEWAN KOINONIA - PENGELUARAN', 711190, 'Perayaan HUT RI (pertandingan)', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:04:28', NULL, 0),
(278, 'DEWAN KOINONIA - PENGELUARAN', 711200, 'Bantuan Transport Pelatih Koor SM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:04:39', NULL, 0),
(279, 'DEWAN KOINONIA - PENGELUARAN', 711210, 'Penyusunan buku,petunjuk Pengelolaan SM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:04:55', NULL, 0),
(280, 'DEWAN KOINONIA - PENGELUARAN', 711220, 'Karakter building ASM', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:05:09', NULL, 0),
(281, 'DEWAN KOINONIA - PENGELUARAN', 713200, 'Kompetisi / turnamen Futsal Basket', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:15:27', NULL, 0),
(282, 'DEWAN KOINONIA - PENGELUARAN', 712010, 'Pesta Parheheon', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:07:34', NULL, 0),
(283, 'DEWAN KOINONIA - PENGELUARAN', 712020, 'Bakti Sosial', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:07:55', NULL, 0),
(284, 'DEWAN KOINONIA - PENGELUARAN', 712030, 'Natal Remaja', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:08:11', NULL, 0),
(285, 'DEWAN KOINONIA - PENGELUARAN', 712040, 'Pendalaman Alkitab', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:08:24', NULL, 0),
(286, 'DEWAN KOINONIA - PENGELUARAN', 712050, 'Fasilitas latihan vokal group, koor n Band', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:08:40', NULL, 0),
(287, 'DEWAN KOINONIA - PENGELUARAN', 712060, 'Kunjungan/hadiri Undangan dr Gereja lain dan ikut kompetisi', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:08:56', NULL, 0),
(288, 'DEWAN KOINONIA - PENGELUARAN', 712070, 'Kebaktian Padang', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:09:11', NULL, 0),
(289, 'DEWAN KOINONIA - PENGELUARAN', 712100, 'Kebaktian Bulanan', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:09:31', NULL, 0),
(290, 'DEWAN KOINONIA - PENGELUARAN', 712105, 'Pembangunan Karakter & Jati Diri', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:09:43', NULL, 0),
(291, 'DEWAN KOINONIA - PENGELUARAN', 713010, 'Pesta Parheheon Naposo', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:09:56', NULL, 0),
(292, 'DEWAN KOINONIA - PENGELUARAN', 713020, 'Pesta Natal ( Naposo dan Remaja )', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:10:17', NULL, 0),
(293, 'DEWAN KOINONIA - PENGELUARAN', 713030, 'Kebaktian Padang', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:10:29', NULL, 0),
(294, 'DEWAN KOINONIA - PENGELUARAN', 713040, 'Kebaktian bulanan Naposo', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:10:47', NULL, 0),
(295, 'DEWAN KOINONIA - PENGELUARAN', 713050, 'Mading dan Website naposo', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:11:02', NULL, 0),
(296, 'DEWAN KOINONIA - PENGELUARAN', 713060, 'Menerima kunjungan koor Gereja', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:11:18', NULL, 0),
(297, 'DEWAN KOINONIA - PENGELUARAN', 713070, 'Bakti Sosial', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:11:30', NULL, 0),
(298, 'DEWAN KOINONIA - PENGELUARAN', 713080, 'Festival Koor naposo antar Gereja', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:11:42', NULL, 0),
(299, 'DEWAN KOINONIA - PENGELUARAN', 713090, 'Bantuan Transport Pelatih Koor NHKBP', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:11:55', NULL, 0),
(300, 'DEWAN KOINONIA - PENGELUARAN', 713100, 'Festival Koor', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:12:14', NULL, 0),
(301, 'DEWAN KOINONIA - PENGELUARAN', 713110, 'Festival Vocal Group', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:12:32', NULL, 0),
(302, 'DEWAN KOINONIA - PENGELUARAN', 713120, 'Festival Band', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:12:46', NULL, 0),
(303, 'DEWAN KOINONIA - PENGELUARAN', 713130, 'Fasilitas Latihan Futsal', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:13:07', NULL, 0),
(304, 'DEWAN KOINONIA - PENGELUARAN', 713140, 'Fasilitas Basket', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:13:20', NULL, 0),
(305, 'DEWAN KOINONIA - PENGELUARAN', 713150, 'Mengikuti kegiatan tingkat Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:13:33', NULL, 0),
(306, 'DEWAN KOINONIA - PENGELUARAN', 713160, 'Pelatih Koor/ Vokal Group Naposo', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:13:46', NULL, 0),
(307, 'DEWAN KOINONIA - PENGELUARAN', 713170, 'Latihan Band Naposo', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:14:00', NULL, 0),
(308, 'DEWAN KOINONIA - PENGELUARAN', 713180, 'Festival Naposo Antar Gereja', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:14:17', NULL, 0),
(309, 'DEWAN KOINONIA - PENGELUARAN', 713190, 'Pembekalan / Periodesasi Pengurus/Pelatihan Naposo', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:14:49', NULL, 0),
(310, 'DEWAN KOINONIA - PENGELUARAN', 713210, 'Mengadakan Pekan Olah Raga & Seni', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:15:40', NULL, 0),
(311, 'DEWAN KOINONIA - PENGELUARAN', 713220, 'Mengadakan Seminar - seminar', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:15:50', NULL, 0),
(312, 'DEWAN KOINONIA - PENGELUARAN', 713230, 'Mengadakan Pelatihan Klinik Musik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:16:00', NULL, 0),
(313, 'DEWAN KOINONIA - PENGELUARAN', 713240, 'Tahun Pemuda Kegiatan Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:16:12', NULL, 0),
(314, 'DEWAN KOINONIA - PENGELUARAN', 714010, 'Pesta Parheheon Ina', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:16:24', NULL, 0),
(315, 'DEWAN KOINONIA - PENGELUARAN', 714020, 'Perayaan Paskah PPD Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:16:34', NULL, 0),
(316, 'DEWAN KOINONIA - PENGELUARAN', 714030, 'Perayaan Natal SPH se-Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:16:43', NULL, 0),
(317, 'DEWAN KOINONIA - PENGELUARAN', 714040, 'Iuran Tahunan SPH utk PPD Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:16:57', NULL, 0),
(318, 'DEWAN KOINONIA - PENGELUARAN', 714050, 'Sermon Ina Se- Ressort', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:17:13', NULL, 0),
(319, 'DEWAN KOINONIA - PENGELUARAN', 714060, 'Sermon Ina Hanna se Ressort + Ceramah', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:17:25', NULL, 0),
(320, 'DEWAN KOINONIA - PENGELUARAN', 714070, 'Festival Koor Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:17:34', NULL, 0),
(321, 'DEWAN KOINONIA - PENGELUARAN', 714080, 'Retreat Punguan Ina', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:17:48', NULL, 0),
(322, 'DEWAN KOINONIA - PENGELUARAN', 714090, 'Kebaktian Padang', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:18:02', NULL, 0),
(323, 'DEWAN KOINONIA - PENGELUARAN', 714100, 'Kunjungan Gerejani', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:18:13', NULL, 0),
(324, 'DEWAN KOINONIA - PENGELUARAN', 714110, 'Bona Taon Ina Se-Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:18:32', NULL, 0),
(325, 'DEWAN KOINONIA - PENGELUARAN', 714120, 'Bantuan transport pelatih koor Ina', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:18:42', NULL, 0),
(326, 'DEWAN KOINONIA - PENGELUARAN', 714125, 'Seminar Ina Selasa', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:18:59', NULL, 0),
(327, 'DEWAN KOINONIA - PENGELUARAN', 714130, 'Pertemuan PPD Bulanan Wilayah 2 Distrik', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:19:12', NULL, 0),
(328, 'DEWAN KOINONIA - PENGELUARAN', 715010, 'Parheheon Ama', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:19:22', NULL, 0),
(329, 'DEWAN KOINONIA - PENGELUARAN', 715020, 'Kebaktian Bulanan', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:19:33', NULL, 0),
(330, 'DEWAN KOINONIA - PENGELUARAN', 715030, 'Quiz Alkitab', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:19:47', NULL, 0),
(331, 'DEWAN KOINONIA - PENGELUARAN', 715040, 'Membangun kes. Jasmani (Senam)', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:20:07', NULL, 0),
(332, 'DEWAN KOINONIA - PENGELUARAN', 715050, 'Bona Taon Ama', 'Pengeluaran', 'Tidak', NULL, '2023-06-19 10:20:17', NULL, 0),
(333, 'PERSEMBAHAN BULANAN, PERPULUHAN, UCAPAN SYUKUR', 440500, 'test 1', 'Pemasukan', 'Ya', NULL, '2023-06-20 09:36:42', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mejelis_lingkungan`
--

CREATE TABLE `mejelis_lingkungan` (
  `id_majelis` int(11) NOT NULL,
  `id_wijk` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `meninggal`
--

CREATE TABLE `meninggal` (
  `id_meninggal` int(11) NOT NULL,
  `id_gereja` int(11) NOT NULL,
  `id_jemaat` int(11) NOT NULL,
  `tgl_meninggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tempat_pemakaman` varchar(150) NOT NULL,
  `nama_pendeta_melayani` varchar(100) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_05_10_022218_add_role_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL,
  `pekerjaan` varchar(10) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pekerjaan`
--

INSERT INTO `pekerjaan` (`id_pekerjaan`, `pekerjaan`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'Pegawai Ne', NULL, '2023-05-10 10:43:29', NULL, 0),
(2, 'Wiraswasta', NULL, '2023-05-10 10:43:51', NULL, 0),
(3, 'Dokter', NULL, '2023-06-05 16:11:48', NULL, 0),
(4, 'Polisi', NULL, '2023-06-05 16:12:08', NULL, 0),
(5, 'Tentara', NULL, '2023-06-05 16:12:20', NULL, 0),
(6, 'Perawat', NULL, '2023-06-05 16:12:27', NULL, 0),
(7, 'Bidan', NULL, '2023-06-05 16:12:48', NULL, 0),
(8, 'Programmer', NULL, '2023-06-05 16:13:04', NULL, 0),
(9, 'Ahli Hukum', NULL, '2023-06-05 16:13:20', NULL, 0),
(10, 'Petani', NULL, '2023-06-05 16:13:28', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pelayanan_ibadah`
--

CREATE TABLE `pelayanan_ibadah` (
  `id_pelayanan_ibadah` int(11) NOT NULL,
  `nama_pelayanan_ibadah` varchar(100) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pelayan_gereja`
--

CREATE TABLE `pelayan_gereja` (
  `id_pelayan` int(11) NOT NULL,
  `id_jemaat` int(11) NOT NULL,
  `tanggal_tahbisan` date NOT NULL,
  `tanggal_akhir_jawatan` date NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `id_status_pelayanan` int(11) NOT NULL DEFAULT 11,
  `keterangan` varchar(255) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pelayan_gereja`
--

INSERT INTO `pelayan_gereja` (`id_pelayan`, `id_jemaat`, `tanggal_tahbisan`, `tanggal_akhir_jawatan`, `jabatan`, `id_status_pelayanan`, `keterangan`, `create_at`, `update_at`, `is_deleted`, `photo`) VALUES
(4, 12, '1990-06-11', '0000-00-00', 'Pendeta', 11, 'Pendeta Gereja HKBP Palmarum Tarutung', '2023-06-08 02:42:36', NULL, 0, 'sintua.jpeg'),
(5, 1, '1994-01-19', '0000-00-00', 'Sintua', 11, 'Sintua Gereja HKBP Palmarum', '2023-06-08 03:13:36', NULL, 0, 'sintua.jpg'),
(6, 3, '2009-11-11', '0000-00-00', 'Guru Huria', 11, 'Guru Huria Gereja HKBP Palmarum Tarutung', '2023-06-08 03:32:21', NULL, 0, 'sintua.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pelayan_ibadah`
--

CREATE TABLE `pelayan_ibadah` (
  `id_jadwal_ibadah` int(11) NOT NULL,
  `id_pelayanan_ibadah` int(11) NOT NULL,
  `id_det_jam_kegiatan` int(11) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id_pemasukan` int(11) NOT NULL,
  `nama_kategori_pemasukan` varchar(100) NOT NULL,
  `tanggal_pemasukan` date NOT NULL,
  `total_pemasukan` int(11) NOT NULL,
  `lingkungan` varchar(100) NOT NULL,
  `bentuk_pemasukan` varchar(100) NOT NULL,
  `id_kategori_pemasukan` int(11) DEFAULT NULL,
  `bukti_pemasukan` varchar(100) DEFAULT NULL,
  `id_jemaat` int(11) DEFAULT NULL,
  `id_bank` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pemasukan`
--

INSERT INTO `pemasukan` (`id_pemasukan`, `nama_kategori_pemasukan`, `tanggal_pemasukan`, `total_pemasukan`, `lingkungan`, `bentuk_pemasukan`, `id_kategori_pemasukan`, `bukti_pemasukan`, `id_jemaat`, `id_bank`, `create_at`, `update_at`, `is_deleted`) VALUES
(2, 'Persembahan Minggu', '2023-05-28', 550000, 'Tarutung', 'Uang', NULL, NULL, NULL, NULL, '2023-06-07 14:39:50', NULL, 0),
(3, 'persembahan_ibadah_lingkungan', '0000-00-00', 300000, 'Tarutung', 'Uang', NULL, NULL, NULL, NULL, '2023-06-07 14:40:57', NULL, 0),
(4, 'Pembangunan', '0000-00-00', 100, 'Tarutung', 'Semen', NULL, NULL, NULL, NULL, '2023-06-07 14:47:48', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `id_pendidikan` int(11) NOT NULL,
  `pendidikan` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) UNSIGNED ZEROFILL NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pendidikan`
--

INSERT INTO `pendidikan` (`id_pendidikan`, `pendidikan`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'TK', '', '2023-05-10 08:46:37', NULL, 0),
(2, 'SD', '', '2023-05-10 08:46:41', NULL, 0),
(3, 'SMP', '', '2023-05-10 08:46:46', NULL, 0),
(4, 'SMA', '', '2023-05-10 08:46:51', NULL, 0),
(5, 'Perguruan Tinggi', '', '2023-05-10 08:47:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `nama_kategori_pengelaran` varchar(100) NOT NULL,
  `jumlah_pengeluaran` int(11) NOT NULL,
  `tanggal_pengeluaran` date NOT NULL,
  `keterangan_pengeluaran` varchar(100) NOT NULL,
  `id_kategori_pengeluaran` int(11) DEFAULT NULL,
  `id_bank` int(11) DEFAULT NULL,
  `bukti_pengeluaran` varchar(100) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_pengeluaran`, `nama_kategori_pengelaran`, `jumlah_pengeluaran`, `tanggal_pengeluaran`, `keterangan_pengeluaran`, `id_kategori_pengeluaran`, `id_bank`, `bukti_pengeluaran`, `create_at`, `update_at`, `is_deleted`) VALUES
(3, 'Pembangunan', 1000000, '0000-00-00', 'beli bakso', NULL, NULL, '', '2023-06-07 16:29:57', NULL, 0),
(4, 'Acara Pesta Haheheon Ama', 500000, '0000-00-00', 'Acara', NULL, NULL, '', '2023-06-07 16:30:33', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pernikahan`
--

CREATE TABLE `pernikahan` (
  `id_pernikahan` int(11) NOT NULL,
  `id_registrasi_pernikahan` int(11) NOT NULL,
  `id_gereja` int(11) NOT NULL,
  `tgl_pernikahan` date NOT NULL,
  `nats_pernikahan` varchar(250) NOT NULL,
  `isHKBP` int(11) NOT NULL DEFAULT 0,
  `id_gereja_nikah` int(11) DEFAULT NULL,
  `nama_gereja_non_HKBP` varchar(100) DEFAULT NULL,
  `nama_pendeta` varchar(100) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `pernikahan_jemaat`
--

CREATE TABLE `pernikahan_jemaat` (
  `id_pernikahan_jemaat` int(11) NOT NULL,
  `id_pernikahan` int(11) NOT NULL,
  `id_jemaat_laki` int(11) NOT NULL,
  `id_jemaat_perempuan` int(11) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `province_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 103,
  `province_name` varchar(75) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`province_id`, `country_id`, `province_name`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 103, 'Bali', NULL, NULL, 0),
(2, 103, 'Bangka Belitung', NULL, NULL, 0),
(3, 103, 'Banten', NULL, NULL, 0),
(4, 103, 'Bengkulu', NULL, NULL, 0),
(5, 103, 'DI Yogyakarta', NULL, NULL, 0),
(6, 103, 'DKI Jakarta', NULL, NULL, 0),
(7, 103, 'Gorontalo', NULL, NULL, 0),
(8, 103, 'Jambi', NULL, NULL, 0),
(9, 103, 'Jawa Barat', NULL, NULL, 0),
(10, 103, 'Jawa Tengah', NULL, NULL, 0),
(11, 103, 'Jawa Timur', NULL, NULL, 0),
(12, 103, 'Kalimantan Barat', NULL, NULL, 0),
(13, 103, 'Kalimantan Selatan', NULL, NULL, 0),
(14, 103, 'Kalimantan Tengah', NULL, NULL, 0),
(15, 103, 'Kalimantan Timur', NULL, NULL, 0),
(16, 103, 'Kalimantan Utara', NULL, NULL, 0),
(17, 103, 'Kepulauan Riau', NULL, NULL, 0),
(18, 103, 'Lampung', NULL, NULL, 0),
(19, 103, 'Maluku', NULL, NULL, 0),
(20, 103, 'Maluku Utara', NULL, NULL, 0),
(21, 103, 'Nanggroe Aceh Darussalam (NAD)', NULL, NULL, 0),
(22, 103, 'Nusa Tenggara Barat (NTB)', NULL, NULL, 0),
(23, 103, 'Nusa Tenggara Timur (NTT)', NULL, NULL, 0),
(24, 103, 'Papua', NULL, NULL, 0),
(25, 103, 'Papua Barat', NULL, NULL, 0),
(26, 103, 'Riau', NULL, NULL, 0),
(27, 103, 'Sulawesi Barat', NULL, NULL, 0),
(28, 103, 'Sulawesi Selatan', NULL, NULL, 0),
(29, 103, 'Sulawesi Tengah', NULL, NULL, 0),
(30, 103, 'Sulawesi Tenggara', NULL, NULL, 0),
(31, 103, 'Sulawesi Utara', NULL, NULL, 0),
(32, 103, 'Sumatera Barat', NULL, NULL, 0),
(33, 103, 'Sumatera Selatan', NULL, NULL, 0),
(34, 103, 'Sumatera Utara', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_baptis`
--

CREATE TABLE `registrasi_baptis` (
  `id_registrasi_baptis` int(11) NOT NULL,
  `is_jemaat` tinyint(1) DEFAULT 1,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `tanggal_baptis` date DEFAULT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `id_pendeta` int(11) DEFAULT NULL,
  `id_hub_keluarga` int(11) DEFAULT 3,
  `is_HKBP` tinyint(1) DEFAULT 1,
  `id_gereja_baptis` int(11) DEFAULT 1,
  `keterangan` varchar(250) DEFAULT NULL,
  `id_status` int(11) DEFAULT 1,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `registrasi_baptis`
--

INSERT INTO `registrasi_baptis` (`id_registrasi_baptis`, `is_jemaat`, `nama_ayah`, `nama_ibu`, `nama_lengkap`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `tanggal_baptis`, `jenis_kelamin`, `id_pendeta`, `id_hub_keluarga`, `is_HKBP`, `id_gereja_baptis`, `keterangan`, `id_status`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 1, 'kld', 'dsa', 'sahat', 'dsad', '2022-09-03', 'sdad', NULL, 'laki-laki', NULL, 3, 1, 1, 'sdadada', 1, '2023-06-05 17:45:56', NULL, 0),
(2, 1, 'kld', 'dsa', 'sahat', 'dsad', '2022-09-03', 'sdad', NULL, 'laki-laki', NULL, 3, 1, 1, 'sdada', 1, '2023-06-05 17:47:08', NULL, 0),
(3, 1, 'sas', 'sddsd', 'mahal', 'Laguboti', '2023-06-04', 'sdsdsdf', NULL, 'Laki-laki', NULL, 3, 1, 1, 'mwehehehe', 1, '2023-06-05 17:49:39', NULL, 0),
(4, 1, 'Bakso', 'sddsd', 'Josep', 'Laguboti', '2023-05-28', 'Laguboti', NULL, 'Laki-laki', NULL, 3, 1, 1, 'asdfghj', 1, '2023-06-05 17:50:17', NULL, 0),
(5, 1, 'Bakso', 'sddsd', 'Josep', 'dsds', '2023-05-28', 'Laguboti', NULL, 'Laki-laki', NULL, 3, 1, 1, 'wwewe', 1, '2023-06-06 17:08:49', NULL, 0),
(6, 1, 'sas', 'sddsd', 'Mhara', 'Parsoburan', '2023-06-20', 'medan', NULL, 'Laki-laki', NULL, 3, 1, 1, 'asdfg', 1, '2023-06-06 17:17:21', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_calon_mempelai`
--

CREATE TABLE `registrasi_calon_mempelai` (
  `id_registrasi_calon` int(11) NOT NULL,
  `id_registrasi_nikah` int(11) DEFAULT NULL,
  `isHKBP_laki` tinyint(1) NOT NULL DEFAULT 0,
  `id_gereja_laki` int(11) DEFAULT NULL,
  `nama_gereja_laki` varchar(255) NOT NULL,
  `isJemaat_laki` tinyint(1) NOT NULL DEFAULT 0,
  `id_jemaat_laki` int(11) NOT NULL,
  `nama_ayah_laki` varchar(100) NOT NULL,
  `nama_ibu_laki` varchar(100) NOT NULL DEFAULT '',
  `isHKBP_perempuan` tinyint(1) NOT NULL DEFAULT 0,
  `id_gereja_perempuan` int(11) DEFAULT NULL,
  `nama_gereja_perempuan` varchar(100) NOT NULL,
  `isJemaat_perempuan` tinyint(1) NOT NULL DEFAULT 0,
  `id_jemaat_perempuan` int(11) NOT NULL,
  `nama_ayah_perempuan` varchar(100) NOT NULL,
  `nama_ibu_perempuan` varchar(100) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `registrasi_calon_mempelai`
--

INSERT INTO `registrasi_calon_mempelai` (`id_registrasi_calon`, `id_registrasi_nikah`, `isHKBP_laki`, `id_gereja_laki`, `nama_gereja_laki`, `isJemaat_laki`, `id_jemaat_laki`, `nama_ayah_laki`, `nama_ibu_laki`, `isHKBP_perempuan`, `id_gereja_perempuan`, `nama_gereja_perempuan`, `isJemaat_perempuan`, `id_jemaat_perempuan`, `nama_ayah_perempuan`, `nama_ibu_perempuan`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, NULL, 0, NULL, 'Palamrum', 0, 12, 'Jaki', 'There', 0, NULL, 'Sarimatrondang', 0, 2, 'Sahat', 'Kiki', 'asdfg', '2023-06-06 02:59:11', NULL, 0),
(2, NULL, 0, NULL, 'Palmarum', 0, 18, 'Mahar', 'Mama', 0, NULL, 'Parso', 0, 9, 'Sahat', 'Turnip', 'mwehehehe', '2023-06-06 03:09:26', NULL, 0),
(3, NULL, 0, NULL, 'Palmarum', 0, 3, 'Santo', 'Mama', 0, NULL, 'Parso', 0, 11, 'Sahat', 'Turnip', 'asdfghj', '2023-06-06 03:10:55', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_jemaat`
--

CREATE TABLE `registrasi_jemaat` (
  `id_registrasi` int(11) NOT NULL,
  `no_registrasi` varchar(50) NOT NULL,
  `tgl_registrasi` date DEFAULT NULL,
  `nama_keluarga` varchar(150) DEFAULT NULL,
  `id_wijk` int(11) NOT NULL,
  `id_jenis_register` int(11) NOT NULL,
  `id_gereja` int(11) NOT NULL,
  `nama_gereja_nonHKBP` varchar(100) DEFAULT NULL,
  `no_register_sebelumnya` int(11) DEFAULT NULL,
  `tgl_warta` date DEFAULT NULL,
  `id_status_registrasi` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `registrasi_jemaat`
--

INSERT INTO `registrasi_jemaat` (`id_registrasi`, `no_registrasi`, `tgl_registrasi`, `nama_keluarga`, `id_wijk`, `id_jenis_register`, `id_gereja`, `nama_gereja_nonHKBP`, `no_register_sebelumnya`, `tgl_warta`, `id_status_registrasi`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, '024303', '2020-09-14', 'Ny. Simamora A. br. Situmorang Op. Maria', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 08:41:23', NULL, 0),
(2, '024306', '2020-09-14', 'Jahuari Sianturi', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 08:46:35', NULL, 0),
(3, '0243001', '2020-09-17', 'Ny. Pardede br. Manurung STh', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 08:51:05', NULL, 0),
(4, '0243002', '2020-09-14', 'Ny Nababan Rosbinaria Sianturi Op Hanna Nababan', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 08:51:41', NULL, 0),
(5, '0243004', '2020-10-25', 'B. Nababan, SH (+) / Juaja br. Lumbantobing', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 08:52:09', NULL, 0),
(6, '0243005', '2020-09-25', 'Horas Sihombing / Rosalin Tambunan', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 08:53:11', NULL, 0),
(7, '0243007', NULL, 'Oberlin Hutabarat / Pakah Ria Hutagalung', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:10:22', NULL, 0),
(8, '0243009', '2020-11-20', 'Andri Hamonangan Nababan / Nur Safitri Theresia Gultom', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:11:42', NULL, 0),
(9, '0243010', '2020-09-14', 'Jhonny Sianturi / Megawati Sinaga', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:12:05', NULL, 0),
(10, '0243011', '2020-09-14', 'Edibroto Munthe / Herlina Simatupang', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:12:23', NULL, 0),
(11, '0243012', NULL, 'Ronny Bona Malau / Elvinora Br. Hutagalung', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:12:31', NULL, 0),
(12, '0243013', '2020-09-23', 'Ny St Drs M Sitorus M.Pd br. Nainggolan', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:12:46', NULL, 0),
(13, '0243014', '2020-10-06', 'Drs Pardomuan  Marbun / Pestaria  Simanjuntak', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:13:02', NULL, 0),
(14, '0243015', '2020-10-25', 'Drs. Hotman Sagala / Dra. Christina br. Hutagalung', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:13:16', NULL, 0),
(15, '0243016', '2020-09-14', 'Frengky Manurung / Lamtiurma Sormin', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:13:29', NULL, 0),
(16, '0243017', '2020-10-06', 'Sonta Renova Marbun', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:17:20', NULL, 0),
(17, '0243136', NULL, 'Rezki Nanda Pratama Sagala', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:17:40', NULL, 0),
(18, '0243138', NULL, 'Naek Irwan Tinambunan / Tebi Zera Sinaga', 1, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:18:04', NULL, 0),
(19, '0243018', '2020-09-16', 'Drs Petrus Hasurungan Purba / Terty Oktavia Simanjuntak S.Pd', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:18:21', NULL, 0),
(20, '0243019', '2020-09-25', 'H.R. Siahaan / Purnama Raya br. Lumbangao', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:18:58', NULL, 0),
(21, '0243020', '2020-09-28', 'Op Josua Sinaga L br Ompusunggu', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 09:19:14', NULL, 0),
(22, '0243021', '2020-09-14', 'Asan Sinaga / Kartini Nababan', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:49:36', NULL, 0),
(23, '0243023', '2020-09-23', 'Ardiles  Sinaga / lastiar Sitanggang', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:50:10', NULL, 0),
(24, '0243024', '2020-09-25', 'Ade Juhara  Sinaga / Tetty Chrystina Nadeak', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:53:37', NULL, 0),
(25, '0243025', '2020-09-23', 'St. Freddy Siagian / Hotma Ida Panggabean', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:53:57', NULL, 0),
(26, '0243026', NULL, 'Marudut Aritonang SE / Marni Siregar SST, M.Kes', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:54:04', NULL, 0),
(27, '0243027', '2020-09-16', 'Ir Junter Marbun / Rosnita Sihombing', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:54:23', NULL, 0),
(28, '0243028', '2020-09-25', 'Absalom Aritonang / Fransiska Margaretha Siburian', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:54:40', NULL, 0),
(29, '0243029', '2020-09-28', 'Saut Ganti  Sinaga / Leris Imak P Simanjuntak', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:55:02', NULL, 0),
(30, '0243126', '2021-02-04', 'Hotdiman Sinaga / Descy Lumbantobing', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:55:16', NULL, 0),
(31, '0243141', NULL, 'Febriantonius Parasian Sinaga / Editha Dorice Sihombing', 2, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:55:29', NULL, 0),
(32, '024336', '2020-10-06', ' Jefri  \r\nSilitonga SH / Nuraini  Lumbantobing S.Pd', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:58:38', NULL, 0),
(33, '0243030', '2020-09-28', 'St Drs NelsonPangihutan Siahaan MM / Lasmaida Sihaloho AMd, S.Pd', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 10:59:50', NULL, 0),
(34, '0243031', '2020-09-14', 'Pdt Pdt Martin Gultom SSi, Teol / Tetty Sabrina Rotua Tambunan S.Th', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:00:04', NULL, 0),
(35, '0243032', '2020-09-28', 'St Tohap Pandiangan BA / Ruslan  Manalu', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:00:19', NULL, 0),
(36, '0243033', '2020-09-28', 'Ernest Julianto Pandiangan S.Hut M.Si / Novita Magdalena Ompusunggu S.Pd', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:00:40', NULL, 0),
(37, '0243034', '2020-11-20', 'Saudara Silalahi / Clara br. Siahaan', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:00:58', NULL, 0),
(38, '0243039', NULL, 'Brian Leonardo Simatupang S.T / Lydia Natalia br. Pane S.T', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:01:07', NULL, 0),
(39, '0243040', NULL, 'St. S. Tinambunan (+) / Elly Simangunsong', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:01:20', NULL, 0),
(40, '0243042', '2020-09-25', 'S. Siburian (+) / Rumata br. Sitompul (Op. Enjel)', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:01:42', NULL, 0),
(41, '0243043', '2020-11-20', 'Agus Parningotan Siburian / Romauli br. Tampubolon', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:02:00', NULL, 0),
(42, '0243044', '2020-09-14', 'Drs Ropiol Panjaitan / H.R Manik M.Kes', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:02:14', NULL, 0),
(43, '0243045', '2020-09-28', 'Pahala Simamora / Juni Kristina Panggabean', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:02:42', NULL, 0),
(44, '0243046', '2020-10-25', 'Maruddin Simanjuntak / Maryanti br. Siregar', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:02:57', NULL, 0),
(45, '0243048', '2020-11-20', 'P. Sihombing (+) / Emmy Hutabarat', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:03:11', NULL, 0),
(46, '0243049', '2020-10-25', 'CKosmas Tambunan / Monalisa br. Siagian', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:03:24', NULL, 0),
(47, '0243050', '2020-11-20', 'Baris Pandiangan / Marni Sartika Silaban', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:03:42', NULL, 0),
(48, '0243051', '2020-11-20', 'Jesmon Pangabahan Hutauruk / Melati Raya Purba', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:04:19', NULL, 0),
(49, '0243052', '2020-09-29', 'Rommy Tulus  Simatupang SE / Andriana  Hutabarat', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:04:36', NULL, 0),
(50, '0243054', '2020-09-14', 'St Polan Simanullang / M Nainggolan', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:04:55', NULL, 0),
(51, '0243058', '2020-09-14', 'Sahata Tua Sirait SP / Imelda Hutabarat SE', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:05:14', NULL, 0),
(52, '0243061', '2020-10-25', 'Jamanter Nainggolan / R br. Siahaan (+)', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:05:27', NULL, 0),
(53, '0243124', NULL, 'Jefri Sagala / G. Sartika br. Silaban', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:05:33', NULL, 0),
(54, '0243125', '2020-11-20', 'Jimmi Inal Rikardo Siregar / Tati Maria br. Simanjuntak', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:05:49', NULL, 0),
(55, '0243128', NULL, 'Hary Simanjuntak / Ida Christina Lumbantobing', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:05:57', NULL, 0),
(56, '0243132', NULL, ' Jonris Martunas Nainggolan', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:06:09', NULL, 0),
(57, '0243135', '2022-04-10', 'Olsen Pandiangan / Kartini Lumbangaol', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:06:32', NULL, 0),
(58, '0243137', '2022-02-20', 'Boris Partogi Manurung / Ivo Anjelina Simanullang', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:06:50', NULL, 0),
(59, '0243139', '2022-02-20', 'Frans Octa Wednes Siahaan S.KOM, MH / Beatrix Metaria Tambunan S.KOM, MTI', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:06:57', NULL, 0),
(60, '0243142', '2022-03-27', 'Exa Alpones Simanullang / Fitri Morina Lumbantobing', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:07:12', NULL, 0),
(61, '0243053', '2020-10-06', 'Sartohap Manalu / Royana Sinabutar', 3, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:09:20', NULL, 0),
(62, '0243062', '2020-10-06', 'St Ny Sihotang br Lumbanraja', 4, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:14:31', NULL, 0),
(63, '0243063', '2020-09-23', 'Drs Mangiring Manalu / Lermin Sianturi', 4, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:14:41', NULL, 0),
(64, '0243064', '2020-09-23', 'Agus F M Manalu SP / Merika S Sinaga', 4, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:14:58', NULL, 0),
(65, '0243065', '2020-09-14', 'Bonar P.F. Manalu S.Pd / Yulan Yanti Angelina Sibuea SKM', 4, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:15:12', NULL, 0),
(66, '0243066', '2020-10-06', 'Drs Jasman Sinaga / br Hutagalung', 4, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:15:26', NULL, 0),
(67, '0243067', '2020-10-06', 'Tua  Nadapdap', 4, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:16:33', NULL, 0),
(68, '0243068', '2020-10-06', 'H Hutagalung / Rosipa Purba', 4, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:16:46', NULL, 0),
(69, '0243145', '2022-12-25', 'Danny Gustra H Siagian / Agnes Simangunsong', 4, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:17:01', NULL, 0),
(70, '0243070', '2020-10-25', 'St. M. Hutasoit Op. Partogi B.A / Sariana Sinaga', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:17:27', NULL, 0),
(71, '0243071', '2020-11-20', 'Djairus Siahaan (+) / Linda Manurung', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:17:39', NULL, 0),
(72, '0243073', '2020-09-28', 'Ny. Aritonang Sitiera br manalu (Mak Dedy)', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:17:50', NULL, 0),
(73, '0243074', '2020-09-28', 'Ny M Sitompul br Hutahuruk', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:18:05', NULL, 0),
(74, '0243075', '2020-10-25', 'Hulber Sianturi / Serly br. Sihombing', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:18:16', NULL, 0),
(75, '0243076', '2020-09-28', 'Hotma Parulian Aritonang / Ronauli  Pakpahan', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:18:30', NULL, 0),
(76, '0243077', '2020-09-28', 'Elvis Tulus  Sihite S.Pd / Chandra Devina  Hutauruk S.Pd', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:18:42', NULL, 0),
(77, '0243079', '2020-09-28', 'Christopher Cosmos Hutagalung / Pesta Natalina Sinaga', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:19:04', NULL, 0),
(78, '0243129', '2021-03-14', 'Midian Paber Hutapea / Intan R. br. Manurung', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:19:19', NULL, 0),
(79, '0243069', '2020-09-25', 'St. Sahat Hutapea / Rolasma Panggabean', 5, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:22:24', NULL, 0),
(80, '024383', '2020-10-06', 'Ny Risma Mediana Lumbantobing', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:22:37', NULL, 0),
(81, '0243080', '2020-09-25', 'Victor Pandiangan / St. Tumonggo Hutabarat S.PAK', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:22:48', NULL, 0),
(82, '0243081', '2020-09-29', 'Ny Manullang /Mery l Nora Nababan', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:23:00', NULL, 0),
(83, '0243082', NULL, 'Togap Purba / Nurlija Togatorop', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:23:14', NULL, 0),
(84, '0243084', '2020-09-25', 'Maringan Nababan / Mariasni Sinaga', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:28:38', NULL, 0),
(85, '0243085', '2020-09-25', 'A. Laomor. S Situmorang ST / Marlina br. Sihombing', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:28:50', NULL, 0),
(86, '0243086', '2020-09-25', 'Burman Sihite / Imelda Simatupang', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:29:04', NULL, 0),
(87, '0243087', '2020-09-29', 'Simon  Panggabean / Elerida Hutabarat', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:29:15', NULL, 0),
(88, '0243088', NULL, 'Marulak Daniel M Lumbantobing / Tiurma Estheronika br. Silitonga', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:29:21', NULL, 0),
(89, '0243089', '2020-09-14', 'Josua Pardomuan Sihombing ST, MT / Sesilya  Siburian SP', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:29:36', NULL, 0),
(90, '0243090', '2020-10-06', 'Verawaty K Nababan', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:30:01', NULL, 0),
(91, '0243091', '2020-09-29', 'Bonardo  manullang / Vony Heidy Situmorang', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:30:14', NULL, 0),
(92, '0243092', '2020-09-09', 'Bontor Arifin Hutasoit SIP, MSP / Relina M Simanungkalit S.Pd', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:30:27', NULL, 0),
(93, '0243130', '2021-08-29', 'Sudung Hutabarat / Ester Veronika Panggabean', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:30:43', NULL, 0),
(94, '0243131', '2022-01-30', 'Limjun Butarbutar / Henni Ervina Pasaribu', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:30:56', NULL, 0),
(95, '0243143', NULL, 'Arifin Nababan / Kartini D. Sitompul', 6, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:31:02', NULL, 0),
(96, '0243093', '2020-09-15', 'St P. Nainggolan / Rouli  Silaban S.Kep', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:31:39', NULL, 0),
(97, '0243094', NULL, 'Luat Henry Malau / St. D.R. br. Pangaribuan', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:31:47', NULL, 0),
(98, '0243095', '2020-09-29', 'Op Mastaria Pardosi', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:31:57', NULL, 0),
(99, '0243096', '2020-10-25', 'Henry Sunaryo Tinambunan / Nurhayati br. Hutagalung', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:32:08', NULL, 0),
(100, '0243097', '2020-09-14', 'Drs Jasmani  Siagian  / Dorlan Rosmauli Siallagan', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:32:20', NULL, 0),
(101, '0243098', NULL, 'L Lumbantobing / D Nainggolan', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:32:29', NULL, 0),
(102, '0243099', '2020-10-06', 'Ranto P Sitanggang SP / Kristina Natalina Hutahuruk SE', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:32:42', NULL, 0),
(103, '0243100', '2020-09-17', 'Herianto  Siahaan SP.Msi / Endang NV Siagian S.Kep, Ners', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:32:57', NULL, 0),
(104, '0243101', '2020-09-14', 'Sampiter Simatupang / Fransisca Hasugian S.Th', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:33:13', NULL, 0),
(105, '0243103', '2020-09-14', 'J. Simanjuntak S.ST, MT / H. Siadari S.Pd', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:36:07', NULL, 0),
(106, '0243104', '2020-09-25', 'Eppy Jusuf Silalahi / Bintang Hutasoit', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:36:19', NULL, 0),
(107, '0243106', '2020-09-17', 'IJ Panggabean / S br. Sihombing', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:36:34', NULL, 0),
(108, '0243108', '2020-09-29', 'Drs B P Siahaan MM / L br Rumahorbo', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:36:47', NULL, 0),
(109, '0243109', '2020-09-25', 'Sihombing (+) / Ny. Restiana br. Silitonga', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:37:03', NULL, 0),
(110, '0243133', '2020-06-26', 'St. Januari Hutabarat / Iriani Rosmawati Sitorus', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:37:17', NULL, 0),
(111, '0243140', NULL, 'Bernat Tua Simatupang / Tenti Simangunsong', 7, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:37:23', NULL, 0),
(112, '0243112', '2020-09-14', 'Drs Efendi Siallagan / St. Rennauli Hutabarat S.Pd', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:37:58', NULL, 0),
(113, '0243114', NULL, 'Manatap Simanungkalit / Juwita Marlibe Simanjuntak', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:38:08', NULL, 0),
(114, '0243115', '2020-09-14', 'Rimhot Simanungkalit / Naomi K. Siregar', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:38:22', NULL, 0),
(115, '0243116', '2020-09-14', 'Jefry Siburian SE / Yunita Veronika Munthe S.Kel, SE', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:38:35', NULL, 0),
(116, '0243117', '2020-09-14', 'Frengki Siallagan / Melisa Napitupulu', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:38:58', NULL, 0),
(117, '0243118', '2020-10-06', 'R  Nahampun / E Sitepu', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:39:10', NULL, 0),
(118, '0243119', '2020-09-14', 'Belsasar Siburian / Anny Pandiangan', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:39:22', NULL, 0),
(119, '0243120', '2020-10-06', 'Sebastian H M  Siburian', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:39:38', NULL, 0),
(120, '0243121', '2020-09-14', 'Posma Situmeang / Yosi Lumbantoruan', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:41:43', NULL, 0),
(121, '0243122', '2020-09-14', 'Tommi Hutapea / Marta  Hutabarat', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:41:55', NULL, 0),
(122, '0243123', '2020-09-14', 'Sidin Jona Simarmata / Sunita Juniberti Ritonga', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:42:08', NULL, 0),
(123, '0243127', NULL, 'Martahan Simanjuntak / Maria Mardelina Sirait', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:42:15', NULL, 0),
(124, '0243134', '2022-03-27', 'Gamler Hutasoit / Bunga Roslina Sinambela', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:42:29', NULL, 0),
(125, '0243144', '2022-12-10', 'CPdt. Mikhael Sihotang / Shintya br. Sitorus', 8, 1, 1, NULL, NULL, NULL, 2, '2023-05-09 11:42:40', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_pernikahan`
--

CREATE TABLE `registrasi_pernikahan` (
  `id_registrasi_nikah` int(11) NOT NULL,
  `id_gereja` int(11) DEFAULT NULL,
  `tgl_martumpol` date NOT NULL,
  `tgl_warta_martumpol` date DEFAULT NULL,
  `isHKBP_martumpol` int(11) DEFAULT NULL,
  `id_gereja_martumpol` int(11) DEFAULT NULL,
  `nama_gereja_martumpol` varchar(100) NOT NULL,
  `nomor_surat_martumpol` int(11) DEFAULT NULL,
  `nama_pendeta_martumpol` varchar(100) DEFAULT NULL,
  `file_surat_martumpol` bigint(20) DEFAULT NULL,
  `tgl_pemberkatan` date NOT NULL,
  `tgl_warta_pemberkatan` date DEFAULT NULL,
  `isHKBP_pemeberkatan` int(11) DEFAULT NULL,
  `id_gereja_pemberkatan` int(11) DEFAULT NULL,
  `nama_gereja_pemberkatan` varchar(150) NOT NULL,
  `nomor_surat_pemberkatan` int(11) DEFAULT NULL,
  `nomor_pendeta_pemberkatan` int(11) DEFAULT NULL,
  `file_surat_pemberkatan` varchar(250) DEFAULT NULL,
  `id_status_reg_nikah` int(11) DEFAULT NULL,
  `isHKBP_laki` tinyint(1) NOT NULL DEFAULT 0,
  `id_gereja_laki` tinyint(1) DEFAULT NULL,
  `nama_gereja_laki` varchar(150) DEFAULT NULL,
  `is_jemaat_laki` tinyint(1) NOT NULL DEFAULT 0,
  `id_jemaat_laki` int(11) DEFAULT NULL,
  `nama_ayah_laki` varchar(150) NOT NULL,
  `nama_ibu_laki` varchar(150) NOT NULL,
  `is_HKBP_perempuan` tinyint(1) NOT NULL DEFAULT 0,
  `id_gereja_perempuan` int(11) DEFAULT NULL,
  `nama_gereja_perempuan` varchar(150) DEFAULT NULL,
  `is_jemaat_perempuan` tinyint(1) NOT NULL DEFAULT 0,
  `nama_ayah_perempuan` varchar(150) NOT NULL,
  `nama_ibu_perempuan` varchar(150) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `registrasi_pernikahan`
--

INSERT INTO `registrasi_pernikahan` (`id_registrasi_nikah`, `id_gereja`, `tgl_martumpol`, `tgl_warta_martumpol`, `isHKBP_martumpol`, `id_gereja_martumpol`, `nama_gereja_martumpol`, `nomor_surat_martumpol`, `nama_pendeta_martumpol`, `file_surat_martumpol`, `tgl_pemberkatan`, `tgl_warta_pemberkatan`, `isHKBP_pemeberkatan`, `id_gereja_pemberkatan`, `nama_gereja_pemberkatan`, `nomor_surat_pemberkatan`, `nomor_pendeta_pemberkatan`, `file_surat_pemberkatan`, `id_status_reg_nikah`, `isHKBP_laki`, `id_gereja_laki`, `nama_gereja_laki`, `is_jemaat_laki`, `id_jemaat_laki`, `nama_ayah_laki`, `nama_ibu_laki`, `is_HKBP_perempuan`, `id_gereja_perempuan`, `nama_gereja_perempuan`, `is_jemaat_perempuan`, `nama_ayah_perempuan`, `nama_ibu_perempuan`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, NULL, '2023-04-09', NULL, NULL, NULL, 'adasd', NULL, NULL, NULL, '2023-07-07', NULL, NULL, NULL, 'asda', NULL, NULL, NULL, NULL, 0, NULL, 'cxcz', 0, NULL, 'xcxz', 'zxcz', 0, NULL, 'xczc', 0, 'zxczc', 'vds', 'asda', '2023-06-06 03:27:42', NULL, 0),
(2, NULL, '2023-05-29', NULL, NULL, NULL, 'Marturani', NULL, NULL, NULL, '2023-06-01', NULL, NULL, NULL, 'hakja', NULL, NULL, NULL, NULL, 0, NULL, 'Palmarum', 0, NULL, 'Mahar', 'dsds', 0, NULL, 'Parso', 0, 'Sahat', 'Turnip', 'mwehehehe', '2023-06-06 03:32:55', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_sidi`
--

CREATE TABLE `registrasi_sidi` (
  `id_registrasi_sidi` int(11) NOT NULL,
  `is_jemaat` tinyint(1) NOT NULL DEFAULT 0,
  `id_jemaat` int(11) DEFAULT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_hub_keluarga` int(11) NOT NULL DEFAULT 3,
  `is_HKBP` tinyint(1) NOT NULL DEFAULT 0,
  `id_gereja_sidi` int(11) NOT NULL DEFAULT 1,
  `nama_gereja_non_hkbp` varchar(150) DEFAULT NULL,
  `tanggal_sidi` date DEFAULT NULL,
  `nats_sidi` varchar(250) DEFAULT NULL,
  `nomor_surat_sidi` int(11) DEFAULT NULL,
  `nama_pendeta_sidi` varchar(100) DEFAULT NULL,
  `file_surat_sidi` bigint(20) DEFAULT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `registrasi_sidi`
--

INSERT INTO `registrasi_sidi` (`id_registrasi_sidi`, `is_jemaat`, `id_jemaat`, `nama_ayah`, `nama_ibu`, `nama_lengkap`, `tempat_lahir`, `tanggal_lahir`, `id_hub_keluarga`, `is_HKBP`, `id_gereja_sidi`, `nama_gereja_non_hkbp`, `tanggal_sidi`, `nats_sidi`, `nomor_surat_sidi`, `nama_pendeta_sidi`, `file_surat_sidi`, `keterangan`, `id_status`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 0, NULL, 'maja', 'mija', 'Josep', 'Parso', '2003-07-09', 3, 0, 1, 'HKBP Palmarum', NULL, NULL, NULL, NULL, NULL, 'adasdsa', NULL, '2023-06-06 04:42:19', NULL, 0),
(2, 0, NULL, 'sas', 'sddsd', 'Sahat', 'Parsoburan', '2023-05-28', 3, 0, 1, 'medan jaya', NULL, NULL, NULL, NULL, NULL, 'wwewe', NULL, '2023-06-06 04:57:40', NULL, 0),
(3, 0, NULL, 'RINNI', 'SUSU', 'Josep', 'Parsoburan', '2023-05-28', 3, 0, 1, 'medan jaya', NULL, NULL, NULL, NULL, NULL, 'asdfg', NULL, '2023-06-07 05:04:46', NULL, 0),
(4, 0, NULL, 'qwe', 'er', 'qwe', 'rt', '2023-05-29', 3, 0, 1, 'sdfg', NULL, NULL, NULL, NULL, NULL, 'gfgf', NULL, '2023-06-07 08:03:35', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ressort`
--

CREATE TABLE `ressort` (
  `id_ressort` int(11) NOT NULL,
  `id_distrik` int(11) NOT NULL,
  `kode_ressort` varchar(50) NOT NULL,
  `nama_ressort` varchar(100) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `pendeta_ressort` varchar(100) NOT NULL,
  `tgl_berdiri` date NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ressort`
--

INSERT INTO `ressort` (`id_ressort`, `id_distrik`, `kode_ressort`, `nama_ressort`, `alamat`, `id_kota`, `pendeta_ressort`, `tgl_berdiri`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 1, '0243', 'Ressort Palmarum', 'Stadion Tarutung, Hutatoruan VI, Kec. Tarutung, Kabupaten Tapanuli Utara, Sumatera Utara', 31, 'Pdt. Martin Gultom. SSi. Teol', '1999-07-20', '2023-05-08 08:58:18', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rpp`
--

CREATE TABLE `rpp` (
  `id_rpp` int(11) NOT NULL,
  `id_gereja` int(11) NOT NULL DEFAULT 1,
  `id_jemaat` int(11) NOT NULL,
  `tgl_warta_rpp` date NOT NULL,
  `id_jenis_rpp` int(11) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `id_status` int(11) NOT NULL DEFAULT 6,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `rpp`
--

INSERT INTO `rpp` (`id_rpp`, `id_gereja`, `id_jemaat`, `tgl_warta_rpp`, `id_jenis_rpp`, `keterangan`, `id_status`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 1, 2, '2023-04-06', 1, 'Pembunuhan Tidak Terencana lagi', 6, '2023-05-24 10:52:28', '2023-05-24 15:47:59', 1),
(2, 1, 1, '2020-09-20', 1, 'Pembunuhan', 6, '2023-05-24 17:04:57', '2023-05-24 17:08:11', 1),
(3, 1, 3, '2023-05-24', 1, 'Pembunuhan Berencana', 6, '2023-05-24 17:05:27', '2023-05-24 17:08:12', 1),
(4, 1, 1, '2023-05-19', 1, 'Pembunuhan Berencana', 6, '2023-05-24 17:08:29', '2023-05-24 17:09:24', 1),
(5, 1, 1, '2020-05-20', 1, 'Pembunuhan Berencana', 6, '2023-05-24 17:11:25', '2023-05-24 18:35:23', 1),
(6, 1, 1, '2023-05-05', 1, 'pembunuhan', 6, '2023-05-25 03:30:39', '2023-05-25 19:01:55', 1),
(7, 1, 3, '2023-05-13', 1, 'bunu', 6, '2023-05-25 19:00:55', '2023-05-25 19:01:53', 1),
(8, 1, 1, '2023-05-13', 1, 'hadjsad', 6, '2023-05-27 14:08:31', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `set_sentralisasi`
--

CREATE TABLE `set_sentralisasi` (
  `id_sentralisasi` int(11) NOT NULL,
  `persentasi_sentralisasi` int(11) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `set_sentralisasi`
--

INSERT INTO `set_sentralisasi` (`id_sentralisasi`, `persentasi_sentralisasi`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 55, 'Sentralisasi Pusat', '2023-06-09 02:17:31', NULL, 0),
(2, 45, 'Sentralisasi Gereja', '2023-06-09 02:14:52', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sidi`
--

CREATE TABLE `sidi` (
  `id_sidi` int(11) NOT NULL,
  `id_registrasi_sidi` int(11) NOT NULL,
  `id_jemaat` int(11) NOT NULL,
  `tgl_sidi` date NOT NULL,
  `no_surat_sidi` int(11) NOT NULL,
  `nats_sidi` varchar(250) NOT NULL,
  `id_gereja_sidi` int(11) NOT NULL,
  `isHKBP` tinyint(1) NOT NULL DEFAULT 0,
  `nama_gereja_non_hkbp` varchar(100) DEFAULT NULL,
  `nama_pendeta_sidi` varchar(100) NOT NULL,
  `file_surat_sidi` bigint(20) NOT NULL,
  `keterangan` varchar(250) DEFAULT NULL,
  `id_status` int(11) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `id_jenis_status` int(11) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `status`, `id_jenis_status`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, '0', 1, 'Not Approved', '2023-04-23 02:29:45', NULL, 0),
(2, '1', 1, 'Approved', '2023-04-23 02:30:12', NULL, 0),
(3, '0', 2, 'Belum Menikah', '2023-05-10 08:51:25', NULL, 0),
(4, '1', 2, 'Sudah Menikah', '2023-05-10 08:51:34', NULL, 0),
(5, '0', 3, 'Jemaat Tidak Aktif', '2023-05-17 03:33:21', NULL, 0),
(6, '1', 3, 'Jemaat Aktif', '2023-05-17 03:33:21', NULL, 0),
(7, '1', 4, 'Jemaat Meninggal', '2023-05-17 03:33:21', NULL, 0),
(8, '1', 5, 'Jemaat Pindah', '2023-05-17 03:33:21', NULL, 0),
(9, '1', 6, 'Jemaat Rpp', '2023-05-17 03:33:21', NULL, 0),
(10, '0', 7, 'Majelis Tidak Aktif', '2023-05-17 03:33:21', NULL, 0),
(11, '1', 7, 'Majelis Aktif', '2023-05-17 03:33:21', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'boas', 'boas@boas.com', NULL, '$2y$10$v62YM2me3SlQHXL4P3afyO71kNpJtKvA58EQXNzryqSTTY3S4jXTG', NULL, '2023-06-07 21:08:02', '2023-06-07 21:08:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `wijk`
--

CREATE TABLE `wijk` (
  `id_wijk` int(11) NOT NULL,
  `nama_wijk` varchar(100) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `wijk`
--

INSERT INTO `wijk` (`id_wijk`, `nama_wijk`, `keterangan`, `create_at`, `update_at`, `is_deleted`) VALUES
(1, 'Wijk-1', 'Wijk Pertama', '2023-05-08 13:55:50', NULL, 0),
(2, 'Wijk-2', 'Wijk Kedua', '2023-05-09 10:36:39', NULL, 0),
(3, 'Wijk-3', 'Wijk Ketiga', '2023-05-09 10:36:48', NULL, 0),
(4, 'Wijk-4', 'Wijk Keempat', '2023-05-09 10:37:07', NULL, 0),
(5, 'Wijk-5', 'Wijk Kelima', '2023-05-09 10:37:14', NULL, 0),
(6, 'Wijk-6', 'Wijk Keenam', '2023-05-09 10:37:25', NULL, 0),
(7, 'Wijk-7', 'Wijk Ketujuh', '2023-05-09 10:38:25', NULL, 0),
(8, 'Wijk-8', 'Wijk Kedelapan', '2023-05-09 10:38:38', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`) USING BTREE;

--
-- Indexes for table `bank_gereja`
--
ALTER TABLE `bank_gereja`
  ADD PRIMARY KEY (`id_bank_gereja`) USING BTREE,
  ADD KEY `bank_id_bank_gereja` (`id_bank`) USING BTREE,
  ADD KEY `gereja_id_bank_gereja` (`id_gereja`) USING BTREE;

--
-- Indexes for table `baptis`
--
ALTER TABLE `baptis`
  ADD PRIMARY KEY (`id_baptis`) USING BTREE,
  ADD KEY `gereja_id_baptis` (`id_registrasi_baptis`) USING BTREE,
  ADD KEY `jemaat_id_baptis` (`id_jemaat`) USING BTREE,
  ADD KEY `gereja_baptis_id_baptis` (`id_gereja_baptis`) USING BTREE;

--
-- Indexes for table `bidang_pendidikan`
--
ALTER TABLE `bidang_pendidikan`
  ADD PRIMARY KEY (`id_bidang_pendidikan`) USING BTREE;

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`) USING BTREE,
  ADD KEY `fk_province_id_city` (`province_id`) USING BTREE;

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`) USING BTREE;

--
-- Indexes for table `detail_pemasukan`
--
ALTER TABLE `detail_pemasukan`
  ADD PRIMARY KEY (`id_pemasukan`);

--
-- Indexes for table `detail_pengeluaran`
--
ALTER TABLE `detail_pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`) USING BTREE;

--
-- Indexes for table `detail_pindah`
--
ALTER TABLE `detail_pindah`
  ADD PRIMARY KEY (`id_det_reg_pindah`) USING BTREE,
  ADD KEY `jemaat_id_pindah` (`id_jemaat`) USING BTREE;

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_transaksi`) USING BTREE;

--
-- Indexes for table `det_registrasi_jemaat`
--
ALTER TABLE `det_registrasi_jemaat`
  ADD PRIMARY KEY (`id_det_registrasi`) USING BTREE,
  ADD KEY `jemaat_id_det_registrasi_jemaat` (`id_jemaat`) USING BTREE,
  ADD KEY `status_id_det_registrasi_jemaat` (`id_status`) USING BTREE,
  ADD KEY `fk_id_registrasi_det_registrasi_jemaat` (`id_registrasi`) USING BTREE;

--
-- Indexes for table `distrik`
--
ALTER TABLE `distrik`
  ADD PRIMARY KEY (`id_distrik`) USING BTREE,
  ADD KEY `fk_id_kota_distrik` (`id_kota`) USING BTREE;

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gereja`
--
ALTER TABLE `gereja`
  ADD PRIMARY KEY (`id_gereja`) USING BTREE,
  ADD KEY `ressort_id_gereja` (`id_ressort`) USING BTREE,
  ADD KEY `jenis_gereja_id_gereja` (`id_jenis_gereja`) USING BTREE,
  ADD KEY `fk_id_kota_gereja` (`id_kota`) USING BTREE;

--
-- Indexes for table `head_pindah`
--
ALTER TABLE `head_pindah`
  ADD PRIMARY KEY (`id_head_reg_pindah`) USING BTREE,
  ADD KEY `registrasi_id_head_pindah` (`id_registrasi`) USING BTREE,
  ADD KEY `gereja_id_head_pindah` (`id_gereja`) USING BTREE,
  ADD KEY `jenis_registrasi_id_head_pindah` (`id_jenis_registrasi`) USING BTREE,
  ADD KEY `fk_id_jemaat_head_pindah` (`id_jemaat`) USING BTREE;

--
-- Indexes for table `head_transaksi`
--
ALTER TABLE `head_transaksi`
  ADD PRIMARY KEY (`id_transaksi`) USING BTREE,
  ADD KEY `fk_id_jemaat_head_transaksi` (`id_jemaat`) USING BTREE;

--
-- Indexes for table `hubungan_keluarga`
--
ALTER TABLE `hubungan_keluarga`
  ADD PRIMARY KEY (`id_hub_keluarga`) USING BTREE;

--
-- Indexes for table `jadwal_ibadah`
--
ALTER TABLE `jadwal_ibadah`
  ADD PRIMARY KEY (`id_jadwal_ibadah`) USING BTREE,
  ADD KEY `jenis_minggu_id_jadwal_ibadah` (`id_jenis_minggu`) USING BTREE,
  ADD KEY `jam_kegiatan_id_jadwal_ibadah` (`id_jam_kegiatan`) USING BTREE;

--
-- Indexes for table `jam_kegiatan`
--
ALTER TABLE `jam_kegiatan`
  ADD PRIMARY KEY (`id_jam_kegiatan`) USING BTREE,
  ADD KEY `gereja_id_jam_kegiatan` (`id_gereja`) USING BTREE;

--
-- Indexes for table `jemaat`
--
ALTER TABLE `jemaat`
  ADD PRIMARY KEY (`id_jemaat`) USING BTREE,
  ADD KEY `hub_keluarga_id_jemaat` (`id_hub_keluarga`) USING BTREE,
  ADD KEY `status_pernikahan_id_jemaat` (`id_status_pernikahan`) USING BTREE,
  ADD KEY `pendidikan_id_jemaat` (`id_pendidikan`) USING BTREE,
  ADD KEY `bidnag_pendidikan_id_jemaat` (`id_bidang_pendidikan`) USING BTREE,
  ADD KEY `pekerjaan_id_jemaat` (`id_pekerjaan`) USING BTREE,
  ADD KEY `fk_id_kota_jemaat` (`id_kota`) USING BTREE,
  ADD KEY `fk_id_registrasi_jemaat` (`id_registrasi`) USING BTREE;

--
-- Indexes for table `jemaat_hadir`
--
ALTER TABLE `jemaat_hadir`
  ADD PRIMARY KEY (`id_jemaat_hadir`) USING BTREE,
  ADD KEY `jadwal_ibadah_id_jemaat_hadir` (`id_jadwal_ibadah`) USING BTREE;

--
-- Indexes for table `jenis_gereja`
--
ALTER TABLE `jenis_gereja`
  ADD PRIMARY KEY (`id_jenis_gereja`) USING BTREE;

--
-- Indexes for table `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  ADD PRIMARY KEY (`id_jenis_kegiatan`) USING BTREE;

--
-- Indexes for table `jenis_minggu`
--
ALTER TABLE `jenis_minggu`
  ADD PRIMARY KEY (`id_jenis_minggu`) USING BTREE;

--
-- Indexes for table `jenis_registrasi`
--
ALTER TABLE `jenis_registrasi`
  ADD PRIMARY KEY (`id_jenis_registrasi`) USING BTREE;

--
-- Indexes for table `jenis_rpp`
--
ALTER TABLE `jenis_rpp`
  ADD PRIMARY KEY (`id_jenis_rpp`) USING BTREE;

--
-- Indexes for table `jenis_status`
--
ALTER TABLE `jenis_status`
  ADD PRIMARY KEY (`id_jenis_status`) USING BTREE;

--
-- Indexes for table `kategori_mata_anggaran`
--
ALTER TABLE `kategori_mata_anggaran`
  ADD PRIMARY KEY (`id_kategori_anggaran`) USING BTREE;

--
-- Indexes for table `kategori_pemasukan`
--
ALTER TABLE `kategori_pemasukan`
  ADD PRIMARY KEY (`id_kategori_pemasukan`) USING BTREE;

--
-- Indexes for table `majelis`
--
ALTER TABLE `majelis`
  ADD PRIMARY KEY (`id_majelis`) USING BTREE,
  ADD KEY `gereja_id_majelis` (`id_gereja`) USING BTREE,
  ADD KEY `jemaat_id_majelis` (`id_jemaat`) USING BTREE,
  ADD KEY `pelayan_id_majelis` (`id_pelayan`) USING BTREE,
  ADD KEY `status_pelayanan_id_majelis` (`id_status_pelayanan`) USING BTREE;

--
-- Indexes for table `mata_anggaran`
--
ALTER TABLE `mata_anggaran`
  ADD PRIMARY KEY (`id_mata_anggaran`) USING BTREE;

--
-- Indexes for table `mejelis_lingkungan`
--
ALTER TABLE `mejelis_lingkungan`
  ADD PRIMARY KEY (`id_majelis`,`id_wijk`) USING BTREE,
  ADD KEY `wijk_id_majelis_lingkungan` (`id_wijk`) USING BTREE;

--
-- Indexes for table `meninggal`
--
ALTER TABLE `meninggal`
  ADD PRIMARY KEY (`id_meninggal`) USING BTREE,
  ADD KEY `gereja_id_meninggal` (`id_gereja`) USING BTREE,
  ADD KEY `jemaat_id__meninggal` (`id_jemaat`) USING BTREE,
  ADD KEY `status_id_meninggal` (`id_status`) USING BTREE;

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`id_pekerjaan`) USING BTREE;

--
-- Indexes for table `pelayanan_ibadah`
--
ALTER TABLE `pelayanan_ibadah`
  ADD PRIMARY KEY (`id_pelayanan_ibadah`) USING BTREE;

--
-- Indexes for table `pelayan_gereja`
--
ALTER TABLE `pelayan_gereja`
  ADD PRIMARY KEY (`id_pelayan`) USING BTREE,
  ADD KEY `fk_id_jemaat_pelayan_gereja` (`id_jemaat`) USING BTREE;

--
-- Indexes for table `pelayan_ibadah`
--
ALTER TABLE `pelayan_ibadah`
  ADD KEY `pelayanan_ibadah_id_pelayanan_ibadah` (`id_pelayanan_ibadah`) USING BTREE;

--
-- Indexes for table `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id_pemasukan`) USING BTREE,
  ADD KEY `jemaat_id_pemasukan` (`id_jemaat`) USING BTREE,
  ADD KEY `bank_id_pemasukan` (`id_bank`) USING BTREE,
  ADD KEY `fk_id_kategori_pemasukan_pemasukan` (`id_kategori_pemasukan`) USING BTREE;

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`) USING BTREE;

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`) USING BTREE,
  ADD KEY `fk_id_bank_pengeluaran` (`id_bank`) USING BTREE,
  ADD KEY `fk_id_kategori_pengeluaran` (`id_kategori_pengeluaran`) USING BTREE;

--
-- Indexes for table `pernikahan`
--
ALTER TABLE `pernikahan`
  ADD PRIMARY KEY (`id_pernikahan`) USING BTREE,
  ADD KEY `gereja_id_pernikahan` (`id_gereja`) USING BTREE,
  ADD KEY `gereja_nikah_id_pernikahan` (`id_gereja_nikah`) USING BTREE,
  ADD KEY `status_id_pernikahan` (`id_status`) USING BTREE,
  ADD KEY `fk_registrasi_nikah_pernikahan` (`id_registrasi_pernikahan`) USING BTREE;

--
-- Indexes for table `pernikahan_jemaat`
--
ALTER TABLE `pernikahan_jemaat`
  ADD PRIMARY KEY (`id_pernikahan_jemaat`) USING BTREE,
  ADD KEY `pernikahan_id_pernikahan_jemaat` (`id_pernikahan`) USING BTREE,
  ADD KEY `jemaat_laki_id_pernikahan_jemaat` (`id_jemaat_laki`) USING BTREE,
  ADD KEY `fk_id_jemaat_perempuan_pernikahan_jemaat` (`id_jemaat_perempuan`) USING BTREE;

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`province_id`) USING BTREE,
  ADD KEY `fk_id_country_province` (`country_id`) USING BTREE;

--
-- Indexes for table `registrasi_baptis`
--
ALTER TABLE `registrasi_baptis`
  ADD PRIMARY KEY (`id_registrasi_baptis`) USING BTREE,
  ADD KEY `fk_id_status_registrasi_baptis` (`id_status`) USING BTREE,
  ADD KEY `fk_id_hub_keluarga_registrasi_baptis` (`id_hub_keluarga`) USING BTREE,
  ADD KEY `fk_id_gereja_baptis_registrasi_baptis` (`id_gereja_baptis`) USING BTREE,
  ADD KEY `fk_id_pendeta_registrasi_baptis` (`id_pendeta`) USING BTREE;

--
-- Indexes for table `registrasi_calon_mempelai`
--
ALTER TABLE `registrasi_calon_mempelai`
  ADD PRIMARY KEY (`id_registrasi_calon`) USING BTREE,
  ADD KEY `fk_registrasi_nikah_registrasi_calon_mempelai` (`id_registrasi_nikah`) USING BTREE,
  ADD KEY `fk_id_gereja_laki_registrasi_calon_mempelai` (`id_gereja_laki`) USING BTREE,
  ADD KEY `fk_id_jemaat_laki_registrasi_calon_mempelai` (`id_jemaat_laki`) USING BTREE,
  ADD KEY `fk_id_gereja_perempuan_registrasi_calon_mempelai` (`id_gereja_perempuan`) USING BTREE,
  ADD KEY `fk_id_jemaat_perempuan_registrasi_calon_mempelai` (`id_jemaat_perempuan`) USING BTREE;

--
-- Indexes for table `registrasi_jemaat`
--
ALTER TABLE `registrasi_jemaat`
  ADD PRIMARY KEY (`id_registrasi`) USING BTREE,
  ADD KEY `wijk_id_registrasi_jemaat` (`id_wijk`) USING BTREE,
  ADD KEY `jenis_register_id_registrasi_jemaat` (`id_jenis_register`) USING BTREE,
  ADD KEY `gereja_id_registrasi_jemaat` (`id_gereja`) USING BTREE,
  ADD KEY `fk_id_status_registrasi_registrasi_jemaat` (`id_status_registrasi`) USING BTREE;

--
-- Indexes for table `registrasi_pernikahan`
--
ALTER TABLE `registrasi_pernikahan`
  ADD PRIMARY KEY (`id_registrasi_nikah`) USING BTREE,
  ADD KEY `gereja_id_registrasi_pernikahan` (`id_gereja`) USING BTREE,
  ADD KEY `gereja_martumpol_id_registrasi_pernikahan` (`id_gereja_martumpol`) USING BTREE,
  ADD KEY `gereja_pemberkatan_id_registrasi_pernikahan` (`id_gereja_pemberkatan`) USING BTREE,
  ADD KEY `status_reg_nikah_registrasi_pernikahan` (`id_status_reg_nikah`) USING BTREE;

--
-- Indexes for table `registrasi_sidi`
--
ALTER TABLE `registrasi_sidi`
  ADD PRIMARY KEY (`id_registrasi_sidi`) USING BTREE,
  ADD KEY `fk_id_jemaat_registrasi_sidi` (`id_jemaat`) USING BTREE,
  ADD KEY `fk_id_hub_keluarga_registrasi_sidi` (`id_hub_keluarga`) USING BTREE,
  ADD KEY `fk_id_gereja_sidi_registrasi_sidi` (`id_gereja_sidi`) USING BTREE,
  ADD KEY `fk_id_status_registrasi_sidi` (`id_status`) USING BTREE;

--
-- Indexes for table `ressort`
--
ALTER TABLE `ressort`
  ADD PRIMARY KEY (`id_ressort`) USING BTREE,
  ADD KEY `distrik_id_ressort` (`id_distrik`) USING BTREE,
  ADD KEY `fk_id_kota_ressort` (`id_kota`) USING BTREE;

--
-- Indexes for table `rpp`
--
ALTER TABLE `rpp`
  ADD PRIMARY KEY (`id_rpp`) USING BTREE,
  ADD KEY `gereja_id_rpp` (`id_gereja`) USING BTREE,
  ADD KEY `jemaat_id_rpp` (`id_jemaat`) USING BTREE,
  ADD KEY `status_id_rpp` (`id_status`) USING BTREE,
  ADD KEY `fk_id_jenis_rpp_rpp` (`id_jenis_rpp`) USING BTREE;

--
-- Indexes for table `set_sentralisasi`
--
ALTER TABLE `set_sentralisasi`
  ADD PRIMARY KEY (`id_sentralisasi`);

--
-- Indexes for table `sidi`
--
ALTER TABLE `sidi`
  ADD PRIMARY KEY (`id_sidi`) USING BTREE,
  ADD KEY `jemaat_id_sidi` (`id_jemaat`) USING BTREE,
  ADD KEY `gereja_sidi_id_sidi` (`id_registrasi_sidi`) USING BTREE,
  ADD KEY `status_id_sidi` (`id_status`) USING BTREE,
  ADD KEY `fk_id_gereja_sidi_sidi` (`id_gereja_sidi`) USING BTREE;

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`) USING BTREE,
  ADD KEY `jenis_status_id_status` (`id_jenis_status`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wijk`
--
ALTER TABLE `wijk`
  ADD PRIMARY KEY (`id_wijk`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_gereja`
--
ALTER TABLE `bank_gereja`
  MODIFY `id_bank_gereja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `baptis`
--
ALTER TABLE `baptis`
  MODIFY `id_baptis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bidang_pendidikan`
--
ALTER TABLE `bidang_pendidikan`
  MODIFY `id_bidang_pendidikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `detail_pemasukan`
--
ALTER TABLE `detail_pemasukan`
  MODIFY `id_pemasukan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `detail_pengeluaran`
--
ALTER TABLE `detail_pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `detail_pindah`
--
ALTER TABLE `detail_pindah`
  MODIFY `id_det_reg_pindah` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `det_registrasi_jemaat`
--
ALTER TABLE `det_registrasi_jemaat`
  MODIFY `id_det_registrasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distrik`
--
ALTER TABLE `distrik`
  MODIFY `id_distrik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gereja`
--
ALTER TABLE `gereja`
  MODIFY `id_gereja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `head_pindah`
--
ALTER TABLE `head_pindah`
  MODIFY `id_head_reg_pindah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hubungan_keluarga`
--
ALTER TABLE `hubungan_keluarga`
  MODIFY `id_hub_keluarga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jadwal_ibadah`
--
ALTER TABLE `jadwal_ibadah`
  MODIFY `id_jadwal_ibadah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `jam_kegiatan`
--
ALTER TABLE `jam_kegiatan`
  MODIFY `id_jam_kegiatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jemaat`
--
ALTER TABLE `jemaat`
  MODIFY `id_jemaat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jemaat_hadir`
--
ALTER TABLE `jemaat_hadir`
  MODIFY `id_jemaat_hadir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_gereja`
--
ALTER TABLE `jenis_gereja`
  MODIFY `id_jenis_gereja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jenis_kegiatan`
--
ALTER TABLE `jenis_kegiatan`
  MODIFY `id_jenis_kegiatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_minggu`
--
ALTER TABLE `jenis_minggu`
  MODIFY `id_jenis_minggu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jenis_registrasi`
--
ALTER TABLE `jenis_registrasi`
  MODIFY `id_jenis_registrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenis_rpp`
--
ALTER TABLE `jenis_rpp`
  MODIFY `id_jenis_rpp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jenis_status`
--
ALTER TABLE `jenis_status`
  MODIFY `id_jenis_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kategori_mata_anggaran`
--
ALTER TABLE `kategori_mata_anggaran`
  MODIFY `id_kategori_anggaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `kategori_pemasukan`
--
ALTER TABLE `kategori_pemasukan`
  MODIFY `id_kategori_pemasukan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `majelis`
--
ALTER TABLE `majelis`
  MODIFY `id_majelis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mata_anggaran`
--
ALTER TABLE `mata_anggaran`
  MODIFY `id_mata_anggaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT for table `mejelis_lingkungan`
--
ALTER TABLE `mejelis_lingkungan`
  MODIFY `id_majelis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meninggal`
--
ALTER TABLE `meninggal`
  MODIFY `id_meninggal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pekerjaan`
--
ALTER TABLE `pekerjaan`
  MODIFY `id_pekerjaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pelayanan_ibadah`
--
ALTER TABLE `pelayanan_ibadah`
  MODIFY `id_pelayanan_ibadah` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelayan_gereja`
--
ALTER TABLE `pelayan_gereja`
  MODIFY `id_pelayan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `id_pemasukan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pendidikan`
--
ALTER TABLE `pendidikan`
  MODIFY `id_pendidikan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pernikahan`
--
ALTER TABLE `pernikahan`
  MODIFY `id_pernikahan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pernikahan_jemaat`
--
ALTER TABLE `pernikahan_jemaat`
  MODIFY `id_pernikahan_jemaat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registrasi_baptis`
--
ALTER TABLE `registrasi_baptis`
  MODIFY `id_registrasi_baptis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `registrasi_calon_mempelai`
--
ALTER TABLE `registrasi_calon_mempelai`
  MODIFY `id_registrasi_calon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registrasi_jemaat`
--
ALTER TABLE `registrasi_jemaat`
  MODIFY `id_registrasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `registrasi_pernikahan`
--
ALTER TABLE `registrasi_pernikahan`
  MODIFY `id_registrasi_nikah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `registrasi_sidi`
--
ALTER TABLE `registrasi_sidi`
  MODIFY `id_registrasi_sidi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ressort`
--
ALTER TABLE `ressort`
  MODIFY `id_ressort` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rpp`
--
ALTER TABLE `rpp`
  MODIFY `id_rpp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `set_sentralisasi`
--
ALTER TABLE `set_sentralisasi`
  MODIFY `id_sentralisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `sidi`
--
ALTER TABLE `sidi`
  MODIFY `id_sidi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wijk`
--
ALTER TABLE `wijk`
  MODIFY `id_wijk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_gereja`
--
ALTER TABLE `bank_gereja`
  ADD CONSTRAINT `fk_id_bank_bank_gereja` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id_bank`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_gereja_bank_gereja` FOREIGN KEY (`id_gereja`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `baptis`
--
ALTER TABLE `baptis`
  ADD CONSTRAINT `fk_id_gereja_baptis` FOREIGN KEY (`id_gereja_baptis`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_baptis` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_registrasi_baptis_baptis` FOREIGN KEY (`id_registrasi_baptis`) REFERENCES `registrasi_baptis` (`id_registrasi_baptis`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `fk_province_id_city` FOREIGN KEY (`province_id`) REFERENCES `province` (`province_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detail_pindah`
--
ALTER TABLE `detail_pindah`
  ADD CONSTRAINT `fk_id_jemaat_pindah` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `det_registrasi_jemaat`
--
ALTER TABLE `det_registrasi_jemaat`
  ADD CONSTRAINT `fk_id_jemaat_det_registrasi_jemaat` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_registrasi_det_registrasi_jemaat` FOREIGN KEY (`id_registrasi`) REFERENCES `registrasi_jemaat` (`id_registrasi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_status_det_registrasi_jemaat` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `distrik`
--
ALTER TABLE `distrik`
  ADD CONSTRAINT `fk_id_kota_distrik` FOREIGN KEY (`id_kota`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `gereja`
--
ALTER TABLE `gereja`
  ADD CONSTRAINT `fk_id_jenis_gereja_gereja` FOREIGN KEY (`id_jenis_gereja`) REFERENCES `jenis_gereja` (`id_jenis_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_kota_gereja` FOREIGN KEY (`id_kota`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_ressort_gereja` FOREIGN KEY (`id_ressort`) REFERENCES `ressort` (`id_ressort`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `head_pindah`
--
ALTER TABLE `head_pindah`
  ADD CONSTRAINT `fk_id_gereja_head_pindah` FOREIGN KEY (`id_gereja`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_head_pindah` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jenis_registrasi_head_pindah` FOREIGN KEY (`id_jenis_registrasi`) REFERENCES `jenis_registrasi` (`id_jenis_registrasi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_registrasi_head_pindah` FOREIGN KEY (`id_registrasi`) REFERENCES `registrasi_jemaat` (`id_registrasi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `head_transaksi`
--
ALTER TABLE `head_transaksi`
  ADD CONSTRAINT `fk_id_jemaat_head_transaksi` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jadwal_ibadah`
--
ALTER TABLE `jadwal_ibadah`
  ADD CONSTRAINT `fk_id_jam_kegiatan_jadwal_ibadah` FOREIGN KEY (`id_jam_kegiatan`) REFERENCES `jam_kegiatan` (`id_jam_kegiatan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jenis_minggu_jadwal_ibadah` FOREIGN KEY (`id_jenis_minggu`) REFERENCES `jenis_minggu` (`id_jenis_minggu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_melayani_jadwal_ibadah` FOREIGN KEY (`id_jadwal_ibadah`) REFERENCES `majelis` (`id_majelis`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jam_kegiatan`
--
ALTER TABLE `jam_kegiatan`
  ADD CONSTRAINT `fk_id_gereja_jam_kegiatan` FOREIGN KEY (`id_gereja`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jam_kegiatan_jenis_kegiatan` FOREIGN KEY (`id_jam_kegiatan`) REFERENCES `jenis_kegiatan` (`id_jenis_kegiatan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jemaat`
--
ALTER TABLE `jemaat`
  ADD CONSTRAINT `fk_id_bidang_pendidikan_jemaat` FOREIGN KEY (`id_bidang_pendidikan`) REFERENCES `bidang_pendidikan` (`id_bidang_pendidikan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_hub_keluarga_jemaat` FOREIGN KEY (`id_hub_keluarga`) REFERENCES `hubungan_keluarga` (`id_hub_keluarga`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_kota_jemaat` FOREIGN KEY (`id_kota`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_pekerjaan_jemaat` FOREIGN KEY (`id_pekerjaan`) REFERENCES `pekerjaan` (`id_pekerjaan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_pendidikan_jemaat` FOREIGN KEY (`id_pendidikan`) REFERENCES `pendidikan` (`id_pendidikan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_registrasi_jemaat` FOREIGN KEY (`id_registrasi`) REFERENCES `registrasi_jemaat` (`id_registrasi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_status_pernikahan_jemaat` FOREIGN KEY (`id_status_pernikahan`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `jemaat_hadir`
--
ALTER TABLE `jemaat_hadir`
  ADD CONSTRAINT `fk_id_jadwal_ibadah_jemaat_hadir` FOREIGN KEY (`id_jadwal_ibadah`) REFERENCES `jadwal_ibadah` (`id_jadwal_ibadah`);

--
-- Constraints for table `majelis`
--
ALTER TABLE `majelis`
  ADD CONSTRAINT `fk_id_gereja_majelis` FOREIGN KEY (`id_gereja`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_majelis` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_pelayan_majelis` FOREIGN KEY (`id_pelayan`) REFERENCES `pelayan_gereja` (`id_pelayan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_status_pelayanan_majelis` FOREIGN KEY (`id_status_pelayanan`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mejelis_lingkungan`
--
ALTER TABLE `mejelis_lingkungan`
  ADD CONSTRAINT `fk_id_majelis_majelis_lingkungan` FOREIGN KEY (`id_majelis`) REFERENCES `majelis` (`id_majelis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_wijk_majelis_lingkungan` FOREIGN KEY (`id_wijk`) REFERENCES `wijk` (`id_wijk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `meninggal`
--
ALTER TABLE `meninggal`
  ADD CONSTRAINT `fk_id_gereja_meninggal` FOREIGN KEY (`id_gereja`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_meninggal` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_status_meninggal` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pelayan_gereja`
--
ALTER TABLE `pelayan_gereja`
  ADD CONSTRAINT `fk_id_jemaat_pelayan_gereja` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pelayan_ibadah`
--
ALTER TABLE `pelayan_ibadah`
  ADD CONSTRAINT `fk_id_pelayanan_ibadah_pelayanan_ibadah` FOREIGN KEY (`id_pelayanan_ibadah`) REFERENCES `pelayanan_ibadah` (`id_pelayanan_ibadah`);

--
-- Constraints for table `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD CONSTRAINT `fk_id_bank_pemasukan` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id_bank`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_pemasukan` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_kategori_pemasukan_pemasukan` FOREIGN KEY (`id_kategori_pemasukan`) REFERENCES `kategori_pemasukan` (`id_kategori_pemasukan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `fk_id_bank_pengeluaran` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id_bank`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_kategori_pengeluaran` FOREIGN KEY (`id_kategori_pengeluaran`) REFERENCES `detail_pengeluaran` (`id_pengeluaran`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pernikahan`
--
ALTER TABLE `pernikahan`
  ADD CONSTRAINT `fk_registrasi_nikah_pernikahan` FOREIGN KEY (`id_registrasi_pernikahan`) REFERENCES `registrasi_pernikahan` (`id_registrasi_nikah`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `gereja_id_pernikahan` FOREIGN KEY (`id_gereja`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `gereja_nikah_id_pernikahan` FOREIGN KEY (`id_gereja_nikah`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `status_id_pernikahan` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pernikahan_jemaat`
--
ALTER TABLE `pernikahan_jemaat`
  ADD CONSTRAINT `fk_id_jemaat_laki_pernikahan_jemaat` FOREIGN KEY (`id_jemaat_laki`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_perempuan_pernikahan_jemaat` FOREIGN KEY (`id_jemaat_perempuan`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_pernikahan_pernikahan_jemaat` FOREIGN KEY (`id_pernikahan`) REFERENCES `pernikahan` (`id_pernikahan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `fk_id_country_province` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `registrasi_baptis`
--
ALTER TABLE `registrasi_baptis`
  ADD CONSTRAINT `fk_id_gereja_baptis_registrasi_baptis` FOREIGN KEY (`id_gereja_baptis`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_hub_keluarga_registrasi_baptis` FOREIGN KEY (`id_hub_keluarga`) REFERENCES `hubungan_keluarga` (`id_hub_keluarga`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_pendeta_registrasi_baptis` FOREIGN KEY (`id_pendeta`) REFERENCES `pelayan_gereja` (`id_pelayan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_status_registrasi_baptis` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registrasi_calon_mempelai`
--
ALTER TABLE `registrasi_calon_mempelai`
  ADD CONSTRAINT `fk_id_gereja_laki_registrasi_calon_mempelai` FOREIGN KEY (`id_gereja_laki`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_gereja_perempuan_registrasi_calon_mempelai` FOREIGN KEY (`id_gereja_perempuan`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_laki_registrasi_calon_mempelai` FOREIGN KEY (`id_jemaat_laki`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_perempuan_registrasi_calon_mempelai` FOREIGN KEY (`id_jemaat_perempuan`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registrasi_nikah_registrasi_calon_mempelai` FOREIGN KEY (`id_registrasi_nikah`) REFERENCES `registrasi_pernikahan` (`id_registrasi_nikah`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registrasi_jemaat`
--
ALTER TABLE `registrasi_jemaat`
  ADD CONSTRAINT `fk_id_gereja_registrasi_jemaat` FOREIGN KEY (`id_gereja`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jenis_register_registrasi_jemaat` FOREIGN KEY (`id_jenis_register`) REFERENCES `jenis_registrasi` (`id_jenis_registrasi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_status_registrasi_registrasi_jemaat` FOREIGN KEY (`id_status_registrasi`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_wijk_registrasi_jemaat` FOREIGN KEY (`id_wijk`) REFERENCES `wijk` (`id_wijk`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `registrasi_pernikahan`
--
ALTER TABLE `registrasi_pernikahan`
  ADD CONSTRAINT `gereja_id_registrasi_pernikahan` FOREIGN KEY (`id_gereja`) REFERENCES `gereja` (`id_gereja`),
  ADD CONSTRAINT `gereja_martumpol_id_registrasi_pernikahan` FOREIGN KEY (`id_gereja_martumpol`) REFERENCES `gereja` (`id_gereja`),
  ADD CONSTRAINT `gereja_pemberkatan_id_registrasi_pernikahan` FOREIGN KEY (`id_gereja_pemberkatan`) REFERENCES `gereja` (`id_gereja`),
  ADD CONSTRAINT `status_reg_nikah_registrasi_pernikahan` FOREIGN KEY (`id_status_reg_nikah`) REFERENCES `status` (`id_status`);

--
-- Constraints for table `registrasi_sidi`
--
ALTER TABLE `registrasi_sidi`
  ADD CONSTRAINT `fk_id_gereja_sidi_registrasi_sidi` FOREIGN KEY (`id_gereja_sidi`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_hub_keluarga_registrasi_sidi` FOREIGN KEY (`id_hub_keluarga`) REFERENCES `hubungan_keluarga` (`id_hub_keluarga`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_registrasi_sidi` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_status_registrasi_sidi` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ressort`
--
ALTER TABLE `ressort`
  ADD CONSTRAINT `fk_id_distrik_ressort` FOREIGN KEY (`id_distrik`) REFERENCES `distrik` (`id_distrik`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_kota_ressort` FOREIGN KEY (`id_kota`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rpp`
--
ALTER TABLE `rpp`
  ADD CONSTRAINT `fk_id_gereja_rpp` FOREIGN KEY (`id_gereja`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_rpp` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jenis_rpp_rpp` FOREIGN KEY (`id_jenis_rpp`) REFERENCES `jenis_rpp` (`id_jenis_rpp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_status_rpp` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sidi`
--
ALTER TABLE `sidi`
  ADD CONSTRAINT `fk_id_gereja_sidi_sidi` FOREIGN KEY (`id_gereja_sidi`) REFERENCES `gereja` (`id_gereja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_jemaat_sidi` FOREIGN KEY (`id_jemaat`) REFERENCES `jemaat` (`id_jemaat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_status_sidi` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registrasi_sidi_sidi` FOREIGN KEY (`id_registrasi_sidi`) REFERENCES `registrasi_sidi` (`id_registrasi_sidi`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `fk_id_jenis_status_status` FOREIGN KEY (`id_jenis_status`) REFERENCES `jenis_status` (`id_jenis_status`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
