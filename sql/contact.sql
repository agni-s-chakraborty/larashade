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
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `subject`, `message`, `created_at`, `status`) VALUES
(12, 'DonaldHaw', 'no-replyunsasty@gmail.com', NULL, 'Delivery of your email messages.', 'Hello!  oknitech.com \r\n \r\nDid you know that it is possible to send proposal wholly legal? \r\nWe proffer a new legal way of sending business offer through feedback forms. Such forms are located on many sites. \r\nWhen such business proposals are sent, no personal data is used, and messages are sent to forms specifically designed to receive messages and appeals. \r\nalso, messages sent through contact Forms do not get into spam because such messages are considered important. \r\nWe offer you to test our service for free. We will send up to 50,000 messages for you. \r\nThe cost of sending one million messages is 49 USD. \r\n \r\nThis message is created automatically. Please use the contact details below to contact us. \r\n \r\nContact us. \r\nTelegram - @FeedbackMessages \r\nSkype  live:contactform_18 \r\nWhatsApp - +375259112693', '2021-01-27 15:28:00', '1'),
(13, 'Vena Weissnat', 'delgadomariano@hotmail.com', NULL, 'Alabama', 'New Hampshire', '2021-03-17 06:09:00', '1'),
(14, 'Elias Ernser', 'leannhilton@hotmail.com', NULL, '24/7', 'Consultant', '2021-03-19 03:50:00', '1'),
(15, 'Ulysses', 'lamson.ulysses@googlemail.com', NULL, 'OKNITECH', 'Morning\r\n\r\nWholesale Medical Surgical Masks for both adult and kids - Buy Now as Low as $0.19/mask\r\n\r\nShop now: pharmacyoutlets.online\r\n\r\nAll the best,\r\n\r\nUlysses\r\nOKNITECH', '2021-03-19 07:56:00', '1'),
(62, 'Agni Chakraborty', 'agnioffice10@gmail.com', '97867575', 'Hello', 'hgfgygg', '2021-06-15 23:25:00', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
