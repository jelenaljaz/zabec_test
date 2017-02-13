-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2017 at 12:01 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zabec_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `countryId` int(11) NOT NULL,
  `countryName` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countryCode` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`countryId`, `countryName`, `countryCode`) VALUES
(1, 'Slovenia', 'si-SI'),
(2, 'United States', 'en-US');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userFirstName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userLastName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userEmail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userCountry` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userFirstName`, `userLastName`, `userEmail`, `userCountry`) VALUES
(1, 'Aljaž', 'Jelen', 'jelenaljaz94@gmail.com', 1),
(2, 'John', 'Smith', 'john.smith@example.com', 2),
(3, 'Jane', 'Smith', 'janesmith@email.net', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`countryId`),
  ADD UNIQUE KEY `countryId_UNIQUE` (`countryId`),
  ADD UNIQUE KEY `countryName_UNIQUE` (`countryName`),
  ADD UNIQUE KEY `countryCode_UNIQUE` (`countryCode`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`,`userCountry`),
  ADD UNIQUE KEY `userId_UNIQUE` (`userId`),
  ADD KEY `userCountry_idx` (`userCountry`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `countryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `userCountry` FOREIGN KEY (`userCountry`) REFERENCES `country` (`countryId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
