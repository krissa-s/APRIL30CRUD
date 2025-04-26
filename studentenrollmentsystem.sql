-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2025 at 09:28 AM
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
-- Database: `studentenrollmentsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_code` varchar(255) DEFAULT NULL,
  `course_desc` varchar(255) DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_code`, `course_desc`, `units`) VALUES
(21, 'CC225', 'Information Management', '3'),
(22, 'CC226', 'Advance Database Management System', '3'),
(23, 'IPT222', 'Integrative Programming And Technologies', '3'),
(24, 'PATHFIT4', 'Physical Education', '2'),
(25, 'QUAMETH222', 'Quantitative Method', '3'),
(30, 'IPS', 'Indigenous People', '2');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `enrollment_date` varchar(255) DEFAULT NULL,
  `stud_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `enrollment_date`, `stud_id`, `course_id`) VALUES
(101, '01-20-2020', 11, 21),
(102, '02-22-2021', 12, 22),
(103, '03-23-2022', 13, 23),
(104, '04-24-2023', 14, 24),
(105, '05-30-2025', 15, 25),
(106, '06-27-2005', 11, 21);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stud_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_initial` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_add` varchar(255) DEFAULT NULL,
  `student_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stud_id`, `first_name`, `middle_initial`, `last_name`, `email_add`, `student_type`) VALUES
(11, 'Mark', 'B', 'Lee', 'marklee@gmail.com', 'Regular'),
(12, 'Chenle', 'B', 'Zhong', 'zhongchenle@gmail.com', 'Regular'),
(13, 'Renjun', 'C', 'Huang', 'huangrenjun@gmail.com', 'Irregular'),
(14, 'Johnny', 'D', 'Suh', 'johnnysuh@gmail.com', 'Regular'),
(15, 'Jaehyun', 'E', 'Jeong', 'jeongjaehyun@gmail.com', 'Irregular'),
(16, 'Yunjin', 'H', 'Huh', 'huhyunjin@gmail.com', 'Irregular');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `stud_id` (`stud_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stud_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`stud_id`) REFERENCES `student` (`stud_id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
