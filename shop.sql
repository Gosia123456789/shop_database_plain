-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2021 at 01:16 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `county` varchar(40) NOT NULL,
  `town` varchar(50) NOT NULL,
  `street` varchar(80) NOT NULL,
  `house_number` varchar(8) NOT NULL,
  `flat_number` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adress`
--

INSERT INTO `adress` (`id`, `country`, `post_code`, `county`, `town`, `street`, `house_number`, `flat_number`) VALUES
(1, 'UK', 'HG1 2TR', 'North Yorkshire', 'Harrogate', 'Harrogate Street', '34', '11d'),
(2, 'Ireland', ' D01 B2CD', 'Dublin', 'Dublin', 'Dublin Avenue', '111', '89'),
(3, 'UK', 'SE2 3RT', 'Greater London', 'London', 'London Street', '3', '42'),
(4, 'UK', 'NW1 1OU', 'Greater London', 'London', 'London Avenue', '111c', '1'),
(5, 'UK', 'SE2 3RT', 'Midlothian', 'Edinburgh', 'Edinburgh Avenue', '1', '20'),
(6, 'UK', 'SE1 ZR2', 'Greater London', 'London', 'London Crescent', '40c', '110');

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `total` varchar(11) NOT NULL,
  `date_of_purchase` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `adress_id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `surname`, `email`, `phone_number`, `adress_id`, `login`, `password`) VALUES
(1, 'John', 'Smith', 'jsmith@gmail.com', '1234567890', 1, 'john', 'cd00317231bec736cf6c44fe2648102ec1b67ef1'),
(2, 'Hannah', 'Smith', 'hannahsmith@gmail.com', '1230987233321', 3, 'smithhannah', 'aafdc23870ecbcd3d557b6423a8982134e17927e'),
(3, 'Andrew', 'Windsor', 'andrewwindsor@.gmail.com', '+223837352000', 2, 'andrewW', '367ff07e4895c14008ae67fb6d0bd8deb80fb6ae'),
(4, 'John', 'Black', 'johny123b@.gmail.com', '8766554442', 4, 'johny123', '22cbf19c99ece82e974b941b235dda73f9292d47'),
(5, 'Daisy', 'MacDonald', 'MacDD@.gmail.com', '455999838383', 5, 'daizyMacDonald', '62dec9604e3d43ea0f134ca673f9ce917fbdb1d6'),
(6, 'Anna', 'Windsor', 'andrewwindsor@.gmail.com', '+130983646282636222', 3, 'WInA123', 'ee3351663d1001108722ac61916f3e986ae70fab');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `information` varchar(150) NOT NULL,
  `price` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `information`, `price`) VALUES
(1, 'garden chair', 'white, folding chair', '130GBP'),
(2, 'garden umbrella', 'folding umbrella, diameter: 2m', '250GBP'),
(3, 'garden table', 'wood protected from weather', '200GBP'),
(4, 'waterproof jacket', 'variety of colors and sizes', '90GBP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id` (`products_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adress_id` (`adress_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adress`
--
ALTER TABLE `adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`adress_id`) REFERENCES `adress` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
