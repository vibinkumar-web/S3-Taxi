-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 21, 2022 at 11:06 AM
-- Server version: 5.6.51-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ft_welcome`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_product`
--

CREATE TABLE `add_product` (
  `id` int(11) NOT NULL,
  `p_name` varchar(55) DEFAULT NULL,
  `p_id` int(11) NOT NULL,
  `p_type` varchar(55) DEFAULT NULL,
  `pfrom` varchar(55) DEFAULT NULL,
  `price` varchar(55) DEFAULT NULL,
  `gst` int(11) DEFAULT NULL,
  `sgst` int(11) DEFAULT NULL,
  `igst` int(11) DEFAULT NULL,
  `m_date` date DEFAULT NULL,
  `e_date` date DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `p_s_type` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_product`
--

INSERT INTO `add_product` (`id`, `p_name`, `p_id`, `p_type`, `pfrom`, `price`, `gst`, `sgst`, `igst`, `m_date`, `e_date`, `p_date`, `qty`, `p_s_type`) VALUES
(1, 'Test', 1, 'Medical', 'Suppliers', '12500', 12, 12, 12, '2020-05-01', '2020-09-30', '2020-06-03', 100, 'Boxs'),
(10, 'new', 0, 'Instruments', 'Suppliers', '14500', 12, 12, 0, '2020-05-07', '2020-06-25', '2020-06-04', 125, 'Boxs')
;

-- --------------------------------------------------------

--
-- Table structure for table `calcel_booking`
--

CREATE TABLE `calcel_booking` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `e_id` varchar(55) NOT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `b_date` date NOT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `to_whom` varchar(55) DEFAULT NULL,
  `a_no` varchar(55) DEFAULT NULL,
  `cus_count` varchar(55) NOT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `r_status` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `st` varchar(255) DEFAULT NULL,
  `t_type` varchar(10) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(55) DEFAULT NULL,
  `b_type` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `b_now` varchar(10) DEFAULT NULL,
  `q` varchar(55) NOT NULL,
  `v_types` varchar(55) NOT NULL,
  `v_no` varchar(20) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `assign` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `calcel_booking`
--

INSERT INTO `calcel_booking` (`id`, `b_id`, `reason`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `user_id`) VALUES
(174, 2063, 'CANCEL', '', '2022-01-31 17:45:00', '0000-00-00', 'tirunelveli', NULL, NULL, '', 'Tenkasi', NULL, '9080961439', NULL, NULL, '1', 'karuppaiah', '0', NULL, NULL, NULL, '', '', '', '', '0', 2),
(173, 2032, 'CANCEL', '', '2022-01-26 21:00:00', '0000-00-00', 'kadayanallur', NULL, NULL, '', 'Tenkasi', NULL, '9944879470', NULL, NULL, '1', 'MR', '0', NULL, NULL, NULL, '', '', '', '', '0', 2),
(172, 2008, 'CANCEL', '', '2022-01-25 00:30:00', '0000-00-00', 'Alangulam ', NULL, NULL, '', 'Tenkasi', NULL, '9865055244', NULL, NULL, '1', '', '0', NULL, NULL, NULL, '', '', '', '', '0', 2),
(171, 1951, 'CANCEL', '', '2022-01-18 23:00:00', '0000-00-00', 'Tirunelveli', NULL, NULL, '', 'kattalaikudiuruppu', NULL, '9688927927', NULL, NULL, '1', 'sundar ', '0', NULL, NULL, NULL, '', '', '', '', '0', 2),
(170, 1920, 'Cancel', '', '2022-01-15 16:00:00', '0000-00-00', 'Melagaram ', NULL, NULL, '', 'Surandai ', NULL, '6380065762', NULL, NULL, '1', 'MR', '0', NULL, NULL, NULL, '', '', '', '', '0', 2),
(169, 1886, 'CANCEL', '', '2022-01-12 20:00:00', '0000-00-00', 'melagaram', NULL, NULL, '', 'azhapula', NULL, '9442061823', NULL, NULL, '1', 'SIVAKUMAR', '0', NULL, NULL, NULL, '', '', '', '', '0', 2),
(168, 1863, 'Cancel', '', '2022-01-10 13:00:00', '0000-00-00', 'Tirunelveli ', NULL, NULL, '', 'Melagaram ', NULL, '9486106750', NULL, NULL, '1', 'Rathinavel ', '0', NULL, NULL, NULL, '', '', '', '', '0', 2),
(167, 1855, 'CANCEL', '', '2022-01-09 00:00:00', '0000-00-00', 'Idaikal', NULL, NULL, '', 'Tenkasi', NULL, '9487656242', NULL, NULL, '1', 'somasundaram ', '0', NULL, NULL, NULL, '', '', '', '', '0', 2),
(166, 1826, 'Cancel', '', '2022-01-05 14:00:00', '0000-00-00', 'Thenmalai', NULL, NULL, '', 'melagaram', NULL, '9994242603', NULL, NULL, '1', 'guhanandhan', '0', NULL, NULL, NULL, '', '', '', '', '0', 2),
(165, 1819, 'CANCEL', '', '2022-01-03 21:00:00', '0000-00-00', 'Tirunelveli', NULL, NULL, '', 'Sundarapandiapuram', NULL, '8248111219', NULL, NULL, '1', 'ramachandran ', '0', NULL, NULL, NULL, '', '', '', '', '0', 2)
;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `c_name` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `c_name`) VALUES
(2, 'Public'),
(3, 'Bank of India'),
(4, 'others')
;

-- --------------------------------------------------------

--
-- Table structure for table `closing`
--

CREATE TABLE `closing` (
  `id` int(11) NOT NULL,
  `b_id` varchar(55) DEFAULT NULL,
  `v_id` varchar(55) DEFAULT NULL,
  `opening_km` varchar(55) DEFAULT NULL,
  `op_time` time DEFAULT NULL,
  `closing_km` varchar(55) DEFAULT NULL,
  `cl_time` time DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `pickup_time` timestamp NULL DEFAULT NULL,
  `p_date` date NOT NULL,
  `drop_time` timestamp NULL DEFAULT NULL,
  `d_date` date NOT NULL,
  `ac_type` varchar(5) DEFAULT NULL,
  `t_type` varchar(5) DEFAULT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `picup_place` varchar(55) DEFAULT NULL,
  `drop_place` varchar(55) DEFAULT NULL,
  `rwards_point` varchar(10) DEFAULT NULL,
  `packagename` varchar(55) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `other_charge` float DEFAULT NULL,
  `net_total` float DEFAULT NULL,
  `paid_amount` float DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `dis_reason` varchar(255) DEFAULT NULL,
  `to_whom` varchar(55) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `m_no` varchar(55) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `pending` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cus_master`
--

CREATE TABLE `cus_master` (
  `id` int(11) NOT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `m_no` varchar(12) DEFAULT NULL,
  `c_no1` varchar(12) DEFAULT NULL,
  `c_mail` varchar(55) DEFAULT NULL,
  `c_jdate` timestamp NULL DEFAULT NULL,
  `c_add` varchar(255) DEFAULT NULL,
  `c_remarks` varchar(255) DEFAULT NULL,
  `b_count` varchar(11) DEFAULT NULL,
  `r_point` varchar(11) DEFAULT NULL,
  `r_status` varchar(11) DEFAULT NULL,
  `userby` varchar(55) DEFAULT NULL,
  `e_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emp_login_status`
--

CREATE TABLE `emp_login_status` (
  `id` int(11) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `id_emp` varchar(55) DEFAULT NULL,
  `emp_mobile` varchar(55) DEFAULT NULL,
  `emp_name` varchar(55) DEFAULT NULL,
  `vacant_place` varchar(55) DEFAULT NULL,
  `login_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `logout` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_status` enum('0','1') DEFAULT '0',
  `v_no` varchar(55) NOT NULL,
  `ontrip_status` enum('0','1') NOT NULL DEFAULT '0',
  `status_assign` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_login_status`
--

INSERT INTO `emp_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout`, `login_status`, `v_no`, `ontrip_status`, `status_assign`) VALUES
(137, NULL, NULL, NULL, 'jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0'),
(136, NULL, NULL, NULL, 'jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0'),
(135, NULL, NULL, NULL, 'jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0'),
(134, NULL, NULL, NULL, 'jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0'),
(133, NULL, NULL, NULL, 'jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0'),
(132, NULL, NULL, NULL, 'jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0'),
(131, NULL, NULL, NULL, 'Jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0'),
(130, NULL, NULL, NULL, 'jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0'),
(129, NULL, NULL, NULL, 'jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0'),
(128, NULL, NULL, NULL, 'jp', NULL, '2020-05-20 08:47:33', '2020-05-20 22:47:00', '0', '', '0', '0')
;

-- --------------------------------------------------------

--
-- Table structure for table `enquery_tariff`
--

CREATE TABLE `enquery_tariff` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `hrs` varchar(55) DEFAULT NULL,
  `kmeter` float DEFAULT NULL,
  `nonac` float DEFAULT NULL,
  `withac` float DEFAULT NULL,
  `kmnonac` float DEFAULT NULL,
  `kmac` float DEFAULT NULL,
  `belowhun` float DEFAULT NULL,
  `abovehun` float DEFAULT NULL,
  `plus_amt` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquery_tariff`
--

INSERT INTO `enquery_tariff` (`id`, `name`, `hrs`, `kmeter`, `nonac`, `withac`, `kmnonac`, `kmac`, `belowhun`, `abovehun`, `plus_amt`) VALUES
(1, 'Indica 4+1', '', 0, 0, 0, 10, 11, 50, 40, '170'),
(2, 'Swift Dzire 4+1', '', 0, 0, 0, 11, 12, 60, 50, '190'),
(3, 'Xcent 4+1', '', 0, 0, 0, 11, 12, 60, 50, '190'),
(4, 'Zest 4+1', '', 0, 0, 0, 11, 12, 60, 50, '190'),
(6, 'Xylo  7+1', '', 0, 0, 0, 13, 14, 70, 60, '300'),
(8, 'Tavera 9+1', '', 0, 0, 0, 13, 14, 70, 60, '300')
;

-- --------------------------------------------------------

--
-- Table structure for table `enqury_table`
--

CREATE TABLE `enqury_table` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `enquery_id` int(11) NOT NULL,
  `e_id` varchar(55) NOT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `b_date` date NOT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `to_whom` varchar(55) DEFAULT NULL,
  `a_no` varchar(55) DEFAULT NULL,
  `cus_count` varchar(55) NOT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `r_status` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `st` varchar(255) DEFAULT NULL,
  `t_type` varchar(10) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(55) DEFAULT NULL,
  `b_type` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `b_now` varchar(10) DEFAULT NULL,
  `q` varchar(55) NOT NULL,
  `v_types` varchar(55) NOT NULL,
  `v_no` varchar(20) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `assign` enum('0','1') NOT NULL DEFAULT '0',
  `enquery` enum('0','1') NOT NULL DEFAULT '0',
  `booking_status` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enqury_table`
--

INSERT INTO `enqury_table` (`id`, `b_id`, `enquery_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `enquery`, `booking_status`, `user_id`) VALUES
(1361, 3706, 0, '', '2022-06-12 02:27:00', '2022-06-11', 'Madurai', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9442009250', 'Swift', '', '1', 'SUBRAMANIAN iob', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2),
(1360, 3644, 0, '', '2022-06-08 03:10:00', '2022-06-07', 'munnar', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9698296839', 'Xylo', '', '1', 'abdul', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2),
(1359, 3578, 0, '', '2022-06-03 01:27:00', '2022-06-02', 'Rameswaram', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9486963866', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2),
(1358, 3413, 0, '', '2022-05-21 02:38:00', '2022-05-20', 'all falls', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9789801023', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2),
(1357, 3384, 0, '', '2022-05-19 21:38:00', '2022-05-19', 'tirumalaikovil', 'Public', '', '1', 'Senkottai', 'Out Station Tariff', '8056126427', 'Swift', '', '1', 'suresh', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2),
(1356, 3380, 0, '', '2022-05-19 18:29:00', '2022-05-19', 'irukankudi', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9894624766', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2),
(1355, 3356, 0, '', '2022-05-18 01:28:00', '2022-05-17', 'Rajapalayam', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '6382403830', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2),
(1354, 3356, 0, '', '2022-05-18 01:28:00', '2022-05-17', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8356898643', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2),
(1353, 3354, 0, '', '2022-05-17 20:37:00', '2022-05-17', 'Nanguneri', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8056933445', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2),
(1352, 3325, 0, '', '2022-05-15 04:50:00', '2022-05-14', 'sattur', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9791588511', 'Tavera', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 2)
;
INSERT INTO `enqury_table` (`id`, `b_id`, `enquery_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `enquery`, `booking_status`, `user_id`) VALUES
(1147, 7, 0, '', '2021-06-30 03:50:00', '2021-06-29', 'Madurai', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9790427773', 'Indica', '', '1', 'Jp', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1),
(1146, 7, 0, '', '2021-06-30 03:50:00', '2021-06-29', 'Madurai', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9790427773', 'Indica', '', '1', 'Jp', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1),
(1145, 7, 0, '', '2021-06-30 03:50:00', '2021-06-29', 'Madurai', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9790427773', 'Indica', '', '1', 'Jp', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1),
(1144, 7, 0, '', '2021-06-30 04:00:00', '2021-06-29', 'Tenkasi', 'Public', '', '1', 'Madurai', 'Out Station Tariff', '9790427773', 'Indica', '', '0', 'Jp', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1),
(1143, 7, 0, '', '2021-06-30 04:00:00', '2021-06-29', 'Tenkasi', 'Public', '', '1', 'Madurai', 'Out Station Tariff', '9790427773', 'Indica', '', '0', 'Jp', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1),
(1142, 7, 0, '', '2021-06-30 03:29:00', '2021-06-29', 'Nellai', 'Public', '', '1', 'Madurai', 'Out Station Tariff', '9524522210', 'Indica', '', '1', 'Jeyabalan', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1),
(1141, 7, 0, '', '2021-06-30 03:29:00', '2021-06-29', 'Nellai', 'Public', '', '1', 'Madurai', 'Out Station Tariff', '9524522210', 'Indica', '', '1', 'Jeyabalan', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1),
(1140, 7, 0, '', '2021-06-30 03:29:00', '2021-06-29', 'Nellai', 'Public', '', '1', 'Madurai', 'Out Station Tariff', '9524522210', 'Indica', '', '1', 'Jeyabalan', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1),
(1139, 7, 0, '', '2021-06-30 03:25:00', '2021-06-29', 'Madurai', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9524522210', 'Indica', '', '0', 'Jp', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1),
(1138, 7, 0, '', '2021-06-30 03:25:00', '2021-06-29', 'Madurai', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9524522210', 'Indica', '', '0', 'Jp', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', '0', 1)
;

-- --------------------------------------------------------

--
-- Table structure for table `eye_client`
--

CREATE TABLE `eye_client` (
  `id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `c_name` varchar(55) DEFAULT NULL,
  `c_street` varchar(55) DEFAULT NULL,
  `c_area` varchar(55) DEFAULT NULL,
  `c_city` varchar(55) DEFAULT NULL,
  `c_mob` varchar(55) DEFAULT NULL,
  `c_gst` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eye_client`
--

INSERT INTO `eye_client` (`id`, `c_id`, `c_name`, `c_street`, `c_area`, `c_city`, `c_mob`, `c_gst`) VALUES
(1, 0, 'abc company', 'north street', 'chennai', 'vadapalani', '7305357459', ' +91 44 43441880,')
;

-- --------------------------------------------------------

--
-- Table structure for table `francise`
--

CREATE TABLE `francise` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `joining` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `francise`
--

INSERT INTO `francise` (`id`, `name`, `joining`) VALUES
(1, 'Welcome Taxi', '2020-03-19 13:19:48'),
(2, 'Friends Track', '2020-03-19 13:19:48')
;

-- --------------------------------------------------------

--
-- Table structure for table `ft_booking`
--

CREATE TABLE `ft_booking` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `enquery_id` int(11) NOT NULL,
  `e_id` varchar(55) NOT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `b_date` date NOT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `to_whom` varchar(55) DEFAULT NULL,
  `a_no` varchar(55) DEFAULT NULL,
  `cus_count` varchar(55) NOT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `r_status` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `st` varchar(255) DEFAULT NULL,
  `t_type` varchar(10) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(55) DEFAULT NULL,
  `b_type` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `b_now` varchar(10) DEFAULT NULL,
  `q` varchar(55) NOT NULL,
  `v_types` varchar(55) NOT NULL,
  `v_no` varchar(20) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `assign` enum('0','1') NOT NULL DEFAULT '0',
  `booking_status` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ft_cus_master`
--

CREATE TABLE `ft_cus_master` (
  `id` int(11) NOT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ft_cus_master`
--

INSERT INTO `ft_cus_master` (`id`, `b_name`, `m_no`) VALUES
(23873, 'sudalai muthu', '9442451713'),
(23872, 'MR', '9444929625'),
(23871, 'murugan sir', '9843988781'),
(23870, 'MR', '9600266742'),
(23869, 'meenatchi', '9629795990'),
(23868, 'stephan ', '7299252919'),
(23867, 'gnanasambanthan', '9600294005'),
(23866, 'MR', '9994566985'),
(23865, 'MR', '9790219476'),
(23864, 'MR', '8190842894')
;

-- --------------------------------------------------------

--
-- Table structure for table `ft_login`
--

CREATE TABLE `ft_login` (
  `id` int(11) NOT NULL,
  `c_name` varchar(55) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ft_register`
--

CREATE TABLE `ft_register` (
  `id` int(11) NOT NULL,
  `c_name` varchar(55) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `pwd` varchar(55) DEFAULT NULL,
  `r_date` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ft_staff`
--

CREATE TABLE `ft_staff` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(55) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `u_type` varchar(55) DEFAULT NULL,
  `mobile` varchar(55) DEFAULT NULL,
  `pwd` varchar(55) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `j_date` date DEFAULT NULL,
  `salary` varchar(55) DEFAULT NULL,
  `per_month` varchar(55) DEFAULT NULL,
  `hrsp_day` varchar(55) DEFAULT NULL,
  `hrs_day` varchar(55) DEFAULT NULL,
  `hrs_night` varchar(55) DEFAULT NULL,
  `emp_status` enum('0','1') DEFAULT '0',
  `r_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ft_staff`
--

INSERT INTO `ft_staff` (`id`, `emp_id`, `name`, `u_type`, `mobile`, `pwd`, `address`, `dob`, `email`, `j_date`, `salary`, `per_month`, `hrsp_day`, `hrs_day`, `hrs_night`, `emp_status`, `r_date`) VALUES
(4, '1', 'Jp', 'Admin', '9524522210', '4321', 'mmpuram', '1982-01-24', 'djeyabalan@gmail.com', '2019-01-01', '10000', '30', '10', '33.4', '33.4', '', '0000-00-00'),
(5, '2', 'RK', 'Admin', '8489228080', 'rajark07', 'Surandai', '1988-06-21', '', '2018-12-01', '9500', '30', '8', '39.60', '39.6', '0', '0000-00-00')
;

-- --------------------------------------------------------

--
-- Table structure for table `f_calcel_booking`
--

CREATE TABLE `f_calcel_booking` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `e_id` varchar(55) NOT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `b_date` date NOT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `to_whom` varchar(55) DEFAULT NULL,
  `a_no` varchar(55) DEFAULT NULL,
  `cus_count` varchar(55) NOT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `r_status` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `st` varchar(255) DEFAULT NULL,
  `t_type` varchar(10) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(55) DEFAULT NULL,
  `b_type` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `b_now` varchar(10) DEFAULT NULL,
  `q` varchar(55) NOT NULL,
  `v_types` varchar(55) NOT NULL,
  `v_no` varchar(20) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `assign` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_calcel_booking`
--

INSERT INTO `f_calcel_booking` (`id`, `b_id`, `reason`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `user_id`) VALUES
(348, 2191, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(347, 2219, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(346, 2217, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(345, 2218, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(344, 2209, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(343, 2197, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(342, 2187, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(341, 2185, 'Cancel', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(340, 2168, 'Cancel', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(339, 2167, 'Cancel', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2)
;
INSERT INTO `f_calcel_booking` (`id`, `b_id`, `reason`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `user_id`) VALUES
(512, 3181, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(513, 3181, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(514, 3173, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(515, 3191, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(516, 3190, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(517, 3200, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(518, 3202, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(519, 3199, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(520, 3212, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2),
(521, 3198, 'CANCEL', '', '0000-00-00 00:00:00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '0', 2)
;

-- --------------------------------------------------------

--
-- Table structure for table `f_client`
--

CREATE TABLE `f_client` (
  `id` int(11) NOT NULL,
  `c_name` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_client`
--

INSERT INTO `f_client` (`id`, `c_name`) VALUES
(1, 'Public'),
(2, 'Boi')
;

-- --------------------------------------------------------

--
-- Table structure for table `f_closing`
--

CREATE TABLE `f_closing` (
  `id` int(11) NOT NULL,
  `b_id` varchar(55) DEFAULT NULL,
  `bid` int(11) NOT NULL,
  `v_id` varchar(55) DEFAULT NULL,
  `opening_km` varchar(55) DEFAULT NULL,
  `op_time` time DEFAULT NULL,
  `closing_km` varchar(55) DEFAULT NULL,
  `cl_time` time DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `pickup_time` timestamp NULL DEFAULT NULL,
  `p_date` date NOT NULL,
  `drop_time` timestamp NULL DEFAULT NULL,
  `d_date` date NOT NULL,
  `ac_type` varchar(5) DEFAULT NULL,
  `t_type` varchar(5) DEFAULT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `picup_place` varchar(55) DEFAULT NULL,
  `drop_place` varchar(55) DEFAULT NULL,
  `rwards_point` varchar(10) DEFAULT NULL,
  `packagename` varchar(55) DEFAULT NULL,
  `pack_charges` varchar(55) NOT NULL,
  `waiting_charges` varchar(55) NOT NULL,
  `ex_km` varchar(55) NOT NULL,
  `ex_km_charges` varchar(55) NOT NULL,
  `wait_hrs` varchar(55) NOT NULL,
  `wait_min` varchar(55) NOT NULL,
  `total` float DEFAULT NULL,
  `other_charge` float DEFAULT NULL,
  `net_total` float DEFAULT NULL,
  `paid_amount` float DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `dis_reason` varchar(255) DEFAULT NULL,
  `to_whom` varchar(55) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `m_no` varchar(55) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `pending` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_closing`
--

INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(1, '1', 1, '100', '1001', NULL, '1021', NULL, '', '2021-06-28 04:00:00', '2021-06-27', '2021-06-28 04:00:00', '2021-06-27', 'Non A', '0', 'Indica', 'Tenkasi', 'Nellai', '3.500', '2Hrs 20KM', '350', '0', '0', '0', '0', '0', NULL, 0, 0, 0, '', '', 'Public', 'Jp', '9524522210', '9790427773', '0', 1),
(2, '5', 5, '101', '1001', NULL, '1100', NULL, '', '2021-06-28 17:19:00', '2021-06-28', '2021-06-28 17:21:00', '2021-06-28', 'Non A', '0', 'Indica', 'Tenkasi', 'Tirunelveli', '10.610', '4Hrs 90KM', '980', '0', '9', '81', '0', '0', NULL, 0, 1061, 1061, '', '', 'Public', 'Mr', '9003968836', '8608290090', '0', 2),
(3, '7', 7, '100', '1025', NULL, '1045', NULL, '', '2021-07-01 19:19:00', '2021-07-01', '2021-07-01 19:20:00', '2021-07-01', 'Non A', '0', 'Indica', 'Tenkasi', 'Nellai', '3.500', '2Hrs 20KM', '350', '0', '0', '0', '0', '0', NULL, 0, 350, 250, '', '', 'Public', 'Sugu', '9080454742', '9790427773', '0', 1),
(4, '10', 10, '232', '86259', NULL, '86333', NULL, '', '2021-07-01 22:18:00', '2021-07-01', '2021-07-01 22:19:00', '2021-07-01', 'Non A', '0', 'Xcent', 'PANAYANKURICHI', 'TENKASI', '9.300', '4Hrs 70KM', '890', '0', '4', '40', '0', '0', NULL, 0, 930, 953, '', '', 'Public', 'SIVAKUMAR', '9842622283', '', '0', 2),
(5, '12', 12, '311', '113433', NULL, '113551', NULL, '', '2021-07-01 22:31:00', '2021-07-01', '2021-07-01 23:11:00', '2021-07-01', 'Non A', '0', 'Indica', 'TENKASI', 'Tirunelveli', '13.230', '5Hrs 110KM', '1270', '0', '8', '80', '0', '0', NULL, 0, 1323, 1323, '27', '', 'Public', 'SUNDAR', '9688927927', '9600778432', '0', 2),
(6, '16', 16, '208', '92016', NULL, '92152', NULL, '', '2021-07-02 01:06:00', '2021-07-01', '2021-07-02 01:07:00', '2021-07-01', 'Non A', '0', 'Xcent', 'TENKASI', 'Tirunelveli', '14.920', '5Hrs 130KM', '1490', '0', '6', '60', '0', '0', NULL, 0, 1492, 1492, '58', '', 'Public', 'SANKAR ', '9894588389', '9786649582', '0', 2),
(7, '11', 11, '204', '177523', NULL, '177646', NULL, '', '2021-07-02 01:14:00', '2021-07-01', '2021-07-02 01:15:00', '2021-07-01', 'Non A', '0', 'Swift', 'melagaram', 'Tirunelveli', '15.540', '5Hrs 120KM', '1390', '0', '3', '30', '0', '0', NULL, 0, 1554, 1554, '', '', 'Public', 'VINAYAGAM ', '7904974823', '8428916359', '0', 2),
(8, '13', 13, '221', '120745', NULL, '120861', NULL, '', '2021-07-01 22:33:00', '2021-07-01', '2021-07-02 03:06:00', '2021-07-01', 'Non A', '0', 'Etios', 'Tenkasi', 'Tirunelveli', '15.600', '5Hrs 110KM', '1290', '0', '6', '60', '0', '0', NULL, 0, 1560, 1560, '', '', 'Public', 'MARISELVAM', '9487148369', '7010822940', '0', 2),
(9, '22', 22, '202', '325564', NULL, '325674', NULL, '', '2021-07-02 03:53:00', '2021-07-01', '2021-07-02 04:43:00', '2021-07-01', 'Non A', '1', 'Swift', 'Tenkasi', 'Tirunelveli', '12.450', '8Hrs 220KM', '2390', '0', '0', '0', '0', '0', NULL, 0, 1245, 1245, '1145', '', 'Public', 'BANU', '8850576233', '9987862378', '0', 2),
(10, '19', 19, '208', '92163', NULL, '92301', NULL, '', '2021-07-02 03:30:00', '2021-07-01', '2021-07-02 04:48:00', '2021-07-01', 'Non A', '1', 'Xcent', 'Sundarapandiapuram', 'Sivagiri (TP)', '15.110', '9Hrs 270KM', '2890', '0', '6', '60', '0', '0', NULL, 0, 1511, 1511, '1439', '', 'Public', 'MURUGAN ', '9597989673', '9786649582', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(151, '185', 185, '208', '97730', NULL, '98018', NULL, '', '2021-07-16 20:47:00', '2021-07-16', '2021-07-17 04:18:00', '2021-07-16', 'Non A', '0', 'Xcent', 'tenkasi', 'Virudhunagar', '29.368', '9Hrs 280KM', '2990', '0', '8', '80', '0', '0', NULL, 0, 2936, 2936, '134', '', 'Public', 'deepak', '9344087004', '9786649582', '0', 2),
(152, '175', 175, '104', '137797', NULL, '138037', NULL, 'OK', '2021-07-16 18:19:00', '2021-07-17', '2021-07-17 17:24:00', '2021-07-17', 'Non A', '0', 'Zest', 'MELAGARAM', 'Tiruchendur', '28.5628', '8Hrs 240KM', '2590', '171.66666666666666', '0', '0', '3', '26', NULL, 0, 2855.67, 2855, '', '', 'Public', 'SUBRAMANIAN ', '9443086869', '9043389982', '0', 2),
(153, '187', 187, '102', '262113', NULL, '262250', NULL, '', '2021-07-17 18:17:00', '2021-07-17', '2021-07-17 20:06:00', '2021-07-17', 'Non A', '0', 'Indica', 'TENKASI', 'TIRUNELVELI', '13.840', '5Hrs 130KM', '1340', '0', '7', '63', '0', '0', NULL, 0, 1384, 1384, '19', '', 'Public', 'PARVATHI', '8124288301', '9500459428', '0', 2),
(154, '188', 188, '311', '136640', NULL, '136772', NULL, '', '2021-07-17 18:17:00', '2021-07-17', '2021-07-17 22:04:00', '2021-07-17', 'Non A', '0', 'Indica', 'TENKASI', 'TIRUNELVELI', '13.820', '5Hrs 130KM', '1340', '0', '2', '18', '0', '0', NULL, 0, 1382, 1382, '', '', 'Public', 'ESAKKIDURAI', '7010571310', '9600778432', '0', 2),
(155, '193', 193, '204', '178877', NULL, '178949', NULL, '', '2021-07-17 21:08:00', '2021-07-17', '2021-07-17 22:07:00', '2021-07-17', 'Non A', '0', 'Swift', 'KUDIURUPPU ', 'papanasam', '8.840', '4Hrs 70KM', '890', '0', '2', '20', '0', '0', NULL, 0, 884, 884, '26', '', 'Public', 'MR', '9986001520', '8428916359', '0', 2),
(156, '189', 189, '244', '137427', NULL, '137537', NULL, '', '2021-07-17 22:11:00', '2021-07-17', '2021-07-17 22:11:00', '2021-07-17', 'Non A', '0', 'Xcent', 'TENKASI', 'TIRUNELVELI', '12.4554', '5Hrs 110KM', '1290', '0', '0', '0', '0', '0', NULL, 0, 1245, 1245, '45', '', 'Public', 'sivasumbaramian ', '9663216215', '9366664411', '0', 2),
(157, '190', 190, '306', '176125', NULL, '176187', NULL, '', '2021-07-17 22:07:00', '2021-07-17', '2021-07-17 23:21:00', '2021-07-17', 'Non A', '0', 'Tavera', 'MELAGARAM', 'SENKOTTAI', '12.6937', '4Hrs 60KM', '980', '0', '2', '22', '0', '0', NULL, 0, 1269, 1269, '', '', 'Public', 'MR', '9444811975', '7977162251', '0', 2),
(158, '194', 194, '202', '328139', NULL, '328247', NULL, '', '2021-07-17 23:11:00', '2021-07-17', '2021-07-18 00:42:00', '2021-07-17', 'Non A', '0', 'Swift', 'MELAGARAM', 'TIRUNELVELI', '12.260', '5Hrs 100KM', '1190', '0', '8', '80', '0', '0', NULL, 0, 1226, 1226, '44', '', 'Public', 'MR', '6379847503', '9987862378', '0', 2),
(159, '191', 191, '242', '117456', NULL, '117507', NULL, '', '2021-07-18 01:01:00', '2021-07-17', '2021-07-18 01:02:00', '2021-07-17', 'Non A', '0', 'Swift', 'TENKASI', 'Panpoli', '10.0918', '4Hrs 50KM', '690', '0', '1', '10', '0', '0', NULL, 0, 1009, 1009, '', '', 'Public', 'ponraj', '9789940582', '8489967945', '0', 2),
(160, '192', 192, '240', '57545', NULL, '57663', NULL, '', '2021-07-17 18:57:00', '2021-07-18', '2021-07-18 13:46:00', '2021-07-18', 'Non A', '0', 'Swift', 'TENKASI', 'Tirunelveli', '15.91109', '5Hrs 110KM', '1290', '190', '8', '80', '3', '48', NULL, 0, 1591, 1591, '', '', 'Public', 'MARISELVAM', '9487148369', '6379649008', '0', 2)
;AGARAM', 'Pirancheri', '13.490', '5Hrs 120KM', '1390', '0', '1', '10', '0', '0', NULL, 0, 1349, 1349, '51', '', 'Public', 'MR', '9790579308', '8870871169', '0', 2),
(294, '345', 345, '102', '264087', NULL, '264173', NULL, '', '2021-08-07 18:40:00', '2021-08-07', '2021-08-07 18:40:00', '2021-08-07', 'Non A', '0', 'Indica', 'TENKASAI', 'Vasudevanur', '9.640', '4Hrs 80KM', '890', '0', '6', '54', '0', '0', NULL, 0, 964, 964, '', '', 'Public', 'MR', '7871598020', '9500459428', '0', 2),
(295, '339', 339, '311', '139735', NULL, '139870', NULL, '', '2021-08-07 17:26:00', '2021-08-07', '2021-08-08 01:55:00', '2021-08-07', 'Non A', '0', 'Indica', 'TENKASI', 'Tharuvai', '14.4814', '5Hrs 130KM', '1340', '138.66666666666666', '5', '45', '3', '28', NULL, 0, 1447.67, 1447, '76', '', 'Public', 'PARVATHI', '8124288301', '9600778432', '0', 2),
(296, '343', 343, '208', '99925', NULL, '100037', NULL, '', '2021-08-07 17:27:00', '2021-08-07', '2021-08-08 01:57:00', '2021-08-07', 'Non A', '0', 'Xcent', 'TENKASI', 'TIRUNELVELI', '13.7066', '5Hrs 110KM', '1290', '174.16666666666666', '2', '20', '3', '29', NULL, 0, 1370.17, 1370, '114', '', 'Public', 'sivasumbaramian ', '9663216215', '9786649582', '0', 2),
(297, '347', 347, '311', '139875', NULL, '139895', NULL, '', '2021-08-08 01:56:00', '2021-08-07', '2021-08-08 02:12:00', '2021-08-07', 'Non A', '0', 'Indica', 'Tenkasi ', 'Tenkasi (M)', '3.500', '2Hrs 20KM', '350', '0', '0', '0', '0', '0', NULL, 0, 350, 350, '', '', 'Public', 'MR', '9994861757', '9600778432', '0', 2),
(298, '341', 341, '315', '150481', NULL, '150854', NULL, '', '2021-08-07 17:26:00', '2021-08-07', '2021-08-08 02:16:00', '2021-08-07', 'Non A', '0', 'Swift', 'TENKASI', 'MADURAI', '37.430', '12Hrs 370KM', '3890', '0', '3', '30', '0', '0', NULL, 0, 3743, 3743, '177', '', 'Public', 'MOHAMMED ALI ', '9715865500', '9080770663', '0', 2);
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(299, '342', 342, '306', '178060', NULL, '178191', NULL, '', '2021-08-08 01:54:00', '2021-08-07', '2021-08-08 02:25:00', '2021-08-07', 'Non A', '0', 'Tavera', 'TENKASI', 'TIRUNELVELI', '20.6720', '5Hrs 130KM', '1880', '0', '1', '12', '0', '0', NULL, 0, 2067, 2067, '', '', 'Public', 'MR', '9791662781', '7977162251', '0', 2),
(300, '350', 350, '223', '169010', NULL, '169030', NULL, '', '2021-08-08 18:22:00', '2021-08-08', '2021-08-08 18:23:00', '2021-08-08', 'Non A', '0', 'Etios', 'cuttralam', 'tenkasi', '3.500', '2Hrs 20KM', '390', '0', '0', '0', '0', '0', NULL, 0, 350, 350, '40', '', 'Public', 'MR', '9999295627', '6383742273', '0', 2),
(301, '348', 348, '104', '139593', NULL, '139787', NULL, '', '2021-08-08 18:19:00', '2021-08-08', '2021-08-08 21:08:00', '2021-08-08', 'Non A', '0', 'Zest', 'tenkasi', 'Thoothukkudi', '20.4321', '7Hrs 190KM', '2090', '0', '4', '40', '0', '0', NULL, 0, 2043, 2043, '87', '', 'Public', 'MR', '7550132420', '9043389982', '0', 2),
(302, '351', 351, '221', '123527', NULL, '123547', NULL, '', '2021-08-08 21:09:00', '2021-08-08', '2021-08-08 21:10:00', '2021-08-08', 'Non A', '0', 'Etios', 'tenkasi', 'CUTTRALAM ', '6.500', '2Hrs 20KM', '390', '0', '0', '0', '0', '0', NULL, 0, 650, 650, '', '', 'Public', 'selva ', '8610426138', '7010822940', '0', 2),
(303, '349', 349, '102', '264202', NULL, '264370', NULL, '', '2021-08-09 00:27:00', '2021-08-08', '2021-08-09 00:28:00', '2021-08-08', 'Non A', '0', 'Indica', 'melagaram', 'tirunrlveli', '17.020', '6Hrs 160KM', '1610', '0', '8', '72', '0', '0', NULL, 0, 1702, 1702, '', '', 'Public', 'MR', '7598119005', '9500459428', '0', 2),
(304, '353', 353, '242', '119541', NULL, '119665', NULL, '', '2021-08-08 23:43:00', '2021-08-08', '2021-08-09 01:35:00', '2021-08-08', 'Non A', '0', 'Swift', 'tenkasi', 'tirunelveli', '14.90270', '5Hrs 120KM', '1390', '0', '4', '40', '0', '0', NULL, 0, 1490, 1490, '', '', 'Public', 'MARISELVAM', '9487148369', '9688779152', '0', 2),
(305, '352', 352, '240', '60143', NULL, '60275', NULL, '', '2021-08-08 21:06:00', '2021-08-08', '2021-08-09 04:31:00', '2021-08-08', 'Non A', '0', 'Swift', 'tenkasi', 'tirunelveli', '16.500', '5Hrs 130KM', '1490', '120', '2', '20', '2', '24', NULL, 0, 1650, 1650, '', '', 'Public', 'fathima', '8489024161', '6379649008', '0', 2),
(306, '356', 356, '102', '264371', NULL, '264483', NULL, '', '2021-08-09 16:58:00', '2021-08-09', '2021-08-09 16:59:00', '2021-08-09', 'Non A', '0', 'Indica', 'tenkasi', 'tirunelveli', '11.980', '5Hrs 110KM', '1160', '0', '2', '18', '0', '0', NULL, 0, 1198, 1198, '', '', 'Public', 'MR', '9750567942', '9500459428', '0', 2),
(307, '357', 357, '221', '123549', NULL, '123571', NULL, '', '2021-08-09 16:58:00', '2021-08-09', '2021-08-09 17:00:00', '2021-08-09', 'Non A', '1', 'Etios', 'TENKASAI', 'pavoorchathram', '4.100', '4Hrs 40KM', '590', '0', '4', '40', '0', '0', NULL, 0, 410, 410, '220', '', 'Public', 'MR', '9597686832', '7010822940', '0', 2),
(308, '360', 360, '223', '169035', NULL, '169197', NULL, '', '2021-08-10 00:13:00', '2021-08-09', '2021-08-10 02:52:00', '2021-08-09', 'Non A', '0', 'Etios', 'senkottai', 'tirunelveli', '17.3932', '6Hrs 160KM', '1790', '0', '2', '20', '0', '0', NULL, 0, 1739, 1739, '71', '', 'Public', 'SANKAR ', '9894191247', '6383742273', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(447, '510', 510, '104', '141322', NULL, '141440', NULL, '', '2021-08-25 19:03:00', '2021-08-25', '2021-08-26 01:40:00', '2021-08-25', 'Non A', '0', 'Zest', 'tenkasi', 'Tirunelveli', '16.31423', '5Hrs 110KM', '1290', '80.83333333333334', '8', '80', '1', '37', NULL, 0, 1630.83, 1630, '', '', 'Public', 'MARISELVAM', '9487148369', '9043389982', '0', 2),
(448, '509', 509, '223', '170796', NULL, '170884', NULL, '', '2021-08-25 16:36:00', '2021-08-25', '2021-08-26 02:26:00', '2021-08-25', 'Non A', '0', 'Etios', 'nannagaram', 'Uthumalai', '12.220', '4Hrs 80KM', '990', '349', '8', '80', '5', '49', NULL, 0, 1222, 1222, '197', '', 'Public', 'selvakumar', '8870499257', '6383742273', '0', 2),
(449, '514', 514, '306', '179030', NULL, '179140', NULL, '', '2021-08-25 21:29:00', '2021-08-25', '2021-08-26 02:44:00', '2021-08-25', 'Non A', '0', 'Tavera', 'Sundarapandiapuram', 'papanasam ', '14.300', '5Hrs 110KM', '1640', '15', '0', '0', '0', '15', NULL, 0, 1430.5, 1430, '227', '', 'Public', 'MR', '9791932558', '7977162251', '0', 2),
(450, '508', 508, '202', '331937', NULL, '333212', NULL, '', '2021-08-25 16:04:00', '2021-08-26', '2021-08-26 15:38:00', '2021-08-26', 'Non A', '0', 'Swift', 'tenkasi', 'Kancheepuram', '129.5024', '46Hrs 1270KM', '12890', '0', '5', '50', '0', '0', NULL, 0, 12950, 12950, '', '', 'Public', 'MR', '9578204719', '9987862378', '0', 2),
(451, '516', 516, '230', '157550', NULL, '157884', NULL, '', '2021-08-25 23:58:00', '2021-08-26', '2021-08-26 15:39:00', '2021-08-26', 'Non A', '0', 'Swift', 'Senkottai', 'madurai', '34.3034', '11Hrs 330KM', '3490', '233.33333333333331', '4', '40', '4', '40', NULL, 0, 3430.33, 3430, '333', '', 'Public', 'ARUN', '9742888077', '6381666478', '0', 2),
(452, '517', 517, '238', '83952', NULL, '84077', NULL, '', '2021-08-26 15:37:00', '2021-08-26', '2021-08-26 15:39:00', '2021-08-26', 'Non A', '0', 'Swift', 'tenkasi', 'Tirunelveli', '17.6728', '5Hrs 120KM', '1390', '0', '5', '50', '0', '0', NULL, 0, 1767, 1767, '', '', 'Public', 'ganapathy', '9442065333', '8870871169', '0', 2),
(453, '523', 523, '221', '125158', NULL, '125272', NULL, '', '2021-08-26 17:40:00', '2021-08-26', '2021-08-26 20:04:00', '2021-08-26', 'Non A', '0', 'Etios', 'tenkasi', 'tirunelveli', '13.400', '5Hrs 110KM', '1290', '0', '4', '40', '0', '0', NULL, 0, 1340, 1340, '', '', 'Public', 'MR', '9626110224', '7010822940', '0', 2),
(454, '526', 526, '202', '333220', NULL, '333301', NULL, '', '2021-08-26 17:42:00', '2021-08-26', '2021-08-26 20:05:00', '2021-08-26', 'Non A', '0', 'Swift', 'tenkasi', 'kallidaikurichi', '10.1044', '4Hrs 80KM', '990', '0', '1', '10', '0', '0', NULL, 0, 1010, 1010, '', '', 'Public', 'shankar ', '7904244941', '9987862378', '0', 2),
(455, '524', 524, '308', '154017', NULL, '154133', NULL, '', '2021-08-26 15:53:00', '2021-08-26', '2021-08-26 21:40:00', '2021-08-26', 'Non A', '0', 'Tavera', 'Idaikal', 'SANKARANKOVIL', '17.010', '5Hrs 110KM', '1640', '46', '6', '72', '0', '46', NULL, 0, 1700.67, 1700, '65', '', 'Public', 'MR', '9677694239', '9585425570', '0', 2),
(456, '525', 525, '246', '221259', NULL, '221387', NULL, '', '2021-08-26 16:29:00', '2021-08-26', '2021-08-26 23:55:00', '2021-08-26', 'Non A', '0', 'Etios', 'tenkasi', 'tirunelveli', '16.590', '5Hrs 120KM', '1390', '121.66666666666667', '8', '80', '2', '26', NULL, 0, 1658.67, 1658, '', '', 'Public', 'thirukumaran', '9500002142', '7418845990', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(595, '682', 682, '311', '144585', NULL, '144642', NULL, '', '2021-09-09 21:35:00', '2021-09-09', '2021-09-10 00:44:00', '2021-09-09', 'Non A', '0', 'Indica', 'Tenkasi', 'alangulam', '7.43164', '4Hrs 50KM', '620', '0', '7', '63', '0', '0', NULL, 0, 743, 743, '', '', 'Public', 'karuppaiah', '9080961439', '9600778432', '0', 2),
(596, '681', 681, '315', '154808', NULL, '155124', NULL, '', '2021-09-09 21:35:00', '2021-09-09', '2021-09-10 00:45:00', '2021-09-09', 'Non A', '0', 'Swift', 'Tenkasi', 'marthandam', '33.600', '10Hrs 310KM', '3290', '0', '6', '60', '0', '0', NULL, 0, 3360, 3360, '', '', 'Public', 'MR', '9791727333', '9080770663', '0', 2),
(597, '676', 676, '306', '181800', NULL, '181960', NULL, '', '2021-09-09 16:02:00', '2021-09-09', '2021-09-10 01:17:00', '2021-09-09', 'Non A', '0', 'Tavera', 'rajapalayam', 'tenkasi', '27.3673', '6Hrs 160KM', '2240', '195', '0', '0', '3', '15', NULL, 0, 2735.5, 2735, '', '', 'Public', 'RAMRAJ', '6379224037', '7977162251', '0', 2),
(598, '685', 685, '250', '132857', NULL, '132896', NULL, '', '2021-09-10 00:29:00', '2021-09-09', '2021-09-10 02:52:00', '2021-09-09', 'Non A', '0', 'Indigo', 'tenkasi', 'kadayanallur', '5.900', '3Hrs 30KM', '490', '0', '9', '90', '0', '0', NULL, 0, 590, 590, '', '', 'Public', 'MR', '9994564382', '9489290278', '0', 2),
(599, '670', 670, '324', '149898', NULL, '150113', NULL, '', '2021-09-10 03:59:00', '2021-09-09', '2021-09-10 04:02:00', '2021-09-09', 'Non A', '0', 'Xylo', 'sivaramapettai', 'Tirunelveli', '31.8020', '7Hrs 210KM', '2840', '0', '5', '60', '0', '0', NULL, 0, 3180, 3180, '', '', 'Public', 'kumar ktc ', '7397661290', '8668013137', '0', 2),
(600, '688', 688, '104', '143790', NULL, '143888', NULL, '', '2021-09-10 02:17:00', '2021-09-09', '2021-09-10 04:06:00', '2021-09-09', 'Non A', '0', 'Zest', 'tenkasi', 'veeravanallur', '11.8035', '4Hrs 90KM', '1090', '0', '8', '80', '0', '0', NULL, 0, 1180, 1180, '', '', 'Public', 'faruk ', '7845844701', '9043389982', '0', 2),
(601, '679', 679, '246', '222965', NULL, '223315', NULL, '', '2021-09-09 18:09:00', '2021-09-09', '2021-09-10 05:50:00', '2021-09-09', 'Non A', '0', 'Etios', 'vallam', 'madurai', '40.500', '12Hrs 350KM', '3690', '0', '0', '0', '0', '0', NULL, 0, 4050, 4050, '', '', 'Public', 'MR', '7373354141', '7418845990', '0', 2),
(602, '692', 692, '315', '155176', NULL, '155246', NULL, '', '2021-09-10 16:09:00', '2021-09-10', '2021-09-10 18:14:00', '2021-09-10', 'Non A', '0', 'Swift', 'tenkasi', 'mannarkovil', '8.650', '4Hrs 70KM', '890', '0', '0', '0', '0', '0', NULL, 0, 865, 865, '25', '', 'Public', 'MR', '9629654539', '9080770663', '0', 2),
(603, '687', 687, '308', '155736', NULL, '155869', NULL, '', '2021-09-10 16:22:00', '2021-09-10', '2021-09-10 19:59:00', '2021-09-10', 'Non A', '0', 'Tavera', 'tirunelveli', 'sivaramapettai', '19.1117', '5Hrs 130KM', '1880', '0', '3', '36', '0', '0', NULL, 0, 1911, 1911, '5', '', 'Public', 'gurusamy', '9442524897', '9585425570', '0', 2),
(604, '694', 694, '212', '63278', NULL, '63315', NULL, '', '2021-09-10 19:43:00', '2021-09-10', '2021-09-10 20:54:00', '2021-09-10', 'Non A', '1', 'Swift', 'tenkasi', 'surendai', '5.500', '4Hrs 70KM', '890', '0', '4', '40', '0', '0', NULL, 0, 550, 550, '380', '', 'Public', 'MR', '9445104407', '9677694239', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(743, '838', 838, '221', '128788', NULL, '128923', NULL, '', '2021-09-24 21:19:00', '2021-09-24', '2021-09-25 01:20:00', '2021-09-24', 'Non A', '0', 'Etios', 'melagaram', 'Tirunelveli', '15.5019', '5Hrs 130KM', '1490', '0', '5', '50', '0', '0', NULL, 0, 1550, 1550, '', '', 'Public', 'GANESHAN ', '9486615708', '7010822940', '0', 2),
(744, '836', 836, '104', '145067', NULL, '145207', NULL, '', '2021-09-24 21:14:00', '2021-09-24', '2021-09-25 02:43:00', '2021-09-24', 'Non A', '0', 'Zest', 'tenkasi', 'Kayatharu ', '16.5020', '5Hrs 140KM', '1590', '23.333333333333332', '0', '0', '0', '28', NULL, 0, 1650.33, 1650, '', '', 'Public', 'MR', '9944524950', '9043389982', '0', 2),
(745, '842', 842, '250', '134820', NULL, '134880', NULL, '', '2021-09-25 02:41:00', '2021-09-24', '2021-09-25 05:27:00', '2021-09-24', 'Non A', '0', 'Indica', 'Tenkasi', 'puliyankudi', '7.3047', '4Hrs 60KM', '710', '0', '0', '0', '0', '0', NULL, 0, 730, 730, '', '', 'Public', 'fathima', '8489024161', '9489290278', '0', 2),
(746, '837', 837, '324', '151395', NULL, '151570', NULL, '', '2021-09-24 21:35:00', '2021-09-24', '2021-09-25 05:28:00', '2021-09-24', 'Non A', '0', 'Xylo', 'Tenkasi', 'Srivilliputhur', '25.110', '6Hrs 170KM', '2360', '112', '5', '60', '1', '52', NULL, 0, 2510.67, 2510, '40', '', 'Public', 'shiva', '7904077517', '8668013137', '0', 2),
(747, '846', 846, '311', '147289', NULL, '147381', NULL, '', '2021-09-25 17:18:00', '2021-09-25', '2021-09-25 21:16:00', '2021-09-25', 'Non A', '0', 'Indica', 'tenkasi', 'sankarankovil', '11.100', '4Hrs 90KM', '980', '0', '2', '18', '0', '0', NULL, 0, 1110, 1110, '', '', 'Public', 'gopal', '8778659396', '9600778432', '0', 2),
(748, '845', 845, '230', '164210', NULL, '164362', NULL, '', '2021-09-25 18:14:00', '2021-09-25', '2021-09-25 21:22:00', '2021-09-25', 'Non A', '0', 'Swift', 'tirunelveli', 'Ayiraperi', '17.00148', '6Hrs 150KM', '1690', '0', '2', '20', '0', '0', NULL, 0, 1700, 1700, '10', '', 'Public', 'GANESHAN ', '6369040910', '6381666478', '0', 2),
(749, '848', 848, '250', '134888', NULL, '135062', NULL, '', '2021-09-25 17:46:00', '2021-09-25', '2021-09-26 00:17:00', '2021-09-25', 'Non A', '0', 'Indica', 'Tenkasi', 'ambai', '17.510', '6Hrs 170KM', '1700', '20.666666666666668', '4', '36', '0', '31', NULL, 0, 1750.67, 1750, '6', '', 'Public', 'palani', '9361641702', '9489290278', '0', 2),
(750, '840', 840, '102', '270526', NULL, '270648', NULL, '', '2021-09-25 17:16:00', '2021-09-25', '2021-09-26 00:20:00', '2021-09-25', 'Non A', '0', 'Indica', 'Tenkasi', 'Tirunelveli', '13.18104', '5Hrs 120KM', '1250', '81.33333333333333', '2', '18', '2', '2', NULL, 0, 1318.33, 1318, '31', '', 'Public', 'rahman refai', '9486602904', '9500459428', '0', 2),
(751, '844', 844, '104', '145208', NULL, '145348', NULL, '', '2021-09-25 17:17:00', '2021-09-25', '2021-09-26 00:21:00', '2021-09-25', 'Non A', '0', 'Swift', 'cuttralam', 'tirunelveli', '17.8063', '5Hrs 140KM', '1590', '102.5', '0', '0', '2', '3', NULL, 0, 1780.5, 1780, '', '', 'Public', 'SANKAR ', '9894191247', '9043389982', '0', 2),
(752, '843', 843, '202', '337129', NULL, '337251', NULL, '', '2021-09-25 17:17:00', '2021-09-25', '2021-09-26 00:22:00', '2021-09-25', 'Non A', '0', 'Swift', 'tenkasi', 'Tirunelveli', '17.42237', '5Hrs 120KM', '1390', '103.33333333333333', '2', '20', '2', '4', NULL, 0, 1742.33, 1742, '', '', 'Public', 'subramanian ', '9578204719', '9987862378', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(891, '999', 999, '315', '160253', NULL, '160343', NULL, '', '2021-10-15 17:37:00', '2021-10-15', '2021-10-15 19:54:00', '2021-10-15', 'Non A', '0', 'Swift', 'Karadikulam', 'Tenkasi', '11.006', '4Hrs 90KM', '1090', '0', '0', '0', '0', '0', NULL, 0, 1100, 1100, '', '', 'Public', 'muthu master ', '6383622870', '9080770663', '0', 2),
(892, '1000', 1000, '238', '92184', NULL, '92206', NULL, '', '2021-10-15 17:36:00', '2021-10-15', '2021-10-15 20:47:00', '2021-10-15', 'Non A', '0', 'Swift', 'tenkasi', 'Senkottai', '4.210', '2Hrs 20KM', '390', '82.83333333333333', '2', '20', '1', '11', NULL, 0, 420.83, 420, '72', '', 'Public', 'MR', '9487917497', '8870871169', '0', 2),
(893, '998', 998, '311', '148198', NULL, '148318', NULL, '', '2021-10-15 17:37:00', '2021-10-15', '2021-10-15 20:52:00', '2021-10-15', 'Non A', '0', 'Indica', 'tenkasi', 'Tirunelveli', '12.500', '5Hrs 120KM', '1250', '0', '0', '0', '0', '0', NULL, 0, 1250, 1250, '', '', 'Public', 'MR', '9500852603', '9600778432', '0', 2),
(894, '1004', 1004, '238', '92213', NULL, '92233', NULL, '', '2021-10-15 20:52:00', '2021-10-15', '2021-10-15 21:28:00', '2021-10-15', 'Non A', '0', 'Swift', 'Tenkasi', 'Senkottai', '4.000', '2Hrs 20KM', '390', '0', '0', '0', '0', '0', NULL, 0, 400, 400, '', '', 'Public', 'MR', '8807707450', '8870871169', '0', 2),
(895, '996', 996, '104', '148058', NULL, '148368', NULL, '', '2021-10-15 17:31:00', '2021-10-15', '2021-10-15 23:54:00', '2021-10-15', 'Non A', '0', 'Zest', 'Tenkasi', 'nagarcoil', '33.000', '10Hrs 310KM', '3290', '0', '0', '0', '0', '0', NULL, 0, 3300, 3300, '', '', 'Public', 'RAJA', '8754300575', '9043389982', '0', 2),
(896, '991', 991, '308', '159872', NULL, '160082', NULL, '', '2021-10-15 17:31:00', '2021-10-15', '2021-10-16 01:47:00', '2021-10-15', 'Non A', '0', 'Tavera', 'Tenkasi', 'Thalaiyuthu', '30.16270', '7Hrs 210KM', '2840', '76', '0', '0', '1', '16', NULL, 0, 3015.67, 3015, '', '', 'Public', 'subramanian ', '9578204719', '9585425570', '0', 2),
(897, '1005', 1005, '311', '148320', NULL, '148380', NULL, '', '2021-10-15 23:04:00', '2021-10-15', '2021-10-16 03:36:00', '2021-10-15', 'Non A', '0', 'Indica', 'Tenkasi', 'puliyankudi', '7.31102', '4Hrs 60KM', '710', '26.666666666666668', '0', '0', '0', '32', NULL, 0, 730.67, 730, '6', '', 'Public', 'fathima', '8489024161', '9600778432', '0', 2),
(898, '1002', 1002, '223', '178567', NULL, '178817', NULL, '', '2021-10-15 20:20:00', '2021-10-15', '2021-10-16 05:39:00', '2021-10-15', 'Non A', '0', 'Etios', 'Idaikal', 'thiruvanandhapuram', '35.000', '8Hrs 250KM', '2690', '64.16666666666667', '0', '0', '1', '17', NULL, 0, 3500.17, 3500, '', '', 'Public', 'MR', '9080972504', '6383742273', '0', 2),
(899, '1008', 1008, '238', '92241', NULL, '92338', NULL, '', '2021-10-16 01:23:00', '2021-10-15', '2021-10-16 05:41:00', '2021-10-15', 'Non A', '0', 'Swift', 'Tenkasi', 'sankarankovil', '11.8010', '4Hrs 90KM', '1090', '16', '7', '70', '0', '16', NULL, 0, 1180, 1180, '', '', 'Public', 'ARUN', '8610128478', '8870871169', '0', 2),
(900, '1001', 1001, '202', '339683', NULL, '339818', NULL, '', '2021-10-15 19:12:00', '2021-10-15', '2021-10-16 05:42:00', '2021-10-15', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '19.3518', '5Hrs 130KM', '1490', '274.1666666666667', '5', '50', '5', '29', NULL, 0, 1935.17, 1935, '', '', 'Public', 'indra ', '6379256141', '9987862378', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(1038, '1156', 1156, '104', '151833', NULL, '152083', NULL, '', '2021-11-01 14:56:00', '2021-11-01', '2021-11-02 02:17:00', '2021-11-01', 'Non A', '0', 'Zest', 'Keelapuliyur ', 'thiruvanandhapuram', '35.4137', '8Hrs 250KM', '2690', '167.5', '0', '0', '3', '21', NULL, 0, 3540.5, 3540, '', '', 'Public', 'sankar boi', '9791473647', '9043389982', '0', 2),
(1039, '1155', 1155, '315', '163468', NULL, '163825', NULL, '', '2021-11-01 14:57:00', '2021-11-01', '2021-11-02 02:30:00', '2021-11-01', 'Non A', '0', 'Swift', 'melagaram', 'Madurai', '38.1093', '12Hrs 350KM', '3690', '0', '7', '70', '0', '0', NULL, 0, 3810, 3810, '', '', 'Public', 'piramumuthu', '9894318996', '9080770663', '0', 2),
(1040, '1161', 1161, '104', '152113', NULL, '152231', NULL, '', '2021-11-02 16:59:00', '2021-11-02', '2021-11-02 17:03:00', '2021-11-02', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '13.70659', '5Hrs 110KM', '1290', '0', '8', '80', '0', '0', NULL, 0, 1370, 1370, '', '', 'Public', 'MARISELVAM', '9487148369', '9043389982', '0', 2),
(1041, '1163', 1163, '238', '95583', NULL, '95619', NULL, '', '2021-11-02 17:00:00', '2021-11-02', '2021-11-02 17:03:00', '2021-11-02', 'Non A', '0', 'Swift', 'Tenkasi', 'Alangulam', '5.508', '3Hrs 30KM', '490', '0', '6', '60', '0', '0', NULL, 0, 550, 550, '', '', 'Public', 'chithambaram', '9443582599', '8870871169', '0', 2),
(1042, '1167', 1167, '102', '280678', NULL, '280958', NULL, '', '2021-11-02 19:34:00', '2021-11-02', '2021-11-02 23:20:00', '2021-11-02', 'Non A', '0', 'Indica', 'melagaram ', 'nagarcoil', '27.000', '9Hrs 280KM', '2690', '0', '0', '0', '0', '0', NULL, 0, 2700, 2700, '', '', 'Public', 'MR', '8838423182', '9500459428', '0', 2),
(1043, '1168', 1168, '250', '139130', NULL, '139182', NULL, '', '2021-11-02 23:23:00', '2021-11-02', '2021-11-02 23:23:00', '2021-11-02', 'Non A', '0', 'Indigo', 'Tenkasi', 'v k pudur', '7.100', '4Hrs 50KM', '690', '0', '2', '20', '0', '0', NULL, 0, 710, 710, '', '', 'Public', 'MR', '6379012709', '9489290278', '0', 2),
(1044, '1162', 1162, '324', '153595', NULL, '153865', NULL, '', '2021-11-02 16:59:00', '2021-11-02', '2021-11-03 01:36:00', '2021-11-02', 'Non A', '0', 'Xylo', 'Tenkasi', 'Sattur', '41.100', '9Hrs 270KM', '3560', '0', '0', '0', '0', '0', NULL, 0, 4110, 4110, '', '', 'Public', 'MR', '8220839129', '8668013137', '0', 2),
(1045, '1169', 1169, '223', '182135', NULL, '182235', NULL, '', '2021-11-03 17:03:00', '2021-11-03', '2021-11-03 17:04:00', '2021-11-03', 'Non A', '0', 'Etios', 'Tenkasi', 'Vasudevanallur ', '13.500', '5Hrs 100KM', '1190', '0', '0', '0', '0', '0', NULL, 0, 1350, 1350, '', '', 'Public', 'MR 223', '8240856362', '6383742273', '0', 2),
(1046, '1174', 1174, '250', '139185', NULL, '139221', NULL, '', '2021-11-03 20:41:00', '2021-11-03', '2021-11-03 20:41:00', '2021-11-03', 'Non A', '0', 'Indigo', 'ilathur', 'Senkottai', '5.5018', '3Hrs 30KM', '490', '0', '6', '60', '0', '0', NULL, 0, 550, 550, '', '', 'Public', 'MR', '9025506403', '9489290278', '0', 2),
(1047, '1172', 1172, '250', '139223', NULL, '139327', NULL, '', '2021-11-03 20:43:00', '2021-11-03', '2021-11-03 21:07:00', '2021-11-03', 'Non A', '0', 'Indica', 'Tenkasi', 'sivakiri', '12.3033', '5Hrs 100KM', '1070', '0', '4', '36', '0', '0', NULL, 0, 1230, 1230, '', '', 'Public', 'ponraj', '9789940582', '9489290278', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(1185, '1329', 1329, '221', '136296', NULL, '136355', NULL, '', '2021-11-20 17:07:00', '2021-11-20', '2021-11-20 17:09:00', '2021-11-20', 'Non A', '0', 'Swift', 'Tenkasi', 'puliyankudi', '7.80335', '4Hrs 50KM', '690', '0', '9', '90', '0', '0', NULL, 0, 780, 780, '', '', 'Public', 'karuppaiah', '9080961439', '7010822940', '0', 2),
(1186, '1326', 1326, '238', '99429', NULL, '99589', NULL, '', '2021-11-19 20:20:00', '2021-11-20', '2021-11-20 17:10:00', '2021-11-20', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '18.410', '6Hrs 160KM', '1790', '741.6666666666666', '0', '0', '14', '50', NULL, 0, 1840.67, 1840, '691', '', 'Public', 'MR', '9842132442', '8870871169', '0', 2),
(1187, '1328', 1328, '104', '156004', NULL, '156128', NULL, '', '2021-11-19 20:53:00', '2021-11-20', '2021-11-20 17:11:00', '2021-11-20', 'Non A', '0', 'Zest', 'Tenkasi', 'Tirunelveli', '14.3082', '5Hrs 120KM', '1390', '764.1666666666666', '4', '40', '15', '17', NULL, 0, 1430.17, 1430, '764', '', 'Public', 'sankar boi', '9791473647', '9043389982', '0', 2),
(1188, '1331', 1331, '221', '136356', NULL, '136652', NULL, '', '2021-11-20 17:16:00', '2021-11-20', '2021-11-21 00:09:00', '2021-11-20', 'Non A', '0', 'Etios', 'Tenkasi', 'Madurai', '32.98124', '10Hrs 290KM', '3090', '0', '6', '60', '0', '0', NULL, 0, 3298, 3298, '', '', 'Public', 'bala subramanian jewel', '9843688244', '7010822940', '0', 2),
(1189, '1332', 1332, '238', '99648', NULL, '99743', NULL, '', '2021-11-20 17:22:00', '2021-11-20', '2021-11-21 00:10:00', '2021-11-20', 'Non A', '0', 'Indica', 'melagaram', 'Kadayam', '12.4595', '4Hrs 90KM', '980', '139.16666666666666', '5', '45', '2', '47', NULL, 0, 1245.17, 1245, '', '', 'Public', 'GANESHAN ', '9486615708', '8870871169', '0', 2),
(1190, '1321', 1321, '102', '282665', NULL, '282725', NULL, '', '2021-11-20 19:42:00', '2021-11-20', '2021-11-21 00:10:00', '2021-11-20', 'Non A', '0', 'Indica', 'Ayikudi', 'kadayam', '7.2032', '4Hrs 60KM', '710', '23.333333333333332', '0', '0', '0', '28', NULL, 0, 720.33, 720, '13', '', 'Public', 'MOHAN ', '9003861156', '9500459428', '0', 2),
(1191, '1338', 1338, '252', '50278', NULL, '50339', NULL, '', '2021-11-21 02:07:00', '2021-11-20', '2021-11-21 02:08:00', '2021-11-20', 'Non A', '0', 'Swift', 'VALLAM', 'SALAIPUDUR', '14.600', '4Hrs 60KM', '790', '0', '1', '10', '0', '0', NULL, 0, 1460, 1460, '', '', 'Public', 'MR', '9787001918', '9361163069', '0', 2),
(1192, '1336', 1336, '238', '99744', NULL, '99764', NULL, '', '2021-11-21 02:07:00', '2021-11-20', '2021-11-21 05:03:00', '2021-11-20', 'Non A', '0', 'Swift', 'Tenkasi', 'Idaikal', '4.80174', '2Hrs 20KM', '390', '64.16666666666666', '0', '0', '0', '55', NULL, 0, 480.17, 480, '', '', 'Public', 'RAMRAJ', '6379224037', '8870871169', '0', 2),
(1193, '1335', 1335, '315', '166851', NULL, '166979', NULL, '', '2021-11-20 22:14:00', '2021-11-20', '2021-11-21 06:11:00', '2021-11-20', 'Non A', '0', 'Swift', 'kudiuruppu ', 'Tirunelveli', '16.21113', '5Hrs 120KM', '1390', '146.66666666666666', '8', '80', '2', '56', NULL, 0, 1620.67, 1620, '', '', 'Public', 'bagavathy', '8838189637', '9080770663', '0', 2),
(1194, '1330', 1330, '324', '155331', NULL, '156591', NULL, '', '2021-11-21 02:57:00', '2021-11-21', '2021-11-21 16:49:00', '2021-11-21', 'Non A', '0', 'Xylo', 'melagaram', 'banglore', '163.80131', '46Hrs 1260KM', '15440', '0', '0', '0', '0', '0', NULL, 0, 16380, 16380, '', '', 'Public', 'piramumuthu', '9894318996', '8668013137', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(1332, '1485', 1485, '250', '143604', NULL, '143730', NULL, '', '2021-12-07 16:50:00', '2021-12-07', '2021-12-07 20:29:00', '2021-12-07', 'Non A', '0', 'Indigo', 'melagaram', 'Sethur', '14.5047', '5Hrs 120KM', '1390', '0', '6', '60', '0', '0', NULL, 0, 1450, 1450, '', '', 'Public', 'sankaranarayanan', '9944279735', '9489290278', '0', 2),
(1333, '1491', 1491, '315', '169124', NULL, '169259', NULL, '', '2021-12-07 18:57:00', '2021-12-07', '2021-12-07 22:52:00', '2021-12-07', 'Non A', '0', 'Swift', 'minnagar', 's kovil', '15.400', '5Hrs 130KM', '1490', '0', '5', '50', '0', '0', NULL, 0, 1540, 1540, '', '', 'Public', 'mr', '9384213419', '9080770663', '0', 2),
(1334, '1492', 1492, '221', '138575', NULL, '138613', NULL, '', '2021-12-07 19:33:00', '2021-12-07', '2021-12-08 01:13:00', '2021-12-07', 'Non A', '0', 'Etios', 'Tenkasi', 'kadayanallur', '6.305', '3Hrs 30KM', '490', '185.5', '8', '80', '2', '39', NULL, 0, 630.5, 630, '125', '', 'Public', 'MR', '8220506068', '7010822940', '0', 2),
(1335, '1493', 1493, '308', '165265', NULL, '165340', NULL, '', '2021-12-07 22:49:00', '2021-12-07', '2021-12-08 02:37:00', '2021-12-07', 'Non A', '0', 'Tavera', 'Keelapuliyur ', 'Ambasamudram', '13.050', '4Hrs 70KM', '1160', '0', '5', '60', '0', '0', NULL, 0, 1305, 1305, '', '', 'Public', 'MR', '7708730520', '9585425570', '0', 2),
(1336, '1488', 1488, '252', '52574', NULL, '52638', NULL, '', '2021-12-07 16:49:00', '2021-12-07', '2021-12-08 02:59:00', '2021-12-07', 'Non A', '0', 'Swift', 'Senkottai', 'Thenmalai', '12.800', '4Hrs 60KM', '790', '369', '4', '40', '6', '9', NULL, 0, 1280, 1280, '', '', 'Public', 'MR', '7806917931', '9361163069', '0', 2),
(1337, '1489', 1489, '102', '284889', NULL, '285209', NULL, '', '2021-12-08 03:01:00', '2021-12-07', '2021-12-08 03:02:00', '2021-12-07', 'Non A', '0', 'Indica', 'Madurai', 'Tenkasi', '30.70296', '11Hrs 320KM', '3050', '0', '0', '0', '0', '0', NULL, 0, 3070, 3070, '', '', 'Public', 'janani', '9150392679', '9500459428', '0', 2),
(1338, '1490', 1490, '230', '180989', NULL, '180989', NULL, '', '2021-12-08 03:35:00', '2021-12-07', '2021-12-08 03:36:00', '2021-12-07', 'Non A', '0', 'Swift', 'Madurai', 'Senkottai', '34.300', 'L-TariffHrs 0KM', '3390', 'NaN', '4', '40', 'NaN', '0', NULL, 0, 3430, 3430, '', '', 'Public', 'esakkiraj ', '8667596582', '6381666478', '0', 2),
(1339, '1497', 1497, '311', '153217', NULL, '153343', NULL, '', '2021-12-08 03:44:00', '2021-12-08', '2021-12-08 16:58:00', '2021-12-08', 'Non A', '0', 'Indica', 'Tenkasi', 'devarkulam', '13.2425', '5Hrs 120KM', '1250', '329.3333333333333', '6', '54', '8', '14', NULL, 0, 1324.33, 1324, '309', '', 'Public', 'kasipandian ', '9842920559', '9600778432', '0', 2),
(1340, '1502', 1502, '230', '180990', NULL, '180991', NULL, '', '2021-12-08 17:09:00', '2021-12-08', '2021-12-08 17:10:00', '2021-12-08', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '13.30158', 'L-TariffHrs 0KM', '1290', 'NaN', '4', '40', 'NaN', '0', NULL, 0, 1330, 1330, '', '', 'Public', 'ganapathy', '9442065333', '6381666478', '0', 2),
(1341, '1496', 1496, '256', '221880', NULL, '222043', NULL, '', '2021-12-08 17:08:00', '2021-12-08', '2021-12-08 23:28:00', '2021-12-08', 'Non A', '0', 'Swift', 'melagaram', 'Tirunelveli', '18.9617', '6Hrs 160KM', '1790', '15.833333333333332', '3', '30', '0', '19', NULL, 0, 1895.83, 1895, '', '', 'Public', 'selvakumar', '9443971800', '9442081303', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(1478, '1658', 1658, '256', '223314', NULL, '223429', NULL, '', '2021-12-20 20:55:00', '2021-12-20', '2021-12-21 03:15:00', '2021-12-20', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '14.01829', '5Hrs 110KM', '1290', '65.83333333333333', '5', '50', '1', '19', NULL, 0, 1400.83, 1400, '5', '', 'Public', 'MARISELVAM', '9487148369', '9442081303', '0', 2),
(1479, '1659', 1659, '230', '183045', NULL, '183193', NULL, '', '2021-12-20 18:59:00', '2021-12-20', '2021-12-21 03:20:00', '2021-12-20', 'Non A', '0', 'Swift', 'Tenkasi', 'kuruvikulam', '18.21142', '5Hrs 140KM', '1590', '165.83333333333334', '8', '80', '3', '19', NULL, 0, 1820.83, 1820, '15', '', 'Public', 'SUBRAMANIAN ', '9443086869', '6381666478', '0', 2),
(1480, '1657', 1657, '306', '1854951', NULL, '1855199', NULL, '', '2021-12-21 01:27:00', '2021-12-20', '2021-12-21 06:53:00', '2021-12-20', 'Non A', '0', 'Tavera', 'Tenkasi', 'Tiruchendur', '37.6412', '8Hrs 240KM', '3200', '0', '8', '96', '0', '0', NULL, 0, 3764, 3764, '', '', 'Public', 'MR', '9842009846', '7977162251', '0', 2),
(1481, '1667', 1667, '256', '223444', NULL, '223474', NULL, '', '2021-12-21 17:16:00', '2021-12-21', '2021-12-21 19:49:00', '2021-12-21', 'Non A', '0', 'Swift', 'Tenkasi', 'cuttrallam', '5.0062', '3Hrs 30KM', '490', '0', '0', '0', '0', '0', NULL, 0, 500, 500, '', '', 'Public', 'vaikundam', '9842687702', '9442081303', '0', 2),
(1482, '1666', 1666, '311', '155400', NULL, '155400', NULL, '', '2021-12-22 02:03:00', '2021-12-21', '2021-12-22 02:05:00', '2021-12-21', 'Non A', '0', 'Indica', 'Tenkasi', 'Tirunelveli', '15.000', 'L-TariffHrs 0KM', '1520', 'NaN', '0', '0', 'NaN', '0', NULL, 0, 1500, 1500, '20', '', 'Public', 'velladurai', '9384943977', '9600778432', '0', 2),
(1483, '1665', 1665, '223', '189399', NULL, '189625', NULL, '', '2021-12-21 17:13:00', '2021-12-21', '2021-12-22 02:12:00', '2021-12-21', 'Non A', '0', 'Etios', 'ilanji', 'Kayangulam', '30.500', '8Hrs 220KM', '2390', '44.166666666666664', '6', '60', '0', '53', NULL, 0, 3050.17, 3050, '', '', 'Public', 'senthil', '8754304370', '6383742273', '0', 2),
(1484, '1662', 1662, '230', '183198', NULL, '183342', NULL, '', '2021-12-21 15:32:00', '2021-12-21', '2021-12-22 02:15:00', '2021-12-21', 'Non A', '0', 'Indica', 'Tenkasi', 'Tirunelveli', '17.39261', '5Hrs 140KM', '1430', '226.66666666666666', '4', '36', '5', '40', NULL, 0, 1738.67, 1738, '', '', 'Public', 'RAMASWAMY ', '8778557641', '6381666478', '0', 2),
(1485, '1664', 1664, '238', '184380', NULL, '184500', NULL, '', '2021-12-21 17:15:00', '2021-12-21', '2021-12-22 02:17:00', '2021-12-21', 'Non A', '0', 'Etios', 'Tenkasi', 'Tirunelveli', '14.91843', '5Hrs 120KM', '1390', '200.83333333333334', '0', '0', '4', '1', NULL, 0, 1490.83, 1490, '100', '', 'Public', 'MARISELVAM', '9487148369', '8870871169', '0', 2),
(1486, '1663', 1663, '254', '151661', NULL, '151801', NULL, '', '2021-12-21 17:16:00', '2021-12-21', '2021-12-22 02:24:00', '2021-12-21', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '18.410', '5Hrs 140KM', '1590', '201.66666666666666', '0', '0', '4', '2', NULL, 0, 1840.67, 1840, '', '', 'Public', 'marimuthu', '8248430431', '8903064210', '0', 2),
(1487, '1670', 1670, '230', '183348', NULL, '183460', NULL, '', '2021-12-22 02:38:00', '2021-12-21', '2021-12-22 05:21:00', '2021-12-21', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '14.00103', '5Hrs 110KM', '1290', '0', '2', '20', '0', '0', NULL, 0, 1400, 1400, '', '', 'Public', 'sankar boi', '9791473647', '6381666478', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(1624, '1824', 1824, '252', '55869', NULL, '55987', NULL, '', '2022-01-04 18:33:00', '2022-01-04', '2022-01-05 01:50:00', '2022-01-04', 'Non A', '0', 'Swift', 'arunaperi ', 'Tirunelveli', '14.7014', '5Hrs 110KM', '1290', '114.16666666666667', '8', '80', '2', '17', NULL, 0, 1470.17, 1470, '14', '', 'Public', 'anand', '8870600451', '9361163069', '0', 2),
(1625, '1828', 1828, '252', '55998', NULL, '56318', NULL, '', '2022-01-05 14:51:00', '2022-01-05', '2022-01-05 18:45:00', '2022-01-05', 'A/C', '0', 'Swift', 'Tenkasi ', 'Madurai ', '35.50242', '11Hrs 320KM', '3390', '0', '0', '0', '0', '0', NULL, 0, 3550, 3550, '', '', 'Public', 'bala subramanian jewel', '9843688244', '9361163069', '0', 2),
(1626, '1825', 1825, '238', '186521', NULL, '186521', NULL, '', '2022-01-05 16:51:00', '2022-01-05', '2022-01-05 22:20:00', '2022-01-05', 'Non A', '0', 'Swift', 'melagaram', 'surandai', '7.9189', 'L-TariffHrs 0KM', '590', 'NaN', '5', '50', 'NaN', '28', NULL, 0, 790.67, 790, '', '', 'Public', 'GANESHAN ', '9442515889', '8870871169', '0', 2),
(1627, '1829', 1829, '104', '162794', NULL, '162877', NULL, '', '2022-01-05 16:51:00', '2022-01-05', '2022-01-06 00:54:00', '2022-01-05', 'Non A', '0', 'Swift', 'Minnagar ', 'V k Puram ', '13.4345', '4Hrs 80KM', '990', '225', '3', '30', '3', '45', NULL, 0, 1343, 1343, '', '', 'Public', 'pr paul', '9486510769', '9043389982', '0', 2),
(1628, '1830', 1830, '102', '287758', NULL, '287897', NULL, '', '2022-01-05 21:42:00', '2022-01-05', '2022-01-06 05:21:00', '2022-01-05', 'Non A', '0', 'Indica', 'melagaram', 'Tirunelveli', '15.31216', '5Hrs 130KM', '1340', '105.33333333333333', '9', '81', '2', '38', NULL, 0, 1531.33, 1531, '', '', 'Public', 'SOMU', '8838130102', '9500459428', '0', 2),
(1629, '1827', 1827, '254', '154301', NULL, '154514', NULL, '', '2022-01-05 14:51:00', '2022-01-05', '2022-01-06 05:23:00', '2022-01-05', 'Non A', '0', 'Swift', 'Melagaram ', 'Thenmalai', '26.70192', '7Hrs 210KM', '2290', '375', '3', '30', '7', '30', NULL, 0, 2670, 2670, '25', '', 'Public', 'guhanandhan', '9994242603', '8903064210', '0', 2),
(1630, '1833', 1833, '223', '192109', NULL, '192169', NULL, '', '2022-01-06 05:19:00', '2022-01-06', '2022-01-06 17:08:00', '2022-01-06', 'Non A', '0', 'Etios', 'Kudiuruppu ', 'Alangulam ', '8.6018', '4Hrs 60KM', '790', '468', '0', '0', '7', '48', NULL, 0, 860, 860, '398', '', 'Public', 'MR', '9790901842', '6383742273', '0', 2),
(1631, '1832', 1832, '223', '192170', NULL, '192304', NULL, '', '2022-01-06 18:38:00', '2022-01-06', '2022-01-06 21:26:00', '2022-01-06', 'Non A', '0', 'Swift', 'Panpoli', 'Tirunelveli', '15.970', '5Hrs 130KM', '1490', '0', '4', '40', '0', '0', NULL, 0, 1597, 1597, '', '', 'Public', 'shanmugam', '9941894552', '6383742273', '0', 2),
(1632, '1836', 1836, '252', '56351', NULL, '56387', NULL, '', '2022-01-06 19:11:00', '2022-01-06', '2022-01-06 22:53:00', '2022-01-06', 'Non A', '0', 'Swift', 'Tenkasi', 's v karai', '6.100', '3Hrs 30KM', '490', '49', '6', '60', '0', '42', NULL, 0, 610, 610, '', '', 'Public', 'arputharaj', '9710795551', '9361163069', '0', 2),
(1633, '1831', 1831, '308', '169893', NULL, '170000', NULL, '', '2022-01-06 17:13:00', '2022-01-06', '2022-01-06 23:06:00', '2022-01-06', 'Non A', '0', 'Tavera', 'Tenkasi', 'Thenmalai', '24.9220', '5Hrs 100KM', '1520', '52', '7', '84', '0', '52', NULL, 0, 2491.67, 2491, '', '', 'Public', 'MR', '9087040637', '9585425570', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(1770, '1985', 1985, '104', '166572', NULL, '166697', NULL, '', '2022-01-22 17:46:00', '2022-01-22', '2022-01-23 01:28:00', '2022-01-22', 'Non A', '0', 'Swift', 'melagaram', 'Pirancheri', '16.1574', '5Hrs 120KM', '1390', '175', '5', '50', '3', '30', NULL, 0, 1615, 1615, '', '', 'Public', 'MR', '9790579308', '9043389982', '0', 2),
(1771, '1988', 1988, '246', '238850', NULL, '238997', NULL, '', '2022-01-22 17:47:00', '2022-01-22', '2022-01-23 01:29:00', '2022-01-22', 'Non A', '0', 'Etios', 'Senkottai', 'Tirunelveli', '16.810', '5Hrs 140KM', '1590', '20.833333333333336', '7', '70', '0', '25', NULL, 0, 1680.83, 1680, '', '', 'Public', 'MR', '7339129673', '8438811020', '0', 2),
(1772, '1989', 1989, '230', '190286', NULL, '190601', NULL, '', '2022-01-22 17:45:00', '2022-01-22', '2022-01-23 01:30:00', '2022-01-22', 'Non A', '0', 'Swift', 'melagaram', 'azhapula', '41.00108', '10Hrs 310KM', '3290', '0', '5', '50', '0', '0', NULL, 0, 4100, 4100, '', '', 'Public', 'SIVAKUMAR', '9442061823', '6381666478', '0', 2),
(1773, '1987', 1987, '310', '104957', NULL, '105209', NULL, '', '2022-01-22 17:46:00', '2022-01-22', '2022-01-23 03:03:00', '2022-01-22', 'Non A', '0', 'Xylo', 'Tenkasi', 'Thoothukkudi', '37.57138', '8Hrs 250KM', '3320', '76', '2', '24', '1', '16', NULL, 0, 3756.67, 3756, '', '', 'Public', 'chithambaram', '9443582599', '9600361097', '0', 2),
(1774, '1957', 1957, '238', '187288', NULL, '187417', NULL, '', '2022-01-22 18:44:00', '2022-01-23', '2022-01-23 15:09:00', '2022-01-23', 'Non A', '0', 'Swift', 'cuttralam', 'Tirunelveli', '19.81101', '5Hrs 120KM', '1390', '769.1666666666666', '9', '90', '15', '23', NULL, 0, 1981.17, 1981, '268', '', 'Public', 'mr rajendran ', '9976750384', '8870871169', '0', 2),
(1775, '1994', 1994, '238', '187418', NULL, '187581', NULL, '', '2022-01-24 02:25:00', '2022-01-23', '2022-01-24 02:33:00', '2022-01-23', 'Non A', '0', 'Swift', 'Melagaram ', 'Syedinganallur ', '20.2027', '6Hrs 160KM', '1790', '0', '3', '30', '0', '0', NULL, 0, 2020, 2020, '', '', 'Public', '', '9840276168', '8870871169', '0', 2),
(1776, '1992', 1992, '310', '105233', NULL, '105385', NULL, '', '2022-01-24 02:27:00', '2022-01-23', '2022-01-24 02:34:00', '2022-01-23', 'Non A', '0', 'Xylo', 'Tenkasi', 'Rajapalayam', '24.89194', '6Hrs 150KM', '2120', '0', '2', '24', '0', '0', NULL, 0, 2489, 2489, '', '', 'Public', 'MARIAPPAN', '9944838346', '9944615079', '0', 2),
(1777, '1995', 1995, '112', '137985', NULL, '138033', NULL, '', '2022-01-24 15:01:00', '2022-01-24', '2022-01-24 17:20:00', '2022-01-24', 'Non A', '1', 'Indica', 'Melagaram ', 'Chokkampatti ', '6.1017', '4Hrs 90KM', '980', '0', '6', '54', '0', '0', NULL, 0, 610, 610, '424', '', 'Public', 'Rathinavel ', '9486106750', '9600778432', '0', 2),
(1778, '1990', 1990, '246', '238998', NULL, '239118', NULL, '', '2022-01-24 15:01:00', '2022-01-24', '2022-01-24 17:32:00', '2022-01-24', 'Non A', '0', 'Swift', 'Tirunelveli', 'melagaram', '15.9059', '5Hrs 120KM', '1390', '0', '0', '0', '0', '0', NULL, 0, 1590, 1590, '', '', 'Public', 'JANAKI', '9833391930', '8438811020', '0', 2),
(1779, '2000', 2000, '246', '239173', NULL, '239173', NULL, '', '2022-01-24 17:55:00', '2022-01-24', '2022-01-24 19:46:00', '2022-01-24', 'Non A', '0', 'Etios', 'melagaram', 'Mathalamparai', '3.900', 'L-TariffHrs 0KM', '290', 'NaN', '6', '60', 'NaN', '51', NULL, 0, 390, 390, '', '', 'Public', 'sagunthala', '7373369820', '8438811020', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(1915, '2161', 2161, '315', '177407', NULL, '177607', NULL, '', '2022-02-08 17:56:00', '2022-02-08', '2022-02-09 06:03:00', '2022-02-08', 'Non A', '0', 'Swift', 'Kuthukalvalasai', 'Tirunelveli', '25.560', '7Hrs 200KM', '2390', '255.83333333333334', '0', '0', '5', '7', NULL, 0, 2555.83, 2555, '90', '', 'Public', 'MR', '9943216254', '9080770663', '0', 2),
(1916, '2162', 2162, '104', '169557', NULL, '169795', NULL, '', '2022-02-09 00:50:00', '2022-02-09', '2022-02-09 14:23:00', '2022-02-09', 'Non A', '0', 'Indica', 'thiruvanandhapuram', 'Kasimejorpuram', '30.710', '8Hrs 230KM', '2470', '220.66666666666666', '8', '80', '5', '31', NULL, 0, 3070.67, 3070, '', '', 'Public', 'PREMA', '9818638637', '9043389982', '0', 2),
(1917, '2171', 2171, '254', '160648', NULL, '160778', NULL, '', '2022-02-09 14:18:00', '2022-02-09', '2022-02-09 19:14:00', '2022-02-09', 'Non A', '0', 'Indica', 'Tenkasi', 'Tirunelveli', '15.40423', '5Hrs 130KM', '1470', '29.333333333333332', '0', '0', '0', '44', NULL, 0, 1540.33, 1540, '', '', 'Public', 'subramanian ', '9578204719', '8903064210', '0', 2),
(1918, '2173', 2173, '246', '240842', NULL, '240916', NULL, '', '2022-02-09 17:13:00', '2022-02-09', '2022-02-09 19:16:00', '2022-02-09', 'Non A', '0', 'Indica', 'chathram', 'Papankulam', '9.30142', '4Hrs 70KM', '870', '0', '4', '40', '0', '0', NULL, 0, 930, 930, '', '', 'Public', 'SANKAR ', '9944749846', '8438811020', '0', 2),
(1919, '2158', 2158, '238', '187897', NULL, '187897', NULL, '', '2022-02-08 17:00:00', '2022-02-09', '2022-02-09 19:18:00', '2022-02-09', 'Non A', '0', 'Indica', 'ilanji', 'Tirunelveli', '26.000', 'L-TariffHrs 0KM', '1970', 'NaN', '7', '70', 'NaN', '17', NULL, 0, 2600.33, 2600, '251', '', 'Public', 'MR', '9597220336', '8870871169', '0', 2),
(1920, '2172', 2172, '310', '107050', NULL, '107135', NULL, '', '2022-02-09 14:30:00', '2022-02-09', '2022-02-09 19:44:00', '2022-02-09', 'Non A', '0', 'Xylo', 'kudiuruppu', 'rettiyarpatti', '14.00379', '4Hrs 80KM', '1340', '0', '5', '65', '0', '0', NULL, 0, 1400, 1400, '5', '', 'Public', 'GANESHAN ', '6369040910', '9944615079', '0', 2),
(1921, '2169', 2169, '230', '192371', NULL, '192913', NULL, '', '2022-02-09 14:19:00', '2022-02-09', '2022-02-09 19:51:00', '2022-02-09', 'Non A', '0', 'Indica', 'melagaram', 'Palani', '54.2011', '18Hrs 540KM', '5570', '0', '2', '20', '0', '0', NULL, 0, 5420, 5420, '170', '', 'Public', 'kalirajan', '8220567399', '6381666478', '0', 2),
(1922, '2176', 2176, '221', '145498', NULL, '145503', NULL, '', '2022-02-09 19:22:00', '2022-02-09', '2022-02-09 21:28:00', '2022-02-09', 'Non A', '0', 'Indica', 'Keelapuliyur ', 'Tenkasi', '3.50547', 'L-TariffHrs 0KM', '370', 'NaN', '0', '0', 'NaN', '5', NULL, 0, 350, 350, '25', '', 'Public', 'PRINCE ', '7397451996', '7010822940', '0', 2),
(1923, '2175', 2175, '315', '177613', NULL, '177690', NULL, '', '2022-02-09 19:16:00', '2022-02-09', '2022-02-09 22:00:00', '2022-02-09', 'Non A', '0', 'Indica', 'tenkasi', 'puliyankudi', '9.8653', '4Hrs 70KM', '870', '45.83333333333333', '7', '70', '0', '55', NULL, 0, 985.83, 985, '', '', 'Public', 'siva', '7402219811', '9080770663', '0', 2),
(1924, '2164', 2164, '256', '227869', NULL, '228160', NULL, '', '2022-02-09 11:43:00', '2022-02-09', '2022-02-09 22:02:00', '2022-02-09', 'Non A', '0', 'Indica', 'melagaram', 'nagarcoil', '31.71101', '10Hrs 290KM', '3070', '50.666666666666664', '1', '10', '1', '16', NULL, 0, 3170.67, 3170, '', '', 'Public', 'eswaran', '9176322956', '9442081303', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(2060, '2353', 2353, '112', '142410', NULL, '142430', NULL, '', '2022-02-25 02:24:00', '2022-02-24', '2022-02-25 02:43:00', '2022-02-24', 'Non A', '0', 'Indica', 'melagaram', 'melagaram', '2.00247', '2Hrs 20KM', '370', '0', '0', '0', '0', '0', NULL, 0, 200, 200, '170', '', 'Public', 'guhanandhan', '9994242603', '9600778432', '0', 2),
(2061, '2343', 2343, '308', '175272', NULL, '175759', NULL, '', '2022-02-24 20:27:00', '2022-02-25', '2022-02-25 17:01:00', '2022-02-25', 'Non A', '0', 'Xylo', 'Tenkasi', 'thiruvanadhapuram', '69.00342', '16Hrs 480KM', '6540', '272', '7', '91', '4', '32', NULL, 0, 6900, 6900, '3', '', 'Public', 'ganapathy', '9442065333', '9585425570', '0', 2),
(2062, '2351', 2351, '310', '109055', NULL, '109280', NULL, '', '2022-02-25 17:05:00', '2022-02-25', '2022-02-25 17:06:00', '2022-02-25', 'Non A', '0', 'Tavera', 'ilanji', 'thiruvanandhapuram', '38.9036', '8Hrs 220KM', '3160', '0', '5', '65', '0', '0', NULL, 0, 3890, 3890, '', '', 'Public', 'MR', '6379250146', '9944615079', '0', 2),
(2063, '2356', 2356, '260', '129387', NULL, '129408', NULL, '', '2022-02-25 18:02:00', '2022-02-25', '2022-02-25 21:50:00', '2022-02-25', 'Non A', '0', 'Indica', 'melagaram', 'panpoli', '4.61142', '2Hrs 20KM', '370', '107', '1', '10', '1', '47', NULL, 0, 461, 461, '26', '', 'Public', 'VINAYAGAM ', '7904974823', '9500659101', '0', 2),
(2064, '2355', 2355, '246', '242873', NULL, '243003', NULL, '', '2022-02-25 17:14:00', '2022-02-25', '2022-02-25 22:03:00', '2022-02-25', 'Non A', '0', 'Indica', 'elathur', 'Tirunelveli', '14.900', '5Hrs 130KM', '1470', '0', '0', '0', '0', '0', NULL, 0, 1490, 1490, '', '', 'Public', 'aathmanaban', '9659734736', '8438811020', '0', 2),
(2065, '2357', 2357, '254', '164049', NULL, '164165', NULL, '', '2022-02-25 17:29:00', '2022-02-25', '2022-02-26 00:59:00', '2022-02-25', 'Non A', '0', 'Indica', 'melagaram', 'Thenmalai', '16.76249', '5Hrs 110KM', '1270', '98.66666666666667', '6', '60', '2', '28', NULL, 0, 1675.67, 1675, '', '', 'Public', 'guhanandhan', '9994242603', '8903064210', '0', 2),
(2066, '2354', 2354, '230', '195848', NULL, '195964', NULL, '', '2022-02-25 17:08:00', '2022-02-25', '2022-02-26 01:25:00', '2022-02-25', 'Non A', '0', 'Indica', 'tenkasi', 'Tirunelveli', '13.70985', '5Hrs 110KM', '1270', '128', '6', '60', '3', '12', NULL, 0, 1370, 1370, '88', '', 'Public', 'MARISELVAM', '9487148369', '6381666478', '0', 2),
(2067, '2368', 2368, '246', '243004', NULL, '243004', NULL, '', '2022-02-26 03:09:00', '2022-02-25', '2022-02-26 03:11:00', '2022-02-25', 'Non A', '0', 'Indica', 'tenkasi', 'melagaram', '5.50199', 'L-TariffHrs 0KM', '570', 'NaN', '0', '0', 'NaN', '0', NULL, 0, 550, 550, '20', '', 'Public', 'RR ', '9500753063', '8438811020', '0', 2),
(2068, '2366', 2366, '112', '142431', NULL, '142474', NULL, '', '2022-02-26 02:43:00', '2022-02-25', '2022-02-26 03:30:00', '2022-02-25', 'Non A', '0', 'Indica', 'tenkasi', 'Veeranam', '8.000', '4Hrs 40KM', '670', '0', '9', '90', '0', '0', NULL, 0, 800, 800, '', '', 'Public', 'MR', '9477689946', '9600778432', '0', 2),
(2069, '2359', 2359, '260', '129417', NULL, '129573', NULL, '', '2022-02-25 21:52:00', '2022-02-26', '2022-02-26 16:53:00', '2022-02-26', 'Non A', '0', 'Indica', 'Senkottai', 'Tirunelveli', '19.0159', '6Hrs 150KM', '1670', '520.6666666666666', '6', '60', '13', '1', NULL, 0, 1900.67, 1900, '350', '', 'Public', 'MR', '9486378940', '9500659101', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(2206, '2325', 2325, '260', '130794', NULL, '131016', NULL, '', '2022-03-09 18:45:00', '2022-03-09', '2022-03-10 02:38:00', '2022-03-09', 'Non A', '0', 'Indica', 'Tenkasi', 'Kalakad ', '27.050', '8Hrs 220KM', '2370', '0', '2', '20', '0', '0', NULL, 0, 2705, 2705, '', '', 'Public', 'sundarajan ', '9094532917', '9500659101', '0', 2),
(2207, '2543', 2543, '315', '181684', NULL, '181719', NULL, '', '2022-03-10 00:37:00', '2022-03-10', '2022-03-10 15:25:00', '2022-03-10', 'Non A', '0', 'Indica', 'Tenkasi', 'kadayanallur', '5.6571', '3Hrs 30KM', '470', '707', '5', '50', '11', '47', NULL, 0, 565, 565, '662', '', 'Public', 'RAMRAJ', '9345970314', '9080770663', '0', 2),
(2208, '2546', 2546, '225', '258122', NULL, '258254', NULL, '', '2022-03-10 18:21:00', '2022-03-10', '2022-03-10 20:56:00', '2022-03-10', 'Non A', '0', 'Indica', 'melagaram', 'Tirunelveli', '16.1010', '5Hrs 130KM', '1470', '0', '2', '20', '0', '0', NULL, 0, 1610, 1610, '', '', 'Public', 'MR', '9940091153', '8681943094', '0', 2),
(2209, '2539', 2539, '246', '244705', NULL, '244821', NULL, '', '2022-03-10 18:22:00', '2022-03-10', '2022-03-10 20:58:00', '2022-03-10', 'Non A', '0', 'Indica', 'Tenkasi', 'Puliyarai', '14.6632', '5Hrs 110KM', '1270', '0', '6', '60', '0', '0', NULL, 0, 1466, 1466, '', '', 'Public', 'rajappan', '9715128813', '8438811020', '0', 2),
(2210, '2542', 2542, '310', '111944', NULL, '112072', NULL, '', '2022-03-10 18:22:00', '2022-03-10', '2022-03-10 21:48:00', '2022-03-10', 'A/C', '0', 'Tavera', 'ilanji', 'papanasam', '23.370', '5Hrs 120KM', '1980', '0', '8', '112', '0', '0', NULL, 0, 2337, 2337, '5', '', 'Public', 'MR', '9445022198', '9944615079', '0', 2),
(2211, '2557', 2557, '112', '144729', NULL, '144749', NULL, '', '2022-03-10 23:22:00', '2022-03-10', '2022-03-10 23:37:00', '2022-03-10', 'Non A', '0', 'Indica', 'melagaram', 'tenkasi', '1.500', '2Hrs 20KM', '370', '0', '0', '0', '0', '0', NULL, 0, 150, 150, '220', '', 'Public', 'MR', '8778409935', '9600778432', '0', 2),
(2212, '2538', 2538, '258', '139840', NULL, '140043', NULL, '', '2022-03-10 18:22:00', '2022-03-10', '2022-03-10 23:49:00', '2022-03-10', 'Non A', '0', 'Indica', 'Tenkasi', 'thiruvanandhapuram', '28.000', '7Hrs 200KM', '2170', '0', '3', '30', '0', '0', NULL, 0, 2800, 2800, '', '', 'Public', 'MR', '9942874444', '9677916977', '0', 2),
(2213, '2547', 2547, '238', '189484', NULL, '189684', NULL, '', '2022-03-10 18:23:00', '2022-03-10', '2022-03-11 01:01:00', '2022-03-10', 'Non A', '0', 'Indica', 'cuttralam', 'Srivilliputhur', '25.5027', '7Hrs 200KM', '2170', '0', '0', '0', '0', '0', NULL, 0, 2550, 2550, '', '', 'Public', 'sundarajan ', '9094532917', '8870871169', '0', 2),
(2214, '2544', 2544, '221', '149599', NULL, '149599', NULL, '', '2022-03-10 18:24:00', '2022-03-10', '2022-03-11 02:16:00', '2022-03-10', 'Non A', '0', 'Indica', 'tenkasi', 'Tirunelveli', '20.901030', 'L-TariffHrs 0KM', '1570', 'NaN', '8', '80', 'NaN', '14', NULL, 0, 2090.33, 2090, '', '', 'Public', 'MARISELVAM', '9487148369', '7010822940', '0', 2),
(2215, '2555', 2555, '315', '181744', NULL, '181983', NULL, '', '2022-03-10 18:55:00', '2022-03-10', '2022-03-11 03:21:00', '2022-03-10', 'Non A', '0', 'Indica', 'Tenkasi', 'Sattur', '27.500', '8Hrs 230KM', '2470', '16', '9', '90', '0', '24', NULL, 0, 2750, 2750, '', '', 'Public', 'MR', '8637484340', '9080770663', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(2351, '2710', 2710, '223', '201905', NULL, '202039', NULL, '', '2022-03-21 19:33:00', '2022-03-21', '2022-03-21 20:09:00', '2022-03-21', 'Non A', '0', 'Indica', 'tenkasi', 'Tirunelveli', '15.7734', '5Hrs 130KM', '1470', '0', '4', '40', '0', '0', NULL, 0, 1577, 1577, '', '', 'Public', 'p s rajan', '9443234063', '6383742273', '0', 2),
(2352, '2707', 2707, '258', '141999', NULL, '142036', NULL, '', '2022-03-21 19:32:00', '2022-03-21', '2022-03-21 20:12:00', '2022-03-21', 'Non A', '0', 'Indica', 'ilathur', 'Tenkasi', '5.7084', '3Hrs 30KM', '470', '0', '7', '70', '0', '0', NULL, 0, 570, 570, '', '', 'Public', 'MR', '9944758507', '9677916977', '0', 2),
(2353, '2654', 2654, '104', '175581', NULL, '175825', NULL, '', '2022-03-21 19:22:00', '2022-03-21', '2022-03-21 20:25:00', '2022-03-21', 'Non A', '0', 'Indica', 'tenkasi', 'tiruvanandhapuram', '31.650', '8Hrs 240KM', '2570', '0', '4', '40', '0', '0', NULL, 0, 3165, 3165, '', '', 'Public', 'MR', '6382785154', '9043389982', '0', 2),
(2354, '2709', 2709, '207', '143519', NULL, '143665', NULL, '', '2022-03-21 19:32:00', '2022-03-21', '2022-03-21 22:43:00', '2022-03-21', 'Non A', '0', 'Indica', 'tenkasi', 'Tirunelveli', '18.76433', '5Hrs 140KM', '1570', '0', '6', '60', '0', '0', NULL, 0, 1876, 1876, '', '', 'Public', 'ganapathy', '9442065333', '9597015898', '0', 2),
(2355, '2717', 2717, '258', '142037', NULL, '142099', NULL, '', '2022-03-21 22:48:00', '2022-03-21', '2022-03-21 23:45:00', '2022-03-21', 'Non A', '0', 'Indica', 'tenkasi', 'puliyankudi', '8.000', '4Hrs 60KM', '770', '0', '2', '20', '0', '0', NULL, 0, 800, 800, '', '', 'Public', 'MR', '9788263536', '9677916977', '0', 2),
(2356, '2711', 2711, '112', '146258', NULL, '146492', NULL, '', '2022-03-21 19:32:00', '2022-03-21', '2022-03-22 02:05:00', '2022-03-21', 'Non A', '0', 'Indica', 'melagaram', 'Kovilpatti', '26.000', '8Hrs 230KM', '2470', '0', '4', '40', '0', '0', NULL, 0, 2600, 2600, '', '', 'Public', 'somu home', '9994371216', '9600778432', '0', 2),
(2357, '2703', 2703, '225', '259427', NULL, '259558', NULL, '', '2022-03-21 19:22:00', '2022-03-21', '2022-03-22 02:07:00', '2022-03-21', 'Non A', '0', 'Indica', 'melagaram', 'Tirunelveli', '19.4586', '5Hrs 130KM', '1470', '69.33333333333333', '1', '10', '1', '44', NULL, 0, 1945.33, 1945, '', '', 'Public', 'SENTHIL ', '9535204947', '8681943094', '0', 2),
(2358, '2715', 2715, '260', '132772', NULL, '132810', NULL, '', '2022-03-21 21:02:00', '2022-03-21', '2022-03-22 03:57:00', '2022-03-21', 'Non A', '0', 'Indica', 'Tenkasi', 'kadayanallur', '7.5864', '3Hrs 30KM', '470', '234', '8', '80', '3', '54', NULL, 0, 758, 758, '26', '', 'Public', 'popular medical', '8778747281', '9500659101', '0', 2),
(2359, '2720', 2720, '223', '202035', NULL, '202076', NULL, '', '2022-03-22 01:32:00', '2022-03-21', '2022-03-22 03:58:00', '2022-03-21', 'Non A', '0', 'Indica', 'melagaram', 'thirumalaikovil', '5.507', '4Hrs 40KM', '570', '0', '1', '10', '0', '0', NULL, 0, 550, 550, '30', '', 'Public', 'duraisamy', '7904252402', '6383742273', '0', 2),
(2360, '2706', 2706, '221', '150770', NULL, '151030', NULL, '', '2022-03-21 19:23:00', '2022-03-21', '2022-03-22 04:00:00', '2022-03-21', 'Non A', '0', 'Indica', 'melagaram', 'Virudhunagar', '30.40149', '9Hrs 260KM', '2770', '0', '0', '0', '0', '0', NULL, 0, 3040, 3040, '', '', 'Public', 'SIVAKUMAR', '9442061823', '7010822940', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(2496, '2872', 2872, '308', '179598', NULL, '179670', NULL, '', '2022-04-04 18:09:00', '2022-04-04', '2022-04-04 23:20:00', '2022-04-04', 'Non A', '0', 'Indica', 'Tenkasi', 'Papanasam', '13.0040', '4Hrs 70KM', '870', '58.33333333333333', '2', '20', '1', '10', NULL, 0, 1300.33, 1300, '', '', 'Public', 'muthu master ', '6383622870', '9585425570', '0', 2),
(2497, '2874', 2874, '238', '190709', NULL, '190729', NULL, '', '2022-04-04 18:49:00', '2022-04-04', '2022-04-05 00:34:00', '2022-04-04', 'Non A', '0', 'Indica', 'Tenkasi', 'Elathur', '9.7057', '2Hrs 20KM', '370', '224', '0', '0', '3', '44', NULL, 0, 970, 970, '', '', 'Public', 'ESAKKIDURAI', '7010571310', '8870871169', '0', 2),
(2498, '2875', 2875, '112', '295174', NULL, '295174', NULL, '', '2022-04-05 01:04:00', '2022-04-04', '2022-04-05 01:05:00', '2022-04-04', 'Non A', '0', 'Indica', 'Tenkasi', 'Tenkasi', '2.000', 'L-TariffHrs 0KM', '370', 'NaN', '0', '0', 'NaN', '0', NULL, 0, 200, 200, '170', '', 'Public', 'MR', '9443373867', '9600778432', '0', 2),
(2499, '2868', 2868, '258', '144035', NULL, '144055', NULL, '', '2022-04-04 02:17:00', '2022-04-04', '2022-04-05 01:07:00', '2022-04-04', 'Non A', '0', 'Indica', 'Tenkasi', 'Idaikal', '4.00101', '2Hrs 20KM', '370', '1248', '0', '0', '20', '48', NULL, 0, 400, 400, '1218', '', 'Public', 'RAMRAJ', '9345970314', '9677916977', '0', 2),
(2500, '2860', 2860, '221', '152996', NULL, '153217', NULL, '', '2022-04-04 17:32:00', '2022-04-04', '2022-04-05 01:32:00', '2022-04-04', 'Non A', '0', 'Indica', 'Tenkasi', 'thiruvanandhapuram', '31.00210', '8Hrs 220KM', '2370', '180', '1', '10', '4', '30', NULL, 0, 3100, 3100, '', '', 'Public', 'amarnath', '8778537962', '7010822940', '0', 2),
(2501, '2873', 2873, '102', '295095', NULL, '295249', NULL, '', '2022-04-04 18:34:00', '2022-04-04', '2022-04-05 02:48:00', '2022-04-04', 'Non A', '0', 'Indica', 'Sundarapandiapuram', 'Tirunelveli', '17.1035', '6Hrs 150KM', '1670', '89.33333333333333', '4', '40', '2', '14', NULL, 0, 1710.33, 1710, '89', '', 'Public', 'rajesh spp', '6383496337', '9500459428', '0', 2),
(2502, '2878', 2878, '238', '190730', NULL, '190730', NULL, '', '2022-04-05 17:03:00', '2022-04-05', '2022-04-05 17:07:00', '2022-04-05', 'Non A', '0', 'Indica', 'Tirunelveli', 'sokkampatti', '21.000', 'L-TariffHrs 0KM', '2070', 'NaN', '4', '40', 'NaN', '2', NULL, 0, 2100, 2100, '10', '', 'Public', 'syed ali', '9344034417', '8870871169', '0', 2),
(2503, '2882', 2882, '230', '202650', NULL, '202740', NULL, '', '2022-04-05 17:28:00', '2022-04-05', '2022-04-05 18:55:00', '2022-04-05', 'Non A', '0', 'Indica', 's kovil', 'Tenkasi', '11.6012', '4Hrs 90KM', '1070', '0', '0', '0', '0', '0', NULL, 0, 1160, 1160, '', '', 'Public', 'MR', '8637641706', '6381666478', '0', 2),
(2504, '2883', 2883, '315', '185223', NULL, '185246', NULL, '', '2022-04-05 19:16:00', '2022-04-05', '2022-04-05 20:09:00', '2022-04-05', 'Non A', '0', 'Indica', 'melagaram', 'chathram', '4.2030', '2Hrs 20KM', '370', '0', '3', '30', '0', '0', NULL, 0, 420, 420, '', '', 'Public', 'subramanian', '9382338833', '9080770663', '0', 2),
(2505, '2881', 2881, '260', '134701', NULL, '134794', NULL, '', '2022-04-05 18:21:00', '2022-04-05', '2022-04-05 20:54:00', '2022-04-05', 'Non A', '0', 'Indica', 'Tenkasi', 'Vagaikulam', '11.2053', '4Hrs 90KM', '1070', '0', '3', '30', '0', '0', NULL, 0, 1120, 1120, '', '', 'Public', 'muthu master ', '6383622870', '9500659101', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(2641, '3022', 3022, '225', '262403', NULL, '262670', NULL, '', '2022-04-17 21:34:00', '2022-04-18', '2022-04-19 00:18:00', '2022-04-18', 'Non A', '0', 'Etios', 'melagaram', 'thiruvanandhapuram', '46.0053', '9Hrs 260KM', '3050', '883.3333333333334', '7', '77', '17', '40', NULL, 0, 4600.33, 4600, '', '', 'Public', 'baskar', '7708848112', '8681943094', '0', 2),
(2642, '3048', 3048, '312', '181466', NULL, '181542', NULL, '', '2022-04-19 00:14:00', '2022-04-19', '2022-04-19 16:05:00', '2022-04-19', 'Non A', '0', 'Tavera', 'Tenkasi', 'Uthumalai', '14.00113', '4Hrs 70KM', '1210', '828.3333333333334', '6', '78', '11', '50', NULL, 0, 1400.33, 1400, '716', '', 'Public', 'MR', '9944758507', '8850186664', '0', 2),
(2643, '3046', 3046, '308', '182049', NULL, '182264', NULL, '', '2022-04-18 16:37:00', '2022-04-19', '2022-04-19 17:11:00', '2022-04-19', 'Non A', '1', 'Indica', 'cuttralam', 'Tirunelveli', '38.4581', '14Hrs 430KM', '4470', '421.3333333333333', '0', '0', '10', '32', NULL, 0, 3845.33, 3845, '1046', '', 'Public', 'MR', '9789045069', '9585425570', '0', 2),
(2644, '3053', 3053, '315', '186719', NULL, '186879', NULL, '', '2022-04-19 23:40:00', '2022-04-19', '2022-04-20 02:12:00', '2022-04-19', 'Non A', '0', 'Indica', 'Rajapalayam', 'Tenkasi', '17.90371', '6Hrs 160KM', '1770', '0', '0', '0', '0', '0', NULL, 0, 1790, 1790, '', '', 'Public', 'RAMASWAMY ', '8778557641', '9080770663', '0', 2),
(2645, '3049', 3049, '212', '74858', NULL, '74984', NULL, '', '2022-04-19 16:01:00', '2022-04-19', '2022-04-20 02:14:00', '2022-04-19', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '16.0016', '5Hrs 120KM', '1510', '0', '6', '66', '0', '0', NULL, 0, 1600, 1600, '', '', 'Public', 'MR', '9751664035', '9677694239', '0', 2),
(2646, '3056', 3056, '207', '148022', NULL, '148133', NULL, '', '2022-04-20 21:48:00', '2022-04-21', '2022-04-21 17:39:00', '2022-04-21', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '14.420', '5Hrs 110KM', '1400', '740.8333333333334', '1', '11', '14', '49', NULL, 0, 1441.83, 1441, '710', '', 'Public', 'MR', '9566751283', '9597015898', '0', 2),
(2647, '3055', 3055, '310', '119662', NULL, '119927', NULL, '', '2022-04-20 19:52:00', '2022-04-21', '2022-04-21 17:40:00', '2022-04-21', 'Non A', '0', 'Xylo', 'kudiuruppu', 'Kanniyakumari', '39.86490', '9Hrs 260KM', '3680', '767', '5', '65', '12', '47', NULL, 0, 3986, 3986, '526', '', 'Public', 'Sobiya ', '7373854568', '9944615079', '0', 2),
(2648, '3060', 3060, '112', '295454', NULL, '295606', NULL, '', '2022-04-21 17:16:00', '2022-04-21', '2022-04-21 22:07:00', '2022-04-21', 'Non A', '0', 'Indica', 'Tenkasi', 'Tirunelveli', '17.780', '6Hrs 150KM', '1670', '0', '2', '20', '0', '0', NULL, 0, 1778, 1778, '', '', 'Public', 'MR', '8667362274', '9600778432', '0', 2),
(2649, '3054', 3054, '230', '204822', NULL, '204949', NULL, '', '2022-04-21 16:15:00', '2022-04-21', '2022-04-22 03:52:00', '2022-04-21', 'Non A', '0', 'Indica', 'melagaram', 'Tirunelveli', '18.10373', '5Hrs 120KM', '1370', '280', '7', '70', '7', '0', NULL, 0, 1810, 1810, '', '', 'Public', 'SOMU', '8838130102', '6381666478', '0', 2),
(2650, '3059', 3059, '104', '180869', NULL, '181007', NULL, '', '2022-04-21 16:15:00', '2022-04-21', '2022-04-22 03:57:00', '2022-04-21', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '17.0060', '5Hrs 130KM', '1620', '334.1666666666667', '8', '88', '6', '41', NULL, 0, 1700.17, 1700, '342', '', 'Public', 'rengaraj', '9865055244', '9043389982', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(2787, '3233', 3233, '310', '120592', NULL, '120619', NULL, '', '2022-05-07 16:53:00', '2022-05-07', '2022-05-07 19:27:00', '2022-05-07', 'Non A', '0', 'Xylo', 'Tenkasi', 'Vallam', '7.83302', '2Hrs 20KM', '560', '42.666666666666664', '7', '91', '0', '32', NULL, 0, 782.67, 782, '', '', 'Public', 'kirushna moorthi', '9488693739', '9944615079', '0', 2),
(2788, '3237', 3237, '262', '168070', NULL, '168075', NULL, '', '2022-05-07 18:29:00', '2022-05-07', '2022-05-07 19:45:00', '2022-05-07', 'Non A', '0', 'Indica', 'Tenkasi', 'Tenkasi', '3.000', 'L-TariffHrs 0KM', '370', 'NaN', '0', '0', 'NaN', '16', NULL, 0, 300, 300, '70', '', 'Public', 'abi ', '7904273789', '9500810010', '0', 2),
(2789, '3235', 3235, '260', '138478', NULL, '138508', NULL, '', '2022-05-07 16:54:00', '2022-05-07', '2022-05-07 21:03:00', '2022-05-07', 'Non A', '0', 'Swift', 'Kizrha Puliyu', 'cuttralam', '7.00661', '3Hrs 30KM', '520', '161', '0', '0', '2', '18', NULL, 0, 700, 700, '', '', 'Public', 'PRINCE ', '7397451996', '9500659101', '0', 2),
(2790, '3244', 3244, '258', '149748', NULL, '149778', NULL, '', '2022-05-07 21:52:00', '2022-05-07', '2022-05-07 23:06:00', '2022-05-07', 'Non A', '0', 'Swift', 'Tenkasi', 'Kilankadu', '5.200', '3Hrs 30KM', '520', '0', '0', '0', '0', '0', NULL, 0, 520, 520, '', '', 'Public', 'paulraj', '9080493509', '9677916977', '0', 2),
(2791, '3232', 3232, '230', '208222', NULL, '208363', NULL, '', '2022-05-07 16:58:00', '2022-05-07', '2022-05-08 00:50:00', '2022-05-07', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '19.5721', '5Hrs 140KM', '1730', '115.83333333333333', '1', '11', '2', '19', NULL, 0, 1956.83, 1956, '', '', 'Public', 'MR', '9486289112', '6381666478', '0', 2),
(2792, '3239', 3239, '262', '168077', NULL, '168209', NULL, '', '2022-05-07 20:59:00', '2022-05-07', '2022-05-08 00:56:00', '2022-05-07', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '16.6718', '5Hrs 130KM', '1620', '0', '2', '22', '0', '0', NULL, 0, 1667, 1667, '', '', 'Public', 'paul', '7904096570', '9500810010', '0', 2),
(2793, '3238', 3238, '308', '184071', NULL, '184521', NULL, '', '2022-05-07 18:32:00', '2022-05-07', '2022-05-08 01:24:00', '2022-05-07', 'Non A', '0', 'Tavera', 'pavoorchatram', 'ernakulam', '75.000', '15Hrs 450KM', '6150', '0', '0', '0', '0', '0', NULL, 0, 7500, 7500, '', '', 'Public', 'RAMESH', '7402162919', '9585425570', '0', 2),
(2794, '3245', 3245, '258', '149779', NULL, '149802', NULL, '', '2022-05-08 00:32:00', '2022-05-07', '2022-05-08 02:22:00', '2022-05-07', 'Non A', '0', 'Swift', 'melagaram ', 'pavoorchatram', '4.5034', '2Hrs 20KM', '410', '0', '3', '33', '0', '0', NULL, 0, 450, 450, '', '', 'Public', 'subramanian', '9382338833', '9677916977', '0', 2),
(2795, '3204', 3204, '260', '138509', NULL, '138685', NULL, '', '2022-05-08 00:33:00', '2022-05-08', '2022-05-08 19:21:00', '2022-05-08', 'Non A', '0', 'Swift', 'Tenkasi', 'Kovilpatti', '29.37525', '6Hrs 170KM', '2060', '691.6666666666666', '6', '66', '13', '50', NULL, 0, 2936.67, 2936, '', '', 'Public', 'ganapathy', '9442065333', '9500659101', '0', 2),
(2796, '3252', 3252, '262', '168210', NULL, '168241', NULL, '', '2022-05-08 18:39:00', '2022-05-08', '2022-05-08 20:37:00', '2022-05-08', 'Non A', '0', 'Swift', 'melagaram', 'tirumalaikovil', '5.62115', '3Hrs 30KM', '520', '0', '1', '11', '0', '0', NULL, 0, 562, 562, '', '', 'Public', 'RAMRAJ', '9345970314', '9500810010', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(2933, '3428', 3428, '104', '184618', NULL, '184728', NULL, '', '2022-05-21 20:59:00', '2022-05-21', '2022-05-22 01:54:00', '2022-05-21', 'Non A', '0', 'Swift', 'Tenkasi', 'tenmalai', '19.101186', '5Hrs 110KM', '1400', '0', '0', '0', '0', '0', NULL, 0, 1910, 1910, '', '', 'Public', 'MARISELVAM', '9487148369', '9043389982', '0', 2),
(2934, '3414', 3414, '262', '170970', NULL, '171097', NULL, '', '2022-05-21 15:42:00', '2022-05-21', '2022-05-22 02:45:00', '2022-05-21', 'Non A', '0', 'Swift', 'Tenkasi', 'Tirunelveli', '19.3719', '5Hrs 120KM', '1510', '300', '7', '77', '6', '0', NULL, 0, 1937, 1937, '', '', 'Public', 'murugan', '8667351339', '9500810010', '0', 2),
(2935, '3401', 3401, '308', '186185', NULL, '186230', NULL, '', '2022-05-21 23:03:00', '2022-05-21', '2022-05-22 02:47:00', '2022-05-21', 'Non A', '0', 'Tavera', 'minnagar', 'kadayam', '9.75134', '4Hrs 40KM', '820', '0', '5', '65', '0', '0', NULL, 0, 975, 975, '', '', 'Public', 'justin harris', '7259013942', '9585425570', '0', 2),
(2936, '3429', 3429, '112', '297205', NULL, '297255', NULL, '', '2022-05-21 23:07:00', '2022-05-21', '2022-05-22 02:48:00', '2022-05-21', 'Non A', '0', 'Indica', 'Tenkasi', 'Aryankavu ', '6.855', '4Hrs 50KM', '670', '0', '0', '0', '0', '0', NULL, 0, 685, 685, '', '', 'Public', 'gnanam', '9790415134', '9600778432', '0', 2),
(2937, '3423', 3423, '315', '192068', NULL, '192153', NULL, '', '2022-05-21 21:53:00', '2022-05-21', '2022-05-22 04:29:00', '2022-05-21', 'Non A', '0', 'Swift', 'Tenkasi', 'Veerasigamani', '12.50230', '4Hrs 80KM', '1070', '155', '5', '55', '2', '35', NULL, 0, 1250, 1250, '30', '', 'Public', 'indra ', '6379256141', '9080770663', '0', 2),
(2938, '3430', 3430, '238', '193259', NULL, '193259', NULL, '', '2022-05-21 22:43:00', '2022-05-21', '2022-05-22 04:42:00', '2022-05-21', 'Non A', '0', 'Swift', 'minnagar', 'Tirunelveli', '17.0020', 'L-TariffHrs 0KM', '1620', 'NaN', '4', '44', 'NaN', '11', NULL, 0, 1700.17, 1700, '23', '', 'Public', 'siva ', '8838362929', '8870871169', '0', 2),
(2939, '3435', 3435, '310', '123035', NULL, '123123', NULL, '', '2022-05-22 17:05:00', '2022-05-22', '2022-05-22 18:43:00', '2022-05-22', 'Non A', '0', 'Xylo', 'pavoorchathram', 'Papanasam', '17.42210', '4Hrs 80KM', '1340', '247.33333333333334', '8', '104', '3', '32', NULL, 0, 1742.33, 1742, '', '', 'Public', 'SANKAR ', '9944749846', '9944615079', '0', 2),
(2940, '3440', 3440, '308', '186238', NULL, '186280', NULL, '', '2022-05-22 17:59:00', '2022-05-22', '2022-05-22 20:19:00', '2022-05-22', 'Non A', '0', 'Tavera', 'Nannaram', 'Aryankavu ', '8.8829', '4Hrs 40KM', '820', '0', '2', '26', '0', '0', NULL, 0, 888, 888, '', '', 'Public', 'sathishkumar', '9443646770', '9585425570', '0', 2),
(2941, '3441', 3441, '315', '192154', NULL, '192169', NULL, '', '2022-05-22 19:19:00', '2022-05-22', '2022-05-22 21:09:00', '2022-05-22', 'Non A', '0', 'Swift', 'MELAGARAM', 'Elathur', '4.9012', '73Hrs 10KM', '410', '0', '0', '0', '0', '0', NULL, 0, 490, 490, '', '', 'Public', 'MR', '9486964548', '9080770663', '0', 2),
(2942, '3434', 3434, '260', '140427', NULL, '140572', NULL, '', '2022-05-22 17:04:00', '2022-05-22', '2022-05-22 23:18:00', '2022-05-22', 'Non A', '0', 'Swift', 'cuttralam', 'Tirunelveli', '20.3012', '5Hrs 140KM', '1730', '163.33333333333334', '5', '55', '3', '16', NULL, 0, 2030.33, 2030, '', '', 'Public', 'anand', '9360682686', '9500659101', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(3080, '3586', 3586, '260', '142105', NULL, '142213', NULL, '', '2022-06-03 19:16:00', '2022-06-04', '2022-06-04 18:24:00', '2022-06-04', 'Non A', '0', 'Swift', 'tenkasi', 'tirunelveli', '17.310', '5Hrs 100KM', '1290', '905.8333333333334', '8', '88', '18', '7', NULL, 0, 1730.83, 1730, '553', '', 'Public', 'MR', '7502090181', '9500659101', '0', 2),
(3081, '3563', 3563, '310', '124493', NULL, '124718', NULL, '', '2022-06-03 22:23:00', '2022-06-04', '2022-06-04 18:42:00', '2022-06-04', 'Non A', '0', 'Xylo', 'Tenkasi', 'tiruvanandhapuram', '42.5049', '8Hrs 220KM', '3160', '738', '5', '65', '12', '18', NULL, 0, 4250, 4250, '', '', 'Public', 'sakthivel', '8939457318', '9944615079', '0', 2),
(3082, '3587', 3587, '221', '158181', NULL, '158467', NULL, '', '2022-06-03 19:02:00', '2022-06-04', '2022-06-04 18:43:00', '2022-06-04', 'Non A', '0', 'Swift', 'melagaram', 'nagarkovil', '38.31438', '9Hrs 280KM', '3270', '733.3333333333334', '6', '66', '14', '40', NULL, 0, 3831.33, 3831, '238', '', 'Public', 'MANIKKARAJ', '7339448349', '7010822940', '0', 2),
(3083, '3582', 3582, '262', '173375', NULL, '173529', NULL, '', '2022-06-03 18:49:00', '2022-06-04', '2022-06-04 18:47:00', '2022-06-04', 'Non A', '0', 'Swift', 'melagaram', 'Tirunelveli', '21.5511', '6Hrs 150KM', '1840', '896.6666666666666', '4', '44', '17', '56', NULL, 0, 2154.67, 2154, '626', '', 'Public', 'MR', '9600231371', '9500810010', '0', 2),
(3084, '3592', 3592, '238', '194581', NULL, '194581', NULL, '', '2022-06-04 00:52:00', '2022-06-04', '2022-06-04 18:48:00', '2022-06-04', 'Non A', '0', 'Swift', 'tenkasi', 'all falls', '6.900', 'L-TariffHrs 0KM', '410', 'NaN', '6', '66', 'NaN', '55', NULL, 0, 690.17, 690, '900', '', 'Public', 'MR', '7395978598', '8870871169', '0', 2),
(3085, '3595', 3595, '262', '173530', NULL, '173620', NULL, '', '2022-06-04 19:30:00', '2022-06-04', '2022-06-05 01:06:00', '2022-06-04', 'Non A', '0', 'Swift', 'tenkasi', 'pavoorchatram', '14.5018', '4Hrs 90KM', '1180', '95', '0', '0', '1', '35', NULL, 0, 1450, 1450, '', '', 'Public', 'MR', '9952139838', '9500810010', '0', 2),
(3086, '3593', 3593, '308', '188151', NULL, '188206', NULL, '', '2022-06-05 00:57:00', '2022-06-04', '2022-06-05 01:09:00', '2022-06-04', 'Non A', '0', 'Tavera', 'kallidaikurichi', 'tenkasi', '14.750', '4Hrs 50KM', '950', '0', '5', '65', '0', '0', NULL, 0, 1475, 1475, '', '', 'Public', 'MR', '9789192362', '9585425570', '0', 2),
(3087, '3598', 3598, '115', '152117', NULL, '152210', NULL, '', '2022-06-04 19:30:00', '2022-06-04', '2022-06-05 01:10:00', '2022-06-04', 'Non A', '0', 'Indica', 'tenkasi', 'vkpuram', '11.510', '4Hrs 90KM', '1070', '82.5', '3', '30', '1', '39', NULL, 0, 1150.5, 1150, '132', '', 'Public', 'MR', '9442538109', '9600778432', '0', 2),
(3088, '3596', 3596, '315', '194950', NULL, '195050', NULL, '', '2022-06-05 01:11:00', '2022-06-04', '2022-06-05 01:12:00', '2022-06-04', 'Non A', '0', 'Swift', 'tenkasi', 'palaruvi', '15.500', '5Hrs 100KM', '1290', '0', '0', '0', '0', '0', NULL, 0, 1550, 1550, '', '', 'Public', 'MR', '9884642118', '9080770663', '0', 2),
(3089, '3607', 3607, '315', '195051', NULL, '195100', NULL, '', '2022-06-05 02:20:00', '2022-06-04', '2022-06-05 02:22:00', '2022-06-04', 'Non A', '0', 'Swift', 'cotralam', 'panpozhi', '7.710', '4Hrs 40KM', '630', '0', '9', '99', '0', '0', NULL, 0, 771, 771, '', '', 'Public', 'MR', '9487706876', '9080770663', '0', 2)
;
INSERT INTO `f_closing` (`id`, `b_id`, `bid`, `v_id`, `opening_km`, `op_time`, `closing_km`, `cl_time`, `remarks`, `pickup_time`, `p_date`, `drop_time`, `d_date`, `ac_type`, `t_type`, `v_type`, `picup_place`, `drop_place`, `rwards_point`, `packagename`, `pack_charges`, `waiting_charges`, `ex_km`, `ex_km_charges`, `wait_hrs`, `wait_min`, `total`, `other_charge`, `net_total`, `paid_amount`, `discount`, `dis_reason`, `to_whom`, `customer`, `m_no`, `d_mobile`, `pending`, `user_id`) VALUES
(3226, '3759', 3759, '262', '176511', NULL, '176655', NULL, '', '2022-06-17 18:22:00', '2022-06-17', '2022-06-17 23:08:00', '2022-06-17', 'Non A', '0', 'Swift', 'melagaram ', 'Tirunelveli', '19.5056', '5Hrs 140KM', '1730', '0', '4', '44', '0', '0', NULL, 0, 1950, 1950, '', '', 'Public', 'danyarulsing', '9092463322', '9500810010', '0', 2),
(3227, '3760', 3760, '222', '69733', NULL, '69883', NULL, '', '2022-06-17 23:53:00', '2022-06-17', '2022-06-17 23:54:00', '2022-06-17', 'Non A', '0', 'Swift', 'tenaksi', 'Rajapalayam', '18.9017', '6Hrs 150KM', '1840', '0', '0', '0', '0', '0', NULL, 0, 1890, 1890, '', '', 'Public', 'MR', '9789714416', '9500459428', '0', 2),
(3228, '3750', 3750, '258', '156450', NULL, '156682', NULL, '', '2022-06-16 18:31:00', '2022-06-17', '2022-06-18 00:14:00', '2022-06-17', 'Non A', '0', 'Swift', 'Tenkasi', 'thiruvanandhapuram', '44.920', '8Hrs 230KM', '2720', '1085', '2', '22', '21', '42', NULL, 0, 4492, 4492, '', '', 'Public', 'murugan si', '9942449998', '9677916977', '0', 2),
(3229, '3761', 3761, '221', '160170', NULL, '160298', NULL, '', '2022-06-18 03:08:00', '2022-06-18', '2022-06-18 14:52:00', '2022-06-18', 'Non A', '0', 'Etios', 'Tenkasi', 'Tirunelveli', '16.00428', '5Hrs 120KM', '1510', '335', '8', '88', '6', '42', NULL, 0, 1600, 1600, '333', '', 'Public', 'GANESHAN ', '9486615708', '7010822940', '0', 2),
(3230, '3762', 3762, '260', '143600', NULL, '144246', NULL, '', '2022-06-17 18:23:00', '2022-06-18', '2022-06-18 14:56:00', '2022-06-18', 'Non A', '0', 'Xcent', 'Tenkasi', 'Namakkal', '79.00351', '22Hrs 640KM', '7230', '0', '6', '66', '0', '0', NULL, 0, 7900, 7900, '', '', 'Public', 'renuka', '9677421319', '9500659101', '0', 2),
(3231, '3768', 3768, '308', '190896', NULL, '190966', NULL, '', '2022-06-18 00:13:00', '2022-06-18', '2022-06-18 15:11:00', '2022-06-18', 'Non A', '0', 'Tavera', 'Kadapogathi', 'Veerasigamani', '12.01104', '4Hrs 70KM', '1210', '766.5', '0', '0', '10', '57', NULL, 0, 1200.5, 1200, '776', '', 'Public', 'chellaiah ', '9159442050', '9585425570', '0', 2),
(3232, '3763', 3763, '238', '196107', NULL, '196326', NULL, '', '2022-06-17 19:37:00', '2022-06-18', '2022-06-18 15:13:00', '2022-06-18', 'Non A', '0', 'Swift', 'Tenkasi', 'Tenkasi', '29.000', '7Hrs 210KM', '2500', '628.3333333333334', '9', '99', '12', '34', NULL, 0, 2900.33, 2900, '327', '', 'Public', 'MR', '9345244684', '8870871169', '0', 2),
(3233, '3765', 3765, '310', '127784', NULL, '128024', NULL, '', '2022-06-17 22:13:00', '2022-06-18', '2022-06-18 15:16:00', '2022-06-18', 'Non A', '0', 'Xylo', 'Tenkasi', 'tiruvanandhapuram', '42.500', '8Hrs 240KM', '3420', '540', '0', '0', '9', '0', NULL, 0, 4250, 4250, '', '', 'Public', 'MR', '9095390578', '9944615079', '0', 2),
(3234, '3767', 3767, '115', '154842', NULL, '154879', NULL, '', '2022-06-18 01:42:00', '2022-06-18', '2022-06-18 15:18:00', '2022-06-18', 'Non A', '0', 'Swift', 'melagaram', 'kadayanallur', '5.4135', '3Hrs 30KM', '520', '740.8333333333334', '7', '77', '10', '35', NULL, 0, 540.83, 540, '797', '', 'Public', 'MR', '9442528449', '9600778432', '0', 2),
(3235, '3770', 3770, '315', '195762', NULL, '195839', NULL, '', '2022-06-18 18:36:00', '2022-06-18', '2022-06-18 18:37:00', '2022-06-18', 'Non A', '0', 'Swift', 'melagaram', 'Papanasam', '10.67608', '4Hrs 70KM', '960', '0', '7', '77', '0', '0', NULL, 0, 1067, 1067, '', '', 'Public', 'gomathi diffen ', '8778406386', '9080770663', '0', 2)
;

-- --------------------------------------------------------

--
-- Table structure for table `f_cus_master`
--

CREATE TABLE `f_cus_master` (
  `id` int(11) NOT NULL,
  `c_name` varchar(55) DEFAULT NULL,
  `c_no` varchar(12) DEFAULT NULL,
  `c_no1` varchar(12) DEFAULT NULL,
  `c_mail` varchar(55) DEFAULT NULL,
  `c_jdate` timestamp NULL DEFAULT NULL,
  `c_add` varchar(255) DEFAULT NULL,
  `c_remarks` varchar(255) DEFAULT NULL,
  `b_count` varchar(11) DEFAULT NULL,
  `r_point` varchar(11) DEFAULT NULL,
  `r_status` varchar(11) DEFAULT NULL,
  `userby` varchar(55) DEFAULT NULL,
  `e_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `f_enquery_tariff`
--

CREATE TABLE `f_enquery_tariff` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `hrs` varchar(55) DEFAULT NULL,
  `kmeter` float DEFAULT NULL,
  `nonac` float DEFAULT NULL,
  `withac` float DEFAULT NULL,
  `kmnonac` float DEFAULT NULL,
  `kmac` float DEFAULT NULL,
  `belowhun` float DEFAULT NULL,
  `abovehun` float DEFAULT NULL,
  `plus_amt` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `f_enqury_table`
--

CREATE TABLE `f_enqury_table` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `enquery_id` int(11) NOT NULL,
  `e_id` varchar(55) NOT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `b_date` date NOT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `to_whom` varchar(55) DEFAULT NULL,
  `a_no` varchar(55) DEFAULT NULL,
  `cus_count` varchar(55) NOT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `r_status` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `st` varchar(255) DEFAULT NULL,
  `t_type` varchar(10) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(55) DEFAULT NULL,
  `b_type` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `b_now` varchar(10) DEFAULT NULL,
  `q` varchar(55) NOT NULL,
  `v_types` varchar(55) NOT NULL,
  `v_no` varchar(20) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `assign` enum('0','1') NOT NULL DEFAULT '0',
  `enquery` enum('0','1') NOT NULL DEFAULT '0',
  `booking_status` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `f_ft_booking`
--

CREATE TABLE `f_ft_booking` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `e_id` varchar(55) NOT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `b_date` date NOT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `to_whom` varchar(55) DEFAULT NULL,
  `a_no` varchar(55) DEFAULT NULL,
  `cus_count` varchar(55) NOT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `r_status` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `st` varchar(255) DEFAULT NULL,
  `t_type` varchar(10) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(55) DEFAULT NULL,
  `b_type` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `b_now` varchar(10) DEFAULT NULL,
  `q` varchar(55) NOT NULL,
  `v_types` varchar(55) NOT NULL,
  `v_no` varchar(20) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `assign` enum('0','1') NOT NULL DEFAULT '0',
  `booking_status` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_ft_booking`
--

INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(1, 1, '', '2021-06-28 04:19:00', '2021-06-27', 'Nellai', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9524522210', 'Indica', '', '1', 'Jp', '0', 'Current Booking', '', '1', '100', 'Indica', 'TN010000', '9790427773', '1', '0', 1),
(2, 2, '', '2021-06-28 13:07:00', '2021-06-28', 'Tenkasi', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9524522210', 'Indica', '', '1', 'Jp', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 1),
(3, 3, '', '2021-06-28 17:36:00', '2021-06-28', 'Tirunelveli', 'Public', '', '3', 'tenkasi', 'Out Station Tariff', '9003968836', 'Indica', '', '1', 'Mr', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(4, 4, '', '2021-06-28 17:36:00', '2021-06-28', 'Tirunelveli', 'Public', '', '3', 'tenkasi', 'Out Station Tariff', '9003968836', 'Indica', '', '1', 'Mr', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(5, 5, '', '2021-06-28 17:38:00', '2021-06-28', 'Tirunelveli', 'Public', '', '3', 'Tenkasi', 'Out Station Tariff', '9003968836', 'Indica', 'kovill vasal', '1', 'Mr', '0', 'Current Booking', '', '1', '101', 'Indica', 'TN72OX1989', '8608290090', '1', '0', 2),
(6, 6, '', '2021-06-28 20:05:00', '2021-06-28', 'kadayanallut', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9003968836', 'Indica', '', '1', 'Mr', '0', 'Current Booking', '', '0', '', '', '', '', '0', '0', 2),
(7, 7, '', '2021-06-30 18:47:00', '2021-06-30', 'Nellai', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9080454742', 'Indica', '', '1', 'Sugu', '0', 'Current Booking', '', '1', '100', 'Indica', 'TN010000', '9790427773', '1', '0', 1),
(8, 8, '', '2021-06-30 18:51:00', '2021-06-30', 'Tenkasi', 'Public', '', '1', 'Nellai', 'Out Station Tariff', '9080454742', 'Indica', '', '1', 'Sugu', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 1),
(9, 9, '', '2021-06-30 18:52:00', '2021-06-30', 'Madurai', 'Public', '', '1', 'Nellai', 'Out Station Tariff', '9080454742', 'Indica', '', '1', 'Sugu', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 1),
(10, 10, '', '2021-07-01 22:32:00', '2021-07-01', 'TENKASI', 'Public', '', '1', 'PANAYANKURICHI', 'Out Station Tariff', '9842622283', 'Xcent', 'TENKASI', '1', 'SIVAKUMAR', '0', 'Current Booking', 'OK', '1', '232', 'Xcent', '', '', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(193, 193, '', '2021-07-17 21:00:00', '2021-07-17', 'papanasam', 'Public', '', '1', 'KUDIURUPPU ', 'Out Station Tariff', '9986001520', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '204', 'Swift', 'TN72BB6806', '8428916359', '1', '0', 2),
(194, 194, '', '2021-07-17 23:00:00', '2021-07-17', 'TIRUNELVELI', 'Public', '', '1', 'MELAGARAM', 'Out Station Tariff', '6379847503', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '202', 'Swift', 'TN11K1737', '9987862378', '1', '0', 2),
(195, 195, '', '2021-07-17 23:41:00', '2021-07-17', 'Coimbatore', 'Public', '', '1', 'KUDIURUPPU ', 'Out Station Tariff', '6380142627', 'Xcent', 'TENKASI', '1', 'AMBIKA', '0', 'Current Booking', 'OK', '1', '232', 'Xcent', 'TN72AM2245', '8086964712', '0', '1', 2),
(196, 196, '', '2021-07-17 04:20:00', '2021-07-17', 'Coimbatore', 'Public', '', '1', 'KUDIURUPPU ', 'Out Station Tariff', '6380142627', 'Xcent', 'MELAGARAM', '1', 'AMBIKA', '0', 'Current Booking', 'OK', '1', '232', 'Xcent', 'TN72AM2245', '8086964712', '1', '0', 2),
(197, 197, '', '2021-07-18 12:00:00', '2021-07-18', 'Alwarkurichi (TP)', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9003563697', 'Tavera', '', '1', '', '0', 'Current Booking', '', '1', '306', 'Tavera', 'TN03BJ7305', '7977162251', '1', '0', 2),
(198, 198, '', '2021-07-18 15:57:00', '2021-07-18', 'Melagaram (TP)', 'Public', '', '1', 'Tirunelveli', 'Out Station Tariff', '8838130102', 'Swift', '', '1', 'SOMU', '0', 'Current Booking', 'OK', '1', '204', 'Swift', 'TN72BB6806', '8428916359', '1', '0', 2),
(199, 199, '', '2021-07-18 16:23:00', '2021-07-18', 'karaiyar', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9677421319', 'Swift', 'housing bord', '1', 'MRs', '1', 'Current Booking', 'OK', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(200, 200, '', '2021-07-18 17:30:00', '2021-07-18', 'Tiruchendur', 'Public', '', '1', 'Senkottai', 'Out Station Tariff', '9894191247', 'Zest', '', '1', 'SANKAR ', '0', 'Current Booking', '', '1', '104', 'Zest', 'TN07CP7560', '9043389982', '1', '0', 2),
(201, 201, '', '2021-07-18 20:30:00', '2021-07-18', 'Srivilliputhur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9443428520', 'Indica', '', '1', 'MURUGAN ', '0', 'Current Booking', 'OK', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(202, 202, '', '2021-07-19 13:40:00', '2021-07-18', 'TIRUNELVELI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9597492620', 'Indica', 'TENKASI', '1', 'MAHARAJAN ', '0', 'Current Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2)
;AGARAM', 'Out Station Tariff', '9790579308', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(339, 339, '', '2021-08-07 15:00:00', '2021-08-07', 'Tharuvai', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '8124288301', 'Indica', 'TENKASI', '1', 'PARVATHI', '0', 'Current Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(340, 340, '', '2021-08-07 14:00:00', '2021-08-07', 'MADURAI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9715865500', 'Swift', 'TENKASI', '1', 'MOHAMMED ALI ', '0', 'Current Booking', 'OK', '0', '', '', '', '', '0', '1', 2),
(341, 341, '', '2021-08-07 14:00:00', '2021-08-07', 'MADURAI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9715865500', 'Swift', 'TENKASI', '1', 'MOHAMMED ALI ', '0', 'Current Booking', 'OK', '1', '315', 'Swift', 'TN09CH1769', '9080770663', '1', '0', 2),
(342, 342, '', '2021-08-07 19:00:00', '2021-08-07', 'TIRUNELVELI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9791662781', 'Tavera', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '306', 'Tavera', 'TN02BJ7305', '7977162251', '1', '0', 2),
(343, 343, '', '2021-08-07 17:00:00', '2021-08-07', 'TIRUNELVELI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9663216215', 'Xcent', 'TENKASI', '1', 'sivasumbaramian ', '0', 'Current Booking', 'OK', '1', '208', 'Xcent', 'TN72BM2558', '9786649582', '1', '0', 2),
(344, 344, '', '2021-01-07 11:00:00', '2021-01-07', 'Namakkal', 'Public', '', '1', 'KUDIURUPPU ', 'Out Station Tariff', '7373854568', 'Xcent', 'TENKASI', '1', 'Sobiya ', '0', 'Current Booking', 'OK', '0', '', '', '', '', '0', '0', 2),
(345, 345, '', '2021-08-07 17:30:00', '2021-08-07', 'Vasudevanur', 'Public', '', '1', 'TENKASAI', 'Out Station Tariff', '7871598020', 'Indica', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(346, 346, '', '2021-08-07 11:00:00', '2021-08-07', 'NAMAKKAL', 'Public', '', '1', 'KUDIURUPPU ', 'Out Station Tariff', '7373854568', 'Xcent', 'MELAGARAM', '1', 'Sobiya ', '0', 'Current Booking', 'OK', '1', '232', 'Xcent', 'TN72AM2245', '8838967010', '1', '0', 2),
(347, 347, '', '2021-08-07 21:33:00', '2021-08-07', 'Tenkasi (M)', 'Public', '', '1', 'Tenkasi ', 'Out Station Tariff', '9994861757', 'Indica', 'Melagaram', '1', 'MR', '0', 'Current Booking', 'Ok', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(348, 348, '', '2021-08-08 17:00:00', '2021-08-08', 'Thoothukkudi', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '7550132420', 'Zest', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '104', 'Zest', 'TN07CP7560', '9043389982', '1', '0', 2),
(349, 349, '', '2021-08-08 19:30:00', '2021-08-08', 'tirunrlveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '7598119005', 'Indica', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(350, 350, '', '2021-08-08 18:40:00', '2021-08-08', 'tenkasi', 'Public', '', '1', 'cuttralam', 'Out Station Tariff', '9999295627', 'Etios', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '223', 'Etios', 'TN85A4875', '6383742273', '1', '0', 2),
(351, 351, '', '2021-08-08 19:00:00', '2021-08-08', 'CUTTRALAM ', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '8610426138', 'Etios', 'TENKASI', '1', 'selva ', '0', 'Current Booking', 'OK', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(352, 352, '', '2021-08-08 19:30:00', '2021-08-08', 'tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '8489024161', 'Swift', 'TENKASI', '1', 'fathima', '0', 'Current Booking', 'OK', '1', '240', 'Swift', 'TN72BP8991', '6379649008', '1', '0', 2),
(353, 353, '', '2021-08-08 19:30:00', '2021-08-08', 'tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9487148369', 'Swift', 'TENKASI', '1', 'MARISELVAM', '0', 'Current Booking', 'OK', '1', '242', 'Swift', 'TN11AE8883', '9688779152', '1', '0', 2),
(354, 354, '', '2021-08-09 04:00:00', '2021-08-08', 'Rajapayalam ', 'Public', '', '1', 'Tenkasi ', 'Out Station Tariff', '9344397762', 'Indica', 'Melagaram', '1', 'MR', '0', 'Current Booking', 'Ok', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(355, 355, '', '2021-08-09 04:00:00', '2021-08-08', 'Rajapalayam ', 'Public', '', '1', 'Tenkasi ', 'Out Station Tariff', '9344397762', 'Indica', 'Melagaram', '1', 'MR', '0', 'Current Booking', 'Ok', '0', '', '', '', '', '0', '1', 2),
(356, 356, '', '2021-08-09 10:30:00', '2021-08-09', 'tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9750567942', 'Indica', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(357, 357, '', '2021-08-09 14:45:00', '2021-08-09', 'pavoorchathram', 'Public', '', '1', 'TENKASAI', 'Out Station Tariff', '9597686832', 'Etios', 'TENKASI', '0', 'MR', '0', 'Current Booking', 'OK', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(358, 358, '', '2021-08-09 19:30:00', '2021-08-09', 'rajapalayam', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '8778557641', 'Swift', 'TENKASI', '1', 'RAMASWAMY ', '0', 'Current Booking', 'OK', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(359, 359, '', '2021-08-10 13:40:00', '2021-08-10', 'tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '7904518864', 'Indica', 'TENKASI', '1', 'saravanapandian ', '0', 'Current Booking', 'OK', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(360, 360, '', '2021-08-09 19:45:00', '2021-08-09', 'tirunelveli', 'Public', '', '1', 'senkottai', 'Out Station Tariff', '9894191247', 'Etios', 'TENKASI', '1', 'SANKAR ', '0', 'Current Booking', 'OK', '1', '223', 'Etios', 'TN85A4875', '6383742273', '1', '0', 2),
(361, 361, '', '2021-08-10 17:00:00', '2021-08-10', 'Tirunelveli', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9442061998', 'Etios', 'TENKASI', '1', 'nellaiyappan', '0', 'Current Booking', 'OK', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(362, 362, '', '2021-08-10 23:30:00', '2021-08-10', 'tenkasi', 'Public', '', '1', 'kattalaikudiruppu', 'Out Station Tariff', '9688927927', 'Indica', 'TENKASI', '1', 'SUNDAR', '0', 'Current Booking', 'OK', '1', '240', 'Indica', 'TN72BP8991', '6379649008', '1', '0', 2),
(363, 363, '', '2021-08-11 17:00:00', '2021-08-11', 'tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9842116019', 'Indica', 'TENKASI', '1', 'mahalingam ', '0', 'Current Booking', 'OK', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(364, 364, '', '2021-08-11 16:30:00', '2021-08-11', 'tirunelveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '7010855053', 'Indica', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '238', 'Indica', 'TN76AK0049', '8870871169', '1', '0', 2),
(365, 365, '', '2021-08-11 01:36:00', '2021-08-10', 'idaikal', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9489540229', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(366, 366, '', '2021-08-11 17:00:00', '2021-08-11', 'tirunelveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9486103453', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '240', 'Swift', 'TN72BP8991', '6379649008', '1', '0', 2),
(367, 367, '', '2021-08-11 16:00:00', '2021-08-11', 'tirunelveli', 'Public', '', '1', 'pavoorchatram', 'Out Station Tariff', '9842533052', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(368, 368, '', '2021-08-11 16:56:00', '2021-08-11', 'papanasam ', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9891495691', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '202', 'Swift', 'TN11K1737', '9987862378', '1', '0', 2),
(369, 369, '', '2021-08-11 17:00:00', '2021-08-11', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '7305480251', 'Xylo', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '322', 'Xylo', 'TN22DC0375', '8086964712', '1', '0', 2),
(370, 370, '', '2021-08-11 20:30:00', '2021-08-11', 'THOOTHUKUDI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '7339448349', 'Etios', 'TENKASI', '1', 'MANIKKARAJ', '0', 'Current Booking', 'OK', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(371, 371, '', '2021-08-11 20:30:00', '2021-08-11', 'TENKASI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9150392679', 'Indica', 'TENKASI', '1', 'DR JANANI ', '0', 'Current Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(372, 372, '', '2021-08-11 21:15:00', '2021-08-11', 'TIRUNELVELI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9487148369', 'Tavera', 'TENKASI', '1', 'MARISELVAM', '0', 'Current Booking', 'OK', '1', '306', 'Tavera', 'TN02BJ7305', '7977162251', '1', '0', 2),
(373, 373, '', '2021-08-12 13:00:00', '2021-08-12', 'tirunelveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '7904974823', 'Etios', 'TENKASI', '1', 'VINAYAGAM ', '0', 'Current Booking', 'OK', '1', '246', 'Etios', 'TN67BY0952', '7418845990', '1', '0', 2),
(374, 374, '', '2021-08-12 17:00:00', '2021-08-12', 'puliyarai', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9443086869', 'Indica', 'TENKASI', '1', 'SUBRAMANIAN ', '0', 'Current Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(375, 375, '', '2021-08-12 14:00:00', '2021-08-12', 'papanasam ', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9891495691', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '202', 'Swift', 'TN11K1737', '9987862378', '1', '0', 2),
(376, 376, '', '2021-08-12 18:30:00', '2021-08-12', 'tenkasi', 'Public', '', '1', 'KUDIURUPPU ', 'Out Station Tariff', '7339448349', 'Etios', 'TENKASI', '1', 'MANIKKARAJ', '0', 'Current Booking', 'OK', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(377, 377, '', '2021-08-13 13:00:00', '2021-08-13', 'Nazerath (TP)', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9663216215', 'Etios', 'TENKASI', '1', 'sivasumbaramian ', '0', 'Current Booking', 'OK', '1', '315', 'Etios', 'TN09CH1769', '9080770663', '1', '0', 2),
(378, 378, '', '2021-08-20 16:00:00', '2021-08-20', 'Tirunelveli', 'Public', '', '1', 'Ayikudi', 'Out Station Tariff', '9003861156', 'Indica', 'TENKASI', '1', 'MOHAN ', '0', 'Advance Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(379, 379, '', '2021-08-12 22:00:00', '2021-08-12', 'TIREUNELVELI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '7904330817', 'Swift', 'TENKASI', '1', 'PRABU', '0', 'Current Booking', 'OK', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(380, 380, '', '2021-08-13 01:00:00', '2021-08-12', 'MELAGARAM', 'Public', '', '1', 'TIRUNELVELI', 'Out Station Tariff', '7598119005', 'Indica', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(381, 381, '', '2021-08-12 23:15:00', '2021-08-12', 'KADAYAM ', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9698703838', 'Etios', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(382, 382, '', '2021-08-13 15:00:00', '2021-08-13', 'virudhunagar', 'Public', '', '1', 'melagaram ', 'Out Station Tariff', '9442061823', 'Swift', 'TENKASI', '1', 'SIVAKUMAR', '0', 'Current Booking', 'OK', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(383, 383, '', '2021-08-13 17:24:00', '2021-08-13', 'Sundaresapuram RF', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9150392679', 'Indica', 'TENKASI', '1', '', '0', 'Current Booking', 'OK', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2);
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(384, 384, '', '2021-08-13 08:00:00', '2021-08-13', 'ERODE', 'Public', '', '1', 'VALLAM ', 'Out Station Tariff', '9385478223', 'Indica', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(385, 385, '', '2021-08-13 15:00:00', '2021-08-13', 'TIRUNELVELI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '8778557641', 'Swift', 'TENKASI', '1', 'RAMASWAMY ', '0', 'Current Booking', 'OK', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(386, 386, '', '2021-08-13 19:00:00', '2021-08-13', 'rajapalayam', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '7010965913', 'Xcent', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '208', 'Xcent', 'TN72BM2558', '9786649582', '1', '0', 2),
(387, 387, '', '2021-08-13 21:47:00', '2021-08-13', 'TIRUNELVELI', 'Public', '', '1', 'TENKASI', 'Out Station Tariff', '9487148369', 'Tavera', 'TENKASI', '1', 'MARISELVAM', '0', 'Current Booking', 'OK', '1', '306', 'Tavera', 'TN02BJ7305', '7977162251', '1', '0', 2),
(388, 388, '', '2021-08-13 23:00:00', '2021-08-13', 'tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9791473647', 'Swift', 'TENKASI', '1', 'sankar boi', '0', 'Current Booking', 'OK', '1', '240', 'Swift', 'TN72BP8991', '6379649008', '1', '0', 2),
(389, 389, '', '2021-08-14 21:30:00', '2021-08-14', 'Pirancheri', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9790579308', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '104', 'Swift', 'TN07CP7560', '9043389982', '1', '0', 2),
(390, 390, '', '2021-08-14 15:30:00', '2021-08-14', 'Tirunelveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '8838130102', 'Xcent', 'TENKASI', '1', 'SOMU', '0', 'Current Booking', 'OK', '1', '102', 'Xcent', 'TN18X2281', '9500459428', '1', '0', 2),
(391, 391, '', '2021-08-14 15:30:00', '2021-08-14', 'Tirunelveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '8838130102', 'Xcent', 'TENKASI', '1', 'SOMU', '0', 'Current Booking', 'OK', '0', '', '', '', '', '0', '1', 2),
(392, 392, '', '2021-08-14 15:30:00', '2021-08-14', 'Tirunelveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '8838130102', 'Xcent', 'TENKASI', '1', 'SOMU', '0', 'Current Booking', 'OK', '0', '', '', '', '', '0', '1', 2),
(393, 393, '', '2021-08-14 22:00:00', '2021-08-14', 'tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '7397451996', 'Swift', 'TENKASI', '1', 'PRINCE ', '0', 'Current Booking', 'OK', '1', '242', 'Swift', 'TN11AE8883', '9688779152', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(576, 576, '', '2021-09-01 15:00:00', '2021-09-01', 'Alwarkurichi (TP)', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9677421319', 'Indica', 'TENKASI', '1', 'renuka', '0', 'Current Booking', 'OK', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(577, 577, '', '2021-09-01 15:00:00', '2021-09-01', 'Alwarkurichi (TP)', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9677421319', 'Indica', 'TENKASI', '1', 'renuka', '0', 'Current Booking', 'OK', '0', '', '', '', '', '0', '1', 2),
(578, 578, '', '2021-08-31 20:50:00', '2021-08-31', 'veeravanallur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9944838346', 'Swift', 'TENKASI', '1', 'MARIAPPAN', '0', 'Current Booking', 'OK', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(579, 579, '', '2021-08-31 21:04:00', '2021-08-31', 'Tenkasi', 'Public', '', '1', 'Sundarapandiapuram', 'Out Station Tariff', '9994786725', 'Tavera', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '308', 'Tavera', 'TN18L3325', '9585425570', '1', '0', 2),
(580, 580, '', '2021-09-01 00:30:00', '2021-08-31', 'thirumalaikovil', 'Public', '', '1', 'Kadapogathi', 'Out Station Tariff', '8668053788', 'Tavera', 'TENKASI', '1', 'velayutham', '0', 'Current Booking', 'OK', '1', '306', 'Tavera', 'TN02BJ7305', '7977162251', '1', '0', 2),
(581, 581, '', '2021-09-01 17:00:00', '2021-09-01', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8754933436', 'Indica', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '202', 'Indica', 'TN11K1737', '9987862378', '1', '0', 2),
(582, 582, '', '2021-09-01 15:00:00', '2021-09-01', 'Kovilpatti', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9790193912', 'Indica', 'TENKASI', '1', 'shiek', '0', 'Current Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(583, 583, '', '2021-09-01 15:00:00', '2021-09-01', 'Kadayanallur (M)', 'Public', '', '1', 'Ayiraperi', 'Out Station Tariff', '9840496086', 'Tavera', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '306', 'Tavera', 'TN02BJ7305', '7977162251', '1', '0', 2),
(584, 584, '', '2021-09-01 16:19:00', '2021-09-01', 'Pirancheri', 'Public', '', '1', 'Seevanallur', 'Out Station Tariff', '8870717191', 'Xylo', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '324', 'Xylo', 'TN79C1449', '8668013137', '1', '0', 2),
(585, 585, '', '2021-09-01 16:22:00', '2021-09-01', 'surendai', 'Public', '', '1', 'KUDIURUPPU ', 'Out Station Tariff', '9597136861', 'Xcent', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '232', 'Xcent', 'TN72AM2245', '9629797775', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(768, 768, '', '2021-09-16 12:30:00', '2021-09-16', 'Thoothukudi', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '8825802426', 'Swift', 'TENKASI', '1', 'THAMARAIKANIRAJA', '0', 'Current Booking', 'OK', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(769, 769, '', '2021-09-17 16:00:00', '2021-09-17', 'tirunelveli', 'Public', '', '1', 'senkottai', 'Out Station Tariff', '9164264942', 'Swift', 'TENKASI', '1', 'madhu', '0', 'Advance Booking', 'OK', '1', '104', 'Swift', 'TN07CP7560', '9043389982', '1', '0', 2),
(770, 770, '', '2021-09-16 13:00:00', '2021-09-16', 'kadayam', 'Public', '', '1', 'idaikal', 'Out Station Tariff', '6374866881', 'Tavera', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '306', 'Tavera', 'TN02BJ7305', '7977162251', '1', '0', 2),
(771, 771, '', '2021-09-16 02:30:00', '2021-09-15', 'tenkasi', 'Public', '', '1', 'Tirunelveli', 'Out Station Tariff', '7094109066', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '202', 'Swift', 'TN11K1737', '9987862378', '1', '0', 2),
(772, 772, '', '2021-09-16 17:08:00', '2021-09-16', 'Tirunelveli', 'Public', '', '1', 'sivaramapettai', 'Out Station Tariff', '7397661290', 'Xylo', 'TENKASI', '1', 'kumar ktc ', '0', 'Current Booking', 'OK', '1', '324', 'Xylo', 'TN79C1449', '8668013137', '1', '0', 2),
(773, 773, '', '2021-09-17 20:00:00', '2021-09-17', 'trichy', 'Public', '', '1', 'KUDIURUPPU ', 'Out Station Tariff', '8838189637', 'Swift', 'TENKASI', '1', 'bagavathy', '0', 'Advance Booking', 'OK', '1', '223', 'Swift', 'TN85A4875', '6383742273', '1', '0', 2),
(774, 774, '', '2021-09-16 20:28:00', '2021-09-16', 'Kovilpatti', 'Public', '', '1', 'minnagar', 'Out Station Tariff', '7373854568', 'Swift', 'TENKASI', '1', 'Sobiya ', '0', 'Current Booking', 'OK', '1', '202', 'Swift', 'TN11K1737', '9987862378', '1', '0', 2),
(775, 775, '', '2021-09-16 21:53:00', '2021-09-16', 'Tirunelveli', 'Public', '', '1', 'minnagar', 'Out Station Tariff', '9787440656', 'Etios', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '223', 'Etios', 'TN85A4875', '6383742273', '1', '0', 2),
(776, 776, '', '2021-09-16 23:05:00', '2021-09-16', 'ambai', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9786258941', 'Indica', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(777, 777, '', '2021-09-17 10:20:00', '2021-09-16', 'rettiyarpatti', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9500753063', 'Swift', 'TENKASI', '1', 'RR subbaiah', '0', 'Current Booking', '', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(959, 959, '', '2021-10-09 17:27:00', '2021-10-09', 'alwarkurichi', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '8825832526', 'Swift', 'TENKASI', '1', 'mani', '0', 'Current Booking', 'OK', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(960, 960, '', '2021-10-09 18:20:00', '2021-10-09', 'Thoothukudi', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9940676866', 'Tavera', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '308', 'Tavera', 'TN18L3325', '9585425570', '1', '0', 2),
(961, 961, '', '2021-10-10 14:00:00', '2021-10-10', 'tirunelveli', 'Public', '', '1', 'senkottai', 'Out Station Tariff', '9123544514', 'Xylo', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '0', '', '', '', '', '0', '1', 2),
(962, 962, '', '2021-10-09 18:30:00', '2021-10-09', 'Tirunelveli', 'Public', '', '1', 'vallam', 'Out Station Tariff', '8098384846', 'Swift', 'TENKASI', '1', 'ARUNACHALAM', '0', 'Current Booking', 'OK', '1', '315', 'Swift', 'TN09CH1769', '9080770663', '1', '0', 2),
(963, 963, '', '2021-10-09 19:33:00', '2021-10-09', 'cuttralam', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9791159708', 'Indigo', 'TENKASI', '1', 'praveen', '0', 'Current Booking', 'OK', '1', '250', 'Indigo', 'TN19AB9624', '9489290278', '1', '0', 2),
(964, 964, '', '2021-10-09 22:09:00', '2021-10-09', 'melagaram', 'Public', '', '1', 'kalingapatti', 'Out Station Tariff', '8778406386', 'Indica', 'TENKASI', '1', 'gomathi diffen ', '0', 'Current Booking', 'OK', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(965, 965, '', '2021-10-09 23:30:00', '2021-10-09', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9881640815', 'Swift', 'TENKASI', '1', 'abraham', '0', 'Current Booking', 'OK', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(966, 966, '', '2021-10-10 00:09:00', '2021-10-09', 'Vasudevanallur ', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '7395851296', 'Etios', 'TENKASI', '1', 'kamathenu construction', '0', 'Current Booking', 'OK', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(967, 967, '', '2021-10-10 16:00:00', '2021-10-10', 'syedinganallur', 'Public', '', '1', 'ayiraperi', 'Out Station Tariff', '6369040910', 'Swift', 'TENKASI', '1', 'GANESHAN ', '0', 'Current Booking', 'OK', '1', '250', 'Swift', 'TN19AB9624', '9489290278', '1', '0', 2),
(968, 968, '', '2021-10-11 12:45:00', '2021-10-11', 'Tirunelveli', 'Public', '', '1', 'panpoli', 'Out Station Tariff', '9994402855', 'Swift', 'TENKASI', '1', 'hazun kany ', '0', 'Current Booking', 'OK', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(1149, 1149, '', '2021-10-31 19:15:00', '2021-10-31', 'Panpoli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9345970314', 'Indigo', 'tenkasi', '1', 'RAMRAJ', '0', 'Current Booking', 'ok', '1', '250', 'Indigo', 'TN19AB9624', '9489290278', '1', '0', 2),
(1150, 1150, '', '2021-10-31 19:30:00', '2021-10-31', 'Panpoli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9345970314', 'Indica', 'tenkasi', '1', 'RAMRAJ', '0', 'Current Booking', 'ok', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(1151, 1151, '', '2021-10-31 20:05:00', '2021-10-31', 'Sivakasi', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9500595522', 'Indigo', 'tenkasi', '1', 'MR', '0', 'Current Booking', 'ok', '1', '250', 'Indigo', 'TN19AB9624', '9489290278', '1', '0', 2),
(1152, 1152, '', '2021-10-31 08:30:00', '2021-10-31', 'Tirunelveli', 'Public', '', '1', 'kudiuruppu ', 'Out Station Tariff', '8838189637', 'Etios', 'tenkasi', '1', 'bagavathy', '0', 'Current Booking', 'ok', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(1153, 1153, '', '2021-10-31 21:30:00', '2021-10-31', 'uthumalai', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9842770973', 'Indica', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '110', 'Indica', 'TN66V5085', '8667080932', '1', '0', 2),
(1154, 1154, '', '2021-11-01 01:00:00', '2021-10-31', 'Tirunelveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9500177659', 'Tavera', 'TENKASI', '1', 'SANKARALINGAM ', '0', 'Current Booking', 'OK', '1', '306', 'Tavera', 'TN02BJ7305', '7977162251', '1', '0', 2),
(1155, 1155, '', '2021-11-01 13:30:00', '2021-11-01', 'Madurai', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9894318996', 'Swift', 'TENKASI', '1', 'piramumuthu', '0', 'Current Booking', 'OK', '1', '315', 'Swift', 'TN09CH1769', '9080770663', '1', '0', 2),
(1156, 1156, '', '2021-11-01 10:00:00', '2021-11-01', 'thiruvanandhapuram', 'Public', '', '1', 'Keelapuliyur ', 'Out Station Tariff', '9791473647', 'Zest', 'TENKASI', '1', 'sankar boi', '0', 'Current Booking', 'OK', '1', '104', 'Zest', 'TN07CP7560', '9043389982', '1', '0', 2),
(1157, 1157, '', '2021-11-01 15:30:00', '2021-11-01', 'Tirunelveli', 'Public', '', '1', 'Senkottai', 'Out Station Tariff', '9486632570', 'Indica', 'TENKASI', '1', 'chellasamy ', '0', 'Current Booking', 'OK', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2),
(1158, 1158, '', '2021-11-01 17:20:00', '2021-11-01', 'Tirunelveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9442061998', 'Etios', 'TENKASI', '1', 'nellaiyappan', '0', 'Current Booking', 'OK', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(1340, 1340, '', '2021-11-21 16:58:00', '2021-11-21', 'v k puram', 'Public', '', '1', 'keelapuliyur', 'Out Station Tariff', '7397451996', 'Etios', 'TENKASI', '1', 'PRINCE ', '0', 'Current Booking', 'OK', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(1341, 1341, '', '2021-11-21 16:59:00', '2021-11-21', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9597011641', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(1342, 1342, '', '2021-11-21 18:30:00', '2021-11-21', 'Tirunelveli', 'Public', '', '1', 'MELAGARAM', 'Out Station Tariff', '7598119005', 'Zest', 'TENKASI', '1', 'RVS ', '0', 'Current Booking', 'OK', '1', '104', 'Zest', 'TN07CP7560', '9043389982', '1', '0', 2),
(1343, 1343, '', '2021-11-21 18:30:00', '2021-11-21', 'pulankulam', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9443582599', 'Swift', 'TENKASI', '1', 'chithambaram', '0', 'Current Booking', 'OK', '1', '223', 'Swift', 'TN85A4875', '6383742273', '1', '0', 2),
(1344, 1344, '', '2021-11-21 19:15:00', '2021-11-21', 'Ayikudi', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9944279735', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(1345, 1345, '', '2021-11-21 19:15:00', '2021-11-21', 'Ayikudi', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9944279735', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '0', '', '', '', '', '0', '1', 2),
(1346, 1346, '', '2021-11-21 19:33:00', '2021-11-21', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9843112832', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '315', 'Swift', 'TN09CH1769', '9080770663', '1', '0', 2),
(1347, 1347, '', '2021-11-22 18:30:00', '2021-11-22', 'KUDIURUPPU', 'Public', '', '1', 'Madurai', 'Out Station Tariff', '8012428368', 'Xylo', 'TENKASI', '1', 'adithya', '0', 'Current Booking', 'OK', '1', '324', 'Xylo', 'TN79C1449', '8668013137', '1', '0', 2),
(1348, 1348, '', '2021-11-21 21:45:00', '2021-11-21', 'Tirunelveli', 'Public', '', '1', 'Idaikal', 'Out Station Tariff', '9551502319', 'Swift', 'TENKASI', '1', 'MR', '0', 'Current Booking', 'OK', '1', '252', 'Swift', 'TN66AB5185', '9361163069', '1', '0', 2),
(1349, 1349, '', '2021-11-21 23:00:00', '2021-11-21', 'v k puram ', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9952218398', 'Swift', 'TENKASI', '1', 'stalin ', '0', 'Current Booking', 'OK', '1', '223', 'Swift', 'TN85A4875', '6383742273', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(1533, 1533, '', '2021-12-10 21:00:00', '2021-12-10', 'Tenkasi', 'Public', '', '1', 'Melapavoor', 'Out Station Tariff', '9688383999', 'Swift', '', '1', 'vijayakumar', '0', 'Current Booking', 'ok', '0', '', '', '', '', '0', '1', 2),
(1534, 1534, '', '2021-12-10 19:00:00', '2021-12-10', 'Madurai', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9994841099', 'Swift', '', '1', 'murugan', '0', 'Current Booking', 'ok', '1', '254', 'Swift', 'TN11M6995', '8903064210', '1', '0', 2),
(1535, 1535, '', '2021-12-10 19:30:00', '2021-12-10', 'kadayanallur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9715128813', 'Swift', '', '1', 'rajappan', '0', 'Current Booking', 'ok', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(1536, 1536, '', '2021-12-10 20:15:00', '2021-12-10', 'Tenkasi', 'Public', '', '1', 'ilanji', 'Out Station Tariff', '6379250146', 'Swift', '', '1', 'MR', '0', 'Current Booking', 'OK', '1', '256', 'Swift', 'TN76P9668', '9442081303', '1', '0', 2),
(1537, 1537, '', '2021-12-10 23:15:00', '2021-12-10', 'tenkasi', 'Public', '', '1', 'cuttralam', 'Out Station Tariff', '8056902751', 'Indica', '', '1', 'MR', '0', 'Current Booking', 'ok', '1', '238', 'Indica', 'TN76AK0049', '8870871169', '1', '0', 2),
(1538, 1538, '', '2021-12-10 21:00:00', '2021-12-10', 'Tenkasi', 'Public', '', '1', 'Papanasam', 'Out Station Tariff', '9994240664', 'Tavera', '', '1', 'MR', '0', 'Current Booking', 'ok', '1', '306', 'Tavera', 'TN02BJ7305', '7977162251', '1', '0', 2),
(1539, 1539, '', '2021-12-10 21:00:00', '2021-12-10', 'Melapavoor', 'Public', '', '1', 'Idaikal', 'Out Station Tariff', '9688383999', 'Tavera', '', '1', 'vijayakumar', '0', 'Current Booking', 'ok', '1', '308', 'Tavera', 'TN18L3325', '9585425570', '1', '0', 2),
(1540, 1540, '', '2021-12-11 14:00:00', '2021-12-11', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '7845844701', 'Swift', '', '1', 'faruk ', '0', 'Current Booking', 'ok', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(1541, 1541, '', '2021-12-10 23:00:00', '2021-12-10', 'Tirunelveli', 'Public', '', '1', 'Mathalamparai', 'Out Station Tariff', '9987862378', 'Swift', '', '1', 'MR', '0', 'Current Booking', 'ok', '1', '252', 'Swift', 'TN66AB5185', '9361163069', '1', '0', 2),
(1542, 1542, '', '2021-12-11 16:00:00', '2021-12-11', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9842116019', 'Indica', '', '1', 'vallinayagam', '0', 'Current Booking', 'ok', '1', '311', 'Indica', 'TN22DF1526', '9600778432', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(1729, 1729, '', '2021-12-27 21:03:00', '2021-12-27', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9080961439', 'Swift', '', '1', 'karuppaiah', '0', 'Current Booking', 'ok', '1', '252', 'Swift', 'TN66AB5185', '9361163069', '1', '0', 2),
(1730, 1730, '', '2021-12-27 21:15:00', '2021-12-27', 'srivilliputur', 'Public', '', '1', 'Senkottai', 'Out Station Tariff', '9952377601', 'Swift', '', '1', 'MR', '0', 'Current Booking', 'ok', '1', '256', 'Swift', 'TN76P9668', '9442081303', '1', '0', 2),
(1731, 1731, '', '2021-12-27 23:15:00', '2021-12-27', 'nazarath', 'Public', '', '1', 'cuttralam', 'Out Station Tariff', '8870303116', 'Swift', '', '1', 'dixson ', '0', 'Current Booking', 'ok', '1', '221', 'Swift', 'TN05BF9020', '7010822940', '1', '0', 2),
(1732, 1732, '', '2021-12-27 22:30:00', '2021-12-27', 'kadayanallur', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '8838130102', 'Indica', '', '1', 'SOMU', '0', 'Current Booking', 'ok', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(1733, 1733, '', '2021-12-28 15:00:00', '2021-12-28', 'Kanniyakumari', 'Public', '', '1', 'ilanji', 'Out Station Tariff', '9952539932', 'Swift', '', '1', 'ajay', '0', 'Current Booking', 'ok', '1', '252', 'Swift', 'TN66AB5185', '9361163069', '1', '0', 2),
(1734, 1734, '', '2021-12-28 14:30:00', '2021-12-28', 'Tiruchendur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9443870019', 'Swift', '', '1', 'ANGAPPAN', '0', 'Current Booking', 'ok', '1', '104', 'Swift', 'TN07CP7560', '9043389982', '1', '0', 2),
(1735, 1735, '', '2021-12-28 11:00:00', '2021-12-28', 'Tirunelveli', 'Public', '', '1', 'Melapavoor', 'Out Station Tariff', '9952533692', 'Etios', '', '1', 'nagaraj', '0', 'Current Booking', 'ok', '1', '246', 'Etios', 'TN67BY0952', '7418845990', '1', '0', 2),
(1736, 1736, '', '2021-12-28 15:00:00', '2021-12-28', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9715098606', 'Swift', '', '1', 'sridevi', '0', 'Current Booking', 'ok', '1', '221', 'Swift', 'TN05BF9020', '7010822940', '1', '0', 2),
(1737, 1737, '', '2021-12-28 12:30:00', '2021-12-28', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '7502073366', 'Swift', '', '1', 'hari', '0', 'Current Booking', 'ok', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(1738, 1738, '', '2021-12-28 12:00:00', '2021-12-28', 'thiruvanandhapuram', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8778537962', 'Etios', '', '1', 'amarnath', '0', 'Current Booking', 'ok', '1', '223', 'Etios', 'TN85A4875', '6383742273', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(1924, 1924, '', '2022-01-15 22:55:00', '2022-01-15', 'Cuttralam ', 'Public', '', '1', 'S kovil ', 'Out Station Tariff', '9976750384', 'Indica', '', '1', 'mr rajendran ', '0', 'Current Booking', '', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(1925, 1925, '', '2022-01-15 23:00:00', '2022-01-15', 'Tenkasi ', 'Public', '', '1', 'Tirunelveli ', 'Out Station Tariff', '9578204719', 'Swift', '', '1', 'subramanian ', '0', 'Current Booking', '', '1', '104', 'Swift', 'TN07CP7560', '9043389982', '1', '0', 2),
(1926, 1926, '', '2022-01-15 23:10:00', '2022-01-15', 'Ambai ', 'Public', '', '1', 'Tenkasi ', 'Out Station Tariff', '9535204947', 'Swift', '', '1', 'SENTHIL ', '0', 'Current Booking', '', '1', '254', 'Swift', 'TN11M6995', '8903064210', '1', '0', 2),
(1927, 1927, '', '2022-01-17 11:00:00', '2022-01-17', 'Thenmalai', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9994242603', 'Swift', '', '1', 'guhanandhan', '0', 'Current Booking', 'ok', '1', '254', 'Swift', 'TN11M6995', '8903064210', '1', '0', 2),
(1928, 1928, '', '2022-01-17 14:00:00', '2022-01-16', 'Thoothukudi', 'Public', '', '1', 'kudiuruppu', 'Out Station Tariff', '7339448349', 'Etios', '', '1', 'MANIKKARAJ', '0', 'Current Booking', 'ok', '1', '223', 'Etios', 'TN85A4875', '6383742273', '1', '0', 2),
(1929, 1929, '', '2022-01-17 14:00:00', '2022-01-17', 'v k puram', 'Public', '', '1', 'minnagar', 'Out Station Tariff', '9362411716', 'Etios', '', '1', 'iyappan ', '0', 'Current Booking', 'ok', '1', '246', 'Etios', 'TN67BY0952', '7418845990', '1', '0', 2),
(1930, 1930, '', '2022-01-17 12:00:00', '2022-01-16', 'Madurai', 'Public', '', '1', 'Senkottai', 'Out Station Tariff', '9164264942', 'Zest', '', '1', 'madhu suthan', '0', 'Current Booking', 'ok', '1', '104', 'Zest', 'TN07CP7560', '9043389982', '1', '0', 2),
(1931, 1931, '', '2022-01-17 13:00:00', '2022-01-17', 'v k pudur', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9442064433', 'Swift', '', '1', 'MR', '0', 'Current Booking', 'ok', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(1932, 1932, '', '2022-01-17 16:00:00', '2022-01-17', 'Tirunelveli', 'Public', '', '1', 'minnagar', 'Out Station Tariff', '9677704989', 'Tavera', '', '1', 'kannan ', '0', 'Current Booking', 'ok', '1', '308', 'Tavera', 'TN18L3325', '9585425570', '1', '0', 2),
(1933, 1933, '', '2022-01-17 13:30:00', '2022-01-17', 'melagaram', 'Public', '', '1', 'Kalingapatti', 'Out Station Tariff', '8778406386', 'Indigo', '', '1', 'gomathi diffen ', '0', 'Current Booking', 'ok', '1', '102', 'Indigo', 'TN18X2281', '9500459428', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(2119, 2119, '', '2022-02-05 19:05:00', '2022-02-05', 'kk valasai', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '8903402770', 'Indica', '', '1', 'meena', '0', 'Current Booking', 'ok', '1', '238', 'Indica', 'TN76AK0049', '8870871169', '1', '0', 2),
(2120, 2120, '', '2022-02-07 15:00:00', '2022-02-07', 's kovil ', 'Public', '', '1', 'cuttralam', 'Out Station Tariff', '9976750384', 'Swift', '', '1', 'mr rajendran ', '0', 'Advance Booking', '', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(2121, 2121, '', '2022-02-06 07:00:00', '2022-02-06', 'thiruvanandhapuram', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8637402336', 'Indica', '', '1', 'mohammed rafeek', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(2122, 2122, '', '2022-02-06 00:30:00', '2022-02-05', 'Thoothukudi', 'Public', '', '1', 'Keelapuliyur ', 'Out Station Tariff', '7397451996', 'Indica', '', '1', 'PRINCE ', '0', 'Current Booking', 'ok', '1', '258', 'Indica', 'TN09CS6381', '9677916977', '1', '0', 2),
(2123, 2123, '', '2022-02-06 00:35:00', '2022-02-05', 'mailapapuram', 'Public', '', '1', 'vettaikarankulam', 'Out Station Tariff', '9445495022', 'Indica', '', '1', 'vinoth', '0', 'Current Booking', '', '1', '104', 'Indica', 'TN07CP7560', '9043389982', '1', '0', 2),
(2124, 2124, '', '2022-02-06 23:00:00', '2022-02-06', 'Tenkasi', 'Public', '', '1', 'nagarcoil', 'Out Station Tariff', '9842687702', 'Indica', '', '1', 'vaikundam', '0', 'Current Booking', 'ok', '1', '112', 'Indica', 'TN87 3659', '9600778432', '1', '0', 2),
(2125, 2125, '', '2022-02-06 14:00:00', '2022-02-06', 'ambai', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9597635976', 'Indica', '', '1', 'muthukumar', '0', 'Current Booking', 'ok', '1', '104', 'Indica', 'TN07CP7560', '9043389982', '1', '0', 2),
(2126, 2126, '', '2022-02-06 14:30:00', '2022-02-06', 'Manimutharu (TP)', 'Public', '', '1', 'Tenkasi ', 'Out Station Tariff', '9500579206', 'Swift', '', '1', 'DINESH', '0', 'Current Booking', '', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2),
(2127, 2127, '', '2022-02-06 17:46:00', '2022-02-06', 'Tirunelveli', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9750483342', 'Indica', '', '1', 'narayanan', '0', 'Current Booking', '', '1', '246', 'Indica', 'TN67BY0952', '8438811020', '1', '0', 2),
(2128, 2128, '', '2022-02-06 17:55:00', '2022-02-06', 'Tirunelveli', 'Public', '', '1', 'kudiuruppu', 'Out Station Tariff', '8838189637', 'Indica', '', '1', 'bagavathy', '0', 'Current Booking', '', '1', '252', 'Indica', 'TN66AB5185', '9361163069', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(2316, 2316, '', '2022-02-21 05:52:00', '2022-02-20', 'ilanji', 'Public', '', '1', 'Tirunelveli', 'Out Station Tariff', '6383385526', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '221', 'Indica', 'TN05BF9020', '7010822940', '1', '0', 2),
(2317, 2317, '', '2022-02-21 16:22:00', '2022-02-21', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9515157758', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(2318, 2318, '', '2022-02-21 16:31:00', '2022-02-21', 'tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9515157758', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '258', 'Indica', 'TN09CS6381', '9677916977', '1', '0', 2),
(2319, 2319, '', '2022-02-21 18:36:00', '2022-02-21', 'Tirunelveli', 'Public', '', '1', 'vallam ', 'Out Station Tariff', '9790902904', 'Indica', '', '1', 'MR', '0', 'Current Booking', 'OK', '1', '238', 'Indica', 'TN76AK0049', '8870871169', '1', '0', 2),
(2320, 2320, '', '2022-02-22 06:49:00', '2022-02-21', 'kadayanallur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8668056484', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '104', 'Indica', 'TN07CP7560', '9043389982', '1', '0', 2),
(2321, 2321, '', '2022-02-22 06:53:00', '2022-02-21', 'mukkudal', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9865972410', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '260', 'Indica', 'TN12W6058', '9500659101', '1', '0', 2),
(2322, 2322, '', '2022-02-22 11:00:00', '2022-02-22', 'thiruvanandhapuram', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8778537962', 'Indica', '', '1', 'amarnath', '0', 'Current Booking', '', '1', '104', 'Indica', 'TN07CP7560', '9043389982', '1', '0', 2),
(2323, 2323, '', '2022-02-21 19:16:00', '2022-02-21', 'Tirunelveli', 'Public', '', '1', 'chathram', 'Out Station Tariff', '9842533052', 'Indica', '', '1', 'SUBBAIAH', '0', 'Current Booking', '', '1', '230', 'Indica', 'TN67BF2350', '6381666478', '1', '0', 2),
(2324, 2324, '', '2022-02-21 20:30:00', '2022-02-21', 'melagaram', 'Public', '', '1', 'ramanasamuthiram', 'Out Station Tariff', '9486615708', 'Indica', '', '1', 'GANESHAN ', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(2325, 2325, '', '2022-03-09 15:00:00', '2022-03-09', 'Kalakad ', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9094532917', 'Indica', '', '1', 'sundarajan ', '0', 'Advance Booking', '', '1', '260', 'Indica', 'TN12W6058', '9500659101', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(2515, 2515, '', '2022-03-08 16:51:00', '2022-03-08', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '7708291386', 'Indica', '', '1', 'AVUDAIAMMAL ', '0', 'Current Booking', '', '1', '112', 'Indica', 'TN87 3659', '9600778432', '1', '0', 2),
(2516, 2516, '', '2022-03-08 16:52:00', '2022-03-08', 'kadayanallur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9344147194', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '246', 'Indica', 'TN67BY0952', '8438811020', '1', '0', 2),
(2517, 2517, '', '2022-03-08 16:53:00', '2022-03-08', 'Kadayam', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '7904643354', 'Indica', '', '1', '', '0', 'Current Booking', '', '1', '260', 'Xcent', 'TN12W6058', '9500659101', '0', '1', 2),
(2518, 2518, '', '2022-03-08 16:54:00', '2022-03-08', 'Kadayam', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '7904643354', 'Indica', '', '1', 'subramanian ', '0', 'Current Booking', '', '1', '260', 'Indica', 'TN12W6058', '9500659101', '1', '0', 2),
(2519, 2519, '', '2022-03-09 10:00:00', '2022-03-09', 'Rameswaram', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '7904643354', 'Indica', '', '1', 'subramanian ', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(2520, 2520, '', '2022-03-11 10:45:00', '2022-03-11', 'Papanasam', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9585577433', 'Indica', '', '1', 'saravanan ', '0', 'Advance Booking', '', '0', '', '', '', '', '0', '1', 2),
(2521, 2521, '', '2022-03-11 10:45:00', '2022-03-11', 'Papanasam', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9585577433', 'Indica', '', '1', 'saravanan ', '0', 'Advance Booking', '', '0', '', '', '', '', '0', '1', 2),
(2522, 2522, '', '2022-03-08 21:30:00', '2022-03-08', 'Kasimejorpuram', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9442614393', 'Indica', '', '1', 'mrs krishnamoorthy', '0', 'Current Booking', '', '1', '102', 'Indica', 'TN18X2281', '9500459428', '1', '0', 2),
(2523, 2523, '', '2022-03-08 23:27:00', '2022-03-08', 'Senkottai', 'Public', '', '1', 'alzhappa puram', 'Out Station Tariff', '7558167909', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(2524, 2524, '', '2022-03-09 00:30:00', '2022-03-08', 'Senkottai', 'Public', '', '1', 'alzhappa puram', 'Out Station Tariff', '7558167909', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '104', 'Indica', 'TN07CP7560', '9043389982', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(2712, 2712, '', '2022-03-21 21:00:00', '2022-03-21', 'Tirunelveli', 'Public', '', '1', 'pullukattuvalasai', 'Out Station Tariff', '9597720987', 'Indica', '', '1', 'gopalakrishnan', '0', 'Current Booking', '', '1', '246', 'Indica', 'TN67BY0952', '8438811020', '1', '0', 2),
(2713, 2713, '', '2022-03-22 00:30:00', '2022-03-21', 'Tenkasi', 'Public', '', '1', 'k kurichi', 'Out Station Tariff', '8825767368', 'Indica', '', '1', 'kannan ', '0', 'Current Booking', '', '1', '238', 'Indica', 'TN76AK0049', '8870871169', '1', '0', 2),
(2714, 2714, '', '2022-03-22 11:00:00', '2022-03-22', 'thiruvanandhapuram', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8778537962', 'Indica', '', '1', 'amarnath', '0', 'Current Booking', '', '1', '258', 'Indica', 'TN09CS6381', '9677916977', '1', '0', 2),
(2715, 2715, '', '2022-03-21 20:30:00', '2022-03-21', 'kadayanallur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8778747281', 'Indica', '', '1', 'popular medical', '0', 'Current Booking', '', '1', '260', 'Indica', 'TN12W6058', '9500659101', '1', '0', 2),
(2716, 2716, '', '2022-03-21 21:45:00', '2022-03-21', 'kallidaikurichi', 'Public', '', '1', 'Vallam', 'Out Station Tariff', '8098384846', 'Indica', '', '1', 'ARUNACHALAM', '0', 'Current Booking', '', '1', '104', 'Indica', 'TN07CP7560', '9043389982', '1', '0', 2),
(2717, 2717, '', '2022-03-21 22:46:00', '2022-03-21', 'puliyankudi', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9788263536', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '258', 'Indica', 'TN09CS6381', '9677916977', '1', '0', 2),
(2718, 2718, '', '2022-03-23 22:30:00', '2022-03-23', 'thiruvanandhapuram', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8637659761', 'Indica', '', '1', 'mohammed', '0', 'Advance Booking', '', '1', '104', 'Indica', 'TN07CP7560', '9043389982', '1', '0', 2),
(2719, 2719, '', '2022-03-22 13:15:00', '2022-03-22', 'thirumalaikovil', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '7904252402', 'Indica', '', '1', 'duraisamy', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(2720, 2720, '', '2022-03-22 01:15:00', '2022-03-21', 'thirumalaikovil', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '7904252402', 'Indica', '', '1', 'duraisamy', '0', 'Current Booking', '', '1', '223', 'Indica', 'TN85A4875', '6383742273', '1', '0', 2),
(2721, 2721, '', '2022-03-22 16:00:00', '2022-03-22', 'mukkudal', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9345970314', 'Indica', '', '1', 'RAMRAJ', '0', 'Current Booking', '', '1', '223', 'Indica', 'TN85A4875', '6383742273', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(2908, 2908, '', '2022-04-07 17:30:00', '2022-04-07', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8870657265', 'Indica', '', '1', 'SENTHIL ', '0', 'Current Booking', '', '1', '112', 'Indica', 'TN87 3659', '9600778432', '1', '0', 2),
(2909, 2909, '', '2022-04-07 17:30:00', '2022-04-07', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8870657265', 'Indica', '', '1', 'SENTHIL ', '0', 'Current Booking', '', '1', '112', 'Indica', 'TN87 3659', '9600778432', '1', '0', 2),
(2910, 2910, '', '2022-04-16 11:30:00', '2022-04-16', 'saparimalai', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9789045069', 'Indica', '', '1', 'MR', '0', 'Advance Booking', '', '1', '308', 'Indica', 'TN18L3325', '9585425570', '1', '0', 2),
(2911, 2911, '', '2022-04-07 19:45:00', '2022-04-07', 'Nagaram', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9489964055', 'Indica', '', '1', 'NATARAJAN ', '0', 'Current Booking', '', '1', '238', 'Indica', 'TN76AK0049', '8870871169', '1', '0', 2),
(2912, 2912, '', '2022-04-07 22:45:00', '2022-04-07', 'puliyagudi', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9080961439', 'Indica', '', '1', 'karuppaiah', '0', 'Current Booking', '', '1', '207', 'Indica', 'TN22DE0874', '9597015898', '1', '0', 2),
(2913, 2913, '', '2022-04-07 23:45:00', '2022-04-07', 'Tirunelveli', 'Public', '', '1', 'cuttralam', 'Out Station Tariff', '9003406154', 'Indica', '', '1', 'Arunachalam ', '0', 'Current Booking', '', '1', '112', 'Indica', 'TN87 3659', '9600778432', '1', '0', 2),
(2914, 2914, '', '2022-04-08 15:30:00', '2022-04-08', 'Erode', 'Public', '', '1', 'kasimejarpuram', 'Out Station Tariff', '9843467099', 'Indica', '', '1', 'subramanian ', '0', 'Current Booking', '', '1', '238', 'Indica', 'TN76AK0049', '8870871169', '1', '0', 2),
(2915, 2915, '', '2022-04-08 21:30:00', '2022-04-08', 'Papankulam', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9488693739', 'Indica', '', '1', 'KRISHNAMOORTHY', '0', 'Current Booking', '', '1', '225', 'Indica', 'TN72BF4479', '8681943094', '1', '0', 2),
(2916, 2916, '', '2022-04-08 16:29:00', '2022-04-08', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9080961439', 'Indica', '', '1', 'karuppaiah', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(2917, 2917, '', '2022-04-08 16:00:00', '2022-04-08', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9080961439', 'Indica', '', '1', 'karuppaiah', '0', 'Current Booking', '', '1', '315', 'Indica', 'TN09CH1769', '9080770663', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(3106, 3106, '', '2022-04-26 17:30:00', '2022-04-26', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9842116019', 'Indica', '', '1', 'vallinayagam', '0', 'Current Booking', '', '1', '238', 'Indica', 'TN76AK0049', '8870871169', '1', '0', 2),
(3107, 3107, '', '2022-04-26 17:00:00', '2022-04-26', 'pavoorchathram', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9676635214', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '230', 'Indica', 'TN67BF2350', '6381666478', '1', '0', 2),
(3108, 3108, '', '2022-04-26 17:00:00', '2022-04-26', 'pavoorchathram', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9976635214', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '230', 'Indica', 'TN67BF2350', '6381666478', '1', '0', 2),
(3109, 3109, '', '2022-04-27 11:30:00', '2022-04-27', 'Tenkasi', 'Public', '', '1', 'Tirunelveli', 'Out Station Tariff', '9488693739', 'Swift', '', '1', 'kirushna moorthi', '0', 'Current Booking', '', '1', '260', 'Swift', 'TN12W6058', '9500659101', '1', '0', 2),
(3110, 3110, '', '2022-04-26 18:00:00', '2022-04-26', 'cuttralam', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9515157758', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '1', '221', 'Swift', 'TN05BF9020', '7010822940', '1', '0', 2),
(3111, 3111, '', '2022-04-26 18:30:00', '2022-04-26', 'kadayanallur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9952319737', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '315', 'Indica', 'TN09CH1769', '9080770663', '1', '0', 2),
(3112, 3112, '', '2022-04-27 11:00:00', '2022-04-27', 'irukankudi', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9976635214', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(3113, 3113, '', '2022-04-27 14:00:00', '2022-04-27', 'nagarkovil', 'Public', '', '1', 'ilanji', 'Out Station Tariff', '6380057456', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(3114, 3114, '', '2022-04-27 15:00:00', '2022-04-27', 'Tirunelveli', 'Public', '', '1', 'Senkottai', 'Out Station Tariff', '9486702701', 'Indica', '', '1', 'manikandan aandha classic', '0', 'Current Booking', '', '1', '112', 'Indica', 'TN87 3659', '9600778432', '1', '0', 2),
(3115, 3115, '', '2022-04-27 20:15:00', '2022-04-27', 'Rajapalayam', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9003406154', 'Indica', '', '1', 'Arunachalam ', '0', 'Current Booking', '', '1', '258', 'Indica', 'TN09CS6381', '9677916977', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(3305, 3305, '', '2022-05-13 22:15:00', '2022-05-13', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '6379256141', 'Swift', '', '1', 'indra ', '0', 'Current Booking', '', '1', '258', 'Swift', 'TN09CS6381', '9677916977', '1', '0', 2),
(3306, 3306, '', '2022-05-15 10:00:00', '2022-05-15', 'Thiruchendur', 'Public', '', '1', 'pavoorchathram', 'Out Station Tariff', '9976749817', 'Tavera', '', '1', 'martin', '0', 'Advance Booking', '', '1', '312', 'Tavera', 'TN76AD7797', '8850186664', '1', '0', 2),
(3307, 3307, '', '2022-05-14 02:15:00', '2022-05-13', 'kadayanallur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '7397248452', 'Swift', '', '1', 'shagul', '0', 'Current Booking', '', '1', '262', 'Swift', 'TN76AC6207', '9500810010', '1', '0', 2),
(3308, 3308, '', '2022-05-14 02:15:00', '2022-05-13', 'kadayanallur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '7397248452', 'Swift', '', '1', 'shagul', '0', 'Current Booking', '', '1', '262', 'Swift', 'TN76AC6207', '9500810010', '0', '1', 2),
(3309, 3309, '', '2022-05-14 02:15:00', '2022-05-13', 'kadayanallur', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '7397248452', 'Swift', '', '1', 'shagul', '0', 'Current Booking', '', '1', '262', 'Swift', 'TN76AC6207', '9500810010', '0', '1', 2),
(3310, 3310, '', '2022-05-14 17:08:00', '2022-05-14', 'cuttralam', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '6379224037', 'Swift', '', '1', 'RAMRAJ', '0', 'Current Booking', '', '1', '258', 'Swift', 'TN09CS6381', '9677916977', '1', '0', 2),
(3311, 3311, '', '2022-05-14 17:10:00', '2022-05-14', 'keelapavoor', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9865642321', 'Swift', '', '1', 'suganya', '0', 'Current Booking', '', '1', '315', 'Swift', 'TN09CH1769', '9080770663', '1', '0', 2),
(3312, 3312, '', '2022-05-14 17:11:00', '2022-05-14', 'nagarcoil', 'Public', '', '1', 'ilanji', 'Out Station Tariff', '6374076265', 'Swift', '', '1', 'sudha', '0', 'Current Booking', '', '1', '262', 'Swift', 'TN76AC6207', '9500810010', '1', '0', 2),
(3313, 3313, '', '2022-05-14 17:12:00', '2022-05-14', 'tenkasi', 'Public', '', '1', 'ilanji', 'Out Station Tariff', '9751571578', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '112', 'Indica', 'TN87 3659', '9600778432', '1', '0', 2),
(3314, 3314, '', '2022-05-15 02:00:00', '2022-05-14', 'tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9843948899', 'Indica', '', '1', 'MR', '0', 'Current Booking', '', '1', '212', 'Indica', 'TN76AM6304', '9677694239', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(3505, 3505, '', '2022-05-28 11:00:00', '2022-05-28', 'Thoothukkudi', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9486428651', 'Tavera', '', '1', 'rama krishnan', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(3506, 3506, '', '2022-05-28 00:30:00', '2022-05-27', 'idaikal', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '7339142670', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2),
(3507, 3507, '', '2022-05-28 11:00:00', '2022-05-28', 'Thoothukkudi', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '9486428651', 'Swift', '', '1', 'rama krishnan', '0', 'Current Booking', '', '1', '104', 'Swift', 'TN07CP7560', '9043389982', '1', '0', 2),
(3508, 3508, '', '2022-05-28 08:00:00', '2022-05-28', 'Kuthukalvalasai', 'Public', '', '1', 'Madurai', 'Out Station Tariff', '9531804506', 'Indica', '', '1', 'muthaiah', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(3509, 3509, '', '2022-05-28 20:00:00', '2022-05-28', 'Kuthukalvalasai', 'Public', '', '1', 'Madurai', 'Out Station Tariff', '9531804506', 'Indica', '', '1', 'muthaiah', '0', 'Current Booking', '', '0', '', '', '', '', '0', '1', 2),
(3510, 3510, '', '2022-05-28 12:00:00', '2022-05-28', 'papanasam', 'Public', '', '1', 'Kadayam', 'Out Station Tariff', '8667287840', 'Tavera', '', '1', 'MR', '0', 'Current Booking', '', '1', '312', 'Tavera', 'TN76AD7797', '8850186664', '1', '0', 2),
(3511, 3511, '', '2022-05-28 17:00:00', '2022-05-28', 'Achampudur', 'Public', '', '1', 'nannagaram', 'Out Station Tariff', '9443646770', 'Swift', '', '1', 'sathishkumar', '0', 'Current Booking', '', '1', '262', 'Swift', 'TN76AC6207', '9500810010', '1', '0', 2),
(3512, 3512, '', '2022-05-28 18:00:00', '2022-05-28', 'Tenkasi', 'Public', '', '1', 'ilanji', 'Out Station Tariff', '9842791566', 'Swift', '', '1', 'saba', '0', 'Current Booking', '', '1', '221', 'Swift', 'TN05BF9020', '7010822940', '1', '0', 2),
(3513, 3513, '', '2022-05-28 16:45:00', '2022-05-28', 'puliyagudi', 'Public', '', '1', 'kudiuruppu', 'Out Station Tariff', '6380142627', 'Swift', '', '1', 'AMBIKA', '0', 'Current Booking', '', '1', '315', 'Swift', 'TN09CH1769', '9080770663', '1', '0', 2),
(3514, 3514, '', '2022-05-28 16:45:00', '2022-05-28', 'puliyagudi', 'Public', '', '1', 'kudiuruppu', 'Out Station Tariff', '6380142627', 'Swift', '', '1', 'AMBIKA', '0', 'Current Booking', '', '1', '230', 'Swift', 'TN67BF2350', '6381666478', '1', '0', 2)
;
INSERT INTO `f_ft_booking` (`id`, `b_id`, `e_id`, `pickup`, `b_date`, `d_place`, `to_whom`, `a_no`, `cus_count`, `p_city`, `r_status`, `m_no`, `v_type`, `st`, `t_type`, `b_name`, `ac_type`, `b_type`, `remarks`, `b_now`, `q`, `v_types`, `v_no`, `d_mobile`, `assign`, `booking_status`, `user_id`) VALUES
(3703, 3703, '', '2022-06-12 02:00:00', '2022-06-11', 'thiruvanandhapuram', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '8122416498', 'Swift', '', '1', 'balasubramanian ', '0', 'Current Booking', '', '1', '104', 'Swift', 'TN07CP7560', '9043389982', '1', '0', 2),
(3704, 3704, '', '2022-06-12 16:00:00', '2022-06-12', 'Kalingapatti', 'Public', '', '1', 'melagaram', 'Out Station Tariff', '8778406386', 'Swift', '', '1', 'gomathi diffen ', '0', 'Current Booking', '', '1', '222', 'Swift', 'TN09CP3951', '9500459428', '1', '0', 2),
(3705, 3705, '', '2022-06-12 16:30:00', '2022-06-12', 'ilanji', 'Public', '', '1', 'tenkasi ', 'Out Station Tariff', '9791159708', 'Swift', '', '1', 'praveen', '0', 'Current Booking', '', '1', '262', 'Swift', 'TN76AC6207', '9500810010', '1', '0', 2),
(3706, 3706, '', '2022-06-12 11:30:00', '2022-06-12', 'Panpoli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9677421319', 'Indica', '', '1', 'renuka', '0', 'Current Booking', '', '1', '112', 'Indica', 'TN87 3659', '8608751675', '1', '0', 2),
(3707, 3707, '', '2022-06-12 12:00:00', '2022-06-12', 'thiruvanandhapuram', 'Public', '', '1', 'Kadayam', 'Out Station Tariff', '9444148794', 'Xylo', '', '1', 'natarajan kadayam', '0', 'Current Booking', '', '1', '310', 'Xylo', 'TN10BE9959', '9944615079', '1', '0', 2),
(3708, 3708, '', '2022-06-12 22:00:00', '2022-06-12', 'Kanniyakumari', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9833814937', 'Etios', '', '1', 'selvaraj', '0', 'Current Booking', '', '1', '221', 'Etios', 'TN05BF9020', '7010822940', '1', '0', 2),
(3709, 3709, '', '2022-06-12 14:46:00', '2022-06-12', 'Gobichettipalayam', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '7339223784', 'Tavera', '', '1', 'moorthi idaikal', '0', 'Current Booking', '', '1', '308', 'Tavera', 'TN18L3325', '9585425570', '1', '0', 2),
(3710, 3710, '', '2022-06-12 16:00:00', '2022-06-12', 'Tirunelveli', 'Public', '', '1', 'tenkasi', 'Out Station Tariff', '9750953350', 'Xcent', '', '1', 'suresh', '0', 'Current Booking', '', '1', '260', 'Xcent', 'TN12W6058', '9500659101', '1', '0', 2),
(3711, 3711, '', '2022-06-12 18:00:00', '2022-06-12', 'Ayakudi ', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '7092129062', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '1', '221', 'Swift', 'TN05BF9020', '7010822940', '1', '0', 2),
(3712, 3712, '', '2022-06-12 18:00:00', '2022-06-12', 'Tirunelveli', 'Public', '', '1', 'Tenkasi', 'Out Station Tariff', '9994807676', 'Swift', '', '1', 'MR', '0', 'Current Booking', '', '1', '238', 'Swift', 'TN76AK0049', '8870871169', '1', '0', 2)
;

-- --------------------------------------------------------

--
-- Table structure for table `f_local_tariff`
--

CREATE TABLE `f_local_tariff` (
  `id` int(11) NOT NULL,
  `v_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(11) NOT NULL,
  `mini_km` int(11) DEFAULT NULL,
  `max_km` int(11) DEFAULT NULL,
  `c_p_km` int(11) DEFAULT NULL,
  `c_p_hrs` int(11) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_by` varchar(55) DEFAULT NULL,
  `min_u_km` int(11) NOT NULL,
  `min_amt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_local_tariff`
--

INSERT INTO `f_local_tariff` (`id`, `v_name`, `ac_type`, `mini_km`, `max_km`, `c_p_km`, `c_p_hrs`, `update_date`, `update_by`, `min_u_km`, `min_amt`) VALUES
(1, 'Indica', 'ac', 4, 10, 18, 60, '2020-05-24', '1', 3, 99),
(2, 'Indica', 'nonac', 4, 10, 17, 60, '2020-05-24', '1', 3, 99),
(4, 'Swift', 'ac', 4, 10, 20, 60, '2020-05-24', '1', 3, 125)
;

-- --------------------------------------------------------

--
-- Table structure for table `f_login_status`
--

CREATE TABLE `f_login_status` (
  `id` int(11) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `id_emp` varchar(55) DEFAULT NULL,
  `emp_mobile` varchar(55) DEFAULT NULL,
  `emp_name` varchar(55) DEFAULT NULL,
  `vacant_place` varchar(55) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_date_new` date NOT NULL,
  `logout` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `out_date` date NOT NULL,
  `login_status` enum('0','1') DEFAULT '0',
  `v_no` varchar(55) NOT NULL,
  `ontrip_status` enum('0','1') NOT NULL DEFAULT '0',
  `status_assign` enum('0','1') NOT NULL DEFAULT '0',
  `emp_login` enum('0','1') NOT NULL DEFAULT '0',
  `hrsp_day` int(11) NOT NULL,
  `minscalc` int(11) NOT NULL,
  `trip_amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_login_status`
--

INSERT INTO `f_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout_date_new`, `logout`, `out_date`, `login_status`, `v_no`, `ontrip_status`, `status_assign`, `emp_login`, `hrsp_day`, `minscalc`, `trip_amount`) VALUES
(1, 'Indica', '100', '9790427773', 'Jp', 'MMP', '2021-06-27 20:59:56', '2021-06-30', '2021-06-30 19:18:45', '0000-00-00', '0', 'TN010000', '0', '', '0', 0, 0, 0),
(2, 'Indica', '101', '8608290090', 'Murugan', '', '2021-06-28 10:14:56', '2021-07-01', '2021-07-02 03:38:45', '0000-00-00', '0', 'TN72OX1989', '0', '0', '0', 0, 0, 1061),
(3, 'Indica', '100', '9790427773', 'Jp', 'MMP', '2021-06-30 12:21:02', '2021-07-01', '2021-07-01 19:15:58', '0000-00-00', '0', 'TN010000', '0', '', '0', 0, 0, 0),
(4, 'Indica', '100', '9790427773', 'Jp', 'MMP', '2021-07-01 12:16:35', '2021-07-01', '2021-07-02 03:38:38', '0000-00-00', '0', 'TN010000', '0', '0', '0', 0, 0, 250),
(5, NULL, '2', '8489228080', 'Rajkumar', NULL, '2021-07-01 12:18:01', '2021-07-01', '2021-07-01 19:18:26', '0000-00-00', '0', '', '0', '0', '0', 0, 0, 0),
(6, 'Swift', '315', '9080770663', 'PRABAHARAN A', 'IDAIKAL', '2021-07-01 13:37:35', '2021-07-02', '2021-07-02 16:33:12', '0000-00-00', '0', 'TN09CH1769', '0', '', '0', 0, 0, 7952),
(7, 'Xcent', '232', '8086964712', 'ANBARASAN R', 'MELAGARAM ', '2021-07-01 13:44:53', '2021-07-01', '2021-07-02 05:29:54', '0000-00-00', '0', 'TN72AM2245', '0', '', '0', 0, 0, 1283),
(8, 'Xylo', '322', '8086964712', 'ANBARASAN R', 'MELAGARAM ', '2021-07-01 13:52:04', '2021-07-01', '2021-07-02 03:39:00', '0000-00-00', '0', 'TN22DC0375', '0', '', '0', 0, 0, 0),
(9, 'Etios', '221', '7010822940', 'SITHICK S', 'MOUND ROAD ', '2021-07-01 14:44:50', '2021-07-01', '2021-07-02 03:38:54', '0000-00-00', '0', 'TN05BF9020', '0', '', '0', 0, 0, 1560),
(10, 'Swift', '204', '8428916359', 'KRISHNAKUMAR M ', 'MELAGARAM ', '2021-07-01 14:49:05', '2021-07-01', '2021-07-02 03:39:18', '0000-00-00', '0', 'TN72BB6806', '0', '', '0', 0, 0, 1554)
;
INSERT INTO `f_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout_date_new`, `logout`, `out_date`, `login_status`, `v_no`, `ontrip_status`, `status_assign`, `emp_login`, `hrsp_day`, `minscalc`, `trip_amount`) VALUES
(273, 'Swift', '202', '9987862378', 'ELIYARAJA', 'MATHALAMPARAI', '2021-08-03 09:17:02', '2021-08-03', '2021-08-04 06:39:18', '0000-00-00', '0', 'TN11K1737', '0', '', '0', 0, 0, 0),
(274, 'Etios', '223', '6383742273', 'ANANDHA KUMAR M ', 'KUDIURUPPU ', '2021-08-03 09:17:08', '2021-08-04', '2021-08-05 03:10:54', '0000-00-00', '0', 'TN85A4875', '0', '', '0', 0, 0, 1642),
(275, 'Swift', '240', '6379649008', 'ANANTHARAJ T ', 'IDAIKAL', '2021-08-03 09:17:14', '2021-08-03', '2021-08-04 06:39:24', '0000-00-00', '0', 'TN72BP8991', '0', '', '0', 0, 0, 523),
(276, 'Swift', '238', '8870871169', 'K ALLAHBIBTCHAI', 'NEW BUSTAND', '2021-08-03 09:17:19', '2021-08-03', '2021-08-04 06:39:31', '0000-00-00', '0', 'TN76AK0049', '0', '', '0', 0, 0, 1649),
(277, 'Xcent', '244', '9366664411', 'ALAGAR', 'MELAGARAM ', '2021-08-03 21:36:16', '2021-08-04', '2021-08-05 03:10:45', '0000-00-00', '0', 'TN76AH9700', '0', '', '0', 0, 0, 2018),
(278, 'Xcent', '208', '9786649582', 'VASANTHKUMAR', 'SUNDARAPANDIAPURAM', '2021-08-03 21:36:29', '2021-08-04', '2021-08-05 05:41:45', '0000-00-00', '0', 'TN72BM2558', '0', '', '0', 0, 0, 1893),
(279, 'Indica', '102', '9500459428', 'MARIDURAI ', 'MELAPATTAKURICHI', '2021-08-03 21:37:35', '2021-08-05', '2021-08-06 02:44:06', '0000-00-00', '0', 'TN18X2281', '0', '', '0', 0, 0, 1795),
(280, 'Swift', '230', '6381666478', 'SANKARALINGAM A ', 'TENKASI', '2021-08-04 07:45:51', '2021-08-05', '2021-08-06 02:44:12', '0000-00-00', '0', 'TN67BF2350', '0', '', '0', 0, 0, 1880),
(281, 'Swift', '242', '9688779152', 'MAGESH ', 'IDAIKAL', '2021-08-04 07:45:58', '2021-08-05', '2021-08-06 02:44:19', '0000-00-00', '0', 'TN11AE8883', '0', '', '0', 0, 0, 3411),
(282, 'Swift', '240', '6379649008', 'ANANTHARAJ T ', 'IDAIKAL', '2021-08-04 07:46:24', '2021-08-04', '2021-08-04 19:36:18', '0000-00-00', '0', 'TN72BP8991', '0', '', '0', 0, 0, 0)
;
INSERT INTO `f_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout_date_new`, `logout`, `out_date`, `login_status`, `v_no`, `ontrip_status`, `status_assign`, `emp_login`, `hrsp_day`, `minscalc`, `trip_amount`) VALUES
(546, 'Etios', '223', '6383742273', 'ANANDHA KUMAR M ', 'KUDIURUPPU ', '2021-09-12 14:16:20', '2021-09-13', '2021-09-14 03:27:33', '0000-00-00', '0', 'TN85A4875', '0', '', '0', 0, 0, 1350),
(547, 'Indica', '311', '9600778432', 'MOHAMMED HAJA ', 'KOTTAKULAM ', '2021-09-13 15:48:54', '2021-09-14', '2021-09-15 03:52:55', '0000-00-00', '0', 'TN22DF1526', '0', '', '0', 0, 0, 1346),
(548, 'Tavera', '308', '9585425570', 'SANTHANAKUMAR M', 'KADAYAM', '2021-09-14 09:34:00', '2021-09-14', '2021-09-15 03:53:04', '0000-00-00', '0', 'TN18L3325', '0', '', '0', 0, 0, 1479),
(549, 'Swift', '230', '6381666478', 'SANKARALINGAM A ', 'TENKASI', '2021-09-14 09:34:06', '2021-09-18', '2021-09-19 02:39:24', '0000-00-00', '0', 'TN67BF2350', '0', '', '0', 0, 0, 6200),
(550, 'Swift', '238', '8870871169', 'K ALLAHBIBTCHAI', 'NEW BUSTAND', '2021-09-14 09:34:11', '2021-09-18', '2021-09-19 06:13:28', '0000-00-00', '0', 'TN76AK0049', '0', '', '0', 0, 0, 3870),
(551, 'Etios', '223', '6383742273', 'ANANDHA KUMAR M ', 'KUDIURUPPU ', '2021-09-14 09:34:22', '2021-09-15', '2021-09-16 03:36:16', '0000-00-00', '0', 'TN85A4875', '0', '', '0', 0, 0, 2697),
(552, 'Etios', '221', '7010822940', 'SITHICK S', 'MOUND ROAD ', '2021-09-14 09:36:16', '2021-09-14', '2021-09-15 03:53:11', '0000-00-00', '0', 'TN05BF9020', '0', '', '0', 0, 0, 3360),
(553, 'Indigo', '250.', '9489290278', 'SUTHAN KUMAR ', 'PAVOORCHATHRAM', '2021-09-14 19:24:28', '2021-09-14', '2021-09-15 02:37:50', '0000-00-00', '0', 'TN19AB9624', '0', '0', '0', 0, 0, 0),
(554, 'Indigo', '250', '9489290278', 'SUTHAN KUMAR ', 'PAVOORCHATHRAM', '2021-09-14 19:38:02', '2021-09-18', '2021-09-19 02:39:30', '0000-00-00', '0', 'TN19AB9624', '0', '', '0', 0, 0, 959),
(555, 'Swift', '315', '9080770663', 'PRABAHARAN A', 'IDAIKAL', '2021-09-15 09:13:46', '2021-09-15', '2021-09-16 03:36:09', '0000-00-00', '0', 'TN09CH1769', '0', '', '0', 0, 0, 1415)
;
INSERT INTO `f_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout_date_new`, `logout`, `out_date`, `login_status`, `v_no`, `ontrip_status`, `status_assign`, `emp_login`, `hrsp_day`, `minscalc`, `trip_amount`) VALUES
(814, 'Indigo', '250', '9489290278', 'SUTHAN KUMAR ', 'PAVOORCHATHRAM', '2021-11-09 10:00:59', '2021-11-09', '2021-11-10 03:12:43', '0000-00-00', '0', 'TN19AB9624', '0', '', '0', 0, 0, 1780),
(815, 'Indica', '311', '9600778432', 'MOHAMMED HAJA ', 'KOTTAKULAM ', '2021-11-09 10:01:05', '2021-11-09', '2021-11-10 03:12:48', '0000-00-00', '0', 'TN22DF1526', '0', '', '0', 0, 0, 576),
(816, 'Swift', '238', '8870871169', 'K ALLAHBIBTCHAI', 'NEW BUSTAND', '2021-11-09 10:23:43', '2021-11-15', '2021-11-16 03:00:48', '0000-00-00', '0', 'TN76AK0049', '0', '', '0', 0, 0, 1170),
(817, 'Swift', '242', '7373971902', 'MAGESH ', 'IDAIKAL', '2021-11-09 10:59:24', '2021-11-10', '2021-11-11 03:24:55', '0000-00-00', '0', 'TN11AE8883', '0', '', '0', 0, 0, 1790),
(818, 'Swift', '315', '9080770663', 'PRABAHARAN A', 'IDAIKAL', '2021-11-09 14:53:41', '2021-11-09', '2021-11-10 03:12:54', '0000-00-00', '0', 'TN09CH1769', '0', '', '0', 0, 0, 570),
(819, 'Etios', '223', '6383742273', 'ANANDHA KUMAR M ', 'KUDIURUPPU ', '2021-11-09 15:38:17', '2021-11-09', '2021-11-10 03:13:00', '0000-00-00', '0', 'TN85A4875', '0', '', '0', 0, 0, 3445),
(820, 'Xylo', '324', '8668013137', 'BALASUBRAMANIAN A', 'SENKOTTAI', '2021-11-09 19:52:43', '2021-11-12', '2021-11-12 17:11:46', '0000-00-00', '0', 'TN79C1449', '0', '', '0', 0, 0, 4025),
(821, 'Tavera', '308', '9585425570', 'SANTHANAKUMAR M', 'KADAYAM', '2021-11-09 20:02:25', '2021-11-10', '2021-11-11 03:25:01', '0000-00-00', '0', 'TN18L3325', '0', '', '0', 0, 0, 2730),
(822, 'Indica', '311', '9600778432', 'MOHAMMED HAJA ', 'KOTTAKULAM ', '2021-11-10 10:22:53', '2021-11-10', '2021-11-11 03:25:08', '0000-00-00', '0', 'TN22DF1526', '0', '', '0', 0, 0, 550),
(823, 'Swift', '230', '6381666478', 'SANKARALINGAM A ', 'TENKASI', '2021-11-10 10:22:57', '2021-11-10', '2021-11-11 03:25:14', '0000-00-00', '0', 'TN67BF2350', '0', '', '0', 0, 0, 730)
;
INSERT INTO `f_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout_date_new`, `logout`, `out_date`, `login_status`, `v_no`, `ontrip_status`, `status_assign`, `emp_login`, `hrsp_day`, `minscalc`, `trip_amount`) VALUES
(1082, 'Swift', '230', '6381666478', 'SANKARALINGAM A ', 'TENKASI', '2021-12-24 10:16:33', '2021-12-26', '2021-12-27 03:25:20', '0000-00-00', '0', 'TN67BF2350', '0', '', '0', 0, 0, 3430),
(1083, 'Swift', '256', '9442081303', 'MANIKANDAN M ', 'CUTTRALAM', '2021-12-24 10:16:38', '2021-12-26', '2021-12-27 03:25:25', '0000-00-00', '0', 'TN76P9668', '0', '', '0', 0, 0, 940),
(1084, 'Etios', '221', '7010822940', 'SITHICK S', 'MOUND ROAD ', '2021-12-24 10:16:44', '2021-12-24', '2021-12-25 02:36:10', '0000-00-00', '0', 'TN05BF9020', '0', '', '0', 0, 0, 1825),
(1085, 'Etios', '223', '6383742273', 'ANANDHA KUMAR M ', 'KUDIURUPPU ', '2021-12-24 10:16:49', '2021-12-26', '2021-12-27 03:25:30', '0000-00-00', '0', 'TN85A4875', '0', '', '0', 0, 0, 1660),
(1086, 'Indica', '102', '9500459428', 'MARIDURAI ', 'MELAPATTAKURICHI', '2021-12-24 10:16:55', '2021-12-24', '2021-12-25 02:36:16', '0000-00-00', '0', 'TN18X2281', '0', '', '0', 0, 0, 1530),
(1087, 'Swift', '252', '9361163069', 'SELVAM M ', 'SENKOTTAI', '2021-12-24 10:17:11', '2021-12-24', '2021-12-25 02:36:21', '0000-00-00', '0', 'TN66AB5185', '0', '', '0', 0, 0, 2134),
(1088, 'Swift', '315', '9080770663', 'PRABAHARAN A', 'IDAIKAL', '2021-12-24 10:17:16', '2021-12-24', '2021-12-25 02:36:30', '0000-00-00', '0', 'TN09CH1769', '0', '', '0', 0, 0, 490),
(1089, 'Indica', '311', '9600778432', 'MOHAMMED HAJA ', 'KOTTAKULAM ', '2021-12-24 14:22:19', '2021-12-26', '2021-12-26 16:18:35', '0000-00-00', '0', 'TN22DF1526', '0', '', '0', 0, 0, 1660),
(1090, 'Tavera', '308', '9585425570', 'SANTHANAKUMAR M', 'KADAYAM', '2021-12-24 14:37:31', '2021-12-24', '2021-12-25 02:05:17', '0000-00-00', '0', 'TN18L3325', '0', '', '0', 0, 0, 730),
(1091, 'Swift', '254', '8903064210', 'ESAKKI PANDI ', 'MELAGARAM ', '2021-12-24 18:57:04', '2021-12-26', '2021-12-27 03:25:41', '0000-00-00', '0', 'TN11M6995', '0', '', '0', 0, 0, 700)
;
INSERT INTO `f_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout_date_new`, `logout`, `out_date`, `login_status`, `v_no`, `ontrip_status`, `status_assign`, `emp_login`, `hrsp_day`, `minscalc`, `trip_amount`) VALUES
(1352, 'Swift', '238', '8870871169', 'K ALLAHBIBTCHAI', 'NEW BUSTAND', '2022-02-08 09:46:25', '2022-02-09', '2022-02-10 03:07:36', '0000-00-00', '0', 'TN76AK0049', '0', '', '0', 0, 0, 1743),
(1353, 'Indica', '102', '9500459428', 'MARIDURAI ', 'MELAPATTAKURICHI', '2022-02-08 09:46:31', '2022-02-08', '2022-02-09 03:29:49', '0000-00-00', '0', 'TN18X2281', '0', '', '0', 0, 0, 1573),
(1354, 'Zest', '104', '9043389982', 'MOHAMMD SHIEK MOHAIDEEN ', 'SENKOTTAI', '2022-02-08 09:46:39', '2022-02-09', '2022-02-10 03:07:42', '0000-00-00', '0', 'TN07CP7560', '0', '', '0', 0, 0, 470),
(1355, 'Swift', '315', '9080770663', 'PRABAHARAN A', 'IDAIKAL', '2022-02-08 09:47:15', '2022-02-08', '2022-02-09 06:04:22', '0000-00-00', '0', 'TN09CH1769', '0', '', '0', 0, 0, 2555),
(1356, 'Swift', '258', '9677916977', 'NAGARAJAN', 'TENKASI', '2022-02-08 09:54:02', '2022-02-08', '2022-02-09 03:29:56', '0000-00-00', '0', 'TN09CS6381', '0', '', '0', 0, 0, 1530),
(1357, 'Swift', '256', '9442081303', 'MANIKANDAN M ', 'CUTTRALAM', '2022-02-09 04:39:06', '2022-02-09', '2022-02-10 03:07:47', '0000-00-00', '0', 'TN76P9668', '0', '', '0', 0, 0, 3170),
(1358, 'Swift', '230', '6381666478', 'SANKARALINGAM A ', 'TENKASI', '2022-02-09 04:39:13', '2022-02-09', '2022-02-10 03:07:57', '0000-00-00', '0', 'TN67BF2350', '0', '', '0', 0, 0, 5420),
(1359, 'Swift', '254', '8903064210', 'ESAKKI PANDI ', 'MELAGARAM ', '2022-02-09 06:53:55', '2022-02-09', '2022-02-10 03:08:04', '0000-00-00', '0', 'TN11M6995', '0', '', '0', 0, 0, 1590),
(1360, 'Xcent', '260', '9585425570', 'SANTHANAKUMAR M', 'TENKASI', '2022-02-09 06:54:02', '2022-02-09', '2022-02-10 03:08:09', '0000-00-00', '0', 'TN12W6058', '0', '', '0', 0, 0, 1805),
(1361, 'Xylo', '310', '9944615079', 'kannan', 'MATHALAMPARAI', '2022-02-09 06:54:07', '2022-02-09', '2022-02-10 03:08:16', '0000-00-00', '0', 'TN10BE9959', '0', '', '0', 0, 0, 1400)
;
INSERT INTO `f_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout_date_new`, `logout`, `out_date`, `login_status`, `v_no`, `ontrip_status`, `status_assign`, `emp_login`, `hrsp_day`, `minscalc`, `trip_amount`) VALUES
(1623, 'Swift', '238', '8870871169', 'K ALLAHBIBTCHAI', 'NEW BUSTAND', '2022-03-18 09:29:45', '2022-03-18', '2022-03-19 06:55:59', '0000-00-00', '0', 'TN76AK0049', '0', '', '0', 0, 0, 1535),
(1624, 'Zest', '104', '9043389982', 'MOHAMMD SHIEK MOHAIDEEN ', 'SENKOTTAI', '2022-03-18 09:29:50', '2022-03-19', '2022-03-20 04:43:46', '0000-00-00', '0', 'TN07CP7560', '0', '', '0', 0, 0, 3946),
(1625, '', '258', '', '', '', '2022-03-18 09:30:42', '2022-03-18', '2022-03-18 16:31:22', '0000-00-00', '0', '', '0', '', '0', 0, 0, 0),
(1626, 'Swift', '258', '9677916977', 'NAGARAJAN', 'TENKASI', '2022-03-18 09:31:33', '2022-03-20', '2022-03-20 21:43:28', '0000-00-00', '0', 'TN09CS6381', '0', '', '0', 0, 0, 1555),
(1627, 'Xylo', '310', '9944615079', 'kannan', 'MATHALAMPARAI', '2022-03-18 09:32:01', '2022-03-18', '2022-03-19 03:48:53', '0000-00-00', '0', 'TN10BE9959', '0', '', '0', 0, 0, 3250),
(1628, 'Etios', '246', '8438811020', 'sathish', 'TENKASI', '2022-03-18 09:36:45', '2022-03-18', '2022-03-19 06:56:06', '0000-00-00', '0', 'TN67BY0952', '0', '', '0', 0, 0, 2230),
(1629, 'Etios', '221', '7010822940', 'SITHICK S', 'MOUND ROAD ', '2022-03-18 09:38:00', '2022-03-18', '2022-03-19 06:56:13', '0000-00-00', '0', 'TN05BF9020', '0', '', '0', 0, 0, 2370),
(1630, 'Etios', '221', '7010822940', 'SITHICK S', 'MOUND ROAD ', '2022-03-19 06:07:58', '2022-03-19', '2022-03-20 04:43:53', '0000-00-00', '0', 'TN05BF9020', '0', '', '0', 0, 0, 1905),
(1631, 'Swift', '207', '9597015898', 'VELMURUGAN T', 'PAVOORCHATHRAM', '2022-03-19 06:43:53', '2022-03-19', '2022-03-20 04:43:58', '0000-00-00', '0', 'TN22DE0874', '0', '', '0', 0, 0, 2180),
(1632, 'Xcent', '260', '9500659101', 'Rahman A', 'TENKASI', '2022-03-19 06:43:59', '2022-03-19', '2022-03-20 04:46:34', '0000-00-00', '0', 'TN12W6058', '0', '', '0', 0, 0, 570)
;
INSERT INTO `f_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout_date_new`, `logout`, `out_date`, `login_status`, `v_no`, `ontrip_status`, `status_assign`, `emp_login`, `hrsp_day`, `minscalc`, `trip_amount`) VALUES
(1894, 'Indica', '112', '9600778432', 'MOHAMMED HAJA ', 'TENKASI', '2022-04-22 09:33:26', '2022-04-22', '2022-04-23 02:44:22', '0000-00-00', '0', 'TN87 3659', '0', '', '0', 0, 0, 0),
(1895, 'Zest', '104', '9043389982', 'MOHAMMD SHIEK MOHAIDEEN ', 'SENKOTTAI', '2022-04-22 10:05:18', '2022-04-22', '2022-04-23 02:44:27', '0000-00-00', '0', 'TN07CP7560', '0', '', '0', 0, 0, 0),
(1896, 'Etios', '221', '7010822940', 'SITHICK S', 'MOUND ROAD ', '2022-04-22 10:36:53', '2022-04-22', '2022-04-23 02:44:33', '0000-00-00', '0', 'TN05BF9020', '0', '', '0', 0, 0, 0),
(1897, 'Swift', '230', '6381666478', 'SANKARALINGAM A ', 'TENKASI', '2022-04-22 18:54:41', '2022-04-25', '2022-04-26 02:48:01', '0000-00-00', '0', 'TN67BF2350', '0', '', '0', 0, 0, 1998),
(1898, 'Etios', '221', '7010822940', 'SITHICK S', 'MOUND ROAD ', '2022-04-23 09:11:11', '2022-04-23', '2022-04-24 02:18:40', '0000-00-00', '0', 'TN05BF9020', '0', '', '0', 0, 0, 1818),
(1899, 'Xcent', '260', '9500659101', 'Rahman A', 'TENKASI', '2022-04-23 09:18:52', '2022-04-23', '2022-04-24 02:18:46', '0000-00-00', '0', 'TN12W6058', '0', '', '0', 0, 0, 1237),
(1900, 'Tavera', '312', '8850186664', 'SUBASH ', 'MELAPATTAKURICHI', '2022-04-23 09:22:21', '2022-04-24', '2022-04-25 02:42:13', '0000-00-00', '0', 'TN76AD7797', '0', '', '0', 0, 0, 3420),
(1901, 'Swift', '238', '8870871169', 'K ALLAHBIBTCHAI', 'NEW BUSTAND', '2022-04-23 09:23:23', '2022-04-23', '2022-04-24 02:18:51', '0000-00-00', '0', 'TN76AK0049', '0', '', '0', 0, 0, 400),
(1902, 'Etios', '223', '6383742273', 'ANANDHA KUMAR M ', 'KUDIURUPPU ', '2022-04-23 09:23:31', '2022-04-23', '2022-04-24 02:18:58', '0000-00-00', '0', 'TN85A4875', '0', '', '0', 0, 0, 682),
(1903, 'Swift', '258', '9677916977', 'NAGARAJAN', 'TENKASI', '2022-04-23 09:23:39', '2022-04-25', '2022-04-26 02:47:22', '0000-00-00', '0', 'TN09CS6381', '0', '', '0', 0, 0, 1850)
;
INSERT INTO `f_login_status` (`id`, `v_type`, `id_emp`, `emp_mobile`, `emp_name`, `vacant_place`, `login_time`, `logout_date_new`, `logout`, `out_date`, `login_status`, `v_no`, `ontrip_status`, `status_assign`, `emp_login`, `hrsp_day`, `minscalc`, `trip_amount`) VALUES
(2165, 'Swift', '230', '6381666478', 'SANKARALINGAM A ', 'TENKASI', '2022-05-28 09:41:19', '2022-05-28', '2022-05-29 03:32:28', '0000-00-00', '0', 'TN67BF2350', '0', '', '0', 0, 0, 1037),
(2166, 'Etios', '221', '7010822940', 'SITHICK S', 'MOUND ROAD ', '2022-05-28 09:41:24', '2022-05-28', '2022-05-29 03:32:34', '0000-00-00', '0', 'TN05BF9020', '0', '', '0', 0, 0, 1800),
(2167, 'Swift', '262', '9500810010', 'ISAIARASAN', 'MATHALAMPARAI', '2022-05-28 09:41:30', '2022-05-28', '2022-05-29 03:32:40', '0000-00-00', '0', 'TN76AC6207', '0', '', '0', 0, 0, 1675),
(2168, 'Indica', '112', '8608751675', 'PRAVEEN KRISHNA', 'TENKASI', '2022-05-28 09:41:35', '2022-05-28', '2022-05-29 06:33:46', '0000-00-00', '0', 'TN87 3659', '0', '', '0', 0, 0, 2960),
(2169, 'Zest', '104', '9043389982', 'MOHAMMD SHIEK MOHAIDEEN ', 'SENKOTTAI', '2022-05-28 09:41:45', '2022-05-28', '2022-05-29 06:33:53', '0000-00-00', '0', 'TN07CP7560', '0', '', '0', 0, 0, 3462),
(2170, 'Swift', '222', '9500459428', 'N MARIDURAI', 'MELAPATTAKURICHI', '2022-05-28 09:41:51', '2022-05-28', '2022-05-29 03:32:46', '0000-00-00', '0', 'TN09CP3951', '0', '', '0', 0, 0, 3155),
(2171, 'Swift', '258', '9677916977', 'NAGARAJAN', 'TENKASI', '2022-05-28 09:42:46', '2022-05-28', '2022-05-29 03:32:52', '0000-00-00', '0', 'TN09CS6381', '0', '', '0', 0, 0, 1238),
(2172, 'Etios', '225', '8681943094', 'STEPHEN P', 'MATHALAMPARAI', '2022-05-28 10:33:17', '2022-05-28', '2022-05-29 03:33:04', '0000-00-00', '0', 'TN72BF4479', '0', '', '0', 0, 0, 646),
(2173, 'Swift', '238', '8870871169', 'K ALLAHBIBTCHAI', 'NEW BUSTAND', '2022-05-28 17:21:54', '2022-05-28', '2022-05-29 03:48:40', '0000-00-00', '0', 'TN76AK0049', '0', '', '0', 0, 0, 1290),
(2174, 'Indica', '115', '9600778432', 'KAJA', 'TENKASI', '2022-05-28 18:47:05', '2022-05-28', '2022-05-29 03:33:10', '0000-00-00', '0', 'TN22DF1526', '0', '', '0', 0, 0, 3390)
;

-- --------------------------------------------------------

--
-- Table structure for table `f_ontrip`
--

CREATE TABLE `f_ontrip` (
  `id` int(11) NOT NULL,
  `b_id` varchar(11) DEFAULT NULL,
  `bookin_time` timestamp NULL DEFAULT NULL,
  `p_date` date NOT NULL,
  `assign_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `p_city` varchar(55) DEFAULT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `v_id` varchar(11) DEFAULT NULL,
  `v_type` varchar(55) NOT NULL,
  `v_no` varchar(15) NOT NULL,
  `d_mobile` varchar(12) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `m_no` varchar(12) DEFAULT NULL,
  `t_type` varchar(10) NOT NULL,
  `ac_type` varchar(10) NOT NULL,
  `assign` enum('0','1') DEFAULT '0',
  `pickup_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closing_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `open_km` varchar(55) DEFAULT NULL,
  `closing_km` varchar(55) DEFAULT NULL,
  `new_opening` int(11) NOT NULL,
  `on_trip_status` enum('0','1') NOT NULL DEFAULT '0',
  `already_assign` varchar(10) NOT NULL,
  `to_whom` varchar(55) NOT NULL,
  `user_id` int(11) NOT NULL,
  `r_status` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_ontrip`
--

INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(1, '1', '2021-06-28 04:00:00', '2021-06-27', '0000-00-00 00:00:00', 'Tenkasi', 'Nellai', '100', 'Indica', 'TN010000', '9790427773', 'Jp', '9524522210', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1001', '1021', -1001, '0', '0', 'Public', 1, 'Out Station Tariff'),
(2, '5', '2021-06-28 17:19:00', '2021-06-28', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '101', 'Indica', 'TN72OX1989', '8608290090', 'Mr', '9003968836', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1001', '1100', -1001, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3, '6', '2021-06-28 20:05:00', '2021-06-28', '0000-00-00 00:00:00', 'Tenkasi', 'kadayanallut', '101', 'Indica', 'TN72OX1989', '8608290090', 'Mr', '9003968836', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1101', NULL, -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(4, '6', '2021-06-28 20:05:00', '2021-06-30', '0000-00-00 00:00:00', 'Tenkasi', 'kadayanallut', '100', 'Indica', 'TN010000', '9790427773', 'Mr', '9003968836', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, '0', '0', 'Public', 1, 'Out Station Tariff'),
(5, '7', '2021-06-30 18:47:00', '2021-06-30', '0000-00-00 00:00:00', 'Tenkasi', 'Nellai', '101', 'Indica', 'TN72OX1989', '8608290090', 'Sugu', '9080454742', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '1045', 0, '0', '0', 'Public', 1, 'Out Station Tariff'),
(6, '7', '2021-07-01 19:19:00', '2021-07-01', '0000-00-00 00:00:00', 'Tenkasi', 'Nellai', '100', 'Indica', 'TN010000', '9790427773', 'Sugu', '9080454742', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1025', '1045', -4, '0', '0', 'Public', 1, 'Out Station Tariff'),
(7, '10', '2021-07-01 22:18:00', '2021-07-01', '0000-00-00 00:00:00', 'PANAYANKURICHI', 'TENKASI', '232', 'Xcent', '', '', 'SIVAKUMAR', '9842622283', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '86259', '86333', -86259, '0', '0', 'Public', 2, 'Out Station Tariff'),
(8, '11', '2021-07-02 01:14:00', '2021-07-01', '0000-00-00 00:00:00', 'melagaram', 'Tirunelveli', '204', 'Swift', 'TN72BB6806', '8428916359', 'VINAYAGAM ', '7904974823', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '177523', '177646', -177523, '0', '0', 'Public', 2, 'Out Station Tariff'),
(9, '12', '2021-07-01 22:31:00', '2021-07-01', '0000-00-00 00:00:00', 'TENKASI', 'Tirunelveli', '311', 'Indica', 'TN22DF1526', '9600778432', 'SUNDAR', '9688927927', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '113433', '113551', -113433, '0', '0', 'Public', 2, 'Out Station Tariff'),
(10, '13', '2021-07-01 22:33:00', '2021-07-01', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '221', 'Etios', 'TN05BF9020', '7010822940', 'MARISELVAM', '9487148369', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '120745', '120861', -120745, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(182, '198', '2021-07-18 20:59:00', '2021-07-18', '0000-00-00 00:00:00', 'Tirunelveli', 'Melagaram (TP)', '204', 'Swift', 'TN72BB6806', '8428916359', 'SOMU', '8838130102', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '178954', '179080', -5, '0', '0', 'Public', 2, 'Out Station Tariff'),
(183, '199', '2021-07-18 16:37:00', '2021-07-18', '0000-00-00 00:00:00', 'Tenkasi', 'karaiyar', '230', 'Swift', 'TN67BF2350', '6381666478', 'MRs', '9677421319', '1', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '152004', '152104', -170, '0', '0', 'Public', 2, 'Out Station Tariff'),
(184, '200', '2021-07-18 18:07:00', '2021-07-18', '0000-00-00 00:00:00', 'Senkottai', 'Tiruchendur', '104', 'Zest', 'TN07CP7560', '9043389982', 'SANKAR ', '9894191247', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '138147', '138403', -110, '0', '0', 'Public', 2, 'Out Station Tariff'),
(185, '201', '2021-07-18 21:51:00', '2021-07-18', '0000-00-00 00:00:00', 'Tenkasi', 'Srivilliputhur', '102', 'Indica', 'TN18X2281', '9500459428', 'MURUGAN ', '9443428520', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '262265', '262441', -15, '0', '0', 'Public', 2, 'Out Station Tariff'),
(186, '203', '2021-07-18 22:38:00', '2021-07-18', '0000-00-00 00:00:00', 'tenkasi', 'mukkudal', '311', 'Indica', 'TN22DF1526', '9600778432', 'SUNDAR', '9688927927', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '136782', '136858', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(187, '204', '2021-07-18 23:41:00', '2021-07-18', '0000-00-00 00:00:00', 'TENKASI', 'TIRUNELVELI', '242', 'Swift', 'TN11AE8883', '8489967945', 'deepak', '9344087004', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '117544', '117664', -37, '0', '0', 'Public', 2, 'Out Station Tariff'),
(188, '205', '2021-07-19 01:08:00', '2021-07-18', '0000-00-00 00:00:00', 'PAPANASAM', 'KUDIURUPPU', '202', 'Swift', 'TN11K1737', '9987862378', 'MR', '9986001520', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '328289', '328361', -42, '0', '0', 'Public', 2, 'Out Station Tariff'),
(189, '202', '2021-07-19 17:03:00', '2021-07-18', '0000-00-00 00:00:00', 'TENKASI', 'TIRUNELVELI', '311', 'Indica', 'TN22DF1526', '9600778432', 'MAHARAJAN ', '9597492620', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '136870', '136985', -12, '0', '0', 'Public', 2, 'Out Station Tariff'),
(190, '206', '2021-07-19 17:03:00', '2021-07-18', '0000-00-00 00:00:00', 'TENKASI', 'SANKARANKOVIL', '102', 'Indica', 'TN18X2281', '9500459428', 'indra', '6381563533', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '262456', '262573', -15, '0', '0', 'Public', 2, 'Out Station Tariff'),
(191, '208', '2021-07-19 18:21:00', '2021-07-19', '0000-00-00 00:00:00', 'NAGARAM', 'TENKASI', '230', 'Swift', 'TN67BF2350', '6381666478', 'THAMARAIKANIRAJA', '8825802426', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '152117', '152192', -13, '0', '0', 'Public', 2, 'Out Station Tariff')
;AGARAM', 'Pirancheri', '238', 'Swift', 'TN76AK0049', '8870871169', 'MR', '9790579308', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '80871', '80992', -160, '0', '0', 'Public', 2, 'Out Station Tariff'),
(316, '341', '2021-08-07 17:26:00', '2021-08-07', '0000-00-00 00:00:00', 'TENKASI', 'MADURAI', '315', 'Swift', 'TN09CH1769', '9080770663', 'MOHAMMED ALI ', '9715865500', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '150481', '150854', -390, '0', '0', 'Public', 2, 'Out Station Tariff'),
(317, '339', '2021-08-07 17:26:00', '2021-08-07', '0000-00-00 00:00:00', 'TENKASI', 'Tharuvai', '311', 'Indica', 'TN22DF1526', '9600778432', 'PARVATHI', '8124288301', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '139735', '139870', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(318, '343', '2021-08-07 17:27:00', '2021-08-07', '0000-00-00 00:00:00', 'TENKASI', 'TIRUNELVELI', '208', 'Xcent', 'TN72BM2558', '9786649582', 'sivasumbaramian ', '9663216215', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '99925', '100037', -17, '0', '0', 'Public', 2, 'Out Station Tariff'),
(319, '342', '2021-08-08 01:54:00', '2021-08-07', '0000-00-00 00:00:00', 'TENKASI', 'TIRUNELVELI', '306', 'Tavera', 'TN02BJ7305', '7977162251', 'MR', '9791662781', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '178060', '178191', -4, '0', '0', 'Public', 2, 'Out Station Tariff'),
(320, '345', '2021-08-07 18:40:00', '2021-08-07', '0000-00-00 00:00:00', 'TENKASAI', 'Vasudevanur', '102', 'Indica', 'TN18X2281', '9500459428', 'MR', '7871598020', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '264087', '264173', -5, '0', '0', 'Public', 2, 'Out Station Tariff'),
(321, '346', '2021-08-07 18:10:00', '2021-08-07', '0000-00-00 00:00:00', 'KUDIURUPPU ', 'NAMAKKAL', '232', 'Xcent', 'TN72AM2245', '8838967010', 'Sobiya ', '7373854568', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '89860', '91027', -3, '0', '0', 'Public', 2, 'Out Station Tariff'),
(322, '347', '2021-08-08 01:56:00', '2021-08-07', '0000-00-00 00:00:00', 'Tenkasi ', 'Tenkasi (M)', '311', 'Indica', 'TN22DF1526', '9600778432', 'MR', '9994861757', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '139875', '139895', -5, '0', '0', 'Public', 2, 'Out Station Tariff'),
(323, '348', '2021-08-08 18:19:00', '2021-08-08', '0000-00-00 00:00:00', 'tenkasi', 'Thoothukkudi', '104', 'Zest', 'TN07CP7560', '9043389982', 'MR', '7550132420', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '139593', '139787', -478, '0', '0', 'Public', 2, 'Out Station Tariff'),
(324, '350', '2021-08-08 18:22:00', '2021-08-08', '0000-00-00 00:00:00', 'cuttralam', 'tenkasi', '223', 'Etios', 'TN85A4875', '6383742273', 'MR', '9999295627', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '169010', '169030', -252, '0', '0', 'Public', 2, 'Out Station Tariff'),
(325, '351', '2021-08-08 21:09:00', '2021-08-08', '0000-00-00 00:00:00', 'tenkasi', 'CUTTRALAM ', '221', 'Etios', 'TN05BF9020', '7010822940', 'selva ', '8610426138', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '123527', '123547', -14, '0', '0', 'Public', 2, 'Out Station Tariff'),
(326, '349', '2021-08-09 00:27:00', '2021-08-08', '0000-00-00 00:00:00', 'melagaram', 'tirunrlveli', '102', 'Indica', 'TN18X2281', '9500459428', 'MR', '7598119005', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '264202', '264370', -29, '0', '0', 'Public', 2, 'Out Station Tariff'),
(327, '352', '2021-08-08 21:06:00', '2021-08-08', '0000-00-00 00:00:00', 'tenkasi', 'tirunelveli', '240', 'Swift', 'TN72BP8991', '6379649008', 'fathima', '8489024161', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '60143', '60275', -69, '0', '0', 'Public', 2, 'Out Station Tariff'),
(328, '353', '2021-08-08 23:43:00', '2021-08-08', '0000-00-00 00:00:00', 'tenkasi', 'tirunelveli', '242', 'Swift', 'TN11AE8883', '9688779152', 'MARISELVAM', '9487148369', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '119541', '119665', -72, '0', '0', 'Public', 2, 'Out Station Tariff'),
(329, '354', '2021-08-09 04:00:00', '2021-08-08', '0000-00-00 00:00:00', 'Tenkasi ', 'Rajapayalam ', '', 'Indica', '', '', 'MR', '9344397762', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '140215', 0, '0', '0', 'Public', 2, 'Out Station Tariff'),
(330, '355', '2021-08-09 04:00:00', '2021-08-08', '0000-00-00 00:00:00', 'Tenkasi ', 'Rajapalayam ', '', 'Indica', '', '', 'MR', '9344397762', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, '0', '0', 'Public', 2, 'Out Station Tariff'),
(331, '354', '2021-08-09 16:54:00', '2021-08-09', '0000-00-00 00:00:00', 'Tenkasi ', 'Rajapayalam ', '311', 'Indica', 'TN22DF1526', '9600778432', 'MR', '9344397762', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '139910', '140215', -15, '0', '0', 'Public', 2, 'Out Station Tariff'),
(332, '356', '2021-08-09 16:58:00', '2021-08-09', '0000-00-00 00:00:00', 'tenkasi', 'tirunelveli', '102', 'Indica', 'TN18X2281', '9500459428', 'MR', '9750567942', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '264371', '264483', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(333, '357', '2021-08-09 16:58:00', '2021-08-09', '0000-00-00 00:00:00', 'TENKASAI', 'pavoorchathram', '221', 'Etios', 'TN05BF9020', '7010822940', 'MR', '9597686832', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '123549', '123571', -2, '0', '0', 'Public', 2, 'Out Station Tariff'),
(334, '358', '2021-08-10 00:12:00', '2021-08-09', '0000-00-00 00:00:00', 'tenkasi', 'rajapalayam', '230', 'Swift', 'TN67BF2350', '6381666478', 'RAMASWAMY ', '8778557641', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '154252', '154415', -75, '0', '0', 'Public', 2, 'Out Station Tariff'),
(335, '360', '2021-08-10 00:13:00', '2021-08-09', '0000-00-00 00:00:00', 'senkottai', 'tirunelveli', '223', 'Etios', 'TN85A4875', '6383742273', 'SANKAR ', '9894191247', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '169035', '169197', -5, '0', '0', 'Public', 2, 'Out Station Tariff'),
(336, '359', '2021-08-10 16:38:00', '2021-08-10', '0000-00-00 00:00:00', 'tenkasi', 'tirunelveli', '102', 'Indica', 'TN18X2281', '9500459428', 'saravanapandian ', '7904518864', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '264487', '264634', -4, '0', '0', 'Public', 2, 'Out Station Tariff'),
(337, '361', '2021-08-10 17:18:00', '2021-08-10', '0000-00-00 00:00:00', 'TENKASI', 'Tirunelveli', '221', 'Etios', 'TN05BF9020', '7010822940', 'nellaiyappan', '9442061998', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '123574', '123690', -3, '0', '0', 'Public', 2, 'Out Station Tariff'),
(338, '362', '2021-08-11 00:28:00', '2021-08-10', '0000-00-00 00:00:00', 'kattalaikudiruppu', 'tenkasi', '240', 'Indica', 'TN72BP8991', '6379649008', 'SUNDAR', '9688927927', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '60336', '60377', -61, '0', '0', 'Public', 2, 'Out Station Tariff'),
(339, '365', '2021-08-11 01:53:00', '2021-08-10', '0000-00-00 00:00:00', 'tenkasi', 'idaikal', '230', 'Swift', 'TN67BF2350', '6381666478', 'MR', '9489540229', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '154428', '154452', -13, '0', '0', 'Public', 2, 'Out Station Tariff'),
(340, '363', '2021-08-11 17:09:00', '2021-08-10', '0000-00-00 00:00:00', 'tenkasi', 'tirunelveli', '102', 'Indica', 'TN18X2281', '9500459428', 'mahalingam ', '9842116019', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '264637', '264752', -3, '0', '0', 'Public', 2, 'Out Station Tariff'),
(341, '364', '2021-08-11 17:06:00', '2021-08-11', '0000-00-00 00:00:00', 'melagaram', 'tirunelveli', '238', 'Indica', 'TN76AK0049', '8870871169', 'MR', '7010855053', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '81355', '81489', -363, '0', '0', 'Public', 2, 'Out Station Tariff'),
(342, '366', '2021-08-11 19:35:00', '2021-08-11', '0000-00-00 00:00:00', 'melagaram', 'tirunelveli', '240', 'Swift', 'TN72BP8991', '6379649008', 'MR', '9486103453', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '60435', '60554', -58, '0', '0', 'Public', 2, 'Out Station Tariff'),
(343, '367', '2021-08-11 17:05:00', '2021-08-11', '0000-00-00 00:00:00', 'pavoorchatram', 'tirunelveli', '230', 'Swift', 'TN67BF2350', '6381666478', 'MR', '9842533052', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '154477', '154607', -25, '0', '0', 'Public', 2, 'Out Station Tariff'),
(344, '368', '2021-08-11 17:07:00', '2021-08-11', '0000-00-00 00:00:00', 'tenkasi', 'papanasam ', '202', 'Swift', 'TN11K1737', '9987862378', 'MR', '9891495691', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '330505', '330583', -48, '0', '0', 'Public', 2, 'Out Station Tariff'),
(345, '369', '2021-08-11 17:06:00', '2021-08-11', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '322', 'Xylo', 'TN22DC0375', '8086964712', 'MR', '7305480251', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '145901', '145921', -523, '0', '0', 'Public', 2, 'Out Station Tariff'),
(346, '370', '2021-08-11 20:23:00', '2021-08-11', '0000-00-00 00:00:00', 'TENKASI', 'THOOTHUKUDI', '221', 'Etios', 'TN05BF9020', '7010822940', 'MANIKKARAJ', '7339448349', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '123694', '123918', -4, '0', '0', 'Public', 2, 'Out Station Tariff'),
(347, '371', '2021-08-11 20:25:00', '2021-08-11', '0000-00-00 00:00:00', 'TENKASI', 'TENKASI', '311', 'Indica', 'TN22DF1526', '9600778432', 'DR JANANI ', '9150392679', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '140225', '140245', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(348, '372', '2021-08-11 21:56:00', '2021-08-11', '0000-00-00 00:00:00', 'TENKASI', 'TIRUNELVELI', '306', 'Tavera', 'TN02BJ7305', '7977162251', 'MARISELVAM', '9487148369', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '178220', '178325', -29, '0', '0', 'Public', 2, 'Out Station Tariff'),
(349, '373', '2021-08-12 16:46:00', '2021-08-12', '0000-00-00 00:00:00', 'melagaram', 'tirunelveli', '246', 'Etios', 'TN67BY0952', '7418845990', 'VINAYAGAM ', '7904974823', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '220020', '220157', -844, '0', '0', 'Public', 2, 'Out Station Tariff'),
(350, '375', '2021-08-12 21:04:00', '2021-08-12', '0000-00-00 00:00:00', 'tenkasi', 'papanasam ', '202', 'Swift', 'TN11K1737', '9987862378', 'MR', '9891495691', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '330607', '330736', -24, '0', '0', 'Public', 2, 'Out Station Tariff');
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(351, '374', '2021-08-12 17:20:00', '2021-08-12', '0000-00-00 00:00:00', 'melagaram', 'puliyarai', '311', 'Indica', 'TN22DF1526', '9600778432', 'SUBRAMANIAN ', '9443086869', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '140255', '140290', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(352, '376', '2021-08-12 21:07:00', '2021-08-12', '0000-00-00 00:00:00', 'KUDIURUPPU ', 'tenkasi', '221', 'Etios', 'TN05BF9020', '7010822940', 'MANIKKARAJ', '7339448349', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '123930', '123950', -12, '0', '0', 'Public', 2, 'Out Station Tariff'),
(353, '379', '2021-08-12 22:27:00', '2021-08-12', '0000-00-00 00:00:00', 'TENKASI', 'TIREUNELVELI', '230', 'Swift', 'TN67BF2350', '6381666478', 'PRABU', '7904330817', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '154609', '154734', -2, '0', '0', 'Public', 2, 'Out Station Tariff'),
(354, '380', '2021-08-13 01:21:00', '2021-08-12', '0000-00-00 00:00:00', 'TIRUNELVELI', 'MELAGARAM', '311', 'Indica', 'TN22DF1526', '9600778432', 'MR', '7598119005', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '140430', '140600', -140, '0', '0', 'Public', 2, 'Out Station Tariff'),
(355, '381', '2021-08-12 22:56:00', '2021-08-12', '0000-00-00 00:00:00', 'TENKASI', 'KADAYAM ', '221', 'Etios', 'TN05BF9020', '7010822940', 'MR', '9698703838', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '123951', '123991', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(356, '377', '2021-08-13 17:10:00', '2021-08-12', '0000-00-00 00:00:00', 'tenkasi', 'Nazerath (TP)', '315', 'Etios', 'TN09CH1769', '9080770663', 'sivasumbaramian ', '9663216215', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '151289', '151491', -435, '0', '0', 'Public', 2, 'Out Station Tariff'),
(357, '382', '2021-08-13 17:09:00', '2021-08-12', '0000-00-00 00:00:00', 'melagaram ', 'virudhunagar', '230', 'Swift', 'TN67BF2350', '6381666478', 'SIVAKUMAR', '9442061823', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '154743', '155011', -9, '0', '0', 'Public', 2, 'Out Station Tariff'),
(358, '383', '2021-08-13 17:11:00', '2021-08-13', '0000-00-00 00:00:00', 'TENKASI', 'Sundaresapuram RF', '102', 'Indica', 'TN18X2281', '9500459428', '', '9150392679', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '264753', '264808', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(359, '384', '2021-08-13 17:10:00', '2021-08-13', '0000-00-00 00:00:00', 'VALLAM ', 'ERODE', '311', 'Indica', 'TN22DF1526', '9600778432', 'MR', '9385478223', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '140610', '141355', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(360, '385', '2021-08-13 17:11:00', '2021-08-13', '0000-00-00 00:00:00', 'TENKASI', 'TIRUNELVELI', '238', 'Swift', 'TN76AK0049', '8870871169', 'RAMASWAMY ', '8778557641', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '81648', '81808', -159, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(525, '562', '2021-08-29 18:42:00', '2021-08-29', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '208', 'Xcent', 'TN72BM2558', '9786649582', 'MARISELVAM', '9487178369', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '100896', '101010', -988, '0', '0', 'Public', 2, 'Out Station Tariff'),
(526, '563', '2021-08-29 19:34:00', '2021-08-29', '0000-00-00 00:00:00', 'Tenkasi', 'Senkottai', '250', 'Indigo', 'TN19AB9624', '9360171742', 'sureshbalaji', '8838387630', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '131994', '132008', -95, '0', '0', 'Public', 2, 'Out Station Tariff'),
(527, '564', '2021-08-29 23:56:00', '2021-08-29', '0000-00-00 00:00:00', 'Tenkasi', 'pavoorchathram', '308', 'Tavera', 'TN18L3325', '9585425570', 'MR', '8056490836', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '154160', '154175', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(528, '560', '2021-08-29 23:57:00', '2021-08-29', '0000-00-00 00:00:00', 'Tenkasi', 'Azhagiapandipuram', '238', 'Swift', 'TN76AK0049', '8870871169', 'GANESHAN ', '9442515889', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '84535', '84654', -6, '0', '0', 'Public', 2, 'Out Station Tariff'),
(529, '565', '2021-08-30 00:00:00', '2021-08-29', '0000-00-00 00:00:00', 'Tenkasi', 'Idaikal', '246', 'Etios', 'TN67BY0952', '7418845990', 'RAMRAJ', '6379224037', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '222146', '222170', -705, '0', '0', 'Public', 2, 'Out Station Tariff'),
(530, '566', '2021-08-30 00:42:00', '2021-08-29', '0000-00-00 00:00:00', 'tenkasi', 'tenkasi', '223', 'Etios', 'TN85A4875', '6383742273', 'sureshbalaji', '8838387630', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '171619', '171625', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(531, '567', '2021-08-30 16:15:00', '2021-08-30', '0000-00-00 00:00:00', 'Tenkasi', 'kalugumalai', '102', 'Indica', 'TN18X2281', '9500459428', 'MR', '9443870019', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '267516', '267647', -2, '0', '0', 'Public', 2, 'Out Station Tariff'),
(532, '568', '2021-08-30 16:15:00', '2021-08-30', '0000-00-00 00:00:00', 'tenkasi', 'Manur', '223', 'Etios', 'TN85A4875', '6383742273', 'karuppaiah', '9080961439', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '171631', '171770', -6, '0', '0', 'Public', 2, 'Out Station Tariff'),
(533, '569', '2021-08-30 20:27:00', '2021-08-30', '0000-00-00 00:00:00', 'Tenkasi', 'Tenkasi', '250', 'Indigo', 'TN19AB9624', '9360171742', 'MR', '9159623225', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '132055', '132056', -47, '0', '0', 'Public', 2, 'Out Station Tariff'),
(534, '571', '2021-08-31 01:54:00', '2021-08-30', '0000-00-00 00:00:00', 'achanpudur ', 'Tirunelveli', '204', 'Swift', 'TN72BB6806', '7397262554', 'MR', '6369968890', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '181700', '181874', -202, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(698, '748', '2021-09-13 21:32:00', '2021-09-13', '0000-00-00 00:00:00', 'pavoorchathram', 'Tenkasi', '221', 'Etios', 'TN05BF9020', '7010822940', 'SUBBAIAH', '9842533052', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '127177', '127197', -14, '0', '0', 'Public', 2, 'Out Station Tariff'),
(699, '749', '2021-09-13 23:10:00', '2021-09-13', '0000-00-00 00:00:00', 'melagaram', 'v k puram ', '311', 'Indica', 'TN22DF1526', '9600778432', 'MR', '8838504508', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '144820', '144890', -8, '0', '0', 'Public', 2, 'Out Station Tariff'),
(700, '747', '2021-09-14 16:37:00', '2021-09-13', '0000-00-00 00:00:00', 'Kadapogathi', 'Tirunelveli', '311', 'Indica', 'TN22DF1526', '9600778432', 'chellaiah ', '9159442050', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '144900', '145024', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(701, '751', '2021-09-14 16:37:00', '2021-09-14', '0000-00-00 00:00:00', 'ilanji', 'sankarankovil', '308', 'Tavera', 'TN18L3325', '9585425570', 'MR', '9442113146', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '156574', '156671', -135, '0', '0', 'Public', 2, 'Out Station Tariff'),
(702, '752', '2021-09-14 16:37:00', '2021-09-14', '0000-00-00 00:00:00', 'nagarcoil', 'KUDIURUPPU', '221', 'Etios', 'TN05BF9020', '7010822940', 'MANIKKARAJ', '7339448349', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '127223', '127519', -26, '0', '0', 'Public', 2, 'Out Station Tariff'),
(703, '753', '2021-09-14 16:55:00', '2021-09-14', '0000-00-00 00:00:00', 'ilanji', 'Tirunelveli', '238', 'Swift', 'TN76AK0049', '8870871169', 'MR', '9080869061', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '86868', '87021', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(704, '750', '2021-09-15 00:05:00', '2021-09-14', '0000-00-00 00:00:00', 'melagaram', 'Thoothukkudi', '230', 'Swift', 'TN67BF2350', '6381666478', 'ramachandran ', '9345462852', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '161507', '161732', -175, '0', '0', 'Public', 2, 'Out Station Tariff'),
(705, '754', '2021-09-15 14:12:00', '2021-09-14', '0000-00-00 00:00:00', 'surandai', 'satthur', '223', 'Etios', 'TN85A4875', '6383742273', 'praveen', '7550162708', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '173803', '174037', -26, '0', '0', 'Public', 2, 'Out Station Tariff'),
(706, '756', '2021-09-15 16:19:00', '2021-09-14', '0000-00-00 00:00:00', 'tenkasi', 'madurai', '250', 'Swift', 'TN19AB9624', '9489290278', 'mohammed ali', '9842707865', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '133602', '133950', -3, '0', '0', 'Public', 2, 'Out Station Tariff'),
(707, '758', '2021-09-15 19:30:00', '2021-09-14', '0000-00-00 00:00:00', 'tenkasi', 'Sundarapandiapuram', '238', 'Indica', 'TN76AK0049', '8870871169', 'MR', '9442614393', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '87022', '87004', -1, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(870, '924', '2021-10-05 02:09:00', '2021-10-04', '0000-00-00 00:00:00', 'melagaram', 'thiruvanandhapuram', '315', 'Indigo', 'TN09CH1769', '9080770663', 'MR', '8838659654', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '159017', '159247', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(871, '925', '2021-10-05 17:00:00', '2021-10-04', '0000-00-00 00:00:00', 'melagaram', 'Papanasam', '308', 'Tavera', 'TN18L3325', '9585425570', 'sujith', '9894486148', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '158808', '158879', -39, '0', '0', 'Public', 2, 'Out Station Tariff'),
(872, '926', '2021-10-05 19:31:00', '2021-10-04', '0000-00-00 00:00:00', 'melagaram', 'alalngulam', '306', 'Tavera', 'TN02BJ7305', '7977162251', 'MR', '9788011340', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1850100', '1850171', -1665019, '0', '0', 'Public', 2, 'Out Station Tariff'),
(873, '922', '2021-10-05 17:00:00', '2021-10-04', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '202', 'Swift', 'TN11K1737', '9987862378', 'MARISELVAM', '9487148369', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '338414', '338531', -17, '0', '0', 'Public', 2, 'Out Station Tariff'),
(874, '928', '2021-10-05 17:03:00', '2021-10-05', '0000-00-00 00:00:00', 'rettiyarpatti', 'pavoorchathram', '230', 'Swift', 'TN67BF2350', '6381666478', 'SUBBAIAH', '9842533052', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '166506', '166586', -333, '0', '0', 'Public', 2, 'Out Station Tariff'),
(875, '927', '2021-10-05 17:04:00', '2021-10-05', '0000-00-00 00:00:00', 'Tenkasi', 'kottarakarai', '230', 'Swift', 'TN67BF2350', '6381666478', 'MR', '8056774722', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '166587', '166769', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(876, '929', '2021-10-05 17:07:00', '2021-10-05', '0000-00-00 00:00:00', 'tenkasi', 'alwarkurichi', '311', 'Indica', 'TN22DF1526', '9600778432', 'mani', '8825832526', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '147573', '147623', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(877, '930', '2021-10-05 19:32:00', '2021-10-05', '0000-00-00 00:00:00', 'tenkasi', 'thiruchendur', '238', 'Swift', 'TN76AK0049', '8870871169', 'thirukumaran', '9500002142', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '90824', '91066', -16, '0', '0', 'Public', 2, 'Out Station Tariff'),
(878, '931', '2021-10-06 00:20:00', '2021-10-05', '0000-00-00 00:00:00', 'tenkasi', 'Tirunelveli', '250', 'Indigo', 'TN19AB9624', '9489290278', 'MARISELVAM', '9487148369', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '135908', '136020', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(879, '932', '2021-10-06 00:20:00', '2021-10-05', '0000-00-00 00:00:00', 'tenkasi', 'Senkottai', '221', 'Etios', 'TN05BF9020', '7010822940', 'MR', '9345116022', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '130018', '130050', -33, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(1040, '1108', '2021-10-27 17:08:00', '2021-10-26', '0000-00-00 00:00:00', 'Senkottai', 'Rajapalayam', '311', 'Indica', 'TN22DF1526', '9600778432', 'kannan ', '9488664452', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '149827', '149975', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1041, '1112', '2021-10-27 17:07:00', '2021-10-26', '0000-00-00 00:00:00', 'Tenkasi', 'thiruvanandhapuram', '104', 'Zest', 'TN07CP7560', '9043389982', 'MR', '7397275879', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '150660', '150943', -934, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1042, '1106', '2021-10-27 17:08:00', '2021-10-26', '0000-00-00 00:00:00', 'melagaram', 'Tirunelveli', '221', 'Swift', 'TN05BF9020', '7010822940', 'MR', '9790579308', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '132274', '132395', -15, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1043, '1111', '2021-10-27 17:08:00', '2021-10-27', '0000-00-00 00:00:00', 'vallam', 'cherai', '230', 'Swift', 'TN67BF2350', '6381666478', 'selva ', '9099015366', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '171297', '171429', -28, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1044, '1107', '2021-10-27 17:09:00', '2021-10-27', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '324', 'Xylo', 'TN79C1449', '8668013137', 'shiva', '7904077517', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '153454', '153594', -33, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1045, '1113', '2021-10-27 17:07:00', '2021-10-27', '0000-00-00 00:00:00', 'melagaram', 'Tiruchendur', '223', 'Etios', 'TN85A4875', '6383742273', 'MR', '8190037235', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '180542', '180772', -8, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1046, '1114', '2021-10-27 17:39:00', '2021-10-27', '0000-00-00 00:00:00', 'kk valasai', 'surandai', '238', 'Swift', 'TN76AK0049', '8870871169', 'MR', '9842687702', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '94878', '94921', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1047, '1115', '2021-10-27 22:27:00', '2021-10-27', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '223', 'Etios', 'TN85A4875', '6383742273', 'subramanian ', '9578204719', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '180778', '180880', -6, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1048, '1120', '2021-10-27 22:28:00', '2021-10-27', '0000-00-00 00:00:00', 'Tenkasi', 'Madurai', '104', 'Zest', 'TN07CP7560', '9043389982', 'MOHAMMED ALI ', '9715865500', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '150959', '151324', -16, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1049, '1118', '2021-10-27 22:28:00', '2021-10-27', '0000-00-00 00:00:00', 'edaiyarthavanai', 'kottakulam', '102', 'Indica', 'TN18X2281', '9500459428', 'MR', '9865258977', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '279890', '279944', -201, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(1208, '1296', '2021-11-15 17:33:00', '2021-11-14', '0000-00-00 00:00:00', 'Tenkasi', 'sankarankovil', '238', 'Swift', 'TN76AK0049', '8870871169', 'ramamnathan', '8792993758', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '98654', '98752', -4, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1209, '1295', '2021-11-15 17:32:00', '2021-11-14', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '104', 'Swift', 'TN07CP7560', '9043389982', 'ganapathy', '9442065333', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '155455', '155615', -845, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1210, '1297', '2021-11-15 17:32:00', '2021-11-14', '0000-00-00 00:00:00', 'melagaram', 'Kalingapatti', '102', 'Indica', 'TN18X2281', '9500459428', 'gomathi diffen ', '8778406386', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '282524', '282664', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1211, '1293', '2021-11-15 18:42:00', '2021-11-14', '0000-00-00 00:00:00', 'melagaram ', 'Vasudevanallur ', '311', 'Indica', 'TN22DF1526', '9600778432', 'MR', '9443613319', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '152395', '152479', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1212, '1299', '2021-11-15 17:37:00', '2021-11-15', '0000-00-00 00:00:00', 'Tenkasi', 'ambai', '308', 'Tavera', 'TN18L3325', '9585425570', 'MR', '9994759910', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '163071', '163154', -38, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1213, '1298', '2021-11-15 17:42:00', '2021-11-15', '0000-00-00 00:00:00', 'Tenkasi', 'Tharuvai', '221', 'Etios', 'TN05BF9020', '7010822940', 'indra ', '6379256141', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '135718', '135853', -113, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1214, '1300', '2021-11-15 17:39:00', '2021-11-15', '0000-00-00 00:00:00', 'melagaram', 'Tirunelveli', '250', 'Indigo', 'TN19AB9624', '9489290278', 'SAKTHI', '7397455451', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '140951', '141071', -12, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1215, '1301', '2021-11-16 01:34:00', '2021-11-15', '0000-00-00 00:00:00', 'Alangulam', 'Tenkasi', '308', 'Tavera', 'TN18L3325', '9585425570', 'MR', '9442287898', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '163156', '163219', -2, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1216, '1302', '2021-11-16 01:51:00', '2021-11-15', '0000-00-00 00:00:00', 'Tenkasi', 'pulankudiuruppu', '250', 'Indigo', 'TN19AB9624', '9489290278', 'MR', '7868840520', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '141074', '141106', -3, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1217, '1303', '2021-11-16 02:39:00', '2021-11-15', '0000-00-00 00:00:00', 'kudiuruppu ', 'kk valalsai', '311', 'Indica', 'TN22DF1526', '9600778432', 'MANIKKARAJ', '7339448349', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '152480', '152491', -1, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(1376, '1473', '2021-12-06 04:12:00', '2021-12-05', '0000-00-00 00:00:00', 'Tenkasi', 'tenkasi local', '311', 'Indica', 'TN22DF1526', '9600778432', 'MR', '9442330333', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '152966', '152986', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1377, '1471', '2021-12-06 17:13:00', '2021-12-06', '0000-00-00 00:00:00', 'Idaikal', 'Thoothukudi', '238', 'Zest', 'TN76AK0049', '8870871169', 'vijayakumar', '9688383999', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '102208', '102482', -2243, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1378, '1474', '2021-12-06 17:14:00', '2021-12-06', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '311', 'Indica', 'TN22DF1526', '9600778432', 'MR', '8248862637', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '152987', '153115', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1379, '1475', '2021-12-06 20:02:00', '2021-12-06', '0000-00-00 00:00:00', 's kovil ', 'Tenkasi', '102', 'Indica', 'TN18X2281', '9500459428', 'MR', '9976007060', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '284796', '284888', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1380, '1476', '2021-12-06 17:14:00', '2021-12-06', '0000-00-00 00:00:00', 'Tenkasi', 'puliyankudi', '252', 'Swift', 'TN66AB5185', '9361163069', 'karuppaiah', '9080961439', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '52491', '52552', -35, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1381, '1477', '2021-12-06 19:44:00', '2021-12-06', '0000-00-00 00:00:00', 'Tenkasi', 'kadayanallur', '250', 'Indigo', 'TN19AB9624', '9489290278', 'mathiarasan', '8668173234', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '143562', '143594', -7, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1382, '1478', '2021-12-06 20:01:00', '2021-12-06', '0000-00-00 00:00:00', 'Tenkasi', 'pathananthitta', '254', 'Swift', 'TN11M6995', '8903064210', 'AKSHAYA KUMAR ', '8754080355', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '149021', '149321', -37, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1383, '1479', '2021-12-06 21:01:00', '2021-12-06', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '223', 'Swift', 'TN85A4875', '6383742273', 'MR', '9842132442', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '187426', '187563', -169, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1384, '1480', '2021-12-06 22:03:00', '2021-12-06', '0000-00-00 00:00:00', 'Tenkasi', 'Kayalpattinam', '256', 'Swift', 'TN76P9668', '9442081303', 'sheick', '9894676119', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '221637', '221865', -12, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1385, '1483', '2021-12-07 16:48:00', '2021-12-07', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '104', 'Swift', 'TN07CP7560', '9043389982', 'mono ', '8838273764', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '158639', '158773', -42, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(1550, '1666', '2021-12-22 02:03:00', '2021-12-21', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '311', 'Indica', 'TN22DF1526', '9600778432', 'velladurai', '9384943977', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '155400', '155400', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1551, '1667', '2021-12-21 17:16:00', '2021-12-21', '0000-00-00 00:00:00', 'Tenkasi', 'cuttrallam', '256', 'Swift', 'TN76P9668', '9442081303', 'vaikundam', '9842687702', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '223444', '223474', -15, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1552, '1670', '2021-12-22 02:38:00', '2021-12-21', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '230', 'Swift', 'TN67BF2350', '6381666478', 'sankar boi', '9791473647', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '183348', '183460', -6, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1553, '1671', '2021-12-22 02:38:00', '2021-12-21', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '256', 'Swift', 'TN76P9668', '9442081303', 'subramanian ', '9578204719', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '223479', '223614', -5, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1554, '1672', '2021-12-22 16:05:00', '2021-12-21', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '223', 'Swift', 'TN85A4875', '6383742273', 'vaikundam', '9842687702', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '189633', '189753', -8, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1556, '1674', '2021-12-22 16:05:00', '2021-12-22', '0000-00-00 00:00:00', 'Tenkasi', 'trichy', '311', 'Indica', 'TN22DF1526', '9600778432', 'RR ', '9500753063', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '155401', '156031', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1557, '1675', '2021-12-22 18:09:00', '2021-12-22', '0000-00-00 00:00:00', 'kudiuruppu', 'Tirunelveli', '308', 'Tavera', 'TN18L3325', '9585425570', 'Sobiya ', '7373854568', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '166396', '166572', -21, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1558, '1668', '2021-12-23 01:10:00', '2021-12-22', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '102', 'Indica', 'TN18X2281', '9500459428', 'valarmathi', '6382539860', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '286431', '286562', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1559, '1680', '2021-12-23 17:21:00', '2021-12-22', '0000-00-00 00:00:00', 'Elathur', 'Tirunelveli', '306', 'Tavera', 'TN02BJ7305', '7977162251', 'raja', '9840230847', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1855200', '1855386', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1560, '1681', '2021-12-23 17:22:00', '2021-12-23', '0000-00-00 00:00:00', 'Tenkasi', 'Idaikal', '238', 'Swift', 'TN76AK0049', '8870871169', 'MR', '9944758507', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '184501', '184542', -84536, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(1726, '1852', '2022-01-08 20:57:00', '2022-01-08', '0000-00-00 00:00:00', 'kudiuruppu ', 'Virudhunagar', '221', 'Etios', 'TN05BF9020', '7010822940', 'MANIKKARAJ', '7339448349', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '142470', '142738', -438, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1727, '1854', '2022-01-09 01:02:00', '2022-01-08', '0000-00-00 00:00:00', 'Tirunelveli', 'melagaram', '104', 'Swift', 'TN07CP7560', '9043389982', 'MARIAPPAN', '9944838346', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '163454', '163584', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1729, '1856', '2022-01-09 01:01:00', '2022-01-08', '0000-00-00 00:00:00', 'Tenkasi', 'Idaikal', '315', 'Swift', 'TN09CH1769', '9080770663', 'MR', '9487917497', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '173691', '173766', -179, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1730, '1857', '2022-01-09 01:49:00', '2022-01-08', '0000-00-00 00:00:00', 'Tenkasi', 'Idaikal', '246', 'Etios', 'TN67BY0952', '7418845990', 'RAMRAJ', '9345970314', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '237005', '237026', -8, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1731, '1853', '2022-01-09 20:44:00', '2022-01-09', '0000-00-00 00:00:00', 'ambai', 'Tenkasi', '238', 'Swift', 'TN76AK0049', '8870871169', 'MR', '8667297889', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '186687', '107684', -86722, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1732, '1858', '2022-01-09 18:00:00', '2022-01-09', '0000-00-00 00:00:00', 'Tenkasi ', 'Madurai ', '246', 'Etios', 'TN67BY0952', '7418845990', 'SENTHIL ', '9535204947', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '237035', '237346', -9, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1733, '1859', '2022-01-10 02:42:00', '2022-01-09', '0000-00-00 00:00:00', 'Tenkasi ', 'Alapuzha ', '221', 'Etios', 'TN05BF9020', '7010822940', 'SIVAKUMAR', '9442061823', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '142749', '143049', -11, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1734, '1860', '2022-01-09 20:43:00', '2022-01-09', '0000-00-00 00:00:00', 'Tenkasi ', 'Kadayam ', '223', 'Etios', 'TN85A4875', '6383742273', '', '9791663654', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '192391', '192445', -3, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1735, '1862', '2022-01-10 00:28:00', '2022-01-09', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '223', 'Etios', 'TN85A4875', '6383742273', 'Mr', '9150368329', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '192446', '192581', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1738, '1867', '2022-01-10 17:15:00', '2022-01-09', '0000-00-00 00:00:00', 'Melagaram ', 'Tirunelveli ', '238', 'Indica', 'TN76AK0049', '8870871169', 'Rathinavel ', '9486106750', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '186687', '186820', -86722, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(1897, '2036', '2022-01-27 16:44:00', '2022-01-27', '0000-00-00 00:00:00', 'Melagaram ', 'Tirunelveli ', '104', 'Zest', 'TN07CP7560', '9043389982', 'VINAYAGAM ', '7904974823', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '167363', '167534', -18, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1898, '2037', '2022-01-28 02:45:00', '2022-01-27', '0000-00-00 00:00:00', 'Kottakulam', 'ambai', '306', 'Tavera', 'TN02BJ7305', '7977162251', 'siva financial', '9003749393', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1857599', '1857727', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1899, '2038', '2022-01-27 19:32:00', '2022-01-27', '0000-00-00 00:00:00', 'kk valasai', 's kovil', '246', 'Swift', 'TN67BY0952', '8438811020', 'meena', '8903402770', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '239444', '239528', -50, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1900, '2006', '2022-01-28 02:45:00', '2022-01-27', '0000-00-00 00:00:00', 'melagaram', 'valparai', '308', 'Tavera', 'TN18L3325', '9585425570', 'esakki', '8122126319', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '171702', '172586', -320, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1901, '2039', '2022-01-28 02:53:00', '2022-01-27', '0000-00-00 00:00:00', 'Tenkasi', 'kadayanallur', '221', 'Etios', 'TN05BF9020', '7010822940', 'popular medical', '8778747281', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '144155', '144192', -1106, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1902, '2040', '2022-01-28 16:45:00', '2022-01-27', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '221', 'Swift', 'TN05BF9020', '7010822940', 'karthick', '8870704438', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '144204', '144329', -12, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1903, '2042', '2022-01-28 17:00:00', '2022-01-28', '0000-00-00 00:00:00', 'Tenkasi', 'pavoorchatram', '102', 'Indica', 'TN18X2281', '9500459428', 'mani', '8825832526', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '289745', '289793', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1904, '2043', '2022-01-28 18:17:00', '2022-01-28', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '310', 'Xylo', 'TN10BE9959', '9944615079', 'shiva', '7904077517', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '105978', '106118', -321, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1905, '2044', '2022-01-28 18:17:00', '2022-01-28', '0000-00-00 00:00:00', 'Panpoli', 'Tirunelveli', '112', 'Indica', 'TN87 3659', '9600778432', 'MR', '9894057909', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '138779', '138913', -123, '0', '0', 'Public', 2, 'Out Station Tariff'),
(1906, '2045', '2022-01-28 18:17:00', '2022-01-28', '0000-00-00 00:00:00', 'melagaram', 'surandai', '246', 'Etios', 'TN67BY0952', '8438811020', 'GANESHAN ', '9442515889', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '239536', '239574', -8, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(2066, '2230', '2022-02-13 20:29:00', '2022-02-13', '0000-00-00 00:00:00', 'Tenkasi', 'alalngulam', '230', 'Indica', 'TN67BF2350', '6381666478', 'mr', '6381666478', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '193246', '193325', -107, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2068, '2232', '2022-02-14 02:33:00', '2022-02-13', '0000-00-00 00:00:00', 'melagaram', 'chathram', '308', 'Tavera', 'TN18L3325', '9585425570', 'MAHARASI', '9865630263', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '174135', '174163', -112, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2069, '2235', '2022-02-14 01:54:00', '2022-02-13', '0000-00-00 00:00:00', 'tenkasi', 'Idaikal', '230', 'Indica', 'TN67BF2350', '6381666478', 'RAMRAJ', '9345970314', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '193327', '193347', -2, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2070, '2236', '2022-02-14 17:31:00', '2022-02-14', '0000-00-00 00:00:00', 'Tenkasi', 's kovil', '258', 'Indica', 'TN09CS6381', '9677916977', 'karuppaiah', '9080961439', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '136373', '136493', -255, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2071, '2227', '2022-02-14 17:34:00', '2022-02-14', '0000-00-00 00:00:00', 'Minnal Nagar', 'Tirunelveli', '260', 'Indica', 'TN12W6058', '9585425570', 'SAI BOOK CENTER', '9788928039', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '127758', '128004', -8, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2072, '2231', '2022-02-14 17:32:00', '2022-02-14', '0000-00-00 00:00:00', 'melagaram', 'Tirunelveli', '230', 'Indica', 'TN67BF2350', '6381666478', 'VINAYAGAM ', '7904974823', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '193365', '193484', -18, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2073, '2233', '2022-02-14 17:30:00', '2022-02-14', '0000-00-00 00:00:00', 'minnagar', 'Tirunelveli', '256', 'Indica', 'TN76P9668', '9442081303', 'kannan ', '9677704989', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '228674', '228799', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2074, '2190', '2022-02-14 17:26:00', '2022-02-14', '0000-00-00 00:00:00', 'melagaram', 'Tirunelveli', '221', 'Indica', 'TN05BF9020', '7010822940', 'GANESHAN ', '9486615708', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '145902', '146071', -35, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2075, '2223', '2022-02-14 17:33:00', '2022-02-14', '0000-00-00 00:00:00', 'cuttralam', 'Tirunelveli', '238', 'Indica', 'TN76AK0049', '8870871169', 'm r rajendran ', '9976750384', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '188046', '188197', -88081, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2076, '2221', '2022-02-14 17:32:00', '2022-02-14', '0000-00-00 00:00:00', 'Kadapogathi', 'Tirunelveli', '112', 'Indica', 'TN87 3659', '9600778432', 'chellaiah ', '9159442050', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '141353', '141475', -24, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(2237, '2434', '2022-03-03 23:29:00', '2022-03-03', '0000-00-00 00:00:00', 'melagaram', 'cuttralam', '104', 'Indica', 'TN07CP7560', '9043389982', 'MR', '9942948294', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '171681', '171702', -474, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2238, '2435', '2022-03-04 18:11:00', '2022-03-04', '0000-00-00 00:00:00', 'kudiuruppu', 'ambai', '258', 'Indica', 'TN09CS6381', '9677916977', 'bagavathy', '8838189637', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '138776', '138868', -17, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2239, '2437', '2022-03-04 18:11:00', '2022-03-04', '0000-00-00 00:00:00', 'tenkasi', 'AMBASAMUDRAM', '112', 'Indica', 'TN87 3659', '9600778432', 'somasundaram ', '9442329546', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '143726', '143802', -6, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2240, '2440', '2022-03-04 18:00:00', '2022-03-04', '0000-00-00 00:00:00', 'Kadapogathi', 'ambai', '260', 'Indica', 'TN12W6058', '9500659101', 'suresh', '7358469033', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '130292', 0, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2241, '2440', '2022-03-04 18:00:00', '2022-03-04', '0000-00-00 00:00:00', 'Kadapogathi', 'ambai', '260', 'Indica', 'TN12W6058', '9500659101', 'suresh', '7358469033', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '130292', 0, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2242, '2440', '2022-03-04 18:13:00', '2022-03-04', '0000-00-00 00:00:00', 'Kadapogathi', 'ambai', '260', 'Indica', 'TN12W6058', '9500659101', 'suresh', '7358469033', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '130214', '130292', -15, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2243, '2438', '2022-03-04 18:14:00', '2022-03-04', '0000-00-00 00:00:00', 'Senkottai', 'Kayalpattinam', '308', 'Indica', 'TN18L3325', '9585425570', 'nijam', '8524065551', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '176551', '176823', -51, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2244, '2442', '2022-03-04 18:15:00', '2022-03-04', '0000-00-00 00:00:00', 'Keelapuliyur ', 'Thoothukkudi', '230', 'Indica', 'TN67BF2350', '6381666478', 'PRINCE ', '7397451996', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '196503', '196750', -539, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2245, '2441', '2022-03-04 18:16:00', '2022-03-04', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '310', 'Indica', 'TN10BE9959', '9944615079', 'MR', '9840425121', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '110154', '110314', -34, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2246, '2443', '2022-03-04 18:18:00', '2022-03-04', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '238', 'Indica', 'TN76AK0049', '8870871169', 'indra ', '6379256141', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '189256', '189415', -89291, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(2403, '2633', '2022-03-16 17:38:00', '2022-03-16', '0000-00-00 00:00:00', 'melagaram', 'Tenkasi', '258', 'Indica', 'TN09CS6381', '9677916977', 'guhanandhan', '9994242603', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '140569', '140576', -377, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2404, '2634', '2022-03-16 17:35:00', '2022-03-16', '0000-00-00 00:00:00', 'Tenkasi', 'Papanasam', '246', 'Indica', 'TN67BY0952', '8438811020', 'MR', '9865318868', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '245497', '245569', -23, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2405, '2636', '2022-03-16 18:04:00', '2022-03-16', '0000-00-00 00:00:00', 'Tenkasi', 'surandai', '112', 'Indica', 'TN87 3659', '9600778432', 'ABRAHAM ', '9443170091', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '145371', '145391', -21, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2406, '2638', '2022-03-16 18:48:00', '2022-03-16', '0000-00-00 00:00:00', 'Tenkasi', 'puliyangudi', '246', 'Indica', 'TN67BY0952', '8438811020', 'siva', '7402219811', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '245573', '245635', -4, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2407, '2640', '2022-03-17 02:02:00', '2022-03-16', '0000-00-00 00:00:00', 'Tirunelveli', 'Tenkasi', '258', 'Indica', 'TN09CS6381', '9677916977', 'Arunachalam ', '9003406154', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '140696', '140846', -120, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2408, '2639', '2022-03-17 17:31:00', '2022-03-17', '0000-00-00 00:00:00', 'Tenkasi', 'Madurai', '238', 'Indica', 'TN76AK0049', '8870871169', 'sethuraman', '8072852436', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '189691', '189691', -89726, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2409, '2644', '2022-03-17 18:25:00', '2022-03-17', '0000-00-00 00:00:00', 'tenkasi', 'Tirunelveli', '258', 'Indica', 'TN09CS6381', '9677916977', 'rengaraj', '9865055244', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '140916', '141042', -70, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2410, '2643', '2022-03-17 18:25:00', '2022-03-17', '0000-00-00 00:00:00', 'kudiuruppu', 'Sivakasi', '246', 'Indica', 'TN67BY0952', '8438811020', 'vallimayil', '9486378222', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '245651', '245873', -16, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2411, '2645', '2022-03-17 18:26:00', '2022-03-17', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '225', 'Indica', 'TN72BF4479', '8681943094', 'karuppaiah', '9080961439', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '258851', '258955', -19, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2412, '2646', '2022-03-17 18:28:00', '2022-03-17', '0000-00-00 00:00:00', 'tenkasi', 'Tirunelveli', '221', 'Indica', 'TN05BF9020', '7010822940', 'siva  auto', '9965768185', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '150125', '150125', -1, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(2568, '2796', '2022-03-28 17:27:00', '2022-03-28', '0000-00-00 00:00:00', 'Tenkasi', 'Senkottai', '258', 'Indica', 'TN09CS6381', '9677916977', 'mohammed ali', '9842707865', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '143229', '143251', -5, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2569, '2799', '2022-03-28 15:30:00', '2022-03-28', '0000-00-00 00:00:00', 'Melagaram ', 'Tirunelveli ', '260', 'Indica', 'TN12W6058', '9500659101', 'lakshmanan', '9894309845', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '190549', 0, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2570, '2799', '2022-03-28 17:26:00', '2022-03-28', '0000-00-00 00:00:00', 'Melagaram ', 'Tirunelveli ', '238', 'Indica', 'TN76AK0049', '8870871169', 'lakshmanan', '9894309845', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '190417', '190549', -90452, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2571, '2801', '2022-03-28 17:26:00', '2022-03-28', '0000-00-00 00:00:00', 'Tenkasi ', 'Thiruparankundram ', '104', 'Indica', 'TN07CP7560', '9043389982', 'MUTHUKUMAR', '9443519988', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '177037', '177351', -36, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2572, '2798', '2022-03-28 17:27:00', '2022-03-28', '0000-00-00 00:00:00', 'Tenkasi ', 'Tirunelveli ', '260', 'Indica', 'TN12W6058', '9500659101', 'Rafeek ', '9500274363', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '133860', '133985', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2573, '2800', '2022-03-28 17:28:00', '2022-03-28', '0000-00-00 00:00:00', 'Tenkasi ', 'V k Puram ', '112', 'Indica', 'TN87 3659', '9600778432', 'ashok kumar', '9790762838', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '294779', '294779', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2574, '2802', '2022-03-28 17:28:00', '2022-03-28', '0000-00-00 00:00:00', 'Tenkasi', 'Papanasam', '308', 'Tavera', 'TN18L3325', '9585425570', 'MR', '9894936841', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '179141', '179211', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2575, '2803', '2022-03-28 18:57:00', '2022-03-28', '0000-00-00 00:00:00', 'Tenkasi', 'kelapavoor', '258', 'Indica', 'TN09CS6381', '9677916977', 'mani', '8608076979', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '143256', '143286', -5, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2576, '2805', '2022-03-28 22:13:00', '2022-03-28', '0000-00-00 00:00:00', 'Tirunelveli', 'melagaram', '207', 'Indica', 'TN22DE0874', '9597015898', 'vengatesh', '9840014494', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '145197', '145345', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2577, '2807', '2022-03-29 17:58:00', '2022-03-29', '0000-00-00 00:00:00', 'ilanji', 'Srivaikuntam', '102', 'Indica', 'TN18X2281', '9500459428', 'paramasivam', '6382974457', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '294390', '294595', -229, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(2735, '2985', '2022-04-14 16:57:00', '2022-04-14', '0000-00-00 00:00:00', 'Tenkasi', 'all falls ', '238', 'Swift', 'TN76AK0049', '8870871169', 'rajeshkannan', '9965628788', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '191042', '191132', -91077, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2736, '2983', '2022-04-14 18:05:00', '2022-04-14', '0000-00-00 00:00:00', 'Keelapuliyur ', 'Tirunelveli', '312', 'Tavera', 'TN76AD7797', '8850186664', 'ashoka kpr', '7708291281', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '180833', '181035', -335, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2737, '2987', '2022-04-14 16:58:00', '2022-04-14', '0000-00-00 00:00:00', 'Tenkasi ', 'Nagarcoil ', '225', 'Etios', 'TN72BF4479', '8681943094', '', '9626038821', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '262029', '262358', -11, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2738, '2986', '2022-04-14 16:56:00', '2022-04-14', '0000-00-00 00:00:00', 'Melagaram ', 'K kurichi', '230', 'Swift', 'TN67BF2350', '6381666478', 'SOMU', '8838130102', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '204256', '204358', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2739, '2989', '2022-04-15 02:45:00', '2022-04-14', '0000-00-00 00:00:00', 'kk valai', 'Avudaiyanoor', '112', 'Indica', 'TN87 3659', '9600778432', 'meena', '8903402770', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '295326', '295366', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2740, '2991', '2022-04-15 02:46:00', '2022-04-14', '0000-00-00 00:00:00', 'tenkasi', 'senkottai', '104', 'Indica', 'TN07CP7560', '9043389982', 'MR', '8861003135', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '180165', '180185', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2741, '2992', '2022-04-15 02:48:00', '2022-04-14', '0000-00-00 00:00:00', 'tenkasi', 'ambai', '238', 'Indica', 'TN76AK0049', '8870871169', 'AMBIKA', '6380142627', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '191133', '191203', -91168, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2742, '2993', '2022-04-15 17:54:00', '2022-04-15', '0000-00-00 00:00:00', 'TENKASI', 'Papankulam', '260', 'Indica', 'TN12W6058', '9500659101', '', '9488693739', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '136080', '136133', -27, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2743, '2988', '2022-04-15 18:31:00', '2022-04-15', '0000-00-00 00:00:00', 'Senkottai', 'Sankarankoil', '310', 'Xylo', 'TN10BE9959', '9944615079', 'MR', '9094019397', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '119058', '119162', -22, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2744, '2995', '2022-04-15 18:32:00', '2022-04-15', '0000-00-00 00:00:00', 'TENKASI', 'ambai', '207', 'Indica', 'TN22DE0874', '9597015898', 'ponraj', '9789940582', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '147495', '147581', -1, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(2900, '3184', '2022-05-03 23:38:00', '2022-05-03', '0000-00-00 00:00:00', 'Kuthukalvalasai', 'Vasudevanallur ', '232', 'Swift', 'TN10BB2763', '9789014183', 'MR', '8610195041', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '112752', '112847', -20619, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2901, '3187', '2022-05-04 01:40:00', '2022-05-03', '0000-00-00 00:00:00', 'melagaram', 'Senkottai', '238', 'Swift', 'TN76AK0049', '8870871169', 'MR', '9489054075', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '192220', '192220', -92255, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2902, '3182', '2022-05-04 16:42:00', '2022-05-04', '0000-00-00 00:00:00', 'Tenkasi', 'tiruvanandhapuram', '225', 'Etios', 'TN72BF4479', '8681943094', 'mohammed rafeek', '8637402336', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '264574', '264804', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2903, '3185', '2022-05-04 16:52:00', '2022-05-04', '0000-00-00 00:00:00', 'Idaikal', 'tiruvanandhapuram', '230', 'Swift', 'TN67BF2350', '6381666478', 'MR', '8608814236', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '207528', '207792', -27, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2904, '3186', '2022-05-04 16:54:00', '2022-05-04', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '112', 'Indica', 'TN87 3659', '9600778432', 'vaikundam', '9842687702', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '296090', '296236', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2905, '3188', '2022-05-04 16:54:00', '2022-05-04', '0000-00-00 00:00:00', 'Tenkasi', 'Papanasam', '223', 'Swift', 'TN85A4875', '6383742273', 'renuka', '9677421319', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '205492', '205590', -2, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2906, '3189', '2022-05-04 22:25:00', '2022-05-04', '0000-00-00 00:00:00', 'vallam', 'kollam', '225', 'Swift', 'TN72BF4479', '8681943094', 'dr selva ', '9099015366', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '264814', '265036', -10, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2907, '3192', '2022-05-04 16:54:00', '2022-05-04', '0000-00-00 00:00:00', 'melagaram', 'vk puram', '232', 'Swift', 'TN10BB2763', '9789014183', 'MR', '9600231371', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '112856', '112936', -20723, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2908, '3193', '2022-05-04 17:19:00', '2022-05-04', '0000-00-00 00:00:00', 'Tenkasi', 'Tirunelveli', '221', 'Indica', 'TN05BF9020', '7010822940', 'karuppaiah', '9080961439', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '155644', '155754', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(2909, '3194', '2022-05-04 16:53:00', '2022-05-04', '0000-00-00 00:00:00', 'melagaram', 'Tirunelveli', '238', 'Swift', 'TN76AK0049', '8870871169', 'SAI BOOK CENTER', '9788928039', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '192221', '192366', -92256, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(3065, '3376', '2022-05-19 17:33:00', '2022-05-19', '0000-00-00 00:00:00', 'melagaram', 'Tirunelveli', '258', 'Swift', 'TN09CS6381', '9677916977', 'MR', '9629111763', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '151255', '151386', -18, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3066, '3377', '2022-05-19 18:19:00', '2022-05-19', '0000-00-00 00:00:00', 'Tenkasi', 'sankarankovil', '262', 'Swift', 'TN76AC6207', '9500810010', 'renuka', '9677421319', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '170569', '170661', -26, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3067, '3378', '2022-05-19 19:43:00', '2022-05-19', '0000-00-00 00:00:00', 'tenkasi', 'surandai', '225', 'Swift', 'TN72BF4479', '8681943094', 'MR', '9952525034', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '267200', '267227', -23, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3068, '3345', '2022-05-19 23:15:00', '2022-05-19', '0000-00-00 00:00:00', 'melagaram', 'tiruvanandhapuram', '312', 'Tavera', 'TN76AD7797', '8850186664', 'sanjay', '9080831157', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '183772', '184042', -46, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3069, '3380', '2022-05-19 19:10:00', '2022-05-19', '0000-00-00 00:00:00', 'Tenkasi', 'tirumalaikovil', '230', 'Swift', 'TN67BF2350', '6381666478', 'MR', '9515157758', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '209638', '209666', -15, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3070, '3382', '2022-05-19 20:08:00', '2022-05-19', '0000-00-00 00:00:00', 'Tirunelveli', 'Tenkasi', '260', 'Indica', 'TN12W6058', '9500659101', 'MARI', '9894531444', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '139984', '140114', -3, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3071, '3385', '2022-05-19 23:38:00', '2022-05-19', '0000-00-00 00:00:00', 'Senkottai', 'tirumalaikovil', '225', 'Swift', 'TN72BF4479', '8681943094', 'suresh', '8056126427', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '267238', '267281', -11, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3072, '3387', '2022-05-20 00:01:00', '2022-05-19', '0000-00-00 00:00:00', 'Tenkasi', 'Krishnapuram', '112', 'Indica', 'TN87 3659', '9600778432', 'Dr janani', '9150392679', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '296837', '296883', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3073, '3388', '2022-05-20 01:13:00', '2022-05-19', '0000-00-00 00:00:00', 'Tenkasi', 'cuttralam', '258', 'Swift', 'TN09CS6381', '9677916977', 'MR', '8438031180', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '151428', '151464', -42, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3074, '3379', '2022-05-20 15:56:00', '2022-05-20', '0000-00-00 00:00:00', 'Kadapokathi ', 'Tirunelveli', '230', 'Swift', 'TN67BF2350', '6381666478', 'chellaiah ', '9159442050', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '209720', '209850', -54, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(3230, '3566', '2022-06-02 16:37:00', '2022-06-02', '0000-00-00 00:00:00', 'Tenkasi', 'all falls ', '258', 'Swift', 'TN09CS6381', '9677916977', 'RAMRAJ', '6379224037', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '154030', '154066', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3231, '3567', '2022-06-02 17:59:00', '2022-06-02', '0000-00-00 00:00:00', 'Tenkasi', 'Tharuvai', '225', 'Swift', 'TN72BF4479', '8681943094', 'VIJAYAKAMATCHI', '8124288301', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '269449', '269627', -548, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3232, '3568', '2022-06-02 18:38:00', '2022-06-02', '0000-00-00 00:00:00', 'melagaram', 'Tenkasi', '258', 'Swift', 'TN09CS6381', '9677916977', 'guhanandhan', '9994242603', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '154067', '154072', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3233, '3569', '2022-06-02 20:16:00', '2022-06-02', '0000-00-00 00:00:00', 'Tenkasi', 'Papanasam', '308', 'Tavera', 'TN18L3325', '9585425570', 'MR', '9443882956', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '187845', '187923', -6, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3234, '3570', '2022-06-02 20:41:00', '2022-06-02', '0000-00-00 00:00:00', 'Tenkasi', 'Sivakasi', '262', 'Swift', 'TN76AC6207', '9500810010', 'subbaiah tks', '6381517511', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '173150', '173357', -169, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3235, '3571', '2022-06-02 21:23:00', '2022-06-02', '0000-00-00 00:00:00', 'Virudhunagar', 'Tenkasi', '315', 'Swift', 'TN09CH1769', '9080770663', 'udaiya ramco', '9789224756', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '194522', '194782', -183, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3236, '3572', '2022-06-02 21:23:00', '2022-06-02', '0000-00-00 00:00:00', 'Tenkasi', 'surandai', '260', 'Swift', 'TN12W6058', '9500659101', 'CSC ', '8098998980', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '141972', '142072', -4, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3237, '3578', '2022-06-03 03:40:00', '2022-06-02', '0000-00-00 00:00:00', 'pavoorchatram', 'tenkasi', '308', 'Tavera', 'TN18L3325', '9585425570', 'MR', '9677526738', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '187924', '187944', -1, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3238, '3580', '2022-06-03 04:49:00', '2022-06-02', '0000-00-00 00:00:00', 'TENKASI', 'RAJAPALAYAM', '314', 'Xylo', 'TN76AA2944', '9500441461', 'RR ', '9500753063', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '158105', '158305', -158105, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3239, '3573', '2022-06-03 18:24:00', '2022-06-03', '0000-00-00 00:00:00', 'Tenkasi', 'Chinthamani', '238', 'Swift', 'TN76AK0049', '8870871169', 'ganapathy', '9442065333', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '194488', '194560', -94523, '0', '0', 'Public', 2, 'Out Station Tariff')
;
INSERT INTO `f_ontrip` (`id`, `b_id`, `bookin_time`, `p_date`, `assign_time`, `p_city`, `d_place`, `v_id`, `v_type`, `v_no`, `d_mobile`, `b_name`, `m_no`, `t_type`, `ac_type`, `assign`, `pickup_time`, `closing_time`, `open_km`, `closing_km`, `new_opening`, `on_trip_status`, `already_assign`, `to_whom`, `user_id`, `r_status`) VALUES
(3396, '3756', '2022-06-16 18:34:00', '2022-06-16', '0000-00-00 00:00:00', 'tenkasi', 'tirunelveli', '262', 'Swift', 'TN76AC6207', '9500810010', 'muthaiah', '9531804506', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '176349', '176485', -80, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3397, '3753', '2022-06-16 18:35:00', '2022-06-16', '0000-00-00 00:00:00', 'tenkasi', 'alankulam', '222', 'Swift', 'TN09CP3951', '9500459428', 'karuppaiah', '9080961439', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '69659', '69712', -2568, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3398, '3755', '2022-06-16 19:51:00', '2022-06-16', '0000-00-00 00:00:00', 'oormeniazhagiyan', 'tirunelveli', '260', 'Swift', 'TN12W6058', '9500659101', 'MR', '6379414520', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '143466', '143598', -24, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3399, '3754', '2022-06-16 18:35:00', '2022-06-16', '0000-00-00 00:00:00', 'tenkasi', 'Tirunelveli', '112', 'Indica', 'TN87 3659', '8608751675', 'MR', '9944147806', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '299578', '299713', -4, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3400, '3757', '2022-06-16 21:59:00', '2022-06-16', '0000-00-00 00:00:00', 'tenkasi', 'tirunelveli', '115', 'Indica', 'TN22DF1526', '9600778432', 'chithambaram', '9443582599', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '154699', '154814', -121, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3401, '3758', '2022-06-16 23:12:00', '2022-06-16', '0000-00-00 00:00:00', 'tenkasi', 'nagarcoil', '238', 'Swift', 'TN76AK0049', '8870871169', 'paulraj spp', '7904096570', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '195781', '196106', -95816, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3402, '3759', '2022-06-17 18:22:00', '2022-06-17', '0000-00-00 00:00:00', 'melagaram ', 'Tirunelveli', '262', 'Swift', 'TN76AC6207', '9500810010', 'danyarulsing', '9092463322', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '176511', '176655', -26, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3403, '3760', '2022-06-17 23:53:00', '2022-06-17', '0000-00-00 00:00:00', 'tenaksi', 'Rajapalayam', '222', 'Swift', 'TN09CP3951', '9500459428', 'MR', '9789714416', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '69733', '69883', -21, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3404, '3762', '2022-06-17 18:23:00', '2022-06-17', '0000-00-00 00:00:00', 'Tenkasi', 'Namakkal', '260', 'Xcent', 'TN12W6058', '9500659101', 'renuka', '9677421319', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '143600', '144246', -2, '0', '0', 'Public', 2, 'Out Station Tariff'),
(3405, '3763', '2022-06-17 19:37:00', '2022-06-17', '0000-00-00 00:00:00', 'Tenkasi', 'Tenkasi', '238', 'Swift', 'TN76AK0049', '8870871169', 'MR', '9345244684', '1', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '196107', '196326', -96142, '0', '0', 'Public', 2, 'Out Station Tariff')
;

-- --------------------------------------------------------

--
-- Table structure for table `f_ontrip_new`
--

CREATE TABLE `f_ontrip_new` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `bookin_time` timestamp NULL DEFAULT NULL,
  `p_date` date NOT NULL,
  `assign_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `p_city` varchar(55) DEFAULT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `v_id` varchar(11) DEFAULT NULL,
  `v_type` varchar(55) NOT NULL,
  `v_no` varchar(15) NOT NULL,
  `d_mobile` varchar(12) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `m_no` varchar(12) DEFAULT NULL,
  `t_type` varchar(10) NOT NULL,
  `ac_type` varchar(10) NOT NULL,
  `assign` enum('0','1') DEFAULT '0',
  `pickup_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closing_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `open_km` varchar(55) DEFAULT NULL,
  `closing_km` varchar(55) DEFAULT NULL,
  `new_opening` int(11) NOT NULL,
  `on_trip_status` enum('0','1') NOT NULL DEFAULT '0',
  `already_assign` varchar(10) NOT NULL,
  `to_whom` varchar(55) NOT NULL,
  `user_id` int(11) NOT NULL,
  `r_status` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `f_out_tariff`
--

CREATE TABLE `f_out_tariff` (
  `id` int(11) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `t_type` varchar(55) NOT NULL,
  `a1` float DEFAULT NULL,
  `a2` float DEFAULT NULL,
  `a3` float DEFAULT NULL,
  `a4` float DEFAULT NULL,
  `a5` float DEFAULT NULL,
  `a6` float DEFAULT NULL,
  `a7` float DEFAULT NULL,
  `a8` float DEFAULT NULL,
  `a9` float DEFAULT NULL,
  `a10` float DEFAULT NULL,
  `a11` float DEFAULT NULL,
  `a12` float DEFAULT NULL,
  `a13` float DEFAULT NULL,
  `a14` float DEFAULT NULL,
  `a15` float DEFAULT NULL,
  `a16` float DEFAULT NULL,
  `a17` float DEFAULT NULL,
  `a18` float DEFAULT NULL,
  `a19` float DEFAULT NULL,
  `a20` float DEFAULT NULL,
  `a21` float DEFAULT NULL,
  `a22` float DEFAULT NULL,
  `a23` float DEFAULT NULL,
  `a24` float DEFAULT NULL,
  `a25` float DEFAULT NULL,
  `a26` float DEFAULT NULL,
  `a27` float DEFAULT NULL,
  `a28` float DEFAULT NULL,
  `a29` float DEFAULT NULL,
  `a30` float DEFAULT NULL,
  `a31` float DEFAULT NULL,
  `a32` float DEFAULT NULL,
  `a33` float DEFAULT NULL,
  `a34` float DEFAULT NULL,
  `a35` float DEFAULT NULL,
  `a36` float DEFAULT NULL,
  `a37` float DEFAULT NULL,
  `a38` float DEFAULT NULL,
  `a39` float DEFAULT NULL,
  `a40` float DEFAULT NULL,
  `a41` float DEFAULT NULL,
  `a42` float DEFAULT NULL,
  `a43` float DEFAULT NULL,
  `a44` float DEFAULT NULL,
  `a45` float DEFAULT NULL,
  `a46` float DEFAULT NULL,
  `a47` float DEFAULT NULL,
  `a48` float DEFAULT NULL,
  `a49` float DEFAULT NULL,
  `a50` float DEFAULT NULL,
  `a51` float DEFAULT NULL,
  `a52` float DEFAULT NULL,
  `a53` float DEFAULT NULL,
  `a54` float DEFAULT NULL,
  `a55` float DEFAULT NULL,
  `a56` float DEFAULT NULL,
  `a57` float DEFAULT NULL,
  `a58` float DEFAULT NULL,
  `a59` float DEFAULT NULL,
  `a60` float DEFAULT NULL,
  `a61` float DEFAULT NULL,
  `a62` float DEFAULT NULL,
  `a63` float DEFAULT NULL,
  `a64` float DEFAULT NULL,
  `a65` float DEFAULT NULL,
  `a66` float DEFAULT NULL,
  `a67` float DEFAULT NULL,
  `a68` float DEFAULT NULL,
  `a69` float DEFAULT NULL,
  `a70` float DEFAULT NULL,
  `a71` float DEFAULT NULL,
  `a72` float DEFAULT NULL,
  `a73` float DEFAULT NULL,
  `a74` float DEFAULT NULL,
  `a75` float DEFAULT NULL,
  `a76` float NOT NULL,
  `a77` float NOT NULL,
  `a78` float NOT NULL,
  `a79` float NOT NULL,
  `a80` float NOT NULL,
  `a81` float NOT NULL,
  `a82` float NOT NULL,
  `a83` float NOT NULL,
  `a84` float NOT NULL,
  `a85` float NOT NULL,
  `a86` float NOT NULL,
  `a87` float NOT NULL,
  `a88` float NOT NULL,
  `a89` float NOT NULL,
  `a90` float NOT NULL,
  `a91` float NOT NULL,
  `a92` float NOT NULL,
  `a93` float NOT NULL,
  `a94` float NOT NULL,
  `a95` float NOT NULL,
  `a96` float NOT NULL,
  `a97` float NOT NULL,
  `a98` float NOT NULL,
  `a99` float NOT NULL,
  `a100` float NOT NULL,
  `a101` float NOT NULL,
  `a102` float NOT NULL,
  `a103` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `f_refused`
--

CREATE TABLE `f_refused` (
  `id` int(11) NOT NULL,
  `b_id` varchar(55) DEFAULT NULL,
  `v_id` varchar(55) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `pickup` datetime DEFAULT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `r_date` timestamp NULL DEFAULT NULL,
  `date_refused` date NOT NULL,
  `miss_amount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_refused`
--

INSERT INTO `f_refused` (`id`, `b_id`, `v_id`, `reason`, `pickup`, `p_city`, `d_place`, `r_date`, `date_refused`, `miss_amount`, `user_id`) VALUES
(1, '78', '', '', '2021-07-07 11:08:00', 'Tenkasi', 'Tirunelveli', '2021-07-07 12:21:55', '2021-07-07', 1658, 2),
(2, '678', '', '', '2021-09-09 09:51:00', 'tenkasi', 'karaiyar', '2021-09-09 11:02:31', '2021-09-09', 1767, 2),
(3, '1337', '', '', '2021-11-21 07:00:00', 'Thoothukudi', 'Tenkasi', '2021-11-20 23:34:34', '2021-11-20', 2000, 2)
;

-- --------------------------------------------------------

--
-- Table structure for table `f_test_chat`
--

CREATE TABLE `f_test_chat` (
  `id` int(11) NOT NULL,
  `vid` varchar(55) DEFAULT NULL,
  `amount` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `f_v_attach`
--

CREATE TABLE `f_v_attach` (
  `id` int(11) NOT NULL,
  `v_cat` varchar(55) DEFAULT NULL,
  `v_brand` varchar(55) DEFAULT NULL,
  `v_model` varchar(55) DEFAULT NULL,
  `v_no` varchar(55) DEFAULT NULL,
  `joining` date DEFAULT NULL,
  `ie_date` date DEFAULT NULL,
  `fc_date` date DEFAULT NULL,
  `pe_date` date DEFAULT NULL,
  `puc_date` date DEFAULT NULL,
  `rt_date` date DEFAULT NULL,
  `v_id` varchar(55) DEFAULT NULL,
  `v_own` enum('0','1') DEFAULT '0',
  `seat_a` varchar(55) DEFAULT NULL,
  `att_type` varchar(55) DEFAULT NULL,
  `d_mobile` varchar(55) DEFAULT NULL,
  `o_mobile` varchar(55) DEFAULT NULL,
  `adv_amt` varchar(55) DEFAULT NULL,
  `y_model` varchar(55) DEFAULT NULL,
  `d_name` varchar(55) NOT NULL,
  `o_name` varchar(55) NOT NULL,
  `vacant_place` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `f_v_attach`
--

INSERT INTO `f_v_attach` (`id`, `v_cat`, `v_brand`, `v_model`, `v_no`, `joining`, `ie_date`, `fc_date`, `pe_date`, `puc_date`, `rt_date`, `v_id`, `v_own`, `seat_a`, `att_type`, `d_mobile`, `o_mobile`, `adv_amt`, `y_model`, `d_name`, `o_name`, `vacant_place`) VALUES
(1, 'Mini', 'Tata', 'Indica', 'TN010000', '2021-06-27', '2021-06-27', '2021-06-27', '2021-06-27', '2021-06-27', '2021-06-27', '100', '1', '4', 'OCD', '9790427773', '9790427773', '0', '2019', 'Jp', 'Jp', 'MMP'),
(2, 'Mini', 'Tata', 'Indica', 'TN72OX1989', '2021-06-28', '2022-01-21', '2022-02-08', '2022-02-08', '2022-05-04', '2022-04-11', '101', '1', '4', 'O&D', '8608290090', '8489228080', '1000', '2010', 'Murugan', 'Sethupathy', ''),
(3, 'Sedan', 'Maruthi', 'Swift', 'TN09CH1769', '2020-11-20', '2021-10-04', '2026-01-08', '2026-01-08', '2021-10-18', '2027-01-01', '315', '1', '4', 'OCD', '9080770663', '9791952357', '3000', '2017', 'PRABAHARAN A', 'PRABAHARAN A', 'IDAIKAL'),
(33, 'SUV', 'Mahendra', 'Xylo', 'TN10BE9959', '0000-00-00', '0000-00-00', '2024-01-29', '2024-01-29', '0000-00-00', '0000-00-00', '310', '1', '7', '', '9944615079', '9600361097', '', '', 'kannan', 'MUTHU ', 'MATHALAMPARAI'),
(32, 'Sedan', 'Maruthi', 'Swift', 'TN09CS6381', '2022-01-13', '2023-01-10', '2024-07-23', '2024-07-23', '2022-12-31', '2027-12-01', '258', '1', '4', 'OCD', '9677916977', '9677916977', '3500', '2019', 'NAGARAJAN', 'NAGARAJAN', 'TENKASI'),
(6, 'Sedan', 'Maruthi', 'Swift', 'TN76AK0049', '2021-05-01', '2021-07-08', '2023-07-22', '2023-07-22', '2021-12-01', '2021-12-01', '238', '1', '4', 'OCD', '8870871169', '8870871169', '', '2019', 'K ALLAHBIBTCHAI', 'K ALLAHBIBTCHAI', 'NEW BUSTAND'),
(7, 'Sedan', 'Toyota', 'Etios', 'TN05BF9020', '2019-05-05', '2022-01-01', '2025-02-18', '2025-02-18', '2021-09-29', '2047-01-01', '221', '1', '4', 'OCD', '7010822940', '7010822940', '3000', '2016', 'SITHICK S', 'SITHICK S', 'MOUND ROAD '),
(31, 'Sedan', 'Maruthi', 'Swift', 'TN76P9668', '2021-12-01', '2022-07-24', '2024-03-06', '2024-03-06', '2022-12-31', '2027-12-31', '256', '1', '4', 'OCD', '9442081303', '9442081303', '3500', '2013', 'MANIKANDAN M ', 'MANIKANDAN M ', 'CUTTRALAM'),
(9, 'Mini', 'Tata', 'Indica', 'TN22DF1526', '2020-11-01', '2021-02-17', '2022-02-16', '2022-02-16', '2020-11-01', '2057-01-01', '311', '1', '4', 'O&D', '9600778432', '7010220550', '3000', '2017', 'MOHAMMED HAJA ', 'KRISHNAKUMAR', 'KOTTAKULAM '),
(10, 'Sedan', 'Tata', 'Zest', 'TN07CP7560', '2021-03-01', '2021-12-06', '2026-06-21', '2026-06-21', '2021-12-08', '2057-01-01', '104', '1', '4', 'OCD', '9043389982', '9043389982', '3000', '2018', 'MOHAMMD SHIEK MOHAIDEEN ', 'MOHAMMED SHIEK MOHAIDEEN ', 'SENKOTTAI')
;

-- --------------------------------------------------------

--
-- Table structure for table `local_tariff`
--

CREATE TABLE `local_tariff` (
  `id` int(11) NOT NULL,
  `v_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(10) NOT NULL,
  `mini_km` int(11) DEFAULT NULL,
  `max_km` int(11) DEFAULT NULL,
  `c_p_km` int(11) DEFAULT NULL,
  `c_p_hrs` int(11) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_by` varchar(55) DEFAULT NULL,
  `min_u_km` int(11) NOT NULL,
  `min_amt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`) VALUES
(1, 'Ariyalur'),
(2, 'Coimbatore'),
(3, 'Cuddalore'),
(4, 'Dharmapuri'),
(5, 'Dindigul'),
(6, 'Erode'),
(7, 'Kancheepuram'),
(8, 'Kanniyakumari'),
(9, 'Karur'),
(10, 'Krishnagiri')
;
INSERT INTO `location` (`id`, `name`) VALUES
(2290, 'Vilangattur'),
(2291, 'Virudhachalam (M)'),
(2292, 'Visalur'),
(2293, 'Dharmapuri'),
(2294, 'Harur'),
(2295, 'Palakkodu'),
(2296, 'Pappireddipatti'),
(2297, 'Pennagaram'),
(2298, 'A.Jettihalli'),
(2299, 'A.Reddihalli')
;
INSERT INTO `location` (`id`, `name`) VALUES
(4559, 'Nathamkariamcheri'),
(4560, 'Navalur RF'),
(4561, 'Neikuppi'),
(4562, 'Nelvoy'),
(4563, 'Nemmeli'),
(4564, 'Nemmeli RF'),
(4565, 'Nerumbur'),
(4566, 'Osivakkam'),
(4567, 'Othivakkam'),
(4568, 'P.V.Kalathur')
;
INSERT INTO `location` (`id`, `name`) VALUES
(6860, 'Vannampatty'),
(6861, 'Vathiyanur'),
(6862, 'Vedapatti'),
(6863, 'Veerachikupam'),
(6864, 'Veeranakuppam'),
(6865, 'Veeriampatti'),
(6866, 'Velampatti'),
(6867, 'Vellalapatti'),
(6868, 'Vellalapatti'),
(6869, 'Vengadathanpatti')
;
INSERT INTO `location` (`id`, `name`) VALUES
(9119, 'Tirunallivayal'),
(9120, 'Vellur'),
(9121, 'Vellur siruvarai'),
(9122, 'Vettivayal'),
(9123, 'Vichur'),
(9124, 'Vinaithirthagopalapuram'),
(9125, 'Alavayal'),
(9126, 'Ammankurichi'),
(9127, 'Arasamalai'),
(9128, 'Avampatti')
;
INSERT INTO `location` (`id`, `name`) VALUES
(11314, 'Karappankadu'),
(11315, 'Karisavayal'),
(11316, 'Karuppur'),
(11317, 'Kasangadu'),
(11318, 'Kattaiyankadu'),
(11319, 'Kattayankadu Ukkadai'),
(11320, 'Kayavoor'),
(11321, 'Keelakurichi East'),
(11322, 'Keelakurichi West'),
(11323, 'Kollukkadu')
;
INSERT INTO `location` (`id`, `name`) VALUES
(13492, 'Seruvalur'),
(13493, 'Sirupuliyur'),
(13494, 'Sorakkudi'),
(13495, 'Srivanjiyam'),
(13496, 'Tattathimoolai'),
(13497, 'Thalaiyur'),
(13498, 'Thirukkandeeswaram'),
(13499, 'Thirukkottaram'),
(13500, 'Tirumichchiyur'),
(13501, 'Tiruppallimukkoodal')
;
INSERT INTO `location` (`id`, `name`) VALUES
(15585, 'S.Nallur (M)'),
(15586, 'South Avanashipalayam'),
(15587, 'Thonguttipalayam'),
(15588, 'Thottipalayam (CT)'),
(15589, 'Tiruppur (M.Corp)'),
(15590, 'Ugayanur'),
(15591, 'Veerapandi (CT)'),
(15592, 'Velampalayam (M)'),
(15593, 'Alampalayam'),
(15594, 'Amaravathi R.F.')
;
INSERT INTO `location` (`id`, `name`) VALUES
(17815, 'Kurinjipai'),
(17816, 'Kuttapakkam (Mel)'),
(17817, 'Kuzhapalur'),
(17818, 'Madappundi'),
(17819, 'Mahadevimangalam'),
(17820, 'Malaiyanur (Mel.)'),
(17821, 'Malarasankuppam'),
(17822, 'Malavantangal'),
(17823, 'Manalapadi'),
(17824, 'Manandal')
;

-- --------------------------------------------------------

--
-- Table structure for table `login_status`
--

CREATE TABLE `login_status` (
  `id` int(11) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `id_emp` varchar(55) DEFAULT NULL,
  `emp_mobile` varchar(55) DEFAULT NULL,
  `emp_name` varchar(55) DEFAULT NULL,
  `vacant_place` varchar(55) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `l_date` date NOT NULL,
  `logout` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `out_date` date NOT NULL,
  `login_status` enum('0','1') DEFAULT '0',
  `v_no` varchar(55) NOT NULL,
  `ontrip_status` enum('0','1') NOT NULL DEFAULT '0',
  `status_assign` enum('0','1') NOT NULL DEFAULT '0',
  `emp_login` enum('0','1') NOT NULL DEFAULT '0',
  `hrsp_day` int(11) NOT NULL,
  `minscalc` int(11) NOT NULL,
  `trip_amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `new_customer`
--

CREATE TABLE `new_customer` (
  `id` int(11) NOT NULL,
  `m_no` varchar(55) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `drop_place` varchar(55) DEFAULT NULL,
  `amount` varchar(55) DEFAULT NULL,
  `b_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_customer`
--

INSERT INTO `new_customer` (`id`, `m_no`, `b_name`, `p_city`, `drop_place`, `amount`, `b_id`, `user_id`) VALUES
(1, '9524522210', 'Jp', 'Tenkasi', '', NULL, 1, 1),
(2, '9003968836', 'Mr', 'tenkasi', '', NULL, 3, 2),
(3, '9790427773', 'Jp', 'Madurai', '', NULL, 7, 1),
(4, '9790427773', 'Jp', 'Madurai', '', NULL, 7, 1),
(5, '9790427773', 'Jp', 'Tenkasi', '', NULL, 7, 1),
(6, '9790427773', 'Jp', 'Tenkasi', '', NULL, 7, 1),
(7, '9790427773', 'Jp', 'Tenkasi', '', NULL, 7, 1),
(8, '9790427773', 'Jeya', 'Mellai', '', NULL, 7, 1),
(9, '9790427773', 'Jeya', 'Mellai', '', NULL, 7, 1),
(10, '9790427773', 'Jp', 'Tenkasi', '', NULL, 7, 1)
;AGARAM', '', NULL, 338, 2),
(200, '9715865500', 'MOHAMMED ALI ', 'TENKASI', '', NULL, 340, 2),
(201, '8778159797', 'MR', 'TENKASI', '', NULL, 342, 2),
(202, '7871598020', 'MR', 'TENKASAI', '', NULL, 345, 2),
(203, '9994861757', 'MR', 'Tenkasi ', '', NULL, 347, 2),
(204, '7598119005', 'MR', 'melagaram', '', NULL, 349, 2),
(205, '9999295627', 'MR', 'cuttralam', '', NULL, 350, 2),
(206, '8610426138', 'selva ', 'tenkasi', '', NULL, 351, 2),
(207, '8489024161', 'fathima', 'tenkasi', '', NULL, 352, 2),
(208, '9750567942', 'MR', 'tenkasi', '', NULL, 356, 2),
(209, '9597686832', 'MR', 'TENKASAI', '', NULL, 357, 2),
(210, '7904518864', 'saravanapandian ', 'tenkasi', '', NULL, 359, 2),
(211, '7010855053', 'MR', 'melagaram', '', NULL, 364, 2),
(212, '9489540229', 'MR', 'tenkasi', '', NULL, 365, 2),
(213, '9486103453', 'MR', 'melagaram', '', NULL, 366, 2),
(214, '9842533052', 'MR', 'pavoorchatram', '', NULL, 367, 2),
(215, '9891495691', 'MR', 'tenkasi', '', NULL, 368, 2),
(216, '7305480251', 'MR', 'TENKASI', '', NULL, 369, 2),
(217, '7904330817', 'PRABU', 'TENKASI', '', NULL, 379, 2),
(218, '9698703838', 'MR', 'TENKASI', '', NULL, 381, 2),
(219, '9442061823', 'SIVAKUMAR', 'melagaram ', '', NULL, 382, 2),
(220, '7010965913', 'MR', 'TENKASI', '', NULL, 386, 2),
(221, '9791473647', 'sankar boi', 'tenkasi', '', NULL, 388, 2),
(222, '6381313707', 'Mr ', 'Melagaram (TP)', '', NULL, 396, 2),
(223, '9566777826', 'MAGESH ', 'kattalaikudiruppu', '', NULL, 397, 2),
(224, '9629625930', 'MR', 'TENKASI', '', NULL, 399, 2),
(225, '7538803453', 'MR', 'Kottakulam', '', NULL, 400, 2),
(226, '7548803282', 'MR', 'melameganapuram', '', NULL, 401, 2),
(227, '9345462852', 'ramachandran ', 'melagaram', '', NULL, 408, 2),
(228, '7598535506', 'MR', 'MELAGARAM ', '', NULL, 409, 2),
(229, '8903219074', 'MR', 'tirunelveli', '', NULL, 410, 2),
(230, '7548895998', 'MR', 'Tenkasi', '', NULL, 411, 2),
(231, '7639202031', 'Raja sekaran ', 'tenkasi', '', NULL, 414, 2),
(232, '9487346379', 'MR', 'tenkasi', '', NULL, 414, 2),
(233, '9847920030', 'AJITH ', 'TENKASI', '', NULL, 416, 2),
(234, '9099015366', 'selva ', 'Vallam', '', NULL, 421, 2),
(235, '8778282026', 'BANU', 'AMBASAMUDRAM', '', NULL, 425, 2),
(236, '9840785617', 'MR', 'tenkasi', '', NULL, 430, 2),
(237, '9840785617', 'MR', 'tenkasi', '', NULL, 430, 2),
(238, '9840785617', 'MR', 'tenkasi', '', NULL, 430, 2),
(239, '9840785617', 'MR', 'tenkasi', '', NULL, 430, 2),
(240, '9840785617', 'MR', 'tenkasi', '', NULL, 430, 2),
(241, '9498192531', 'MR', 'tenkasi', '', NULL, 430, 2),
(242, '8668173234', 'mathiarasan', 'Tenkasi', '', NULL, 430, 2),
(243, '9943073031', 'MR', 'senkottai', '', NULL, 432, 2),
(244, '9965768185', 'siva ', 'tenkasi', '', NULL, 435, 2),
(245, '8015429193', 'MR', 'minnagar ', '', NULL, 438, 2),
(246, '9841193206', 'meeran', 'Tenkasi', '', NULL, 440, 2),
(247, '9900587357', 'MR', 'PAVOORCHATHRAM', '', NULL, 444, 2),
(248, '9911841984', 'ARUN', 'melagaram', '', NULL, 446, 2),
(249, '9841920186', 'muthu', 'MELAGARAM', '', NULL, 447, 2),
(250, '9385331877', 'MR', 'TENKASI', '', NULL, 450, 2),
(251, '9789823888', 'MR', 'TENKASI', '', NULL, 452, 2),
(252, '9867274857', 'MR', 'IDAIKAL', '', NULL, 453, 2),
(253, '4633226595', 'MR', 'TENKASI', '', NULL, 458, 2),
(254, '9994492871', 'MR', 'melagaram', '', NULL, 459, 2),
(255, '8825832526', 'mani', 'Tenkasi', '', NULL, 461, 2),
(256, '7708848951', 'MR', 'tenkasi', '', NULL, 463, 2),
(257, '8072716993', 'MR', 'Tenkasi', '', NULL, 464, 2),
(258, '6379256141', 'indra ', 'TENKASI', '', NULL, 470, 2),
(259, '8610008179', 'mahendran', 'nannagaram', '', NULL, 474, 2),
(260, '8010348158', 'durairaj', 'melagaram', '', NULL, 476, 2),
(261, '9444586094', 'MR', 'cuttralam ', '', NULL, 480, 2),
(262, '8778801020', 'MR', 'TENKASI', '', NULL, 486, 2),
(263, '9842113516', 'vengatesh', 'melagaram ', '', NULL, 487, 2),
(264, '8610053857', 'MR', 'senkottai ', '', NULL, 491, 2),
(265, '9442515889', 'GANESHSAN', 'MELAGARAM ', '', NULL, 493, 2),
(266, '9442515889', 'GANESHAN ', 'MELAGARAM', '', NULL, 493, 2),
(267, '9944192303', 'MR', 'SENKOTTAI', '', NULL, 495, 2),
(268, '9442685921', 'MR', 'vallam ', '', NULL, 497, 2),
(269, '9489480213', 'MR', 'melapattakurichi', '', NULL, 501, 2),
(270, '9442524897', 'gurusamy', 'Nainaragaram', '', NULL, 502, 2),
(271, '7010570842', 'MR', 'PAVOORCHATHRAM', '', NULL, 504, 2),
(272, '7010570842', 'MR', 'PAVOORCHATHRAM', '', NULL, 504, 2),
(273, '7010570842', 'MR', 'PAVOORCHATHRAM', '', NULL, 504, 2),
(274, '8870499257', 'selvakumar', 'nannagaram', '', NULL, 509, 2),
(275, '9976642003', 'manikandan ', 'senkottai', '', NULL, 512, 2),
(276, '9976642003', 'manikandan ', 'senkottai', '', NULL, 512, 2),
(277, '9791932558', 'MR', 'Sundarapandiapuram', '', NULL, 514, 2),
(278, '9843326249', 'ulaganathan ', 'melagaram', '', NULL, 515, 2),
(279, '9843326249', 'ulaganathan ', 'melagaram', '', NULL, 515, 2),
(280, '9360339292', 'MR', 'Ayikudi', '', NULL, 520, 2),
(281, '7598408991', 'MR', 'Sundarapandiapuram', '', NULL, 521, 2),
(282, '9626110224', 'MR', 'tenkasi', '', NULL, 523, 2),
(283, '9677694239', 'MR', 'Idaikal', '', NULL, 524, 2),
(284, '9500002142', 'thirukumaran', 'tenkasi', '', NULL, 525, 2),
(285, '8608076979', 'MR', 'tenkasi', '', NULL, 527, 2),
(286, '9043362135', 'MR', 'tenkasi', '', NULL, 528, 2),
(287, '9952139838', 'MR', 'tenkasi', '', NULL, 529, 2),
(288, '9751632014', 'MR', 'senkottai', '', NULL, 534, 2),
(289, '9443344564', 'MR', 'tenkasi', '', NULL, 535, 2),
(290, '7598009001', 'MR', 'tenkasi', '', NULL, 536, 2),
(291, '9486602904', 'rahman refai', 'tenkasi', '', NULL, 536, 2),
(292, '9865429498', 'MR', 'Tenkasi', '', NULL, 537, 2),
(293, '7373724324', 'MR', 'tenkasi', '', NULL, 540, 2),
(294, '9566725043', 'saravanan ', 'Tenkasi', '', NULL, 546, 2),
(295, '9344035363', 'MR', 'tenkasi', '', NULL, 547, 2),
(296, '8287783848', 'MR', 'melagaram', '', NULL, 549, 2),
(297, '8838387630', 'sureshbalaji', 'tenkasi', '', NULL, 553, 2),
(298, '9942778080', 'GANAGASABAPATHI', 'MELAGARAM', '', NULL, 554, 2),
(299, '9944524950', 'MR', 'tenkasi', '', NULL, 559, 2),
(300, '8056490836', 'MR', 'Tenkasi', '', NULL, 564, 2),
(301, '9443870019', 'MR', 'Tenkasi', '', NULL, 567, 2),
(302, '6369968890', 'MR', 'achanpudur ', '', NULL, 571, 2),
(303, '9994786725', 'MR', 'Sundarapandiapuram', '', NULL, 579, 2),
(304, '8668053788', 'velayutham', 'Kadapogathi', '', NULL, 580, 2),
(305, '8754933436', 'MR', 'Tenkasi', '', NULL, 581, 2),
(306, '9840496086', 'MR', 'Ayiraperi', '', NULL, 583, 2),
(307, '8870717191', 'MR', 'Seevanallur', '', NULL, 584, 2),
(308, '9597136861', 'MR', 'KUDIURUPPU ', '', NULL, 585, 2),
(309, '9597973976', 'MR', 'Tenkasi', '', NULL, 588, 2),
(310, '9842920559', 'kasipandian ', 'Tenkasi', '', NULL, 590, 2),
(311, '9566993247', 'MR', 'tenkasi', '', NULL, 591, 2),
(312, '9442691359', 'MR', 'tenkasi', '', NULL, 592, 2),
(313, '6381685049', 'MR', 'Tenkasi', '', NULL, 592, 2),
(314, '9840923864', 'ambalavanan ', 'melagaram', '', NULL, 593, 2),
(315, '9840898253', 'MR', 'Tenkasi', '', NULL, 594, 2),
(316, '9789261405', 'MR', 'melagaram', '', NULL, 601, 2),
(317, '8072291028', 'MR', 'Tenkasi', '', NULL, 602, 2),
(318, '6374327671', 'MR', 'melagaram', '', NULL, 604, 2),
(319, '7397283717', 'MR', 'tenkasi', '', NULL, 605, 2),
(320, '9500201160', 'MR', 'KUDIURUPPU ', '', NULL, 607, 2),
(321, '9843688244', 'MR', 'TENKASI', '', NULL, 608, 2),
(322, '9790427773', 'JP', 'Tenkasi', '', NULL, 609, 1),
(323, '9443104851', 'MR', 'Tenkasi', '', NULL, 613, 2),
(324, '9366723973', 'MR', 'Tenkasi', '', NULL, 617, 2),
(325, '7598624510', 'MR', 'Urmelazhagian', '', NULL, 618, 2),
(326, '8754930249', 'MR', 'VETTAIKARANKULAM', '', NULL, 621, 2),
(327, '9486289112', 'MR', 'Tenkasi', '', NULL, 622, 2),
(328, '9840126634', 'MR', 'Tenkasi', '', NULL, 623, 2),
(329, '8056774722', 'baskar', 'tenkasi', '', NULL, 625, 2),
(330, '9842507633', 'MR', 'Tenkasi', '', NULL, 628, 2),
(331, '9567952005', 'MR', 'SENKOTTAI', '', NULL, 630, 2),
(332, '8667543830', 'MR', 'MELAGARAM', '', NULL, 631, 2),
(333, '9790311708', 'MR', 'Keelapuliyur (South)', '', NULL, 632, 2),
(334, '9092033446', 'ramachandran ', 'MELAGARAM', '', NULL, 634, 2),
(335, '9486974266', 'MR', 'tenkasi', '', NULL, 637, 2),
(336, '9487779083', 'murugaiah ', 'melagaram', '', NULL, 639, 2),
(337, '6381704699', 'MR', 'tenkasi', '', NULL, 639, 2),
(338, '9487779083', 'murugaiah ', 'melagaram', '', NULL, 642, 2),
(339, '6383901216', 'ramakrishnan', 'Senkottai', '', NULL, 645, 2),
(340, '6385783007', 'MR', 'Tenkasi', '', NULL, 647, 2),
(341, '9486703900', 'subbiah ', 'minnagar', '', NULL, 650, 2),
(342, '9486703900', 'subbiah ', 'minnagar', '', NULL, 650, 2),
(343, '9486603633', 'paramasivam', 'nannagaram', '', NULL, 651, 2),
(344, '8870967753', 'MR', 'tenkasi', '', NULL, 655, 2),
(345, '9487348319', 'MR', 'Tenkasi', '', NULL, 656, 2),
(346, '9486510769', 'MR', 'minnagar', '', NULL, 659, 2),
(347, '9486703900', 'subbiah ', 'tenkasi', '', NULL, 664, 2),
(348, '8870593465', 'MR', 'Senkottai', '', NULL, 665, 2),
(349, '9787232803', 'MR', 'tenkasi', '', NULL, 674, 2),
(350, '7373354141', 'MR', 'vallam', '', NULL, 679, 2),
(351, '9489235660', 'MR', 'tenkasi', '', NULL, 680, 2),
(352, '9791727333', 'MR', 'Tenkasi', '', NULL, 681, 2),
(353, '8248868087', 'MR', 'melagaram ', '', NULL, 683, 2),
(354, '9677996404', 'MR', 'angarayankulam', '', NULL, 684, 2),
(355, '9994564382', 'MR', 'melagaram', '', NULL, 685, 2),
(356, '9629654539', 'MR', 'tenkasi', '', NULL, 692, 2),
(357, '9445104407', 'MR', 'tenkasi', '', NULL, 694, 2),
(358, '9444049832', 'rajasekaran', 'melagaram', '', NULL, 695, 2),
(359, '9489110760', 'MR', 'melagaram ', '', NULL, 697, 2),
(360, '8056418647', 'mr', 'tenkasi', '', NULL, 699, 2),
(361, '9361540772', 'MR', 'tenkasi', '', NULL, 702, 2),
(362, '9515140763', 'MR', 'tenkasi', '', NULL, 703, 2),
(363, '6383400244', 'MR', 'pavoorchatram', '', NULL, 705, 2),
(364, '9944620679', 'MR', 'tenkasi', '', NULL, 708, 2),
(365, '7904327382', 'MR', 'Tenkasi', '', NULL, 709, 2),
(366, '9677436436', 'MR', 'tenkasi', '', NULL, 712, 2),
(367, '7806983911', 'MR', 'Tenkasi', '', NULL, 713, 2),
(368, '8825544224', 'MR', 'Urmelazhagian', '', NULL, 718, 2),
(369, '9965618558', 'MR', 'minnagar', '', NULL, 719, 2),
(370, '9123544514', 'MR', 'nannagaram', '', NULL, 722, 2),
(371, '9486615708', 'GANESHAN ', 'melagaram', '', NULL, 725, 2),
(372, '9486631459', 'MR', 'senthamaram', '', NULL, 726, 2),
(373, '9486825005', 'MR', 'melagaram', '', NULL, 729, 2),
(374, '8610995942', 'MR', 'elathur', '', NULL, 731, 2),
(375, '8838138050', 'MR', 'tenkasi', '', NULL, 735, 2),
(376, '8072056055', 'MR', 'melagaram', '', NULL, 736, 2),
(377, '9629082456', 'issac', 'tenkasi', '', NULL, 738, 2),
(378, '9159826374', 'MR', 'Pudur', '', NULL, 740, 2),
(379, '9842976727', 'MR', 'kadayanallur', '', NULL, 743, 2),
(380, '8489228080', 'RK', 'Tenkasi', '', NULL, 746, 1),
(381, '8838504508', 'MR', 'melagaram', '', NULL, 749, 2),
(382, '9655595678', 'MR', 'tenkasi', '', NULL, 751, 2),
(383, '9442113146', 'MR', 'ilanji', '', NULL, 751, 2),
(384, '9080869061', 'MR', 'ilanji', '', NULL, 753, 2),
(385, '7550162708', 'praveen', 'surandai', '', NULL, 754, 2),
(386, '9976750384', 'mr rajendran ', 'cuttralam', '', NULL, 755, 2),
(387, '9842707865', 'mohammed ali', 'tenkasi', '', NULL, 756, 2),
(388, '9442614393', 'MR', 'tenkasi', '', NULL, 758, 2),
(389, '9842642296', 'MURUGAN ', 'tenkasi', '', NULL, 760, 2),
(390, '9443555623', 'satchithanand', 'ilanji', '', NULL, 762, 2),
(391, '8870519985', 'MR', 'Keelapuliyur ', '', NULL, 764, 2),
(392, '9164264942', 'madhu', 'senkottai', '', NULL, 769, 2),
(393, '6374866881', 'MR', 'idaikal', '', NULL, 770, 2),
(394, '7094109066', 'MR', 'Tirunelveli', '', NULL, 771, 2),
(395, '8838189637', 'bagavathy', 'KUDIURUPPU ', '', NULL, 773, 2),
(396, '9787440656', 'MR', 'minnagar', '', NULL, 775, 2),
(397, '9786258941', 'MR', 'tenkasi', '', NULL, 776, 2),
(398, '9489228080', 'Mr ', 'tenkasi', '', NULL, 778, 2),
(399, '9486702701', 'manikandan aandha classic', 'Senkottai', '', NULL, 781, 2),
(400, '9500980919', 'stephan ', 'tiruneveli', '', NULL, 784, 2),
(401, '9488261951', 'jegan', 'Senkottai', '', NULL, 785, 2),
(402, '9655595678', 'MR', 'tenkasi', '', NULL, 786, 2),
(403, '8122126319', 'MR', 'nannagaram', '', NULL, 788, 2),
(404, '9500083174', 'MR', 'urmeniazhagiyan', '', NULL, 789, 2),
(405, '7904763225', 'ganapathy ayyer ', 'tenkasi', '', NULL, 793, 2),
(406, '9442796427', 'MR', 'kudiuruppu', '', NULL, 794, 2),
(407, '9500740687', 'MR', 'tenkasi', '', NULL, 796, 2),
(408, '8838857804', 'MR', 'melagaram', '', NULL, 799, 2),
(409, '9524902777', 'MR', 'Idaikal', '', NULL, 804, 2),
(410, '9790901842', 'MR', 'tiruneveli', '', NULL, 809, 2),
(411, '9600227725', 'MR', 'Tirunelveli', '', NULL, 810, 2),
(412, '9842790463', 'sk bala ', 'minnagar', '', NULL, 811, 2),
(413, '9500619966', 'MR', 'Tirunelveli', '', NULL, 817, 2),
(414, '6369467042', 'MR', 'tenkasi', '', NULL, 818, 2),
(415, '9080698232', 'MR', 'tenkasi', '', NULL, 820, 2),
(416, '9952186033', 'MR', 'tenkasi', '', NULL, 820, 2),
(417, '9443656967', 'MR', 'melagaram', '', NULL, 822, 2),
(418, '9361070887', 'MR', 'tenkasi', '', NULL, 830, 2),
(419, '6381239545', 'kaniraj', 'tenkasi', '', NULL, 833, 2),
(420, '9384702940', 'MR', 'tenkasi', '', NULL, 835, 2),
(421, '7904077517', 'shiva', 'Tenkasi', '', NULL, 837, 2),
(422, '8925394386', 'MR', 'surandai', '', NULL, 839, 2),
(423, '8778659396', 'gopal', 'tenkasi', '', NULL, 846, 2),
(424, '9361641702', 'palani', 'Tenkasi', '', NULL, 848, 2),
(425, '9894486148', 'sujith', 'melagaram', '', NULL, 852, 2),
(426, '9441470840', 'perumal', 'tenkasi', '', NULL, 854, 2),
(427, '7092340099', 'selvakumar', 'pavoorchathram', '', NULL, 862, 2),
(428, '6380020327', 'MR', 'nannagaram', '', NULL, 864, 2),
(429, '9865546454', 'MR', 'tenkasi', '', NULL, 866, 2),
(430, '9488167239', 'MR', 'ilathur', '', NULL, 868, 2),
(431, '9442449343', 'MR', 'ilanji', '', NULL, 869, 2),
(432, '9600778432', 'MR', 'TENKASI', '', NULL, 870, 2),
(433, '9952571567', 'MR', 'tenkasi', '', NULL, 876, 2),
(434, '9345970314', 'RAMRAJ', 'tenkasi', '', NULL, 877, 2),
(435, '9486288549', 'kumar', 'ilanji', '', NULL, 878, 2),
(436, '9940894476', 'MR', 'Tenkasi', '', NULL, 880, 2),
(437, '9790583213', 'MR', 'Tenkasi', '', NULL, 881, 2),
(438, '9786649582', 'MR', 'tenkasi', '', NULL, 883, 2),
(439, '9788011340', 'MR', 'tenkasi', '', NULL, 886, 2),
(440, '9952599580', 'MR', 'sankarankovil', '', NULL, 889, 2),
(441, '9976642003', 'manikandan ', 'Senkottai', '', NULL, 895, 2),
(442, '7598009001', 'MR', 'melagaram', '', NULL, 901, 2),
(443, '9443608726', 'a b vairamani ', 'tenkasi', '', NULL, 906, 2),
(444, '9994841384', 'arunachalampillai', 'tenkasi', '', NULL, 907, 2),
(445, '8778345900', 'MR', 'Tenkasi', '', NULL, 908, 2),
(446, '9488980753', 'MR', 'tenkasi', '', NULL, 908, 2),
(447, '9488980753', 'MR', 'tenkasi', '', NULL, 908, 2),
(448, '7708409050', 'MR', 'surandai', '', NULL, 909, 2),
(449, '9443159030', 'MR', 'Senkottai', '', NULL, 912, 2),
(450, '9442064350', 'MR', 'keelapavoor', '', NULL, 914, 2),
(451, '9840276168', 'Ravi', 'melagaram', '', NULL, 915, 2),
(452, '9944998773', 'sakthivel', 'tenkasi', '', NULL, 916, 2),
(453, '9442813863', 'MR', 'tenkasi', '', NULL, 919, 2),
(454, '9487676036', 'MR', 'melagaram', '', NULL, 920, 2),
(455, '9842510384', 'MR', 'tenkasi', '', NULL, 923, 2),
(456, '8838659654', 'MR', 'melagaram', '', NULL, 924, 2),
(457, '9345116022', 'MR', 'tenkasi', '', NULL, 932, 2),
(458, '6374475873', 'MR', 'vallam', '', NULL, 934, 2),
(459, '9791159708', 'praveen', 'Tirunelveli', '', NULL, 935, 2),
(460, '8608065500', 'MR', 'Tenkasi', '', NULL, 936, 2),
(461, '9043604859', 'MR', 'tenkasi', '', NULL, 937, 2),
(462, '9731902830', 'MR', 'tenkasi', '', NULL, 939, 2),
(463, '7397305395', 'MR', 'Puliyarai', '', NULL, 940, 2),
(464, '9578349729', 'MR', 'angarayankulam', '', NULL, 943, 2),
(465, '8778406386', 'gomathi diffen ', 'melagaram', '', NULL, 946, 2),
(466, '7094221654', 'MR', 'tirunelveli', '', NULL, 947, 2),
(467, '9344713661', 'MR', 'tenkasi', '', NULL, 951, 2),
(468, '9626349671', 'MR', 'tenkasi', '', NULL, 952, 2),
(469, '9791586101', 'narayanan', 'pavoorchathram', '', NULL, 953, 2),
(470, '9940185659', 'reena', 'Kadapogathi', '', NULL, 954, 2),
(471, '9445568261', 'eswaran', 'melagaram', '', NULL, 957, 2),
(472, '9092414156', 'revathi', 'vallam', '', NULL, 958, 2),
(473, '9940676866', 'MR', 'tenkasi', '', NULL, 960, 2),
(474, '9881640815', 'abraham', 'Tenkasi', '', NULL, 965, 2),
(475, '7395851296', 'kamathenu construction', 'tenkasi', '', NULL, 966, 2),
(476, '9940418335', 'ramanathan', 'tenkasi', '', NULL, 972, 2),
(477, '7010001617', 'kannan ', 'tenkasi', '', NULL, 973, 2),
(478, '6383622870', 'muthu master ', 'tenkasi', '', NULL, 978, 2),
(479, '8903402770', 'meena', 'k k valasai', '', NULL, 979, 2),
(480, '9385692650', 'MR', 'MELAGARAM', '', NULL, 981, 2),
(481, '9446577701', 'MARIAPPAN', 'Tenkasi', '', NULL, 982, 2),
(482, '9952787213', 'MR', 'tenkasi', '', NULL, 984, 2),
(483, '7356871485', 'MR', 'tenkasi', '', NULL, 988, 2),
(484, '8778182302', 'kumaresan', 'melagaram', '', NULL, 990, 2),
(485, '8754300575', 'RAJA', 'Tenkasi', '', NULL, 996, 2),
(486, '9500852603', 'MR', 'tenkasi', '', NULL, 998, 2),
(487, '9487917497', 'MR', 'tenkasi', '', NULL, 1000, 2),
(488, '9080972504', 'MR', 'Idaikal', '', NULL, 1002, 2),
(489, '8807707450', 'MR', 'Tenkasi', '', NULL, 1004, 2),
(490, '9942923454', 'MR', 'Tirunelveli', '', NULL, 1011, 2),
(491, '7708112102', 'MR', 'trnkasi', '', NULL, 1015, 2),
(492, '7094979812', 'samydass', 'Tenkasi', '', NULL, 1020, 2),
(493, '9952357557', 'mani rice', 'tenkasi', '', NULL, 1029, 2),
(494, '7904850288', 'MR', 'Mangalapuram', '', NULL, 1030, 2),
(495, '9443172232', 'babu', 'Tenkasi', '', NULL, 1031, 2),
(496, '7845500600', 'MR', 'tenkasi', '', NULL, 1035, 2),
(497, '8778746257', 'MARIAPPAN', 'Kandamangalam', '', NULL, 1038, 2),
(498, '9444440841', 'MR', 'Tenkasi', '', NULL, 1042, 2),
(499, '9443080905', 'MARIAPPAN', 'Tenkasi', '', NULL, 1044, 2),
(500, '8778309060', 'MR', 'Tenkasi', '', NULL, 1048, 2),
(501, '9994055744', 'MR', 'Tenkasi', '', NULL, 1049, 2),
(502, '9944749846', 'SANKAR ', 'pavoorchathram', '', NULL, 1050, 2),
(503, '9787634304', 'MR', 'ilanji', '', NULL, 1054, 2),
(504, '9840492454', 'MR', 'cuttralam', '', NULL, 1057, 2),
(505, '8695848849', 'MR', 'Tirunelveli', '', NULL, 1059, 2),
(506, '8667714219', 'PRIYA', 'kadayanallur', '', NULL, 1065, 2),
(507, '9344351328', 'MR', 'ayiraperi', '', NULL, 1066, 2),
(508, '9688383999', 'vijayakumar', 'Tenkasi', '', NULL, 1068, 2),
(509, '6374681150', 'SUNDAR', 'nagarcoil', '', NULL, 1069, 2),
(510, '9361417020', 'MR', 'Tenkasi', '', NULL, 1070, 2),
(511, '9842832835', 'kaniraj', 'Idaikal', '', NULL, 1078, 2),
(512, '9025772436', 'MR', 'nagarcoil', '', NULL, 1079, 2),
(513, '8778318547', 'RAJA', 'Melapavoor', '', NULL, 1083, 2),
(514, '9626269494', 'boi Janani', 'Tenkasi', '', NULL, 1084, 2),
(515, '9486376961', 'MR', 'Tenkasi', '', NULL, 1087, 2),
(516, '7094353363', 'MR', 'kulathupuzha', '', NULL, 1089, 2),
(517, '7010295516', 'manimaran', 'ilanji', '', NULL, 1091, 2),
(518, '9585125501', 'MR', 'Tenkasi', '', NULL, 1093, 2),
(519, '9995390291', 'mariappan ramco', 'Tenkasi', '', NULL, 1099, 2),
(520, '9361010498', 'paramasivam', 'Vallam', '', NULL, 1103, 2),
(521, '9488664452', 'kannan ', 'Senkottai', '', NULL, 1108, 2),
(522, '7305676279', 'MR', 'Tenkasi', '', NULL, 1109, 2),
(523, '7397275879', 'MR', 'Tenkasi', '', NULL, 1112, 2),
(524, '8190037235', 'MR', 'melagaram', '', NULL, 1113, 2),
(525, '9363301826', 'prahakaran', 'Tenkasi', '', NULL, 1116, 2),
(526, '9865258977', 'MR', 'edaiyarthavanai', '', NULL, 1118, 2),
(527, '9940762718', 'saravanaraj', 'ilanji', '', NULL, 1125, 2),
(528, '9940762718', 'saravanaraj', 'vallam', '', NULL, 1125, 2),
(529, '9597857446', 'MR', 'Senkottai', '', NULL, 1129, 2),
(530, '9487656242', 'somasundaram ', 'alangulam', '', NULL, 1138, 2),
(531, '7806865285', 'MR', 'Tenkasi', '', NULL, 1139, 2),
(532, '7904441940', 'MR', 'Tenkasi', '', NULL, 1140, 2),
(533, '9443582599', 'chithambaram', 'Tenkasi', '', NULL, 1147, 2),
(534, '9500595522', 'MR', 'Tenkasi', '', NULL, 1151, 2),
(535, '9842770973', 'MR', 'tenkasi', '', NULL, 1153, 2),
(536, '9486632570', 'chellasamy ', 'Senkottai', '', NULL, 1157, 2),
(537, '9442203445', 'MR', 'Tenkasi', '', NULL, 1159, 2),
(538, '8220839129', 'MR', 'Tenkasi', '', NULL, 1162, 2),
(539, '6383428186', 'balasubramanian ', 'ambai', '', NULL, 1166, 2),
(540, '8838423182', 'MR', 'melagaram ', '', NULL, 1167, 2),
(541, '6379012709', 'MR', 'Tenkasi', '', NULL, 1168, 2),
(542, '8240856362', 'MR 223', 'Tenkasi', '', NULL, 1169, 2),
(543, '9677526738', 'MR', 'PUNALUR ', '', NULL, 1176, 2),
(544, '9746794004', 'MR', 'melagaram', '', NULL, 1178, 2),
(545, '7299911670', 'MR', 'Tenkasi', '', NULL, 1180, 2),
(546, '9600129372', 'MR', 'tenkasi', '', NULL, 1183, 2),
(547, '9080873883', 'MR', 'melagaram', '', NULL, 1184, 2),
(548, '6381613881', 'MR', 'Tenkasi', '', NULL, 1185, 2),
(549, '9488665391', 'sankaran', 'kk valasai', '', NULL, 1187, 2),
(550, '9789224756', 'udaiya ramco', 'kk valasai', '', NULL, 1188, 2),
(551, '8489221273', 'MR', 'Tenkasi', '', NULL, 1190, 2),
(552, '9949007672', 'syed basha', 'Tenkasi', '', NULL, 1193, 2),
(553, '8098594725', 'MR', 'Tenkasi', '', NULL, 1194, 2),
(554, '9789024742', 'MR', 'MELAGARAM', '', NULL, 1195, 2),
(555, '9965141410', 'MR', 'minnagar', '', NULL, 1196, 2),
(556, '9003199090', 'MR', 'Tenkasi', '', NULL, 1197, 2),
(557, '9486100139', 'MR', 'Tenkasi', '', NULL, 1198, 2),
(558, '6382539860', 'MR', 'Tenkasi', '', NULL, 1201, 2),
(559, '7904965698', 'MR', 'Tenkasi', '', NULL, 1212, 2),
(560, '9688308821', 'MR', 'kudiuruppu', '', NULL, 1214, 2),
(561, '9003418377', 'MR', 'Tenkasi', '', NULL, 1216, 2),
(562, '9489825747', 'MR', 'Tenkasi', '', NULL, 1218, 2),
(563, '9842188086', 'MR', 'senkottai', '', NULL, 1219, 2),
(564, '8220506068', 'MR', 'Tenkasi', '', NULL, 1223, 2),
(565, '9629246916', 'MR', 'ilanji', '', NULL, 1224, 2),
(566, '7708206623', 'MR', 'Tenkasi', '', NULL, 1226, 2),
(567, '8778747281', 'popular medical', 'Tenkasi', '', NULL, 1227, 2),
(568, '9486963844', 'lakshmi timber ', 'Tenkasi', '', NULL, 1229, 2),
(569, '9688546442', 'edwin ', 'mm puram', '', NULL, 1232, 2),
(570, '9629076461', 'MR', 'Tenkasi', '', NULL, 1234, 2),
(571, '8870632686', 'haja 311', 'ayyapuram', '', NULL, 1237, 2),
(572, '8608891629', 'MR', 'kattalaikudiruppu', '', NULL, 1239, 2),
(573, '9004575406', 'suresh babu', 'melagaram', '', NULL, 1242, 2),
(574, '9976139272', 'MR', 'tenkasi', '', NULL, 1250, 2),
(575, '6383437008', 'MR', 'Tenkasi', '', NULL, 1253, 2),
(576, '7550022972', 'MR', 'minnagar', '', NULL, 1255, 2),
(577, '9025474756', 'MR', 'Chinthamani', '', NULL, 1256, 2),
(578, '7010368494', 'karthick', 'Tenkasi', '', NULL, 1257, 2),
(579, '7010368494', 'karthick', 'Tenkasi', '', NULL, 1257, 2),
(580, '7010368494', 'karthick', 'Tenkasi', '', NULL, 1257, 2),
(581, '8754092409', 'MR', 'Tenkasi', '', NULL, 1259, 2),
(582, '7358432022', 'MR', 'Ayikudi', '', NULL, 1261, 2),
(583, '9944312295', 'murugan', 'Tenkasi', '', NULL, 1262, 2),
(584, '6382224893', 'MR', 'Tenkasi', '', NULL, 1265, 2),
(585, '7708206537', 'MR', 'Tenkasi', '', NULL, 1266, 2),
(586, '7305357387', 'MR', 'Tenkasi', '', NULL, 1267, 2),
(587, '8778528280', 'MR', 'Kandamangalam', '', NULL, 1268, 2),
(588, '8056124384', 'MR', 'urmeniazhagiyan', '', NULL, 1269, 2),
(589, '8825556190', 'MR', 'melagaram', '', NULL, 1274, 2),
(590, '9345000647', 'MR', 'Tirunelveli', '', NULL, 1275, 2),
(591, '9003070719', 'MR', 'Tenkasi', '', NULL, 1279, 2),
(592, '7010950801', 'MR', 'Tenkasi', '', NULL, 1280, 2),
(593, '9444103238', 'MR', 'Tenkasi', '', NULL, 1284, 2),
(594, '9382551530', 'santhi tata ace ', 'surandai', '', NULL, 1288, 2),
(595, '9840090361', 'MR', 'urmeniazhagiyan', '', NULL, 1290, 2),
(596, '7092096635', 'MR', 'melagaram', '', NULL, 1291, 2),
(597, '6383732291', 'MR', 'Tenkasi', '', NULL, 1292, 2),
(598, '9443613319', 'MR', 'melagaram ', '', NULL, 1293, 2),
(599, '8792993758', 'ramamnathan', 'Tenkasi', '', NULL, 1296, 2),
(600, '9994759910', 'MR', 'Tenkasi', '', NULL, 1299, 2),
(601, '9442287898', 'MR', 'Alangulam', '', NULL, 1301, 2),
(602, '7868840520', 'MR', 'Tenkasi', '', NULL, 1302, 2),
(603, '8838821546', 'MR', 'Tenkasi', '', NULL, 1310, 2),
(604, '8883311159', 'MR', 'kudiuruppu', '', NULL, 1313, 2),
(605, '8778455146', 'MR', 'Tenkasi', '', NULL, 1318, 2),
(606, '9566893420', 'MR', 'Tenkasi', '', NULL, 1319, 2),
(607, '8973186008', 'MR', 'Ayiraperi', '', NULL, 1324, 2),
(608, '7402270134', 'MR', 'Tenkasi', '', NULL, 1325, 2),
(609, '9842132442', 'MR', 'Tenkasi', '', NULL, 1326, 2),
(610, '9655118597', 'MR', 'Tenkasi', '', NULL, 1335, 2),
(611, '9444023281', 'MR', 'Thoothukudi', '', NULL, 1337, 2),
(612, '9787001918', 'MR', 'VALLAM', '', NULL, 1338, 2),
(613, '9894881426', 'MR', 'ilanji', '', NULL, 1340, 2),
(614, '9894881426', 'MR', 'ilanji', '', NULL, 1340, 2),
(615, '9597011641', 'MR', 'Tenkasi', '', NULL, 1341, 2),
(616, '9944279735', 'MR', 'melagaram', '', NULL, 1344, 2),
(617, '9843112832', 'MR', 'Tenkasi', '', NULL, 1346, 2),
(618, '8012428368', 'adithya', 'Madurai', '', NULL, 1347, 2),
(619, '9551502319', 'MR', 'Idaikal', '', NULL, 1348, 2),
(620, '9952218398', 'stalin ', 'melagaram', '', NULL, 1349, 2),
(621, '9790415134', 'gnanam', 'Tenkasi', '', NULL, 1350, 2),
(622, '9488306332', 'MR', 'ilanji', '', NULL, 1352, 2),
(623, '8861675397', 'MR', 'ilanji', '', NULL, 1355, 2),
(624, '6380414363', 'MR', 'Tenkasi', '', NULL, 1361, 2),
(625, '9597594449', 'MR', 'Piranoor', '', NULL, 1364, 2),
(626, '9345573511', 'MR', 'kasimejarpuram', '', NULL, 1366, 2),
(627, '9087376546', 'ESAKKI EB', 'TENKASI', '', NULL, 1367, 2),
(628, '8778315327', 'MR', 'Tenkasi', '', NULL, 1371, 2),
(629, '9443971800', 'selvakumar', 'melagaram', '', NULL, 1373, 2),
(630, '9843813071', 'MR', 'pavoorchathram', '', NULL, 1374, 2),
(631, '8220434184', 'Ravi', 'Senkottai', '', NULL, 1377, 2),
(632, '7893215647', 'NIWIN', 'VALLAM ', '', NULL, 1380, 2),
(633, '9710595545', 'MR', 'Tenkasi', '', NULL, 1381, 2),
(634, '9344518987', 'manikandan ', 'Keelapuliyur', '', NULL, 1383, 2),
(635, '9632427270', '', 'Tirunelveli', '', NULL, 1385, 2),
(636, '9841254810', 'thomas', 'Tenkasi', '', NULL, 1387, 2),
(637, '9994701285', 'MR', 'melagaram', '', NULL, 1391, 2),
(638, '9870271083', 'PARVATHI', 'Tenkasi', '', NULL, 1392, 2),
(639, '9894244221', 'MR', 'Tenkasi', '', NULL, 1395, 2),
(640, '7358815566', 'MR', 'kanakkapillavalasai', '', NULL, 1404, 2),
(641, '9865076979', 'vijaya', 'pavoorchathram', '', NULL, 1405, 2),
(642, '7904900806', 'muthukumar', 'Tenkasi', '', NULL, 1407, 2),
(643, '9042931934', 'rajesh', 'cuttralam', '', NULL, 1409, 2),
(644, '9487244941', 'MR', 'melagaram', '', NULL, 1416, 2),
(645, '8124245477', 'MR', 'Tenkasi', '', NULL, 1418, 2),
(646, '9003790573', 'MR', 'Senkottai', '', NULL, 1420, 2),
(647, '6379250146', 'MR', 'ilanji', '', NULL, 1422, 2),
(648, '8124656801', 'MR', 'Senkottai', '', NULL, 1426, 2),
(649, '8838347985', 'meenatchi sundaram', 'Tenkasi', '', NULL, 1427, 2),
(650, '9487369535', 'MR', 'Tenkasi', '', NULL, 1434, 2),
(651, '9629095167', 'MR', 'Tenkasi', '', NULL, 1441, 2),
(652, '9096349831', 'ahmed ', 'Avudaiyanoor', '', NULL, 1442, 2),
(653, '9655118597', 'subramanian ', 'Tenkasi', '', NULL, 1446, 2),
(654, '6385355175', 'MR', 'ayyapuram', '', NULL, 1448, 2),
(655, '6379393830', 'MR', 'melagaram', '', NULL, 1450, 2),
(656, '9500498869', 'navinkumar', 'Tenkasi', '', NULL, 1454, 2),
(657, '9489720349', 'subburaj', 'cuttralam', '', NULL, 1455, 2),
(658, '8838273764', 'MR', 'Tenkasi', '', NULL, 1459, 2),
(659, '8838273764', 'mono ', 'Tenkasi', '', NULL, 1462, 2),
(660, '8608360200', 'manikandan ', 'ilanji', '', NULL, 1463, 2),
(661, '9965094343', '', 'Tenkasi', '', NULL, 1464, 2),
(662, '9944662756', 'chithambaram ilanji', 'ilanji', '', NULL, 1465, 2),
(663, '9566593643', 'vijaya', 'kudiuruppu', '', NULL, 1469, 2),
(664, '9442330333', 'MR', 'Tenkasi', '', NULL, 1473, 2),
(665, '8248862637', 'MR', 'Tenkasi', '', NULL, 1474, 2),
(666, '9976007060', 'MR', 's kovil ', '', NULL, 1475, 2),
(667, '8754080355', 'AKSHAYA KUMAR ', 'Tenkasi', '', NULL, 1478, 2),
(668, '9865554980', 'MR', 'vallam', '', NULL, 1480, 2),
(669, '7598441426', 'MR', 'surandai', '', NULL, 1481, 2),
(670, '7867958862', 'MR', 'Tenkasi', '', NULL, 1486, 2),
(671, '7806917931', 'MR', 'Senkottai', '', NULL, 1488, 2),
(672, '8667596582', 'esakkiraj ', 'Madurai', '', NULL, 1490, 2),
(673, '9384213419', 'mr', 'minnagar', '', NULL, 1491, 8),
(674, '7708730520', 'MR', 'Keelapuliyur ', '', NULL, 1493, 2),
(675, '9650068052', 'MR', 'kadayanallur', '', NULL, 1498, 2),
(676, '9487665226', 'MR', 'ilanji', '', NULL, 1500, 2),
(677, '9087057669', 'syed baseer ', 'Tenkasi', '', NULL, 1503, 2),
(678, '9741996333', 'MR', 'Tirunelveli', '', NULL, 1504, 2),
(679, '8838823559', 'MR', 'melameganapuram', '', NULL, 1506, 2),
(680, '8778559164', 'raj ', 'Tenkasi', '', NULL, 1507, 2),
(681, '8667236033', 'sundar ', 'Kottakulam', '', NULL, 1514, 2),
(682, '9514340469', 'MR', 'Tenkasi', '', NULL, 1516, 2),
(683, '7550303327', 'MR', 'ilanji', '', NULL, 1517, 2),
(684, '9080334145', 'maniraj', 'melagaram', '', NULL, 1519, 2),
(685, '9994240664', 'MR', 'Tenkasi', '', NULL, 1528, 2),
(686, '8148214401', 'MR', 'Piranoor', '', NULL, 1530, 2),
(687, '9994841099', 'murugan', 'melagaram', '', NULL, 1534, 2),
(688, '8056902751', 'MR', 'cuttralam', '', NULL, 1537, 2),
(689, '9094001166', 'MR', 'Tenkasi', '', NULL, 1547, 2),
(690, '9488379211', 'balasubramanian ', 'Tenkasi', '', NULL, 1549, 2),
(691, '6379872930', 'sf sonic ', 'Tenkasi', '', NULL, 1551, 2),
(692, '6379829949', 'MR', 'Idaikal', '', NULL, 1552, 2),
(693, '6379829949', 'MR', 'Idaikal', '', NULL, 1552, 2),
(694, '8870140526', 'hariharan', 'ilanji', '', NULL, 1552, 2),
(695, '9750483342', 'MR', 'melagaram', '', NULL, 1555, 2),
(696, '9789140865', 'MR', 'Tenkasi', '', NULL, 1556, 2),
(697, '8072299789', 'suresh babu', 'Tenkasi', '', NULL, 1560, 2),
(698, '6380639526', 'MR', 'melagaram', '', NULL, 1561, 2),
(699, '8220550456', 'MR', 'Kottakulam', '', NULL, 1565, 2),
(700, '9087040637', 'MR', 'Tenkasi', '', NULL, 1568, 2),
(701, '9994311701', 'MR', 'sivaramapettai', '', NULL, 1569, 2),
(702, '9842125055', 'jayaraman', 'melagaram', '', NULL, 1570, 2),
(703, '7042183804', 'ganesh', 'Tenkasi', '', NULL, 1572, 2),
(704, '9715098606', 'sridevi', 'Tenkasi', '', NULL, 1575, 2),
(705, '8939857105', 'rajkumar', 'Tenkasi', '', NULL, 1576, 2),
(706, '9940875774', 'MR', 'Tenkasi', '', NULL, 1580, 2),
(707, '9442528449', 'MR', 'melagaram', '', NULL, 1582, 2),
(708, '9994388666', 'rajesh', 'Tenkasi', '', NULL, 1583, 2),
(709, '8838362929', 'siva ', 'Tenkasi', '', NULL, 1585, 2),
(710, '9842168640', 'jegan ', 'Tenkasi', '', NULL, 1592, 2),
(711, '6382329820', 'palanisamy', 'Tenkasi', '', NULL, 1595, 2),
(712, '9600345489', 'amarnath', 'thiruvanandhapuram', '', NULL, 1598, 2),
(713, '9791561707', 'MR', 'Tenkasi', '', NULL, 1599, 2),
(714, '9718444156', 'siva ', 'Tenkasi', '', NULL, 1600, 2),
(715, '9965108933', 'MR', 'melagaram ', '', NULL, 1602, 2),
(716, '9488845838', 'MR', 'ilanji', '', NULL, 1607, 2),
(717, '9488845838', 'MR', 'ilanji', '', NULL, 1607, 2),
(718, '7502125069', 'MR', 'Tenkasi', '', NULL, 1607, 2),
(719, '9500574148', 'banu ', 'kudiuruppu ', '', NULL, 1610, 2),
(720, '9080250668', 'kalyani', 'Tenkasi', '', NULL, 1611, 2),
(721, '8760940087', 'MR', 'Tenkasi', '', NULL, 1612, 2),
(722, '8903661580', 'PRABU', 'melagaram', '', NULL, 1622, 2),
(723, '9994570925', 'MR', 'minnagar', '', NULL, 1646, 2),
(724, '9842009846', 'MR', 'Tenkasi', '', NULL, 1646, 2),
(725, '8248826967', 'MR', 'Tenkasi', '', NULL, 1648, 2),
(726, '9003538766', 'MR', 'Tenkasi', '', NULL, 1651, 2),
(727, '9095574601', 'sounder', 'melagaram', '', NULL, 1652, 2),
(728, '8015718804', 'SANKAR', 'Tenkasi', '', NULL, 1654, 2),
(729, '9514498586', 'siddiq', 'cuttrallam', '', NULL, 1655, 2),
(730, '7010855284', 'MR', 'kattalaikudiruppu', '', NULL, 1660, 2),
(731, '9080125912', 'MR', 'Tenkasi', '', NULL, 1661, 2),
(732, '8248430431', 'marimuthu', 'Tenkasi', '', NULL, 1663, 2),
(733, '8754304370', 'senthil', 'ilanji', '', NULL, 1665, 2),
(734, '9384943977', 'velladurai', 'Tenkasi', '', NULL, 1666, 2),
(735, '7010684695', 'MR', 'Tenkasi', '', NULL, 1669, 2),
(736, '7305571891', 'david ', 'pavoorchathram', '', NULL, 1678, 2),
(737, '9840230847', 'raja', 'Elathur', '', NULL, 1680, 2),
(738, '9043389982', 'MR', 'senkottai', '', NULL, 1683, 2),
(739, '7305851540', 'MR', 'minnagar', '', NULL, 1687, 2),
(740, '8682887594', 'aarumugam', 'Kottakulam', '', NULL, 1688, 2),
(741, '8838284439', 'MR', 'surandai', '', NULL, 1692, 2),
(742, '9791176842', 'MR', 'Alangulam', '', NULL, 1695, 2),
(743, '6382981714', 'MR', 'Tenkasi', '', NULL, 1696, 2),
(744, '9940576245', 'samynathan', 'Tenkasi', '', NULL, 1699, 2),
(745, '8940404560', 'anandha bakery ', 'melagaram', '', NULL, 1702, 2),
(746, '9659462348', 'sabari', 'melagaram', '', NULL, 1704, 2),
(747, '9976635214', 'MR', 'melagaram', '', NULL, 1707, 2),
(748, '9789405474', 'MR', 'Tenkasi', '', NULL, 1709, 2),
(749, '9710422888', 'murugan', 'melagaram', '', NULL, 1716, 2),
(750, '7010341572', 'MR', 'Tenkasi', '', NULL, 1720, 2),
(751, '9025710479', 'MR', 'Tenkasi', '', NULL, 1723, 2),
(752, '9944441467', 'MR', 'Cuttralam ', '', NULL, 1723, 2),
(753, '9788347315', 'MR', 'cuttralam', '', NULL, 1725, 2),
(754, '9962098495', 'MR', 'cuttralam ', '', NULL, 1726, 2),
(755, '9952377601', 'MR', 'Senkottai', '', NULL, 1730, 2),
(756, '8870303116', 'dixson ', 'cuttralam', '', NULL, 1731, 2),
(757, '9952539932', 'ajay', 'ilanji', '', NULL, 1733, 2),
(758, '9952533692', 'nagaraj', 'Melapavoor', '', NULL, 1735, 2),
(759, '7502073366', 'hari', 'Tenkasi', '', NULL, 1737, 2),
(760, '8778537962', 'amarnath', 'Tenkasi', '', NULL, 1738, 2),
(761, '8667080932', 'vignesh', 'Tenkasi', '', NULL, 1740, 2),
(762, '8870193065', 'MR', 'Tenkasi', '', NULL, 1743, 2),
(763, '9444037258', 'arumugam', 'Tenkasi', '', NULL, 1750, 2),
(764, '9790219373', 'kannan ', 'Ayiraperi', '', NULL, 1752, 2),
(765, '8870600451', 'anand', 'arunaperi ', '', NULL, 1755, 2),
(766, '8122929993', 'MR', 'Tenkasi', '', NULL, 1760, 2),
(767, '9488301363', 'ganesan', 'Tenkasi', '', NULL, 1765, 2),
(768, '8056105634', 'navin', 'Tenkasi', '', NULL, 1771, 2),
(769, '8524065551', 'nijam', 'Senkottai', '', NULL, 1772, 2),
(770, '8870311997', 'MR', 'Tenkasi', '', NULL, 1775, 2),
(771, '9486010653', 'gowrisankar', 'Tenkasi', '', NULL, 1779, 2),
(772, '6385612126', 'MR', 'Tenkasi', '', NULL, 1780, 2),
(773, '9442079127', 'MR', 'Tenkasi', '', NULL, 1784, 2),
(774, '8124840760', 'MR', 'Tenkasi', '', NULL, 1785, 2),
(775, '7010465009', 'kumar ', 'melagaram', '', NULL, 1794, 2),
(776, '9080307363', 'ganesh puncher', 'melagaram', '', NULL, 1797, 2),
(777, '9176322956', 'subramanian melagrm', 'melagaram', '', NULL, 1798, 2),
(778, '9894701193', 'MR', 'Tenkasi', '', NULL, 1799, 2),
(779, '6379133756', 'pandi ', 'Tenkasi', '', NULL, 1804, 2),
(780, '8072117672', 'RAMESH', 'Tenkasi', '', NULL, 1805, 2),
(781, '9486964548', 'MR', 'melagaram', '', NULL, 1813, 2),
(782, '8248111219', 'ramachandran ', 'Sundarapandiapuram', '', NULL, 1819, 2),
(783, '8075723624', 'MR', 'achanpudur ', '', NULL, 1820, 2),
(784, '8220567399', 'MR', 'Melagaram ', '', NULL, 1822, 2),
(785, '9941894552', 'shanmugam', 'Panpoli', '', NULL, 1832, 2),
(786, '9710795551', 'arputharaj', 'Tenkasi', '', NULL, 1836, 2),
(787, '9442542758', 'hari vasu', 'melagaram', '', NULL, 1837, 2),
(788, '9865458214', 'MR', 'melagaram', '', NULL, 1840, 2),
(789, '9865427670', 'MR', 'melagaram', '', NULL, 1840, 2),
(790, '8667297889', 'MR', 'ambai', '', NULL, 1843, 2),
(791, '8940389679', 'MR', 'Tenkasi', '', NULL, 1844, 2),
(792, '8940389679', 'MR', 'Tenkasi', '', NULL, 1844, 2),
(793, '8220771220', 'MR', 'Tenkasi', '', NULL, 1846, 2),
(794, '9087185257', 'MR', 'Mathalamparai', '', NULL, 1847, 2),
(795, '6369835855', 'c ramesh', 'Tenkasi', '', NULL, 1850, 2),
(796, '8667297889', 'MR', 'ambai', '', NULL, 1853, 2),
(797, '9791663654', '', 'Tenkasi ', '', NULL, 1860, 2),
(798, '9150368329', 'Mr', 'Tenkasi', '', NULL, 1861, 2),
(799, '9486106750', 'Rathinavel ', 'Melagaram ', '', NULL, 1863, 2),
(800, '8248729533', '', 'Nagarcoil ', '', NULL, 1865, 2),
(801, '9361495560', 'abdul', 'achanpudur ', '', NULL, 1874, 2),
(802, '9600221094', 'ramalakshmi', 'Tenkasi', '', NULL, 1874, 2),
(803, '9361495560', 'abdul', 'achanpudur ', '', NULL, 1875, 2),
(804, '8825594411', 'MR', 'melagaram', '', NULL, 1877, 2),
(805, '9384991382', 'veeramani', 'kudiuruppu', '', NULL, 1878, 2),
(806, '8825594411', 'poorni', 'melagaram', '', NULL, 1879, 2),
(807, '9994542886', 'nirmal', 'Tenkasi', '', NULL, 1880, 2),
(808, '9597720987', 'gopalakrishnan', 'pullukattuvalasai', '', NULL, 1881, 2),
(809, '8220306825', 'MR', 'ayyapuram', '', NULL, 1885, 2),
(810, '9952681412', 'MR', 'Tenkasi', '', NULL, 1888, 2),
(811, '9384721811', 'MR', 'Tenkasi', '', NULL, 1895, 2),
(812, '8667691241', 'MR', 'Tenkasi', '', NULL, 1896, 2),
(813, '7358469033', 'suresh', 'Kadapogathi', '', NULL, 1907, 2),
(814, '9042199108', 'srikanth ', 'Tenkasi', '', NULL, 1908, 2),
(815, '9786097657', '', 'Tirunelveli ', '', NULL, 1916, 2),
(816, '6380065762', 'MR', 'Surandai ', '', NULL, 1920, 2),
(817, '9626022645', '', 'Melagaram', '', NULL, 1922, 2),
(818, '9362411716', 'iyappan ', 'minnagar', '', NULL, 1929, 2),
(819, '9442064433', 'MR', 'tenkasi', '', NULL, 1931, 2),
(820, '9943427214', 'selvam eng', 'Tenkasi', '', NULL, 1938, 2),
(821, '8056532772', 'BALA', 'Tenkasi', '', NULL, 1939, 2),
(822, '9443670777', 'thomas bsnl', 'Tenkasi', '', NULL, 1940, 2),
(823, '9841663083', 'MR', 'ilanji', '', NULL, 1942, 2),
(824, '8072419311', 'MR', 'Senkottai', '', NULL, 1944, 2),
(825, '9025649930', 'MR', 'kadayanallur', '', NULL, 1945, 2),
(826, '9600413837', 'MR', 'melagaram', '', NULL, 1947, 2),
(827, '9442796464', 'sankaranarayanan', 'melagaram', '', NULL, 1948, 2),
(828, '9490168391', 'joshua ', 'Madurai', '', NULL, 1958, 2),
(829, '8098998980', 'CSC ', 'Tenkasi', '', NULL, 1963, 2),
(830, '7904657321', 'MR', 'Tenkasi', '', NULL, 1966, 2),
(831, '9361530199', 'peratchi selvam', 'Tenkasi', '', NULL, 1967, 2),
(832, '9894497738', 'rajendran oormeni', 'urmeniazhagiyan', '', NULL, 1968, 2),
(833, '9994019702', 'MR', 'Ayikudi', '', NULL, 1970, 2),
(834, '8012718900', 'MR', 'Tenkasi', '', NULL, 1971, 2),
(835, '8098998980', 'CSC ', 'tenkasi', '', NULL, 1972, 2),
(836, '9842186460', 'MR', 'Tenkasi', '', NULL, 1974, 2),
(837, '9952524618', 'murugan', 'Idaikal', '', NULL, 1981, 2),
(838, '6374100745', 'MR', 'Tenkasi', '', NULL, 1983, 2),
(839, '6382219483', 'MR', 'Tenkasi', '', NULL, 1984, 2),
(840, '7339129673', 'MR', 'Senkottai', '', NULL, 1988, 2),
(841, '9865757222', 'MR', 'Tenkasi', '', NULL, 1991, 2),
(842, '9941319777', '', 'Urmeniazhagiyan ', '', NULL, 1996, 2),
(843, '7373369820', 'sagunthala', 'melagaram', '', NULL, 2000, 2),
(844, '9159673700', 'subbaiah ktc', 'rettiyarpatti', '', NULL, 2001, 2),
(845, '8668161589', 'subramani ', 'Tenkasi', '', NULL, 2002, 2),
(846, '6374638399', 'MR', 'Tenkasi', '', NULL, 2005, 2),
(847, '9865055244', '', 'Tenkasi', '', NULL, 2008, 2),
(848, '8903929873', 'Mr ', 'Tenkasi ', '', NULL, 2015, 2),
(849, '9994542886', 'nirmal', 'Tenkasi', '', NULL, 2016, 2),
(850, '9597158123', 'MR', 'valliyoor', '', NULL, 2017, 2),
(851, '9597158123', 'MR', 'valliyoor', '', NULL, 2017, 2),
(852, '7010392558', 'MR', 'Tenkasi', '', NULL, 2023, 2),
(853, '9629082827', 'subburaj', 'Senkottai', '', NULL, 2031, 2),
(854, '9944879470', 'MR', 'Tenkasi', '', NULL, 2032, 2),
(855, '9944819470', 'veerasamy', 'Tenkasi', '', NULL, 2033, 2),
(856, '8870529050', 'MR', 'tenkasi', '', NULL, 2034, 2);
INSERT INTO `new_customer` (`id`, `m_no`, `b_name`, `p_city`, `drop_place`, `amount`, `b_id`, `user_id`) VALUES
(857, '9384077934', 'MR', 'Tenkasi', '', NULL, 2035, 2),
(858, '9003749393', 'siva financial', 'Kottakulam', '', NULL, 2037, 2),
(859, '8870704438', 'karthick', 'Tenkasi', '', NULL, 2040, 2),
(860, '9894057909', 'MR', 'Panpoli', '', NULL, 2044, 2),
(861, '9003406154', 'Arunachalam ', 'Tenkasi ', '', NULL, 2053, 2),
(862, '9443228163', 'MR', 'Tenkasi', '', NULL, 2057, 2),
(863, '9629082457', 'issac', 'Tenkasi', '', NULL, 2058, 2),
(864, '8610540017', 'MR', 'tenkasi', '', NULL, 2061, 2),
(865, '9080770663', 'MR', 'Idaikal', '', NULL, 2062, 2),
(866, '8778784228', 'MR', 'pavoorchathram', '', NULL, 2066, 2)
;

-- --------------------------------------------------------

--
-- Table structure for table `ontrip`
--

CREATE TABLE `ontrip` (
  `id` int(11) NOT NULL,
  `b_id` varchar(11) DEFAULT NULL,
  `bookin_time` timestamp NULL DEFAULT NULL,
  `assign_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `p_city` varchar(55) DEFAULT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `v_id` varchar(11) DEFAULT NULL,
  `v_type` varchar(55) NOT NULL,
  `v_no` varchar(15) NOT NULL,
  `d_mobile` varchar(12) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `m_no` varchar(12) DEFAULT NULL,
  `t_type` varchar(10) NOT NULL,
  `ac_type` varchar(10) NOT NULL,
  `assign` enum('0','1') DEFAULT '0',
  `pickup_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closing_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `open_km` varchar(55) DEFAULT NULL,
  `closing_km` varchar(55) DEFAULT NULL,
  `on_trip_status` enum('0','1') NOT NULL DEFAULT '0',
  `already_assign` varchar(10) NOT NULL,
  `to_whom` varchar(55) NOT NULL,
  `user_id` int(11) NOT NULL,
  `r_status` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `out_tariff`
--

CREATE TABLE `out_tariff` (
  `id` int(11) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `v_id` int(11) NOT NULL,
  `t_type` varchar(55) NOT NULL,
  `a1` float DEFAULT NULL,
  `a2` float DEFAULT NULL,
  `a3` float DEFAULT NULL,
  `a4` float DEFAULT NULL,
  `a5` float DEFAULT NULL,
  `a6` float DEFAULT NULL,
  `a7` float DEFAULT NULL,
  `a8` float DEFAULT NULL,
  `a9` float DEFAULT NULL,
  `a10` float DEFAULT NULL,
  `a11` float DEFAULT NULL,
  `a12` float DEFAULT NULL,
  `a13` float DEFAULT NULL,
  `a14` float DEFAULT NULL,
  `a15` float DEFAULT NULL,
  `a16` float DEFAULT NULL,
  `a17` float DEFAULT NULL,
  `a18` float DEFAULT NULL,
  `a19` float DEFAULT NULL,
  `a20` float DEFAULT NULL,
  `a21` float DEFAULT NULL,
  `a22` float DEFAULT NULL,
  `a23` float DEFAULT NULL,
  `a24` float DEFAULT NULL,
  `a25` float DEFAULT NULL,
  `a26` float DEFAULT NULL,
  `a27` float DEFAULT NULL,
  `a28` float DEFAULT NULL,
  `a29` float DEFAULT NULL,
  `a30` float DEFAULT NULL,
  `a31` float DEFAULT NULL,
  `a32` float DEFAULT NULL,
  `a33` float DEFAULT NULL,
  `a34` float DEFAULT NULL,
  `a35` float DEFAULT NULL,
  `a36` float DEFAULT NULL,
  `a37` float DEFAULT NULL,
  `a38` float DEFAULT NULL,
  `a39` float DEFAULT NULL,
  `a40` float DEFAULT NULL,
  `a41` float DEFAULT NULL,
  `a42` float DEFAULT NULL,
  `a43` float DEFAULT NULL,
  `a44` float DEFAULT NULL,
  `a45` float DEFAULT NULL,
  `a46` float DEFAULT NULL,
  `a47` float DEFAULT NULL,
  `a48` float DEFAULT NULL,
  `a49` float DEFAULT NULL,
  `a50` float DEFAULT NULL,
  `a51` float DEFAULT NULL,
  `a52` float DEFAULT NULL,
  `a53` float DEFAULT NULL,
  `a54` float DEFAULT NULL,
  `a55` float DEFAULT NULL,
  `a56` float DEFAULT NULL,
  `a57` float DEFAULT NULL,
  `a58` float DEFAULT NULL,
  `a59` float DEFAULT NULL,
  `a60` float DEFAULT NULL,
  `a61` float DEFAULT NULL,
  `a62` float DEFAULT NULL,
  `a63` float DEFAULT NULL,
  `a64` float DEFAULT NULL,
  `a65` float DEFAULT NULL,
  `a66` float DEFAULT NULL,
  `a67` float DEFAULT NULL,
  `a68` float DEFAULT NULL,
  `a69` float DEFAULT NULL,
  `a70` float DEFAULT NULL,
  `a71` float DEFAULT NULL,
  `a72` float DEFAULT NULL,
  `a73` float DEFAULT NULL,
  `a74` float DEFAULT NULL,
  `a75` float DEFAULT NULL,
  `a76` float NOT NULL,
  `a77` float NOT NULL,
  `a78` float NOT NULL,
  `a79` float NOT NULL,
  `a80` float NOT NULL,
  `a81` float NOT NULL,
  `a82` float NOT NULL,
  `a83` float NOT NULL,
  `a84` float NOT NULL,
  `a85` float NOT NULL,
  `a86` float NOT NULL,
  `a87` float NOT NULL,
  `a88` float NOT NULL,
  `a89` float NOT NULL,
  `a90` float NOT NULL,
  `a91` float NOT NULL,
  `a92` float NOT NULL,
  `a93` float NOT NULL,
  `a94` float NOT NULL,
  `a95` float NOT NULL,
  `a96` float NOT NULL,
  `a97` float NOT NULL,
  `a98` float NOT NULL,
  `a99` float NOT NULL,
  `a100` float NOT NULL,
  `a101` float NOT NULL,
  `a102` float NOT NULL,
  `a103` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `out_tariff`
--

INSERT INTO `out_tariff` (`id`, `v_type`, `v_id`, `t_type`, `a1`, `a2`, `a3`, `a4`, `a5`, `a6`, `a7`, `a8`, `a9`, `a10`, `a11`, `a12`, `a13`, `a14`, `a15`, `a16`, `a17`, `a18`, `a19`, `a20`, `a21`, `a22`, `a23`, `a24`, `a25`, `a26`, `a27`, `a28`, `a29`, `a30`, `a31`, `a32`, `a33`, `a34`, `a35`, `a36`, `a37`, `a38`, `a39`, `a40`, `a41`, `a42`, `a43`, `a44`, `a45`, `a46`, `a47`, `a48`, `a49`, `a50`, `a51`, `a52`, `a53`, `a54`, `a55`, `a56`, `a57`, `a58`, `a59`, `a60`, `a61`, `a62`, `a63`, `a64`, `a65`, `a66`, `a67`, `a68`, `a69`, `a70`, `a71`, `a72`, `a73`, `a74`, `a75`, `a76`, `a77`, `a78`, `a79`, `a80`, `a81`, `a82`, `a83`, `a84`, `a85`, `a86`, `a87`, `a88`, `a89`, `a90`, `a91`, `a92`, `a93`, `a94`, `a95`, `a96`, `a97`, `a98`, `a99`, `a100`, `a101`, `a102`, `a103`) VALUES
(1, 'Indica', 1, 'Non Ac', 50, 50, 40, 9, 350, 440, 500, 585, 670, 755, 840, 925, 1010, 1095, 1180, 1265, 1350, 1435, 1520, 1605, 1690, 1775, 1860, 1945, 2030, 2115, 2200, 2285, 2370, 2455, 2540, 2625, 2710, 2795, 2880, 2965, 3050, 3135, 3220, 3305, 3390, 3475, 3560, 3645, 3730, 3815, 3900, 3985, 4070, 4155, 4240, 4325, 4410, 4495, 4580, 4665, 4750, 4835, 4920, 5005, 5090, 5175, 5260, 5345, 5430, 5515, 5600, 5685, 5770, 5855, 5940, 6025, 6110, 6195, 6280, 6365, 6450, 6535, 6620, 6705, 6790, 6875, 6960, 7045, 7130, 7215, 7300, 7385, 7470, 7555, 7640, 7725, 7810, 7895, 7980, 8065, 8150, 8235, 8320, 8405, 8490, 8575, 8660),
(2, 'Indica', 0, 'Ac', 50, 50, 40, 9.5, 350, 445, 540, 635, 730, 825, 920, 1015, 1110, 1205, 1300, 1395, 1490, 1585, 1680, 1775, 1870, 1965, 2060, 2155, 2250, 2345, 2440, 2535, 2630, 2725, 2820, 2915, 3010, 3105, 3200, 3295, 3390, 3485, 3580, 3675, 3770, 3865, 3960, 4055, 4150, 4245, 4340, 4435, 4530, 4625, 4720, 4815, 4910, 5005, 5100, 5195, 5290, 5385, 5480, 5575, 5670, 5765, 5860, 5955, 6050, 6145, 6240, 6335, 6430, 6525, 6620, 6715, 6810, 6905, 7000, 7095, 7190, 7285, 7380, 7475, 7570, 7665, 7760, 7855, 7950, 8045, 8140, 8235, 8330, 8425, 8520, 8615, 8710, 8805, 8900, 8995, 9090, 9185, 9280, 9375, 9470, 9565, 9660),
(3, 'Xcent', 2, 'Non Ac', 50, 50, 40, 8.5, 330, 415, 500, 585, 670, 755, 840, 925, 1010, 1095, 1180, 1265, 1350, 1435, 1520, 1605, 1690, 1775, 1860, 1945, 2030, 2115, 2200, 2285, 2370, 2455, 2540, 2625, 2710, 2795, 2880, 2965, 3050, 3135, 3220, 3305, 3390, 3475, 3560, 3645, 3730, 3815, 3900, 3985, 4070, 4155, 4240, 4325, 4410, 4495, 4580, 4665, 4750, 4835, 4920, 5005, 5090, 5175, 5260, 5345, 5430, 5515, 5600, 5685, 5770, 5855, 5940, 6025, 6110, 6195, 6280, 6365, 6450, 6535, 6620, 6705, 6790, 6875, 6960, 7045, 7130, 7215, 7300, 7385, 7470, 7555, 7640, 7725, 7810, 7895, 7980, 8065, 8150, 8235, 8320, 8405, 8490, 8575, 8660),
(4, 'Xcent', 0, 'Ac', 50, 50, 40, 9.5, 350, 445, 540, 635, 730, 825, 920, 1015, 1110, 1205, 1300, 1395, 1490, 1585, 1680, 1775, 1870, 1965, 2060, 2155, 2250, 2345, 2440, 2535, 2630, 2725, 2820, 2915, 3010, 3105, 3200, 3295, 3390, 3485, 3580, 3675, 3770, 3865, 3960, 4055, 4150, 4245, 4340, 4435, 4530, 4625, 4720, 4815, 4910, 5005, 5100, 5195, 5290, 5385, 5480, 5575, 5670, 5765, 5860, 5955, 6050, 6145, 6240, 6335, 6430, 6525, 6620, 6715, 6810, 6905, 7000, 7095, 7190, 7285, 7380, 7475, 7570, 7665, 7760, 7855, 7950, 8045, 8140, 8235, 8330, 8425, 8520, 8615, 8710, 8805, 8900, 8995, 9090, 9185, 9280, 9375, 9470, 9565, 9660),
(5, 'Zest', 3, 'Non Ac', 50, 50, 40, 8.5, 330, 415, 500, 585, 670, 755, 840, 925, 1010, 1095, 1180, 1265, 1350, 1435, 1520, 1605, 1690, 1775, 1860, 1945, 2030, 2115, 2200, 2285, 2370, 2455, 2540, 2625, 2710, 2795, 2880, 2965, 3050, 3135, 3220, 3305, 3390, 3475, 3560, 3645, 3730, 3815, 3900, 3985, 4070, 4155, 4240, 4325, 4410, 4495, 4580, 4665, 4750, 4835, 4920, 5005, 5090, 5175, 5260, 5345, 5430, 5515, 5600, 5685, 5770, 5855, 5940, 6025, 6110, 6195, 6280, 6365, 6450, 6535, 6620, 6705, 6790, 6875, 6960, 7045, 7130, 7215, 7300, 7385, 7470, 7555, 7640, 7725, 7810, 7895, 7980, 8065, 8150, 8235, 8320, 8405, 8490, 8575, 8660),
(6, 'Zest', 0, 'Ac', 50, 50, 40, 9.5, 350, 445, 540, 635, 730, 825, 920, 1015, 1110, 1205, 1300, 1395, 1490, 1585, 1680, 1775, 1870, 1965, 2060, 2155, 2250, 2345, 2440, 2535, 2630, 2725, 2820, 2915, 3010, 3105, 3200, 3295, 3390, 3485, 3580, 3675, 3770, 3865, 3960, 4055, 4150, 4245, 4340, 4435, 4530, 4625, 4720, 4815, 4910, 5005, 5100, 5195, 5290, 5385, 5480, 5575, 5670, 5765, 5860, 5955, 6050, 6145, 6240, 6335, 6430, 6525, 6620, 6715, 6810, 6905, 7000, 7095, 7190, 7285, 7380, 7475, 7570, 7665, 7760, 7855, 7950, 8045, 8140, 8235, 8330, 8425, 8520, 8615, 8710, 8805, 8900, 8995, 9090, 9185, 9280, 9375, 9470, 9565, 9660),
(7, 'Etios', 4, 'Non Ac', 50, 50, 40, 8.5, 330, 415, 500, 585, 670, 755, 840, 925, 1010, 1095, 1180, 1265, 1350, 1435, 1520, 1605, 1690, 1775, 1860, 1945, 2030, 2115, 2200, 2285, 2370, 2455, 2540, 2625, 2710, 2795, 2880, 2965, 3050, 3135, 3220, 3305, 3390, 3475, 3560, 3645, 3730, 3815, 3900, 3985, 4070, 4155, 4240, 4325, 4410, 4495, 4580, 4665, 4750, 4835, 4920, 5005, 5090, 5175, 5260, 5345, 5430, 5515, 5600, 5685, 5770, 5855, 5940, 6025, 6110, 6195, 6280, 6365, 6450, 6535, 6620, 6705, 6790, 6875, 6960, 7045, 7130, 7215, 7300, 7385, 7470, 7555, 7640, 7725, 7810, 7895, 7980, 8065, 8150, 8235, 8320, 8405, 8490, 8575, 8660),
(8, 'Etios', 0, 'Ac', 50, 50, 40, 9.5, 350, 445, 540, 635, 730, 825, 920, 1015, 1110, 1205, 1300, 1395, 1490, 1585, 1680, 1775, 1870, 1965, 2060, 2155, 2250, 2345, 2440, 2535, 2630, 2725, 2820, 2915, 3010, 3105, 3200, 3295, 3390, 3485, 3580, 3675, 3770, 3865, 3960, 4055, 4150, 4245, 4340, 4435, 4530, 4625, 4720, 4815, 4910, 5005, 5100, 5195, 5290, 5385, 5480, 5575, 5670, 5765, 5860, 5955, 6050, 6145, 6240, 6335, 6430, 6525, 6620, 6715, 6810, 6905, 7000, 7095, 7190, 7285, 7380, 7475, 7570, 7665, 7760, 7855, 7950, 8045, 8140, 8235, 8330, 8425, 8520, 8615, 8710, 8805, 8900, 8995, 9090, 9185, 9280, 9375, 9470, 9565, 9660),
(9, 'Swift', 5, 'Non Ac', 60, 60, 50, 9.5, 370, 465, 560, 655, 750, 845, 940, 1035, 1130, 1225, 1320, 1415, 1510, 1605, 1700, 1795, 1890, 1985, 2080, 2175, 2270, 2365, 2460, 2555, 2650, 2745, 2840, 2935, 3030, 3125, 3220, 3315, 3410, 3505, 3600, 3695, 3790, 3885, 3980, 4075, 4170, 4265, 4360, 4455, 4550, 4645, 4740, 4835, 4930, 5025, 5120, 5215, 5310, 5405, 5500, 5595, 5690, 5785, 5880, 5975, 6070, 6165, 6260, 6355, 6450, 6545, 6640, 6735, 6830, 6925, 7020, 7115, 7210, 7305, 7400, 7495, 7590, 7685, 7780, 7875, 7970, 8065, 8160, 8255, 8350, 8445, 8540, 8635, 8730, 8825, 8920, 9015, 9110, 9205, 9300, 9395, 9490, 9585, 9680),
(10, 'Swift', 0, 'Ac', 60, 60, 50, 10.5, 390, 495, 600, 705, 810, 915, 1020, 1125, 1230, 1335, 1440, 1545, 1650, 1755, 1860, 1965, 2070, 2175, 2280, 2385, 2490, 2595, 2700, 2805, 2910, 3015, 3120, 3225, 3330, 3435, 3540, 3645, 3750, 3855, 3960, 4065, 4170, 4275, 4380, 4485, 4590, 4695, 4800, 4905, 5010, 5115, 5220, 5325, 5430, 5535, 5640, 5745, 5850, 5955, 6060, 6165, 6270, 6375, 6480, 6585, 6690, 6795, 6900, 7005, 7110, 7215, 7320, 7425, 7530, 7635, 7740, 7845, 7950, 8055, 8160, 8265, 8370, 8475, 8580, 8685, 8790, 8895, 9000, 9105, 9210, 9315, 9420, 9525, 9630, 9735, 9840, 9945, 10050, 10155, 10260, 10365, 10470, 10575, 10680)
;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `descrip` varchar(255) DEFAULT NULL,
  `hsn` varchar(10) DEFAULT NULL,
  `qty` varchar(10) DEFAULT NULL,
  `unites` varchar(10) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `gst` int(11) DEFAULT NULL,
  `gst_value` float DEFAULT NULL,
  `amount` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refused`
--

CREATE TABLE `refused` (
  `id` int(11) NOT NULL,
  `b_id` varchar(55) DEFAULT NULL,
  `v_id` varchar(55) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `pickup` datetime DEFAULT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `r_date` timestamp NULL DEFAULT NULL,
  `date_refused` date NOT NULL,
  `miss_amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `refused_ontrip`
--

CREATE TABLE `refused_ontrip` (
  `id` int(11) NOT NULL,
  `b_id` varchar(50) DEFAULT NULL,
  `v_id` varchar(50) DEFAULT NULL,
  `reason_for` varchar(550) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smssetting`
--

CREATE TABLE `smssetting` (
  `id` int(11) NOT NULL,
  `smsoption` varchar(15) DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `update_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `smssetting`
--

INSERT INTO `smssetting` (`id`, `smsoption`, `update_date`, `update_by`) VALUES
(5, '1', '2020-06-17 09:38:00', 1)
;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(55) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `u_type` varchar(55) DEFAULT NULL,
  `mobile` varchar(55) DEFAULT NULL,
  `pwd` varchar(55) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `j_date` date DEFAULT NULL,
  `salary` varchar(55) DEFAULT NULL,
  `per_month` varchar(55) DEFAULT NULL,
  `hrsp_day` varchar(55) DEFAULT NULL,
  `hrs_day` varchar(55) DEFAULT NULL,
  `hrs_night` varchar(55) DEFAULT NULL,
  `emp_status` enum('0','1') DEFAULT '0',
  `r_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_chat`
--

CREATE TABLE `test_chat` (
  `id` int(11) NOT NULL,
  `vid` varchar(55) DEFAULT NULL,
  `amount` varchar(55) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `v_attach`
--

CREATE TABLE `v_attach` (
  `id` int(11) NOT NULL,
  `v_cat` varchar(55) DEFAULT NULL,
  `v_brand` varchar(55) DEFAULT NULL,
  `v_model` varchar(55) DEFAULT NULL,
  `v_no` varchar(55) DEFAULT NULL,
  `joining` date DEFAULT NULL,
  `ie_date` date DEFAULT NULL,
  `fc_date` date DEFAULT NULL,
  `pe_date` date DEFAULT NULL,
  `puc_date` date DEFAULT NULL,
  `rt_date` date DEFAULT NULL,
  `v_id` varchar(55) DEFAULT NULL,
  `v_own` enum('0','1') DEFAULT '0',
  `seat_a` varchar(55) DEFAULT NULL,
  `att_type` varchar(55) DEFAULT NULL,
  `d_mobile` varchar(55) DEFAULT NULL,
  `o_mobile` varchar(55) DEFAULT NULL,
  `adv_amt` varchar(55) DEFAULT NULL,
  `y_model` varchar(55) DEFAULT NULL,
  `d_name` varchar(55) NOT NULL,
  `o_name` varchar(55) NOT NULL,
  `vacant_place` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `v_login`
--

CREATE TABLE `v_login` (
  `id` int(11) NOT NULL,
  `v_cat` varchar(55) DEFAULT NULL,
  `v_brand` varchar(55) DEFAULT NULL,
  `v_model` varchar(55) DEFAULT NULL,
  `v_no` varchar(55) DEFAULT NULL,
  `v_id` varchar(55) DEFAULT NULL,
  `v_own` varchar(55) DEFAULT NULL,
  `seat_a` varchar(55) DEFAULT NULL,
  `att_type` varchar(55) DEFAULT NULL,
  `d_mobile` varchar(55) DEFAULT NULL,
  `o_mobile` varchar(55) DEFAULT NULL,
  `d_name` varchar(55) DEFAULT NULL,
  `o_name` varchar(55) DEFAULT NULL,
  `vacant_place` varchar(55) DEFAULT NULL,
  `ontrip_status` enum('0','1') DEFAULT '0',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active_status` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `w_attach`
--

CREATE TABLE `w_attach` (
  `id` int(11) NOT NULL,
  `v_cat` varchar(55) DEFAULT NULL,
  `v_brand` varchar(55) DEFAULT NULL,
  `v_model` varchar(55) DEFAULT NULL,
  `v_no` varchar(55) DEFAULT NULL,
  `joining` date DEFAULT NULL,
  `ie_date` date DEFAULT NULL,
  `fc_date` date DEFAULT NULL,
  `pe_date` date DEFAULT NULL,
  `puc_date` date DEFAULT NULL,
  `rt_date` date DEFAULT NULL,
  `v_id` varchar(55) DEFAULT NULL,
  `v_own` enum('0','1') DEFAULT '0',
  `seat_a` varchar(55) DEFAULT NULL,
  `att_type` varchar(55) DEFAULT NULL,
  `d_mobile` varchar(55) DEFAULT NULL,
  `o_mobile` varchar(55) DEFAULT NULL,
  `adv_amt` varchar(55) DEFAULT NULL,
  `y_model` varchar(55) DEFAULT NULL,
  `d_name` varchar(55) NOT NULL,
  `o_name` varchar(55) NOT NULL,
  `vacant_place` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `w_booking`
--

CREATE TABLE `w_booking` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `enquery_id` int(11) NOT NULL,
  `e_id` varchar(55) NOT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `b_date` date NOT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `to_whom` varchar(55) DEFAULT NULL,
  `a_no` varchar(55) DEFAULT NULL,
  `cus_count` varchar(55) NOT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `r_status` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `st` varchar(255) DEFAULT NULL,
  `t_type` varchar(10) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(55) DEFAULT NULL,
  `b_type` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `b_now` varchar(10) DEFAULT NULL,
  `q` varchar(55) NOT NULL,
  `v_types` varchar(55) NOT NULL,
  `v_no` varchar(20) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `assign` enum('0','1') NOT NULL DEFAULT '0',
  `booking_status` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `w_cancel`
--

CREATE TABLE `w_cancel` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `e_id` varchar(55) NOT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `b_date` date NOT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `to_whom` varchar(55) DEFAULT NULL,
  `a_no` varchar(55) DEFAULT NULL,
  `cus_count` varchar(55) NOT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `r_status` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `st` varchar(255) DEFAULT NULL,
  `t_type` varchar(10) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(55) DEFAULT NULL,
  `b_type` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `b_now` varchar(10) DEFAULT NULL,
  `q` varchar(55) NOT NULL,
  `v_types` varchar(55) NOT NULL,
  `v_no` varchar(20) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `assign` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `w_enquery`
--

CREATE TABLE `w_enquery` (
  `id` int(11) NOT NULL,
  `b_id` int(11) DEFAULT NULL,
  `enquery_id` int(11) NOT NULL,
  `e_id` varchar(55) NOT NULL,
  `pickup` timestamp NULL DEFAULT NULL,
  `b_date` date NOT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `to_whom` varchar(55) DEFAULT NULL,
  `a_no` varchar(55) DEFAULT NULL,
  `cus_count` varchar(55) NOT NULL,
  `p_city` varchar(55) DEFAULT NULL,
  `r_status` varchar(55) DEFAULT NULL,
  `m_no` varchar(55) NOT NULL,
  `v_type` varchar(55) DEFAULT NULL,
  `st` varchar(255) DEFAULT NULL,
  `t_type` varchar(10) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `ac_type` varchar(55) DEFAULT NULL,
  `b_type` varchar(55) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `b_now` varchar(10) DEFAULT NULL,
  `q` varchar(55) NOT NULL,
  `v_types` varchar(55) NOT NULL,
  `v_no` varchar(20) NOT NULL,
  `d_mobile` varchar(55) NOT NULL,
  `assign` enum('0','1') NOT NULL DEFAULT '0',
  `enquery` enum('0','1') NOT NULL DEFAULT '0',
  `booking_status` enum('0','1') NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `w_ontrip`
--

CREATE TABLE `w_ontrip` (
  `id` int(11) NOT NULL,
  `b_id` varchar(11) DEFAULT NULL,
  `bookin_time` timestamp NULL DEFAULT NULL,
  `assign_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `p_city` varchar(55) DEFAULT NULL,
  `d_place` varchar(55) DEFAULT NULL,
  `v_id` varchar(11) DEFAULT NULL,
  `v_type` varchar(55) NOT NULL,
  `v_no` varchar(15) NOT NULL,
  `d_mobile` varchar(12) DEFAULT NULL,
  `b_name` varchar(55) DEFAULT NULL,
  `m_no` varchar(12) DEFAULT NULL,
  `t_type` varchar(10) NOT NULL,
  `ac_type` varchar(10) NOT NULL,
  `assign` enum('0','1') DEFAULT '0',
  `pickup_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `closing_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `open_km` varchar(55) DEFAULT NULL,
  `closing_km` varchar(55) DEFAULT NULL,
  `on_trip_status` enum('0','1') NOT NULL DEFAULT '0',
  `already_assign` varchar(10) NOT NULL,
  `to_whom` varchar(55) NOT NULL,
  `user_id` int(11) NOT NULL,
  `r_status` varchar(55) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `w_staff`
--

CREATE TABLE `w_staff` (
  `id` int(11) NOT NULL,
  `emp_id` varchar(55) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `u_type` varchar(55) DEFAULT NULL,
  `mobile` varchar(55) DEFAULT NULL,
  `pwd` varchar(55) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `j_date` date DEFAULT NULL,
  `salary` varchar(55) DEFAULT NULL,
  `per_month` varchar(55) DEFAULT NULL,
  `hrsp_day` varchar(55) DEFAULT NULL,
  `hrs_day` varchar(55) DEFAULT NULL,
  `hrs_night` varchar(55) DEFAULT NULL,
  `emp_status` enum('0','1') DEFAULT '0',
  `r_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_product`
--
ALTER TABLE `add_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calcel_booking`
--
ALTER TABLE `calcel_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `closing`
--
ALTER TABLE `closing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cus_master`
--
ALTER TABLE `cus_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_login_status`
--
ALTER TABLE `emp_login_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquery_tariff`
--
ALTER TABLE `enquery_tariff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enqury_table`
--
ALTER TABLE `enqury_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eye_client`
--
ALTER TABLE `eye_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `francise`
--
ALTER TABLE `francise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ft_booking`
--
ALTER TABLE `ft_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ft_cus_master`
--
ALTER TABLE `ft_cus_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ft_login`
--
ALTER TABLE `ft_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ft_register`
--
ALTER TABLE `ft_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ft_staff`
--
ALTER TABLE `ft_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_calcel_booking`
--
ALTER TABLE `f_calcel_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_client`
--
ALTER TABLE `f_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_closing`
--
ALTER TABLE `f_closing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_cus_master`
--
ALTER TABLE `f_cus_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_enquery_tariff`
--
ALTER TABLE `f_enquery_tariff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_enqury_table`
--
ALTER TABLE `f_enqury_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_ft_booking`
--
ALTER TABLE `f_ft_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_local_tariff`
--
ALTER TABLE `f_local_tariff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_login_status`
--
ALTER TABLE `f_login_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_ontrip`
--
ALTER TABLE `f_ontrip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_ontrip_new`
--
ALTER TABLE `f_ontrip_new`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_out_tariff`
--
ALTER TABLE `f_out_tariff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_refused`
--
ALTER TABLE `f_refused`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_test_chat`
--
ALTER TABLE `f_test_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `f_v_attach`
--
ALTER TABLE `f_v_attach`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `local_tariff`
--
ALTER TABLE `local_tariff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_status`
--
ALTER TABLE `login_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `new_customer`
--
ALTER TABLE `new_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ontrip`
--
ALTER TABLE `ontrip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `out_tariff`
--
ALTER TABLE `out_tariff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refused`
--
ALTER TABLE `refused`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refused_ontrip`
--
ALTER TABLE `refused_ontrip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smssetting`
--
ALTER TABLE `smssetting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_chat`
--
ALTER TABLE `test_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `v_attach`
--
ALTER TABLE `v_attach`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `v_login`
--
ALTER TABLE `v_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_attach`
--
ALTER TABLE `w_attach`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_booking`
--
ALTER TABLE `w_booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_cancel`
--
ALTER TABLE `w_cancel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_enquery`
--
ALTER TABLE `w_enquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_ontrip`
--
ALTER TABLE `w_ontrip`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `w_staff`
--
ALTER TABLE `w_staff`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_product`
--
ALTER TABLE `add_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `calcel_booking`
--
ALTER TABLE `calcel_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `closing`
--
ALTER TABLE `closing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `cus_master`
--
ALTER TABLE `cus_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emp_login_status`
--
ALTER TABLE `emp_login_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `enquery_tariff`
--
ALTER TABLE `enquery_tariff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `enqury_table`
--
ALTER TABLE `enqury_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1362;

--
-- AUTO_INCREMENT for table `eye_client`
--
ALTER TABLE `eye_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `francise`
--
ALTER TABLE `francise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ft_booking`
--
ALTER TABLE `ft_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `ft_cus_master`
--
ALTER TABLE `ft_cus_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23874;

--
-- AUTO_INCREMENT for table `ft_login`
--
ALTER TABLE `ft_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ft_register`
--
ALTER TABLE `ft_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ft_staff`
--
ALTER TABLE `ft_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `f_calcel_booking`
--
ALTER TABLE `f_calcel_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=618;

--
-- AUTO_INCREMENT for table `f_client`
--
ALTER TABLE `f_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `f_closing`
--
ALTER TABLE `f_closing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3262;

--
-- AUTO_INCREMENT for table `f_cus_master`
--
ALTER TABLE `f_cus_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_enquery_tariff`
--
ALTER TABLE `f_enquery_tariff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_enqury_table`
--
ALTER TABLE `f_enqury_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_ft_booking`
--
ALTER TABLE `f_ft_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3806;

--
-- AUTO_INCREMENT for table `f_local_tariff`
--
ALTER TABLE `f_local_tariff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `f_login_status`
--
ALTER TABLE `f_login_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2350;

--
-- AUTO_INCREMENT for table `f_ontrip`
--
ALTER TABLE `f_ontrip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3439;

--
-- AUTO_INCREMENT for table `f_ontrip_new`
--
ALTER TABLE `f_ontrip_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_out_tariff`
--
ALTER TABLE `f_out_tariff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_refused`
--
ALTER TABLE `f_refused`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `f_test_chat`
--
ALTER TABLE `f_test_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `f_v_attach`
--
ALTER TABLE `f_v_attach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `local_tariff`
--
ALTER TABLE `local_tariff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19873;

--
-- AUTO_INCREMENT for table `login_status`
--
ALTER TABLE `login_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `new_customer`
--
ALTER TABLE `new_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1465;

--
-- AUTO_INCREMENT for table `ontrip`
--
ALTER TABLE `ontrip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `out_tariff`
--
ALTER TABLE `out_tariff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refused`
--
ALTER TABLE `refused`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refused_ontrip`
--
ALTER TABLE `refused_ontrip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `smssetting`
--
ALTER TABLE `smssetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_chat`
--
ALTER TABLE `test_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `v_attach`
--
ALTER TABLE `v_attach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `v_login`
--
ALTER TABLE `v_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `w_attach`
--
ALTER TABLE `w_attach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `w_booking`
--
ALTER TABLE `w_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `w_cancel`
--
ALTER TABLE `w_cancel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `w_enquery`
--
ALTER TABLE `w_enquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `w_ontrip`
--
ALTER TABLE `w_ontrip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `w_staff`
--
ALTER TABLE `w_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

-- --------------------------------------------------------

--
-- Table structure for table `ft_register`
--

CREATE TABLE IF NOT EXISTS `ft_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `pwd` varchar(255) NOT NULL,
  `r_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- AUTO_INCREMENT for table `ft_register`
--
ALTER TABLE `ft_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- ============================================================
-- MERGED FROM: create_auth_tables.sql
-- ============================================================

-- ============================================================
-- TMS Auth Tables: tms_admins & tms_staff
-- Run this on your `ft_welcome` database in phpMyAdmin
-- or via: mysql -u root ft_welcome < create_auth_tables.sql
-- ============================================================

USE ft_welcome;

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- 1. Admin credentials table
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE IF NOT EXISTS `tms_admins` (
  `id`         INT          NOT NULL AUTO_INCREMENT,
  `name`       VARCHAR(150) NOT NULL,
  `email`      VARCHAR(150) NOT NULL,
  `mobile`     VARCHAR(15)  NOT NULL,
  `username`   VARCHAR(100) NOT NULL,
  `pwd`        VARCHAR(255) NOT NULL COMMENT 'MD5 hashed password',
  `created_at` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_admin_email`    (`email`),
  UNIQUE KEY `uq_admin_mobile`   (`mobile`),
  UNIQUE KEY `uq_admin_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- 2. Staff credentials table
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
CREATE TABLE IF NOT EXISTS `tms_staff` (
  `id`         INT          NOT NULL AUTO_INCREMENT,
  `name`       VARCHAR(150) NOT NULL,
  `email`      VARCHAR(150) NOT NULL,
  `mobile`     VARCHAR(15)  NOT NULL,
  `username`   VARCHAR(100) NOT NULL,
  `department` VARCHAR(100)          DEFAULT NULL,
  `pwd`        VARCHAR(255) NOT NULL COMMENT 'MD5 hashed password',
  `created_at` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_staff_email`    (`email`),
  UNIQUE KEY `uq_staff_mobile`   (`mobile`),
  UNIQUE KEY `uq_staff_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- 3. Seed a default admin (password: admin123)
--    MD5('admin123') = 0192023a7bbd73250516f069df18b500
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT IGNORE INTO `tms_admins` (`name`, `email`, `mobile`, `username`, `pwd`)
VALUES ('Super Admin', 'admin@tms.com', '9999999999', 'admin', MD5('admin123'));

-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
-- 4. Seed a default staff (password: staff123)
--    MD5('staff123') = c4d5c8b56b74bbde77a552735d47a6ba
-- â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
INSERT IGNORE INTO `tms_staff` (`name`, `email`, `mobile`, `username`, `department`, `pwd`)
VALUES ('Default Staff', 'staff@tms.com', '8888888888', 'staff', 'Operations', MD5('staff123'));



-- ============================================================
-- MERGED FROM: create_login_logs.sql
-- ============================================================

-- Staff Login Logs Table
-- Run this once in phpMyAdmin or via MySQL CLI
CREATE TABLE IF NOT EXISTS tms_staff_login_logs (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    staff_id    INT NOT NULL,
    staff_name  VARCHAR(100) NOT NULL,
    login_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_login_at (login_at DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- ============================================================
-- MERGED FROM: ft_register_setup.sql
-- ============================================================

-- Create ft_register table for user registration
-- This table is required for the registration and login flow

CREATE TABLE IF NOT EXISTS `ft_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `pwd` varchar(255) NOT NULL,
  `r_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Add mobile column if table exists but column is missing (for existing setups)
-- This is safe to run multiple times
SET @col_exists = (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'ft_register' AND COLUMN_NAME = 'mobile');
SET @sql = IF(@col_exists = 0, 'ALTER TABLE ft_register ADD COLUMN mobile VARCHAR(15) AFTER email', 'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

