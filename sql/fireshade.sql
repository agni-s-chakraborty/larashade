-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 20, 2022 at 08:57 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fireshade`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dept_id` int(11) NOT NULL,
  `feat_id` int(11) NOT NULL,
  `read` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `write` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `update` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `remove` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apartment`
--

CREATE TABLE `apartment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photos` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_no` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `rent_amt` int(11) NOT NULL,
  `amenities` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rent_freq` enum('monthly','yearly','quarterly','halfyearly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `property_type` enum('family','single','shared') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'family',
  `occupant_type` enum('family','single','shared') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'family'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arrival_details`
--

CREATE TABLE `arrival_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mg_no` int(11) NOT NULL,
  `key_services` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `best_for` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `features` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arrival_price`
--

CREATE TABLE `arrival_price` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mg_no` int(11) NOT NULL,
  `price` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pack` enum('bronze','silver','gold') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bronze'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arrival_properties`
--

CREATE TABLE `arrival_properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mg_no` int(11) NOT NULL,
  `dep_airport` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arr_airport` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arr_flightno` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adults` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `infants` int(11) NOT NULL,
  `arr_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `hex` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `hex`) VALUES
(1, 'USD', 'US Dollar', '$', '&#36;'),
(2, 'EUR', 'Euro', '€', '&#8364;'),
(3, 'CAD', 'Canada Dollar', '$', '&#36;'),
(4, 'AED', 'UAE Dirham', 'د.إ', '&#1583;.&#1573;'),
(5, 'AFN', 'Afghanistan Afghani', 'Af', '&#65;&#102;'),
(6, 'ALL', 'Albania Lek', 'Lek', '&#76;&#101;&#107;'),
(7, 'AMD', 'Armenian Dram', 'AMD', 'AMD'),
(8, 'ANG', 'Netherlands Antilles Guilder', 'ƒ', '&#402;'),
(9, 'AOA', 'Kwanza', 'Kz', '&#75;&#122;'),
(10, 'ARS', 'Argentina Peso', '$', '&#36;'),
(11, 'AUD', 'Australia Dollar', '$', '&#36;'),
(12, 'AWG', 'Aruba Guilder', 'ƒ', '&#402;'),
(13, 'AZN', 'Azerbaijan New Manat', 'ман', '&#1084;&#1072;&#1085;'),
(14, 'BAM', 'Bosnia and Herzegovina Convertible Marka', 'KM', '&#75;&#77;'),
(15, 'BBD', 'Barbados Dollar', '$', '&#36;'),
(16, 'BDT', 'Bangladeshi taka', '৳', '&#2547;'),
(17, 'BGN', 'Bulgaria Lev', 'лв', '&#1083;&#1074;'),
(18, 'BHD', 'Bahraini Dinar', '.د.ب', '.&#1583;.&#1576;'),
(19, 'BIF', 'Burundi Franc', 'FBu', '&#70;&#66;&#117;'),
(20, 'BMD', 'Bermuda Dollar', '$', '&#36;'),
(21, 'BND', 'Brunei Darussalam Dollar', '$', '&#36;'),
(22, 'BOB', 'Bolivia Boliviano', '$b', '&#36;&#98;'),
(23, 'BRL', 'Brazil Real', 'R$', '&#82;&#36;'),
(24, 'BSD', 'Bahamas Dollar', '$', '&#36;'),
(25, 'BTN', 'Ngultrum', 'Nu.', '&#78;&#117;&#46;'),
(26, 'BWP', 'Botswana Pula', 'P', '&#80;'),
(27, 'BYR', 'Belarus Ruble', 'p.', '&#112;&#46;'),
(28, 'BZD', 'Belize Dollar', 'BZ$', '&#66;&#90;&#36;'),
(29, 'CDF', 'Congolese Franc', 'FC', '&#70;&#67;'),
(30, 'CHF', 'Switzerland Franc', 'CHF', '&#67;&#72;&#70;'),
(31, 'CLF', 'Unidad de Fomento', 'CLF', 'CLF'),
(32, 'CLP', 'Chile Peso', '$', '&#36;'),
(33, 'CNY', 'China Yuan Renminbi', '¥', '&#165;'),
(34, 'COP', 'Colombia Peso', '$', '&#36;'),
(35, 'CRC', 'Costa Rica Colon', '₡', '&#8353;'),
(36, 'CUP', 'Cuba Peso', 'CUP', 'CUP'),
(37, 'CVE', 'Cabo Verde Escudo', '$', '&#36;'),
(38, 'CZK', 'Czech Republic Koruna', 'Kč', '&#75;&#269;'),
(39, 'DJF', 'Djibouti Franc', 'Fdj', '&#70;&#100;&#106;'),
(40, 'DKK', 'Denmark Krone', 'kr', '&#107;&#114;'),
(41, 'DOP', 'Dominican Republic Peso', 'RD$', '&#82;&#68;&#36;'),
(42, 'DZD', 'Algerian Dinar', 'دج', '&#1583;&#1580;'),
(43, 'EGP', 'Egypt Pound', '£', '&#163;'),
(44, 'ETB', 'Ethiopian Birr', 'Br', '&#66;&#114;'),
(45, 'FJD', 'Fiji Dollar', '$', '&#36;'),
(46, 'FKP', 'Falkland Islands (Malvinas) Pound', '£', '&#163;'),
(47, 'GBP', 'United Kingdom Pound', '£', '&#163;'),
(48, 'GEL', 'Lari', 'ლ', '&#4314;'),
(49, 'GHS', 'Ghana Cedi', '¢', '&#162;'),
(50, 'GIP', 'Gibraltar Pound', '£', '&#163;'),
(51, 'GMD', 'Dalasi', 'D', '&#68;'),
(52, 'GNF', 'Guinea Franc', 'FG', '&#70;&#71;'),
(53, 'GTQ', 'Guatemala Quetzal', 'Q', '&#81;'),
(54, 'GYD', 'Guyana Dollar', '$', '&#36;'),
(55, 'HKD', 'Hong Kong Dollar', '$', '&#36;'),
(56, 'HNL', 'Honduras Lempira', 'L', '&#76;'),
(57, 'HRK', 'Croatia Kuna', 'kn', '&#107;&#110;'),
(58, 'HTG', 'Gourde', 'G', '&#71;'),
(59, 'HUF', 'Hungary Forint', 'Ft', '&#70;&#116;'),
(60, 'IDR', 'Indonesia Rupiah', 'Rp', '&#82;&#112;'),
(61, 'ILS', 'Israel Shekel', '₪', '&#8362;'),
(62, 'INR', 'India Rupee', '₹', '&#8377;'),
(63, 'IQD', 'Iraqi Dinar', 'ع.د', '&#1593;.&#1583;'),
(64, 'IRR', 'Iran Rial', '﷼', '&#65020;'),
(65, 'ISK', 'Iceland Krona', 'kr', '&#107;&#114;'),
(66, 'JEP', 'Jersey Pound', '£', '&#163;'),
(67, 'JMD', 'Jamaica Dollar', 'J$', '&#74;&#36;'),
(68, 'JOD', 'Jordanian Dinar', 'JD', '&#74;&#68;'),
(69, 'JPY', 'Japan Yen', '¥', '&#165;'),
(70, 'KES', 'Kenyan Shilling', 'KSh', '&#75;&#83;&#104;'),
(71, 'KGS', 'Kyrgyzstan Som', 'лв', '&#1083;&#1074;'),
(72, 'KHR', 'Cambodia Riel', '៛', '&#6107;'),
(73, 'KMF', 'Comoro Franc', 'CF', '&#67;&#70;'),
(74, 'KPW', 'Korea (North) Won', '₩', '&#8361;'),
(75, 'KRW', 'Korea (South) Won', '₩', '&#8361;'),
(76, 'KWD', 'Kuwaiti Dinar', 'د.ك', '&#1583;.&#1603;'),
(77, 'KYD', 'Cayman Islands Dollar', '$', '&#36;'),
(78, 'KZT', 'Kazakhstan Tenge', 'лв', '&#1083;&#1074;'),
(79, 'LAK', 'Laos Kip', '₭', '&#8365;'),
(80, 'LBP', 'Lebanon Pound', '£', '&#163;'),
(81, 'LKR', 'Sri Lanka Rupee', '₨', '&#8360;'),
(82, 'LRD', 'Liberia Dollar', '$', '&#36;'),
(83, 'LSL', 'Loti', 'L', '&#76;'),
(84, 'LTL', 'Lithuania Litas', 'Lt', '&#76;&#116;'),
(85, 'LVL', 'Latvia Lat', 'Ls', '&#76;&#115;'),
(86, 'LYD', 'Libyan Dinar', 'ل.د', '&#1604;.&#1583;'),
(87, 'MAD', 'Moroccan Dirham', 'د.م.', '&#1583;.&#1605;.'),
(88, 'MDL', 'Moldovan Leu', 'L', '&#76;'),
(89, 'MGA', 'Malagasy Ariary', 'Ar', '&#65;&#114;'),
(90, 'MKD', 'Macedonia Denar', 'ден', '&#1076;&#1077;&#1085;'),
(91, 'MMK', 'Kyat', 'K', '&#75;'),
(92, 'MNT', 'Mongolia Tughrik', '₮', '&#8366;'),
(93, 'MOP', 'Pataca', 'MOP$', '&#77;&#79;&#80;&#36;'),
(94, 'MRO', 'Mauritanian Ouguiya', 'UM', '&#85;&#77;'),
(95, 'MUR', 'Mauritius Rupee', '₨', '&#8360;'),
(96, 'MVR', 'Rufiyaa', '.ރ', '.&#1923;'),
(97, 'MWK', 'Kwacha', 'MK', '&#77;&#75;'),
(98, 'MXN', 'Mexico Peso', '$', '&#36;'),
(99, 'MYR', 'Malaysia Ringgit', 'RM', '&#82;&#77;'),
(100, 'MZN', 'Mozambique Metical', 'MT', '&#77;&#84;'),
(101, 'NAD', 'Namibia Dollar', '$', '&#36;'),
(102, 'NGN', 'Nigeria Naira', '₦', '&#8358;'),
(103, 'NIO', 'Nicaragua Cordoba', 'C$', '&#67;&#36;'),
(104, 'NOK', 'Norway Krone', 'kr', '&#107;&#114;'),
(105, 'NPR', 'Nepal Rupee', '₨', '&#8360;'),
(106, 'NZD', 'New Zealand Dollar', '$', '&#36;'),
(107, 'OMR', 'Oman Rial', '﷼', '&#65020;'),
(108, 'PAB', 'Panama Balboa', 'B/.', '&#66;&#47;&#46;'),
(109, 'PEN', 'Peru Nuevo Sol', 'S/.', '&#83;&#47;&#46;'),
(110, 'PGK', 'Kina', 'K', '&#75;'),
(111, 'PHP', 'Philippines Peso', '₱', '&#8369;'),
(112, 'PKR', 'Pakistan Rupee', '₨', '&#8360;'),
(113, 'PLN', 'Poland Zloty', 'zł', '&#122;&#322;'),
(114, 'PYG', 'Paraguay Guarani', 'Gs', '&#71;&#115;'),
(115, 'QAR', 'Qatar Riyal', '﷼', '&#65020;'),
(116, 'RON', 'Romania New Leu', 'lei', '&#108;&#101;&#105;'),
(117, 'RSD', 'Serbia Dinar', 'Дин.', '&#1044;&#1080;&#1085;&#46;'),
(118, 'RUB', 'Russia Ruble', 'руб', '&#1088;&#1091;&#1073;'),
(119, 'RWF', 'Rwanda Franc', 'ر.س', '&#1585;.&#1587;'),
(120, 'SAR', 'Saudi Arabia Riyal', '﷼', '&#65020;'),
(121, 'SBD', 'Solomon Islands Dollar', '$', '&#36;'),
(122, 'SCR', 'Seychelles Rupee', '₨', '&#8360;'),
(123, 'SDG', 'Sudanese Pound', '£', '&#163;'),
(124, 'SEK', 'Sweden Krona', 'kr', '&#107;&#114;'),
(125, 'SGD', 'Singapore Dollar', '$', '&#36;'),
(126, 'SHP', 'Saint Helena Pound', '£', '&#163;'),
(127, 'SLL', 'Leone', 'Le', '&#76;&#101;'),
(128, 'SOS', 'Somalia Shilling', 'S', '&#83;'),
(129, 'SRD', 'Suriname Dollar', '$', '&#36;'),
(130, 'STD', 'São Tomé and Príncipe Dobra', 'Db', '&#68;&#98;'),
(131, 'SVC', 'Salvadoran Colón', '$', '&#36;'),
(132, 'SYP', 'Syrian Pound', '£', '&#163;'),
(133, 'SZL', 'Swazi Lilangeni', 'L', '&#76;'),
(134, 'THB', 'Thai Baht', '฿', '&#3647;'),
(135, 'TJS', 'Tajikistani Somoni', 'TJS', '&#84;&#74;&#83;'),
(136, 'TMT', 'Turkmenistani Manat', 'm', '&#109;'),
(137, 'TND', 'Tunisian Dinar', 'د.ت', '&#1583;.&#1578;'),
(138, 'TOP', 'Tongan Pa’anga', 'T$', '&#84;&#36;'),
(139, 'TRY', 'Turkish Lira', '₺', '&#8378'),
(140, 'TTD', 'Trinidad and Tobago Dollar', '$', '&#36;'),
(141, 'TWD', 'New Taiwan Dollar', 'NT$', '&#78;&#84;&#36;'),
(142, 'TZS', 'Tanzanian Shilling', 'TZS', 'TZS'),
(143, 'UAH', 'Ukrainian Hryvnia', '₴', '&#8372;'),
(144, 'UGX', 'Ugandan Shilling', 'USh', '&#85;&#83;&#104;'),
(145, 'UYU', 'Uruguayan Peso', '$U', '&#36;&#85;'),
(146, 'UZS', 'Uzbekistani Som', 'лв', '&#1083;&#1074;'),
(147, 'VEF', 'Venezuelan Bolivar', 'Bs', '&#66;&#115;'),
(148, 'VND', 'Vietnamese Dong', '₫', '&#8363;'),
(149, 'VUV', 'Vanuatu Vatu', 'VT', '&#86;&#84;'),
(150, 'WST', 'Samoan Tālā', 'WS$', '&#87;&#83;&#36;'),
(151, 'XAF', 'Central African CFA Franc', 'FCFA', '&#70;&#67;&#70;&#65;'),
(152, 'XCD', 'East Caribbean Dollar', '$', '&#36;'),
(153, 'XOF', 'West African CFA Franc', 'XOF', 'XOF'),
(154, 'XPF', 'CFP Franc', 'F', '&#70;'),
(155, 'YER', 'Yemeni Rial', '﷼', '&#65020;'),
(156, 'ZAR', 'South African Rand', 'R', '&#82;'),
(157, 'ZMK', 'Zambian Kwacha', 'ZK', '&#90;&#75;'),
(158, 'ZWL', 'Zimbabwean Dollar', 'Z$', '&#90;&#36;');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departure_details`
--

CREATE TABLE `departure_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mg_no` int(11) NOT NULL,
  `key_services` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `best_for` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `features` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departure_price`
