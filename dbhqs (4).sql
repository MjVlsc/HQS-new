-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2025 at 07:35 PM
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
-- Database: `dbhqs`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `log_id` int(11) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `table_name` varchar(50) NOT NULL,
  `record_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `action_details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`log_id`, `action_type`, `table_name`, `record_id`, `user_id`, `username`, `role`, `action_details`, `created_at`) VALUES
(1, 'ADD_QUEUE', 'queues', 332, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-006\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-17 19:36:08'),
(2, 'ADD_QUEUE', 'queues', 333, 2, 'Xen', 'Admitting', '{\"queue_num\":\"PHA-007\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 02:23:34'),
(3, 'ADD_QUEUE', 'queues', 334, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-008\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Emergency\"}', '2025-04-18 02:23:43'),
(4, 'ADD_QUEUE', 'queues', 335, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-009\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-18 02:37:47'),
(5, 'ADD_QUEUE', 'queues', 336, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-010\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Emergency\"}', '2025-04-18 02:38:23'),
(6, 'ADD_QUEUE', 'queues', 337, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-011\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 05:51:03'),
(7, 'ADD_QUEUE', 'queues', 338, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-012\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Emergency\"}', '2025-04-18 05:51:15'),
(8, 'ADD_QUEUE', 'queues', 339, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-013\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 05:51:46'),
(9, 'ADD_QUEUE', 'queues', 340, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-014\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 05:53:56'),
(10, 'ADD_QUEUE', 'queues', 341, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-015\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 05:54:08'),
(11, 'ADD_QUEUE', 'queues', 342, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-016\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 05:54:27'),
(12, 'ADD_QUEUE', 'queues', 343, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-017\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 05:54:35'),
(13, 'ADD_QUEUE', 'queues', 344, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-018\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 05:54:43'),
(14, 'ADD_QUEUE', 'queues', 345, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-019\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Emergency\"}', '2025-04-18 05:55:00'),
(15, 'ADD_QUEUE', 'queues', 346, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-020\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"PWD\"}', '2025-04-18 05:55:28'),
(16, 'ADD_QUEUE', 'queues', 347, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-021\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Emergency\"}', '2025-04-18 05:56:46'),
(17, 'ADD_QUEUE', 'queues', 348, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-022\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"PWD\"}', '2025-04-18 05:57:09'),
(18, 'ADD_QUEUE', 'queues', 349, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-023\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Pregnant\"}', '2025-04-18 05:57:28'),
(19, 'ADD_QUEUE', 'queues', 350, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-024\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Emergency\"}', '2025-04-18 06:29:04'),
(20, 'ADD_QUEUE', 'queues', 351, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-025\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-18 06:32:11'),
(21, 'ADD_QUEUE', 'queues', 352, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-026\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-18 06:32:22'),
(22, 'ADD_QUEUE', 'queues', 353, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-027\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-18 06:32:30'),
(23, 'ADD_QUEUE', 'queues', 354, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-028\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-18 06:34:43'),
(24, 'ADD_QUEUE', 'queues', 355, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-029\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-18 06:34:51'),
(25, 'ADD_QUEUE', 'queues', 356, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-030\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-18 06:34:59'),
(26, 'ADD_QUEUE', 'queues', 357, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-031\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Emergency\"}', '2025-04-18 06:36:06'),
(27, 'ADD_QUEUE', 'queues', 358, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-032\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-18 06:45:30'),
(28, 'ADD_QUEUE', 'queues', 359, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-033\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-18 06:56:23'),
(29, 'ADD_QUEUE', 'queues', 360, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-034\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-18 06:56:42'),
(30, 'ADD_QUEUE', 'queues', 361, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-035\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 07:17:20'),
(31, 'ADD_QUEUE', 'queues', 362, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-001\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-18 07:20:41'),
(32, 'ADD_QUEUE', 'queues', 363, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-002\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Emergency\"}', '2025-04-18 07:21:49'),
(33, 'ADD_QUEUE', 'queues', 364, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-003\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-18 07:35:07'),
(34, 'ADD_QUEUE', 'queues', 365, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-004\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"PWD\"}', '2025-04-18 07:35:53'),
(35, 'ADD_QUEUE', 'queues', 366, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-005\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"PWD\"}', '2025-04-18 07:40:01'),
(36, 'ADD_QUEUE', 'queues', 367, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-006\",\"service_name\":\"Blood Test\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-18 07:40:08'),
(37, 'ADD_QUEUE', 'queues', 368, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-007\",\"service_name\":\"Blood Test\",\"department_id\":\"8\",\"priority\":\"Emergency\"}', '2025-04-18 07:42:40'),
(38, 'ADD_QUEUE', 'queues', 369, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-008\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-18 07:43:25'),
(39, 'ADD_QUEUE', 'queues', 370, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-009\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-18 07:43:32'),
(40, 'ADD_QUEUE', 'queues', 371, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-010\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-18 07:43:40'),
(41, 'ADD_QUEUE', 'queues', 372, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-011\",\"service_name\":\"Blood Test\",\"department_id\":\"8\",\"priority\":\"Pregnant\"}', '2025-04-18 07:43:47'),
(42, 'ADD_QUEUE', 'queues', 373, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-012\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"Red Flag\"}', '2025-04-18 07:43:57'),
(43, 'ADD_QUEUE', 'queues', 374, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-013\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"Red Flag\"}', '2025-04-18 07:44:04'),
(44, 'ADD_QUEUE', 'queues', 375, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-014\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"Emergency\"}', '2025-04-18 07:44:20'),
(45, 'ADD_QUEUE', 'queues', 376, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-015\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-20 17:04:45'),
(46, 'ADD_QUEUE', 'queues', 377, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-016\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Normal\"}', '2025-04-20 17:04:52'),
(47, 'ADD_QUEUE', 'queues', 378, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-017\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Emergency\"}', '2025-04-20 17:05:01'),
(48, 'ADD_QUEUE', 'queues', 379, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-018\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Red Flag\"}', '2025-04-20 17:05:10'),
(49, 'ADD_QUEUE', 'queues', 1, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-001\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Senior Citizen\"}', '2025-04-21 05:41:57'),
(50, 'ADD_QUEUE', 'queues', 2, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-002\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"PWD\"}', '2025-04-21 05:42:08'),
(51, 'ADD_QUEUE', 'queues', 1, 10, 'Tin', 'Admin', '{\"queue_num\":\"SW-001\",\"service_name\":\"Discharge Planning Assistance\",\"department_id\":\"14\",\"priority\":\"Pregnant\"}', '2025-04-21 05:53:04'),
(52, 'ADD_QUEUE', 'queues', 2, 2, 'Xen', 'Admitting', '{\"queue_num\":\"BIL-002\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"PWD\"}', '2025-04-21 05:57:54'),
(53, 'ADD_QUEUE', 'queues', 3, 2, 'Xen', 'Admitting', '{\"queue_num\":\"XR-003\",\"service_name\":\"X-Ray\",\"department_id\":\"5\",\"priority\":\"Emergency\"}', '2025-04-21 06:15:13'),
(54, 'ADD_QUEUE', 'queues', 4, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-004\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-21 07:20:24'),
(55, 'ADD_QUEUE', 'queues', 5, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-005\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-21 07:24:33'),
(56, 'ADD_QUEUE', 'queues', 6, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-006\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Senior Citizen\"}', '2025-04-21 07:25:02'),
(57, 'ADD_QUEUE', 'queues', 7, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-007\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-21 07:28:54'),
(58, 'ADD_QUEUE', 'queues', 8, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-008\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Normal\"}', '2025-04-21 07:31:41'),
(59, 'ADD_QUEUE', 'queues', 9, 2, 'Xen', 'Admitting', '{\"queue_num\":\"\",\"service_name\":\"Blood Test\",\"department_id\":\"8\",\"priority\":\"Emergency\"}', '2025-04-21 07:49:13'),
(60, 'ADD_QUEUE', 'queues', 10, 2, 'Xen', 'Admitting', '{\"queue_num\":\"\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Emergency\"}', '2025-04-21 07:53:48'),
(61, 'ADD_QUEUE', 'queues', 11, 2, 'Xen', 'Admitting', '{\"queue_num\":\"\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Emergency\"}', '2025-04-21 07:54:46'),
(62, 'ADD_QUEUE', 'queues', 12, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-001\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"PWD\"}', '2025-04-21 07:56:58'),
(63, 'ADD_QUEUE', 'queues', 13, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-002\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"PWD\"}', '2025-04-21 08:03:02'),
(64, 'ADD_QUEUE', 'queues', 14, 2, 'Xen', 'Admitting', '{\"queue_num\":\"BIL-003\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Emergency\"}', '2025-04-21 08:16:35'),
(65, 'ADD_QUEUE', 'queues', 15, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-004\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Emergency\"}', '2025-04-21 08:28:29'),
(66, 'ADD_QUEUE', 'queues', 16, 10, 'Tin', 'Admin', '{\"queue_num\":\"XR-005\",\"service_name\":\"X-Ray\",\"department_id\":\"5\",\"priority\":\"Normal\"}', '2025-04-21 15:15:24'),
(67, 'ADD_QUEUE', 'queues', 17, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-006\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Red Flag\"}', '2025-04-21 15:23:21'),
(68, 'ADD_QUEUE', 'queues', 18, 10, 'Tin', 'Admin', '{\"queue_num\":\"ULT-007\",\"service_name\":\"Ultrasound\",\"department_id\":\"4\",\"priority\":\"Senior Citizen\"}', '2025-04-21 15:24:26'),
(69, 'ADD_QUEUE', 'queues', 19, 10, 'Tin', 'Admin', '{\"queue_num\":\"DIA-008\",\"service_name\":\"Dialysis Treatment\",\"department_id\":\"7\",\"priority\":\"Red Flag\"}', '2025-04-21 15:24:54'),
(70, 'ADD_QUEUE', 'queues', 20, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-009\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Pregnant\"}', '2025-04-21 15:28:27'),
(71, 'ADD_QUEUE', 'queues', 21, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-010\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-21 15:33:51'),
(72, 'ADD_QUEUE', 'queues', 22, 10, 'Tin', 'Admin', '{\"queue_num\":\"REH-011\",\"service_name\":\"Physical Therapy\",\"department_id\":\"6\",\"priority\":\"Pregnant\"}', '2025-04-21 15:36:05'),
(73, 'ADD_QUEUE', 'queues', 23, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-012\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Senior Citizen\"}', '2025-04-21 15:36:40'),
(74, 'ADD_QUEUE', 'queues', 24, 10, 'Tin', 'Admin', '{\"queue_num\":\"SW-013\",\"service_name\":\"Discharge Planning Assistance\",\"department_id\":\"14\",\"priority\":\"Senior Citizen\"}', '2025-04-21 15:37:32'),
(75, 'ADD_QUEUE', 'queues', 25, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-014\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"Pregnant\"}', '2025-04-21 15:39:13'),
(76, 'ADD_QUEUE', 'queues', 26, 10, 'Tin', 'Admin', '{\"queue_num\":\"DIA-015\",\"service_name\":\"Dialysis Treatment\",\"department_id\":\"7\",\"priority\":\"Senior Citizen\"}', '2025-04-21 15:39:26'),
(77, 'ADD_QUEUE', 'queues', 27, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-016\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"PWD\"}', '2025-04-21 15:41:05'),
(78, 'ADD_QUEUE', 'queues', 28, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-017\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Pregnant\"}', '2025-04-21 15:41:57'),
(79, 'ADD_QUEUE', 'queues', 29, 10, 'Tin', 'Admin', '{\"queue_num\":\"ULT-018\",\"service_name\":\"Ultrasound\",\"department_id\":\"4\",\"priority\":\"Pregnant\"}', '2025-04-21 15:43:11'),
(80, 'ADD_QUEUE', 'queues', 30, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-019\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Senior Citizen\"}', '2025-04-21 15:44:25'),
(81, 'ADD_QUEUE', 'queues', 31, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-020\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Senior Citizen\"}', '2025-04-21 15:45:50'),
(82, 'ADD_QUEUE', 'queues', 32, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-021\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Senior Citizen\"}', '2025-04-21 15:49:03'),
(83, 'ADD_QUEUE', 'queues', 33, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-022\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Senior Citizen\"}', '2025-04-21 15:50:25'),
(84, 'ADD_QUEUE', 'queues', 34, 10, 'Tin', 'Admin', '{\"queue_num\":\"XR-023\",\"service_name\":\"X-Ray\",\"department_id\":\"5\",\"priority\":\"PWD\"}', '2025-04-21 15:51:04'),
(85, 'ADD_QUEUE', 'queues', 35, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-024\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Pregnant\"}', '2025-04-21 15:53:14'),
(86, 'ADD_QUEUE', 'queues', 36, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-025\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Pregnant\"}', '2025-04-21 15:56:59'),
(87, 'ADD_QUEUE', 'queues', 37, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-026\",\"service_name\":\"Blood Test\",\"department_id\":\"8\",\"priority\":\"Senior Citizen\"}', '2025-04-21 16:03:33'),
(88, 'ADD_QUEUE', 'queues', 38, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-027\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"PWD\"}', '2025-04-21 16:04:56'),
(89, 'ADD_QUEUE', 'queues', 39, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-028\",\"service_name\":\"Blood Test\",\"department_id\":\"8\",\"priority\":\"Senior Citizen\"}', '2025-04-21 16:05:43'),
(90, 'ADD_QUEUE', 'queues', 40, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-029\",\"service_name\":\"Blood Test\",\"department_id\":\"8\",\"priority\":\"PWD\"}', '2025-04-21 16:06:03'),
(91, 'ADD_QUEUE', 'queues', 41, 10, 'Tin', 'Admin', '{\"queue_num\":\"REH-030\",\"service_name\":\"Physical Therapy\",\"department_id\":\"6\",\"priority\":\"Senior Citizen\"}', '2025-04-21 16:06:20'),
(92, 'ADD_QUEUE', 'queues', 42, 10, 'Tin', 'Admin', '{\"queue_num\":\"SW-031\",\"service_name\":\"Discharge Planning Assistance\",\"department_id\":\"14\",\"priority\":\"Emergency\"}', '2025-04-21 16:07:03'),
(93, 'ADD_QUEUE', 'queues', 43, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-032\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Pregnant\"}', '2025-04-21 16:07:25'),
(94, 'ADD_QUEUE', 'queues', 44, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-033\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Pregnant\"}', '2025-04-21 16:07:36'),
(95, 'ADD_QUEUE', 'queues', 45, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-034\",\"service_name\":\"Urinalysis\",\"department_id\":\"8\",\"priority\":\"Emergency\"}', '2025-04-21 16:12:52'),
(96, 'ADD_QUEUE', 'queues', 46, 10, 'Tin', 'Admin', '{\"queue_num\":\"BIL-035\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Senior Citizen\"}', '2025-04-21 16:17:59'),
(97, 'ADD_QUEUE', 'queues', 47, 10, 'Tin', 'Admin', '{\"queue_num\":\"LAB-036\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"Pregnant\"}', '2025-04-21 16:19:32'),
(98, 'ADD_QUEUE', 'queues', 48, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ULT-037\",\"service_name\":\"Ultrasound\",\"department_id\":\"4\",\"priority\":\"Emergency\"}', '2025-04-22 00:37:49'),
(99, 'ADD_QUEUE', 'queues', 49, 2, 'Xen', 'Admitting', '{\"queue_num\":\"BIL-038\",\"service_name\":\"Billing Inquiry\",\"department_id\":\"1\",\"priority\":\"Red Flag\"}', '2025-04-22 00:38:40'),
(100, 'ADD_QUEUE', 'queues', 50, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-039\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"PWD\"}', '2025-04-22 00:41:28'),
(101, 'ADD_QUEUE', 'queues', 51, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-040\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Normal\"}', '2025-04-22 01:05:57'),
(102, 'ADD_QUEUE', 'queues', 52, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-041\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Emergency\"}', '2025-04-22 01:07:41'),
(103, 'ADD_QUEUE', 'queues', 53, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-042\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Senior Citizen\"}', '2025-04-22 01:08:27'),
(104, 'ADD_QUEUE', 'queues', 54, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ULT-043\",\"service_name\":\"Ultrasound\",\"department_id\":\"4\",\"priority\":\"Emergency\"}', '2025-04-22 01:09:04'),
(105, 'ADD_QUEUE', 'queues', 55, 2, 'Xen', 'Admitting', '{\"queue_num\":\"SW-044\",\"service_name\":\"Discharge Planning Assistance\",\"department_id\":\"14\",\"priority\":\"Red Flag\"}', '2025-04-22 01:10:51'),
(106, 'ADD_QUEUE', 'queues', 56, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-045\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Red Flag\"}', '2025-04-22 01:11:21'),
(107, 'ADD_QUEUE', 'queues', 57, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-046\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Senior Citizen\"}', '2025-04-22 01:13:47'),
(108, 'ADD_QUEUE', 'queues', 58, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-047\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Red Flag\"}', '2025-04-22 01:16:39'),
(109, 'ADD_QUEUE', 'queues', 59, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-048\",\"service_name\":\"Blood Test\",\"department_id\":\"8\",\"priority\":\"Pregnant\"}', '2025-04-22 01:28:41'),
(110, 'ADD_QUEUE', 'queues', 60, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-049\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Pregnant\"}', '2025-04-22 01:28:56'),
(111, 'ADD_QUEUE', 'queues', 61, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-050\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Senior Citizen\"}', '2025-04-22 01:30:46'),
(112, 'ADD_QUEUE', 'queues', 62, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-051\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"PWD\"}', '2025-04-22 01:31:47'),
(113, 'ADD_QUEUE', 'queues', 63, 2, 'Xen', 'Admitting', '{\"queue_num\":\"REH-052\",\"service_name\":\"Physical Therapy\",\"department_id\":\"6\",\"priority\":\"Red Flag\"}', '2025-04-22 01:37:01'),
(114, 'ADD_QUEUE', 'queues', 64, 2, 'Xen', 'Admitting', '{\"queue_num\":\"SW-053\",\"service_name\":\"Discharge Planning Assistance\",\"department_id\":\"14\",\"priority\":\"Red Flag\"}', '2025-04-22 01:38:38'),
(115, 'ADD_QUEUE', 'queues', 65, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-054\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Senior Citizen\"}', '2025-04-22 01:57:44'),
(116, 'ADD_QUEUE', 'queues', 66, 2, 'Xen', 'Admitting', '{\"queue_num\":\"SW-055\",\"service_name\":\"Discharge Planning Assistance\",\"department_id\":\"14\",\"priority\":\"Senior Citizen\"}', '2025-04-22 02:00:12'),
(117, 'ADD_QUEUE', 'queues', 67, 2, 'Xen', 'Admitting', '{\"queue_num\":\"SW-056\",\"service_name\":\"Discharge Planning Assistance\",\"department_id\":\"14\",\"priority\":\"Red Flag\"}', '2025-04-22 02:05:26'),
(118, 'ADD_QUEUE', 'queues', 68, 2, 'Xen', 'Admitting', '{\"queue_num\":\"MED-057\",\"service_name\":\" Release of Information (ROI)\",\"department_id\":\"3\",\"priority\":\"Red Flag\"}', '2025-04-22 02:06:20'),
(119, 'ADD_QUEUE', 'queues', 69, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-058\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Normal\"}', '2025-04-22 02:11:23'),
(120, 'ADD_QUEUE', 'queues', 70, 2, 'Xen', 'Admitting', '{\"queue_num\":\"ER-059\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Normal\"}', '2025-04-22 02:17:03'),
(121, 'ADD_QUEUE', 'queues', 71, 2, 'Xen', 'Admitting', '{\"queue_num\":\"MED-060\",\"service_name\":\" Release of Information (ROI)\",\"department_id\":\"3\",\"priority\":\"PWD\"}', '2025-04-22 02:17:58'),
(122, 'ADD_QUEUE', 'queues', 72, 2, 'Xen', 'Admitting', '{\"queue_num\":\"MED-061\",\"service_name\":\" Release of Information (ROI)\",\"department_id\":\"3\",\"priority\":\"Red Flag\"}', '2025-04-22 02:22:58'),
(123, 'ADD_QUEUE', 'queues', 73, 2, 'Xen', 'Admitting', '{\"queue_num\":\"MED-062\",\"service_name\":\" Release of Information (ROI)\",\"department_id\":\"3\",\"priority\":\"Pregnant\"}', '2025-04-22 02:23:36'),
(124, 'ADD_QUEUE', 'queues', 74, 2, 'Xen', 'Admitting', '{\"queue_num\":\"LAB-063\",\"service_name\":\"Blood Test, Urinalysis\",\"department_id\":\"8\",\"priority\":\"PWD\"}', '2025-04-22 06:21:52'),
(125, 'ADD_QUEUE', 'queues', 75, 2, 'Xen', 'Admitting', '{\"queue_num\":\"MED-064\",\"service_name\":\" Release of Information (ROI)\",\"department_id\":\"3\",\"priority\":\"Senior Citizen\"}', '2025-04-22 06:23:22'),
(126, 'ADD_QUEUE', 'queues', 76, 2, 'Xen', 'Admitting', '{\"queue_num\":\"PHA-065\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"PWD\"}', '2025-04-22 06:31:43'),
(127, 'ADD_QUEUE', 'queues', 77, 2, 'Xen', 'Admitting', '{\"queue_num\":\"SW-066\",\"service_name\":\"Discharge Planning Assistance\",\"department_id\":\"14\",\"priority\":\"Pregnant\"}', '2025-04-22 06:32:38'),
(128, 'ADD_QUEUE', 'queues', 78, 2, 'Xen', 'Admitting', '{\"queue_num\":\"XR-067\",\"service_name\":\"X-Ray\",\"department_id\":\"5\",\"priority\":\"Emergency\"}', '2025-04-22 06:42:17'),
(129, 'ADD_QUEUE', 'queues', 79, 2, 'Xen', 'Admitting', '{\"queue_num\":\"PHA-068\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Normal\"}', '2025-04-22 06:43:00'),
(130, 'REPRINT_TICKET', 'queues', 79, 2, 'Xen', 'Admitting', '{\"queue_num\":\"PHA-068\"}', '2025-04-22 06:57:38'),
(131, 'ADD_QUEUE', 'queues', 80, 10, 'Tin', 'Admin', '{\"queue_num\":\"ULT-069\",\"service_name\":\"Ultrasound\",\"department_id\":\"4\",\"priority\":\"Emergency\"}', '2025-04-22 07:01:35'),
(132, 'REPRINT_TICKET', 'queues', 80, 10, 'Tin', 'Admin', '{\"queue_num\":\"ULT-069\"}', '2025-04-22 07:02:42'),
(133, 'ADD_QUEUE', 'queues', 81, 10, 'Tin', 'Admin', '{\"queue_num\":\"MED-070\",\"service_name\":\" Release of Information (ROI)\",\"department_id\":\"3\",\"priority\":\"PWD\"}', '2025-04-22 07:02:56'),
(134, 'REPRINT_TICKET', 'queues', 80, 10, 'Tin', 'Admin', '{\"queue_num\":\"ULT-069\"}', '2025-04-22 07:03:11'),
(135, 'REPRINT_TICKET', 'queues', 81, 10, 'Tin', 'Admin', '{\"queue_num\":\"MED-070\"}', '2025-04-22 07:05:59'),
(136, 'REPRINT_TICKET', 'queues', 81, 10, 'Tin', 'Admin', '{\"queue_num\":\"MED-070\"}', '2025-04-22 07:06:22'),
(137, 'ADD_QUEUE', 'queues', 82, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-071\",\"service_name\":\"Triage\",\"department_id\":\"13\",\"priority\":\"Pregnant\"}', '2025-04-23 14:14:38'),
(138, 'REPRINT_TICKET', 'queues', 82, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-071\"}', '2025-04-23 14:15:18'),
(139, 'REPRINT_TICKET', 'queues', 82, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-071\"}', '2025-04-23 14:15:44'),
(140, 'REPRINT_TICKET', 'queues', 82, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-071\"}', '2025-04-23 14:23:41'),
(141, 'REPRINT_TICKET', 'queues', 82, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-071\"}', '2025-04-23 14:23:50'),
(142, 'REPRINT_TICKET', 'queues', 82, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-071\"}', '2025-04-23 14:24:53'),
(143, 'REPRINT_TICKET', 'queues', 82, 10, 'Tin', 'Admin', '{\"queue_num\":\"ER-071\"}', '2025-04-23 14:27:45'),
(144, 'ADD_QUEUE', 'queues', 83, 10, 'Tin', 'Admin', '{\"queue_num\":\"PHA-072\",\"service_name\":\"Medication Pickup\",\"department_id\":\"2\",\"priority\":\"Pregnant\"}', '2025-04-23 14:28:00'),
(145, 'ADD_QUEUE', 'queues', 84, 10, 'Tin', 'Admin', '{\"queue_num\":\"GEN073\",\"service_name\":\"CT Scan\",\"department_id\":\"15\",\"priority\":\"Red Flag\"}', '2025-04-23 14:44:55'),
(146, 'ADD_QUEUE', 'queues', 85, 2, 'Xen', 'Admitting', '{\"queue_num\":\"RAD-074\",\"service_name\":\"CT Scan\",\"department_id\":\"15\",\"priority\":\"Emergency\"}', '2025-04-23 14:48:07'),
(147, 'ADD_QUEUE', 'queues', 86, 2, 'Xen', 'Admitting', '{\"queue_num\":\"RAD-075\",\"service_name\":\"CT Scan\",\"department_id\":\"15\",\"priority\":\"Red Flag\"}', '2025-04-23 14:48:22'),
(148, 'ADD_QUEUE', 'queues', 87, 2, 'Xen', 'Admitting', '{\"queue_num\":\"RAD-076\",\"service_name\":\"CT Scan\",\"department_id\":\"15\",\"priority\":\"Pregnant\"}', '2025-04-23 14:48:42'),
(149, 'ADD_QUEUE', 'queues', 88, 2, 'Xen', 'Admitting', '{\"queue_num\":\"RAD-077\",\"service_name\":\"CT Scan\",\"department_id\":\"15\",\"priority\":\"Red Flag\"}', '2025-04-23 14:48:56'),
(150, 'ADD_QUEUE', 'queues', 1, 10, 'Tin', 'Admin', '{\"queue_num\":\"RAD-001\",\"service_name\":\"CT Scan\",\"department_id\":\"15\",\"priority\":\"Normal\"}', '2025-04-23 17:33:24'),
(151, 'ADD_QUEUE', 'queues', 2, 10, 'Tin', 'Admin', '{\"queue_num\":\"SW-002\",\"service_name\":\"Discharge Planning Assistance\",\"department_id\":\"14\",\"priority\":\"Normal\"}', '2025-04-23 17:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date_created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `name`, `description`, `date_created`) VALUES
(1, 'Billing', 'Handles patient billing and financial transactions', '2025-04-14 22:27:13'),
(2, 'Pharmacy', 'Manages and dispenses medications', '2025-04-14 22:27:13'),
(3, 'Medical Records', 'Maintains and secures patient health records', '2025-04-14 22:27:13'),
(4, 'Ultrasound', 'Conducts diagnostic ultrasound imaging', '2025-04-14 22:27:13'),
(5, 'X-ray', 'Performs radiographic imaging for diagnostics', '2025-04-14 22:27:13'),
(6, 'Rehabilitation', 'Provides physical therapy and rehabilitation services', '2025-04-14 22:27:13'),
(7, 'Dialysis', 'Provides treatment for kidney failure patients', '2025-04-14 22:27:13'),
(8, 'Laboratory', 'Conducts tests on patient specimens', '2025-04-14 22:27:13'),
(9, 'Admitting', 'Handles patient admissions and registration', '2025-04-14 22:27:13'),
(10, 'HMO', 'Handles insurance and health maintenance organization coordination', '2025-04-15 10:23:00'),
(11, 'Information', 'Provides information and assistance to patients and visitors', '2025-04-15 10:23:44'),
(12, 'CIM', 'Information Technology', '2025-04-15 14:43:36'),
(13, 'Emergency Room', NULL, '2025-04-18 01:59:58'),
(14, 'Social Worker', NULL, '2025-04-18 02:00:06'),
(15, 'Radiology', 'Provides diagnostic imaging services such as X-rays, CT scans, MRI, and ultrasound to help detect and monitor medical conditions.', '2025-04-23 22:39:30');

-- --------------------------------------------------------

--
-- Table structure for table `queues`
--

CREATE TABLE `queues` (
  `qid` int(11) NOT NULL,
  `queue_num` varchar(20) NOT NULL,
  `status` enum('waiting','in-progress','completed','postponed','pending') DEFAULT 'waiting',
  `service_name` varchar(100) NOT NULL,
  `priority` enum('Normal','Emergency','PWD','Senior Citizen','Pregnant','Red Flag') DEFAULT 'Normal',
  `department_id` int(11) NOT NULL,
  `announcement_count` int(11) NOT NULL,
  `was_postponed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `department_id`) VALUES
(1, 'Blood Test', 8),
(2, 'Urinalysis', 8),
(3, 'X-Ray', 5),
(4, 'Ultrasound', 4),
(5, 'Medication Pickup', 2),
(6, 'Physical Therapy', 6),
(7, 'Dialysis Treatment', 7),
(8, 'Billing Inquiry', 1),
(9, 'Patient Registration', 9),
(10, 'Insurance Claim', 10),
(11, 'Information Request', 11),
(12, ' Release of Information (ROI)', 3),
(13, 'Triage', 13),
(14, 'Discharge Planning Assistance', 14),
(15, 'CT Scan', 15);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','User','HMO','Admitting','Information') NOT NULL,
  `dept_id` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `dept_id`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Xen', '$2y$10$Z58UUPiBZWX5b4y6Zyor8.7mE2YLKZdQzRu9nsbKzwr8QFFmSY1ie', 'Admitting', 9, 2, '2025-04-15 02:31:55', '2025-04-15 02:31:55'),
(3, 'DONG', '$2y$10$GoNBVN06aGqEmhhAo5ZztO7TQnxc/ngkWxtPl89YJ5xJIvEwxHkUy', '', 8, 2, '2025-04-15 02:32:31', '2025-04-15 02:32:31'),
(4, 'Nyx', '$2y$10$VMOJCUh09IYJkl.ejuCQcevbycoB9gW/7auGXzj8bZhqqoMkQAegW', 'Information', 11, 2, '2025-04-15 04:05:06', '2025-04-15 04:05:06'),
(5, 'Yen', '$2y$10$42wkSUWL1p8XOnHICA0uyu2Ma8btx.LWsOUqjtwwFbRm1Cm6q6wPW', 'HMO', 10, 2, '2025-04-15 04:05:35', '2025-04-15 04:05:35'),
(6, 'Heh', '$2y$10$KcjduysYYlO0i8trLhownutfHmo12uVo/8QKZAAxdV5hlky7pUvxC', 'User', 8, 2, '2025-04-15 04:06:53', '2025-04-15 04:06:53'),
(7, 'luh', '$2y$10$VwQSem/XEIre2Rxpgbt3EO.puv1K.Nb12ZW4.umrLzfMhPHARVRWe', 'User', 1, 2, '2025-04-15 04:07:24', '2025-04-15 04:07:24'),
(10, 'Tin', '$2y$10$HxFf4zny7DRl0.ChIVOH1.pZFsKKZW40HafT31rly2lGGUgxLOwNm', 'Admin', 12, 2, '2025-04-15 06:44:17', '2025-04-15 06:44:17'),
(11, '@Dm1n', '$2y$10$KffkYJ.7Ek9nc6daqS1pyOTDBaBCMAdlIkkNQj49QPTAyVhRyw7P2', 'Admitting', 9, 2, '2025-04-18 06:22:42', '2025-04-18 06:22:42'),
(12, 'qwe', '$2y$10$QFPj0AQGnrjUpO1Beml5Ze2NOBBIAVRYHV7c3mHydTAAf6fEzIT3S', 'User', 11, 2, '2025-04-18 06:26:47', '2025-04-18 06:26:47'),
(13, 'Lonely', '$2y$10$/F80aPeTaUaFi5QrGnMeze9/fAhFzxn949tQPIBz6BGE81O9RdhU6', 'User', 15, 2, '2025-04-23 15:06:17', '2025-04-23 15:06:17'),
(14, 'Err', '$2y$10$fVlZFkEP2KqW5BXUV..ltO1UKgeumNpJRCHlUUW7gfl.tXyejjwuO', 'User', 15, 2, '2025-04-23 15:11:38', '2025-04-23 15:11:38'),
(15, 'Mae', '$2y$10$fWtOAHttpyoA4DsiGmhncOWUxoPBLo.5gkkurfEQwWGF49DQHXdTG', 'User', 15, 2, '2025-04-23 15:19:42', '2025-04-23 15:19:42'),
(16, 'def', '$2y$10$Jf9HBWnKsM00krgcHk4dw.KRnRkSmTasuoZIGq.7JjDKvdqvaIire', 'User', 3, 2, '2025-04-23 15:22:00', '2025-04-23 15:22:00'),
(17, 'fed', '$2y$10$Jtf9KRXjCFdGBCsbbmzSG.4mSuHUqgkYgf4VyJxgLFoSg6dl4ceiC', 'User', 14, 2, '2025-04-23 15:22:35', '2025-04-23 15:22:35'),
(18, 'edf', '$2y$10$iDt0LhzMK6WBz2TXuPNDieyU7YKXAnEmCcZzjBvQPpK.E/F11VRyS', 'User', 13, 2, '2025-04-23 15:23:06', '2025-04-23 15:23:06'),
(19, 'see', '$2y$10$YHvyI7AwoUfN5SoVEENOR.tSXMZD9Bj8bJw1eWb9GahFIrnzl.2..', 'User', 15, 2, '2025-04-23 15:23:43', '2025-04-23 15:23:43'),
(20, 'Labo', '$2y$10$I2n3ndKmn/TIrAFr3ZGraucoD9zC19m/hCSCD4AQKgvPZPOVZ8t.u', 'User', 8, 2, '2025-04-23 17:15:06', '2025-04-23 17:15:06'),
(21, 'xr', '$2y$10$NrRfBBlWRCz1JM/DPT8TT.wMNenDqEQJ9Whz8sM4ck5F6HVFcgS0W', 'User', 5, 2, '2025-04-23 17:16:17', '2025-04-23 17:16:17'),
(22, 'ult', '$2y$10$xij2Su1h1u03ihSQSqN0veycVX.bEjHU0O9dPxOTI17Bl9ODfV/SO', 'User', 4, 2, '2025-04-23 17:16:32', '2025-04-23 17:16:32'),
(23, 'pha', '$2y$10$tFeflODhiFPj4ajBG2Exee3C3NyGSCp30PBmhrnPCewK52Ztbul5W', 'User', 2, 2, '2025-04-23 17:16:46', '2025-04-23 17:16:46'),
(24, 'eme', '$2y$10$90hOztiJvTf/kJtBZqtmyenJJ7bFCLqSW1CfUb8ORNmPQASONzrxG', 'User', 13, 2, '2025-04-23 17:17:05', '2025-04-23 17:17:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `queues`
--
ALTER TABLE `queues`
  ADD PRIMARY KEY (`qid`),
  ADD KEY `fk_queues_department` (`department_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_users_department` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `queues`
--
ALTER TABLE `queues`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `queues`
--
ALTER TABLE `queues`
  ADD CONSTRAINT `fk_queues_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`dept_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_department` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `reset_queues_daily` ON SCHEDULE EVERY 1 DAY STARTS '2025-04-21 08:00:00' ON COMPLETION NOT PRESERVE DISABLE DO TRUNCATE TABLE queues$$

CREATE DEFINER=`root`@`localhost` EVENT `reset_queues_test` ON SCHEDULE EVERY 3 MINUTE STARTS '2025-04-21 11:10:19' ON COMPLETION NOT PRESERVE ENABLE DO TRUNCATE TABLE queues$$

CREATE DEFINER=`root`@`localhost` EVENT `reset_queues_midnight` ON SCHEDULE EVERY 1 DAY STARTS '2025-04-21 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO TRUNCATE TABLE queues$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
