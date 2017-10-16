/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : seeton_mis

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-10-06 17:43:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acc_ay_student_fees
-- ----------------------------
DROP TABLE IF EXISTS `acc_ay_student_fees`;
CREATE TABLE `acc_ay_student_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ay_id` int(11) DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_ay_student_fees
-- ----------------------------

-- ----------------------------
-- Table structure for acc_ay_student_fee_groups
-- ----------------------------
DROP TABLE IF EXISTS `acc_ay_student_fee_groups`;
CREATE TABLE `acc_ay_student_fee_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_ay_student_fee_id` int(11) DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_ay_student_fee_groups
-- ----------------------------

-- ----------------------------
-- Table structure for acc_student_fees_amount
-- ----------------------------
DROP TABLE IF EXISTS `acc_student_fees_amount`;
CREATE TABLE `acc_student_fees_amount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_ay_student_fee_group_id` int(11) DEFAULT NULL,
  `lib_acc_student_fee_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of acc_student_fees_amount
-- ----------------------------

-- ----------------------------
-- Table structure for ay_academic_year
-- ----------------------------
DROP TABLE IF EXISTS `ay_academic_year`;
CREATE TABLE `ay_academic_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ay_academic_year
-- ----------------------------
INSERT INTO `ay_academic_year` VALUES ('1', '2017-10-00', '2018-10-00');

-- ----------------------------
-- Table structure for ay_classes
-- ----------------------------
DROP TABLE IF EXISTS `ay_classes`;
CREATE TABLE `ay_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ay_id` int(11) DEFAULT NULL,
  `ay_section_id` int(11) DEFAULT NULL,
  `lib_academic_subject_id` int(11) DEFAULT NULL,
  `em_id` int(11) DEFAULT NULL,
  `room_location` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ay_classes
-- ----------------------------

-- ----------------------------
-- Table structure for ay_classes_schedule
-- ----------------------------
DROP TABLE IF EXISTS `ay_classes_schedule`;
CREATE TABLE `ay_classes_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `ay_classes_id` int(11) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `datetime_from` datetime DEFAULT NULL,
  `datetime_to` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ay_classes_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for ay_enrolled_students
-- ----------------------------
DROP TABLE IF EXISTS `ay_enrolled_students`;
CREATE TABLE `ay_enrolled_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ay_classes_id` int(11) DEFAULT NULL,
  `ay_id` int(11) DEFAULT NULL,
  `ay_section_id` int(11) DEFAULT NULL,
  `lib_academic_subject_id` int(11) DEFAULT NULL,
  `si_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ay_enrolled_students
-- ----------------------------

-- ----------------------------
-- Table structure for ay_grades
-- ----------------------------
DROP TABLE IF EXISTS `ay_grades`;
CREATE TABLE `ay_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ay_enrolled_student_id` int(11) DEFAULT NULL,
  `ay_semester_id` int(11) DEFAULT NULL,
  `grade` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ay_grades
-- ----------------------------

-- ----------------------------
-- Table structure for ay_sections
-- ----------------------------
DROP TABLE IF EXISTS `ay_sections`;
CREATE TABLE `ay_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ay_id` int(11) DEFAULT NULL,
  `lib_academic_level_id` int(11) DEFAULT NULL,
  `lib_academic_section_id` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ay_sections
-- ----------------------------

-- ----------------------------
-- Table structure for ay_semesters
-- ----------------------------
DROP TABLE IF EXISTS `ay_semesters`;
CREATE TABLE `ay_semesters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ay_id` int(11) DEFAULT NULL,
  `lib_academic_semester_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ay_semesters
-- ----------------------------

-- ----------------------------
-- Table structure for em_educational_background
-- ----------------------------
DROP TABLE IF EXISTS `em_educational_background`;
CREATE TABLE `em_educational_background` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_id` int(11) DEFAULT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `final_grade` double DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(55) DEFAULT NULL,
  `date_started` date DEFAULT NULL,
  `date_ended` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of em_educational_background
-- ----------------------------

-- ----------------------------
-- Table structure for em_employees_information
-- ----------------------------
DROP TABLE IF EXISTS `em_employees_information`;
CREATE TABLE `em_employees_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_id` int(11) DEFAULT NULL,
  `employee_number` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of em_employees_information
-- ----------------------------

-- ----------------------------
-- Table structure for em_movement
-- ----------------------------
DROP TABLE IF EXISTS `em_movement`;
CREATE TABLE `em_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `em_record_id` int(11) DEFAULT NULL,
  `lib_em_movement_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of em_movement
-- ----------------------------

