-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2022 at 02:54 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transport_company`
--
CREATE DATABASE IF NOT EXISTS `transport_company` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `transport_company`;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `ID` int(11) NOT NULL,
  `MODEL` varchar(20) NOT NULL,
  `CAPACITY` int(50) NOT NULL,
  `fk_driver` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`ID`, `MODEL`, `CAPACITY`, `fk_driver`) VALUES
(3, 'Renault', 150, 3),
(36, 'Mercedes', 30, 5);

-- --------------------------------------------------------

--
-- Table structure for table `bus_station`
--

CREATE TABLE `bus_station` (
  `ID` int(11) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `fk_bus_station_adress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus_station`
--

INSERT INTO `bus_station` (`ID`, `phone_number`, `fk_bus_station_adress`) VALUES
(1, '02635945', 19),
(2, '06767029856', 12);

-- --------------------------------------------------------

--
-- Table structure for table `bus_station_adress`
--

CREATE TABLE `bus_station_adress` (
  `ID` int(11) NOT NULL,
  `street_name` varchar(15) NOT NULL,
  `haus_number` int(11) NOT NULL,
  `zip_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus_station_adress`
--

INSERT INTO `bus_station_adress` (`ID`, `street_name`, `haus_number`, `zip_code`) VALUES
(12, 'Am Hauptbahnhof', 1, 1100),
(19, 'Erdberg', 26, 1110);

-- --------------------------------------------------------

--
-- Table structure for table `bus_stop`
--

CREATE TABLE `bus_stop` (
  `ID` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `fk_bus` int(11) NOT NULL,
  `fk_route` int(11) NOT NULL,
  `fk_bus_station` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus_stop`
--

INSERT INTO `bus_stop` (`ID`, `order_number`, `fk_bus`, `fk_route`, `fk_bus_station`) VALUES
(22, 33, 3, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `ID` int(11) NOT NULL,
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`ID`, `name`) VALUES
(26, 'Baden'),
(56, 'Vienna');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`ID`, `first_name`, `last_name`) VALUES
(1, 'Mario', 'Nikolic'),
(2, 'Robert', 'Letter'),
(3, 'Marta', 'Yellow'),
(4, 'Edith', 'Black'),
(5, 'Rahel', 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `ID` int(11) NOT NULL,
  `distance_km` int(11) NOT NULL,
  `fk_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`ID`, `distance_km`, `fk_city`) VALUES
(2, 120, 56),
(23, 200, 26);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_driver` (`fk_driver`);

--
-- Indexes for table `bus_station`
--
ALTER TABLE `bus_station`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_bus_station_adress` (`fk_bus_station_adress`);

--
-- Indexes for table `bus_station_adress`
--
ALTER TABLE `bus_station_adress`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bus_stop`
--
ALTER TABLE `bus_stop`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_bus` (`fk_bus`),
  ADD KEY `fk_route` (`fk_route`),
  ADD KEY `fk_bus_station` (`fk_bus_station`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_city` (`fk_city`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `bus_station`
--
ALTER TABLE `bus_station`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bus_station_adress`
--
ALTER TABLE `bus_station_adress`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `bus_stop`
--
ALTER TABLE `bus_stop`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`fk_driver`) REFERENCES `driver` (`ID`);

--
-- Constraints for table `bus_station`
--
ALTER TABLE `bus_station`
  ADD CONSTRAINT `bus_station_ibfk_1` FOREIGN KEY (`fk_bus_station_adress`) REFERENCES `bus_station_adress` (`ID`);

--
-- Constraints for table `bus_stop`
--
ALTER TABLE `bus_stop`
  ADD CONSTRAINT `bus_stop_ibfk_1` FOREIGN KEY (`fk_bus`) REFERENCES `bus` (`ID`),
  ADD CONSTRAINT `bus_stop_ibfk_2` FOREIGN KEY (`fk_route`) REFERENCES `route` (`ID`),
  ADD CONSTRAINT `bus_stop_ibfk_3` FOREIGN KEY (`fk_bus_station`) REFERENCES `bus_station` (`ID`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`fk_city`) REFERENCES `city` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
