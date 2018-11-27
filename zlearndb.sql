/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 8.0.13 : Database - zlearndb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zlearndb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `zlearndb`;

/*Table structure for table `zl_admin` */

DROP TABLE IF EXISTS `zl_admin`;

CREATE TABLE `zl_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email_id` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mobile_no` decimal(10,0) NOT NULL,
  `pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `admin_status` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `remarks` varchar(225) DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_admin` */

insert  into `zl_admin`(`admin_id`,`username`,`email_id`,`mobile_no`,`pass`,`admin_status`,`created_at`,`updated_at`,`remarks`,`dept_id`) values 
(1,'sunny kumar','sunny.k@zestech.in',8125909437,'Pass@111',1,'2018-11-24',NULL,NULL,2),
(2,'Anil shetty','anil.s@zestech.in',0,'Pass@111',1,'2018-11-26',NULL,NULL,2);

/*Table structure for table `zl_admin_department` */

DROP TABLE IF EXISTS `zl_admin_department`;

CREATE TABLE `zl_admin_department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(225) DEFAULT NULL,
  UNIQUE KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_admin_department` */

insert  into `zl_admin_department`(`dept_id`,`dept_name`) values 
(1,'HR'),
(2,'IT'),
(3,'L&D'),
(4,'Management');

/*Table structure for table `zl_anserset` */

DROP TABLE IF EXISTS `zl_anserset`;

CREATE TABLE `zl_anserset` (
  `anserset_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  PRIMARY KEY (`anserset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_anserset` */

/*Table structure for table `zl_attendance` */

DROP TABLE IF EXISTS `zl_attendance`;

CREATE TABLE `zl_attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `campus_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `remarks` text,
  PRIMARY KEY (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_attendance` */

/*Table structure for table `zl_attendance_set` */

DROP TABLE IF EXISTS `zl_attendance_set`;

CREATE TABLE `zl_attendance_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `attendance_type` tinyint(1) NOT NULL DEFAULT '0',
  `attendance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_id` (`attendance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_attendance_set` */

/*Table structure for table `zl_branch` */

DROP TABLE IF EXISTS `zl_branch`;

CREATE TABLE `zl_branch` (
  `branch_id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(255) NOT NULL,
  `branch_code` varchar(255) NOT NULL,
  `branch_desc` varchar(255) DEFAULT NULL,
  `branch_status` int(11) DEFAULT NULL,
  `added_by` varchar(255) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_branch` */

/*Table structure for table `zl_campus` */

DROP TABLE IF EXISTS `zl_campus`;

CREATE TABLE `zl_campus` (
  `campus_id` int(11) NOT NULL,
  `campus_name` varchar(255) NOT NULL,
  `campus_email` varchar(255) NOT NULL,
  `campus_contact_no` int(11) NOT NULL,
  `campus_spoc` varchar(255) NOT NULL,
  `university_id` int(11) NOT NULL,
  `campuse_code` varchar(255) NOT NULL,
  `campus_address` text NOT NULL,
  `campus_status` int(11) DEFAULT '0',
  `added_by` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_campus` */

/*Table structure for table `zl_campus_batches` */

DROP TABLE IF EXISTS `zl_campus_batches`;

CREATE TABLE `zl_campus_batches` (
  `batch_id` int(11) NOT NULL,
  `batch_name` varchar(255) NOT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_campus_batches` */

/*Table structure for table `zl_campus_designation` */

DROP TABLE IF EXISTS `zl_campus_designation`;

CREATE TABLE `zl_campus_designation` (
  `designation_id` int(11) NOT NULL,
  `designation_name` varchar(255) NOT NULL,
  `image_url` text,
  `message` text,
  `campus_id` int(11) NOT NULL,
  PRIMARY KEY (`designation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_campus_designation` */

/*Table structure for table `zl_campus_slots` */

DROP TABLE IF EXISTS `zl_campus_slots`;

CREATE TABLE `zl_campus_slots` (
  `slot_id` int(11) NOT NULL,
  `slot_timing` time NOT NULL,
  PRIMARY KEY (`slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_campus_slots` */

/*Table structure for table `zl_campus_student` */

DROP TABLE IF EXISTS `zl_campus_student`;

CREATE TABLE `zl_campus_student` (
  `student_id` int(11) NOT NULL,
  `usn_no` varchar(255) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_contact_no` decimal(10,0) NOT NULL,
  `profile_image` text,
  `student_DOB` date NOT NULL,
  `student_gender` varchar(255) NOT NULL,
  `student_address` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `student_sem` varchar(255) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `campus_id` int(11) NOT NULL,
  `student_password` varchar(255) NOT NULL,
  `student_last_login` date DEFAULT NULL,
  `social_id` int(11) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_campus_student` */

/*Table structure for table `zl_category` */

DROP TABLE IF EXISTS `zl_category`;

CREATE TABLE `zl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `category_status` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_category` */

/*Table structure for table `zl_courses` */

DROP TABLE IF EXISTS `zl_courses`;

CREATE TABLE `zl_courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` text NOT NULL,
  `course_desc` text,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_courses` */

/*Table structure for table `zl_module` */

DROP TABLE IF EXISTS `zl_module`;

CREATE TABLE `zl_module` (
  `module_id` int(11) NOT NULL,
  `module_name` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `added_by` int(11) NOT NULL,
  `remarks` text,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_module` */

/*Table structure for table `zl_program` */

DROP TABLE IF EXISTS `zl_program`;

CREATE TABLE `zl_program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(255) NOT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_program` */

insert  into `zl_program`(`program_id`,`program_name`) values 
(1,'janus'),
(2,'pragyan');

/*Table structure for table `zl_question` */

DROP TABLE IF EXISTS `zl_question`;

CREATE TABLE `zl_question` (
  `question_d` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `added_by` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT '1',
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`question_d`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_question` */

/*Table structure for table `zl_question_answer` */

DROP TABLE IF EXISTS `zl_question_answer`;

CREATE TABLE `zl_question_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer_description` text,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_question_answer` */

/*Table structure for table `zl_question_level` */

DROP TABLE IF EXISTS `zl_question_level`;

CREATE TABLE `zl_question_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_question_level` */

/*Table structure for table `zl_question_options` */

DROP TABLE IF EXISTS `zl_question_options`;

CREATE TABLE `zl_question_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_question_options` */

/*Table structure for table `zl_schedule` */

DROP TABLE IF EXISTS `zl_schedule`;

CREATE TABLE `zl_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_name` text NOT NULL,
  `description` text,
  `campus_id` int(11) NOT NULL,
  `trainer_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_schedule` */

/*Table structure for table `zl_semester` */

DROP TABLE IF EXISTS `zl_semester`;

CREATE TABLE `zl_semester` (
  `sem_id` int(11) NOT NULL AUTO_INCREMENT,
  `sem_name` text NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`sem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_semester` */

insert  into `zl_semester`(`sem_id`,`sem_name`,`created_at`,`updated_at`,`added_by`,`remarks`) values 
(1,'sem1','2018-11-26',NULL,NULL,NULL),
(2,'sem2','2018-11-26',NULL,NULL,NULL),
(3,'sem3','2018-11-26',NULL,NULL,NULL),
(4,'sem4','2018-11-26',NULL,NULL,NULL),
(5,'sem5','2018-11-26',NULL,NULL,NULL),
(6,'sem6','2018-11-26',NULL,NULL,NULL),
(7,'sem7','2018-11-26',NULL,NULL,NULL),
(8,'sem8','2018-11-26',NULL,NULL,NULL);

/*Table structure for table `zl_social_account` */

DROP TABLE IF EXISTS `zl_social_account`;

CREATE TABLE `zl_social_account` (
  `social_id` int(11) NOT NULL,
  `social_account_name` varchar(255) DEFAULT NULL,
  `social_url` text,
  PRIMARY KEY (`social_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_social_account` */

/*Table structure for table `zl_test` */

DROP TABLE IF EXISTS `zl_test`;

CREATE TABLE `zl_test` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` text NOT NULL,
  `test_description` text,
  `test_instruction` text NOT NULL,
  `start_time` date NOT NULL,
  `end_time` date NOT NULL,
  `total_question` int(11) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `pass_percentage` int(11) NOT NULL,
  `max_attempt` int(11) NOT NULL,
  `assesment_type` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_test` */

/*Table structure for table `zl_test_questionset` */

DROP TABLE IF EXISTS `zl_test_questionset`;

CREATE TABLE `zl_test_questionset` (
  `questionset_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`questionset_id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `zl_test_questionset_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `zl_test` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_test_questionset` */

/*Table structure for table `zl_test_result` */

DROP TABLE IF EXISTS `zl_test_result`;

CREATE TABLE `zl_test_result` (
  `result_id` int(11) NOT NULL AUTO_INCREMENT,
  `usn` varchar(255) NOT NULL,
  `test_id` int(11) NOT NULL,
  `total_question` int(11) NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `remarks` text,
  PRIMARY KEY (`result_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_test_result` */

/*Table structure for table `zl_trainer` */

DROP TABLE IF EXISTS `zl_trainer`;

CREATE TABLE `zl_trainer` (
  `trainer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mobile_no` decimal(10,0) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `trainer_type` varchar(255) DEFAULT NULL,
  `created_at` date NOT NULL,
  `added_by` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_trainer` */

/*Table structure for table `zl_university` */

DROP TABLE IF EXISTS `zl_university`;

CREATE TABLE `zl_university` (
  `university_id` int(11) NOT NULL AUTO_INCREMENT,
  `university_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `university_code` varchar(255) NOT NULL,
  `university_contact_no` decimal(10,0) NOT NULL,
  `university_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`university_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_university` */

insert  into `zl_university`(`university_id`,`university_name`,`university_code`,`university_contact_no`,`university_email`) values 
(1,'Jawaharlal Nehru Technological University','JNTU',4023158661,' wr_jntu@yahoo.com'),
(2,'Visvesvaraya Technological University','VTU',8312498224,NULL),
(3,'Bangalore Central University','BU',0,NULL),
(4,'Adikavi Nannaya University','ANU',0,NULL);

/*Table structure for table `zl_videos` */

DROP TABLE IF EXISTS `zl_videos`;

CREATE TABLE `zl_videos` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` text NOT NULL,
  `card_url` text,
  `video_url` text NOT NULL,
  `ebook_url` text,
  `ebook_name` text,
  `course_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `zl_videos` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
