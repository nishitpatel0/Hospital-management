-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 03, 2025 at 04:25 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rachana_hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `Admin_id` int NOT NULL AUTO_INCREMENT,
  `Email_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Admin_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_id`, `Email_id`, `Admin_name`, `password`) VALUES
(1, 'rajesh@gmail.com', 'rajesh', 'rajesh123');

-- --------------------------------------------------------

--
-- Table structure for table `admit`
--

DROP TABLE IF EXISTS `admit`;
CREATE TABLE IF NOT EXISTS `admit` (
  `Admit_id` int NOT NULL AUTO_INCREMENT,
  `Patient_id` int NOT NULL,
  `Admit_Date` date NOT NULL,
  `Room_id` int NOT NULL,
  `Discharge_Date` date NOT NULL,
  `Description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Admit_id`),
  KEY `Patient_id` (`Patient_id`),
  KEY `Room_id` (`Room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admit`
--

INSERT INTO `admit` (`Admit_id`, `Patient_id`, `Admit_Date`, `Room_id`, `Discharge_Date`, `Description`) VALUES
(1, 1, '2023-10-22', 1, '2023-10-27', 'Good staff'),
(2, 3, '2023-03-01', 1, '2023-03-08', 'service is very good'),
(3, 2, '2024-08-02', 2, '2024-08-06', 'best service'),
(4, 4, '2024-11-15', 3, '2024-11-22', 'best staff\r\n');

-- --------------------------------------------------------

--
-- Stand-in structure for view `admitview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `admitview`;
CREATE TABLE IF NOT EXISTS `admitview` (
`Admit_Date` date
,`Admit_id` int
,`Description` text
,`Discharge_Date` date
,`Name` varchar(50)
,`Patient_id` int
,`Room_id` int
,`Type` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `Appointment_id` int NOT NULL AUTO_INCREMENT,
  `Patient_id` int NOT NULL,
  `Doctor_id` int NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Charge` int NOT NULL,
  `Complaints` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Appointment_id`),
  KEY `Patient_id` (`Patient_id`),
  KEY `Doctor_id` (`Doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Appointment_id`, `Patient_id`, `Doctor_id`, `Date`, `Time`, `Status`, `Type`, `Charge`, `Complaints`) VALUES
(1, 1, 1, '2024-02-03', '12:00:00', 'Confirm', 'New', 500, 'Doctor schedule not '),
(2, 2, 1, '2024-09-20', '05:00:00', 'confirm', 'new', 500, '-'),
(3, 3, 2, '2024-10-20', '02:00:00', 'confirm', 'new', 500, '-'),
(4, 4, 2, '2024-09-03', '11:00:00', 'pending', 'old', 300, 'pot prparley working'),
(5, 4, 2, '2025-03-31', '10:33:55', 'Pending', 'New', 500, 'stomach');

-- --------------------------------------------------------

--
-- Stand-in structure for view `appointmentview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `appointmentview`;
CREATE TABLE IF NOT EXISTS `appointmentview` (
`Appointment_id` int
,`Charge` int
,`Complaints` varchar(300)
,`Date` date
,`Doctor_id` int
,`Name` varchar(50)
,`Patient_id` int
,`pName` varchar(50)
,`Status` varchar(25)
,`Time` time
,`Type` varchar(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `appointment_type`
--

DROP TABLE IF EXISTS `appointment_type`;
CREATE TABLE IF NOT EXISTS `appointment_type` (
  `atype_id` int NOT NULL AUTO_INCREMENT,
  `CHARGE` int NOT NULL,
  `TYPE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`atype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointment_type`
--

INSERT INTO `appointment_type` (`atype_id`, `CHARGE`, `TYPE`) VALUES
(1, 500, 'New'),
(2, 300, 'Old');

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `Bill_id` int NOT NULL AUTO_INCREMENT,
  `Admit_id` int NOT NULL,
  `Treatment_charge` int NOT NULL,
  `Room_charge` int NOT NULL,
  `Operation_charge` int NOT NULL,
  `Doctor_charge` int NOT NULL,
  `Visit_doctor_charge` int NOT NULL,
  `Total_Amount` int NOT NULL,
  PRIMARY KEY (`Bill_id`),
  KEY `Admit_id` (`Admit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`Bill_id`, `Admit_id`, `Treatment_charge`, `Room_charge`, `Operation_charge`, `Doctor_charge`, `Visit_doctor_charge`, `Total_Amount`) VALUES
(1, 1, 1000, 500, 2000, 1500, 500, 5500),
(2, 2, 500, 1000, 800, 1000, 1200, 3500),
(3, 3, 1000, 1200, 800, 1000, 0, 3000),
(4, 4, 1000, 800, 1000, 0, 1200, 4000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `billview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `billview`;
CREATE TABLE IF NOT EXISTS `billview` (
`Admit_id` int
,`Bill_id` int
,`Doctor_charge` int
,`Name` varchar(50)
,`Operation_charge` int
,`Room_charge` int
,`Total_Amount` int
,`Treatment_charge` int
,`Visit_doctor_charge` int
);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `Doctor_id` int NOT NULL AUTO_INCREMENT,
  `Licence_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Degree` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Contact_no` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Visiting_charge` int NOT NULL,
  `New_case_charge` int NOT NULL,
  `Old_case_charge` int NOT NULL,
  `Emergency_charge` int NOT NULL,
  `Email_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Doctor_id`, `Licence_no`, `Name`, `Type`, `Degree`, `Gender`, `Contact_no`, `Visiting_charge`, `New_case_charge`, `Old_case_charge`, `Emergency_charge`, `Email_id`, `Password`) VALUES
(1, 'LIC1234', 'Dr. Smith', 'Cardiologist', 'MBBS', 'Male', '9147483647', 800, 1000, 400, 1000, 'drsmith@example.com', '12345'),
(2, 'LIC693', 'Dr.lakum', 'Main\r\n', 'M.d(ortho)', 'male', '97863645981', 0, 700, 400, 1000, 'lakum@gmail.com', 'lakum@123'),
(7, 'LIC520', 'Dr.Patel', 'Cardiologist', 'M.B.B.S.', 'Male', '9328659965', 500, 500, 300, 1000, 'lejl@gmail.com', '8262');

-- --------------------------------------------------------

--
-- Stand-in structure for view `doctorscheduleview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `doctorscheduleview`;
CREATE TABLE IF NOT EXISTS `doctorscheduleview` (
`Day` varchar(200)
,`Doctor_id` int
,`EndTime` time
,`Name` varchar(50)
,`Schedule_id` int
,`StartTime` time
);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule`
--

DROP TABLE IF EXISTS `doctor_schedule`;
CREATE TABLE IF NOT EXISTS `doctor_schedule` (
  `Schedule_id` int NOT NULL AUTO_INCREMENT,
  `Doctor_id` int NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `Day` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Schedule_id`),
  KEY `Doctor_id` (`Doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor_schedule`
--

INSERT INTO `doctor_schedule` (`Schedule_id`, `Doctor_id`, `StartTime`, `EndTime`, `Day`) VALUES
(1, 1, '11:00:00', '13:00:00', 'Monday to Saturaday'),
(2, 1, '05:00:00', '07:00:00', 'evening'),
(3, 2, '00:01:23', '01:01:02', 'Monday to Saturday');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `Feedback_id` int NOT NULL AUTO_INCREMENT,
  `Patient_id` int NOT NULL,
  `Feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Feedback_Date` date NOT NULL,
  PRIMARY KEY (`Feedback_id`),
  KEY `Patient_id` (`Patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`Feedback_id`, `Patient_id`, `Feedback`, `Feedback_Date`) VALUES
(1, 1, 'Good Service', '2024-06-02'),
(2, 1, 'not service', '2025-02-02'),
(3, 3, 'not service', '2025-08-14'),
(4, 1, 'not service', '2025-01-20'),
(5, 1, 'abc', '2025-02-13'),
(6, 3, 'Good service', '2025-03-06');

-- --------------------------------------------------------

--
-- Stand-in structure for view `feedbackview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `feedbackview`;
CREATE TABLE IF NOT EXISTS `feedbackview` (
`Feedback` text
,`Feedback_Date` date
,`Feedback_id` int
,`Name` varchar(50)
,`Patient_id` int
);

-- --------------------------------------------------------

--
-- Table structure for table `implants`
--

DROP TABLE IF EXISTS `implants`;
CREATE TABLE IF NOT EXISTS `implants` (
  `Implants_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Cost` int NOT NULL,
  `Brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Implants_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `implants`
--

INSERT INTO `implants` (`Implants_id`, `Name`, `Cost`, `Brand`, `Description`) VALUES
(1, 'Plate (5 cm)', 1000, 'ABC', 'Good plants'),
(2, 'Hand plate', 1000, 'abc ', 'good service'),
(3, 'L-shaped plate', 1200, 'abc', '-'),
(4, 'Lag screw', 500, 'abc', '-');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `Medicine_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Company_Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`Medicine_id`, `Name`, `Type`, `Company_Name`) VALUES
(1, 'Paracetamol', 'Tab', 'ABC Pharma'),
(2, 'Amoxicillin', 'Capsule', 'ABC Pharma'),
(3, 'L-Dio 1', 'INJ', 'Pharma'),
(4, 'praxing', 'bottle', 'abc phrama');

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
CREATE TABLE IF NOT EXISTS `operation` (
  `Op_id` int NOT NULL AUTO_INCREMENT,
  `Op_date` date NOT NULL,
  `Admit_id` int NOT NULL,
  `Visiting_charge` int NOT NULL,
  `Charge` int NOT NULL,
  `Implants` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Total` int NOT NULL,
  PRIMARY KEY (`Op_id`),
  KEY `Admit_id` (`Admit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`Op_id`, `Op_date`, `Admit_id`, `Visiting_charge`, `Charge`, `Implants`, `Total`) VALUES
(1, '2022-02-23', 1, 500, 2000, 'Knee Plate', 2500),
(2, '2022-02-24', 2, 500, 2000, 'Lag screw', 2500),
(3, '2024-02-25', 3, 800, 2000, 'Hand plate', 2800),
(4, '2025-12-02', 4, 1000, 2000, 'L-shaped plate', 1000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `operationdetailsview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `operationdetailsview`;
CREATE TABLE IF NOT EXISTS `operationdetailsview` (
`Cost` int
,`Description` varchar(255)
,`Implants_id` int
,`Name` varchar(50)
,`oName` varchar(50)
,`Op_id` int
,`Opd_id` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `operationview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `operationview`;
CREATE TABLE IF NOT EXISTS `operationview` (
`Admit_id` int
,`Charge` int
,`Implants` varchar(50)
,`Name` varchar(50)
,`Op_date` date
,`Op_id` int
,`Total` int
,`Visiting_charge` int
);

-- --------------------------------------------------------

--
-- Table structure for table `operation_details`
--

DROP TABLE IF EXISTS `operation_details`;
CREATE TABLE IF NOT EXISTS `operation_details` (
  `Opd_id` int NOT NULL AUTO_INCREMENT,
  `Op_id` int NOT NULL,
  `Implants_id` int NOT NULL,
  `Cost` int NOT NULL,
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Opd_id`),
  KEY `Op_id` (`Op_id`),
  KEY `Implants_id` (`Implants_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operation_details`
--

INSERT INTO `operation_details` (`Opd_id`, `Op_id`, `Implants_id`, `Cost`, `Description`) VALUES
(1, 1, 1, 2000, 'Knee Plate operation details'),
(2, 2, 4, 500, 'good '),
(3, 3, 2, 1000, 'hand plate opertaion'),
(4, 4, 3, 1000, 'l shaped plate operation');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `Patient_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Contact_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Gender` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Height` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Weight` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Blood_Group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`Patient_id`, `Name`, `Address`, `Date_of_birth`, `Contact_no`, `Email_id`, `Password`, `Gender`, `Height`, `Weight`, `Blood_Group`) VALUES
(1, 'Vishal', 'Botad', '2008-08-12', '9147483647', 'vishal@gmail.com', 'vishal123', 'Male', '55', '60', 'A+'),
(2, '   ranjit', 'ranpur', '2001-01-03', '9635693369', 'ranjit@gmail.com', '123', 'male', '165', '95', 'a+'),
(3, 'radhey', 'gadhada', '2004-02-04', '9636547823', 'radhey@gmail.com', 'radhey123', 'male', '165', '60', 'b+'),
(4, 'nimesh', 'baravala', '2014-02-04', '9623547823', 'nimesh@gmail.com', 'nimesh123', 'male', '145', '40', 'b+'),
(5, ' radhika', 'rajpara', '2002-02-25', '9896547823', 'radhika@gmail.com', 'radhika456', 'female', '160', '60', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

DROP TABLE IF EXISTS `patient_details`;
CREATE TABLE IF NOT EXISTS `patient_details` (
  `Pd_id` int NOT NULL AUTO_INCREMENT,
  `Patient_id` int NOT NULL,
  `BP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Temp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Pulse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Sugar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Pd_id`),
  KEY `Patient_id` (`Patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`Pd_id`, `Patient_id`, `BP`, `Temp`, `Pulse`, `Sugar`, `Date`) VALUES
(1, 1, '110', '98.60', '70', '120', '2023-10-23'),
(2, 2, '105', '95', '72', '118', '2023-10-26'),
(3, 3, '106', '96.23', '71', '116', '2023-09-12'),
(4, 4, '00', '98.20', '69', '119', '2023-09-20'),
(5, 1, '52', '53', '53', '35', '0000-00-00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `patient_detailsview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `patient_detailsview`;
CREATE TABLE IF NOT EXISTS `patient_detailsview` (
`BP` varchar(100)
,`Date` date
,`Name` varchar(50)
,`Patient_id` int
,`Pd_id` int
,`Pulse` varchar(100)
,`Sugar` varchar(100)
,`Temp` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `Payment_id` int NOT NULL AUTO_INCREMENT,
  `Admit_id` int NOT NULL,
  `Appointment_id` int NOT NULL,
  `Amount` int NOT NULL,
  `Type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Payment_id`),
  KEY `Admit_id` (`Admit_id`),
  KEY `Appointment_id` (`Appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_id`, `Admit_id`, `Appointment_id`, `Amount`, `Type`, `Description`) VALUES
(1, 1, 1, 5500, 'Card', 'Paid'),
(2, 2, 2, 5000, 'cash', 'Paid'),
(3, 3, 3, 6000, 'card', 'paid'),
(4, 4, 4, 9000, 'cash', 'paid');

-- --------------------------------------------------------

--
-- Stand-in structure for view `paymentview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `paymentview`;
CREATE TABLE IF NOT EXISTS `paymentview` (
`Admit_id` int
,`Amount` int
,`Appointment_id` int
,`Date` date
,`Description` varchar(200)
,`Name` varchar(50)
,`Payment_id` int
,`Type` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
CREATE TABLE IF NOT EXISTS `prescription` (
  `Prescription_id` int NOT NULL AUTO_INCREMENT,
  `Doctor_id` int NOT NULL,
  `Appointment_id` int NOT NULL,
  `Prescription_date` date NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Advice` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Prescription_id`),
  KEY `Doctor_id` (`Doctor_id`),
  KEY `Appointment_id` (`Appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`Prescription_id`, `Doctor_id`, `Appointment_id`, `Prescription_date`, `Description`, `Advice`, `Status`) VALUES
(1, 1, 1, '2023-11-15', 'Take Rest', 'Complete Course', 'Active'),
(2, 2, 1, '2024-10-08', '-', '-', '-'),
(3, 1, 2, '2025-01-01', 'co', 'complate', 'runnig'),
(4, 2, 3, '2025-02-01', 'rest', 'complte cource', '-');

-- --------------------------------------------------------

--
-- Stand-in structure for view `prescriptionview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `prescriptionview`;
CREATE TABLE IF NOT EXISTS `prescriptionview` (
`Advice` varchar(300)
,`Appointment_id` int
,`Description` varchar(200)
,`Doctor_id` int
,`Name` varchar(50)
,`pName` varchar(50)
,`Prescription_date` date
,`Prescription_id` int
,`Status` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_details`
--

DROP TABLE IF EXISTS `prescription_details`;
CREATE TABLE IF NOT EXISTS `prescription_details` (
  `PrescriptionDetail_id` int NOT NULL AUTO_INCREMENT,
  `Prescription_id` int NOT NULL,
  `Medicine_id` int NOT NULL,
  `Frequency` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Duration` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PrescriptionDetail_id`),
  KEY `Prescription_id` (`Prescription_id`),
  KEY `Medicine_id` (`Medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription_details`
--

INSERT INTO `prescription_details` (`PrescriptionDetail_id`, `Prescription_id`, `Medicine_id`, `Frequency`, `Duration`, `Remark`) VALUES
(1, 1, 1, 'Twice a Day', '7 Days', 'None'),
(2, 2, 2, 'twice day', '3 day', '-'),
(3, 3, 3, 'one day', 'week', '-'),
(4, 4, 4, 'one  day', '7 day', 'complate');

-- --------------------------------------------------------

--
-- Stand-in structure for view `prescription_detailsview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `prescription_detailsview`;
CREATE TABLE IF NOT EXISTS `prescription_detailsview` (
`Duration` varchar(300)
,`Frequency` varchar(500)
,`Medicine_id` int
,`Name` varchar(50)
,`pName` varchar(50)
,`Prescription_id` int
,`PrescriptionDetail_id` int
,`Remark` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `Room_id` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Room_Charge` int NOT NULL,
  `Total_Beds` int NOT NULL,
  `Doctor_Charge` int NOT NULL,
  `Nurse_Charge` int NOT NULL,
  PRIMARY KEY (`Room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Room_id`, `Type`, `Room_Charge`, `Total_Beds`, `Doctor_Charge`, `Nurse_Charge`) VALUES
(1, 'generalward', 500, 15, 1000, 500),
(2, 'Semi Specialist', 1000, 15, 500, 300),
(3, 'Deluxe room', 1500, 15, 700, 400),
(5, 'general', 2000, 5, 2000, 300);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `Staff_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Education` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Post` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Contact_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_id`, `Name`, `Education`, `Post`, `Contact_no`, `Email_id`, `password`, `Address`) VALUES
(1, 'Patel Radhika M.', 'B.S.C nursing', 'Registered nurse', '9147483647', 'radhika32@gmail.com', 'radhika123', 'Botad'),
(2, 'Padhiyar Jatin', 'GNM', 'X-ray technician', '9645789465', 'jatin.p@gmail.com', 'jatin456', 'Salinapur'),
(3, 'Makavana Jayesh', 'B.ortho', 'General surgeon', '9649782464', 'jayesh.m@gmail.com', 'jayesh789', 'Paliyad'),
(4, 'mahesh barot', 'nurshing', 'surger', '9635689636', 'mahesh@gmail.com', 'mahesh123', 'botad');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `Test_id` int NOT NULL AUTO_INCREMENT,
  `Test_Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`Test_id`, `Test_Name`, `Description`) VALUES
(1, 'Vitamin 111', 'Deficienci aaa'),
(2, 'Blood Sugar', 'Diabetes screening'),
(3, 'Cholesterol', 'Heart disease risk'),
(4, 'corana test', 'test now drfat');

-- --------------------------------------------------------

--
-- Table structure for table `test_patients`
--

DROP TABLE IF EXISTS `test_patients`;
CREATE TABLE IF NOT EXISTS `test_patients` (
  `Pt_id` int NOT NULL AUTO_INCREMENT,
  `Admit_id` int NOT NULL,
  `Test_id` int NOT NULL,
  `Test_result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Test_date` date NOT NULL,
  PRIMARY KEY (`Pt_id`),
  KEY `Admit_id` (`Admit_id`),
  KEY `test_id` (`Test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_patients`
--

INSERT INTO `test_patients` (`Pt_id`, `Admit_id`, `Test_id`, `Test_result`, `Test_date`) VALUES
(1, 1, 1, 'Normal', '2024-02-12'),
(2, 2, 2, 'normal', '2024-10-22'),
(3, 3, 3, 'positive', '2024-01-22'),
(4, 4, 4, 'positive', '2025-02-04');

-- --------------------------------------------------------

--
-- Stand-in structure for view `test_patientsview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `test_patientsview`;
CREATE TABLE IF NOT EXISTS `test_patientsview` (
`Admit_id` int
,`Name` varchar(50)
,`Pt_id` int
,`Test_date` date
,`Test_id` int
,`Test_Name` varchar(100)
,`Test_result` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
CREATE TABLE IF NOT EXISTS `treatment` (
  `Treatment_id` int NOT NULL AUTO_INCREMENT,
  `Treatment_date` date NOT NULL,
  `Admit_id` int NOT NULL,
  `Staff_id` int NOT NULL,
  `Status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Treatment_id`),
  KEY `Admit_id` (`Admit_id`),
  KEY `Staff_id` (`Staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`Treatment_id`, `Treatment_date`, `Admit_id`, `Staff_id`, `Status`) VALUES
(1, '2020-06-20', 1, 1, 'Active'),
(2, '2024-11-11', 2, 2, 'rest'),
(3, '2024-12-11', 3, 3, 'pending'),
(7, '2025-02-15', 2, 2, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_details`
--

DROP TABLE IF EXISTS `treatment_details`;
CREATE TABLE IF NOT EXISTS `treatment_details` (
  `TreatmentDetail_id` int NOT NULL AUTO_INCREMENT,
  `Treatment_id` int NOT NULL,
  `Medicine_id` int NOT NULL,
  `Frequency` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Duration` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`TreatmentDetail_id`),
  KEY `Treatment_id` (`Treatment_id`),
  KEY `Medicine_id` (`Medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment_details`
--

INSERT INTO `treatment_details` (`TreatmentDetail_id`, `Treatment_id`, `Medicine_id`, `Frequency`, `Duration`, `Remark`) VALUES
(1, 1, 1, 'Once a Day', '5 Days', 'Monitor'),
(2, 2, 2, 'twice day', '7 day', 'remark\r\n'),
(3, 3, 1, 'one day ', '15 day', '--');

-- --------------------------------------------------------

--
-- Stand-in structure for view `treatment_detailsview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `treatment_detailsview`;
CREATE TABLE IF NOT EXISTS `treatment_detailsview` (
`Duration` varchar(200)
,`Frequency` varchar(200)
,`Medicine_id` int
,`Name` varchar(50)
,`pName` varchar(50)
,`Remark` varchar(200)
,`Treatment_id` int
,`TreatmentDetail_id` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `treatview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `treatview`;
CREATE TABLE IF NOT EXISTS `treatview` (
`Admit_id` int
,`Name` varchar(50)
,`pName` varchar(50)
,`Staff_id` int
,`Status` varchar(100)
,`Treatment_date` date
,`Treatment_id` int
);

-- --------------------------------------------------------

--
-- Structure for view `admitview`
--
DROP TABLE IF EXISTS `admitview`;

DROP VIEW IF EXISTS `admitview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `admitview`  AS SELECT `admit`.`Admit_id` AS `Admit_id`, `admit`.`Patient_id` AS `Patient_id`, `admit`.`Admit_Date` AS `Admit_Date`, `admit`.`Room_id` AS `Room_id`, `admit`.`Discharge_Date` AS `Discharge_Date`, `admit`.`Description` AS `Description`, `patients`.`Name` AS `Name`, `room`.`Type` AS `Type` FROM ((`admit` join `patients`) join `room`) WHERE ((`admit`.`Patient_id` = `patients`.`Patient_id`) AND (`admit`.`Room_id` = `room`.`Room_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `appointmentview`
--
DROP TABLE IF EXISTS `appointmentview`;

DROP VIEW IF EXISTS `appointmentview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `appointmentview`  AS SELECT `appointment`.`Appointment_id` AS `Appointment_id`, `appointment`.`Patient_id` AS `Patient_id`, `appointment`.`Doctor_id` AS `Doctor_id`, `appointment`.`Date` AS `Date`, `appointment`.`Time` AS `Time`, `appointment`.`Status` AS `Status`, `appointment`.`Type` AS `Type`, `appointment`.`Charge` AS `Charge`, `appointment`.`Complaints` AS `Complaints`, `patients`.`Name` AS `pName`, `doctor`.`Name` AS `Name` FROM ((`appointment` join `patients`) join `doctor`) WHERE ((`appointment`.`Patient_id` = `patients`.`Patient_id`) AND (`appointment`.`Doctor_id` = `doctor`.`Doctor_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `billview`
--
DROP TABLE IF EXISTS `billview`;

DROP VIEW IF EXISTS `billview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `billview`  AS SELECT `bill`.`Bill_id` AS `Bill_id`, `bill`.`Admit_id` AS `Admit_id`, `bill`.`Treatment_charge` AS `Treatment_charge`, `bill`.`Room_charge` AS `Room_charge`, `bill`.`Operation_charge` AS `Operation_charge`, `bill`.`Doctor_charge` AS `Doctor_charge`, `bill`.`Visit_doctor_charge` AS `Visit_doctor_charge`, `bill`.`Total_Amount` AS `Total_Amount`, `admitview`.`Name` AS `Name` FROM (`bill` join `admitview`) WHERE (`bill`.`Admit_id` = `admitview`.`Admit_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `doctorscheduleview`
--
DROP TABLE IF EXISTS `doctorscheduleview`;

DROP VIEW IF EXISTS `doctorscheduleview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doctorscheduleview`  AS SELECT `doctor_schedule`.`Schedule_id` AS `Schedule_id`, `doctor_schedule`.`Doctor_id` AS `Doctor_id`, `doctor_schedule`.`StartTime` AS `StartTime`, `doctor_schedule`.`EndTime` AS `EndTime`, `doctor_schedule`.`Day` AS `Day`, `doctor`.`Name` AS `Name` FROM (`doctor_schedule` join `doctor`) WHERE (`doctor`.`Doctor_id` = `doctor_schedule`.`Doctor_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `feedbackview`
--
DROP TABLE IF EXISTS `feedbackview`;

DROP VIEW IF EXISTS `feedbackview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `feedbackview`  AS SELECT `feedback`.`Feedback_id` AS `Feedback_id`, `feedback`.`Patient_id` AS `Patient_id`, `patients`.`Name` AS `Name`, `feedback`.`Feedback` AS `Feedback`, `feedback`.`Feedback_Date` AS `Feedback_Date` FROM (`feedback` join `patients`) WHERE (`feedback`.`Patient_id` = `patients`.`Patient_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `operationdetailsview`
--
DROP TABLE IF EXISTS `operationdetailsview`;

DROP VIEW IF EXISTS `operationdetailsview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `operationdetailsview`  AS SELECT `operation_details`.`Opd_id` AS `Opd_id`, `operation_details`.`Op_id` AS `Op_id`, `operation_details`.`Implants_id` AS `Implants_id`, `operation_details`.`Cost` AS `Cost`, `operation_details`.`Description` AS `Description`, `operationview`.`Name` AS `oName`, `implants`.`Name` AS `Name` FROM ((`operation_details` join `operationview`) join `implants`) WHERE ((`operation_details`.`Op_id` = `operationview`.`Op_id`) AND (`operation_details`.`Implants_id` = `implants`.`Implants_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `operationview`
--
DROP TABLE IF EXISTS `operationview`;

DROP VIEW IF EXISTS `operationview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `operationview`  AS SELECT `operation`.`Op_id` AS `Op_id`, `operation`.`Op_date` AS `Op_date`, `operation`.`Admit_id` AS `Admit_id`, `operation`.`Visiting_charge` AS `Visiting_charge`, `operation`.`Charge` AS `Charge`, `operation`.`Implants` AS `Implants`, `operation`.`Total` AS `Total`, `admitview`.`Name` AS `Name` FROM (`operation` join `admitview`) WHERE (`operation`.`Admit_id` = `admitview`.`Admit_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `patient_detailsview`
--
DROP TABLE IF EXISTS `patient_detailsview`;

DROP VIEW IF EXISTS `patient_detailsview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `patient_detailsview`  AS SELECT `patient_details`.`Pd_id` AS `Pd_id`, `patient_details`.`Patient_id` AS `Patient_id`, `patient_details`.`BP` AS `BP`, `patient_details`.`Temp` AS `Temp`, `patient_details`.`Pulse` AS `Pulse`, `patient_details`.`Sugar` AS `Sugar`, `patient_details`.`Date` AS `Date`, `patients`.`Name` AS `Name` FROM (`patient_details` join `patients`) WHERE (`patient_details`.`Patient_id` = `patients`.`Patient_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `paymentview`
--
DROP TABLE IF EXISTS `paymentview`;

DROP VIEW IF EXISTS `paymentview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `paymentview`  AS SELECT `payment`.`Payment_id` AS `Payment_id`, `payment`.`Admit_id` AS `Admit_id`, `payment`.`Appointment_id` AS `Appointment_id`, `payment`.`Amount` AS `Amount`, `payment`.`Type` AS `Type`, `payment`.`Description` AS `Description`, `admitview`.`Name` AS `Name`, `appointment`.`Date` AS `Date` FROM ((`payment` join `admitview`) join `appointment`) WHERE ((`payment`.`Admit_id` = `admitview`.`Admit_id`) AND (`payment`.`Appointment_id` = `appointment`.`Appointment_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `prescriptionview`
--
DROP TABLE IF EXISTS `prescriptionview`;

DROP VIEW IF EXISTS `prescriptionview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prescriptionview`  AS SELECT `prescription`.`Prescription_id` AS `Prescription_id`, `prescription`.`Doctor_id` AS `Doctor_id`, `prescription`.`Appointment_id` AS `Appointment_id`, `prescription`.`Prescription_date` AS `Prescription_date`, `prescription`.`Description` AS `Description`, `prescription`.`Advice` AS `Advice`, `prescription`.`Status` AS `Status`, `doctor`.`Name` AS `Name`, `appointmentview`.`pName` AS `pName` FROM ((`prescription` join `doctor`) join `appointmentview`) WHERE ((`prescription`.`Doctor_id` = `doctor`.`Doctor_id`) AND (`prescription`.`Appointment_id` = `appointmentview`.`Appointment_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `prescription_detailsview`
--
DROP TABLE IF EXISTS `prescription_detailsview`;

DROP VIEW IF EXISTS `prescription_detailsview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prescription_detailsview`  AS SELECT `prescription_details`.`PrescriptionDetail_id` AS `PrescriptionDetail_id`, `prescription_details`.`Prescription_id` AS `Prescription_id`, `prescription_details`.`Medicine_id` AS `Medicine_id`, `prescription_details`.`Frequency` AS `Frequency`, `prescription_details`.`Duration` AS `Duration`, `prescription_details`.`Remark` AS `Remark`, `prescriptionview`.`pName` AS `pName`, `medicine`.`Name` AS `Name` FROM ((`prescription_details` join `prescriptionview`) join `medicine`) WHERE ((`prescription_details`.`Prescription_id` = `prescriptionview`.`Prescription_id`) AND (`prescription_details`.`Medicine_id` = `medicine`.`Medicine_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `test_patientsview`
--
DROP TABLE IF EXISTS `test_patientsview`;

DROP VIEW IF EXISTS `test_patientsview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `test_patientsview`  AS SELECT `test_patients`.`Pt_id` AS `Pt_id`, `test_patients`.`Admit_id` AS `Admit_id`, `test_patients`.`Test_id` AS `Test_id`, `test_patients`.`Test_result` AS `Test_result`, `test_patients`.`Test_date` AS `Test_date`, `admitview`.`Name` AS `Name`, `test`.`Test_Name` AS `Test_Name` FROM ((`test_patients` join `admitview`) join `test`) WHERE ((`test_patients`.`Admit_id` = `admitview`.`Admit_id`) AND (`test_patients`.`Test_id` = `test`.`Test_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `treatment_detailsview`
--
DROP TABLE IF EXISTS `treatment_detailsview`;

DROP VIEW IF EXISTS `treatment_detailsview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `treatment_detailsview`  AS SELECT `treatment_details`.`TreatmentDetail_id` AS `TreatmentDetail_id`, `treatment_details`.`Treatment_id` AS `Treatment_id`, `treatment_details`.`Medicine_id` AS `Medicine_id`, `treatment_details`.`Frequency` AS `Frequency`, `treatment_details`.`Duration` AS `Duration`, `treatment_details`.`Remark` AS `Remark`, `treatview`.`pName` AS `pName`, `medicine`.`Name` AS `Name` FROM ((`treatment_details` join `treatview`) join `medicine`) WHERE ((`treatment_details`.`Treatment_id` = `treatview`.`Treatment_id`) AND (`treatment_details`.`Medicine_id` = `medicine`.`Medicine_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `treatview`
--
DROP TABLE IF EXISTS `treatview`;

DROP VIEW IF EXISTS `treatview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `treatview`  AS SELECT `treatment`.`Treatment_id` AS `Treatment_id`, `treatment`.`Treatment_date` AS `Treatment_date`, `treatment`.`Admit_id` AS `Admit_id`, `admitview`.`Name` AS `pName`, `treatment`.`Staff_id` AS `Staff_id`, `staff`.`Name` AS `Name`, `treatment`.`Status` AS `Status` FROM ((`treatment` join `admitview`) join `staff`) WHERE ((`treatment`.`Admit_id` = `admitview`.`Admit_id`) AND (`treatment`.`Staff_id` = `staff`.`Staff_id`)) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admit`
--
ALTER TABLE `admit`
  ADD CONSTRAINT `admit_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `patients` (`Patient_id`),
  ADD CONSTRAINT `admit_ibfk_2` FOREIGN KEY (`Room_id`) REFERENCES `room` (`Room_id`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `patients` (`Patient_id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Doctor_id`) REFERENCES `doctor` (`Doctor_id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`Admit_id`) REFERENCES `admit` (`Admit_id`);

--
-- Constraints for table `doctor_schedule`
--
ALTER TABLE `doctor_schedule`
  ADD CONSTRAINT `doctor_schedule_ibfk_1` FOREIGN KEY (`Doctor_id`) REFERENCES `doctor` (`Doctor_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `patients` (`Patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD CONSTRAINT `patient_details_ibfk_1` FOREIGN KEY (`Patient_id`) REFERENCES `patients` (`Patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
