-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2019 at 09:46 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `professional_connect`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AD_ID` int(255) NOT NULL,
  `AD_NAME` varchar(200) NOT NULL,
  `PASSWORD` varchar(250) NOT NULL,
  `PICTURES` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `back_list`
--

CREATE TABLE `back_list` (
  `BL_ID` int(255) NOT NULL,
  `PRO_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `connection`
--

CREATE TABLE `connection` (
  `CON_ID` int(255) NOT NULL,
  `TEXT` varchar(255) NOT NULL,
  `RATE_ID` int(255) NOT NULL,
  `DATE` date NOT NULL,
  `TIME` time(6) NOT NULL,
  `CUSTOMER_ID` int(200) NOT NULL,
  `TYPE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUSTOMER_ID` int(100) NOT NULL,
  `CUSTOMER_NAME` varchar(200) NOT NULL,
  `PICTURE` varchar(500) NOT NULL,
  `EMAIL` varchar(250) NOT NULL,
  `GENDER` tinyint(1) NOT NULL,
  `CNIC_NUMBER` int(100) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `DATE_OF_BIRTH` date NOT NULL,
  `CITY` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `NOT_ID` int(255) NOT NULL,
  `PAYMENT` int(255) NOT NULL,
  `RATE_ID` int(255) NOT NULL,
  `CUSTOMER_ID` int(255) NOT NULL,
  `TEXT` varchar(255) NOT NULL,
  `CON_ID` int(255) NOT NULL,
  `AD_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PAY_ID` int(255) NOT NULL,
  `TRANSACTION` float NOT NULL,
  `METHOD` varchar(2) NOT NULL,
  `MOBILE_NUMBER` int(200) NOT NULL,
  `RATE_ID` int(255) NOT NULL,
  `USER_ID` int(255) NOT NULL,
  `TIME` time(6) NOT NULL,
  `DATE` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `professional`
--

CREATE TABLE `professional` (
  `PRO_ID` int(100) NOT NULL,
  `PRO_NAME` varchar(200) NOT NULL,
  `PICTURE` tinyint(1) NOT NULL,
  `EMAIL` varchar(200) NOT NULL,
  `GENDER` tinyint(1) NOT NULL,
  `CNIC_NUMBER` int(100) NOT NULL,
  `PASSWORD` varchar(200) NOT NULL,
  `DATE_OF_BIRTH` date NOT NULL,
  `REVIEW` varchar(250) NOT NULL,
  `CITY` varchar(255) NOT NULL,
  `COUNTRY` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

CREATE TABLE `qualification` (
  `Q_ID` int(100) NOT NULL,
  `PRO_ID` int(100) NOT NULL,
  `PROFESSIONAL_TYPE` varchar(200) NOT NULL,
  `DEGREE` varchar(250) NOT NULL,
  `TYPE` varchar(200) NOT NULL,
  `DESIGNATION` varchar(150) NOT NULL,
  `EXPERINCE` varchar(200) NOT NULL,
  `MATRIC_CERTIFICATE` tinyint(1) NOT NULL,
  `INTERMEDIATE_CERTIFICATE` tinyint(1) NOT NULL,
  `FEES` int(11) NOT NULL,
  `UNIVERSITY_NAME` varchar(255) NOT NULL,
  `SCHOOL_NAME` varchar(255) NOT NULL,
  `COLLAGE_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rate`
--

CREATE TABLE `rate` (
  `RATE_ID` int(255) NOT NULL,
  `RATING` varchar(255) NOT NULL,
  `REVIEW` varchar(255) NOT NULL,
  `PRO_ID` int(255) NOT NULL,
  `CUSTOMER_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `SEARCH_ID` int(255) NOT NULL,
  `USER_ID` int(255) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) NOT NULL,
  `EXPERIENCE` int(11) NOT NULL,
  `PROFESSION` varchar(255) NOT NULL,
  `DATE` date NOT NULL,
  `TIME` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `SER_ID` int(255) NOT NULL,
  `FEED_BACK` varchar(255) NOT NULL,
  `RATE_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `USER_ID` int(255) NOT NULL,
  `CUSTOMER_ID` int(255) NOT NULL,
  `PRO_ID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AD_ID`);

--
-- Indexes for table `back_list`
--
ALTER TABLE `back_list`
  ADD PRIMARY KEY (`BL_ID`),
  ADD UNIQUE KEY `PRO_ID` (`PRO_ID`);

--
-- Indexes for table `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`CON_ID`),
  ADD UNIQUE KEY `RATE_ID` (`RATE_ID`),
  ADD UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUSTOMER_ID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`NOT_ID`),
  ADD UNIQUE KEY `FOREGIN KEY` (`AD_ID`),
  ADD UNIQUE KEY `CON_ID` (`CON_ID`),
  ADD UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD UNIQUE KEY `RATE_ID` (`RATE_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PAY_ID`),
  ADD UNIQUE KEY `RATE_ID` (`RATE_ID`),
  ADD UNIQUE KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `professional`
--
ALTER TABLE `professional`
  ADD PRIMARY KEY (`PRO_ID`);

--
-- Indexes for table `qualification`
--
ALTER TABLE `qualification`
  ADD PRIMARY KEY (`Q_ID`),
  ADD UNIQUE KEY `PROFESSIONAL_TYPE` (`PROFESSIONAL_TYPE`);

--
-- Indexes for table `rate`
--
ALTER TABLE `rate`
  ADD PRIMARY KEY (`RATE_ID`),
  ADD UNIQUE KEY `PRO_ID` (`PRO_ID`),
  ADD UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`SEARCH_ID`),
  ADD UNIQUE KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`SER_ID`),
  ADD UNIQUE KEY `RATE_ID` (`RATE_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD UNIQUE KEY `PRO_ID` (`PRO_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