-- ----------------------------
-- Table structure for em_records
-- ----------------------------
DROP TABLE IF EXISTS `em_records`;
CREATE TABLE `em_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of em_records
-- ----------------------------

-- ----------------------------
-- Table structure for lib_academic_levels
-- ----------------------------
DROP TABLE IF EXISTS `lib_academic_levels`;
CREATE TABLE `lib_academic_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_academic_levels
-- ----------------------------

-- ----------------------------
-- Table structure for lib_academic_sections
-- ----------------------------
DROP TABLE IF EXISTS `lib_academic_sections`;
CREATE TABLE `lib_academic_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_academic_level_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_academic_sections
-- ----------------------------

-- ----------------------------
-- Table structure for lib_academic_semesters
-- ----------------------------
DROP TABLE IF EXISTS `lib_academic_semesters`;
CREATE TABLE `lib_academic_semesters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_academic_semesters
-- ----------------------------

-- ----------------------------
-- Table structure for lib_academic_subjects
-- ----------------------------
DROP TABLE IF EXISTS `lib_academic_subjects`;
CREATE TABLE `lib_academic_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_academic_level_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_academic_subjects
-- ----------------------------

-- ----------------------------
-- Table structure for lib_acc_student_fees
-- ----------------------------
DROP TABLE IF EXISTS `lib_acc_student_fees`;
CREATE TABLE `lib_acc_student_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_acc_student_fees
-- ----------------------------

-- ----------------------------
-- Table structure for lib_cities
-- ----------------------------
DROP TABLE IF EXISTS `lib_cities`;
CREATE TABLE `lib_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_state_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_cities
-- ----------------------------

-- ----------------------------
-- Table structure for lib_countries
-- ----------------------------
DROP TABLE IF EXISTS `lib_countries`;
CREATE TABLE `lib_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_countries
-- ----------------------------

-- ----------------------------
-- Table structure for lib_em_companies
-- ----------------------------
DROP TABLE IF EXISTS `lib_em_companies`;
CREATE TABLE `lib_em_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_em_companies
-- ----------------------------

-- ----------------------------
-- Table structure for lib_em_departments
-- ----------------------------
DROP TABLE IF EXISTS `lib_em_departments`;
CREATE TABLE `lib_em_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_em_departments
-- ----------------------------

-- ----------------------------
-- Table structure for lib_em_movement_type
-- ----------------------------
DROP TABLE IF EXISTS `lib_em_movement_type`;
CREATE TABLE `lib_em_movement_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_em_movement_type
-- ----------------------------

-- ----------------------------
-- Table structure for lib_em_positions
-- ----------------------------
DROP TABLE IF EXISTS `lib_em_positions`;
CREATE TABLE `lib_em_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_em_department_id` int(11) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '(0,1) 0 = seton''s record, 1 = others',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_em_positions
-- ----------------------------

-- ----------------------------
-- Table structure for lib_em_status
-- ----------------------------
DROP TABLE IF EXISTS `lib_em_status`;
CREATE TABLE `lib_em_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_em_status
-- ----------------------------

-- ----------------------------
-- Table structure for lib_em_type
-- ----------------------------
DROP TABLE IF EXISTS `lib_em_type`;
CREATE TABLE `lib_em_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_em_type
-- ----------------------------

-- ----------------------------
-- Table structure for lib_pi_addresses
-- ----------------------------
DROP TABLE IF EXISTS `lib_pi_addresses`;
CREATE TABLE `lib_pi_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `lib_country_id` int(11) DEFAULT NULL,
  `lib_state_id` int(11) DEFAULT NULL,
  `lib_city_id` int(11) DEFAULT NULL,
  `zip_postal_code` varchar(9) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_pi_addresses
-- ----------------------------

-- ----------------------------
-- Table structure for lib_pi_marital_status
-- ----------------------------
DROP TABLE IF EXISTS `lib_pi_marital_status`;
CREATE TABLE `lib_pi_marital_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_pi_marital_status
-- ----------------------------

-- ----------------------------
-- Table structure for lib_pi_nationality
-- ----------------------------
DROP TABLE IF EXISTS `lib_pi_nationality`;
CREATE TABLE `lib_pi_nationality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_pi_nationality
-- ----------------------------

-- ----------------------------
-- Table structure for lib_pi_religion
-- ----------------------------
DROP TABLE IF EXISTS `lib_pi_religion`;
CREATE TABLE `lib_pi_religion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_pi_religion
-- ----------------------------

-- ----------------------------
-- Table structure for lib_sis_admission_entry_statuses
-- ----------------------------
DROP TABLE IF EXISTS `lib_sis_admission_entry_statuses`;
CREATE TABLE `lib_sis_admission_entry_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL COMMENT 'PENDING,PASSED,INCOMPLETE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_sis_admission_entry_statuses
-- ----------------------------

