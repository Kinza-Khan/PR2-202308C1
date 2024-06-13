-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 08:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pr08c1`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'faculty'),
(3, 'sro'),
(4, 'management');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('male','female') DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`id`, `name`, `salary`, `city`, `age`, `gender`, `dept_id`) VALUES
(1, 'ali', 85000, 'karachi', 20, 'male', 1),
(2, 'aqsa', 70000, 'lahore', 22, 'female', NULL),
(3, 'hamza', 75000, 'karachi', 23, 'male', NULL),
(4, 'Rafiya', 95000, 'multan', 21, 'female', NULL),
(5, 'sana', 70000, 'karachi', 23, 'female', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myallemp`
-- (See below for the actual view)
--
CREATE TABLE `myallemp` (
`empName` varchar(200)
,`salary` int(11)
,`department` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `stdId` int(11) NOT NULL,
  `stdudentName` varchar(10) DEFAULT NULL,
  `stdEmail` varchar(50) DEFAULT NULL,
  `stdAge` int(11) DEFAULT NULL,
  `stdCity` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`stdId`, `stdudentName`, `stdEmail`, `stdAge`, `stdCity`) VALUES
(1, 'behlol', 'behlol@gmail.com', 21, 'karachi'),
(2, 'aqsa', 'aqsa@gmail.com', 22, 'lahore'),
(3, 'hamza', 'hamza@gmail.com', 21, 'karachi'),
(4, 'sana', 'sana@gmail.com', 22, 'lahore');

-- --------------------------------------------------------

--
-- Structure for view `myallemp`
--
DROP TABLE IF EXISTS `myallemp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myallemp`  AS SELECT `employe`.`name` AS `empName`, `employe`.`salary` AS `salary`, `department`.`name` AS `department` FROM (`employe` join `department` on(`employe`.`dept_id` = `department`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`stdId`),
  ADD UNIQUE KEY `stdEmail` (`stdEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emp`
--
ALTER TABLE `emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `stdId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
