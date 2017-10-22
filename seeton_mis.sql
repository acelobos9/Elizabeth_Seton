-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2017 at 08:44 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seeton_mis`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_ay_student_fees`
--

CREATE TABLE `acc_ay_student_fees` (
  `id` int(11) NOT NULL,
  `ay_id` int(11) DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acc_ay_student_fee_groups`
--

CREATE TABLE `acc_ay_student_fee_groups` (
  `id` int(11) NOT NULL,
  `acc_ay_student_fee_id` int(11) DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `acc_student_fees_amount`
--

CREATE TABLE `acc_student_fees_amount` (
  `id` int(11) NOT NULL,
  `acc_ay_student_fee_group_id` int(11) DEFAULT NULL,
  `lib_acc_student_fee_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `adduser`
--

CREATE TABLE `adduser` (
  `id` int(11) NOT NULL,
  `firstName` varchar(64) NOT NULL,
  `lastName` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adduser`
--

INSERT INTO `adduser` (`id`, `firstName`, `lastName`, `created_at`, `updated_at`) VALUES
(2, 'Nicole', 'Lumagui', '2017-10-07 06:34:59', '2017-10-07 06:34:59'),
(3, 'Ace', 'Lobos', '2017-10-14 08:56:11', '2017-10-14 08:56:11'),
(4, 'Andrea', 'Lumagui', '2017-10-14 08:57:12', '2017-10-14 08:57:12'),
(5, 'Ian', 'Lobos', '2017-10-14 09:05:30', '2017-10-14 09:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `adm_info`
--

CREATE TABLE `adm_info` (
  `id` int(11) NOT NULL,
  `campus` varchar(255) NOT NULL,
  `schedule_pref` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `year_level_id` int(11) NOT NULL,
  `nationality` varchar(128) NOT NULL,
  `religion` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ay_academic_year`
--

CREATE TABLE `ay_academic_year` (
  `id` int(11) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ay_academic_year`
--

INSERT INTO `ay_academic_year` (`id`, `date_from`, `date_to`) VALUES
(1, '2017-10-00', '2018-10-00');

-- --------------------------------------------------------

--
-- Table structure for table `ay_classes`
--

CREATE TABLE `ay_classes` (
  `id` int(11) NOT NULL,
  `ay_id` int(11) DEFAULT NULL,
  `ay_section_id` int(11) DEFAULT NULL,
  `lib_academic_subject_id` int(11) DEFAULT NULL,
  `em_id` int(11) DEFAULT NULL,
  `room_location` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ay_classes_schedule`
--

CREATE TABLE `ay_classes_schedule` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `ay_classes_id` int(11) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `datetime_from` datetime DEFAULT NULL,
  `datetime_to` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ay_enrolled_students`
--

CREATE TABLE `ay_enrolled_students` (
  `id` int(11) NOT NULL,
  `ay_classes_id` int(11) DEFAULT NULL,
  `ay_id` int(11) DEFAULT NULL,
  `ay_section_id` int(11) DEFAULT NULL,
  `lib_academic_subject_id` int(11) DEFAULT NULL,
  `si_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ay_grades`
--

CREATE TABLE `ay_grades` (
  `id` int(11) NOT NULL,
  `ay_enrolled_student_id` int(11) DEFAULT NULL,
  `ay_semester_id` int(11) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ay_sections`
--

CREATE TABLE `ay_sections` (
  `id` int(11) NOT NULL,
  `ay_id` int(11) DEFAULT NULL,
  `lib_academic_level_id` int(11) DEFAULT NULL,
  `lib_academic_section_id` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ay_semesters`
--

CREATE TABLE `ay_semesters` (
  `id` int(11) NOT NULL,
  `ay_id` int(11) DEFAULT NULL,
  `lib_academic_semester_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `em_educational_background`
--

CREATE TABLE `em_educational_background` (
  `id` int(11) NOT NULL,
  `em_id` int(11) DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `final_grade` double DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(55) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `date_ended` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `em_employees_information`
--

CREATE TABLE `em_employees_information` (
  `id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `employee_number` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `em_movement`
--

CREATE TABLE `em_movement` (
  `id` int(11) NOT NULL,
  `em_record_id` int(11) DEFAULT NULL,
  `lib_em_movement_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `em_records`
--

CREATE TABLE `em_records` (
  `id` int(11) NOT NULL,
  `em_id` int(11) DEFAULT NULL,
  `lib_em_position_id` int(11) DEFAULT NULL,
  `lib_em_department_id` int(11) DEFAULT NULL,
  `lib_em_type_id` int(11) DEFAULT NULL,
  `lib_em_status_id` int(11) DEFAULT NULL,
  `salary_currency` varchar(20) DEFAULT NULL,
  `salary_amount` double DEFAULT NULL,
  `lib_em_company_id` int(11) DEFAULT NULL,
  `date_started` date DEFAULT NULL COMMENT 'also known as date hired',
  `date_ended` date DEFAULT NULL COMMENT 'date resigned, or date terminated as long as it is ended',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_academic_levels`
--

CREATE TABLE `lib_academic_levels` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lib_academic_levels`
--

INSERT INTO `lib_academic_levels` (`id`, `code`, `name`) VALUES
(13, 'GR-10', 'Grade 10'),
(14, 'GR-11', 'Grade 11'),
(15, 'GR-12', 'Grade 12');

-- --------------------------------------------------------

--
-- Table structure for table `lib_academic_sections`
--

CREATE TABLE `lib_academic_sections` (
  `id` int(11) NOT NULL,
  `lib_academic_level_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_academic_semesters`
--

CREATE TABLE `lib_academic_semesters` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_academic_subjects`
--

CREATE TABLE `lib_academic_subjects` (
  `id` int(11) NOT NULL,
  `lib_academic_level_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_acc_student_fees`
--

CREATE TABLE `lib_acc_student_fees` (
  `id` int(11) NOT NULL,
  `code` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_cities`
--

CREATE TABLE `lib_cities` (
  `id` int(11) NOT NULL,
  `lib_state_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_countries`
--

CREATE TABLE `lib_countries` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_em_companies`
--

CREATE TABLE `lib_em_companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_em_departments`
--

CREATE TABLE `lib_em_departments` (
  `id` int(11) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_em_movement_type`
--

CREATE TABLE `lib_em_movement_type` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_em_positions`
--

CREATE TABLE `lib_em_positions` (
  `id` int(11) NOT NULL,
  `lib_em_department_id` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '(0,1) 0 = seton''s record, 1 = others'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_em_status`
--

CREATE TABLE `lib_em_status` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_em_type`
--

CREATE TABLE `lib_em_type` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(155) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_pi_addresses`
--

CREATE TABLE `lib_pi_addresses` (
  `id` int(11) NOT NULL,
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `lib_country_id` int(11) DEFAULT NULL,
  `lib_state_id` int(11) DEFAULT NULL,
  `lib_city_id` int(11) DEFAULT NULL,
  `zip_postal_code` varchar(9) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_pi_marital_status`
--

CREATE TABLE `lib_pi_marital_status` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_pi_nationality`
--

CREATE TABLE `lib_pi_nationality` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_pi_religion`
--

CREATE TABLE `lib_pi_religion` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_sis_admission_entry_statuses`
--

CREATE TABLE `lib_sis_admission_entry_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL COMMENT 'PENDING,PASSED,INCOMPLETE'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lib_sis_admission_entry_statuses`
--

INSERT INTO `lib_sis_admission_entry_statuses` (`id`, `name`) VALUES
(0, 'Pending'),
(1, 'Passed'),
(2, 'Failed');

-- --------------------------------------------------------

--
-- Table structure for table `lib_sis_admission_processes`
--

CREATE TABLE `lib_sis_admission_processes` (
  `id` int(11) NOT NULL,
  `code` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lib_states`
--

CREATE TABLE `lib_states` (
  `id` int(11) NOT NULL,
  `lib_country_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_09_21_063830_entrust_setup_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('arjayrozulbonus@gmail.com', '$2y$10$1p5yrPvx8IpkBJCZ66eAIe2qGo9wgCzJQa5YRN.DoEi0ZFk/O7Amy', '2017-10-02 20:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pi_addresses`
--

CREATE TABLE `pi_addresses` (
  `id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `lib_pi_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pi_childrens`
--

CREATE TABLE `pi_childrens` (
  `id` int(11) NOT NULL,
  `pi_parent_id` int(11) DEFAULT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pi_childrens`
--

INSERT INTO `pi_childrens` (`id`, `pi_parent_id`, `pi_id`, `created_at`, `updated_at`) VALUES
(1, 33, 34, '2017-10-21', '2017-10-21'),
(2, 35, 36, '2017-10-21', '2017-10-21'),
(3, 37, 38, '2017-10-21', '2017-10-21'),
(4, 39, 40, '2017-10-21', '2017-10-21'),
(5, 41, 42, '2017-10-21', '2017-10-21'),
(6, 43, 44, '2017-10-21', '2017-10-21'),
(7, 45, 46, '2017-10-21', '2017-10-21'),
(8, 47, 48, '2017-10-21', '2017-10-21'),
(9, 49, 50, '2017-10-21', '2017-10-21'),
(10, 51, 52, '2017-10-21', '2017-10-21'),
(11, 53, 54, '2017-10-21', '2017-10-21'),
(12, 55, 56, '2017-10-21', '2017-10-21'),
(13, 57, 58, '2017-10-21', '2017-10-21'),
(14, 59, 60, '2017-10-21', '2017-10-21'),
(15, 61, 62, '2017-10-21', '2017-10-21'),
(16, 63, 64, '2017-10-21', '2017-10-21'),
(17, 65, 66, '2017-10-21', '2017-10-21'),
(18, 67, 68, '2017-10-21', '2017-10-21'),
(19, 69, 70, '2017-10-21', '2017-10-21'),
(20, 71, 72, '2017-10-21', '2017-10-21'),
(21, 73, 74, '2017-10-21', '2017-10-21'),
(22, 75, 76, '2017-10-21', '2017-10-21'),
(23, 77, 78, '2017-10-21', '2017-10-21'),
(24, 79, 80, '2017-10-21', '2017-10-21'),
(25, 81, 82, '2017-10-21', '2017-10-21'),
(26, 83, 84, '2017-10-22', '2017-10-22'),
(27, 85, 86, '2017-10-22', '2017-10-22'),
(28, 87, 88, '2017-10-22', '2017-10-22'),
(29, 89, 90, '2017-10-22', '2017-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `pi_contacts`
--

CREATE TABLE `pi_contacts` (
  `id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `type` varchar(55) DEFAULT NULL,
  `number` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pi_documents`
--

CREATE TABLE `pi_documents` (
  `id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pi_emergency`
--

CREATE TABLE `pi_emergency` (
  `id` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_email` varchar(126) DEFAULT NULL,
  `contact_relationship` varchar(255) NOT NULL,
  `contact_address` varchar(255) NOT NULL,
  `contact_municipality` varchar(255) NOT NULL,
  `contact_province` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pi_emergency`
--

INSERT INTO `pi_emergency` (`id`, `contact_name`, `contact_email`, `contact_relationship`, `contact_address`, `contact_municipality`, `contact_province`, `created_at`, `updated_at`) VALUES
(1, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(2, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(3, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(4, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(5, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(6, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(7, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(8, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(9, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(10, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(11, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(12, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(13, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(14, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', '035 Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(15, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanaz', 'Cavite', '2017-10-21', '2017-10-21'),
(16, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanaz', 'Cavite', '2017-10-21', '2017-10-21'),
(17, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanaz', 'Cavite', '2017-10-21', '2017-10-21'),
(18, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(19, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(20, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(21, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(22, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(23, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(24, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(25, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(26, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(27, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(28, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(29, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(30, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(31, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(32, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(33, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(34, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(35, 'nicole lumagui', 'acelobos9@gmail.com', 'Wife', 'Sanja Mayor', 'Tanza', 'Cavite', '2017-10-21', '2017-10-21'),
(36, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', 'Paradahan', 'Tanza', 'Cavite', '2017-10-22', '2017-10-22'),
(37, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', 'Paradahan', 'Tanza', 'Cavite', '2017-10-22', '2017-10-22'),
(38, 'Nicole Lumagui', 'acelobos9@gmail.com', 'Wife', 'Paradahan', 'Tanza', 'Cavite', '2017-10-22', '2017-10-22'),
(39, 'Nicole', 'acelobos9@gmail.com', 'Wife', 'Paradahan', 'Tanza', 'Cavite', '2017-10-22', '2017-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `pi_parents`
--

CREATE TABLE `pi_parents` (
  `id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pi_personal_information`
--

CREATE TABLE `pi_personal_information` (
  `id` int(11) NOT NULL,
  `firstname` varchar(55) DEFAULT NULL,
  `middlename` varchar(55) DEFAULT NULL,
  `lastname` varchar(55) DEFAULT NULL,
  `extension_name` varchar(10) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `lib_marital_status_id` int(11) DEFAULT NULL,
  `lib_nationality_id` int(11) DEFAULT NULL,
  `lib_religion_id` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `emergency_id` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pi_personal_information`
--

INSERT INTO `pi_personal_information` (`id`, `firstname`, `middlename`, `lastname`, `extension_name`, `birthdate`, `gender`, `lib_marital_status_id`, `lib_nationality_id`, `lib_religion_id`, `weight`, `height`, `emergency_id`, `created_at`, `updated_at`) VALUES
(1, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'on', NULL, 1, 1, NULL, NULL, '', '2017-10-16 09:05:12', '2017-10-16 09:05:12'),
(2, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'on', NULL, 1, 1, NULL, NULL, '', '2017-10-16 09:05:46', '2017-10-16 09:05:46'),
(3, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'on', NULL, 1, 1, NULL, NULL, '', '2017-10-16 09:09:14', '2017-10-16 09:09:14'),
(4, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'on', NULL, 1, 1, NULL, NULL, '', '2017-10-16 09:34:49', '2017-10-16 09:34:49'),
(5, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'on', NULL, 1, 1, NULL, NULL, '', '2017-10-16 09:34:58', '2017-10-16 09:34:58'),
(6, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'on', NULL, 1, 1, NULL, NULL, '', '2017-10-16 09:40:28', '2017-10-16 09:40:28'),
(7, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'on', NULL, 1, 1, NULL, NULL, '', '2017-10-16 09:40:38', '2017-10-16 09:40:38'),
(8, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2017-10-16 09:40:38', '2017-10-16 09:40:38'),
(9, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:07:04', '2017-10-21 09:07:04'),
(10, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:07:34', '2017-10-21 09:07:34'),
(11, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:09:03', '2017-10-21 09:09:03'),
(12, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:10:28', '2017-10-21 09:10:28'),
(13, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:11:32', '2017-10-21 09:11:32'),
(14, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '1', '2017-10-21 09:11:32', '2017-10-21 09:11:32'),
(15, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:11:51', '2017-10-21 09:11:51'),
(16, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '2', '2017-10-21 09:11:51', '2017-10-21 09:11:51'),
(17, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:12:06', '2017-10-21 09:12:06'),
(18, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '3', '2017-10-21 09:12:06', '2017-10-21 09:12:06'),
(19, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:12:18', '2017-10-21 09:12:18'),
(20, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '4', '2017-10-21 09:12:18', '2017-10-21 09:12:18'),
(21, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:13:38', '2017-10-21 09:13:38'),
(22, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '5', '2017-10-21 09:13:38', '2017-10-21 09:13:38'),
(23, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:14:10', '2017-10-21 09:14:10'),
(24, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '6', '2017-10-21 09:14:10', '2017-10-21 09:14:10'),
(25, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:14:51', '2017-10-21 09:14:51'),
(26, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '7', '2017-10-21 09:14:51', '2017-10-21 09:14:51'),
(27, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:17:29', '2017-10-21 09:17:29'),
(28, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '8', '2017-10-21 09:17:29', '2017-10-21 09:17:29'),
(29, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:21:34', '2017-10-21 09:21:34'),
(30, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '9', '2017-10-21 09:21:34', '2017-10-21 09:21:34'),
(31, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:22:15', '2017-10-21 09:22:15'),
(32, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '10', '2017-10-21 09:22:15', '2017-10-21 09:22:15'),
(33, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:24:25', '2017-10-21 09:24:25'),
(34, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '11', '2017-10-21 09:24:25', '2017-10-21 09:24:25'),
(35, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:25:08', '2017-10-21 09:25:08'),
(36, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '12', '2017-10-21 09:25:08', '2017-10-21 09:25:08'),
(37, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:29:18', '2017-10-21 09:29:18'),
(38, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '13', '2017-10-21 09:29:18', '2017-10-21 09:29:18'),
(39, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:33:24', '2017-10-21 09:33:24'),
(40, 'Ace', 'Querubin', 'Lobos', NULL, '1996-09-28', 'Male', NULL, 1, 1, NULL, NULL, '14', '2017-10-21 09:33:24', '2017-10-21 09:33:24'),
(41, 'ASDFGH', 'VZXZB', 'QWERT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:34:46', '2017-10-21 09:34:46'),
(42, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-03', 'Male', NULL, 1, 1, NULL, NULL, '15', '2017-10-21 09:34:46', '2017-10-21 09:34:46'),
(43, 'ASDFGH', 'VZXZB', 'QWERT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:36:21', '2017-10-21 09:36:21'),
(44, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-03', 'Male', NULL, 1, 1, NULL, NULL, '16', '2017-10-21 09:36:21', '2017-10-21 09:36:21'),
(45, 'ASDFGH', 'VZXZB', 'QWERT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:36:23', '2017-10-21 09:36:23'),
(46, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-03', 'Male', NULL, 1, 1, NULL, NULL, '17', '2017-10-21 09:36:23', '2017-10-21 09:36:23'),
(47, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:39:24', '2017-10-21 09:39:24'),
(48, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '18', '2017-10-21 09:39:24', '2017-10-21 09:39:24'),
(49, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:40:50', '2017-10-21 09:40:50'),
(50, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '19', '2017-10-21 09:40:50', '2017-10-21 09:40:50'),
(51, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:46:11', '2017-10-21 09:46:11'),
(52, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '20', '2017-10-21 09:46:11', '2017-10-21 09:46:11'),
(53, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:46:54', '2017-10-21 09:46:54'),
(54, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '21', '2017-10-21 09:46:54', '2017-10-21 09:46:54'),
(55, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:51:29', '2017-10-21 09:51:29'),
(56, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '22', '2017-10-21 09:51:29', '2017-10-21 09:51:29'),
(57, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 09:52:02', '2017-10-21 09:52:02'),
(58, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '23', '2017-10-21 09:52:02', '2017-10-21 09:52:02'),
(59, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:03:47', '2017-10-21 10:03:47'),
(60, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '24', '2017-10-21 10:03:47', '2017-10-21 10:03:47'),
(61, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:06:27', '2017-10-21 10:06:27'),
(62, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '25', '2017-10-21 10:06:27', '2017-10-21 10:06:27'),
(63, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:06:36', '2017-10-21 10:06:36'),
(64, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '26', '2017-10-21 10:06:36', '2017-10-21 10:06:36'),
(65, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:06:54', '2017-10-21 10:06:54'),
(66, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '27', '2017-10-21 10:06:54', '2017-10-21 10:06:54'),
(67, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:07:36', '2017-10-21 10:07:36'),
(68, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '28', '2017-10-21 10:07:36', '2017-10-21 10:07:36'),
(69, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:08:55', '2017-10-21 10:08:55'),
(70, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '29', '2017-10-21 10:08:55', '2017-10-21 10:08:55'),
(71, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:11:39', '2017-10-21 10:11:39'),
(72, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '30', '2017-10-21 10:11:39', '2017-10-21 10:11:39'),
(73, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:17:03', '2017-10-21 10:17:03'),
(74, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '31', '2017-10-21 10:17:03', '2017-10-21 10:17:03'),
(75, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:17:12', '2017-10-21 10:17:12'),
(76, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '32', '2017-10-21 10:17:12', '2017-10-21 10:17:12'),
(77, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:17:34', '2017-10-21 10:17:34'),
(78, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '33', '2017-10-21 10:17:35', '2017-10-21 10:17:35'),
(79, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:19:18', '2017-10-21 10:19:18'),
(80, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '34', '2017-10-21 10:19:18', '2017-10-21 10:19:18'),
(81, 'GFDSA', 'BVCXZ', 'YTREWQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-21 10:22:34', '2017-10-21 10:22:34'),
(82, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 2, 1, NULL, NULL, '35', '2017-10-21 10:22:34', '2017-10-21 10:22:34'),
(83, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-22 01:26:10', '2017-10-22 01:26:10'),
(84, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-19', 'Male', NULL, 1, 1, NULL, NULL, '36', '2017-10-22 01:26:10', '2017-10-22 01:26:10'),
(85, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-22 01:26:31', '2017-10-22 01:26:31'),
(86, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-19', 'Male', NULL, 1, 1, NULL, NULL, '37', '2017-10-22 01:26:31', '2017-10-22 01:26:31'),
(87, 'Clara', 'Querubin', 'Cana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-22 01:30:14', '2017-10-22 01:30:14'),
(88, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-19', 'Male', NULL, 1, 1, NULL, NULL, '38', '2017-10-22 01:30:14', '2017-10-22 01:30:14'),
(89, 'Lobos', 'Cana', 'Querubin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-10-22 01:43:32', '2017-10-22 01:43:32'),
(90, 'Ace', 'Querubin', 'Lobos', NULL, '2017-10-10', 'Male', NULL, 1, 1, NULL, NULL, '39', '2017-10-22 01:43:32', '2017-10-22 01:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `pi_user_account`
--

CREATE TABLE `pi_user_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `sample`
-- (See below for the actual view)
--
CREATE TABLE `sample` (
`ay_semester_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `sis_admission_contact`
--

CREATE TABLE `sis_admission_contact` (
  `id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `mobile_no` varchar(32) DEFAULT NULL,
  `landline` varchar(32) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sis_admission_contact`
--

INSERT INTO `sis_admission_contact` (`id`, `pi_id`, `email`, `mobile_no`, `landline`, `created_at`, `updated_at`) VALUES
(1, 16, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(2, 18, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(3, 20, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(4, 22, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(5, 24, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(6, 26, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(7, 28, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(8, 30, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(9, 32, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(10, 34, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(11, 36, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(12, 38, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(13, 40, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(14, 42, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(15, 44, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(16, 46, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-21', '2017-10-21'),
(17, 48, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(18, 50, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(19, 52, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(20, 54, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(21, 56, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(22, 58, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(23, 60, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(24, 62, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(25, 64, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(26, 66, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(27, 68, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(28, 70, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(29, 72, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(30, 74, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(31, 76, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(32, 78, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(33, 80, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(34, 82, 'acelobos9@gmail.com', '09168345949', 'none', '2017-10-21', '2017-10-21'),
(35, 84, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-22', '2017-10-22'),
(36, 86, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-22', '2017-10-22'),
(37, 88, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-22', '2017-10-22'),
(38, 90, 'acelobos9@gmail.com', '9168345949', 'none', '2017-10-22', '2017-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `sis_admission_entry`
--

CREATE TABLE `sis_admission_entry` (
  `id` int(11) NOT NULL,
  `reference_code` varchar(11) NOT NULL,
  `lib_campus_id` int(11) NOT NULL,
  `schedule_pref` int(11) NOT NULL,
  `lib_course_id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `lib_academic_levels` int(11) NOT NULL,
  `lib_sis_admission_entry_status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sis_admission_entry`
--

INSERT INTO `sis_admission_entry` (`id`, `reference_code`, `lib_campus_id`, `schedule_pref`, `lib_course_id`, `pi_id`, `lib_academic_levels`, `lib_sis_admission_entry_status_id`, `created_at`, `updated_at`) VALUES
(1, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 08:49:15', '2017-10-16 08:49:15'),
(2, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 08:57:13', '2017-10-16 08:57:13'),
(3, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 08:59:14', '2017-10-16 08:59:14'),
(4, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:02:01', '2017-10-16 09:02:01'),
(5, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:04:09', '2017-10-16 09:04:09'),
(6, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:04:25', '2017-10-16 09:04:25'),
(7, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:05:12', '2017-10-16 09:05:12'),
(8, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:05:46', '2017-10-16 09:05:46'),
(9, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:09:14', '2017-10-16 09:09:14'),
(10, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:34:49', '2017-10-16 09:34:49'),
(11, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:34:58', '2017-10-16 09:34:58'),
(12, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:40:28', '2017-10-16 09:40:28'),
(13, '', 1, 1, 9, NULL, 15, 0, '2017-10-16 09:40:38', '2017-10-16 09:40:38'),
(14, 'APRDKL', 2, 2, 8, NULL, 15, 0, '2017-10-21 08:53:57', '2017-10-21 08:53:57'),
(15, 'SYFWFG', 2, 2, 8, NULL, 15, 0, '2017-10-21 08:57:13', '2017-10-21 08:57:13'),
(16, 'IPENZS', 2, 2, 8, NULL, 15, 0, '2017-10-21 08:57:33', '2017-10-21 08:57:33'),
(17, 'KGIXFC', 2, 2, 8, NULL, 15, 0, '2017-10-21 08:57:36', '2017-10-21 08:57:36'),
(18, 'TEXNGA', 2, 2, 8, NULL, 15, 0, '2017-10-21 08:57:40', '2017-10-21 08:57:40'),
(19, 'AOQXWJ', 2, 2, 8, NULL, 15, 0, '2017-10-21 08:57:51', '2017-10-21 08:57:51'),
(20, 'OBBMCU', 2, 2, 8, NULL, 15, 0, '2017-10-21 08:58:21', '2017-10-21 08:58:21'),
(21, 'IKRTST', 2, 2, 8, NULL, 15, 0, '2017-10-21 08:59:27', '2017-10-21 08:59:27'),
(22, 'MHKFVN', 2, 2, 8, NULL, 15, 0, '2017-10-21 08:59:37', '2017-10-21 08:59:37'),
(23, 'TZWIKF', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:01:56', '2017-10-21 09:01:56'),
(24, 'GYCIGK', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:03:03', '2017-10-21 09:03:03'),
(25, 'TAZDER', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:04:27', '2017-10-21 09:04:27'),
(26, 'QSBTCC', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:05:18', '2017-10-21 09:05:18'),
(27, 'ZZZLCK', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:06:03', '2017-10-21 09:06:03'),
(28, 'UEAWGT', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:06:21', '2017-10-21 09:06:21'),
(29, 'PXQTZL', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:07:04', '2017-10-21 09:07:04'),
(30, 'KYFOGJ', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:07:34', '2017-10-21 09:07:34'),
(31, 'PFYIJH', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:09:03', '2017-10-21 09:09:03'),
(32, 'KIJYOS', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:10:28', '2017-10-21 09:10:28'),
(33, 'WJJYAI', 2, 1, 8, NULL, 14, 0, '2017-10-21 09:11:32', '2017-10-21 09:11:32'),
(34, 'TCXLXS', 2, 1, 8, 16, 14, 0, '2017-10-21 09:11:51', '2017-10-21 09:11:51'),
(35, 'ERQVOA', 2, 1, 8, 18, 14, 0, '2017-10-21 09:12:06', '2017-10-21 09:12:06'),
(36, 'KVCEOG', 2, 1, 8, 20, 14, 0, '2017-10-21 09:12:18', '2017-10-21 09:12:18'),
(37, 'KQLRJS', 2, 1, 8, 22, 14, 0, '2017-10-21 09:13:38', '2017-10-21 09:13:38'),
(38, 'RMUUBQ', 2, 1, 8, 24, 14, 0, '2017-10-21 09:14:10', '2017-10-21 09:14:10'),
(39, 'KJSWXL', 2, 1, 8, 26, 14, 0, '2017-10-21 09:14:51', '2017-10-21 09:14:51'),
(40, 'AAXSGT', 2, 1, 8, 28, 14, 0, '2017-10-21 09:17:29', '2017-10-21 09:17:29'),
(41, 'KFSLML', 2, 1, 8, 30, 14, 0, '2017-10-21 09:21:34', '2017-10-21 09:21:34'),
(42, 'LAKFED', 2, 1, 8, 32, 14, 0, '2017-10-21 09:22:15', '2017-10-21 09:22:15'),
(43, 'JCUQJU', 2, 1, 8, 34, 14, 0, '2017-10-21 09:24:25', '2017-10-21 09:24:25'),
(44, 'PIZZCK', 2, 1, 8, 36, 14, 0, '2017-10-21 09:25:08', '2017-10-21 09:25:08'),
(45, 'SSLSBU', 2, 1, 8, 38, 14, 0, '2017-10-21 09:29:18', '2017-10-21 09:29:18'),
(46, 'TDIHNG', 2, 1, 8, 40, 14, 0, '2017-10-21 09:33:24', '2017-10-21 09:33:24'),
(47, 'HXMKUF', 2, 2, 9, 42, 4, 0, '2017-10-21 09:34:46', '2017-10-21 09:34:46'),
(48, 'CCFPCO', 2, 2, 9, 44, 4, 0, '2017-10-21 09:36:21', '2017-10-21 09:36:21'),
(49, 'NJTPQR', 2, 2, 9, 46, 4, 0, '2017-10-21 09:36:23', '2017-10-21 09:36:23'),
(50, 'CHAEZC', 1, 1, 9, 48, 2, 0, '2017-10-21 09:39:24', '2017-10-21 09:39:24'),
(51, 'XHTISF', 1, 1, 9, 50, 2, 0, '2017-10-21 09:40:50', '2017-10-21 09:40:50'),
(52, 'FHPPLD', 1, 1, 9, 52, 2, 0, '2017-10-21 09:46:11', '2017-10-21 09:46:11'),
(53, 'ANJEFE', 1, 1, 9, 54, 2, 0, '2017-10-21 09:46:54', '2017-10-21 09:46:54'),
(54, 'GBANIO', 1, 1, 9, 56, 2, 0, '2017-10-21 09:51:29', '2017-10-21 09:51:29'),
(55, 'DLJFRR', 1, 1, 9, 58, 2, 0, '2017-10-21 09:52:02', '2017-10-21 09:52:02'),
(56, 'DSSMUF', 1, 1, 9, 60, 2, 0, '2017-10-21 10:03:47', '2017-10-21 10:03:47'),
(57, 'OVGGJH', 1, 1, 9, 62, 2, 0, '2017-10-21 10:06:27', '2017-10-21 10:06:27'),
(58, 'PJWRON', 1, 1, 9, 64, 2, 0, '2017-10-21 10:06:36', '2017-10-21 10:06:36'),
(59, 'CQNVGI', 1, 1, 9, 66, 2, 0, '2017-10-21 10:06:54', '2017-10-21 10:06:54'),
(60, 'NYMBHM', 1, 1, 9, 68, 2, 0, '2017-10-21 10:07:36', '2017-10-21 10:07:36'),
(61, 'CCPDVB', 1, 1, 9, 70, 2, 0, '2017-10-21 10:08:55', '2017-10-21 10:08:55'),
(62, 'ONDXLU', 1, 1, 9, 72, 2, 0, '2017-10-21 10:11:39', '2017-10-21 10:11:39'),
(63, 'HKOSPP', 1, 1, 9, 74, 2, 0, '2017-10-21 10:17:03', '2017-10-21 10:17:03'),
(64, 'TGQIUI', 1, 1, 9, 76, 2, 0, '2017-10-21 10:17:12', '2017-10-21 10:17:12'),
(65, 'OUHNRB', 1, 1, 9, 78, 2, 0, '2017-10-21 10:17:34', '2017-10-21 10:17:35'),
(66, 'AKCQRU', 1, 1, 9, 80, 2, 0, '2017-10-21 10:19:18', '2017-10-21 10:19:18'),
(67, 'UZAWFC', 1, 1, 9, 82, 2, 0, '2017-10-21 10:22:34', '2017-10-21 10:22:34'),
(68, 'VEVVSX', 1, 1, 9, 84, 15, 0, '2017-10-22 01:26:10', '2017-10-22 01:26:10'),
(69, 'SUPIHR', 1, 1, 9, 86, 15, 0, '2017-10-22 01:26:31', '2017-10-22 01:26:31'),
(70, 'PJFKDV', 1, 1, 9, 88, 15, 0, '2017-10-22 01:30:14', '2017-10-22 01:30:14'),
(71, 'BLPWOZ', 2, 1, 8, 90, 15, 0, '2017-10-22 01:43:32', '2017-10-22 01:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `sis_admission_process_statuses`
--

CREATE TABLE `sis_admission_process_statuses` (
  `id` int(11) NOT NULL,
  `sis_admission_entry_id` int(11) DEFAULT NULL,
  `sis_admission_process_id` int(11) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL COMMENT 'DONE,PENDING,INCOMPLETE,FAILED'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sis_ay_admission_processes`
--

CREATE TABLE `sis_ay_admission_processes` (
  `id` int(11) NOT NULL,
  `ay_id` int(11) DEFAULT NULL,
  `lib_sis_admission_process_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `si_student_information`
--

CREATE TABLE `si_student_information` (
  `id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `lrn` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mark-Arjay Bonus', 'arjayrozulbonus@gmail.com', '$2y$10$aSIzrPOtGHaa.V//Gfu86OTfCjp75QIFUvHNO3R2ltP6FpY8fpMvK', 'JsHhUrXjMSTZSKvdihDU0atVwJVjjtn2TR017H0tThxreVxskvH85tGPbE4f', '2017-09-20 22:44:10', '2017-09-20 22:44:10');

-- --------------------------------------------------------

--
-- Structure for view `sample`
--
DROP TABLE IF EXISTS `sample`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sample`  AS  select `ay_grades`.`ay_semester_id` AS `ay_semester_id` from ((`ay_grades` join `role_user`) join `roles`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_ay_student_fees`
--
ALTER TABLE `acc_ay_student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_ay_student_fee_groups`
--
ALTER TABLE `acc_ay_student_fee_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_student_fees_amount`
--
ALTER TABLE `acc_student_fees_amount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adduser`
--
ALTER TABLE `adduser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adm_info`
--
ALTER TABLE `adm_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ay_academic_year`
--
ALTER TABLE `ay_academic_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ay_classes`
--
ALTER TABLE `ay_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ay_classes_schedule`
--
ALTER TABLE `ay_classes_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ay_enrolled_students`
--
ALTER TABLE `ay_enrolled_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ay_grades`
--
ALTER TABLE `ay_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ay_sections`
--
ALTER TABLE `ay_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ay_semesters`
--
ALTER TABLE `ay_semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `em_educational_background`
--
ALTER TABLE `em_educational_background`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `em_employees_information`
--
ALTER TABLE `em_employees_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `em_movement`
--
ALTER TABLE `em_movement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `em_records`
--
ALTER TABLE `em_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_academic_levels`
--
ALTER TABLE `lib_academic_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_academic_sections`
--
ALTER TABLE `lib_academic_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_academic_semesters`
--
ALTER TABLE `lib_academic_semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_academic_subjects`
--
ALTER TABLE `lib_academic_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_acc_student_fees`
--
ALTER TABLE `lib_acc_student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_cities`
--
ALTER TABLE `lib_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_countries`
--
ALTER TABLE `lib_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_em_companies`
--
ALTER TABLE `lib_em_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_em_departments`
--
ALTER TABLE `lib_em_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_em_movement_type`
--
ALTER TABLE `lib_em_movement_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_em_positions`
--
ALTER TABLE `lib_em_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_em_status`
--
ALTER TABLE `lib_em_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_em_type`
--
ALTER TABLE `lib_em_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_pi_addresses`
--
ALTER TABLE `lib_pi_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_pi_marital_status`
--
ALTER TABLE `lib_pi_marital_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_pi_nationality`
--
ALTER TABLE `lib_pi_nationality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_pi_religion`
--
ALTER TABLE `lib_pi_religion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_sis_admission_entry_statuses`
--
ALTER TABLE `lib_sis_admission_entry_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_sis_admission_processes`
--
ALTER TABLE `lib_sis_admission_processes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_states`
--
ALTER TABLE `lib_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `pi_addresses`
--
ALTER TABLE `pi_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_childrens`
--
ALTER TABLE `pi_childrens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_contacts`
--
ALTER TABLE `pi_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_documents`
--
ALTER TABLE `pi_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_emergency`
--
ALTER TABLE `pi_emergency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_parents`
--
ALTER TABLE `pi_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_personal_information`
--
ALTER TABLE `pi_personal_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_user_account`
--
ALTER TABLE `pi_user_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sis_admission_contact`
--
ALTER TABLE `sis_admission_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sis_admission_entry`
--
ALTER TABLE `sis_admission_entry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sis_admission_process_statuses`
--
ALTER TABLE `sis_admission_process_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sis_ay_admission_processes`
--
ALTER TABLE `sis_ay_admission_processes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `si_student_information`
--
ALTER TABLE `si_student_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_ay_student_fees`
--
ALTER TABLE `acc_ay_student_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_ay_student_fee_groups`
--
ALTER TABLE `acc_ay_student_fee_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acc_student_fees_amount`
--
ALTER TABLE `acc_student_fees_amount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adduser`
--
ALTER TABLE `adduser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `adm_info`
--
ALTER TABLE `adm_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ay_academic_year`
--
ALTER TABLE `ay_academic_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ay_classes`
--
ALTER TABLE `ay_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ay_classes_schedule`
--
ALTER TABLE `ay_classes_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ay_enrolled_students`
--
ALTER TABLE `ay_enrolled_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ay_grades`
--
ALTER TABLE `ay_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ay_sections`
--
ALTER TABLE `ay_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ay_semesters`
--
ALTER TABLE `ay_semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `em_educational_background`
--
ALTER TABLE `em_educational_background`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `em_employees_information`
--
ALTER TABLE `em_employees_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `em_movement`
--
ALTER TABLE `em_movement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `em_records`
--
ALTER TABLE `em_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_academic_levels`
--
ALTER TABLE `lib_academic_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `lib_academic_sections`
--
ALTER TABLE `lib_academic_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_academic_semesters`
--
ALTER TABLE `lib_academic_semesters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_academic_subjects`
--
ALTER TABLE `lib_academic_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_acc_student_fees`
--
ALTER TABLE `lib_acc_student_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_cities`
--
ALTER TABLE `lib_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_countries`
--
ALTER TABLE `lib_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_em_companies`
--
ALTER TABLE `lib_em_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_em_departments`
--
ALTER TABLE `lib_em_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_em_movement_type`
--
ALTER TABLE `lib_em_movement_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_em_positions`
--
ALTER TABLE `lib_em_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_em_status`
--
ALTER TABLE `lib_em_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_em_type`
--
ALTER TABLE `lib_em_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_pi_addresses`
--
ALTER TABLE `lib_pi_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_pi_marital_status`
--
ALTER TABLE `lib_pi_marital_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_pi_nationality`
--
ALTER TABLE `lib_pi_nationality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_pi_religion`
--
ALTER TABLE `lib_pi_religion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_sis_admission_processes`
--
ALTER TABLE `lib_sis_admission_processes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lib_states`
--
ALTER TABLE `lib_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pi_addresses`
--
ALTER TABLE `pi_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pi_childrens`
--
ALTER TABLE `pi_childrens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `pi_contacts`
--
ALTER TABLE `pi_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pi_documents`
--
ALTER TABLE `pi_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pi_emergency`
--
ALTER TABLE `pi_emergency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pi_personal_information`
--
ALTER TABLE `pi_personal_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `pi_user_account`
--
ALTER TABLE `pi_user_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sis_admission_contact`
--
ALTER TABLE `sis_admission_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `sis_admission_entry`
--
ALTER TABLE `sis_admission_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `sis_admission_process_statuses`
--
ALTER TABLE `sis_admission_process_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sis_ay_admission_processes`
--
ALTER TABLE `sis_ay_admission_processes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `si_student_information`
--
ALTER TABLE `si_student_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
