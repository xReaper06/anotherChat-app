-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2023 at 05:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `joinedroom`
--

CREATE TABLE `joinedroom` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `joinedroom`
--

INSERT INTO `joinedroom` (`id`, `users_id`, `room_id`) VALUES
(20, 5, 875228),
(21, 6, 326547),
(22, 6, 326547);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `users_id`, `room_id`, `message`, `created`, `updated`) VALUES
(1, 2, 323212, '0', '2023-11-25 06:55:45', NULL),
(2, 2, 323212, '0', '2023-11-25 06:56:54', NULL),
(3, 2, 323212, '0', '2023-11-25 06:58:29', NULL),
(4, 2, 323212, '0', '2023-11-25 07:02:22', NULL),
(5, 2, 323212, '0', '2023-11-25 07:02:53', NULL),
(6, 2, 323212, '0', '2023-11-25 07:03:31', NULL),
(7, 2, 323212, 'hello', '2023-11-25 07:03:59', NULL),
(8, 2, 323212, 'hello', '2023-11-25 07:05:21', NULL),
(9, 3, 323212, 'hello', '2023-11-25 07:10:27', NULL),
(10, 3, 326547, 'hello', '2023-11-26 04:32:45', NULL),
(11, 2, 326547, 'hi', '2023-11-26 04:33:41', NULL),
(12, 2, 326547, 'hello', '2023-11-26 04:35:18', NULL),
(13, 2, 326547, 'hi', '2023-11-26 04:41:01', NULL),
(14, 3, 326547, 'hi', '2023-11-26 04:41:21', NULL),
(15, 2, 326547, 'hello', '2023-11-26 05:09:37', NULL),
(16, 2, 326547, 'hi', '2023-11-26 05:09:57', NULL),
(17, 3, 326547, 'hi', '2023-11-26 05:17:01', NULL),
(18, 2, 326547, 'wazzup', '2023-11-26 05:17:11', NULL),
(19, 3, 326547, 'hi', '2023-11-26 05:29:31', NULL),
(20, 3, 326547, 'hello', '2023-11-26 05:30:34', NULL),
(21, 2, 326547, 'hellow', '2023-11-26 05:30:49', NULL),
(22, 2, 326547, 'hi', '2023-11-26 05:37:19', NULL),
(23, 3, 326547, 'hello', '2023-11-26 05:37:37', NULL),
(24, 3, 326547, 'hi', '2023-11-26 05:44:32', NULL),
(25, 2, 326547, 'hi', '2023-11-26 06:03:22', NULL),
(26, 2, 326547, 'wazzup', '2023-11-26 06:03:34', NULL),
(27, 3, 326547, 'wazzup', '2023-11-26 06:04:23', NULL),
(28, 3, 326547, 'hello', '2023-11-26 06:04:35', NULL),
(29, 2, 326547, 'hi', '2023-11-26 06:05:34', NULL),
(30, 2, 326547, 'hi', '2023-11-26 06:06:38', NULL),
(31, 3, 326547, 'hello', '2023-11-26 06:06:51', NULL),
(32, 3, 326547, 'hi', '2023-11-26 06:55:32', NULL),
(33, 3, 326547, 'hello', '2023-11-26 06:55:55', NULL),
(34, 3, 326547, 'helloworld', '2023-11-26 17:48:35', NULL),
(35, 3, 326547, 'hi', '2023-11-26 17:49:38', NULL),
(36, 3, 326547, 'hi', '2023-11-26 17:50:40', NULL),
(37, 5, 326547, 'hello', '2023-11-26 17:51:53', NULL),
(38, 5, 326547, 'wazzup', '2023-11-26 17:54:32', NULL),
(39, 5, 326547, 'hello', '2023-11-26 17:55:24', NULL),
(40, 3, 326547, 'hello', '2023-11-26 18:00:06', NULL),
(41, 5, 326547, 'wzzup', '2023-11-26 18:03:53', NULL),
(42, 3, 326547, 'hi', '2023-11-26 18:07:28', NULL),
(43, 5, 326547, 'helloworld', '2023-11-26 18:08:19', NULL),
(44, 3, 326547, 'hi', '2023-11-26 18:09:55', NULL),
(45, 3, 326547, 'hello', '2023-11-26 18:10:26', NULL),
(46, 3, 326547, 'hi', '2023-11-26 18:12:14', NULL),
(47, 3, 326547, 'hi', '2023-11-26 18:14:20', NULL),
(48, 3, 326547, 'hi', '2023-11-26 18:15:18', NULL),
(49, 3, 326547, 'wazzup my nigga?', '2023-11-26 18:17:49', NULL),
(50, 5, 326547, 'helloWorld', '2023-11-26 18:18:53', NULL),
(51, 5, 326547, 'hello', '2023-11-26 18:36:21', NULL),
(52, 5, 326547, 'helo', '2023-11-26 18:41:26', NULL),
(53, 5, 326547, 'hello', '2023-11-26 18:45:03', NULL),
(54, 5, 326547, 'hellopo', '2023-11-26 18:45:24', NULL),
(55, 3, 326547, 'wazzup', '2023-11-26 18:46:05', NULL),
(56, 5, 326547, 'hi', '2023-11-26 18:46:47', NULL),
(57, 5, 326547, 'hello', '2023-11-26 18:49:08', NULL),
(58, 5, 326547, 'hi', '2023-11-26 18:53:57', NULL),
(59, 3, 326547, 'hi', '2023-11-26 18:54:32', NULL),
(60, 3, 326547, 'hello', '2023-11-26 18:58:09', NULL),
(61, 5, 326547, 'ngee', '2023-11-26 18:59:08', NULL),
(62, 5, 326547, 'hi', '2023-11-26 19:05:22', NULL),
(63, 3, 326547, 'hi', '2023-11-26 19:07:14', NULL),
(64, 5, 326547, 'hello', '2023-11-26 19:07:25', NULL),
(65, 5, 326547, 'sdf', '2023-11-26 19:10:50', NULL),
(66, 3, 326547, 'hello', '2023-11-26 19:11:17', NULL),
(67, 5, 326547, 'hi', '2023-11-26 19:16:02', NULL),
(68, 5, 326547, 'hi', '2023-11-26 19:19:06', NULL),
(69, 3, 326547, 'hi', '2023-11-26 19:19:25', NULL),
(70, 5, 326547, 'hi', '2023-11-26 19:20:14', NULL),
(71, 5, 326547, 'hello', '2023-11-26 19:20:33', NULL),
(72, 3, 278134, 'hi', '2023-11-26 19:31:14', NULL),
(73, 5, 278134, 'hello', '2023-11-26 19:31:21', NULL),
(74, 5, 326547, 'hi', '2023-11-26 19:31:31', NULL),
(75, 3, 278134, 'hello', '2023-11-26 19:31:39', NULL),
(76, 5, 326547, 'hi', '2023-11-27 03:52:02', NULL),
(77, 6, 326547, 'hello', '2023-11-27 03:52:14', NULL),
(78, 5, 326547, 'hi po', '2023-11-27 03:57:09', NULL),
(79, 6, 326547, 'hello din po', '2023-11-27 03:57:19', NULL),
(80, 5, 326547, 'hi po', '2023-11-27 04:00:41', NULL),
(81, 5, 326547, 'hi po', '2023-11-27 04:01:24', NULL),
(82, 5, 326547, 'hi', '2023-11-27 04:38:39', NULL),
(83, 5, 326547, 'hi', '2023-11-27 05:03:01', NULL),
(84, 5, 326547, 'hi po', '2023-11-27 05:05:31', NULL),
(85, 6, 326547, 'hello po', '2023-11-27 05:05:42', NULL),
(86, 6, 326547, 'hi', '2023-11-27 05:08:29', NULL),
(87, 6, 326547, 'li', '2023-11-27 05:08:52', NULL),
(88, 5, 326547, 'hi', '2023-11-27 05:09:03', NULL),
(89, 5, 326547, 'heelo', '2023-11-27 05:26:14', NULL),
(90, 6, 326547, 'hi', '2023-11-27 05:26:27', NULL),
(91, 5, 326547, 'hello', '2023-11-27 05:26:34', NULL),
(92, 6, 326547, 'hi po', '2023-11-27 05:34:42', NULL),
(93, 6, 326547, 'wassup', '2023-11-27 05:44:13', NULL),
(94, 5, 326547, 'kumusta?', '2023-11-27 05:54:32', NULL),
(95, 5, 326547, 'hello', '2023-11-27 05:54:42', NULL),
(96, 5, 326547, 'wazzup?', '2023-11-27 05:55:25', NULL),
(97, 6, 326547, 'okay ra', '2023-11-27 05:55:41', NULL),
(98, 5, 326547, 'ikaw?', '2023-11-27 05:55:46', NULL),
(99, 6, 326547, 'okay rasad', '2023-11-27 05:55:51', NULL),
(100, 6, 326547, 'hi', '2023-11-27 06:23:03', NULL),
(101, 5, 326547, 'hello', '2023-11-27 06:23:10', NULL),
(102, 6, 326547, 'hi po', '2023-11-27 06:24:12', NULL),
(103, 6, 326547, 'hi', '2023-11-27 06:25:20', NULL),
(104, 6, 326547, 'hi', '2023-11-27 06:26:50', NULL),
(105, 6, 326547, 'hello', '2023-11-27 06:27:17', NULL),
(106, 6, 326547, 'hi', '2023-11-27 06:27:50', NULL),
(107, 6, 326547, 'hi', '2023-11-27 06:30:49', NULL),
(108, 6, 326547, 'hello', '2023-11-27 06:31:02', NULL),
(109, 6, 326547, 'wazzup', '2023-11-27 06:31:07', NULL),
(110, 5, 326547, 'hello po', '2023-11-27 06:31:38', NULL),
(111, 5, 326547, 'hello', '2023-11-27 07:12:37', NULL),
(112, 6, 326547, 'buang', '2023-11-27 07:12:56', NULL),
(113, 7, 326547, 'hello po', '2023-12-18 13:26:18', NULL),
(114, 8, 326547, 'sup', '2023-12-18 13:38:01', NULL),
(115, 7, 326547, 'hello', '2023-12-18 13:38:06', NULL),
(116, 8, 326547, 'hello din', '2023-12-18 13:38:21', NULL),
(117, 8, 326547, 'sup', '2023-12-18 13:38:34', NULL),
(118, 8, 326547, 'hi', '2023-12-18 13:40:30', NULL),
(119, 7, 326547, 'hello', '2023-12-18 13:40:36', NULL),
(120, 8, 326547, 'kumusta?', '2023-12-18 13:40:43', NULL),
(121, 7, 326547, 'okaylang ikaw?', '2023-12-18 13:40:48', NULL),
(122, 8, 326547, 'okay lang din naman', '2023-12-18 13:40:57', NULL),
(123, 7, 326547, 'ahh okay salamat', '2023-12-18 13:41:04', NULL),
(124, 7, 326547, '', '2023-12-18 13:41:05', NULL),
(125, 7, 326547, '', '2023-12-18 13:42:04', NULL),
(126, 7, 326547, '', '2023-12-18 13:42:21', NULL),
(127, 7, 326547, 'hello', '2023-12-18 13:42:24', NULL),
(128, 8, 326547, '', '2023-12-18 13:42:28', NULL),
(129, 8, 326547, 'asdfasd', '2023-12-18 13:42:30', NULL),
(130, 8, 326547, '', '2023-12-18 13:42:31', NULL),
(131, 8, 326547, '', '2023-12-18 13:42:32', NULL),
(132, 8, 326547, '', '2023-12-18 13:42:33', NULL),
(133, 8, 326547, 'hi', '2023-12-18 13:43:43', NULL),
(134, 7, 326547, 'hello', '2023-12-18 13:43:49', NULL),
(135, 7, 326547, 'hello', '2023-12-18 14:14:40', NULL),
(136, 8, 326547, 'hi', '2023-12-18 14:18:32', NULL),
(137, 7, 326547, 'hello', '2023-12-18 14:18:36', NULL),
(138, 7, 326547, 'hi po', '2023-12-18 14:22:38', NULL),
(139, 7, 326547, 'hi', '2023-12-18 14:22:56', NULL),
(140, 8, 326547, 'hello', '2023-12-18 14:23:00', NULL),
(141, 8, 326547, 'hello', '2023-12-18 14:24:10', NULL),
(142, 8, 326547, 'heelo', '2023-12-18 14:24:51', NULL),
(143, 7, 326547, 'hillo', '2023-12-18 14:25:04', NULL),
(144, 7, 326547, 'hasdfnajlsdfnhuawefadf', '2023-12-18 15:44:01', NULL),
(145, 7, 326547, 'asdgasdgasdfasdgasdfasdgasdgasdf', '2023-12-18 15:48:35', NULL),
(146, 7, 326547, 'asgasdgasdhasdgasdfabzjdhvuasdnjvzhusdignawkefa', '2023-12-18 15:50:16', NULL),
(147, 7, 326547, 'asdgashawefasdfasdinzxhvczvnnasngnkashduvnusvbkawfasd', '2023-12-18 15:51:42', NULL),
(148, 7, 326547, 'asdfasdf', '2023-12-18 15:51:45', NULL),
(149, 7, 326547, 'asdgasdaf', '2023-12-18 15:51:47', NULL),
(150, 8, 326547, 'asdfansduvh.zvasdashafdgasdfasdfjalsdkjfklasdfnmznxvcmzxcv', '2023-12-18 15:52:29', NULL),
(151, 8, 326547, 'asdfa', '2023-12-18 15:52:31', NULL),
(152, 8, 326547, 'asdgasdhasd', '2023-12-18 15:52:33', NULL),
(153, 8, 326547, 'asdfa', '2023-12-18 15:52:34', NULL),
(154, 8, 326547, 'asdffasd', '2023-12-18 15:52:35', NULL),
(155, 8, 326547, 'asdf', '2023-12-18 15:52:53', NULL),
(156, 8, 326547, 'asdgasdgasdfasdgasdhasdfjaksdfja', '2023-12-18 15:54:38', NULL),
(157, 8, 326547, 'ashasdhasdfasndfjknjznxvmznvkasdhello worlda njasdfasdfa', '2023-12-18 15:54:46', NULL),
(158, 8, 326547, 'asdgasdfasdfjasdfandsjfjkzxncvkjnsfjkvasdknfakjdnsgakdsnfkasdf', '2023-12-18 15:55:14', NULL),
(159, 8, 326547, 'asdfasdfbkjxfnvkjahdfjkahsdfkhakdfhkasd', '2023-12-18 15:56:24', NULL),
(160, 8, 326547, 'asdgasdadsfjakdnfskasnjdfjkabsdfjkbasdkfjnkjadnsfjkansdfkjansdfkjbaksdbfkajdsf', '2023-12-18 15:56:31', NULL),
(161, 8, 326547, 'asegasdgasdfasdfasdf', '2023-12-18 15:56:53', NULL),
(162, 8, 326547, 'khasdfasdfasdasdfasdfasdfasdfjnaksdhfukansdkfhajkdnsfkasdhfnkjansdkfuhaksdfnaksdnfkasdnjfkasdnfkasd', '2023-12-18 15:57:04', NULL),
(163, 8, 326547, 'asdfasdgasdfasdfadfasdfjinzxjkcvbhjabdsav', '2023-12-18 15:57:42', NULL),
(164, 8, 326547, 'adsgasdgasdfnjknzknxcvknasdkkfjkasndfkjansjdfnkjansdfkjhakjdfshuksdnvkjnskhakjdsf', '2023-12-18 15:57:49', NULL),
(165, 7, 326547, 'asdgasdgandjfnkjzdnxcuvbakjwhfukajndskah sdkjfasd', '2023-12-18 15:59:47', NULL),
(166, 7, 326547, 'asdgasasdasdfasdfasdfasdfdasdfhaskdfjnkzhxcvjkandfkjasdfs', '2023-12-18 16:02:13', NULL),
(167, 7, 326547, 'asdfasdgasdfasdfasdf', '2023-12-18 16:03:35', NULL),
(168, 7, 326547, 'asdasdhsdfgsdfgnjkasndfjkansdfklasdfasdfasdgasdga', '2023-12-18 16:03:40', NULL),
(169, 7, 326547, 'asdgasdgasdf', '2023-12-18 16:04:35', NULL),
(170, 7, 326547, 'asdgasdfnjakhdsnfkjnzkjxcvnjkashdkvnasdjfkasjdfklasdjgknkjzxncvjkhaskdnvkasd', '2023-12-18 16:04:41', NULL),
(171, 7, 326547, 'jasdfnj,xvckasdfnzfcvzafasdf', '2023-12-18 16:10:26', NULL),
(172, 7, 326547, 'ublishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publica', '2023-12-18 16:11:06', NULL),
(173, 7, 326547, 'asdnkjahsguknsdkfjg ajksdnfjkasdnfajdfnk asnfkjjansdfkjansdfkja ajsdfknasdfnkjajsdfnak ', '2023-12-18 16:11:19', NULL),
(174, 7, 326547, 'asdgasdfasdfasdfa', '2023-12-18 16:11:37', NULL),
(175, 7, 326547, 'asfnkjhzduvk halisdhn vhakjdhsvhkjasdfiasjdflajsdflajsfailjsdfa', '2023-12-18 16:11:42', NULL),
(176, 7, 326547, 'njakdnsfkjansdfjansdfhzbxmcvbznmxcbvhjasdkjvnaksdf', '2023-12-18 16:11:48', NULL),
(177, 7, 326547, 'ajksdfjkadshfkasdfhukasdfuhasdkfakjdsfnakjsdfbjabdsfhajshdfkjadsf', '2023-12-18 16:13:56', NULL),
(178, 7, 326547, 'asdfnjkajskhdfunzklxvcjlaksdmfkladsf asdfaksdnfjasdnfa ', '2023-12-18 16:15:16', NULL),
(179, 7, 326547, 'njknxfcvaskldfjalsdkfasldfmlkmzxlcnvadsfjalsdkfjkmzlxkcvjalksdmf', '2023-12-18 16:15:22', NULL),
(180, 7, 326547, 'nj,nmzxcnvm,zmvncjakwdnvkajdsfknaskdjvkzxncvnkjasdnvklzkxcjvknaskdvnlasd', '2023-12-18 16:15:31', NULL),
(181, 7, 326547, 'hajsjdnvzjxhkcvjanwdsjvhaksncvkjzhxvcjkajdkjfjansdfkjbzxjhcvkjadsvasdf', '2023-12-18 16:16:14', NULL),
(182, 8, 326547, 'hello po', '2023-12-18 16:26:22', NULL),
(183, 8, 326547, 'wazzup po', '2023-12-18 16:27:30', NULL),
(184, 8, 326547, 'hello', '2023-12-18 16:28:01', NULL),
(185, 8, 326547, 'hi', '2023-12-18 16:28:05', NULL),
(186, 7, 326547, 'kumusta?', '2023-12-18 16:28:49', NULL),
(187, 8, 326547, 'okay lang', '2023-12-18 16:28:58', NULL),
(188, 7, 326547, 'hello', '2023-12-18 16:29:18', NULL),
(189, 8, 326547, 'hi', '2023-12-18 16:29:22', NULL),
(190, 8, 326547, 'hi po', '2023-12-18 16:43:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `myrooms`
--

CREATE TABLE `myrooms` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `room_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myrooms`
--

INSERT INTO `myrooms` (`id`, `room_id`, `users_id`, `room_name`) VALUES
(1, 401140, 5, 'created'),
(2, 326547, 5, 'ngeeks'),
(3, 278134, 3, 'ngeee'),
(4, 829896, 5, 'helloworld'),
(5, 288355, 5, 'createWorld'),
(6, 278134, 5, 'ngeee'),
(7, 875228, 5, 'create'),
(8, 326547, 6, 'ngeeks'),
(9, 326547, 7, 'ngeeks'),
(10, 326547, 8, 'ngeeks');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_id`, `users_id`, `room_name`, `status`, `created`, `updated`) VALUES
(1, 829896, 2, 'helloworld', 'New', '2023-11-25 02:33:49', NULL),
(2, 829896, 2, 'helloworld', 'New', '2023-11-25 02:33:49', NULL),
(3, 278134, 2, 'ngeee', 'New', '2023-11-25 03:55:24', NULL),
(4, 278134, 2, 'ngeee', 'New', '2023-11-25 03:55:24', NULL),
(5, 323212, 2, 'hello', 'New', '2023-11-25 03:56:27', NULL),
(6, 323212, 2, 'hello', 'New', '2023-11-25 03:56:27', NULL),
(7, 326547, 2, 'ngeeks', 'New', '2023-11-25 03:59:55', NULL),
(8, 875228, 5, 'create', 'New', '2023-11-26 15:03:10', NULL),
(9, 288355, 5, 'createWorld', 'New', '2023-11-26 15:04:11', NULL),
(10, 634991, 5, 'worldCreate', 'New', '2023-11-26 15:05:25', NULL),
(11, 401140, 5, 'created', 'New', '2023-11-26 15:07:17', NULL),
(12, 388143, 5, 'craet', 'New', '2023-11-26 15:07:46', NULL),
(13, 927525, 5, 'create', 'New', '2023-11-26 15:14:10', NULL),
(14, 218012, 5, 'deleted', 'New', '2023-11-26 15:14:44', NULL),
(15, 465137, 5, 'deleted2', 'New', '2023-11-26 15:16:52', NULL),
(16, 593393, 5, 'deleted2', 'New', '2023-11-26 15:17:56', NULL),
(17, 752485, 5, 'deleted2', 'New', '2023-11-26 15:18:01', NULL),
(18, 723339, 5, 'deleted2', 'New', '2023-11-26 15:18:21', NULL),
(19, 442135, 5, 'deleted4', 'New', '2023-11-26 15:18:50', NULL),
(20, 966689, 5, 'hello', 'New', '2023-11-26 15:20:31', NULL),
(21, 587133, 5, 'created', 'New', '2023-11-26 15:22:39', NULL),
(22, 710477, 5, 'creadte', 'New', '2023-11-26 15:23:22', NULL),
(23, 326547, 3, 'ngeeks', '', '2023-11-26 18:28:35', NULL),
(24, 326547, 3, 'ngeeks', '', '2023-11-26 18:29:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `savepasswords`
--

CREATE TABLE `savepasswords` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_password` varchar(255) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `savepasswords`
--

INSERT INTO `savepasswords` (`id`, `user_id`, `last_password`, `created`, `updated`) VALUES
(1, 4, 'helloworld#123', '2023-11-25 01:20:25', NULL),
(2, 5, 'user123123', '2023-11-26 12:44:20', NULL),
(3, 6, 'user123123', '2023-11-26 12:48:26', NULL),
(4, 7, 'xReaper#123', '2023-12-18 13:25:16', NULL),
(5, 8, 'xReaper#123', '2023-12-18 13:37:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `refresh_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `refresh_token`) VALUES
(25, 3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiaWF0IjoxNzAwOTgxNjkyLCJleHAiOjE3MDE1ODY0OTJ9.J22iCN7T5plSpWwXHbcjAAIbdSACDu75sw-8500OXFM'),
(26, 2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNzAwOTgxNzE5LCJleHAiOjE3MDE1ODY1MTl9.e7CMqsmTz1295-h6YiGiPtcm_O2TdnUtWs1THRewdyg'),
(48, 6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NiwiaWF0IjoxNzAxMDY5NjQ4LCJleHAiOjE3MDE2NzQ0NDh9.BSrYwffBcQyEmTbCIsLWVNQmL9i-Tk9GlVHDa1eOVTE'),
(49, 5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNzAxMDcxNTY2LCJleHAiOjE3MDE2NzYzNjZ9.QUKIvu4Gwd4GJ1uQAkFOmpSQ4AMbtbJai9llp0MB7Dg'),
(64, 7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzAyOTE2OTAxLCJleHAiOjE3MDM1MjE3MDF9.hAp_Wb5heA0I_LkUxrH6_GLLu-5lxTwdwxopZrz-Yqc');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `profilepic` text NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `profilepic`, `username`, `password`, `created`, `updated`) VALUES
(1, 'images/tiavvsLogo.png', 'xReaper#1235', '$2b$10$y98S2QzoztkrtpcLDdhqlOOIQ2kG175gcqgH8PVoy.csFE9YTYDQu', '2023-11-25 01:18:23', NULL),
(2, 'images/tiavvsLogo.png', 'xReaper#12356', '$2b$10$66JxUxdHcJArFPpCod6jIOgl7dI/nMpESfQa0pKiPrzA77GQhgY.O', '2023-11-25 01:18:39', NULL),
(3, 'images/tiavvsLogo.png', 'xReaper#123567', '$2b$10$WwbC8xg0E2IQUc8JAEWdMuVrxY.PTwYFNyQYQKcbm7.tJXPjaMvyq', '2023-11-25 01:19:14', NULL),
(4, 'images/tiavvsLogo.png', 'xReaper#1235672', '$2b$10$VpbE/Ap8zywZEmfL2YtIU.8wtJFPtC2PafhOKb/Z9Hjln3ijEORA6', '2023-11-25 01:20:25', NULL),
(5, 'images/122.jpg', 'user1', '$2b$10$TMbpaCDdo1tV/.Ya0mCQNObzI6XZ8/3FfeO0Of4bERGLPe7ntWjuO', '2023-11-26 12:44:20', NULL),
(6, 'images/122.jpg', 'user2', '$2b$10$gXtz/7sAw8bZFllLD2PRweO9y/8WLUkYL1qoya5oufk7xtD56ILaK', '2023-11-26 12:48:26', NULL),
(7, 'images/profile2.png', 'user23', '$2b$10$Ii0KUDej2lxJLN//l8fmVu4PwDDvp1hypfqvfavBu7JF5nyzmr7IS', '2023-12-18 13:25:16', NULL),
(8, 'images/122.jpg', 'user56', '$2b$10$lC1OINK/G9zrxtdFuVvER.1BZ.iF2dZB4woyaZFxOR3DxiT.7c3lC', '2023-12-18 13:37:37', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `joinedroom`
--
ALTER TABLE `joinedroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myrooms`
--
ALTER TABLE `myrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `savepasswords`
--
ALTER TABLE `savepasswords`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `joinedroom`
--
ALTER TABLE `joinedroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `myrooms`
--
ALTER TABLE `myrooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `savepasswords`
--
ALTER TABLE `savepasswords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
