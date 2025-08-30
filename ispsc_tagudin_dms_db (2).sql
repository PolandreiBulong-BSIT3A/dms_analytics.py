-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2025 at 06:18 AM
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
-- Database: `ispsc_tagudin_dms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `visible_to_all` tinyint(1) DEFAULT 1,
  `status` enum('draft','scheduled','published','archived') DEFAULT 'draft',
  `publish_at` datetime DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `created_by_name` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`announcement_id`, `title`, `body`, `visible_to_all`, `status`, `publish_at`, `expire_at`, `created_by_name`, `created_at`, `updated_at`) VALUES
(1, 'TEST 1', 'HI THIS IS A TEST', 1, 'published', '2025-08-29 04:00:00', '2025-08-29 04:00:00', 'Unknown User', '2025-08-28 20:00:15', '2025-08-28 20:00:15'),
(2, 'dsf', 'sfd', 1, 'draft', NULL, NULL, 'Unknown User', '2025-08-28 20:34:58', '2025-08-28 20:34:58');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_departments`
--

CREATE TABLE `announcement_departments` (
  `announcement_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `code`, `is_active`) VALUES
(1, 'College of Arts and Sciences', 'CAS', 1),
(2, 'College of Management and Business Economics', 'CMBE', 1),
(3, 'College of Teacher Education', 'CTE', 1),
(4, 'Laboratory High School', 'LHS', 1),
(5, 'Non-Teaching Personnel', 'NON-TEACHING', 1),
(6, 'Graduate School', 'GRADUATE SCHOOL', 1),
(7, 'Student Council', 'STUDENT COUNCIL', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dms_documents`
--

CREATE TABLE `dms_documents` (
  `doc_id` int(11) NOT NULL,
  `doc_type` int(11) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `google_folder_id` varchar(128) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `revision` varchar(50) DEFAULT NULL,
  `rev_date` date DEFAULT NULL,
  `from_field` varchar(255) DEFAULT NULL,
  `to_field` varchar(255) DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `google_drive_link` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `visible_to_all` tinyint(1) DEFAULT 1,
  `status` enum('active','inactive','pending','deleted') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by_name` varchar(150) DEFAULT NULL,
  `current_version_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by_name` varchar(150) DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `restored_by_name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dms_documents`
--

INSERT INTO `dms_documents` (`doc_id`, `doc_type`, `reference`, `google_folder_id`, `title`, `revision`, `rev_date`, `from_field`, `to_field`, `date_received`, `google_drive_link`, `description`, `visible_to_all`, `status`, `created_at`, `updated_at`, `created_by_name`, `current_version_id`, `deleted`, `deleted_at`, `deleted_by_name`, `restored_at`, `restored_by_name`) VALUES
(1, 1, '12', NULL, '12', NULL, NULL, '12', '21', '2025-08-26', 'https://drive.google.com/file/d/1Tqvx5rSJJbRfNVYH8ScHYNpDGKIHywTR/view?usp=sharing', NULL, 1, 'deleted', '2025-08-26 02:54:29', '2025-08-28 06:30:41', 'Pol andrei Bulong', 0, 1, '2025-08-28 14:30:41', 'Pol andrei Bulong', '2025-08-28 14:05:57', 'Pol andrei Bulong'),
(2, 1, '2341235423554sdvdfgd435345345', NULL, 'Memo of Pol', NULL, NULL, 'me', 'yyou', '2025-08-25', 'https://drive.google.com/file/d/1Hc8ATvJGM2GOUJ8WkSG0gTtX8WkWFav2/view?usp=drive_link', '', 1, 'active', '2025-08-26 04:19:48', '2025-08-28 06:05:55', 'Pol andrei Bulong', 0, 0, NULL, NULL, '2025-08-28 14:05:55', 'Pol andrei Bulong'),
(3, 2, '123123123', NULL, 'report of me II', NULL, NULL, 'lan', 'lop', '2025-08-25', 'https://drive.google.com/file/d/11k4jlAkXAYEZV_J8gYd-8bkyVMZmqeFQ/view?usp=drive_link', '', 0, 'active', '2025-08-26 07:10:46', '2025-08-28 06:05:56', 'Pol andrei Bulong', 0, 0, NULL, NULL, '2025-08-28 14:05:56', 'Pol andrei Bulong'),
(4, 5, 'POL-2025-003', 'folderD321', 'New Eridu Policy Draft', 'Draft v3', '2025-03-28', 'General Chamber', 'New Eridu Council', '2025-03-28', 'https://drive.google.com/file/d/4D', 'Draft of updated New Eridu administrative policies.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Billy Kid', 1, 0, NULL, NULL, NULL, NULL),
(5, 6, 'NOT-2025-009', 'folderE654', 'Victoria House Notice', 'v1', '2025-04-10', 'Victoria House Admin', 'All Staff', '2025-04-10', 'https://drive.google.com/file/d/5E', 'Notice of scheduled HQ maintenance.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Grace Howard', 1, 0, NULL, NULL, NULL, NULL),
(6, 7, 'GUIDE-2025-002', 'folderF987', 'ZZZ Training Guidelines', 'v1', '2025-05-05', 'Hollow Investigation Division', 'New Recruits', '2025-05-05', 'https://drive.google.com/file/d/6F', 'Operational guidelines for Hollow investigator trainees.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Lycaon', 1, 0, NULL, NULL, NULL, NULL),
(7, 2, 'FORM-2025-021', 'folderG111', 'Equipment Request Form', 'v1', '2025-06-01', 'Logistics Dept.', 'Operations', '2025-06-01', 'https://drive.google.com/file/d/7G', 'Form for requisition of Hollow combat equipment.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Piper Wheel', 1, 0, NULL, NULL, NULL, NULL),
(8, 2, 'CON-2025-007', 'folderH222', 'Belobog Supply Contract', 'Signed v1', '2025-06-27', 'Belobog Industries', 'New Eridu Gov.', '2025-06-27', 'https://drive.google.com/file/d/8H', 'Supply contract agreement with New Eridu government.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Anton Ivanov', 1, 0, NULL, NULL, NULL, NULL),
(9, 1, 'MIN-2025-010', 'folderI333', 'Council Meeting Minutes', 'v1', '2025-07-19', 'Council Secretary', 'New Eridu Council', '2025-07-19', 'https://drive.google.com/file/d/9I', 'Minutes of strategic council meeting.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Wise', 1, 0, NULL, NULL, NULL, NULL),
(10, 10, 'PROP-2025-004', 'folderJ444', 'Expansion Proposal', 'Proposal v1', '2025-08-12', 'General Chamber', 'Council Committee', '2025-08-12', 'https://drive.google.com/file/d/10J', 'Proposal for expansion of Hollow investigation zones.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Soldier 11', 1, 0, NULL, NULL, NULL, NULL),
(11, 2, 'MEMO-2025-001', 'folderA123', 'Hollow Investigation Memo', 'v1', '2025-01-21', 'Nicole Demara', 'Cunning Hares Unit', '2025-01-21', 'https://drive.google.com/file/d/1A', 'Memo regarding recent Hollow disturbances in Sixth Street.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Nicole Demara', 1, 0, NULL, NULL, NULL, NULL),
(12, 3, 'RPT-2025-014', 'folderB456', 'Belobog Forge Report', 'v2', '2025-02-14', 'Anton Ivanov', 'Belobog Heavy Industries HQ', '2025-02-14', 'https://drive.google.com/file/d/2B', 'Monthly productivity report of Belobog Heavy Industries.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Anton Ivanov', 1, 0, NULL, NULL, NULL, NULL),
(13, 4, 'CIRC-2025-005', 'folderC789', 'Cunning Hares Circular', 'v1', '2025-03-02', 'Anby Demara', 'All Members', '2025-03-02', 'https://drive.google.com/file/d/3C', 'Circular announcing new recruitment policies.', 1, 'active', '2025-08-28 09:21:54', '2025-08-28 09:21:54', 'Anby Demara', 1, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dms_document_versions`
--

CREATE TABLE `dms_document_versions` (
  `version_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `version_number` int(11) NOT NULL,
  `revision` varchar(50) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `from_field` varchar(255) DEFAULT NULL,
  `to_field` varchar(255) DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `google_drive_link` text DEFAULT NULL,
  `google_file_id` varchar(128) DEFAULT NULL,
  `google_web_view_link` text DEFAULT NULL,
  `google_web_content_link` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `doc_type` int(11) DEFAULT NULL,
  `updated_by_name` varchar(150) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `change_summary` text DEFAULT NULL,
  `change_type` enum('created','updated','revision','restored') DEFAULT 'updated',
  `is_current_version` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dms_document_versions`
--

INSERT INTO `dms_document_versions` (`version_id`, `doc_id`, `version_number`, `revision`, `title`, `reference`, `from_field`, `to_field`, `date_received`, `google_drive_link`, `google_file_id`, `google_web_view_link`, `google_web_content_link`, `description`, `doc_type`, `updated_by_name`, `updated_at`, `change_summary`, `change_type`, `is_current_version`) VALUES
(6, 3, 1, 'v1', 'report of me II', '123123123', 'lan', 'lop', '2025-08-25', 'https://drive.google.com/file/d/1Hc8ATvJGM2GOUJ8WkSG0gTtX8WkWFav2/view?usp=drive_link', NULL, NULL, NULL, '', 2, 'Unknown', '2025-08-28 04:02:27', 'Updated Google Drive link to version 1', '', 0),
(7, 3, 2, 'v2', 'report of me II', '123123123', 'lan', 'lop', '2025-08-25', 'https://drive.google.com/file/d/1Tqvx5rSJJbRfNVYH8ScHYNpDGKIHywTR/view?usp=drive_link', NULL, NULL, NULL, '', 2, 'Unknown', '2025-08-28 04:03:37', 'Updated Google Drive link to version 2', '', 0),
(8, 3, 3, 'Report of Me III', 'report of me II', '123123123', 'lan', 'lop', '2025-08-25', 'https://drive.google.com/file/d/1Hc8ATvJGM2GOUJ8WkSG0gTtX8WkWFav2/view?usp=sharing', NULL, NULL, NULL, '', 2, 'Unknown', '2025-08-28 04:04:50', 'Updated Google Drive link to version 3', '', 1);

--
-- Triggers `dms_document_versions`
--
DELIMITER $$
CREATE TRIGGER `dms_document_versions_after_insert_set_current` AFTER INSERT ON `dms_document_versions` FOR EACH ROW BEGIN
        UPDATE dms_documents
        SET 
          current_version_id = NEW.version_id,
          revision = NEW.revision,
          title = NEW.title,
          reference = NEW.reference,
          from_field = NEW.from_field,
          to_field = NEW.to_field,
          date_received = NEW.date_received,
          google_drive_link = NEW.google_drive_link,
          description = NEW.description,
          doc_type = COALESCE(NEW.doc_type, doc_type),
          updated_at = CURRENT_TIMESTAMP
        WHERE doc_id = NEW.doc_id;
      END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dms_document_versions_before_insert_set_version_number` BEFORE INSERT ON `dms_document_versions` FOR EACH ROW BEGIN
    DECLARE next_version INT DEFAULT 1;
    SELECT COALESCE(MAX(version_number), 0) + 1 INTO next_version
    FROM dms_document_versions
    WHERE doc_id = NEW.doc_id;
    SET NEW.version_number = COALESCE(NEW.version_number, next_version);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dms_user`
--

CREATE TABLE `dms_user` (
  `user_id` int(11) NOT NULL,
  `profile_pic` longtext DEFAULT NULL,
  `user_email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `Contact_number` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `role` enum('ADMIN','SUPERVISER','USER') DEFAULT 'USER',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','inactive','banned','pending','deleted') DEFAULT 'pending',
  `is_verified` enum('yes','no') DEFAULT 'no',
  `verification_token` varchar(255) DEFAULT NULL,
  `verification_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dms_user`
--

INSERT INTO `dms_user` (`user_id`, `profile_pic`, `user_email`, `password`, `Username`, `firstname`, `lastname`, `Contact_number`, `department_id`, `role`, `created_at`, `updated_at`, `status`, `is_verified`, `verification_token`, `verification_code`) VALUES
(1, 'https://lh3.googleusercontent.com/a/ACg8ocIhpD_184y_Edc-9RJod2dRMKXfsKksA7Z1AKaWM-5lc7srqUFH=s96-c', 'polandreiladera03@gmail.com', '', 'Pol andrei Bulong', 'LAN', 'ADMIN', '09184226085', 5, 'ADMIN', '2025-08-26 01:03:53', '2025-08-26 02:39:41', 'active', 'yes', NULL, NULL),
(2, 'https://lh3.googleusercontent.com/a/ACg8ocLCtLZz7Zmt471wn_Ox2BYg5YUHStURu5kczNi_W3goIXHxvHw=s96-c', 'laderasanjuan03@gmail.com', '', 'Levv1', '', '', NULL, 2, 'USER', '2025-08-26 01:55:55', '2025-08-28 08:45:52', 'active', 'yes', NULL, NULL),
(3, 'https://zzz-static.hoyoverse.com/pics/belle.jpg', 'belle@neweridu.com', '', 'BelleZZZ', 'Belle', '', '09171234567', 1, 'USER', '2025-01-14 01:22:15', '2025-01-14 01:22:15', 'active', 'yes', NULL, NULL),
(4, 'https://zzz-static.hoyoverse.com/pics/wise.jpg', 'wise@neweridu.com', '', 'WiseProxy', 'Wise', '', '09982345671', 2, 'ADMIN', '2025-02-21 03:47:33', '2025-02-21 03:47:33', 'active', 'yes', NULL, NULL),
(5, 'https://zzz-static.hoyoverse.com/pics/anne.jpg', 'anne@belobog.com', '', 'AnneCore', 'Anby', 'Demara', '09193456782', 3, 'USER', '2025-03-09 08:05:27', '2025-03-09 08:05:27', 'active', 'yes', NULL, NULL),
(6, 'https://zzz-static.hoyoverse.com/pics/nicole.jpg', 'nicole@cunninghares.org', '', 'NicHare', 'Nicole', 'Demara', '09381234568', 4, 'SUPERVISER', '2025-04-19 02:11:44', '2025-04-19 02:11:44', 'active', 'yes', NULL, NULL),
(7, 'https://zzz-static.hoyoverse.com/pics/billy.jpg', 'billy@cunninghares.org', '', 'BangBangBilly', 'Billy', 'Kid', '09274567813', 5, 'USER', '2025-05-02 10:33:01', '2025-05-02 10:33:01', 'active', 'yes', NULL, NULL),
(8, 'https://zzz-static.hoyoverse.com/pics/volker.jpg', 'volker@victoriahouse.com', '', 'VolkerGuardian', 'Volker', 'Cozy', '09185567894', 6, 'USER', '2025-06-10 00:27:59', '2025-06-10 00:27:59', 'active', 'yes', NULL, NULL),
(9, 'https://zzz-static.hoyoverse.com/pics/ellen.jpg', 'ellen@victoriahouse.com', '', 'EllenFrost', 'Ellen', 'Joe', '09395678901', 7, 'USER', '2025-07-01 06:19:23', '2025-07-01 06:19:23', 'active', 'yes', NULL, NULL),
(10, 'https://zzz-static.hoyoverse.com/pics/lucia.jpg', 'lucia@belobog.com', '', 'LuciaNight', 'Lucia', '', '09173458902', 1, 'USER', '2025-07-18 12:44:55', '2025-07-18 12:44:55', 'active', 'yes', NULL, NULL),
(11, 'https://zzz-static.hoyoverse.com/pics/sougetsu.jpg', 'sougetsu@hollowinvestigators.org', '', 'SougetsuShroud', 'Sougetsu', '', '09471239876', 2, 'USER', '2025-08-08 04:12:12', '2025-08-08 04:12:12', 'active', 'yes', NULL, NULL),
(12, 'https://zzz-static.hoyoverse.com/pics/koleda.jpg', 'koleda@belobog.com', '', 'KoledaForge', 'Koleda', 'Belobog', '09785612349', 3, 'SUPERVISER', '2025-08-21 14:37:41', '2025-08-28 09:26:40', 'active', 'yes', NULL, NULL);

--
-- Triggers `dms_user`
--
DELIMITER $$
CREATE TRIGGER `set_first_user_as_admin` BEFORE INSERT ON `dms_user` FOR EACH ROW BEGIN
    DECLARE user_count INT DEFAULT 0;
    
    -- Check if this is the first user being created
    SELECT COUNT(*) INTO user_count FROM dms_user;
    
    -- If this is the first user (user_count = 0), make them ADMIN
    IF user_count = 0 THEN
        SET NEW.role = 'ADMIN';
        SET NEW.is_verified = 'yes';
        SET NEW.status = 'active';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_initial_user_status` BEFORE INSERT ON `dms_user` FOR EACH ROW BEGIN
    IF NEW.is_verified = 'yes' THEN
        SET NEW.status = 'active';
    ELSE
        SET NEW.status = 'pending';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user_status_on_verification` BEFORE UPDATE ON `dms_user` FOR EACH ROW BEGIN
    -- Only update status if is_verified is being changed and status is not being explicitly set
    IF NEW.is_verified != OLD.is_verified THEN
        IF NEW.is_verified = 'yes' AND OLD.is_verified = 'no' THEN
            SET NEW.status = 'active';
        ELSEIF NEW.is_verified = 'no' AND OLD.is_verified = 'yes' THEN
            SET NEW.status = 'pending';
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `document_departments`
--

CREATE TABLE `document_departments` (
  `doc_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_departments`
--

INSERT INTO `document_departments` (`doc_id`, `department_id`) VALUES
(3, 2),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `document_permission_requests`
--

CREATE TABLE `document_permission_requests` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `action` enum('add','update') NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reviewed_by` int(11) DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `review_comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `type_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`type_id`, `name`) VALUES
(3, 'Circular'),
(8, 'Contract'),
(7, 'Form'),
(6, 'Guidelines'),
(1, 'Memo'),
(9, 'Minutes'),
(5, 'Notice'),
(4, 'Policy'),
(10, 'Proposal'),
(2, 'Report');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('added','updated','deleted') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `related_doc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `title`, `message`, `type`, `created_at`, `related_doc_id`) VALUES
(1, 'New Document Added: 12', 'A new document \"12\" has been uploaded by Pol andrei Bulong', 'added', '2025-08-26 02:54:29', 1),
(2, 'New Document Added: Memo of Me', 'A new document \"Memo of Me\" has been uploaded by Pol andrei Bulong', 'added', '2025-08-26 04:19:48', 2),
(3, 'New Document Added: report', 'A new document \"report\" has been uploaded by Pol andrei Bulong', 'added', '2025-08-26 07:10:46', 3),
(4, 'New Announcement: TEST 1', 'A new announcement \"TEST 1\" has been created by Unknown User', 'added', '2025-08-28 20:00:15', NULL),
(5, 'New Announcement: dsf', 'A new announcement \"dsf\" has been created by Unknown User', 'added', '2025-08-28 20:34:58', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_publish_at` (`publish_at`),
  ADD KEY `idx_expire_at` (`expire_at`);

--
-- Indexes for table `announcement_departments`
--
ALTER TABLE `announcement_departments`
  ADD PRIMARY KEY (`announcement_id`,`department_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `dms_documents`
--
ALTER TABLE `dms_documents`
  ADD PRIMARY KEY (`doc_id`),
  ADD KEY `idx_doc_type` (`doc_type`),
  ADD KEY `idx_title` (`title`),
  ADD KEY `idx_visible_to_all` (`visible_to_all`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_deleted` (`deleted`),
  ADD KEY `idx_deleted_at` (`deleted_at`),
  ADD KEY `idx_deleted_by_name` (`deleted_by_name`);

--
-- Indexes for table `dms_document_versions`
--
ALTER TABLE `dms_document_versions`
  ADD PRIMARY KEY (`version_id`),
  ADD UNIQUE KEY `unique_doc_version` (`doc_id`,`version_number`),
  ADD KEY `doc_type` (`doc_type`),
  ADD KEY `idx_doc_id` (`doc_id`),
  ADD KEY `idx_version_number` (`version_number`),
  ADD KEY `idx_google_file_id` (`google_file_id`),
  ADD KEY `idx_updated_by_name` (`updated_by_name`),
  ADD KEY `idx_is_current_version` (`is_current_version`);

--
-- Indexes for table `dms_user`
--
ALTER TABLE `dms_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `idx_email` (`user_email`),
  ADD KEY `idx_username` (`Username`),
  ADD KEY `idx_department_id` (`department_id`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_is_verified` (`is_verified`);

--
-- Indexes for table `document_departments`
--
ALTER TABLE `document_departments`
  ADD PRIMARY KEY (`doc_id`,`department_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `document_permission_requests`
--
ALTER TABLE `document_permission_requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `reviewed_by` (`reviewed_by`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `related_doc_id` (`related_doc_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dms_documents`
--
ALTER TABLE `dms_documents`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `dms_document_versions`
--
ALTER TABLE `dms_document_versions`
  MODIFY `version_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dms_user`
--
ALTER TABLE `dms_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `document_permission_requests`
--
ALTER TABLE `document_permission_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement_departments`
--
ALTER TABLE `announcement_departments`
  ADD CONSTRAINT `announcement_departments_ibfk_1` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `announcement_departments_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `dms_documents`
--
ALTER TABLE `dms_documents`
  ADD CONSTRAINT `dms_documents_ibfk_1` FOREIGN KEY (`doc_type`) REFERENCES `document_types` (`type_id`);

--
-- Constraints for table `dms_document_versions`
--
ALTER TABLE `dms_document_versions`
  ADD CONSTRAINT `dms_document_versions_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `dms_documents` (`doc_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dms_document_versions_ibfk_2` FOREIGN KEY (`doc_type`) REFERENCES `document_types` (`type_id`) ON DELETE SET NULL;

--
-- Constraints for table `dms_user`
--
ALTER TABLE `dms_user`
  ADD CONSTRAINT `dms_user_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL;

--
-- Constraints for table `document_departments`
--
ALTER TABLE `document_departments`
  ADD CONSTRAINT `document_departments_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `dms_documents` (`doc_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_departments_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `document_permission_requests`
--
ALTER TABLE `document_permission_requests`
  ADD CONSTRAINT `document_permission_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `dms_user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_permission_requests_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `dms_documents` (`doc_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `document_permission_requests_ibfk_3` FOREIGN KEY (`reviewed_by`) REFERENCES `dms_user` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`related_doc_id`) REFERENCES `dms_documents` (`doc_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
