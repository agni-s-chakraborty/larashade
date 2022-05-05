-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 07, 2022 at 09:02 PM
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
-- Table structure for table `platform`
--

CREATE TABLE `platform` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `uploaded_by` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `platform`
--

INSERT INTO `platform` (`id`, `name`, `type`, `logo`, `link`, `created_at`, `uploaded_by`, `status`) VALUES
(3, 'Facebook', 'Social Media', '<i class=\'fab fa-facebook mr-1\'></i>', 'https://www.facebook.com', '2020-10-26 20:44:00', 'Agni Chakraborty', '1'),
(4, 'Youtube', 'Social Media', '<i class=\'fab fa-youtube mr-1\'></i>', 'https://www.youtube.com', '2020-10-27 12:14:00', 'Agni Chakraborty', '1'),
(5, 'Quora', 'QnA Site', '<i class=\"fab fa-quora mr-1\"></i>', 'https://www.quora.com', '2020-10-27 12:25:00', 'Agni Chakraborty', '1'),
(6, 'LinkedIn', 'Social Media', '<i class=\'fa fas-linkedin\'></i>', 'https://www.linkedin.com', '2020-10-29 15:07:00', 'Agni Chakraborty', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `platform`
--
ALTER TABLE `platform`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `platform`
--
ALTER TABLE `platform`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