-- ----------------------------
-- Table structure for lib_sis_admission_processes
-- ----------------------------
DROP TABLE IF EXISTS `lib_sis_admission_processes`;
CREATE TABLE `lib_sis_admission_processes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_sis_admission_processes
-- ----------------------------

-- ----------------------------
-- Table structure for lib_states
-- ----------------------------
DROP TABLE IF EXISTS `lib_states`;
CREATE TABLE `lib_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_country_id` int(11) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lib_states
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2017_09_21_063830_entrust_setup_tables', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
INSERT INTO `password_resets` VALUES ('arjayrozulbonus@gmail.com', '$2y$10$1p5yrPvx8IpkBJCZ66eAIe2qGo9wgCzJQa5YRN.DoEi0ZFk/O7Amy', '2017-10-03 04:26:08');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------

-- ----------------------------
-- Table structure for pi_addresses
-- ----------------------------
DROP TABLE IF EXISTS `pi_addresses`;
CREATE TABLE `pi_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_id` int(11) DEFAULT NULL,
  `lib_pi_address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pi_addresses
-- ----------------------------

-- ----------------------------
-- Table structure for pi_childrens
-- ----------------------------
DROP TABLE IF EXISTS `pi_childrens`;
CREATE TABLE `pi_childrens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_parent_id` int(11) DEFAULT NULL,
  `pi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pi_childrens
-- ----------------------------

-- ----------------------------
-- Table structure for pi_contacts
-- ----------------------------
DROP TABLE IF EXISTS `pi_contacts`;
CREATE TABLE `pi_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_id` int(11) DEFAULT NULL,
  `type` varchar(55) DEFAULT NULL,
  `number` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pi_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for pi_documents
-- ----------------------------
DROP TABLE IF EXISTS `pi_documents`;
CREATE TABLE `pi_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_id` int(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_source` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pi_documents
-- ----------------------------

-- ----------------------------
-- Table structure for pi_parents
-- ----------------------------
DROP TABLE IF EXISTS `pi_parents`;
CREATE TABLE `pi_parents` (
  `id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pi_parents
-- ----------------------------

-- ----------------------------
-- Table structure for pi_personal_information
-- ----------------------------
DROP TABLE IF EXISTS `pi_personal_information`;
CREATE TABLE `pi_personal_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pi_personal_information
-- ----------------------------

-- ----------------------------
-- Table structure for pi_user_account
-- ----------------------------
DROP TABLE IF EXISTS `pi_user_account`;
CREATE TABLE `pi_user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pi_user_account
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------

-- ----------------------------
-- Table structure for sis_admission_entry
-- ----------------------------
DROP TABLE IF EXISTS `sis_admission_entry`;
CREATE TABLE `sis_admission_entry` (
  `id` int(11) NOT NULL,
  `pi_id` int(11) DEFAULT NULL,
  `lib_sis_admission_entry_status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sis_admission_entry
-- ----------------------------

-- ----------------------------
-- Table structure for sis_admission_process_statuses
-- ----------------------------
DROP TABLE IF EXISTS `sis_admission_process_statuses`;
CREATE TABLE `sis_admission_process_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sis_admission_entry_id` int(11) DEFAULT NULL,
  `sis_admission_process_id` int(11) DEFAULT NULL,
  `status` varchar(55) DEFAULT NULL COMMENT 'DONE,PENDING,INCOMPLETE,FAILED',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sis_admission_process_statuses
-- ----------------------------

-- ----------------------------
-- Table structure for sis_ay_admission_processes
-- ----------------------------
DROP TABLE IF EXISTS `sis_ay_admission_processes`;
CREATE TABLE `sis_ay_admission_processes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ay_id` int(11) DEFAULT NULL,
  `lib_sis_admission_process_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sis_ay_admission_processes
-- ----------------------------

-- ----------------------------
-- Table structure for si_student_information
-- ----------------------------
DROP TABLE IF EXISTS `si_student_information`;
CREATE TABLE `si_student_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_id` int(11) DEFAULT NULL,
  `lrn` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of si_student_information
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Mark-Arjay Bonus', 'arjayrozulbonus@gmail.com', '$2y$10$aSIzrPOtGHaa.V//Gfu86OTfCjp75QIFUvHNO3R2ltP6FpY8fpMvK', '2IFSFBg8WYy6rZ7N5L3BHczP6n7UMUAKTZ86VY0B9Yx58B49miJ2idmXkQDv', '2017-09-21 06:44:10', '2017-09-21 06:44:10');

-- ----------------------------
-- View structure for sample
-- ----------------------------
DROP VIEW IF EXISTS `sample`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `sample` AS SELECT
ay_grades.ay_semester_id
FROM
ay_grades ,
role_user ,
roles ;