--

CREATE TABLE `departure_price` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mg_no` int(11) NOT NULL,
  `pack` enum('bronze','silver','gold') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bronze',
  `pack_price` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departure_properties`
--

CREATE TABLE `departure_properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mg_no` int(11) NOT NULL,
  `arr_airport` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dep_airport` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arr_flightno` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adults` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `infants` int(11) NOT NULL,
  `arr_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_company`
--

CREATE TABLE `flight_company` (
  `id` int(255) NOT NULL,
  `flight_co_name` varchar(255) NOT NULL,
  `flight_co_details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight_company`
--

INSERT INTO `flight_company` (`id`, `flight_co_name`, `flight_co_details`) VALUES
(5, 'British Airways', 'About British Airways'),
(6, 'Emirates', 'About Emirates');

-- --------------------------------------------------------

--
-- Table structure for table `flight_dest`
--

CREATE TABLE `flight_dest` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flight_number` int(11) NOT NULL,
  `from` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_price`
--

CREATE TABLE `flight_price` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flight_number` int(11) NOT NULL,
  `cabin_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seat_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ow_price` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flight_price`
--

INSERT INTO `flight_price` (`id`, `flight_number`, `cabin_type`, `seat_type`, `currency`, `ow_price`, `updated_at`) VALUES
(2, 5432122, 'Economy', 'Middle', 'US Dollar(USD, $)', '600', '2022-02-14');

-- --------------------------------------------------------

--
-- Table structure for table `flight_properties`
--

CREATE TABLE `flight_properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flight_number` int(11) NOT NULL,
  `flight_co` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flight_properties`
