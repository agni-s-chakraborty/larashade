-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 07, 2022 at 09:01 PM
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
-- Database: `ovacado`
--

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(255) NOT NULL,
  `menu` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `shortdesc` varchar(255) NOT NULL,
  `longdesc` text NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `menu`, `title`, `shortdesc`, `longdesc`, `updated_at`, `updated_by`) VALUES
(3, 'service', 'What is Marvel Comics??', 'Hello World mu', 'hkgku mj', '2020-10-15 20:45:00', 'Agni Chakraborty'),
(4, 'gallery', 'What is gallery?', 'Gellery is here', '', '2020-10-15 20:57:00', 'Agni Chakraborty'),
(5, 'testimonials', '', '', '', '0000-00-00 00:00:00', ''),
(6, 'howwework', 'WHAT MAKES OKNITECH UNIQUE?', '', '', '2021-01-03 05:23:00', 'Agni Chakraborty'),
(7, 'clients', 'Our Technologies', 'Our clients are at the core of our success. We are very proud of the work we do. This is represented in how our sites look and function, and how our clients think about us.', '', '2021-01-04 04:57:00', 'Agni Chakraborty'),
(8, 'faq', 'FAQ', '', '', '2021-01-03 05:16:00', 'Agni Chakraborty'),
(9, 'jobs', '', '', '', '0000-00-00 00:00:00', ''),
(10, 'team', 'Fifty Shades Of Grey', 'Hello World', 'j,bk.jnl; lklkplk jkhkjjk kjhkjkjm', '2020-10-16 09:00:00', 'Agni Chakraborty'),
(11, 'pricing', 'Fifty Shades Of Grey', 'Gellery is here', '', '2020-10-16 17:55:00', 'Agni Chakraborty'),
(12, 'about', 'What is Lorem Ipsum?', 'Hello', 'asdfg qwerty lpoiujk', '2020-10-16 17:55:00', 'Agni Chakraborty');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
