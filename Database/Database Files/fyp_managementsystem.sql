-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2022 at 09:55 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fyp_managementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `A_ID` varchar(5) NOT NULL,
  `C_ID` varchar(5) NOT NULL,
  `Day` date NOT NULL,
  `Time` time NOT NULL,
  `Count` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `C_ID` varchar(5) NOT NULL,
  `Name` char(30) NOT NULL,
  `Desc` text NOT NULL,
  `Credits` int(1) NOT NULL,
  `Hours` time NOT NULL,
  `Semester` int(1) NOT NULL,
  `Section` int(1) NOT NULL,
  `D_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `courses_of_student`
--

CREATE TABLE `courses_of_student` (
  `roll_Number` varchar(7) NOT NULL,
  `S_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `departmant`
--

CREATE TABLE `departmant` (
  `D_ID` int(3) NOT NULL,
  `Name` char(30) NOT NULL,
  `Desc` text NOT NULL,
  `Incharge` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `encodings`
--

CREATE TABLE `encodings` (
  `roll_Number` varchar(7) NOT NULL,
  `Encoding1` mediumtext NOT NULL,
  `Encoding2` mediumtext NOT NULL,
  `Encoding3` mediumtext NOT NULL,
  `Encoding4` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `S_ID` varchar(5) NOT NULL,
  `C_ID` varchar(5) NOT NULL,
  `D_ID` int(3) NOT NULL,
  `Semester` int(1) NOT NULL,
  `Section` char(1) NOT NULL,
  `T_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `roll_Number` varchar(7) NOT NULL,
  `Name` char(30) NOT NULL,
  `Address` text NOT NULL,
  `CNIC` int(13) NOT NULL,
  `phone_No` int(11) NOT NULL,
  `Gender` char(1) NOT NULL,
  `DOB` date NOT NULL,
  `D_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `T_ID` int(5) NOT NULL,
  `Name` char(30) NOT NULL,
  `Address` text NOT NULL,
  `CNIC` int(13) NOT NULL,
  `phone_No` int(11) NOT NULL,
  `Gender` char(1) NOT NULL,
  `DOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`A_ID`),
  ADD KEY `attendance_course_fk_1` (`C_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`C_ID`),
  ADD UNIQUE KEY `name` (`Name`),
  ADD KEY `course_department_fk_1` (`D_ID`);

--
-- Indexes for table `courses_of_student`
--
ALTER TABLE `courses_of_student`
  ADD KEY `roll_Number` (`roll_Number`),
  ADD KEY `cof_sections_fk_2` (`S_ID`);

--
-- Indexes for table `departmant`
--
ALTER TABLE `departmant`
  ADD PRIMARY KEY (`D_ID`),
  ADD UNIQUE KEY `name` (`Name`),
  ADD KEY `Incharge` (`Incharge`) USING BTREE;

--
-- Indexes for table `encodings`
--
ALTER TABLE `encodings`
  ADD PRIMARY KEY (`roll_Number`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`S_ID`),
  ADD UNIQUE KEY `combination` (`D_ID`,`Semester`,`Section`),
  ADD KEY `T_ID` (`T_ID`),
  ADD KEY `section_course_fk_3` (`C_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`roll_Number`),
  ADD UNIQUE KEY `cnic` (`CNIC`),
  ADD KEY `student_department_fk_1` (`D_ID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`T_ID`),
  ADD UNIQUE KEY `CNIC` (`CNIC`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_course_fk_1` FOREIGN KEY (`C_ID`) REFERENCES `course` (`C_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_department_fk_1` FOREIGN KEY (`D_ID`) REFERENCES `departmant` (`D_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses_of_student`
--
ALTER TABLE `courses_of_student`
  ADD CONSTRAINT `cof_sections_fk_2` FOREIGN KEY (`S_ID`) REFERENCES `sections` (`S_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cof_students_fk_1` FOREIGN KEY (`roll_Number`) REFERENCES `student` (`roll_Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `departmant`
--
ALTER TABLE `departmant`
  ADD CONSTRAINT `department_teacher_fk_1` FOREIGN KEY (`Incharge`) REFERENCES `teacher` (`T_ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `encodings`
--
ALTER TABLE `encodings`
  ADD CONSTRAINT `encodings_students_fk_1` FOREIGN KEY (`roll_Number`) REFERENCES `student` (`roll_Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `section_course_fk_3` FOREIGN KEY (`C_ID`) REFERENCES `course` (`C_ID`),
  ADD CONSTRAINT `sections_department_fk_2` FOREIGN KEY (`D_ID`) REFERENCES `departmant` (`D_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sections_teacher_fk_1` FOREIGN KEY (`T_ID`) REFERENCES `teacher` (`T_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_department_fk_1` FOREIGN KEY (`D_ID`) REFERENCES `departmant` (`D_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