--

INSERT INTO `flight_properties` (`id`, `title`, `flight_number`, `flight_co`, `description`, `created_at`, `status`) VALUES
(1, 'Dubai to Nairobi Special Flight', 4, 'British Airways', 'New flight of British Airways', '2022-02-07', '1');

-- --------------------------------------------------------

--
-- Table structure for table `flight_schedule`
--

CREATE TABLE `flight_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flight_number` int(11) NOT NULL,
  `daysofweek` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departure` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arrival` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flight_schedule`
--

INSERT INTO `flight_schedule` (`id`, `flight_number`, `daysofweek`, `departure`, `arrival`) VALUES
(2, 5432122, 'Mon | Wed | Fri | Sun', '06:55', '03:49');

-- --------------------------------------------------------

--
-- Table structure for table `headfoot`
--

CREATE TABLE `headfoot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('header','footer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `contact`, `name`, `state`, `city`, `country`, `address`, `created_at`, `status`) VALUES
(1, '987654321', 'JW Mariott', 'Nairobi', 'Nairobi', 'Kenya', 'Nairobi Kenya', '2022-02-14', '1'),
(2, '3456789644', 'The Zone', 'Riyadh', 'Riyadh', 'UAE', 'Riyadh UAE', '2022-02-25', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_properties`
--

CREATE TABLE `hotel_properties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hotel_number` int(11) NOT NULL,
  `amenities` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `maplink` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotel_properties`
--

INSERT INTO `hotel_properties` (`id`, `hotel_number`, `amenities`, `maplink`, `about`, `created_at`) VALUES
(6, 1, 'Lorem ipsum dolor sit amet.', 'Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.', '<p><span style=\"font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\">Lorem ipsum dolor sit amet.&nbsp;</span><br></p>', '2022-02-25');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_rest`
--

CREATE TABLE `hotel_rest` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `close` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alcohol` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `liveband` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotel_rest`
--

INSERT INTO `hotel_rest` (`id`, `hotel_id`, `image`, `title`, `menu_file`, `open`, `close`, `alcohol`, `liveband`, `description`, `created_at`, `status`) VALUES
(4, 2, 'hero.png', 'The Pub', '1647798675-Illustration.pdf', '00:13', '05:14', '1', '1', '<p><strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span><br></p>', '2022-03-20', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lounge`
--

CREATE TABLE `lounge` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mg_no` int(11) NOT NULL,
  `adults` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `infants` int(11) NOT NULL,
  `price` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pack` enum('bronze','silver','gold') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bronze'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mgregister`
--

CREATE TABLE `mgregister` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mg_no` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mg_type` enum('arrival','departure','lounge','transfer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'arrival'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2022_02_05_160259_create_features_table', 2),
(13, '2022_02_06_063136_create_departments_table', 2),
(14, '2022_02_06_064011_create_access_table', 3),
(15, '2022_02_06_073620_create_page_table', 4),
(16, '2022_02_06_074026_create_section_table', 4),
(17, '2022_02_06_074358_create_headfoot_table', 4),
(18, '2022_02_06_143131_create_flight_price_table', 5),
(19, '2022_02_06_144445_create_flight_properties_table', 5),
(20, '2022_02_06_145718_create_flight_dest_table', 5),
(21, '2022_02_06_150140_create_flight_schedule_table', 5),
(22, '2022_02_06_152302_create_hotels_table', 6),
(23, '2022_02_06_152329_create_hotel_details_table', 6),
(24, '2022_02_06_153436_create_rooms_table', 7),
(25, '2022_02_06_153455_create_room_price_table', 8),
(26, '2022_02_07_014158_create_hotel_rest_table', 8),
(37, '2022_02_14_115645_create_arrival_details_table', 9),
(38, '2022_02_14_115902_create_arrival_properties_table', 9),
(39, '2022_02_14_115910_create_arrival_price_table', 9),
(40, '2022_02_14_115917_create_departure_details_table', 9),
(41, '2022_02_14_115924_create_departure_properties_table', 9),
(42, '2022_02_14_115931_create_departure_price_table', 9),
(43, '2022_02_14_115939_create_lounge_table', 9),
(44, '2022_02_14_115946_create_transfer_table', 9),
(45, '2022_02_14_115955_create_mgregister_table', 9),
(46, '2022_02_14_120055_create_apartment_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenities` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beds` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `persons` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `hotel_id`, `title`, `amenities`, `area`, `beds`, `persons`, `image`, `description`, `created_at`) VALUES
(2, 2, 'Deluxe Premium', '<p><span style=\"font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\">Lorem ipsum dolor sit amet. Totam vero ab aliquid esse et molestiae sunt quo ducimus consequatur eos soluta optio ea excepturi laborum.&nbsp;</span><br></p>', '500', '2', 3, NULL, '<p><span style=\"font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\">Lorem ipsum dolor sit amet. Totam vero ab aliquid esse et molestiae sunt quo ducimus consequatur eos soluta optio ea excepturi laborum.&nbsp;</span><br></p>', '2022-02-27');

-- --------------------------------------------------------

--
-- Table structure for table `room_price`
--

CREATE TABLE `room_price` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` int(11) NOT NULL,
  `basic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extras` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_percent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_price`
--

INSERT INTO `room_price` (`id`, `room_id`, `basic`, `extras`, `tax_percent`, `description`, `created_at`) VALUES
(2, 2, '2400', '600', '10', '<p><span style=\"font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\">Lorem ipsum dolor sit amet. Est eligendi atque qui cumque blanditiis et dolore repudiandae ut Quis numquam eos quisquam enim. Aut omnis aspernatur quo quos vero 33 temporibus aliquid non ratione error ad aperiam laudantium rem consectetur vero quo quod voluptatem. Aut voluptatibus sequi ut nihil sapiente aut internos dolorem et illum laborum rem illo ipsum aut rerum dolor.</span><br></p>', '2022-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `arr_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  `price` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pack` enum('bronze','silver','gold') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bronze'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('1','0','','') COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `status`, `department`, `created_at`) VALUES
(2, 'Normal User', 'user@gmail.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 0, '', '', '2022-01-22 18:30:00'),
(7, 'Agni Chakraborty', 'agnioffice10@gmail.com', NULL, '$2y$10$EEXOJlO4XZkKI8z2LNSsOu9gskGyLOS6X4mJYkiQ1orWp7nfVyH7q', 0, '', '', '2022-02-02 18:30:00'),
(8, 'Brian', 'brianmuhindi.dev@gmail.com', NULL, '$2y$10$sqXtl/ugaGMmnJWZ8cRyz.FkLKa170DM0HqTlJKS/uXetd1d78mHm', 1, '1', NULL, '2022-02-06 18:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apartment`
--
ALTER TABLE `apartment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrival_details`
--
ALTER TABLE `arrival_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrival_price`
--
ALTER TABLE `arrival_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrival_properties`
--
ALTER TABLE `arrival_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departure_details`
--
ALTER TABLE `departure_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departure_price`
--
ALTER TABLE `departure_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departure_properties`
--
ALTER TABLE `departure_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flight_company`
--
ALTER TABLE `flight_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flight_dest`
--
ALTER TABLE `flight_dest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flight_price`
--
ALTER TABLE `flight_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flight_properties`
--
ALTER TABLE `flight_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flight_schedule`
--
ALTER TABLE `flight_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `headfoot`
--
ALTER TABLE `headfoot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_properties`
--
ALTER TABLE `hotel_properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_rest`
--
ALTER TABLE `hotel_rest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lounge`
--
ALTER TABLE `lounge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mgregister`
--
ALTER TABLE `mgregister`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_price`
--
ALTER TABLE `room_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access`
--
ALTER TABLE `access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apartment`
--
ALTER TABLE `apartment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arrival_details`
--
ALTER TABLE `arrival_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arrival_price`
--
ALTER TABLE `arrival_price`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arrival_properties`
--
ALTER TABLE `arrival_properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departure_details`
--
ALTER TABLE `departure_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departure_price`
--
ALTER TABLE `departure_price`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departure_properties`
--
ALTER TABLE `departure_properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight_company`
--
ALTER TABLE `flight_company`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `flight_dest`
--
ALTER TABLE `flight_dest`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flight_price`
--
ALTER TABLE `flight_price`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `flight_properties`
--
ALTER TABLE `flight_properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `flight_schedule`
--
ALTER TABLE `flight_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `headfoot`
--
ALTER TABLE `headfoot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hotel_properties`
--
ALTER TABLE `hotel_properties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hotel_rest`
--
ALTER TABLE `hotel_rest`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lounge`
--
ALTER TABLE `lounge`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mgregister`
--
ALTER TABLE `mgregister`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `room_price`
--
ALTER TABLE `room_price`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
