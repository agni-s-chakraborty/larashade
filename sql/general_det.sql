-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 07, 2022 at 09:00 PM
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
-- Table structure for table `general_det`
--

CREATE TABLE `general_det` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `subtitle1` varchar(255) NOT NULL,
  `subtitle2` varchar(255) NOT NULL,
  `subtitle3` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `link_text` varchar(255) NOT NULL,
  `uploaded_by` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_det`
--

INSERT INTO `general_det` (`id`, `image`, `title`, `section`, `subtitle1`, `subtitle2`, `subtitle3`, `description`, `link`, `link_text`, `uploaded_by`, `created_at`, `status`) VALUES
(5, 'ff6e5512aa7983167eef6e9e457b093b.png', 'Fourth Created Forth Fill Moving Created Subdue Be', 'Causes', '$2500', '$1533', '', '', 'www.google.com', 'Read More', 'Azure Inc', '2021-06-26', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `general_det`
--
ALTER TABLE `general_det`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `general_det`
--
ALTER TABLE `general_det`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
