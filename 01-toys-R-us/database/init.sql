-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 05, 2025 at 09:03 AM
-- Server version: 9.2.0
-- PHP Version: 8.2.27
SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
    time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toys_r_us`
--
CREATE DATABASE IF NOT EXISTS `toys_r_us` DEFAULT CHARACTER
SET
    utf8mb4 COLLATE utf8mb4_general_ci;

USE `toys_r_us`;

-- --------------------------------------------------------
--
-- Table structure for table `audiences`
--
CREATE TABLE
    `audiences` (
        `id` char(36) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
            `created_at` datetime NOT NULL,
            `updated_at` datetime NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `audiences`
--
INSERT INTO
    `audiences` (`id`, `name`, `created_at`, `updated_at`)
VALUES
    (
        'e48ca927-f99f-11ef-bedc-0242ac110002',
        'kids',
        '2025-03-05 08:57:17',
        '2025-03-05 08:57:17'
    ),
    (
        'e48cb298-f99f-11ef-bedc-0242ac110002',
        'babies',
        '2025-03-05 08:57:17',
        '2025-03-05 08:57:17'
    ),
    (
        'fbadafe2-f99f-11ef-bedc-0242ac110002',
        'teens',
        '2025-03-05 08:57:45',
        '2025-03-05 08:57:45'
    ),
    (
        'fbadb6d7-f99f-11ef-bedc-0242ac110002',
        'adults',
        '2025-03-05 08:57:45',
        '2025-03-05 08:57:45'
    );

-- --------------------------------------------------------
--
-- Table structure for table `games`
--
CREATE TABLE
    `games` (
        `id` char(36) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `audience_id` char(36) CHARACTER
        SET
            utf8mb4 COLLATE utf8mb4_bin NOT NULL,
            `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
            `description` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
            `price` decimal(10, 2) NOT NULL,
            `created_at` datetime NOT NULL,
            `updated_at` datetime NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `games`
--
INSERT INTO
    `games` (
        `id`,
        `audience_id`,
        `name`,
        `description`,
        `price`,
        `created_at`,
        `updated_at`
    )
VALUES
    (
        '7ee59e72-f9a0-11ef-bedc-0242ac110002',
        'e48cb298-f99f-11ef-bedc-0242ac110002',
        'spinner',
        'cool spinner children can play with',
        10.00,
        '2025-03-05 08:58:23',
        '2025-03-05 08:58:23'
    ),
    (
        '7ee5a569-f9a0-11ef-bedc-0242ac110002',
        'e48cb298-f99f-11ef-bedc-0242ac110002',
        'galgiliot',
        'cool galgigliot you can skate with',
        15.00,
        '2025-03-05 08:58:23',
        '2025-03-05 08:58:23'
    ),
    (
        '7ee5a839-f9a0-11ef-bedc-0242ac110002',
        'fbadb6d7-f99f-11ef-bedc-0242ac110002',
        'sofa',
        'cool sofa adults can rest in',
        1000.00,
        '2025-03-05 08:58:23',
        '2025-03-05 08:58:23'
    ),
    (
        '7ee5aab1-f9a0-11ef-bedc-0242ac110002',
        'e48ca927-f99f-11ef-bedc-0242ac110002',
        'sucker',
        'cool sucker babies can suck',
        5.00,
        '2025-03-05 08:58:23',
        '2025-03-05 08:58:23'
    ),
    (
        '7ee5ad12-f9a0-11ef-bedc-0242ac110002',
        'fbadb6d7-f99f-11ef-bedc-0242ac110002',
        'ring',
        'cool ring babies can ring in',
        124.00,
        '2025-03-05 08:58:23',
        '2025-03-05 08:58:23'
    ),
    (
        '98327d19-f9a0-11ef-bedc-0242ac110002',
        'e48cb298-f99f-11ef-bedc-0242ac110002',
        'chair',
        'cool chair adults can rest in',
        1234.00,
        '2025-03-05 09:02:11',
        '2025-03-05 09:02:11'
    ),
    (
        '98328326-f9a0-11ef-bedc-0242ac110002',
        'e48cb298-f99f-11ef-bedc-0242ac110002',
        'desk',
        'cool dest you can learn on§',
        987.00,
        '2025-03-05 09:02:11',
        '2025-03-05 09:02:11'
    );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `audiences`
--
ALTER TABLE `audiences` ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games` ADD PRIMARY KEY (`id`),
ADD KEY `audience_id` (`audience_id`);

--
-- Constraints for dumped tables
--
--
-- Constraints for table `games`
--
ALTER TABLE `games` ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audiences` (`id`) ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;