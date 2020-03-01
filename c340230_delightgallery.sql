-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 29, 2020 at 12:56 PM
-- Server version: 5.6.32-78.1
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c340230_delightgallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Administrator',
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role`, `photo`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `shop_name`) VALUES
(1, 'Admin', 'admin@gmail.com', '01629552892', 'Administrator', '1574403827chris-flower-600.png', '$2y$10$4QR9XhGaPiMETvute7MYL.fngdrWz3pNpZTSs1ZXcZvcGIQ39iHHO', 1, 'kG9Ev8C3i4aV524SFjXY00PWaBQM6XAAH62xG71bPPRq1OjrxurtBVexxXiB', '2018-02-28 23:27:08', '2019-11-22 11:23:47', 'Flower Shop'),
(4, 'Staff', 'staff@gmail.com', '34534534534', 'Staff', '1558707029staff.jpg', '$2y$10$I/2L8FXvxOQV7irwh2PH2upufB0DBMponc99HDo8U4cWx2B/6ASwa', 1, 'EteXf3soRBh36HEtMwgDVSqPeMt40MM8ubnlOAMsDXlobvZX540qncstFLlC', '2019-05-24 08:10:30', '2019-05-24 08:10:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_conversations`
--

INSERT INTO `admin_user_conversations` (`id`, `subject`, `user_id`, `message`, `created_at`, `updated_at`, `type`, `order_number`) VALUES
(1, 's;dkjnsdkfnkds', 29, 'sDLKmskldfmklsdmflksdmflsd', '2020-01-25 14:35:07', '2020-01-25 14:35:07', NULL, NULL),
(2, 'cmsncksdncks', 29, 'sdm,nsmnsdkfjsdf', '2020-01-25 14:35:18', '2020-01-25 14:35:18', NULL, NULL),
(3, 'flowers test message', 39, 'test messge', '2020-02-25 22:53:16', '2020-02-25 22:53:16', NULL, NULL),
(4, 'Tets ticket', 13, 'test message', '2020-02-28 12:42:35', '2020-02-28 12:42:35', 'Ticket', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_user_messages`
--

INSERT INTO `admin_user_messages` (`id`, `conversation_id`, `message`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'sDLKmskldfmklsdmflksdmflsd', 29, '2020-01-25 14:35:07', '2020-01-25 14:35:07'),
(2, 2, 'sdm,nsmnsdkfjsdf', 29, '2020-01-25 14:35:18', '2020-01-25 14:35:18'),
(4, 4, 'test message', 13, '2020-02-28 12:42:35', '2020-02-28 12:42:35'),
(5, 4, 'Reply', NULL, '2020-02-28 12:43:43', '2020-02-28 12:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `link`, `type`) VALUES
(1, '1560581916Banner05.jpg', 'https://www.google.com/', 'TopSmall'),
(2, '1560581909Banner04.jpg', NULL, 'TopSmall'),
(3, '1560581926Banner06.jpg', 'https://www.google.com/', 'Large'),
(4, '1564041571banner.png', 'https://www.google.com/', 'BottomSmall'),
(5, '1564041579banner.png', NULL, 'BottomSmall'),
(6, '1564041587banner.png', 'https://www.google.com/', 'BottomSmall');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `meta_tag` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(9, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700986-min.jpg', 'www.geniusocean.com', 38, 1, 'b1,b2,b3', 'Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level.', 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-02-06 09:53:41'),
(10, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700902-min.jpg', 'www.geniusocean.com', 16, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-03-06 09:54:21'),
(12, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700821-min.jpg', 'www.geniusocean.com', 21, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-04-06 22:04:20'),
(13, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700676-min.jpg', 'www.geniusocean.com', 59, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-05-06 22:04:36'),
(14, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700595-min.jpg', 'www.geniusocean.com', 4, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-06-03 06:02:30'),
(15, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700464-min.jpg', 'www.geniusocean.com', 7, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-07-03 06:02:53'),
(16, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700383-min.jpg', 'www.geniusocean.com', 6, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(17, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700322-min.jpg', 'www.geniusocean.com', 52, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(18, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700251-min.jpg', 'www.geniusocean.com', 148, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(20, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699136-min.jpg', 'www.geniusocean.com', 7, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(21, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699045-min.jpg', 'www.geniusocean.com', 38, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(22, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698954-min.jpg', 'www.geniusocean.com', 66, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(23, 7, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698893-min.jpg', 'www.geniusocean.com', 6, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(24, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698832-min.jpg', 'www.geniusocean.com', 35, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37');
INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(25, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15557542831-min.jpg', 'www.geniusocean.com', 43, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`) VALUES
(2, 'Oil & gas', 'oil-and-gas'),
(3, 'Manufacturing', 'manufacturing'),
(4, 'Chemical Research', 'chemical_research'),
(5, 'Agriculture', 'agriculture'),
(6, 'Mechanical', 'mechanical'),
(7, 'Entrepreneurs', 'entrepreneurs'),
(8, 'Technology', 'technology');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`) VALUES
(4, 'Electronic', 'electric', 1, '1557807287light.png'),
(5, 'Fashion & Beauty', 'fashion-and-Beauty', 1, '1557807279fashion.png'),
(6, 'Camera & Photo', 'camera-and-photo', 1, '1557807264camera.png'),
(7, 'Smart Phone & Table', 'smart-phone-and-table', 1, '1557377810mobile.png'),
(8, 'Sport & Outdoor', 'sport-and-Outdoor', 1, '1557807258sports.png'),
(9, 'Jewelry & Watches', 'jewelry-and-watches', 1, '1557807252furniture.png'),
(10, 'Health & Beauty', 'health-and-beauty', 1, '1557807228trends.png'),
(11, 'Books & Office', 'books-and-office', 1, '1557377917bags.png'),
(12, 'Toys & Hobbies', 'toys-and-hobbies', 1, '1557807214sports.png'),
(13, 'Books', 'books', 1, '1557807208bags.png'),
(14, 'Mixed Bouquets', 'mixed-bouquets', 1, '1574399548flower1.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(191) NOT NULL,
  `subcategory_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `childcategories`
--

INSERT INTO `childcategories` (`id`, `subcategory_id`, `name`, `slug`, `status`) VALUES
(1, 2, 'LCD TV', 'lcd-tv', 1),
(2, 2, 'LED TV', 'led-tv', 1),
(3, 2, 'Curved TV', 'curved-tv', 1),
(4, 2, 'Plasma TV', 'plasma-tv', 1),
(5, 3, 'Top Freezer', 'top-freezer', 1),
(6, 3, 'Side-by-Side', 'side-by-side', 1),
(7, 3, 'Counter-Depth', 'counter-depth', 1),
(8, 3, 'Mini Fridge', 'mini-fridge', 1),
(9, 4, 'Front Loading', 'front-loading', 1),
(10, 4, 'Top Loading', 'top-loading', 1),
(11, 4, 'Washer Dryer Combo', 'washer-dryer-combo', 1),
(12, 4, 'Laundry Center', 'laundry-center', 1),
(13, 5, 'Central Air', 'central-air', 1),
(14, 5, 'Window Air', 'window-air', 1),
(15, 5, 'Portable Air', 'portable-air', 1),
(16, 5, 'Hybrid Air', 'hybrid-air', 1),
(17, 18, 'flowers with vases', 'flower-vases', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(191) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `text`, `created_at`, `updated_at`) VALUES
(2, 13, 77, 'testng comment', '2020-02-08 20:17:52', '2020-02-08 20:17:52'),
(3, 13, 69, 'Hello... welcome', '2020-02-28 12:21:10', '2020-02-28 12:21:10');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NOT NULL,
  `recieved_user` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT '0',
  `todays_count` int(11) NOT NULL DEFAULT '0',
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(1, 'referral', 'www.facebook.com', 5, 0, NULL),
(2, 'referral', 'geniusocean.com', 2, 0, NULL),
(3, 'browser', 'Windows 10', 3285, 0, NULL),
(4, 'browser', 'Linux', 409, 0, NULL),
(5, 'browser', 'Unknown OS Platform', 1124, 0, NULL),
(6, 'browser', 'Windows 7', 470, 0, NULL),
(7, 'referral', 'yandex.ru', 16, 0, NULL),
(8, 'browser', 'Windows 8.1', 679, 0, NULL),
(9, 'referral', 'www.google.com', 8, 0, NULL),
(10, 'browser', 'Android', 626, 0, NULL),
(11, 'browser', 'Mac OS X', 654, 0, NULL),
(12, 'referral', 'l.facebook.com', 1, 0, NULL),
(13, 'referral', 'codecanyon.net', 6, 0, NULL),
(14, 'browser', 'Windows XP', 34, 0, NULL),
(15, 'browser', 'Windows 8', 5, 0, NULL),
(16, 'browser', 'iPad', 6, 0, NULL),
(17, 'browser', 'Ubuntu', 52, 0, NULL),
(18, 'browser', 'iPhone', 8, 0, NULL),
(19, 'referral', 'www.bing.com', 5, 0, NULL),
(20, 'referral', 'delightgallery.com', 16, 0, NULL),
(21, 'browser', 'Windows Vista', 18, 0, NULL),
(22, 'referral', 'com.all-url.info', 2, 0, NULL),
(23, 'referral', 'www.delightgallery.com', 1, 0, NULL),
(24, 'referral', '162.215.248.37', 2, 0, NULL),
(25, 'referral', 'yahoo.ca', 1, 0, NULL),
(26, 'referral', 'www.marinetraffic.com', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(191) UNSIGNED NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `price`, `times`, `used`, `status`, `start_date`, `end_date`) VALUES
(1, 'eqwe', 1, 12.22, '991', 17, 1, '2019-01-15', '2026-08-20'),
(2, 'sdsdsasd', 0, 11, NULL, 2, 1, '2019-05-23', '2022-05-26'),
(3, 'werwd', 0, 22, NULL, 3, 1, '2019-05-23', '2023-06-08'),
(4, 'asdasd', 1, 23.5, NULL, 1, 1, '2019-05-23', '2020-05-28'),
(5, 'kopakopakopa', 0, 40, NULL, 1, 1, '2019-05-23', '2032-05-20'),
(6, 'rererere', 1, 9, '665', 1, 1, '2019-05-23', '2022-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(191) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'USD', '$', 0, 0),
(4, 'BDT', '৳', 84.63, 0),
(6, 'EUR', '€', 0.89, 0),
(8, 'INR', '₹', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` mediumtext COLLATE utf8_unicode_ci,
  `email_body` longtext COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To Delight Gallery', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1),
(3, 'vendor_accept', 'Your Vendor Account Activated', '<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>', 1),
(4, 'subscription_warning', 'Your subscrption plan will end after five days', '<p>Hello {customer_name},<br>Your subscription plan duration will end after five days. Please renew your plan otherwise all of your products will be deactivated.</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `status`) VALUES
(1, 'Right my front it wound cause fully', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(3, 'Man particular insensible celebrated', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 1),
(4, 'Civilly why how end viewing related', '<span style=\"color: rgb(70, 85, 65); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 16px;\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</span><br>', 0),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\"><img src=\"https://i.imgur.com/MGucWKc.jpg\" width=\"350\"></div></div><div style=\"text-align: center;\"><br></div><div style=\"text-align: center;\"><span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.<br></span></div>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `favorite_sellers`
--

CREATE TABLE `favorite_sellers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `vendor_id` int(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`) VALUES
(39, 42, '1563943679bigimg.jpg'),
(40, 42, '1563943679bigimg2.jpg'),
(41, 42, '1563943679bigimg3.jpg'),
(42, 43, '1563943684bigimg.jpg'),
(43, 43, '1563943686bigimg2.jpg'),
(44, 43, '1563943688bigimg3.jpg'),
(45, 45, '1563943693bigimg.jpg'),
(46, 45, '1563943696bigimg2.jpg'),
(47, 45, '1563943698bigimg3.jpg'),
(49, 62, '1574400338flower1.jpeg'),
(50, 62, '1574400338flower2.jpeg'),
(51, 75, '1579941036climbers.jpg'),
(52, 75, '1579941036creepers.jpg'),
(53, 75, '1579941036shrubs.jpg'),
(54, 75, '1579941036trees.jpg'),
(55, 65, '1579941076trees.jpg'),
(56, 65, '1579941091climbers.jpg'),
(57, 65, '1579941091creepers.jpg'),
(58, 65, '1579941091shrubs.jpg'),
(59, 65, '1579941091trees.jpg'),
(60, 77, '158117031215792454656517055532227622908698.jpg'),
(61, 77, '1581170314maxcctech.png'),
(62, 77, '1581170314Mohamedmurshed fn2.jpg'),
(63, 77, '1581170314odoo_ready_partners_rgb (1).png');

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(191) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_email` text COLLATE utf8mb4_unicode_ci,
  `header_phone` text COLLATE utf8mb4_unicode_ci,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT '1',
  `talkto` text COLLATE utf8mb4_unicode_ci,
  `is_language` tinyint(1) NOT NULL DEFAULT '1',
  `is_loader` tinyint(1) NOT NULL DEFAULT '1',
  `map_key` text COLLATE utf8mb4_unicode_ci,
  `is_disqus` tinyint(1) NOT NULL DEFAULT '0',
  `disqus` longtext COLLATE utf8mb4_unicode_ci,
  `is_contact` tinyint(1) NOT NULL DEFAULT '0',
  `is_faq` tinyint(1) NOT NULL DEFAULT '0',
  `guest_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `paypal_check` tinyint(1) DEFAULT '0',
  `stripe_check` tinyint(1) NOT NULL DEFAULT '0',
  `cod_check` tinyint(1) NOT NULL DEFAULT '0',
  `paypal_business` text COLLATE utf8mb4_unicode_ci,
  `stripe_key` text COLLATE utf8mb4_unicode_ci,
  `stripe_secret` text COLLATE utf8mb4_unicode_ci,
  `currency_format` tinyint(1) NOT NULL DEFAULT '0',
  `withdraw_fee` double NOT NULL DEFAULT '0',
  `withdraw_charge` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `shipping_cost` double NOT NULL DEFAULT '0',
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_pass` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT '0',
  `is_comment` tinyint(1) NOT NULL DEFAULT '1',
  `is_currency` tinyint(1) NOT NULL DEFAULT '1',
  `add_cart` text COLLATE utf8mb4_unicode_ci,
  `out_stock` text COLLATE utf8mb4_unicode_ci,
  `add_wish` text COLLATE utf8mb4_unicode_ci,
  `already_wish` text COLLATE utf8mb4_unicode_ci,
  `wish_remove` text COLLATE utf8mb4_unicode_ci,
  `add_compare` text COLLATE utf8mb4_unicode_ci,
  `already_compare` text COLLATE utf8mb4_unicode_ci,
  `compare_remove` text COLLATE utf8mb4_unicode_ci,
  `color_change` text COLLATE utf8mb4_unicode_ci,
  `coupon_found` text COLLATE utf8mb4_unicode_ci,
  `no_coupon` text COLLATE utf8mb4_unicode_ci,
  `already_coupon` text COLLATE utf8mb4_unicode_ci,
  `order_title` text COLLATE utf8mb4_unicode_ci,
  `order_text` text COLLATE utf8mb4_unicode_ci,
  `is_affilate` tinyint(1) NOT NULL DEFAULT '1',
  `affilate_charge` int(100) NOT NULL DEFAULT '0',
  `affilate_banner` text COLLATE utf8mb4_unicode_ci,
  `already_cart` text COLLATE utf8mb4_unicode_ci,
  `fixed_commission` double NOT NULL DEFAULT '0',
  `percentage_commission` double NOT NULL DEFAULT '0',
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT '0',
  `reg_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `cod_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT '0',
  `menu_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_hover_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `is_verification_email` tinyint(1) NOT NULL DEFAULT '0',
  `instamojo_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_photo` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT '0',
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT '0',
  `is_paystack` tinyint(1) NOT NULL DEFAULT '0',
  `paystack_key` text COLLATE utf8mb4_unicode_ci,
  `paystack_email` text COLLATE utf8mb4_unicode_ci,
  `paystack_photo` text COLLATE utf8mb4_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `title`, `header_email`, `header_phone`, `footer`, `copyright`, `colors`, `loader`, `admin_loader`, `is_talkto`, `talkto`, `is_language`, `is_loader`, `map_key`, `is_disqus`, `disqus`, `is_contact`, `is_faq`, `guest_checkout`, `paypal_check`, `stripe_check`, `cod_check`, `paypal_business`, `stripe_key`, `stripe_secret`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `tax`, `shipping_cost`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `add_cart`, `out_stock`, `add_wish`, `already_wish`, `wish_remove`, `add_compare`, `already_compare`, `compare_remove`, `color_change`, `coupon_found`, `no_coupon`, `already_coupon`, `order_title`, `order_text`, `is_affilate`, `affilate_charge`, `affilate_banner`, `already_cart`, `fixed_commission`, `percentage_commission`, `multiple_shipping`, `vendor_ship_info`, `reg_vendor`, `cod_photo`, `paypal_photo`, `stripe_photo`, `header_color`, `footer_color`, `copyright_color`, `is_admin_loader`, `menu_color`, `menu_hover_color`, `is_home`, `is_verification_email`, `instamojo_key`, `instamojo_token`, `instamojo_photo`, `is_instamojo`, `instamojo_sandbox`, `is_paystack`, `paystack_key`, `paystack_email`, `paystack_photo`) VALUES
(1, '1580422536Logo-2.png', '1582274601favicon.png', 'Delight Gallery', 'Info@example.com', '0123 456789', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae', '&nbsp;© <span style=\"color: rgb(119, 119, 119); font-family: Lato, sans-serif; font-size: 14px; letter-spacing: 0.42px;\">2020 Flowershop Powered by Richinnovations</span>', '#fa869b', '1582274689delight.gif', '1582274696delight.gif', 0, '<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5bc2019c61d0b77092512d03/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>', 1, 1, 'AIzaSyB1GpE4qeoJ__70UZxvX9CTMUTZRZNHcu8', 1, '<div id=\"disqus_thread\">         \r\n    <script>\r\n    /**\r\n    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n    /*\r\n    var disqus_config = function () {\r\n    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\n    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n    };\r\n    */\r\n    (function() { // DON\'T EDIT BELOW THIS LINE\r\n    var d = document, s = d.createElement(\'script\');\r\n    s.src = \'https://junnun.disqus.com/embed.js\';\r\n    s.setAttribute(\'data-timestamp\', +new Date());\r\n    (d.head || d.body).appendChild(s);\r\n    })();\r\n    </script>\r\n    <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\r\n    </div>', 1, 1, 1, 1, 1, 1, 'shaon143-facilitator-1@gmail.com', 'pk_test_UnU1Coi1p5qFGwtpjZMRMgJM', 'sk_test_QQcg3vGsKRPlW6T3dXcNJsor', 1, 5, 5, 10, 5, 'delightgallery.com', '465', 'orders@delightgallery.com', 'orders2019', 'orders@delightgallery.com', 'Delight Gallery', 1, 1, 1, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 1, 8, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 5, 5, 1, 1, 1, '1561633289cod.jpg', '1561633682pm2.jpg', '1561633682pm7.jpg', '#143250', '#143250', '#02020c', 1, '#fa869b', '#02020c', 0, 1, 'test_172371aa837ae5cad6047dc3052', 'test_4ac5a785e25fc596b67dbc5c267', '1563786814instamojo.png', 1, 1, 1, 'pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2', 'junnuns@gmail.com', '1563855852paystack-opengraph.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`) VALUES
(1, 1, 'English', '1564213187L0RE4f22.json');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) DEFAULT NULL,
  `recieved_user` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(191) NOT NULL,
  `order_id` int(191) UNSIGNED DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `vendor_id` int(191) DEFAULT NULL,
  `product_id` int(191) DEFAULT NULL,
  `conversation_id` int(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `order_id`, `user_id`, `vendor_id`, `product_id`, `conversation_id`, `is_read`, `created_at`, `updated_at`) VALUES
(64, NULL, 38, NULL, NULL, NULL, 1, '2020-02-21 10:25:47', '2020-02-21 15:54:39');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','cancel') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `tax` int(191) NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT '0',
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart`, `method`, `shipping`, `pickup_location`, `totalQty`, `pay_amount`, `txnid`, `charge_id`, `order_number`, `payment_status`, `customer_email`, `customer_name`, `customer_country`, `customer_phone`, `customer_address`, `customer_city`, `customer_zip`, `shipping_name`, `shipping_country`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_city`, `shipping_zip`, `order_note`, `coupon_code`, `coupon_discount`, `status`, `created_at`, `updated_at`, `affilate_user`, `affilate_charge`, `currency_sign`, `currency_value`, `shipping_cost`, `tax`, `dp`, `pay_id`) VALUES
(1, NULL, 'BZh91AY&SYÖH¶&\0_ß@\0Pø;ö¿ïÿúP1îe³(\rÀ\0\0\0h\0\0\0\0Ii4¤Ó@ \0å=@4¤FÔi \r4É \0Ð\0\r\0\0\0\0\0\0¨I¤ÂMa\ZzFÒhpHHä|Ï¡ÚBJø|\0ä}8H^\\³ðPÄ2à2E}Gà1´­áÍØQf×&2]Þ*(/<×T¹6o\'G0æö96Y¡SÔú,Ç=]j·{fMÜá#ÉvlØê6ã8ÃÄÁw$²£S¶kßX4I4jÞÖóÊo.Á¼bºxQ\nÆ d¨LÈÃbfI	`x¨@HÂRÐ§$wÈ&T>µÌhMA[irF,ÍNeûn#Ã\nY%¢Ê]±Æ«*6b{6ªÄÐ6fàËUBbâ±V©:Ä¦O72*È09$¦¢@ýtpH\\W%Ò%!¬Å¤(.Â´f´apÙ¢4AÚÅ lÈB%¡iBÝpðÅÂ£À ñJÐCï¢M¤°ÕbéØÀÃË,j2j$èÃ²­²Ã5I¶s}j4^b#båÖú§Å\ZI%Ð|F8ú9Ù0q0y=É#©º2xÞtljø\'Øñ¬ñmLN¨½ôKî{ÞjY¦Oüsy½Ò_$¾®¦ø³åaàhÁ»7µês)¿uÿ¸!ÊFÖ-Y\\Ì¨}qw3NLÙ`T)q:ìõ4mc¯äÒÖÍj-­\rï³UCæ®ÞU²±ßÏ<ñ³¥wñÄ¯lt}[\Z.*MÕQ%ëY¬t%äÏ­.Ôé^Ü6¿wñæ&;,ø/>^JRVyØÄæO\r9GµÿG°\"dÄÅÚÞ¥!Ü:ë5J]îgIÊ;Qá29Íº²Ö×VHÇQ#¼ìL»9:Ñïàk^î÷4¤Æ©qî²¡èÁ½|æKs§âb³lmX)e«\ZIÑj`VàÂ7.¨¹x%¤iÒ­Yòã8TKNÎÕºD1LKÍ>8¶ðÜÜÅÜäz\'êæ®º}í{Úâ^c¨ûÑ²7§f­îvR^éÕ+ÔZÕ¡¤;¤­ÉÅJNúdå·×ß³¤=±R%3÷Ê¡$31,@áJ´#Á#N¶o\r9RýG±{¼U-ÄÈ¼4]UÓMYå5/Y;Ý3¶L£44uReF¦ÆpãX°g#jy.ÀÅ¬Ç¸ûI³®\\Û3Õàâ£Ô¼^-²9+ìÃõ.QhìdW\n6³a;Wxé#Êsq£þ9yy ¡È,âîH§\n\ZÉÄÀ', NULL, 'pickup', 'Azampur', '1', 1100, NULL, NULL, 'E0fc1575997214', 'Pending', 'service@gmail.com', 'cxzcxc', 'India', '0565062186', 'zxczxczxc', 'ccvxcvcx', '695020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'zczxcxzcxzcxzc', NULL, NULL, 'pending', '2019-12-10 22:00:14', '2019-12-10 22:00:14', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(2, NULL, 'BZh91AY&SYÿº,\0_ß@\0Pø;ö¿ïÿúP^îØ-0\nM1\0\0\0Ð\0\0\0\0LJ\Z@©£F 	5\n ÔÐM2\0\0=F\0\0\0@\0\0\0T$&i¦ODÐ=CF©¡å2Q±ú¿wÍ¾o¬½_!ý¾<î1ÊM¶q\r>eeqvNK£2åëk¿©.U\Z©«íQ	eü¬ªªiÍÛ5E¢Ñ=O5rx«fÕ]ÜÇ\'_ü Dq\"¯dÄî	Åær¡D ÈÈKKgZ¾wVBD@1Ktº5g@XaRT¼«Í4.lÆM\0bÃW\\Ì0:FXP/*ô²LnfÒùÁ°Y¥ÕßId-Ç.Ja®Ýå2Íâx©E0`¹If²µ0XÑeBøaf	6¥wÈ-ÞrH¦HK#Ô¼e]ØfÌÂi´¢õ\n0ÑÐ¹¬ÒÊå	õR\\ °.ªE Âl«²X\\£\"b-HÈ 0Ê!) #\",£ÀÞðÜW/		º@¬¢vsrH)\"#µTºkg7M*F,Q%L¾V\\Î1sZÓd¬£6\n{&³2ùqÊ¨øpö£ÀIÀ  £±åç.oÉGì·`¾}±(¦ÈÊë¡\0ÃÑ^i{_gtSèÿ\\OGæ|Þtõu7EÄYtSyæÌÜ·±Ê8&/+#%ÿ-w!ÆF¶ÚØÞdT=psdY1¸¨R`uÙìfÖÃOÑ­Õ,\ZÙfÑ]kUa»Ya5fJ÷ø\"Wá\Z­ì×¦%J¤ÓU´TF)x¬Ò:ðeÖbs¹§eÚË_ÏúòJÝì·¯)+<j`rE\'~|cÞûÇ¸\"dÀÁØÜ¥!Ìt\'ÄÑ)vºrãÝV æ.XÛHÃ#ªg8§pÆðn8G6ÔËoZ>2üRìiÏµÝÉ)0ª^>T=2v¯ÅµÍÜ©ù,×\ZãÊYjÂ\\´Zt·®ÕÄx,#8ÜþhË6B¢Xo1mì[¤IÓÄ¼2áÙníM\'¢}\\Ñ117§âÓµ¦óGµÝÚ£ruhÜßvÚKá1\Z%}E­YS£WEÑà¥\'u1q×ãÛ«¤=ñ\"R%3øJ F1	BÉ\"È3:Ù;³ãKöÄ]å÷»Õ-ÀÄ¾¯UFÇ:hË¨½}bítÊØ±ÍÕI\ZdÓø­#L&ÂøÌÉF:µBüy\nÎ·sbø¾-ª8«­ö]ÇrZ6±+}BÙ)1qïº^÷l#ìAßßá&QR5?âîH§\n÷E', NULL, 'pickup', 'Azampur', '1', 1100, NULL, NULL, 'H3gI1576514694', 'Declined', 'ram@gmail.com', 'ram', 'Austria', '87556', 'kal', 'tvm', '85657', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'd', NULL, NULL, 'declined', '2019-12-16 21:44:54', '2020-01-02 16:01:24', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(3, NULL, 'BZh91AY&SY3^ä\0Ñß@\0ø++õ¿ÿÿú`ß}\0¥R`\0\0\04\0\0\0\0`\0\0\04\0\0\0\0`\0\0\04\0\0\0\0`\0\0\04\0\0\0\0\"CSB4£~¦ 2zCÔÓÒ~¨$	¢DÊijPô£ÔÚFÔiH@ð¢}Oè|<çiêÙ+hú1RY}h´*0º]2tú(ÙÃGfá¦\ZmÜáRÊfÇÑk©JRvbx»§GfÌ77;ÏúÛfÏ\'µvÍ¨òÛÕ-ê\'­ËOèÃöyëÞu%éJj£,Q)ðT	ÉH%E\"¥)4ºÓO\"²¢)Ra2ZÊË.ÂÙ(ÉAR)Xa¢µØ³)AJc+°»KÜº­ µÖ}ø²Ç½R0¨¢¤Ó+5ÙÞ]y#\nViê	Rav\\=Í±\'RÍ7*}òÒÉiËVXt´e³AÐÑ,°âbXÒdSl8^pp]JeTáe¡ÊY0á¦Ë®¸Ã&[$(`[fØ£\'=¨jseZE)%*J~5¥Ë.¼°©JË23cR©hfÊ¤	$VT	BeVXJôNÏc	!ØðÝ¤!øÊx¬Þßc\'LÎRó²eMµeKÈÂëK»,t»gK°vic²\Zr®ÉÃFÔ\\¶úm&jvvt»ÃgFa¥ÙpÎ³¦VgZ:e·3ñÂxÇ7êQ³ù¨`ù]Ó49>Äò`ù%ÇÖ4 B¤\ZTíÙ>,âú(2í~O³ü~ïÝ»¬híz%\Z¾å»PÌØa¼6FæÊäÔó3*¡´Ü¹¹û{BìMÈ!]Kë*÷¹ºÎån]eLÇ2x#¢éy)gØûVp³OKÔåËJY©Ë¤ÊQSSô³©ìnØ aIb\\J\Z&¼\nºPàß[Æ\r\\ÍM+BÆósô=XdNæñrûg\ny¼Ë/<Þ\nL9siåôÄ±¼Ôw0êó!E:A0¦ö8|ºö<O47v¼\\|Æ¤$NÎi³§ë/?r]àýÞg§zïKÛ?±µznu/#½À[\0r hÈ\0IØìò¬7­Y\n4)`J´\ZÁB­0Á°Ø^m	Bã±=§c½ÓÖdTTÓÄniõ{ÞÒ§ÆrrüßsàôOdâE§öÐ§ÖyK<Ê~¹Ó#ª;Ç¶\rÏrze4êzfâ§¸ó40Ø¡BKó3e ù4\'{,°vKÜi>ätGÌa b<ÈlJEEJ¥H±H¥	*, Ä\'RÎÇCàfw;¨ü[xË&A2jÉ#ï5ËwÄî ¤Sgº{Ü®ÛqÌNûJQdÔæuw­ff&Óc´§²fa5:R|	ÿ¨áèQå8rfðÐ¨ÔdÀ{Y?#µû¶7]%@ Õ.B]-Ù`q*XÈö8áG\'0B@Äþ.äp¡ f½É(', 'Cash On Delivery', 'shipto', 'Azampur', '7', 7700, NULL, NULL, 'mqjp1578396385', 'Pending', 'inviewtechnologies@gmail.com', 'Vimal V', 'India', '09633984488', 'Krishna Flats, Pallimukku, Pettah PO, Thiruvananthapuram', 'Thiruvananthapuram', '695024', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2020-01-07 17:26:25', '2020-02-07 00:21:16', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(4, NULL, 'BZh91AY&SY úb£\0Iß@\0ø+ô¿ÿÿúPþîØY¢B0ÐÐ\0\0\Z\0\0\0\0JL&`\0\0\0\0\0j£Fõ(\0@44\0\0\0\0\0\n¡!4ÓC&G¡¨hõ\Z2l¦Ô!DC¥©êòWÏ¥Ï§Ò>Ì³:Dåtag6üÃzeËµë}Óq2fk\r6Ñ1´¡êµ¥(sOA6Åñ$°jâ¬XË§nødC&mÀÄF0	Á-*ÊÚùÄ$FH`1ÇeÑµÁ*1«ÎàY¡@+\nu¬¹ÄldÊòfÄä8@«ÂòkG&15W{EM7rSÕ[+Ã55Ô½êQMlWR[)00¨B)xIÑK<±$¤D	Bbb*5t¢+3Ë¸` (Õ0Ó¢æÉ«+Çébr)R,ÞÊ²®ÊYrEÄ;¬Z T¤\",£Îoyõ+vØiFÙDAóJ]5uÚ]gTav3U Â;(×S-c,æj¦i%oRÄÔjrõ{½ß\rrl`z£ËÂg³9\"xòfãÞ¥ÞQölÞ8NlÍ>.êÎ0qió©7¢¿¼_U4´SsâôyüÞ­bÍïYx§I¢í{·k||º×ùkºäkbÑ­ÃýÁØÑ93i$¦GAFÛ»ÝvlªÍj\r\rÏÃRÅæ®®ºÊ±ßÙ¦ÍbºX-K#£îèu4`*L­©Q¥ÍÜ]²í6¥¹:®×ºûaÛÖóû%Pà=ìg5)+9ÉÚNý:ãÁìðLÄD&QrR<ÁË+së793S»\\Yh¼ñK^¬ñÍt½s-Óý	¦þ/Õ¼ö[g.÷>ä¤Æ©ñ²¡È¬[UÂéiÅ×QeÖêarèm:ÍM¤äXNi¹\'«[NÈg1,7:}V÷G<Sù4iåºÝÿv×H§KèW{L`¯Ñ³Væ:è3réÇS{®ý4ÄjK\nZ´üÔ´{ÌïPôQ¸ïõüÞ¼}R| ìJ	Ä`\"J(H¡%2 Â,ÿ;MNZøS¨ÇÁDE+ÐÍuTqÛMøM.\'7\'=-8Ñ\rNL¨Å£U»kÙÆfQ­<.bÕ1ñ?e¶\\Yi­ÞìQx¼V1Ø®·ü¿gRZ2\'}B©1ÞÉ|^a?ÁP\nJA©Ô.äp¡!AôÅF', 'Paypal', 'shipto', 'Azampur', '1', 1100, NULL, NULL, 'paHs1578504138', 'Pending', 'ram@gmail.com', 'Ram', 'India', '9605671724', 'kal', 'tvm', '85657', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2020-01-08 23:22:18', '2020-01-08 23:22:18', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(5, NULL, 'BZh91AY&SYe5õ¯\0Iß@\0ø+ôd¿ïÿúPù½\0\Z# \0 \0\0\0\0%µ4H\0L\0\0\0I¨)èFÍCÒ\0dÈÓõG\r\0\0\r\0\0\0\0\"@!=50&ÔÓÕ\0Ñ zb!!A!ÊHMáü:@Þ}K4Ài¥\ZÎD¶h$2ö(£A,,ÙÇi3kÅ½;ÄÉÙUßD¤Ôw=igwlàÔÐ`Îä\\¹¤nPË*Ìt8w Ü	0*G*!¤Ò&mK|îÑN²¤A¦]WF¶AeB¥µx©0,-Æ1æLáÀÈ(\n½L(MK©Î]DUOÆëIfò ¨Áv-4¤Ðâ&ÔaJ	¬Æu EI3\"D,X¨dT£	¨deaÞ&¤È¨ÎJ¬	Q¢míJÖ¡2¸8P­	ÑsTÍº\ZHO¼àKÕH°¶P-vP\"Ëb(!ãbÔ\'	\"I°Òñ#aÙìHX¤\nIê1\"¦s)2ªÓ6ªÐ¶Hh­\nÍRæ+ª¡Él¹dKSÉnbær2âÍT²1	ÏÿÃPá:?¢ÇdîüL*<LðK°õ#e±I Ô *#;ñä Üv=§cì\\Ø¤hy©PwÉfGEà5ûíÄhÀÈ©s#G¥\rÅÇcìØ\ZÂÖ\r9\ZÊêÕ(e\rEÃ3ØÄH_B6÷Å¢ºn½êâ¤ÆPTL¥OSÐÖm.PiDKÀgCLÔûf<feõ©¿¼úÿã!hUôèA$t	X¨oOÈÇrê{FÒHl^Å1|EpätçR_i#C¡JDÚÆö¥÷$|[¹çÄîññæxoÂ±\0òjD#EMò7o(Aº¡2.¶PCiá.r\ZÉ¸±(S1~ô`M¡c?R\\ÖÚ3Ì¹9rÖo*(6ÃÐc¨GÌËêeP£ZÃÖ®F|óK)Eñ¡$¬n íÆüºò·O_°1ód!N#PBE	)fSa·ÐS4¦¿<HIA	#dBß®÷¸]Ne¥ÌðÊW.±¨î²¥ÌeÂ(LÁ`YBaS¼Ù¶3kät8SQUÀç±=ÛH(V¤\"L\Z´Ïq#¯/PÑÑêPRR\rNáw$S	S_Zð', 'Paypal', 'shipto', 'Azampur', '1', 1098.9, NULL, NULL, 'qL8f1578504319', 'captured', 'ram@gmail.com', 'ram', 'India', '9605671724', 'kal', 'tvm', '85657', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2020-01-08 23:25:19', '2020-01-08 23:25:33', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(6, NULL, 'BZh91AY&SYÛì	\0Iß@\0ø+ôd¿ïÿúPù½\Z# \0 \0\0\0\0%I\0Ð \0\0h£Ô<\0õG\0`4\0\04\0\0\0\0hôÔÚ¦õ&OM@4h¢$â³ÚæY®]hØr2%³Q!è8¢D°³oF0t&.\\Í¯?æ&LMa &Ù¦!(ª{RªªsW1sÅ#x]©Vc¡ÇÅ\0\0H±R9	Q\r&0Ãr[âwr6$2`Å2étl`T*[W(©\0RÂÜcAÞ8BóW£\n S×s7QáÐÎ§1Ôh(&ÇKDj­ ¤âPMf3¹*L ¡b£CBP1x³ËJ@Ä@LLEBóWEJ30<»\n\rP ä,4²·ÃY	öpÀº©ðeÙWe,¹F\"bÖ-AH¢p!4\0m ~ð7=Øä@¨Ä~º*g2*­3z­ahdv ÓBô±vsZ(ad®NX­IQXÊ¯fL^\ZÅì\\u\",õLDR°]îã\'§9Èj\Z§	sÌB\"ËÀ`å¹clð@¹ôºJi£*½¡èGð3ÌÿH/%Ìô>~gÔ¹¹HÐòR& ð2ÌF¨×ì@`OÏ)ÑRæFJÆØ1°6¬¦s26Ù²#PÊg© ¾doñEtá{ÕÅI¡$¨J*cÐÚo.PiDKÀgcLØ¥÷ÌxÌË9ì	S_éÿqa¡WÛ±Ø%b¡¨ z~&<sØî6Cbõ,h1æÞ+3·J÷#I\Z:ä¤IM¬ojXÏbG¸%¹¡Ä|\0þÙ.]F0¬A@>\rHq©¸Ô\Z Å]PE[hCË¡´í;LdÞXNyÃÈÈ¿0CL¦ð±ØE¾£Lò._å`Î\\öCÐSF\rPÐÊ¡F¶4:-\\ç?#)\nRâ2bIXàAßrïÎÝ¾)~ Æ&oÉM8IBE	$¦DE:M¦ìxALÒûÊPûIA	#dB×l:jáw:\'C®R¹u\r.c.1Bf\0²È|\nµðVÜÎe¯Øâ@MMEW5=IðÞA@°=!b`@Õ¦{øù!}p\nJA©ÿrE8PÛì	', 'Paypal', 'shipto', 'Azampur', '1', 1098.9, NULL, NULL, '8TDr1578565801', 'captured', 'ramachandran.karakas@gmail.com', 'Ramachandran', 'India', '9605671724', 'nta', 'tvm', '684545', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2020-01-09 16:30:01', '2020-01-09 16:30:15', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(7, NULL, 'BZh91AY&SY(0Ê×\0Gß@\0ø++õ¿ïÿúPþË#dUi\0\0\0\0\0ÈTõFF\0\0M\r\0I¨IBz4dSi\0\0\0\0`4\0\04\0\0\0\0hS4Ó\"aF¦Òzi4i£Ñ¨ÀàH^Ðä¡Ìçóór£øHb\nJýEèps;6¤::I®¥,¬ºZÄ`\"ù*eTêl*ªn^CFì,àþH·Xó&Å\Z´ Ä*+>Ã¹ÚLq)ÁÓBeod$Ød1mÕÑ²thI04T*:ª¼©\0¬)ÌÌ2#Òp+A@PÌÕøµL SS^å±±Æu\Z	&Î¯®$¶¬aeÓWx((ã60¡7Q¢d%Ì¥TîAn)Ê)$rdE*jg)(ÉEFwpl|K¢æÓVWL>ré>äê2¦UH°{(Ê»(eÊÔ4QìZªHR@A@@Qå7<½b¹¹R6Aâ0ÆgÑVH¬ MJ$ê°âC°ùc/fl1µ£Ì`¥¼Ôd¼Ù»Óä«4Bj0Ô´É¨« ±:}Gå<gIG$Õ¹Ëk\nÎò¼ÜôSYZá0¡Aøq=G)æ¡åø=*SÂKoÓ#Äeâ8VGélD`ÀZL¡²ò\n\\æE¢Ì¨(ªT;æÎ]s½dÎeæ>/SÏiI³ÌÄ(¤Ê`ýg1EEf}bÐr6Ì1xÖD¶øÜZO/QF¡M%M¿xã@ße\ZJÃX¿DGË³Rî:Ã2IÂÃØ¸Uæý³!ñF4ÊÇ7Z AEªUê@ø3!l1´¿#8ubòÝ[\r¹0MÜY@tjÔ>Q¢­DE\\t!Ë¡´æ.n6*h5\'±(8ÁìZviEÉÞö!Ù1Jð¨/oa19È?Ãt5´`e!ülEÁ­gjÐ4ì4G;IÔ ô°aÖÒ	TsPóQÄtnáÞâßãÚ_*THÆ#PBE	)f×f.Jô¢»HÜ:IÇAÖ]PÙ:³¼x2ôRXU0dÓó´ZXRl\\	2ù»YÔUKM#TSÍb?yîK,*Ú]\\PqQ:p>\r¦øOè@áÃªAIH5?âîH§\nZà', 'Razorpay', 'shipto', 'Azampur', '2', 2200, 'pay_E7qWSgxptgmeQl', NULL, 'PpHk1579766898', 'Processing', 'gourikrishnas2016@gmail.com', 'Gouri', 'India', '7994990426', 'Eytkjhhhjsjhdhdhdjfjfhfhcdj', 'Tvm', '1233334', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'processing', '2020-01-23 14:08:18', '2020-01-23 14:19:09', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(8, 13, 'BZh91AY&SY¥1>\0K_@\0ø+ô¿ïÿúPþîÌ3e¢B0\Z\0\0\Z\0\0\0\0Q0I¤4À\0\0	§©6¨Ó@è\04\01Ð\0\0Ð\0\0\0\0$¤hhÐd¦Ó(6õ\'ÍO(Á\"#X½ØòÐó$uuëÇ©AgHËóQGHrm&.fÝ7·ÔÃ@UôTBYì§«\r*ª±© ÁÇ¹sHR¤ÍJ²)- q#©À¡UCI¤.ÖM®QB\nKÞV\"`Ó)WFöAeB§&*ñ;ÎéfdÐÍ\0¬)Ö±s±P/yJR5.AeÝ]ì`Äý842(&]\\Éª´²é¬cåt\Z0PXäYKªäÝé) E**¢BÈõ.f`zw.\n\ZBÄÊ:UT÷HZ¨¶Ðh\'h(Ye].Q¢XiPd0ÅI\nIQå6yx³RB²@¶1$Q×2i+BéeGk\r{kg5fÆkDåbäÁJY¥ä½îg6E`e\ZGVÉ3Åi<ùé¨s>D±æ\\y$´î4õzLà?Î/TZÔ	½¡yìF±úAi(7±çüEJFÓÅHXX£©õ6ÄÍxt 0\'åÄfÀÄ©cûGâÃ¸¼³6¡¨/¼2¡ÌÒj+1PÄ°n=Ì	ö#oº+»­W0B¤Òªef®=ÉbL p],Jñ¡Ì&iGqmc24e=!*oÜ}ÿ!í*út :®*ÅÛmËõ>á°Ú(lÄpAÜ+ÃËIsFÉEä)µ®¥ÄÆ|9µ!q3mlÞkl0áÄìÞ1b\nòjD#EMFò3Ë+æYu¾0\\ºNbæÆâ¦C2xeâl ;Í\'y£4`]¡yüKçQ¦}ñ¸6Ë·QA¨âût5B>(kHrAyÚ²p26Ï\\ýX¤)J-È]Gl¢Íº;úñùä÷$AÒ1ÀD$PHJdA,¬±Çà¦Ä¦»ÊPæBJ¨I\"ü`±Ë{GyÄåi\\\\¯\r,a,âËÕárÐ=å	L\Zù»µ3u´È	©¨ªÌÇ¹<ò=I	Õà÷B ÐX«¦|ï;»!=gø qãÏ ¤¤\ZBîH§\n¦\'ÃÀ', 'Razorpay', 'shipto', 'Azampur', '1', 1100, 'pay_E7s9pKKnhR7E3o', NULL, 'b7Ay1579772680', 'captured', 'vendor@gmail.com', 'User', 'India', '3453453345453411', 'Space Needle 400 Broad St, Seattles', 'Washington, DC', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2020-01-23 15:44:40', '2020-01-23 15:45:23', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(9, 13, 'BZh91AY&SY=ëP\0×_@\0ø+õ¿ïÿú`þ|\0lj@ª  2 ÐÉ¦2 \0\0\0 \0\0\0\0\0\0 \0\0\0\0\0\0 \0\0\0DLi`4F¡âj4Éú£!Ô\n&¢bjIêhÂh\ZGÂÔDúÜ>*ýCæWÊÙÁ rb¸I>¹M<Ùl¥L,ºd¿gâ£m6Ó+²6áÜÚùe-veßåR/=éØéÁÞS\r:y½m±Ïl·´HHpûßéfø|-\Zïñ¢RBê£éYcâ±ÛRÇ¸°)rTºTR*RSk­8Qõ(N0-EvÒë°Ãm=WfIµ&ÉJT,¦Ûav¥2YyI ¥¯l)ÙRÅå*Au-Qi)IuÖ]wsOE§ê-(ÒRQ{,Sv¨Ëæ¦M\r;´Ç[fÜ[Í	Pgí¶^ÆE8aµæÍ¥2¥2Ê*möËC)²a¶JK.ºã\r°Á2àP±vL«2é¤ÊòÏ?Üð²èå¤ °ZA°QbÍK4`0,\nBôc,¤jbÂ¥P!R%)!Jú\'OFÏ	!Ñ½ÚB¥1·\'fg	yÂe¦N\Zº¥äau¥Ü¬r»²ì-,t¦Í9[*à³&ÔZçnÍ³µS.gN.æmÑui¦VcéÙc+·ÖrÌÞCQ±B°-\nªÂu\ZR$#ó£¦¥|4´3k±ÞWÐ;Ê3GØ!±AÅs\roøfXiê|ÞÓðý>O«¥Ú6x>ifãO:én\ZÏäùØÐ&eÒàzôPwÍNÓ¾päR>lÏSMNT0!ñ6®FC¸ÁâëyMÂ2lQó<Þv.ýå×¹fÖiäõrå¥,Ôì£&¦i(Ó	¹ÿÏï34ÑL§AcKBäÇÞ÷wZ{Xîa¤»¨Ü\\Ö¶0:#ûcBt°î$;Î!ALlñÆèBo38{=á*¨.æPêð5ê{N³Ç7w=®M=¡³d¹I ÀÐcìÙâ69zÃ¡!s¥Ú¾ÇQý7ºËiÒÀELðR^Y¢ÍOÝ,ôbTå8LLK6£*`l6)îlÀ^-å)àþqöNóìw=Ô**iä2wvÇâbA£fz\0àXî6=n*SÍ?b{ÔùùÏ³âP¤Ô³ïÎhfA°ä¼G{M.÷s¦	å\0ÒÇÅ3ÒÆÁ°sM0ç§CÐj>Y â~hùbÉäF11J$  DE.ísz\'¸ ÀçãÚà`÷\nÓF+a2nÑIèï´æ{ÞZ2§¬÷¹]¶ã;NûJQdÔæv»Íff\'	ÀÙÔ§¤ÌÂjvR}dü¨ÛèQîrê{Ï2Òa0i<åSòy¼gÉy¡tÄp)ä´-:ËJM°~rwÇ`¡ÿ\n>¼Ba¢ þ.äp¡ {Ö $', 'Razorpay', 'shipto', 'Azampur', '4', 4400, 'pay_E7sbf0TS7uQ5nH', NULL, 'Sdul1579774253', 'Processing', 'vendor@gmail.com', 'User', 'India', '3453453345453411', 'Space Needle 400 Broad St, Seattles', 'Washington, DC', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'processing', '2020-01-23 16:10:53', '2020-01-23 16:14:07', 'User', '352', '₹', 1, 0, 10, 0, NULL),
(10, 29, 'BZh91AY&SY¬qÈ%\0xß@\0ø+ô¿ÿÿúP;Å\n\"\0\0(F\0\0\0\0\0\0\0\00\0\0\0\0\0\0\0\0¤*©ª\r\0m 4\r@Ä\0\0\0\0\0\0\0\0	0hÓHÐ2M&ÔÓ	µ )S¾\nþCà<§ìß~úh~Èb=æ>c$$Ëý¥\rIRªgõfØÒÖ¬Ô1QwZ©lúÅ\'>âMF³CV27Áv3açeõæy)\"ðp1ÀY­qhTÞjqdiO@fZ®±bèb;­!ÎjÊ÷T$v&4\nAC,ñë¤³#ÈT.2ÕM:IQ¨:Ò¬r4Àl&Kf·s\Z²AW\nôU;ecm^ñ3¸¨ÂÌalVÜfq\Z&]=\'	OaJè.P	 ©ÄVØX+[º­¯`w¥ä¹u(&^­nUP©{Q52½(*àA6(UÔeY#¿è¼ø/&HÔ2ÅBD$	jÐÆ\n0ÜÒ pÆJ4\"Ô\"çU,PB@	$&ÇÚïMu^bE¶®(	7)*Ë^ÐÉIqs9¡ºÚJ¹l®RÌ.Ã\"±sbÆe9ÆeH&ôª4Î±¦SLÌ//ÀÚï²Ë´¹Á%æý5yÐ?aUkG°`üôà{H2óÄü@ùÿäÌØ¤é=ÊJ(6e\r[Ôq:W¸kâAà3\"¾:¨#Qc3QÁ£ïSî`Éà¶0js5µëÁ:fa×ÉôÝÂ-ßÕúÊÐEÊJ$±TY0µÏ÷5Ìý	DN¢ÈgyÌ(kG¤ËhÍ£Î©¨&½|Øgì~âeÚ3>£ÕÞA¤AC¸)áÖ(ú´ó=ChB©¬cØÔ,aÏô£lNf;tRJ£ä3LñlæIè	[¾G#87õÆðógI«iÏ°cDÚÔÉÚMÍÇa~¤\Z,ÕJI1T%LYÒJÖXPªX$d%¸aì42êFiÜ6m\'¹s°Ó=æF_ÙíûâaÄ?üd#¹#ÞjÎª5®Á´°r[ÇlÍçM6\\$Á¥ËB÷Jî%,D=Ð`ã«ÕÊýÞåñ10c~,@F0B-\"\"È X°\ZIµæTÚfrÓÜ°­OA	(\"Á(ÁB!uôAÏ«ÁÈçàÂÈFf¸ ,dg=QRëAñ*P,f×µ~/ÐÎ²ùhv\r¤UT]p#¤ÿpÞAPqôÂ fÎgø¸ãî£ý7nãF@l	_ø»)ÂcA(', 'Razorpay', 'shipto', 'Azampur', '3', 3630, 'pay_E8eGVOJU1JrWsr', NULL, 'x9YV1579942110', 'Completed', 'jithkutty@gmail.com', 'Sujith G S', 'India', '09447124521', 'SHYNI S P, ETTY VILAYIL HOUSE, DURGA LANE, PARACODE, CHEMPAZHANTHY P O', 'THIRUVANANTHAPURAM', '695587', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'zcczczxczxccc', NULL, NULL, 'completed', '2020-01-25 14:48:30', '2020-01-26 18:58:45', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(11, 13, 'BZh91AY&SYàãð®\0ß@\0ø+õd¿ÿÿú`|UP(@\0\"9L\0\0À\0L\0`\0&\00\0\0À	\0L\0À\0æ0`\0\00\0$TýÐÞ¨õ\Z44\Z£CÔ4\0¥DDÁdhÄ\nl¡M\r<R6L\nh)Öy©øÈüÖéª}/¥øDõ¬T~a,ÐPzÂ°îðÝ¸ðÀ»M³Ññ`ì:t<:rá³tìòÖ8BÁñi»b¸µ:ÇAµÉsÛø-öNl0t¯xh¬Q]Ï\'ê~æ¤É°!¹ÃØ+±ïo½B8¶<îCØîsºÛ»\\l½& /r(=.(~Z0ÙË­¯câálÕº,)?f«5V£`F;1áà»`åÁâlØWb	6R1tÆ7}À]rF)¢Q\nÅlÇ-Û¸¡ cH``7lÓÅÝ0ìA÷áÆS{®Z6&ÃÎgG2xK1`Æ1]øy»b4a#íQ¹¡,ÌlÙÑ³M,ÝÑç4\\;C£¸Æz´Í¥ëæÃÒø7\Z¦LMæ¦LMi ç43Lòm­½\r«M1¦` 6påÓc¦îHQNaÃp¤.éËt\"Ù³`né»q;¡³hnfHÛ-ßu?Z/)û²²ÍM[4¡$aê¡(ÆÃM!08XÀaöb4siC\ZD\nb#¤b\r=C«Ðl÷÷w(<\"]R\"> Í&4Æããï¸{h\\ËNÎ©`K¶h,îÐðÚÝ79´bhrîï¬ÕVw\rì]¥\\Þ\Zvq±4M4nî=¶wìÀè7`Ý£s.ît¥Ü8iÓèÝÉÑÀQøýéã¼²øVëóy÷WåRûbûã²Ç9Äù½Gìçløº²ÍÊ7Ç´±+[A\r©ÈýÌß©þÁe¾Ò2zOÈýÎÃôùSÓ\Zö­\rc\'Rp5\\®°ä½K²{WÐïha¼Ù}÷+R»l´àr7\\}m¡o1s-Æûó¾WRo·»iàs&Û¢è³fÜiridÚºì?Ò~µ»/EËÝ{;»¹aA2½\rÆÆC\nB¶ÛÇü_SóÍ¹1C6LdÝir3&ó´ñ-Ny{\rýF£S×krM-uÚ|ïÜÁø>K\rjï0/9ºÅï½Ë+,%­¸æÅmÉÆóÇÜ¾Ç¹bÅ!ýðÆôn:,ßKú#w»ÂÚi{¥Ùhv³qÆã\Z\ZV¶/7u¶Üµ0}hÒtÔq·õ,¼×yÞó\'ãáx»Òa`m³dØ/ùµ4«øx&ãÌ½FoMïw¶ñÊ6Z\Zfã\nÔÒ4²bÒÁç4®´Ìl$Þhad¸GaøVûº­Õb°l»êºÍ/\\uÛX½o¾W1uZ^ ôÁ¤ôÕbþã7¬ÁbßÊòq¶¦Ëè§©TÞwÇamÄì;mn«ÐÍ}ø\'Û5¥¥g½ÄÉ¤zÍ%¸ò|gæ|>gêWëOKAbÅ`D\n ÄHT$_ðÀuûè²¶]rke°ö,ÊdÍµ4«q©1ÝtdÞx^MX½î/ë[ð<nV\Zä.s§&,,¦óua©º74âbô\rFÓøóÍtX^£ßq<W¡u4M²3sGaÎ·mæ2l,+1vYL8Õ¼ÔÄn¶/±ýWºé¨þD{}³ÝS\0¤ÿÅÜN$88ü+', 'Razorpay', 'shipto', 'Azampur', '3', 3404.5, 'pay_EEhUHqrZa3uWRs', NULL, '055J1581263462', 'captured', 'vendor@gmail.com', 'User', 'India', '3453453345453411', 'Space Needle 400 Broad St, Seattles', 'Washington, DC', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2020-02-09 21:51:02', '2020-02-09 21:52:08', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(12, 13, 'BZh91AY&SYæÄþD\0Hß@\0Pø+ö¿ïÿúP=6Y4Æ@\0@\0\0\0\0Jd)!ê44\04È\0$Ô%SÉ\044=#5\0Qê4\00\Z\0\0\Z\0\0\0\0D#Hhi¡©=M#ÚÓ#FMêÕ($,$7âBuìöÔp,ãÇ¹¡S¨Q	_ °ÃBgqÔI5Ø¥xºÄ`.xTÊ4\rØæUUM¹ÇèÙ6I¨ü&i°2¸q@%$ZZd`K1*!¨ÈMÉÎÍÕBes¿!$:D mÐ Æ];.¬ÑÃ\nLh½TÀ0ªa¦õC.¯\'IeÆÊeËÖ^Ypæ:­YÈ|J&0åkxaÕõÑÊYEv\r)Àq,ÀáÀqbæ(eI¸§(¤JzÄÐJJ2EbQÜ\"¢JÜÉ*)È¨Å!}ÜRBA*©àÊÊ»)\\¬X£9Xµ\"FRBº\n Tdhe1älÁ!^)±$AÂ-·dÊL´ââÃ) C°ùcOf8ckF3ÊÀên\rb,Îl½iòVQì¦æ[R+êËEê3íØÌÚu °ù$±S­KÔUQiRh,Ò -\n=zä Ä z#éØùÍÅ##ÕH±A°/,5fb¢TùGNàC@Ù&ËÈ*<9¡¬©{6uÁ®Ã¤À¦­1LÒT6ÅäBúQlSvúÖ$P&I)¦Njsêj6&4È\"²¼®Ì¡µÖ:Ø_®Í)åîûo.ÚQóäA$r	P d( #\Zî]OA±$6Í:\nààgÆÉ$k<3Ð¤IXÕõ¶vðHêÁÙÄ6ð6gAó7\Z¼¹ñÂØ`{Ü² èîbüZmaE[hCClÄÐP0X`HU[Íw\"¨iØ»æ¹Ðiøí^%³~GÜàGÁ©ØÓ|Ñc00ÑSÉmºLl×?Vã\'\nRë d2I\\dAÛÇ>üíÝé\"D}iPA#@¡`b44&Õ²¦wï{±zÌ@.,\"\rPTå½Â¸ÌåYZZ®£Q!B~VK\nMß$Á¥ObÍ[ à[]H&¦¢å9\Zbñ a\n ÷B Ò jzy¡{<ÐSþ.äp¡!Íü', 'Razorpay', 'shipto', 'Azampur', '1', 825, 'pay_EEhVE83DKNOsM3', NULL, 'Ps8F1581263464', 'captured', 'vendor@gmail.com', 'User', 'India', '3453453345453411', 'Space Needle 400 Broad St, Seattles', 'Washington, DC', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2020-02-09 21:51:04', '2020-02-09 21:53:02', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(13, 22, 'BZh91AY&SYº<ãS\0L_@\0Pø+ö¿ïÿúPþiÃ6X\Z#\0\0\0\0\0\0\0\0	HÄÐR\Z\0 4\r\0\0IÐ\0P\0\0\0\0\0\0\0\0\0\0h©&Qµ\ZhÄÓõGÍM©\0 Hó6	©ñÐg\nGY^°Xô(2Mu?¨çFH/¥AäÊMLÇÍs£«W$;¤ÞröQVRaL¹¨Õ*iK2àE*ö7 Þ	(`q]ää%T4BèÑNéË¹ó:=ÀÄ+ ÆZó2Ô§0HÅ77ØÌ\ZXlæ9±ÀÃ$\rö¹º@âe¹5CAeËù2n$4lí¢lhÂ)9.ÔÍéM«uÔ Ra31A*)1È((TRh:L³¤CäpZI±Gtt4QI5U=kQNàÂ	X GBJª#ÁÚBä½HBÀËdXAãî²á]Xd»A0C®Å°d0Õ 1©	0zÌ¬H×©!b$--!Ìc\"5×+rj¥\"°BÈ³Ó1kVæbV)(b-fjV¬b÷[¸²Ca\Zï8rí{c)ÄhÔ(gOét9W*h\'~ó¤]UjRh&ò}F|BÉA¸øséò=KÃÉHX\\´p7/!¯r®ÜÀÐT¹ ÂàÑö¡qØX`ÆÀÒ°kÈÈÒWF	C(-Ãiø1$È»âÑ^Ìïz¸¨L¡$¨Iª§ØÒm.PiDKÀgq#$t0Ò3Xï3sÈ%Mý_AÌ6|ùx Ð%bÁ {±Þ¼eÞCh¡´cÁx°.5%Ñ$l9rÉHXÞÔ±1Ä¤-ËÞÌÍaìÍ=¼9aXxµ\"èi7ºc0\\&Ã/\n!£&QÄä2sË6\r¤ï$\nëPÃÔÈWÚÓ)¬,qõ%Ér¨Ó<÷l:LÊ\n\rFaæ?¹ÚG1T!ó,h³@pF°uÄØm¸~M¤($Ô_¹JÆâÈ,våßÂÜüRø1¿Í	Ä`\"J$PHJÈ°¬¹ÃðSbS^(t!%T$	5¦³p¨åbË`l©so0XCÌ¡0©^(ÿ¶¦v-|BÞ@MMEò=çà¦}!`t\"5êZ°ÏÇ¹	ü¼¼aÏø»)ÂÑç\Z', 'Cash On Delivery', 'shipto', 'Azampur', '5', 899.75, NULL, NULL, 'g8I51581265911', 'Pending', 'user@gmail.com', 'Junnun', 'India', '9567500025', 'Test Address', 'Test City', '1231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2020-02-09 22:31:51', '2020-02-09 22:31:51', NULL, NULL, '₹', 1, 6, 10, 0, NULL),
(14, 22, 'BZh91AY&SYP~\0Õß@\0Pø+?ö¿ïÿú`ÿ}\0*AIIÀ&\0L\0`\0&\00	\0\0\0	Ì`À\0&\0`\0s\00\0	\0\0¡\"dÊ=M=\Z\rM\r=@2RA4DJ~mFJ{*y4PzÔz\'¤òG©d }x¤ýO¡h¹ù`Íòê-Ì5½nÖ,K.ö\ZZ12aæ©óù>74ÑÍ¦´ÙÃ\rÝKiRÊSè¥R×©ÈæÜÃy¼ë>oÉ¹±Ôòx.ÝºÃ­Ò[ =(\ZpáëÿK²ÄÞTFè¢TñTbÏ+2»ÉOcÅdIíR#RFUÉQH©JYNZrQí¤iFÊeR)6-El²Ë°¶Tº©9¶Y%)H²]²L)Ô§seÒ)AJl²í.µ*/ ¹Omã\nÃÐºÑJRì,ºïÄúºmNjÝB÷òa³f^v!e¦ölÒì7IÄPÞéD^X9oeSfXu´Úfo6N%å±Ï)¦pÈ¦ì4¼Ñ¤Êì²e¬²Øe2L4Ù¤²ë®8aíhXÄÊ³.&W~öIaúCÝ1ÊJT!öJMX$±I)f*¥(w©*-&Ô\nQ\"¤ BB0BA£Å¡XâÑPÉQ\'@ìaM)v&£ÏÉ6e¦ë5uKHÂëK¸Xæ¿ØdÃejiÃJrâª4ØÝFØMóÕw\r39¹¹.âi»eÍ³vtrefu±É&&ó%CóøO|ì7íäÌó7Ñ$}éå:UÕ;Oµñgã)üOÆ4@?f¥à},Ø·ôk(eÚõ¿Ç·îqt\Zy¤¦Ã.`ÈôèPêa>®-ieB\03oqs¸³3¡Ä¦ó%©\'\\i4,ô9<\ræfd`Ñ$7b»ú\ZÂò>RÏ;¹flítpá²m0¢L#xÀ^\\:ðîx^7àY%udÈ¸0îvÐéqÑc²ÎFÂÆkEÇ9ÊýßYRÈõJ>®¥<^%ròÓÈ]ÄÒz¡iNç7DöyíR¤Hª>6ED6yÅv»ö\Z\nv;zLXTrpÓ->òóÉ.ó\"wNò¢Lý~*vNOS¾x:J)6Yi÷©/,Ib÷99KqæÌ5&Àhh\n!Ñ¤È/dnÜÓ(k½æ8v£xTTË°jyRïðl¤©ûçÜÑØ»½×:M¤Zy§Aúýg¦Yë(RfY?ÍÑÍ°Ê¬z¢q;Ó¶Sg9Û=;	a|ð¦¶I(úkÉG¥¡0yí´Þz]O\'Nçº\'à**U{Õ,JEEJ¥H±H¥	* XA[:8¾YÌH\\qaò·;Eeõ¡0lÉ#ÎâôÄ|õ¸]¦£x9N»JQdÚq9]Ü³3tÜhç)Òfa6âê4ó(ôÌ´áÎxâÒa0i;¥wtûÌº;e¦Åñ¸§¡hZsËJO³vO£Þy<>ÉÇÆy!JJT,¤«ü]ÉáB@eAú', 'Cash On Delivery', 'shipto', 'Azampur', '3', 1463.5, NULL, NULL, 'aMIl1581266003', 'Completed', 'user@gmail.com', 'Junnun', 'India', '34534534534', 'Test Address', 'Test City', '1231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2020-02-09 22:33:23', '2020-02-09 22:46:29', NULL, NULL, '₹', 1, 6, 10, 0, NULL),
(15, 22, 'BZh91AY&SYVê\Z\0Ôß@\0Pø;ö¿ÿÿú`ÿ}\0\0B¥A)JJ9L\0\0À\0L\0`\0&\00\0\0À	\0L\0À\0æ0`\0\00\0DF©¦FM&É¤hz\0hP*D I)ø£Êj{Q§¥\r\0\rIêzÐ0ñ<b\"æ~ùÑGÆêQð¨Së-æ\Z@}Vèù1RY~4\\La¢4Êd¾6;7lÓ\r\rÜ;´Ò[K|[dÃ,-jNÌÏtèìäËÄöààØö?+ÜÃwÝìyËó\'Ô¼ÑÃOµàÓß¨D©!ïTÌõïÙ¥©õ¾ÅÉRäGE$l Ý*))KSL.t£=YmRÕ&)7\\.+u­\r;e!¢R\rÃÊaNH¥(lÒØVÊº¨¢¬-x©³Eµ%)-Ì0ù17TñT(ÙMS¢¶eRED©ãl©l6Zæ$Î0Jihçe{VXqhËs{AÞbZ5u¤áÃÎæÂ²áÁºeTÝû4Üi4nÙ¤¶`pÉ§\r.E0ÜY¥ja6M1-ðGøã& R\\RJJ¿}Å°Z-$µJTb[QU)ªVKÕ%Rá«H¹ZH¹È.TJH¤TïîÆ^òC´ûåJ0·ÏZFÙ&ÍÜ77Â¥ÈËr³³òve£MvSe7êª7Q½:u­p¬6rÔììé3wFaÙ¦µÒiÓKoá¸¡VÉpBÃíè|¯3Úè>]%§=/ wÁq98?x0vY&#xè\Z!R×±æÀp|LJºÝgöü}ïñÌè\Z:ô£QJâÔ9\ræG80 Öì\'¶\\Ì¿[¹%tÚs;§E#äÔúX,$®u±aÐUÚäço9BIq0µM¸æOþLHþ2Þ/%·[gÐórå²ÚLI¤£L¦Óæ|§²xÎ[d%±C3\"àÃãhä[v9ftïeÚL4ò}û¿RÑç8xÍôzve«¸\nl=K£1¬~FðâDT;àK:Pêì2õ;¥í\Zåw­ÁqÑ¢TÌbX¸°UG¸hrï6;B!æ<MM+ÄÈê6»\räÜFDç8kdÔU°Õ«!FÞåÌ&)NùèÚZi4ß1(¸rk¾XùÎârù;>vEMÞ#è\Zqy¡Ä1;DLïKrò½ ~?Üúe¾Â&¥Õ;:hfGp÷Cè:ÅzåºÔ©¥Å°RYf¶YÔË,\Ze³°Èì:Kä|£¡B¥WÜ©h¤¨TTT¨*T)¡%RÔ¡*¡ß9×O$Æj;ÛÁ\"²ÉzÐL\Z²Hô{ÏsÍK·\'¶{0áÄsiÕÊQi´æuÚ\'s´§ÔÊm:R~p°9H\rÅL u­F£%Èt48scþltß¹FFl%	y\\`x´éGyð}h4ëë>RRDü]ÉáBAZ?¨h', 'Cash On Delivery', 'shipto', 'Azampur', '5', 2516.75, NULL, NULL, 'zWI81581266352', 'Completed', 'user@gmail.com', 'Junnun', 'India', '34534534534', 'Test Address', 'Test City', '1231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2020-02-09 22:39:12', '2020-02-09 22:45:36', NULL, NULL, '₹', 1, 6, 10, 0, NULL),
(16, 13, 'BZh91AY&SYÇÈ«\0Hß@\0Pø+ö¿ïÿúPËØÙ\02Ó\r\0\0\r\0\0\0\0(	©¨Ðd\r\0\r \Z	4R=@\0@\0\0\0Àh\0\0h\0\0\0\0PA2hi¢OSCÈ2hÄÚRµ½¡è÷£â³çóùÓ\'Õt©Ö(¯ÐXa±G3¸jC¤®*YX7wc]MO%L£/\nªs!èÙ6Iµö]v¼7iÁÛÂG!\'å¼È ÈÈNDàÎ;M¼¼Ia$DÁ·¢âpH0°±Ëfjå¢ÖszÈ È(\n\ZËNa9ÇD\r6mfõÃIï\r wCÜRiGW|âSF«sês\nR:g@ÑRØ²fÅcbÊâß$²TßmÉÏ¬¢ E)ëA)(ÉEFwpl)AMvdâÂòÃµ!>îL[\"ÀR>Cáf¢æd»PLgq`É0Õ ,ÊH²¹®wjWNèj\"òâ·Vü·ÝÙaÅ\'R@aí=x8a­ÎÌÔÔ³9£:Óä­£ÙMÌ´É¨ÕYI~nMï0{â!ë<m8Î\r¬¯þu¤c\"Óï6 dhû«Úì¦«E81<÷ÇÍðz5ºbÎ/(³§I©o\'µN1äùG·p!Ê lÁeäÔØhk2jILÆy;ÛíÙUÕ+¶47¿\rKGÉ\\8ÖUW^c5f%Ö¼J÷^k{EÓ¥Riµ*#4»Ök=©t\'L\Zº0ÖZüx?/ªU¶{ØÏ5)+9ÅÅ¢¸iÕ/Wd\"ft¥(vAàÎÇ.ÜV8tÙÐîf§-qe£	Ze|%ê³Ä¶èGk=¦þÇIÉë*|M½ÜÚ»R*¥Çç1eBnè|«v]-#8ÁZ³¤-¤Ú[ÖlU/¹d°,#¥\'£[N¨i	_¤ÉÏÑnøïÅ1/6=Ûë«sµ)Ðì>éôv+ØbêólÕs	ÍÇ(hîéË[\':)/Úb5%zZ´èKZVõ¢3qR¾»v~|²ïýb> Eô%	Ä`\"(H¤%dAY£®p<.í7ØSÞÎ2É¬KC6\n¨ìÛMúæ¢óÉf¦Ú*\nÓò´ZXRl_$\r*tùC-Ò§c-5»\\ÅgUw6×á_$¨Ðª6\Z)1T½¯g(GàÃÃÙÏø»)Â<^EX', 'Cash On Delivery', 'pickup', 'Azampur', '2', 1650, NULL, NULL, 'NvIt1582103032', 'Pending', 'vendor@gmail.com', 'User', 'United States', '3453453345453411', 'Space Needle 400 Broad St, Seattles', 'Washington, DC', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', '2020-02-19 15:03:52', '2020-02-19 15:03:52', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(17, 39, 'BZh91AY&SY¾NQc\0¢ß@\0Xwø+õd¿ÿÿú`>UR  R\n(`\00\0L`À0\0L\0L&	0`\0&L\0&Â0Ì\0&\0	a\0EH)¦izS \0\0ýH\0R@ §ä6Á¢jdSM\npâòÅ_¨øÈ©ù-Ãr|/\'ú7mó0ß¬ÌÏÈÍ­\Z?1A(;;µjÿl/³Vaí!ÝèÀì8n6x7lË`på»\'Í«FÔ²Ë]mÇ{×îovk;.};Kî^çCF¡$òx\'Qüð\0ó\Z8> Rñr~`¦Æ»{\\:ÞF÷Òõ;^^vìH(æ¤ @+ä×MØPâÝ¨òiü÷W6NØOöú÷­Þ0¬0éFC,&çBEh@5Ã£\r\Z4nüÇywÚCR0K$IpÒË!µ«Wîåo¶q28,»Ö-Î$ À0\r[²ÕÁÙtõ²CdGølU²ÉbrhôA\"áï=$¥XXawu¼¼[x#äª9£V®O~Ö¨0Â¡Yyá«Æ#E§;6cMsÜÝs¿Ë/¹Ølq4hhâq7\Z0í64o:\ra±*p.Þ¢Ã{a[¸pÜpÕÃ@Àá	,Al,8³fàÙ!(UÃv¨BÑ£@já¨TBÎAdhÜ6bÁD.¾Õ:(>)îßºSV©ºÚÔ2Ê2ÄËRË-­2Á±«}f¶X^#Z¶AoÑ2Ô¬ÊdnÔ¦¢ËF]§K¶èhóåÉAÜTz±*þAFS9y¶\Z5\Z¸\rX6¶ä°2ÆíðÀPfÌ5jÐrÎÚÐÃã»vBXI\Zµf135¸i(ÂÌW{5ØLt\Za»`á¡«»rK¹o4éÓ-°U»sfÁ%éõÒc\'°;\r93 xO½Qÿ¡øÂõY!¸~§`{%¼càêëqß[Y+ui	Ö|M_©ùzÓ´hôÐøéø#¡äì­Ñ£¹:ZÿáØ¼W|ÆWÀõ¶1¡¾÷Ýâ¼Ö°àt;WBÊ¾VóÐ¹q\\v²;ø»ÌwÜaØymÛjÕÈÚëmhà»WDòèn4OD5\0Ìö2áïívvnÁ!\rsÙ½n[8èá8\\#ø¯ØwÍ÷¹£\rZ3G+k¬ÔÌ>aë¡Å\0Û@stÔ7zÚ¼£gµóÆø{ßyÕx/1ÊËç½ËK©±Ç°·\\#ÐZ2òÝn«ÍJýrË%·~NGq\nñ¥ô#¢xÛ×p6½Òð¶<iÈÑìº£cjÝeëa»§-ÜBù\nÀ¡¹÷±ô»ïÅÞ¥G]ë½¶ô°pµhÞ/ªÈü[ªù=iµÈï^£W¦ùÞ.ÇduÇq¥±¶®­­ÆÑµ£-¬<ÆÕä\\\rFñ¾NfÆ-Hð0¾£¨ìö«a`,ùÀszÂzmÈBè×;ð¸uµë¾ÓÎq\rCÎ_Èô\Z½¦Sy«ÞußUÁ7å¥êã\\.£ÀòÛ®ëq´}ØehÑÞ&á!D;Âä;BBzC\'¢ì¾Æã{o²¯´agÝaª°b²²°Â°Èid2ÁLÀ3VI*3+äÞwªóZ[Þ´J¡äl(¤·ä*Ê¯TÁÜö0ÈTÄÜî2ÕÜ{ÖðhînÛ]bì<2Å¡±Ìéµèµo7£qF^y¸p:YPìnÛ¨ãsºbó®æÉ¾7Æ®1àjóuå»ÍËCkºÃeájZ1Ö}nã#½~Æ/­{®êú#æù§º¦X2ÂÕ5?ø»)Âòr', 'Cash On Delivery', 'shipto', 'Azampur', '7', 7793.5, NULL, NULL, 'IgKD1582649178', 'Processing', 'vimal.inview@outlook.com', 'Vimal', 'India', '9567500025', 'test address', 'Trivandrum', '695035', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'processing', '2020-02-25 22:46:18', '2020-02-25 22:58:04', NULL, NULL, '₹', 1, 0, 10, 0, NULL),
(18, 13, 'BZh91AY&SYHU}Ý\0Lß@\0ø++õ¿ïÿúPñîhÀh\0\0h\0\0\0\0	BdÑ5(òF ~©²M©I¨SÔô4\0òd@\0\r\Z\0`4\0\04\0\0\0\0hC\"dShH4z4ð!¤Dho:ÀÚx3pÏ6$Ü@¥3BÈWaÅ(/}ê!ÆE©Ê\\&«¢jÕµ~	ESsUUSC-F,=üX¡q*Ìy4%¨$XÀúR¡	j$¶]n²ù°hd1mÕÑ¤ðPX`¨TK»éÖb X\nª±âthdÆ¯]Z³W5å.[YcXØt	o´$¶VYCW:J((ä0`¡6QJF/	3[<ÐR\n)11HFGº*5)@yw,\nR Ä@¹.jfÊçÚBuN²q1SR,äÊ²®ÊYr³`C¾Å¨03RB\0²)µåÚW6ätni$c¾8Z0¡;):zUGÐÂ»ÐÃXÊ`Ä0ÊÃºAx%J½^Æ/c\nø°Òd:dE©]­ÎU<öæ£ìudöÉóó9Í§NÓaü+Ø>}vf§,¶¡rä|yRÉAÄò=Oãõ=\' èÆ¸æ\r@`â5¦ÁSÀ`°ýXq\rj\n20¸4zPÐ¸ì`]M¥´-`Ý3¸ÈÚWfÈ	C(l.f$Bó#(´W½\\TÊJ¢©êzNÊ\r2ÁibBXï;fÄv/¸fcÆfYÏ`Jò?¨ÈG1ä_gáàA$xo\ZÎÆÐ_Ù25ÛÍxçØlT4ÄuAâ,3ÃµI|ÆGÀÀ¿%\"Jmc{RÄÆKrS@yêovfeÏ©ÛQ+PÍHs©¼æF³u.¶PCiÌ\\ä4TÈfMåBºÞ0õ26òEÐÓ+`WÔ­Fä\\¿ÎÁ»¶Cÿ¡ÌÃ¨GÌË\ZÚØ`w.®\'÷ÀÃäÑÊB¢øØV9@óÆ}Ý-ÛâÐÄÁýì0dc(H°BJdAY¸\\éS4¦¼JPï!%T$	]°\\ë«GÐëyX²16ÀÙ\"æ2Ò(LÁ`YRÂ¦-|CÙ·3käu4 &¦¢«B?CØ¦¼My³|¡m1 k	ã>G³qºú8pã ¤¤\Zñw$S	WÝÐ', 'Cash On Delivery', 'shipto', 'Azampur', '2', 2200, NULL, NULL, 'NoYO1582867667', 'Completed', 'vendor@gmail.com', 'User', 'India', '3453453345453411', 'Space Needle 400 Broad St, Seattles', 'India', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2020-02-28 11:27:47', '2020-02-28 11:42:44', NULL, NULL, '₹', 1, 0, 10, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(191) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `header` tinyint(1) NOT NULL DEFAULT '0',
  `footer` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`) VALUES
(1, 'About Us', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"font-family: \" 51);\"=\"\"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, NULL, 1, 1),
(2, 'Privacy & Policy', 'privacy', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><img src=\"https://i.imgur.com/BobQuyA.jpg\" width=\"591\"></h2><h2><font size=\"6\">Title number 1</font></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1),
(3, 'Terms & Condition', 'terms', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_success` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci,
  `contact_text` text COLLATE utf8mb4_unicode_ci,
  `side_title` text COLLATE utf8mb4_unicode_ci,
  `side_text` text COLLATE utf8mb4_unicode_ci,
  `street` text COLLATE utf8mb4_unicode_ci,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `fax` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci,
  `site` text COLLATE utf8mb4_unicode_ci,
  `slider` tinyint(1) NOT NULL DEFAULT '1',
  `service` tinyint(1) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '1',
  `small_banner` tinyint(1) NOT NULL DEFAULT '1',
  `best` tinyint(1) NOT NULL DEFAULT '1',
  `top_rated` tinyint(1) NOT NULL DEFAULT '1',
  `large_banner` tinyint(1) NOT NULL DEFAULT '1',
  `big` tinyint(1) NOT NULL DEFAULT '1',
  `hot_sale` tinyint(1) NOT NULL DEFAULT '1',
  `partners` tinyint(1) NOT NULL DEFAULT '0',
  `review_blog` tinyint(1) NOT NULL DEFAULT '1',
  `best_seller_banner` text COLLATE utf8mb4_unicode_ci,
  `best_seller_banner_link` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner_link` text COLLATE utf8mb4_unicode_ci,
  `bottom_small` tinyint(1) NOT NULL DEFAULT '0',
  `flash_deal` tinyint(1) NOT NULL DEFAULT '0',
  `best_seller_banner1` text COLLATE utf8mb4_unicode_ci,
  `best_seller_banner_link1` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner1` text COLLATE utf8mb4_unicode_ci,
  `big_save_banner_link1` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_success`, `contact_email`, `contact_title`, `contact_text`, `side_title`, `side_text`, `street`, `phone`, `fax`, `email`, `site`, `slider`, `service`, `featured`, `small_banner`, `best`, `top_rated`, `large_banner`, `big`, `hot_sale`, `partners`, `review_blog`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `bottom_small`, `flash_deal`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`) VALUES
(1, 'Success! Thanks for contacting us, we will get back to you shortly.', 'admin@geniusocean.com', '<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">WE\'D LOVE TO</h4><h2 class=\"title\" style=\"margin-bottom: 13px; font-weight: 600; line-height: 50px; font-size: 40px; color: rgb(255, 85, 0); text-transform: uppercase;\">HEAR FROM YOU</h2>', '<span style=\"color: rgb(119, 119, 119);\">Send us a message and we\' ll respond as soon as possible</span><br>', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', '3584 Hickory Heights Drive ,Hanover MD 21076, USA', '00 000 000 000', '00 000 000 000', 'admin@geniusocean.com', 'https://geniusocean.com/', 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '156422562501.jpg', 'http://google.com', '156422564103.jpg', 'http://google.com', 1, 1, '156422562504.jpg', 'http://google.com', '156422564105.jpg', 'http://google.com');

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(1, '1563165366brand-1.png', 'https://www.google.com/'),
(2, '1563165383brand-2.png', 'https://www.google.com/'),
(3, '1563165393brand-3.png', 'https://www.google.com/'),
(4, '1563165400brand-1.png', NULL),
(5, '1563165411brand-2.png', NULL),
(6, '1563165444brand-3.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `photo`, `title`, `details`, `status`) VALUES
(2, '1558607469mlogo.png', 'Rocket', '<b>Rocket Mobile No: 01728068515<br>Rocket Reference No: 6622</b>', 1),
(3, '15586074081234.jpg', 'bKash', '<div style=\"text-align: left;\"><b>Mobile Number: 01732716885</b></div><b><div style=\"text-align: left;\"><b>Reference Number: 778899</b></div></b>', 1),
(4, NULL, 'QuickCash', '<b>MOBILE NUMBER: 9038423432849</b>', 0),
(5, NULL, 'Easy Cash', '<b>Please Call at 98989898989</b>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pickups`
--

CREATE TABLE `pickups` (
  `id` int(191) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pickups`
--

INSERT INTO `pickups` (`id`, `location`) VALUES
(2, 'Azampur'),
(3, 'Dhaka'),
(4, 'Kazipara'),
(5, 'Kamarpara'),
(6, 'Uttara');

-- --------------------------------------------------------

--
-- Table structure for table `pincode`
--

CREATE TABLE `pincode` (
  `id` int(11) NOT NULL,
  `pincode` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(191) UNSIGNED NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `category_id` int(191) UNSIGNED NOT NULL,
  `subcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  `tax` double DEFAULT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `stock` int(191) DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT '1',
  `views` int(191) UNSIGNED NOT NULL DEFAULT '0',
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text,
  `colors` text,
  `product_condition` tinyint(1) NOT NULL DEFAULT '0',
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT '0',
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `best` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `top` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `hot` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `latest` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `big` tinyint(10) UNSIGNED NOT NULL DEFAULT '0',
  `trending` tinyint(1) NOT NULL DEFAULT '0',
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `delivery_date` date DEFAULT NULL,
  `cancel_hr` varchar(200) DEFAULT NULL,
  `return_date` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `tax`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `delivery_date`, `cancel_hr`, `return_date`) VALUES
(42, 13, 4, 2, 1, 'Here will be your Physical product title written', 'here-will-be-your-physical-product-title-written-ars42nty', '1563942781fKDPIZPb.png', '1563942781gPcW3CvJ.jpg', NULL, NULL, NULL, NULL, NULL, 88, NULL, 100, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><br>', NULL, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><br>', 0, 214, 'CLOTHS,FASHION,WOMEN FASHION,DRESSES,MENSWEAR', 'keyword', '#f0d90a', 2, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=hVEaL9izgjs', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2018-12-21 15:47:41', '2020-02-28 11:10:15', 1, '04/25/2020', NULL, NULL, NULL),
(43, 13, 4, 2, 1, 'Here will be your Physical product title written', 'here-will-be-your-physical-product-title-written-ara43nts', '1563942769k2MnyKwg.png', '1563942769auONWuRI.jpg', NULL, 'X,3XL', '28,77', '5,22', '#000000,#9c1515,#24f015,#050bc2,#d1900c,#000000', 88, NULL, 100, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><br>', NULL, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><br>', 0, 459, 'CLOTHS,FASHION,WOMEN FASHION,DRESSES,MENSWEAR', '50% OFF', '#12d928', 2, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=hVEaL9izgjs', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2018-12-21 15:47:41', '2020-01-01 08:52:56', 1, '12/28/2019', NULL, NULL, NULL),
(45, 13, 4, 2, 1, 'Here will be your Physical product title written', 'here-will-be-your-physical-product-title-written-ara45qty', '1563942752LEdozmlx.png', '1563942753CxJXoK5T.jpg', NULL, NULL, NULL, NULL, '#000000,#9c1515,#24f015,#050bc2,#d1900c', 100, NULL, 120, '<strong style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem Ipsum</strong><span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><br>', NULL, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><br>', 0, 100, 'CLOTHS,FASHION,WOMEN FASHION,DRESSES,MENSWEAR', NULL, NULL, 2, NULL, 0, NULL, NULL, 'https://www.youtube.com/watch?v=hVEaL9izgjs', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2018-12-21 15:47:41', '2020-01-01 08:52:59', 1, '11/16/2019', NULL, NULL, NULL),
(62, 0, 14, 18, 17, 'Fancymart Artificial Blossom Flowers', 'fancymart-artificial-blossom-flowers-axr62dic', '1574400334eKAuqUFl.png', '1574400338B1kp7jYK.jpg', NULL, NULL, NULL, NULL, NULL, 1000, NULL, 999, '<div class=\"_3WHvuP\"><ul><li class=\"_2-riNZ\">Type: Peach Blossom</li><li class=\"_2-riNZ\">Vase Included</li><li class=\"_2-riNZ\">Flower Material: Fabric, Wood, plastic, Vase Material: Wood</li><li class=\"_2-riNZ\">Length: 11.81 inch</li></ul></div>', 198, '<br>', 1, 20, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-11-22 10:25:34', '2020-02-27 22:04:48', 0, NULL, NULL, NULL, NULL),
(63, 0, 14, 18, 17, 'flower', 'flower-4ab63ckw', '1577443112pR4s4Fv7.png', '15774431124ImLjxWB.jpg', NULL, NULL, NULL, NULL, NULL, 1000, NULL, 999, '<br>', 198, '<br>', 1, 15, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-12-27 16:38:32', '2020-02-14 11:43:16', 0, NULL, NULL, NULL, NULL),
(64, 0, 14, 18, 17, 'flower2', 'flower2-hgk643yz', '1577443207fogvvVIP.png', '1577443207U4uLaLIq.jpg', NULL, NULL, NULL, NULL, NULL, 1000, NULL, 999, '<br>', 192, '<br>', 1, 54, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, 0, 0, '2019-12-27 16:40:07', '2020-02-28 11:45:04', 0, NULL, NULL, NULL, NULL),
(65, 0, 14, 18, 17, 'MyFlower', 'flower3-p8k658rt', '1577443278jsE0kion.png', '1577443278mFR8YXih.jpg', NULL, 'Large,Medium', '0,6', '100,50', '#d10f0f,#9c1f1f', 1000, NULL, 997, 'Beautiful roses in a vase sdfsfsfd', 189, 'No return possible dSDADsADSAdADS', 1, 83, 'Red flowers', 'Red beauties', '#000000', 2, '1', 0, 'flower', 'Pretty flowers', 'https://www.youtube.com/watch?v=A0PpEqRN67c', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 1, 0, 1, '2019-12-27 16:41:18', '2020-02-29 15:17:57', 1, '12/31/2019', NULL, NULL, NULL),
(66, 0, 14, 18, 17, 'flower4', 'flower4-0hm66q15', '1577443339XMYiCtFt.png', '1577443339HXatWANG.jpg', NULL, NULL, NULL, NULL, NULL, 999, NULL, 998, '<br>', 193, '<br>', 1, 37, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-12-27 16:42:19', '2020-02-29 15:40:29', 0, NULL, NULL, NULL, NULL),
(67, 0, 14, 18, 17, 'flower5', 'flower5-ioy67qnl', '1577443399ex5OXC2O.png', '1577443399m1g7eKWE.jpg', NULL, NULL, NULL, NULL, NULL, 1000, NULL, 999, '<br>', 199, '<br>', 1, 23, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 1, 0, 0, '2019-12-27 16:43:19', '2020-02-14 11:43:15', 1, '12/31/2019', NULL, NULL, NULL),
(68, 0, 14, 18, 17, 'flower6', 'flower6-9bt682lj', '1577443475LVY9XMLd.png', '15774434759ZZ6wKyZ.jpg', NULL, NULL, NULL, NULL, NULL, 996, NULL, 196, '<br>', 164, '<br>', 1, 18, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-12-27 16:44:35', '2020-02-25 22:46:18', 0, NULL, NULL, NULL, NULL),
(69, 0, 14, 18, 17, 'flower7', 'flower7-88e69rqa', '1577443534WI6TFfmZ.png', '1577443534z6wsTRSN.jpg', NULL, NULL, NULL, NULL, NULL, 1000, NULL, 199, '<br>', 197, '<br>', 1, 26, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 1, 0, 0, '2019-12-27 16:45:34', '2020-02-28 12:20:58', 1, '12/30/2019', NULL, NULL, NULL),
(70, 0, 14, 18, 17, 'flower8', 'flower8-kye70vkt', '15774435899iy2f4f5.png', '1577443589UJlhgnqh.jpg', NULL, NULL, NULL, NULL, NULL, 1000, 12, 1000, '<br>', 160, '<br>', 1, 27, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, '2019-12-27 16:46:29', '2020-02-22 23:00:09', 0, NULL, NULL, NULL, NULL),
(71, 0, 14, 18, 17, 'flower9', 'flower9-3de71ztp', '1577443647hCsU4S36.png', '1577443647W94rJKh9.jpg', NULL, NULL, NULL, NULL, NULL, 1000, NULL, 1000, '<br>', 100, '<br>', 1, 20, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 1, '2019-12-27 16:47:27', '2020-02-14 11:43:09', 1, '12/30/2019', NULL, NULL, NULL),
(72, 0, 14, 18, 17, 'flower10', 'flower10-b6w72zoe', '1577443702PLMd2oGb.png', '1577443702tbj2MOQN.jpg', NULL, NULL, NULL, NULL, NULL, 1000, NULL, 198, '<br>', 58, '<br>', 1, 5, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-12-27 16:48:22', '2020-01-23 16:10:53', 0, NULL, NULL, NULL, NULL),
(73, 0, 14, 18, 17, 'flower11', 'flower11-cmy73ea3', '1577443749iuvzTA2b.png', '15774437495ce1L9ac.jpg', NULL, NULL, NULL, NULL, NULL, 1000, NULL, 1000, '<br>', 160, '<br>', 1, 23, NULL, NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2019-12-27 16:49:09', '2020-02-28 11:26:10', 0, NULL, NULL, NULL, NULL),
(74, 0, 14, 18, 17, 'flower11', 'flower11-bpl74aqo', '15774440291VzOl9MN.png', '1577444029ha61kIuw.jpg', NULL, NULL, NULL, NULL, NULL, 1000, NULL, 1000, '<br>', 159, '<br>', 1, 19, 'flowers', NULL, NULL, 2, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 0, '2019-12-27 16:53:49', '2020-02-28 12:34:36', 1, '12/28/2019', NULL, NULL, NULL),
(75, 30, 5, 6, NULL, 'Test product', 'test-product-pak75hhp', '15775458907OXeYFgo.png', '1577545890pjctwmuJ.jpg', NULL, NULL, NULL, NULL, NULL, 100, NULL, 110, 'test', 50, 'test', 1, 52, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, '#', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, 0, 0, '2019-12-28 21:11:30', '2020-02-26 16:02:38', 0, NULL, NULL, NULL, NULL),
(76, 0, 14, 18, 17, 'Avanthika Arul', 'avanthika-arul-8ly76cqu', '1581163959P89R0lUp.png', '1581163960Na6VaBGk.jpg', NULL, NULL, NULL, NULL, NULL, 750, NULL, 500, 'gr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzvgr rr tewf sdfds gdsgzds&nbsp; gz', 1, 'gr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gzgr rr tewf sdfds gdsgzds&nbsp; gz<br>', 1, 3, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-02-08 18:12:39', '2020-02-27 22:04:24', 0, NULL, NULL, NULL, NULL),
(77, 0, 5, 6, NULL, 'Avanthika Arul 1', 'avanthika-arul-bjf77ntr', '1581164024BvtCtdOQ.png', '15811640245vWBd8WY.jpg', NULL, NULL, NULL, NULL, NULL, 234, NULL, 23, 'dasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sa', 3, 'dasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sadasd as sa sa sad sad sa<br>', 1, 15, 'test', NULL, NULL, 0, '4 mins', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-02-08 18:13:44', '2020-02-28 11:48:28', 0, NULL, NULL, NULL, NULL),
(78, 13, 5, 7, NULL, 'product 1', 'product-1-yg478aub', '1581264823182LJUv7.png', '1581264823B0tmXr5G.jpg', NULL, NULL, NULL, NULL, NULL, 150, NULL, 200, 'TEST TEST TEST TEST TEST&nbsp;', NULL, 'TEST TEST TEST TEST TEST&nbsp;<br>', 1, 10, NULL, NULL, NULL, 0, '4 mins', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-02-09 22:13:43', '2020-02-28 11:47:10', 0, NULL, NULL, NULL, NULL),
(79, 13, 5, 7, NULL, 'Product 2', 'product-2-hut79aoj', '1581266227vv9GBoko.png', '1581266227Dt2kawpL.jpg', NULL, NULL, NULL, NULL, NULL, 500, NULL, 600, 'TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion&nbsp;', 6, 'TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion TEST descriotion&nbsp;<br>', 0, 4, NULL, NULL, NULL, 0, '5 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-02-09 22:37:07', '2020-02-28 11:50:06', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_clicks`
--

INSERT INTO `product_clicks` (`id`, `product_id`, `date`) VALUES
(1, 29, '2018-09-01'),
(2, 29, '2018-11-18'),
(3, 29, '2018-11-18'),
(8, 29, '2018-11-18'),
(9, 28, '2018-11-18'),
(10, 28, '2018-11-18'),
(15, 30, '2018-11-18'),
(16, 30, '2018-11-18'),
(17, 30, '2018-11-18'),
(18, 30, '2018-11-18'),
(19, 30, '2018-11-18'),
(20, 27, '2018-11-18'),
(22, 29, '2018-11-18'),
(23, 28, '2018-11-18'),
(24, 30, '2018-11-18'),
(25, 30, '2018-11-18'),
(26, 30, '2018-11-18'),
(27, 30, '2018-11-18'),
(28, 21, '2018-11-18'),
(29, 7, '2018-11-18'),
(30, 21, '2018-11-19'),
(31, 1, '2018-11-19'),
(32, 27, '2018-11-19'),
(33, 27, '2018-11-20'),
(34, 22, '2018-11-22'),
(35, 22, '2018-11-22'),
(36, 22, '2018-11-22'),
(46, 27, '2018-11-25'),
(47, 29, '2018-11-25'),
(48, 29, '2018-11-25'),
(49, 29, '2018-11-25'),
(50, 29, '2018-11-25'),
(51, 28, '2018-11-25'),
(52, 28, '2018-11-25'),
(53, 22, '2018-11-25'),
(54, 26, '2018-11-25'),
(55, 29, '2018-11-25'),
(56, 27, '2018-11-25'),
(57, 27, '2018-11-25'),
(58, 27, '2018-11-25'),
(59, 27, '2018-11-25'),
(61, 30, '2018-11-25'),
(62, 13, '2018-11-25'),
(115, 1, '2018-12-08'),
(116, 1, '2018-12-08'),
(118, 29, '2018-12-08'),
(119, 29, '2018-12-08'),
(120, 29, '2018-12-08'),
(121, 29, '2018-12-08'),
(122, 29, '2018-12-08'),
(123, 29, '2018-12-08'),
(138, 30, '2018-12-08'),
(139, 30, '2018-12-08'),
(140, 29, '2018-12-08'),
(141, 30, '2018-12-08'),
(142, 30, '2018-12-08'),
(143, 30, '2018-12-08'),
(144, 30, '2018-12-08'),
(145, 30, '2018-12-08'),
(146, 30, '2018-12-08'),
(147, 30, '2018-12-08'),
(148, 30, '2018-12-08'),
(149, 29, '2018-12-08'),
(151, 29, '2018-12-08'),
(152, 29, '2018-12-08'),
(153, 29, '2018-12-08'),
(154, 29, '2018-12-08'),
(155, 29, '2018-12-08'),
(156, 30, '2018-12-08'),
(157, 30, '2018-12-08'),
(158, 30, '2018-12-08'),
(159, 30, '2018-12-08'),
(160, 30, '2018-12-08'),
(161, 30, '2018-12-08'),
(162, 30, '2018-12-08'),
(163, 30, '2018-12-08'),
(164, 30, '2018-12-08'),
(165, 30, '2018-12-08'),
(166, 30, '2018-12-08'),
(167, 30, '2018-12-08'),
(168, 30, '2018-12-08'),
(169, 30, '2018-12-08'),
(170, 30, '2018-12-08'),
(171, 30, '2018-12-08'),
(172, 30, '2018-12-08'),
(173, 30, '2018-12-08'),
(174, 30, '2018-12-08'),
(175, 30, '2018-12-08'),
(176, 30, '2018-12-08'),
(177, 30, '2018-12-08'),
(178, 30, '2018-12-08'),
(179, 30, '2018-12-08'),
(180, 30, '2018-12-08'),
(181, 30, '2018-12-08'),
(182, 30, '2018-12-08'),
(183, 30, '2018-12-08'),
(184, 30, '2018-12-08'),
(185, 30, '2018-12-08'),
(186, 30, '2018-12-08'),
(187, 30, '2018-12-08'),
(188, 30, '2018-12-08'),
(189, 30, '2018-12-08'),
(190, 30, '2018-12-08'),
(191, 30, '2018-12-08'),
(199, 29, '2018-12-08'),
(200, 29, '2018-12-08'),
(201, 29, '2018-12-08'),
(213, 30, '2018-12-08'),
(214, 30, '2018-12-08'),
(215, 30, '2018-12-08'),
(216, 30, '2018-12-08'),
(217, 29, '2018-12-08'),
(218, 29, '2018-12-08'),
(219, 29, '2018-12-08'),
(220, 30, '2018-12-08'),
(221, 30, '2018-12-08'),
(222, 30, '2018-12-08'),
(223, 30, '2018-12-08'),
(224, 30, '2018-12-08'),
(225, 30, '2018-12-08'),
(226, 30, '2018-12-08'),
(227, 30, '2018-12-08'),
(228, 30, '2018-12-08'),
(229, 30, '2018-12-08'),
(230, 30, '2018-12-08'),
(231, 30, '2018-12-08'),
(232, 30, '2018-12-08'),
(233, 30, '2018-12-08'),
(234, 30, '2018-12-08'),
(235, 30, '2018-12-08'),
(236, 30, '2018-12-08'),
(237, 30, '2018-12-08'),
(238, 30, '2018-12-08'),
(239, 30, '2018-12-08'),
(240, 30, '2018-12-08'),
(241, 30, '2018-12-08'),
(242, 30, '2018-12-08'),
(243, 30, '2018-12-08'),
(244, 30, '2018-12-08'),
(245, 30, '2018-12-08'),
(246, 30, '2018-12-08'),
(247, 30, '2018-12-08'),
(277, 30, '2018-12-09'),
(302, 30, '2018-12-09'),
(303, 30, '2018-12-09'),
(315, 4, '2018-12-19'),
(316, 29, '2018-12-19'),
(317, 29, '2018-12-19'),
(318, 29, '2018-12-19'),
(319, 29, '2018-12-19'),
(320, 29, '2018-12-19'),
(321, 29, '2018-12-19'),
(322, 29, '2018-12-19'),
(323, 29, '2018-12-19'),
(324, 29, '2018-12-19'),
(325, 29, '2018-12-19'),
(326, 29, '2018-12-19'),
(327, 29, '2018-12-19'),
(328, 29, '2018-12-19'),
(329, 29, '2018-12-19'),
(330, 29, '2018-12-19'),
(331, 29, '2018-12-19'),
(332, 29, '2018-12-19'),
(333, 29, '2018-12-19'),
(334, 30, '2018-12-19'),
(335, 30, '2018-12-19'),
(336, 30, '2018-12-19'),
(337, 30, '2018-12-19'),
(338, 30, '2018-12-19'),
(339, 30, '2018-12-19'),
(340, 30, '2018-12-19'),
(341, 30, '2018-12-19'),
(342, 30, '2018-12-19'),
(371, 30, '2018-12-19'),
(372, 30, '2018-12-19'),
(376, 28, '2018-12-19'),
(395, 1, '2018-12-20'),
(396, 1, '2018-12-20'),
(397, 1, '2018-12-20'),
(398, 1, '2018-12-20'),
(399, 1, '2018-12-20'),
(400, 5, '2018-12-20'),
(401, 1, '2018-12-20'),
(402, 1, '2018-12-20'),
(403, 1, '2018-12-20'),
(404, 1, '2018-12-20'),
(726, 42, '2018-12-23'),
(727, 42, '2018-12-23'),
(735, 43, '2018-12-23'),
(736, 42, '2018-12-23'),
(738, 45, '2018-12-23'),
(739, 45, '2018-12-23'),
(740, 45, '2018-12-23'),
(765, 45, '2019-02-11'),
(767, 45, '2019-04-08'),
(790, 45, '2019-05-12'),
(791, 45, '2019-05-12'),
(792, 45, '2019-05-12'),
(793, 45, '2019-05-12'),
(794, 45, '2019-05-12'),
(795, 43, '2019-05-12'),
(796, 43, '2019-05-12'),
(797, 43, '2019-05-12'),
(798, 43, '2019-05-12'),
(799, 43, '2019-05-12'),
(800, 43, '2019-05-12'),
(801, 43, '2019-05-12'),
(802, 43, '2019-05-12'),
(803, 43, '2019-05-12'),
(804, 43, '2019-05-12'),
(805, 43, '2019-05-13'),
(806, 43, '2019-05-13'),
(807, 43, '2019-05-13'),
(808, 43, '2019-05-13'),
(809, 43, '2019-05-13'),
(810, 43, '2019-05-13'),
(811, 43, '2019-05-13'),
(812, 43, '2019-05-13'),
(813, 43, '2019-05-13'),
(814, 43, '2019-05-13'),
(815, 43, '2019-05-13'),
(816, 43, '2019-05-13'),
(817, 43, '2019-05-13'),
(818, 43, '2019-05-13'),
(819, 43, '2019-05-13'),
(820, 43, '2019-05-13'),
(821, 43, '2019-05-13'),
(822, 43, '2019-05-13'),
(823, 43, '2019-05-13'),
(824, 43, '2019-05-13'),
(825, 43, '2019-05-13'),
(826, 43, '2019-05-13'),
(827, 43, '2019-05-13'),
(828, 42, '2019-05-13'),
(829, 43, '2019-05-13'),
(830, 43, '2019-05-13'),
(831, 43, '2019-05-13'),
(833, 43, '2019-05-13'),
(834, 43, '2019-05-13'),
(835, 43, '2019-05-13'),
(836, 43, '2019-05-13'),
(837, 43, '2019-05-13'),
(838, 43, '2019-05-13'),
(839, 43, '2019-05-13'),
(840, 43, '2019-05-13'),
(841, 43, '2019-05-13'),
(842, 43, '2019-05-13'),
(843, 43, '2019-05-13'),
(844, 43, '2019-05-13'),
(845, 43, '2019-05-13'),
(846, 43, '2019-05-13'),
(847, 43, '2019-05-13'),
(848, 43, '2019-05-13'),
(849, 43, '2019-05-13'),
(850, 43, '2019-05-13'),
(851, 43, '2019-05-13'),
(852, 43, '2019-05-13'),
(853, 43, '2019-05-13'),
(854, 43, '2019-05-13'),
(855, 43, '2019-05-13'),
(856, 43, '2019-05-13'),
(857, 43, '2019-05-13'),
(858, 43, '2019-05-13'),
(859, 43, '2019-05-13'),
(860, 43, '2019-05-13'),
(861, 43, '2019-05-13'),
(862, 43, '2019-05-13'),
(863, 43, '2019-05-13'),
(864, 43, '2019-05-13'),
(865, 43, '2019-05-13'),
(866, 43, '2019-05-13'),
(867, 43, '2019-05-13'),
(868, 43, '2019-05-13'),
(869, 43, '2019-05-13'),
(870, 43, '2019-05-13'),
(871, 43, '2019-05-13'),
(872, 43, '2019-05-13'),
(873, 43, '2019-05-13'),
(874, 43, '2019-05-13'),
(875, 43, '2019-05-13'),
(876, 43, '2019-05-13'),
(877, 43, '2019-05-13'),
(878, 43, '2019-05-13'),
(879, 43, '2019-05-13'),
(880, 43, '2019-05-13'),
(881, 43, '2019-05-13'),
(882, 43, '2019-05-13'),
(883, 43, '2019-05-13'),
(884, 43, '2019-05-13'),
(885, 43, '2019-05-13'),
(886, 43, '2019-05-13'),
(887, 43, '2019-05-13'),
(888, 43, '2019-05-13'),
(889, 43, '2019-05-13'),
(890, 43, '2019-05-13'),
(891, 43, '2019-05-13'),
(892, 43, '2019-05-13'),
(893, 43, '2019-05-13'),
(894, 43, '2019-05-13'),
(895, 43, '2019-05-13'),
(896, 43, '2019-05-13'),
(897, 43, '2019-05-13'),
(898, 43, '2019-05-13'),
(899, 43, '2019-05-13'),
(900, 43, '2019-05-13'),
(901, 43, '2019-05-13'),
(902, 43, '2019-05-13'),
(903, 43, '2019-05-13'),
(904, 43, '2019-05-13'),
(906, 43, '2019-05-13'),
(907, 43, '2019-05-13'),
(908, 43, '2019-05-13'),
(909, 43, '2019-05-13'),
(910, 43, '2019-05-13'),
(911, 43, '2019-05-13'),
(912, 43, '2019-05-13'),
(913, 43, '2019-05-13'),
(914, 43, '2019-05-13'),
(915, 43, '2019-05-13'),
(916, 43, '2019-05-13'),
(917, 43, '2019-05-13'),
(918, 43, '2019-05-13'),
(919, 43, '2019-05-13'),
(920, 43, '2019-05-13'),
(921, 43, '2019-05-13'),
(922, 43, '2019-05-13'),
(923, 43, '2019-05-13'),
(924, 43, '2019-05-13'),
(925, 43, '2019-05-13'),
(926, 43, '2019-05-13'),
(927, 43, '2019-05-13'),
(928, 43, '2019-05-13'),
(929, 43, '2019-05-13'),
(930, 43, '2019-05-13'),
(931, 43, '2019-05-13'),
(932, 43, '2019-05-13'),
(933, 43, '2019-05-13'),
(934, 43, '2019-05-13'),
(935, 43, '2019-05-13'),
(936, 43, '2019-05-13'),
(937, 43, '2019-05-13'),
(938, 43, '2019-05-13'),
(939, 43, '2019-05-13'),
(940, 43, '2019-05-13'),
(941, 43, '2019-05-13'),
(942, 43, '2019-05-13'),
(943, 43, '2019-05-13'),
(944, 43, '2019-05-13'),
(945, 43, '2019-05-13'),
(946, 43, '2019-05-13'),
(947, 43, '2019-05-13'),
(948, 43, '2019-05-13'),
(949, 43, '2019-05-13'),
(950, 43, '2019-05-13'),
(951, 43, '2019-05-13'),
(952, 43, '2019-05-13'),
(953, 43, '2019-05-13'),
(954, 43, '2019-05-13'),
(955, 43, '2019-05-13'),
(956, 43, '2019-05-13'),
(957, 43, '2019-05-13'),
(958, 43, '2019-05-13'),
(959, 43, '2019-05-13'),
(960, 43, '2019-05-13'),
(961, 43, '2019-05-13'),
(962, 43, '2019-05-13'),
(963, 43, '2019-05-13'),
(964, 43, '2019-05-13'),
(965, 43, '2019-05-13'),
(966, 43, '2019-05-13'),
(967, 43, '2019-05-13'),
(968, 43, '2019-05-13'),
(969, 43, '2019-05-13'),
(970, 43, '2019-05-13'),
(971, 43, '2019-05-13'),
(972, 43, '2019-05-13'),
(973, 43, '2019-05-13'),
(974, 43, '2019-05-13'),
(975, 43, '2019-05-13'),
(976, 43, '2019-05-13'),
(977, 43, '2019-05-13'),
(978, 43, '2019-05-13'),
(979, 43, '2019-05-13'),
(980, 43, '2019-05-13'),
(981, 45, '2019-05-13'),
(982, 45, '2019-05-13'),
(995, 42, '2019-05-15'),
(996, 42, '2019-05-15'),
(997, 42, '2019-05-15'),
(998, 42, '2019-05-15'),
(999, 42, '2019-05-15'),
(1000, 42, '2019-05-15'),
(1001, 42, '2019-05-15'),
(1002, 42, '2019-05-15'),
(1003, 42, '2019-05-15'),
(1004, 42, '2019-05-15'),
(1005, 42, '2019-05-15'),
(1006, 42, '2019-05-15'),
(1007, 42, '2019-05-15'),
(1008, 42, '2019-05-15'),
(1009, 42, '2019-05-15'),
(1010, 42, '2019-05-15'),
(1011, 42, '2019-05-15'),
(1012, 42, '2019-05-15'),
(1013, 42, '2019-05-15'),
(1014, 42, '2019-05-15'),
(1015, 42, '2019-05-15'),
(1016, 42, '2019-05-15'),
(1017, 42, '2019-05-15'),
(1018, 42, '2019-05-15'),
(1019, 42, '2019-05-15'),
(1020, 42, '2019-05-15'),
(1021, 42, '2019-05-15'),
(1022, 42, '2019-05-15'),
(1023, 43, '2019-05-15'),
(1025, 42, '2019-05-15'),
(1027, 42, '2019-05-15'),
(1028, 42, '2019-05-15'),
(1029, 42, '2019-05-15'),
(1030, 42, '2019-05-15'),
(1031, 42, '2019-05-15'),
(1032, 42, '2019-05-15'),
(1033, 42, '2019-05-15'),
(1034, 42, '2019-05-15'),
(1035, 42, '2019-05-15'),
(1036, 42, '2019-05-15'),
(1037, 42, '2019-05-15'),
(1038, 42, '2019-05-15'),
(1039, 42, '2019-05-15'),
(1041, 42, '2019-05-15'),
(1042, 42, '2019-05-15'),
(1043, 42, '2019-05-15'),
(1044, 42, '2019-05-15'),
(1045, 42, '2019-05-15'),
(1046, 42, '2019-05-15'),
(1047, 42, '2019-05-15'),
(1048, 42, '2019-05-15'),
(1049, 42, '2019-05-15'),
(1050, 43, '2019-05-15'),
(1051, 43, '2019-05-15'),
(1052, 43, '2019-05-15'),
(1056, 42, '2019-05-16'),
(1058, 43, '2019-05-16'),
(1059, 43, '2019-05-16'),
(1060, 43, '2019-05-16'),
(1061, 45, '2019-05-16'),
(1062, 45, '2019-05-16'),
(1063, 43, '2019-05-16'),
(1064, 43, '2019-05-16'),
(1065, 43, '2019-05-16'),
(1066, 43, '2019-05-16'),
(1067, 43, '2019-05-16'),
(1068, 43, '2019-05-16'),
(1069, 43, '2019-05-16'),
(1070, 43, '2019-05-16'),
(1071, 43, '2019-05-16'),
(1072, 43, '2019-05-16'),
(1076, 43, '2019-05-18'),
(1077, 43, '2019-05-18'),
(1078, 43, '2019-05-18'),
(1079, 43, '2019-05-18'),
(1080, 43, '2019-05-18'),
(1081, 43, '2019-05-18'),
(1082, 43, '2019-05-18'),
(1083, 43, '2019-05-18'),
(1084, 43, '2019-05-18'),
(1085, 43, '2019-05-18'),
(1086, 43, '2019-05-18'),
(1087, 43, '2019-05-18'),
(1088, 43, '2019-05-18'),
(1089, 43, '2019-05-18'),
(1090, 43, '2019-05-18'),
(1091, 43, '2019-05-18'),
(1092, 43, '2019-05-18'),
(1097, 42, '2019-05-19'),
(1098, 42, '2019-05-19'),
(1099, 43, '2019-05-19'),
(1100, 43, '2019-05-19'),
(1101, 43, '2019-05-19'),
(1102, 43, '2019-05-19'),
(1103, 43, '2019-05-19'),
(1104, 43, '2019-05-19'),
(1105, 43, '2019-05-19'),
(1106, 43, '2019-05-19'),
(1137, 45, '2019-05-25'),
(1139, 43, '2019-05-25'),
(1141, 43, '2019-05-25'),
(1142, 43, '2019-05-25'),
(1143, 43, '2019-05-25'),
(1144, 43, '2019-05-25'),
(1145, 43, '2019-05-25'),
(1146, 43, '2019-05-25'),
(1147, 43, '2019-05-25'),
(1148, 43, '2019-05-25'),
(1149, 43, '2019-05-25'),
(1150, 43, '2019-05-25'),
(1154, 43, '2019-05-26'),
(1155, 43, '2019-05-26'),
(1156, 43, '2019-05-26'),
(1157, 43, '2019-05-26'),
(1158, 43, '2019-05-26'),
(1159, 43, '2019-05-26'),
(1160, 43, '2019-05-26'),
(1161, 43, '2019-05-26'),
(1162, 43, '2019-05-26'),
(1163, 43, '2019-05-26'),
(1164, 43, '2019-05-26'),
(1165, 43, '2019-05-26'),
(1166, 43, '2019-05-26'),
(1167, 43, '2019-05-26'),
(1168, 43, '2019-05-26'),
(1169, 43, '2019-05-26'),
(1170, 43, '2019-05-26'),
(1171, 43, '2019-05-26'),
(1172, 43, '2019-05-26'),
(1173, 43, '2019-05-26'),
(1174, 43, '2019-05-26'),
(1175, 43, '2019-05-26'),
(1176, 43, '2019-05-26'),
(1177, 43, '2019-05-26'),
(1178, 43, '2019-05-26'),
(1179, 43, '2019-05-26'),
(1180, 43, '2019-05-26'),
(1181, 43, '2019-05-26'),
(1182, 43, '2019-05-26'),
(1183, 43, '2019-05-26'),
(1184, 43, '2019-05-26'),
(1185, 43, '2019-05-26'),
(1186, 45, '2019-05-26'),
(1187, 43, '2019-05-26'),
(1188, 43, '2019-05-26'),
(1189, 43, '2019-05-26'),
(1190, 43, '2019-05-26'),
(1191, 43, '2019-05-26'),
(1192, 43, '2019-05-26'),
(1194, 43, '2019-05-27'),
(1195, 43, '2019-05-27'),
(1196, 43, '2019-05-27'),
(1197, 43, '2019-05-27'),
(1198, 43, '2019-05-27'),
(1199, 43, '2019-05-27'),
(1200, 43, '2019-05-27'),
(1201, 45, '2019-05-31'),
(1202, 43, '2019-05-31'),
(1203, 43, '2019-05-31'),
(1204, 43, '2019-05-31'),
(1205, 43, '2019-05-31'),
(1206, 43, '2019-05-31'),
(1207, 43, '2019-05-31'),
(1208, 43, '2019-05-31'),
(1209, 43, '2019-05-31'),
(1210, 43, '2019-06-01'),
(1211, 43, '2019-06-01'),
(1212, 43, '2019-06-01'),
(1213, 43, '2019-06-01'),
(1214, 43, '2019-06-01'),
(1215, 43, '2019-06-01'),
(1216, 43, '2019-06-01'),
(1217, 43, '2019-06-01'),
(1218, 43, '2019-06-04'),
(1219, 43, '2019-06-04'),
(1220, 43, '2019-06-04'),
(1221, 43, '2019-06-04'),
(1222, 43, '2019-06-06'),
(1225, 43, '2019-06-11'),
(1226, 43, '2019-06-11'),
(1227, 43, '2019-06-11'),
(1228, 43, '2019-06-11'),
(1229, 43, '2019-06-11'),
(1230, 43, '2019-06-11'),
(1231, 43, '2019-06-11'),
(1232, 43, '2019-06-11'),
(1233, 43, '2019-06-11'),
(1234, 43, '2019-06-11'),
(1235, 43, '2019-06-11'),
(1236, 43, '2019-06-11'),
(1237, 43, '2019-06-11'),
(1241, 43, '2019-06-11'),
(1242, 43, '2019-06-11'),
(1243, 45, '2019-06-11'),
(1244, 43, '2019-06-11'),
(1247, 43, '2019-06-11'),
(1248, 43, '2019-06-11'),
(1252, 42, '2019-06-11'),
(1255, 42, '2019-06-11'),
(1258, 42, '2019-06-11'),
(1259, 43, '2019-06-11'),
(1260, 42, '2019-06-11'),
(1261, 45, '2019-06-11'),
(1262, 45, '2019-06-11'),
(1263, 45, '2019-06-11'),
(1264, 43, '2019-06-11'),
(1265, 42, '2019-06-11'),
(1266, 42, '2019-06-11'),
(1267, 43, '2019-06-11'),
(1268, 43, '2019-06-11'),
(1269, 43, '2019-06-11'),
(1273, 43, '2019-06-20'),
(1280, 43, '2019-06-22'),
(1281, 43, '2019-06-22'),
(1282, 43, '2019-06-22'),
(1283, 43, '2019-06-22'),
(1284, 43, '2019-06-22'),
(1285, 43, '2019-06-22'),
(1286, 43, '2019-06-22'),
(1287, 43, '2019-06-22'),
(1289, 45, '2019-06-22'),
(1290, 43, '2019-06-22'),
(1291, 43, '2019-06-22'),
(1292, 43, '2019-06-22'),
(1293, 43, '2019-06-22'),
(1294, 43, '2019-06-22'),
(1295, 43, '2019-06-22'),
(1296, 43, '2019-06-22'),
(1297, 43, '2019-06-22'),
(1299, 45, '2019-06-22'),
(1300, 45, '2019-06-22'),
(1301, 45, '2019-06-22'),
(1302, 45, '2019-06-22'),
(1303, 45, '2019-06-22'),
(1304, 45, '2019-06-22'),
(1305, 45, '2019-06-22'),
(1306, 45, '2019-06-22'),
(1307, 45, '2019-06-22'),
(1308, 45, '2019-06-22'),
(1309, 45, '2019-06-22'),
(1310, 45, '2019-06-22'),
(1311, 45, '2019-06-22'),
(1312, 45, '2019-06-22'),
(1313, 45, '2019-06-22'),
(1314, 45, '2019-06-22'),
(1315, 45, '2019-06-22'),
(1316, 45, '2019-06-22'),
(1317, 45, '2019-06-22'),
(1318, 45, '2019-06-22'),
(1319, 45, '2019-06-22'),
(1320, 45, '2019-06-22'),
(1321, 45, '2019-06-22'),
(1322, 45, '2019-06-22'),
(1323, 45, '2019-06-22'),
(1324, 45, '2019-06-22'),
(1325, 45, '2019-06-22'),
(1326, 43, '2019-06-22'),
(1327, 43, '2019-06-22'),
(1328, 43, '2019-06-22'),
(1329, 43, '2019-06-22'),
(1331, 43, '2019-06-22'),
(1332, 43, '2019-06-22'),
(1333, 45, '2019-06-22'),
(1334, 45, '2019-06-22'),
(1335, 45, '2019-06-22'),
(1336, 45, '2019-06-22'),
(1337, 45, '2019-06-22'),
(1338, 45, '2019-06-22'),
(1339, 45, '2019-06-22'),
(1341, 45, '2019-06-23'),
(1345, 45, '2019-06-24'),
(1346, 45, '2019-06-24'),
(1347, 45, '2019-06-24'),
(1348, 45, '2019-06-26'),
(1349, 45, '2019-06-26'),
(1362, 43, '2019-06-27'),
(1363, 43, '2019-06-27'),
(1364, 43, '2019-06-27'),
(1365, 43, '2019-06-27'),
(1366, 43, '2019-06-27'),
(1367, 43, '2019-06-27'),
(1368, 43, '2019-06-27'),
(1370, 43, '2019-07-03'),
(1382, 43, '2019-07-03'),
(1385, 42, '2019-07-04'),
(1386, 43, '2019-07-14'),
(1387, 43, '2019-07-14'),
(1389, 42, '2019-07-14'),
(1391, 42, '2019-07-15'),
(1402, 45, '2019-07-16'),
(1403, 45, '2019-07-16'),
(1405, 43, '2019-07-16'),
(1406, 43, '2019-07-16'),
(1407, 43, '2019-07-16'),
(1408, 43, '2019-07-16'),
(1409, 43, '2019-07-16'),
(1410, 43, '2019-07-16'),
(1411, 43, '2019-07-16'),
(1412, 43, '2019-07-16'),
(1413, 43, '2019-07-16'),
(1414, 43, '2019-07-16'),
(1415, 43, '2019-07-16'),
(1416, 43, '2019-07-16'),
(1417, 43, '2019-07-16'),
(1418, 43, '2019-07-16'),
(1419, 43, '2019-07-16'),
(1420, 43, '2019-07-16'),
(1421, 43, '2019-07-16'),
(1422, 43, '2019-07-16'),
(1427, 43, '2019-07-19'),
(1428, 43, '2019-07-19'),
(1430, 43, '2019-07-19'),
(1431, 43, '2019-07-19'),
(1432, 43, '2019-07-19'),
(1433, 43, '2019-07-19'),
(1436, 43, '2019-07-22'),
(1448, 45, '2019-07-23'),
(1451, 45, '2019-07-23'),
(1452, 43, '2019-07-24'),
(1454, 43, '2019-07-24'),
(1456, 43, '2019-07-24'),
(1457, 42, '2019-07-24'),
(1458, 42, '2019-07-24'),
(1459, 42, '2019-07-24'),
(1460, 42, '2019-07-24'),
(1464, 43, '2019-07-24'),
(1465, 45, '2019-07-24'),
(1466, 45, '2019-07-24'),
(1469, 45, '2019-07-24'),
(1479, 43, '2019-07-24'),
(1480, 43, '2019-07-24'),
(1481, 43, '2019-07-24'),
(1482, 43, '2019-07-24'),
(1483, 42, '2019-07-24'),
(1512, 45, '2019-07-25'),
(1523, 43, '2019-07-25'),
(1524, 43, '2019-07-25'),
(1525, 43, '2019-07-25'),
(1526, 43, '2019-07-25'),
(1527, 43, '2019-07-25'),
(1532, 43, '2019-07-25'),
(1535, 43, '2019-07-25'),
(1536, 43, '2019-07-25'),
(1537, 43, '2019-07-25'),
(1538, 43, '2019-07-25'),
(1539, 43, '2019-07-25'),
(1540, 43, '2019-07-25'),
(1541, 43, '2019-07-25'),
(1542, 43, '2019-07-25'),
(1543, 43, '2019-07-25'),
(1544, 43, '2019-07-25'),
(1546, 45, '2019-07-25'),
(1547, 43, '2019-07-25'),
(1548, 43, '2019-07-25'),
(1549, 43, '2019-07-25'),
(1550, 43, '2019-07-25'),
(1551, 43, '2019-07-25'),
(1552, 43, '2019-07-25'),
(1553, 43, '2019-07-25'),
(1554, 43, '2019-07-25'),
(1555, 43, '2019-07-25'),
(1556, 43, '2019-07-25'),
(1557, 43, '2019-07-25'),
(1558, 43, '2019-07-25'),
(1559, 42, '2019-07-25'),
(1565, 45, '2019-07-27'),
(1566, 45, '2019-07-27'),
(1567, 45, '2019-07-27'),
(1568, 45, '2019-07-27'),
(1569, 42, '2019-07-27'),
(1570, 45, '2019-07-27'),
(1571, 43, '2019-07-27'),
(1576, 42, '2019-07-27'),
(1579, 43, '2019-07-27'),
(1581, 45, '2019-07-27'),
(1582, 42, '2019-07-27'),
(1583, 42, '2019-07-27'),
(1584, 42, '2019-07-27'),
(1585, 42, '2019-07-27'),
(1586, 42, '2019-07-27'),
(1587, 42, '2019-07-27'),
(1588, 42, '2019-07-27'),
(1589, 45, '2019-07-27'),
(1606, 42, '2019-11-25'),
(1607, 42, '2019-11-28'),
(1610, 43, '2019-12-10'),
(1611, 42, '2019-12-10'),
(1612, 43, '2019-12-10'),
(1613, 43, '2019-12-10'),
(1614, 43, '2019-12-10'),
(1615, 43, '2019-12-10'),
(1616, 42, '2019-12-11'),
(1618, 43, '2019-12-12'),
(1620, 42, '2019-12-13'),
(1623, 42, '2019-12-13'),
(1624, 43, '2019-12-13'),
(1625, 42, '2019-12-15'),
(1628, 43, '2019-12-15'),
(1629, 43, '2019-12-18'),
(1630, 43, '2019-12-18'),
(1631, 43, '2019-12-19'),
(1632, 43, '2019-12-19'),
(1633, 42, '2019-12-26'),
(1634, 42, '2019-12-26'),
(1635, 42, '2019-12-26'),
(1636, 42, '2019-12-26'),
(1638, 43, '2019-12-26'),
(1639, 43, '2019-12-26'),
(1640, 42, '2019-12-26'),
(1641, 43, '2019-12-26'),
(1644, 43, '2019-12-26'),
(1645, 42, '2019-12-26'),
(1649, 45, '2019-12-26'),
(1651, 62, '2019-12-26'),
(1653, 45, '2019-12-26'),
(1655, 62, '2019-12-26'),
(1663, 43, '2019-12-27'),
(1664, 43, '2019-12-27'),
(1665, 43, '2019-12-27'),
(1666, 43, '2019-12-27'),
(1670, 45, '2019-12-27'),
(1671, 42, '2019-12-27'),
(1673, 42, '2019-12-27'),
(1674, 42, '2019-12-27'),
(1675, 43, '2019-12-27'),
(1676, 43, '2019-12-27'),
(1677, 43, '2019-12-27'),
(1678, 42, '2019-12-27'),
(1679, 42, '2019-12-27'),
(1680, 43, '2019-12-27'),
(1681, 45, '2019-12-27'),
(1683, 42, '2019-12-27'),
(1684, 43, '2019-12-27'),
(1685, 42, '2019-12-27'),
(1686, 45, '2019-12-27'),
(1687, 42, '2019-12-27'),
(1688, 42, '2019-12-27'),
(1689, 42, '2019-12-27'),
(1690, 42, '2019-12-27'),
(1691, 42, '2019-12-27'),
(1692, 42, '2019-12-27'),
(1693, 42, '2019-12-27'),
(1694, 42, '2019-12-27'),
(1695, 42, '2019-12-27'),
(1696, 42, '2019-12-27'),
(1697, 42, '2019-12-27'),
(1698, 42, '2019-12-27'),
(1699, 42, '2019-12-27'),
(1700, 42, '2019-12-27'),
(1701, 42, '2019-12-27'),
(1702, 42, '2019-12-27'),
(1703, 42, '2019-12-27'),
(1704, 42, '2019-12-27'),
(1705, 42, '2019-12-27'),
(1706, 42, '2019-12-27'),
(1707, 42, '2019-12-27'),
(1708, 42, '2019-12-27'),
(1709, 42, '2019-12-27'),
(1710, 42, '2019-12-27'),
(1711, 42, '2019-12-27'),
(1712, 42, '2019-12-27'),
(1713, 42, '2019-12-27'),
(1714, 42, '2019-12-27'),
(1715, 42, '2019-12-27'),
(1716, 45, '2019-12-27'),
(1717, 42, '2019-12-27'),
(1718, 42, '2019-12-27'),
(1721, 42, '2019-12-27'),
(1722, 42, '2019-12-27'),
(1723, 43, '2019-12-27'),
(1725, 43, '2019-12-27'),
(1726, 45, '2019-12-27'),
(1727, 66, '2019-12-28'),
(1728, 74, '2019-12-28'),
(1729, 65, '2019-12-28'),
(1730, 66, '2019-12-28'),
(1731, 71, '2019-12-29'),
(1732, 70, '2019-12-29'),
(1733, 73, '2019-12-29'),
(1734, 68, '2019-12-29'),
(1735, 67, '2019-12-29'),
(1736, 75, '2019-12-29'),
(1737, 69, '2019-12-29'),
(1738, 65, '2019-12-29'),
(1739, 70, '2019-12-29'),
(1740, 66, '2019-12-29'),
(1741, 69, '2019-12-29'),
(1742, 67, '2019-12-29'),
(1743, 66, '2019-12-30'),
(1744, 65, '2019-12-30'),
(1745, 63, '2019-12-31'),
(1746, 64, '2019-12-31'),
(1747, 64, '2019-12-31'),
(1748, 64, '2019-12-31'),
(1749, 64, '2019-12-31'),
(1750, 64, '2019-12-31'),
(1751, 64, '2019-12-31'),
(1752, 64, '2019-12-31'),
(1753, 64, '2019-12-31'),
(1754, 64, '2019-12-31'),
(1755, 64, '2019-12-31'),
(1756, 64, '2019-12-31'),
(1757, 64, '2019-12-31'),
(1758, 64, '2019-12-31'),
(1759, 42, '2019-12-31'),
(1760, 64, '2019-12-31'),
(1761, 42, '2019-12-31'),
(1762, 42, '2019-12-31'),
(1763, 42, '2019-12-31'),
(1764, 42, '2019-12-31'),
(1765, 42, '2019-12-31'),
(1766, 42, '2019-12-31'),
(1767, 42, '2019-12-31'),
(1768, 42, '2019-12-31'),
(1769, 42, '2019-12-31'),
(1770, 42, '2019-12-31'),
(1771, 42, '2019-12-31'),
(1772, 42, '2019-12-31'),
(1773, 42, '2019-12-31'),
(1774, 42, '2019-12-31'),
(1775, 42, '2019-12-31'),
(1776, 42, '2019-12-31'),
(1777, 42, '2019-12-31'),
(1778, 42, '2019-12-31'),
(1779, 42, '2019-12-31'),
(1780, 42, '2019-12-31'),
(1781, 42, '2019-12-31'),
(1782, 42, '2019-12-31'),
(1783, 42, '2019-12-31'),
(1784, 42, '2019-12-31'),
(1785, 42, '2019-12-31'),
(1786, 42, '2019-12-31'),
(1787, 42, '2019-12-31'),
(1788, 42, '2019-12-31'),
(1789, 42, '2019-12-31'),
(1790, 42, '2019-12-31'),
(1791, 42, '2019-12-31'),
(1792, 42, '2019-12-31'),
(1793, 42, '2019-12-31'),
(1794, 42, '2019-12-31'),
(1795, 42, '2019-12-31'),
(1796, 42, '2019-12-31'),
(1797, 42, '2019-12-31'),
(1798, 42, '2019-12-31'),
(1799, 42, '2019-12-31'),
(1800, 42, '2019-12-31'),
(1801, 42, '2019-12-31'),
(1802, 42, '2019-12-31'),
(1803, 42, '2019-12-31'),
(1804, 42, '2019-12-31'),
(1805, 42, '2019-12-31'),
(1806, 42, '2019-12-31'),
(1807, 42, '2019-12-31'),
(1808, 42, '2019-12-31'),
(1809, 42, '2019-12-31'),
(1810, 42, '2019-12-31'),
(1811, 42, '2019-12-31'),
(1812, 42, '2019-12-31'),
(1813, 42, '2019-12-31'),
(1814, 42, '2019-12-31'),
(1815, 42, '2019-12-31'),
(1816, 42, '2019-12-31'),
(1817, 42, '2019-12-31'),
(1818, 45, '2019-12-31'),
(1819, 45, '2019-12-31'),
(1825, 42, '2019-12-31'),
(1826, 43, '2019-12-31'),
(1827, 42, '2019-12-31'),
(1828, 42, '2019-12-31'),
(1829, 42, '2019-12-31'),
(1830, 45, '2020-01-01'),
(1831, 74, '2020-01-01'),
(1832, 75, '2020-01-01'),
(1833, 71, '2020-01-01'),
(1834, 64, '2020-01-02'),
(1835, 68, '2020-01-02'),
(1836, 64, '2020-01-02'),
(1837, 64, '2020-01-02'),
(1838, 67, '2020-01-02'),
(1839, 73, '2020-01-02'),
(1840, 70, '2020-01-02'),
(1841, 64, '2020-01-02'),
(1842, 75, '2020-01-02'),
(1843, 75, '2020-01-02'),
(1844, 75, '2020-01-02'),
(1845, 75, '2020-01-02'),
(1846, 71, '2020-01-03'),
(1847, 66, '2020-01-03'),
(1848, 74, '2020-01-03'),
(1849, 75, '2020-01-03'),
(1850, 75, '2020-01-04'),
(1851, 75, '2020-01-04'),
(1852, 64, '2020-01-04'),
(1853, 70, '2020-01-04'),
(1854, 71, '2020-01-04'),
(1855, 65, '2020-01-04'),
(1856, 68, '2020-01-04'),
(1857, 69, '2020-01-04'),
(1858, 66, '2020-01-04'),
(1859, 64, '2020-01-04'),
(1860, 67, '2020-01-04'),
(1861, 73, '2020-01-04'),
(1862, 75, '2020-01-04'),
(1863, 74, '2020-01-05'),
(1864, 66, '2020-01-05'),
(1865, 73, '2020-01-05'),
(1866, 75, '2020-01-05'),
(1867, 69, '2020-01-05'),
(1868, 70, '2020-01-05'),
(1869, 67, '2020-01-05'),
(1870, 64, '2020-01-05'),
(1871, 71, '2020-01-05'),
(1872, 65, '2020-01-05'),
(1873, 73, '2020-01-06'),
(1874, 68, '2020-01-07'),
(1875, 70, '2020-01-07'),
(1876, 71, '2020-01-07'),
(1877, 67, '2020-01-07'),
(1878, 65, '2020-01-07'),
(1879, 69, '2020-01-07'),
(1880, 64, '2020-01-07'),
(1881, 65, '2020-01-07'),
(1882, 63, '2020-01-07'),
(1883, 68, '2020-01-07'),
(1884, 68, '2020-01-07'),
(1885, 65, '2020-01-07'),
(1886, 66, '2020-01-07'),
(1887, 68, '2020-01-07'),
(1888, 70, '2020-01-07'),
(1889, 65, '2020-01-07'),
(1890, 71, '2020-01-07'),
(1891, 75, '2020-01-07'),
(1892, 64, '2020-01-07'),
(1893, 65, '2020-01-07'),
(1894, 64, '2020-01-07'),
(1895, 67, '2020-01-07'),
(1896, 73, '2020-01-07'),
(1897, 75, '2020-01-08'),
(1898, 65, '2020-01-08'),
(1899, 74, '2020-01-08'),
(1900, 69, '2020-01-08'),
(1901, 65, '2020-01-08'),
(1902, 65, '2020-01-08'),
(1903, 66, '2020-01-08'),
(1904, 70, '2020-01-09'),
(1905, 66, '2020-01-09'),
(1906, 65, '2020-01-09'),
(1907, 75, '2020-01-09'),
(1908, 64, '2020-01-10'),
(1909, 67, '2020-01-10'),
(1910, 73, '2020-01-10'),
(1911, 71, '2020-01-10'),
(1912, 70, '2020-01-11'),
(1913, 64, '2020-01-11'),
(1914, 66, '2020-01-11'),
(1915, 70, '2020-01-11'),
(1916, 75, '2020-01-11'),
(1917, 68, '2020-01-11'),
(1918, 69, '2020-01-11'),
(1919, 67, '2020-01-11'),
(1920, 65, '2020-01-11'),
(1921, 73, '2020-01-11'),
(1922, 66, '2020-01-12'),
(1923, 65, '2020-01-12'),
(1924, 65, '2020-01-12'),
(1925, 65, '2020-01-12'),
(1926, 65, '2020-01-12'),
(1927, 65, '2020-01-12'),
(1928, 65, '2020-01-12'),
(1929, 65, '2020-01-12'),
(1930, 69, '2020-01-12'),
(1931, 69, '2020-01-12'),
(1932, 65, '2020-01-12'),
(1933, 63, '2020-01-12'),
(1934, 66, '2020-01-12'),
(1935, 65, '2020-01-13'),
(1936, 67, '2020-01-13'),
(1937, 69, '2020-01-13'),
(1938, 64, '2020-01-13'),
(1939, 65, '2020-01-13'),
(1940, 64, '2020-01-14'),
(1941, 65, '2020-01-14'),
(1942, 66, '2020-01-14'),
(1943, 68, '2020-01-14'),
(1944, 65, '2020-01-15'),
(1945, 64, '2020-01-16'),
(1946, 62, '2020-01-17'),
(1947, 72, '2020-01-17'),
(1948, 64, '2020-01-17'),
(1949, 67, '2020-01-18'),
(1950, 70, '2020-01-19'),
(1951, 65, '2020-01-22'),
(1952, 70, '2020-01-22'),
(1953, 69, '2020-01-22'),
(1954, 67, '2020-01-22'),
(1955, 73, '2020-01-22'),
(1956, 75, '2020-01-22'),
(1957, 66, '2020-01-22'),
(1958, 68, '2020-01-22'),
(1959, 71, '2020-01-22'),
(1960, 65, '2020-01-22'),
(1961, 64, '2020-01-22'),
(1962, 62, '2020-01-22'),
(1963, 63, '2020-01-22'),
(1964, 72, '2020-01-22'),
(1965, 74, '2020-01-22'),
(1966, 70, '2020-01-22'),
(1967, 69, '2020-01-22'),
(1968, 67, '2020-01-22'),
(1969, 73, '2020-01-22'),
(1970, 75, '2020-01-22'),
(1971, 66, '2020-01-22'),
(1972, 68, '2020-01-22'),
(1973, 71, '2020-01-22'),
(1974, 65, '2020-01-22'),
(1975, 64, '2020-01-22'),
(1976, 62, '2020-01-22'),
(1977, 63, '2020-01-22'),
(1978, 72, '2020-01-22'),
(1979, 74, '2020-01-22'),
(1980, 75, '2020-01-23'),
(1981, 75, '2020-01-23'),
(1982, 64, '2020-01-23'),
(1983, 72, '2020-01-23'),
(1984, 75, '2020-01-23'),
(1985, 74, '2020-01-23'),
(1986, 66, '2020-01-23'),
(1987, 74, '2020-01-23'),
(1988, 74, '2020-01-23'),
(1989, 72, '2020-01-23'),
(1990, 65, '2020-01-23'),
(1991, 65, '2020-01-23'),
(1992, 66, '2020-01-25'),
(1993, 66, '2020-01-25'),
(1994, 66, '2020-01-25'),
(1995, 66, '2020-01-25'),
(1996, 66, '2020-01-25'),
(1997, 65, '2020-01-25'),
(1998, 65, '2020-01-25'),
(1999, 65, '2020-01-25'),
(2000, 65, '2020-01-25'),
(2001, 65, '2020-01-25'),
(2002, 65, '2020-01-25'),
(2003, 65, '2020-01-25'),
(2004, 65, '2020-01-25'),
(2005, 65, '2020-01-26'),
(2006, 65, '2020-01-26'),
(2007, 65, '2020-01-26'),
(2008, 65, '2020-01-26'),
(2009, 65, '2020-01-26'),
(2010, 65, '2020-01-26'),
(2011, 65, '2020-01-26'),
(2012, 65, '2020-01-26'),
(2013, 64, '2020-01-26'),
(2014, 65, '2020-01-26'),
(2015, 66, '2020-01-26'),
(2016, 66, '2020-01-26'),
(2017, 63, '2020-01-26'),
(2018, 62, '2020-01-26'),
(2019, 66, '2020-01-28'),
(2020, 64, '2020-01-28'),
(2021, 69, '2020-01-28'),
(2022, 71, '2020-01-28'),
(2023, 70, '2020-01-28'),
(2024, 67, '2020-01-28'),
(2025, 65, '2020-01-28'),
(2026, 68, '2020-01-29'),
(2027, 73, '2020-01-29'),
(2028, 71, '2020-01-29'),
(2029, 71, '2020-01-29'),
(2030, 64, '2020-01-29'),
(2031, 67, '2020-01-30'),
(2032, 75, '2020-01-30'),
(2033, 75, '2020-01-31'),
(2034, 65, '2020-02-01'),
(2035, 69, '2020-02-01'),
(2036, 65, '2020-02-01'),
(2037, 65, '2020-02-01'),
(2038, 65, '2020-02-01'),
(2039, 67, '2020-02-01'),
(2040, 64, '2020-02-01'),
(2041, 65, '2020-02-01'),
(2042, 73, '2020-02-01'),
(2043, 67, '2020-02-02'),
(2044, 68, '2020-02-02'),
(2045, 70, '2020-02-02'),
(2046, 71, '2020-02-02'),
(2047, 69, '2020-02-02'),
(2048, 74, '2020-02-02'),
(2049, 62, '2020-02-03'),
(2050, 74, '2020-02-03'),
(2051, 65, '2020-02-03'),
(2052, 62, '2020-02-03'),
(2053, 71, '2020-02-04'),
(2054, 66, '2020-02-04'),
(2055, 75, '2020-02-04'),
(2056, 65, '2020-02-04'),
(2057, 64, '2020-02-04'),
(2058, 73, '2020-02-04'),
(2059, 70, '2020-02-04'),
(2060, 68, '2020-02-04'),
(2061, 69, '2020-02-04'),
(2062, 67, '2020-02-04'),
(2063, 63, '2020-02-04'),
(2064, 62, '2020-02-04'),
(2065, 74, '2020-02-04'),
(2066, 71, '2020-02-04'),
(2067, 66, '2020-02-04'),
(2068, 75, '2020-02-04'),
(2069, 65, '2020-02-04'),
(2070, 64, '2020-02-04'),
(2071, 73, '2020-02-04'),
(2072, 70, '2020-02-04'),
(2073, 68, '2020-02-04'),
(2074, 69, '2020-02-04'),
(2075, 67, '2020-02-04'),
(2076, 63, '2020-02-04'),
(2077, 62, '2020-02-04'),
(2078, 74, '2020-02-04'),
(2079, 65, '2020-02-04'),
(2080, 75, '2020-02-06'),
(2081, 75, '2020-02-06'),
(2082, 75, '2020-02-06'),
(2083, 75, '2020-02-06'),
(2084, 75, '2020-02-06'),
(2085, 75, '2020-02-06'),
(2086, 75, '2020-02-06'),
(2087, 75, '2020-02-06'),
(2088, 75, '2020-02-06'),
(2089, 75, '2020-02-06'),
(2090, 75, '2020-02-06'),
(2091, 75, '2020-02-06'),
(2092, 69, '2020-02-06'),
(2093, 65, '2020-02-06'),
(2094, 63, '2020-02-06'),
(2095, 63, '2020-02-06'),
(2096, 63, '2020-02-06'),
(2097, 63, '2020-02-06'),
(2098, 62, '2020-02-06'),
(2099, 73, '2020-02-06'),
(2100, 73, '2020-02-06'),
(2101, 73, '2020-02-06'),
(2102, 64, '2020-02-06'),
(2103, 64, '2020-02-06'),
(2104, 70, '2020-02-06'),
(2105, 75, '2020-02-06'),
(2106, 70, '2020-02-06'),
(2107, 65, '2020-02-06'),
(2108, 73, '2020-02-06'),
(2109, 65, '2020-02-06'),
(2110, 73, '2020-02-06'),
(2111, 64, '2020-02-07'),
(2112, 65, '2020-02-07'),
(2113, 71, '2020-02-07'),
(2114, 66, '2020-02-07'),
(2115, 65, '2020-02-08'),
(2116, 62, '2020-02-08'),
(2117, 74, '2020-02-08'),
(2118, 65, '2020-02-08'),
(2119, 63, '2020-02-08'),
(2122, 77, '2020-02-08'),
(2123, 77, '2020-02-08'),
(2124, 77, '2020-02-08'),
(2125, 77, '2020-02-08'),
(2126, 77, '2020-02-08'),
(2127, 77, '2020-02-08'),
(2128, 77, '2020-02-08'),
(2129, 77, '2020-02-08'),
(2130, 77, '2020-02-08'),
(2131, 77, '2020-02-08'),
(2132, 77, '2020-02-08'),
(2133, 64, '2020-02-08'),
(2134, 62, '2020-02-08'),
(2135, 70, '2020-02-08'),
(2136, 65, '2020-02-09'),
(2137, 65, '2020-02-09'),
(2138, 65, '2020-02-09'),
(2139, 75, '2020-02-09'),
(2140, 67, '2020-02-09'),
(2141, 62, '2020-02-09'),
(2142, 68, '2020-02-09'),
(2143, 76, '2020-02-09'),
(2144, 65, '2020-02-09'),
(2145, 65, '2020-02-09'),
(2146, 65, '2020-02-09'),
(2148, 66, '2020-02-09'),
(2149, 65, '2020-02-09'),
(2150, 78, '2020-02-09'),
(2151, 78, '2020-02-09'),
(2152, 78, '2020-02-09'),
(2153, 78, '2020-02-09'),
(2154, 79, '2020-02-09'),
(2155, 78, '2020-02-09'),
(2156, 67, '2020-02-09'),
(2157, 64, '2020-02-10'),
(2158, 75, '2020-02-10'),
(2159, 71, '2020-02-10'),
(2160, 73, '2020-02-10'),
(2161, 62, '2020-02-11'),
(2162, 64, '2020-02-11'),
(2163, 71, '2020-02-14'),
(2164, 66, '2020-02-14'),
(2165, 75, '2020-02-14'),
(2166, 65, '2020-02-14'),
(2167, 64, '2020-02-14'),
(2168, 73, '2020-02-14'),
(2169, 70, '2020-02-14'),
(2170, 68, '2020-02-14'),
(2171, 69, '2020-02-14'),
(2172, 67, '2020-02-14'),
(2173, 63, '2020-02-14'),
(2174, 62, '2020-02-14'),
(2175, 79, '2020-02-14'),
(2176, 78, '2020-02-14'),
(2177, 77, '2020-02-14'),
(2178, 74, '2020-02-14'),
(2179, 71, '2020-02-14'),
(2180, 66, '2020-02-14'),
(2181, 75, '2020-02-14'),
(2182, 65, '2020-02-14'),
(2183, 64, '2020-02-14'),
(2184, 73, '2020-02-14'),
(2185, 70, '2020-02-14'),
(2186, 68, '2020-02-14'),
(2187, 69, '2020-02-14'),
(2188, 67, '2020-02-14'),
(2189, 63, '2020-02-14'),
(2190, 62, '2020-02-14'),
(2191, 79, '2020-02-14'),
(2192, 78, '2020-02-14'),
(2193, 77, '2020-02-14'),
(2194, 74, '2020-02-14'),
(2195, 69, '2020-02-18'),
(2196, 70, '2020-02-18'),
(2197, 66, '2020-02-18'),
(2198, 70, '2020-02-18'),
(2199, 76, '2020-02-19'),
(2200, 70, '2020-02-19'),
(2201, 70, '2020-02-19'),
(2202, 62, '2020-02-19'),
(2203, 65, '2020-02-19'),
(2204, 65, '2020-02-19'),
(2205, 69, '2020-02-21'),
(2206, 75, '2020-02-21'),
(2207, 77, '2020-02-21'),
(2208, 69, '2020-02-21'),
(2209, 64, '2020-02-21'),
(2210, 74, '2020-02-22'),
(2211, 70, '2020-02-22'),
(2212, 62, '2020-02-22'),
(2213, 66, '2020-02-23'),
(2214, 75, '2020-02-24'),
(2215, 75, '2020-02-24'),
(2216, 75, '2020-02-24'),
(2217, 75, '2020-02-24'),
(2218, 75, '2020-02-24'),
(2219, 75, '2020-02-24'),
(2220, 64, '2020-02-24'),
(2221, 64, '2020-02-24'),
(2222, 75, '2020-02-25'),
(2223, 75, '2020-02-25'),
(2224, 66, '2020-02-25'),
(2225, 75, '2020-02-25'),
(2226, 65, '2020-02-25'),
(2227, 65, '2020-02-26'),
(2228, 69, '2020-02-26'),
(2229, 75, '2020-02-26'),
(2230, 76, '2020-02-27'),
(2231, 62, '2020-02-27'),
(2232, 66, '2020-02-27'),
(2233, 65, '2020-02-28'),
(2234, 78, '2020-02-28'),
(2235, 42, '2020-02-28'),
(2236, 66, '2020-02-28'),
(2237, 78, '2020-02-28'),
(2238, 73, '2020-02-28'),
(2239, 64, '2020-02-28'),
(2240, 64, '2020-02-28'),
(2241, 64, '2020-02-28'),
(2242, 64, '2020-02-28'),
(2243, 78, '2020-02-28'),
(2244, 77, '2020-02-28'),
(2245, 79, '2020-02-28'),
(2246, 65, '2020-02-28'),
(2247, 69, '2020-02-28'),
(2248, 69, '2020-02-28'),
(2249, 74, '2020-02-28'),
(2250, 65, '2020-02-28'),
(2251, 65, '2020-02-28'),
(2252, 65, '2020-02-29'),
(2253, 66, '2020-02-29');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating` tinyint(2) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `product_id`, `review`, `rating`, `review_date`) VALUES
(3, 13, 64, 'TEst review', 5, '2020-02-28 05:45:17');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `comment_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `user_id`, `comment_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 13, 49, 'dthdfjhjhtdsjh', '2019-07-19 23:32:27', '2019-07-19 23:32:27');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `photo`, `title`, `subtitle`, `details`) VALUES
(4, '1557343012img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(5, '1557343018img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.'),
(6, '1557343024img.jpg', 'Jhon Smith', 'CEO & Founder', 'Lorem ipsum dolor sit amet, consectetur elitad adipiscing Cras non placerat mi.');

-- --------------------------------------------------------

--
-- Table structure for table `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci,
  `meta_keys` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `meta_keys`) VALUES
(1, '<script>//Google Analytics Scriptfffffffffffffffffffffffssssfffffs</script>', 'Genius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,Sea');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT '0',
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`) VALUES
(2, 0, 'FREE SHIPPING', 'Free Shipping All Order', '1561348133service1.png'),
(3, 0, 'PAYMENT METHOD', 'Secure Payment', '1561348138service2.png'),
(4, 0, '30 DAY RETURNS', '30-Day Return Policy', '1561348143service3.png'),
(5, 0, 'HELP CENTER', '24/7 Support System', '1561348147service4.png'),
(6, 13, 'FREE SHIPPING', 'Free Shipping All Order', '1563247602brand1.png'),
(7, 13, 'PAYMENT METHOD', 'Secure Payment', '1563247614brand2.png'),
(8, 13, '30 DAY RETURNS', '30-Day Return Policy', '1563247620brand3.png'),
(9, 13, 'HELP CENTER', '24/7 Support System', '1563247670brand4.png');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(191) UNSIGNED NOT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`) VALUES
(8, 'Buy flowers and gifts online', '24', '#000000', 'slideInUp', 'Get Up to 40% Off', '60', '#c2ce1e', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#043506', 'slideInRight', '1582275525Royal-FloraHolland-Periode3.jpg', 'slide-one', 'https://www.google.com/'),
(9, 'BUY GIFTS ONLINE', '24', '#000000', 'slideInUp', 'Get Up to 40% Off', '60', '#000000', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#000000', 'slideInDown', '1582272223d2.jpg', 'slide-one', 'https://www.google.com/'),
(10, 'Buy flowers online now through us', '24', '#000000', 'slideInUp', 'Get Up to 40% Off', '60', '#09601b', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#000000', 'slideInLeft', '15822754481_Ecvkd3MEzqFvyrm98dTPIQ.jpeg', 'slide-three', 'https://www.google.com/');

-- --------------------------------------------------------

--
-- Table structure for table `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dribble` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT '1',
  `g_status` tinyint(4) NOT NULL DEFAULT '1',
  `t_status` tinyint(4) NOT NULL DEFAULT '1',
  `l_status` tinyint(4) NOT NULL DEFAULT '1',
  `d_status` tinyint(4) NOT NULL DEFAULT '1',
  `f_check` tinyint(10) DEFAULT NULL,
  `g_check` tinyint(10) DEFAULT NULL,
  `fclient_id` text COLLATE utf8mb4_unicode_ci,
  `fclient_secret` text COLLATE utf8mb4_unicode_ci,
  `fredirect` text COLLATE utf8mb4_unicode_ci,
  `gclient_id` text COLLATE utf8mb4_unicode_ci,
  `gclient_secret` text COLLATE utf8mb4_unicode_ci,
  `gredirect` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 1, 1, 1, 1, 1, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://localhost/royalcommerce/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'http://localhost/marketplace/auth/google/callback');

-- --------------------------------------------------------

--
-- Table structure for table `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(191) NOT NULL,
  `category_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `slug`, `status`) VALUES
(2, 4, 'TELEVISION', 'television', 1),
(3, 4, 'REFRIGERATOR', 'refrigerator', 1),
(4, 4, 'WASHING MACHINE', 'washing-machine', 1),
(5, 4, 'AIR CONDITIONERS', 'air-conditioners', 1),
(6, 5, 'ACCESSORIES', 'accessories', 1),
(7, 5, 'BAGS', 'bags', 1),
(8, 5, 'CLOTHINGS', 'clothings', 1),
(9, 5, 'SHOES', 'shoes', 1),
(10, 7, 'APPLE', 'apple', 1),
(11, 7, 'SAMSUNG', 'samsung', 1),
(12, 7, 'LG', 'lg', 1),
(13, 7, 'SONY', 'sony', 1),
(14, 6, 'DSLR', 'dslr', 1),
(15, 6, 'Camera Phone', 'camera-phone', 1),
(16, 6, 'Action Camera', 'animation-camera', 1),
(17, 6, 'Digital Camera', 'digital-camera', 1),
(18, 14, 'Artificial bouquets', 'artificial-bouquets', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(191) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`) VALUES
(1, 'Basic', 'INR', 'INR', 0, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(10) NOT NULL DEFAULT '0',
  `status` tinyint(10) NOT NULL DEFAULT '0',
  `verification_link` text COLLATE utf8mb4_unicode_ci,
  `email_verified` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `affilate_code` text COLLATE utf8mb4_unicode_ci,
  `affilate_income` double NOT NULL DEFAULT '0',
  `shop_name` text COLLATE utf8mb4_unicode_ci,
  `owner_name` text COLLATE utf8mb4_unicode_ci,
  `shop_number` text COLLATE utf8mb4_unicode_ci,
  `shop_address` text COLLATE utf8mb4_unicode_ci,
  `reg_number` text COLLATE utf8mb4_unicode_ci,
  `shop_message` text COLLATE utf8mb4_unicode_ci,
  `shop_details` text COLLATE utf8mb4_unicode_ci,
  `shop_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_url` text COLLATE utf8mb4_unicode_ci,
  `g_url` text COLLATE utf8mb4_unicode_ci,
  `t_url` text COLLATE utf8mb4_unicode_ci,
  `l_url` text COLLATE utf8mb4_unicode_ci,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `f_check` tinyint(1) NOT NULL DEFAULT '0',
  `g_check` tinyint(1) NOT NULL DEFAULT '0',
  `t_check` tinyint(1) NOT NULL DEFAULT '0',
  `l_check` tinyint(1) NOT NULL DEFAULT '0',
  `mail_sent` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_cost` double NOT NULL DEFAULT '0',
  `current_balance` double NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT '0',
  `pin_code` text COLLATE utf8mb4_unicode_ci,
  `invoice_address` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst_number` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_details` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `photo`, `zip`, `city`, `address`, `phone`, `fax`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_provider`, `status`, `verification_link`, `email_verified`, `affilate_code`, `affilate_income`, `shop_name`, `owner_name`, `shop_number`, `shop_address`, `reg_number`, `shop_message`, `shop_details`, `shop_image`, `f_url`, `g_url`, `t_url`, `l_url`, `is_vendor`, `f_check`, `g_check`, `t_check`, `l_check`, `mail_sent`, `shipping_cost`, `current_balance`, `date`, `ban`, `pin_code`, `invoice_address`, `gst_number`, `registration_details`) VALUES
(13, 'Richin Stores', '1557677677bouquet_PNG62.png', '695025', 'India', 'Technopark, kazhakkoottam, Trivandrum', '999555885', '784', 'vendor@gmail.com', '$2y$10$2uEfBPySus8.jcRe7sHW7ehNHqXHuasIqeXX2wxqu2Bs5K6Y.di3K', '7CZ41nvReiIc7cgAtCaNnc4vYq0M12pJJlGjb9XfesdZ4ES0S79ZQfSZoN25', '2018-03-07 18:05:44', '2020-02-29 14:53:31', 0, 2, '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8ry', 'Yes', '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8rysdfsdfds', 352, 'Laravel Store', 'Alexander J Curtis', '99995544', 'Kerala India', '745855', 'Hiiiiii', '<div style=\"text-align: justify;\" bis_skin_checked=\"1\"><b style=\"font-family: Roboto, sans-serif;\">Lorem</b><span style=\"font-family: Roboto, sans-serif;\"> ipsum dolor sit amet, consectetur adipisicing elit. Error hic unde soluta necessitatibus ad odit, dolores in. Omnis laborum, et nisi!</span></div>', '1561022111Vendor-pages.jpg', 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 2, 1, 1, 1, 1, 1, 6, 2107.5, '2028-08-02', 0, NULL, NULL, NULL, NULL),
(22, 'Junnun', NULL, '1231', 'Test City', 'Test Address', '34534534534', '34534534534', 'user@gmail.com', '$2y$10$k6yiGwFKtAtDS4gWUAS9reLieCX30brei.curjp28IRxMcxGM8Bn2', 'CRMzLbCMCEHH3605ffWk4eUZ6qEy2bNYFLax3xoiV3MiRQ3NhWyPqisXmAbe', '2019-06-20 12:26:24', '2020-02-19 15:41:15', 0, 0, '1edae93935fba69d9542192fb854a80a', 'Yes', '8f09b9691613ecb8c3f7e36e34b97b80', 5000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(23, 'teststore', NULL, NULL, NULL, NULL, '9876543210', NULL, 'teststore@gmail.com', '$2y$10$ck6DY4SbJWmjkgs4jbu3r.XxhG85eenBCptmQRIa5QyZT7jrmPIOG', NULL, '2019-12-10 21:58:00', '2019-12-10 21:58:00', 0, 0, 'c3beabdf5f65d2d1f64066b908899398', 'Yes', '63a8ab2001d39765f4e7c42a293dd934', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(24, 'sdfsdfsdf', NULL, NULL, NULL, NULL, '9876543210', NULL, 'sdfsd@dfs.com', '$2y$10$93hsqquLjnvbeNgfygvobOPpJt0QwnwGze5/XZNnMZYmpQ.EfgbYq', NULL, '2019-12-10 21:58:30', '2019-12-10 21:58:30', 0, 0, '48b72b330f3ef4833079e96f891f65fc', 'Yes', '2ec6411b0022b94ce2fabbbcc6c92eca', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(25, 'anu', NULL, NULL, NULL, NULL, '9876543211', NULL, 'anu@gmail.com', '$2y$10$APl6B7FI.YpeAiLmx2Yif./sDGyLS.E8PStaDOaTYweWrN8eOX/QC', NULL, '2019-12-10 22:05:19', '2019-12-10 22:05:19', 0, 0, '1ac83874311f8747a6b637c84863239b', 'Yes', 'd8c713ea19573d0d8d57874891f3f8ce', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(26, 'anushma', NULL, NULL, NULL, NULL, '9895586245', NULL, 'anushma@gmail.com', '$2y$10$KWqtPQsC9gcCElPFC5d/PuTAmSF15CY/fToTDWdIG8fxMiTapY51C', 'Vx02wCq7xAztz8mVyO5LRlDMeWQ0gaV2fHHAYWlkONM8KWoYgSaFP4k2z3t8', '2019-12-10 22:09:23', '2020-02-26 10:52:54', 0, 0, '1ef20faf4f051948bc2490a7fb5c02ef', 'Yes', 'b118a1155477d84627b9cebffbe22351', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2020-01-09', 0, NULL, NULL, NULL, NULL),
(27, 'richin', NULL, NULL, NULL, NULL, '8520369744', NULL, 'richinnovationsplc@gmail.com', '$2y$10$Ss3FGXK4urIkQgaS0st7Wu57nfm93ziYojhmc3t5OMXgwGvfBs55G', NULL, '2019-12-16 17:15:54', '2019-12-16 17:15:54', 0, 0, '1c35aaf5b2e79ea88aca465a8b39ba75', 'Yes', 'c49dd6073d00c24d523a39110ced5035', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(28, 'Gouri Krishna . s', NULL, NULL, NULL, 'First floor, 170,, TC 2/1630, Gowreesa Pattom,', '07994990426', NULL, 'grkrshngouri@gmail.com', '$2y$10$l5FPOLLCKDWiHoOUqcwwtOCKtPXpNTFtzYWEtEPOD5DJfQgiBvmbW', NULL, '2019-12-27 17:06:52', '2020-01-02 16:11:49', 0, 0, '7e8708a2a18541a2ed33b28b71ce1ea4', 'Yes', '4253e54e7d319e58bdd3f0bf47f5ad44', 0, 'inview', 'gouri', '7994990426', 'hgdewtriuyueruyyuytrt6', '1234', 'haii', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2020-12-26', 0, NULL, NULL, NULL, NULL),
(29, 'Sujith G S', NULL, NULL, NULL, 'SHYNI S P, ETTY VILAYIL HOUSE, DURGA LANE, PARACODE, CHEMPAZHANTHY P O', '9633155517', NULL, 'jithkutty@gmail.com', '$2y$10$F3y/p1e2YMVvwHpz460xceLtXkRLWjhdBiw4SOPrraWQ7Osk7Ttxa', 'kR5fyXAnIAKEhLcqyXC76ANprnZ95478kCWeedUCPX67x7umCXPhFuPX3ao1', '2019-12-28 20:38:01', '2019-12-28 20:38:01', 0, 0, 'cc11f29c9f86d513eed50e54618c242e', 'Yes', '3d8fe9b6a923152543af9694a9adedd7', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(30, 'Test Vendor', NULL, NULL, NULL, NULL, '8281505609', NULL, 'testvendor@gmail.com', '$2y$10$qMa7Ebk9C3xaMvYexbB0K.cROOsnjXyr5OmkwYX4FPj4oMJ1M5Cim', 'pLmWPsSvT3cAq9U955YkTlRB1oXavbi9hwDdEwphnynddoIzceH9EwMriyv9', '2019-12-28 21:07:19', '2019-12-28 21:08:49', 0, 0, '0b7a62c7f0cad952503139c8d36c3070', 'Yes', '9e87a0c25469fb4ab3f1703d57f198e7', 0, 'Test Shop', 'Test', '1', 'Test', '123456', '123456', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2020-12-27', 0, NULL, NULL, NULL, NULL),
(31, 'inview', NULL, NULL, NULL, NULL, '9447124521', NULL, 'sujith.gs@ospyn.com', '$2y$10$C7q5nvS4C7arAFa.mA0hb.XtR9.AEd3FWiUAt3JwFiGyveuKt.tGC', NULL, '2019-12-30 23:04:50', '2019-12-30 23:04:50', 0, 0, '200987ab81ab715517332252a538e6bf', 'Yes', 'e506cf7e68717da345129544621e3154', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(32, 'Schoolkutti', NULL, NULL, NULL, NULL, '9847320281', NULL, 'schoolkutti@gmail.com', '$2y$10$9v.triaDNsa4qNZN6636VuqvXv2a5YjoDWMwxXadl..k8/0pPcfNy', NULL, '2020-01-08 20:33:18', '2020-01-08 20:33:18', 0, 0, '58d82ee6219f7739d6ded23e8bd107e5', 'Yes', '49bc45ad25f45905f4b3d94fac8c6526', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(33, 'Seema', NULL, NULL, NULL, 'd', '9847320281', NULL, 'seema.richard@gmail.com', '$2y$10$9p2zlvF9B6StEvX5N5k4qeq9H88ZuNTzNZdrYb/1o4ErfS8SejxPC', NULL, '2020-01-08 21:23:15', '2020-01-08 21:23:15', 0, 0, '0008816875705e5fa983a974d4274b5b', 'Yes', '74514adf300511efb96bcad117333f18', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(34, 'ramk', NULL, NULL, NULL, 'ere', '34354', NULL, 'y@ymail.com', '$2y$10$WxnEp2vcNni96oG0lX6IKewxQOWyw1ftDEkU/pq1zI9hbcGZRP88i', NULL, '2020-02-09 21:22:58', '2020-02-09 21:22:58', 0, 0, '71c579bc84910b3056f5a2aa8e03f096', 'No', '36f2cdbdaa0563ed02a8ef403734feb8', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(35, 'test', NULL, NULL, NULL, 'gfkfjg', '123456', NULL, 'test@ss.com', '$2y$10$S8ERSkRpSoI1e8QROAkWXO.27Wo3ifWDFDKUCX9qPmMdTl3LTTwJ6', '3TQ3iG6LUqIiNHeiriZdaUalPvaeVk4jtKW3HhEED9Nnbpm8FsxC8gdqIh5w', '2020-02-09 21:34:05', '2020-02-09 21:34:05', 0, 0, '1c03f877f34b038582f0f3db62d71a95', 'Yes', 'acbb3e92edeeb1c9283e38387561b7d3', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(36, 'Asish', NULL, NULL, NULL, 'f sdfgsdfg sdfg sdf', '322323524', NULL, 'asish.poomangalam@gmail.com', '$2y$10$W9rDsz.evRygAiQ2HudipOD32NCZ7nhPs19.ZMxq699k5wnZ/pfJ2', 'roz0jqJ2z0nHEevOkQWQYqzIc1xGA8hCADJhpoByVTI44XNf0m9zw233udI4', '2020-02-13 19:12:55', '2020-02-13 19:12:55', 0, 0, '3482b9ef62df2491ff539b9ca0f898d3', 'Yes', '64dd7f4b33532b5f2fae0936090d4791', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(37, 'test', NULL, NULL, NULL, 'tyyy', '4495846212', NULL, 'test@yopmail.com', '$2y$10$nEeD4HfEpdirPaNS9sAveuCiRu73y8BhLiAQ9DKr4/EpZZAckrzP6', 'hKIHFvMCx0kP4vY3y1I095nYdMI6pPtMlZzbVox75UCLE4syhr3yLfD3wtw7', '2020-02-18 00:25:31', '2020-02-18 00:26:42', 0, 0, 'ee3773996c684d006afb9ecccfebd319', 'Yes', '88034b0ba7c77f9873a197328e4edfdb', 0, 'teste', 'testee', '147', '456,test rteqqd', '159', 'asghhjjhk hfhjmhjkjk', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2021-02-16', 0, NULL, NULL, NULL, NULL),
(38, 'Richin', NULL, NULL, NULL, 'Cherumannoor veedu, Vamanapuram PO, Trivandrum', '09633453831', NULL, 'richinofficial@gmail.com', '$2y$10$VjUe/Vdo7jVP7fhlHdHFFuIDgJ4bXOjAI.EgHVnXvYJiE/3I8fyq2', 'kjRFHX6tfZt4p981riXw1Wa8b834JFSHOj5rkFKCtk2BEpUdbNVvlHBhBam1', '2020-02-21 10:25:47', '2020-02-21 10:26:49', 0, 0, '8a10d772c42400fab9dcf4065d49ff0e', 'Yes', '56bdd870866b939a34db613485bff9e0', 0, 'Richinnovations', 'Richin', '544546', 'test', '8979789', 'test', NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2021-02-20', 0, NULL, NULL, NULL, NULL),
(39, 'Vimal', NULL, NULL, NULL, 'test address', '8281960025', NULL, 'vimal.inview@outlook.com', '$2y$10$Zni.lvkq9fOtmykeB8BWTeVxDLuxvUEAfg/POu6Ijypk7t0t01Fx.', NULL, '2020-02-25 22:44:00', '2020-02-25 22:44:00', 0, 0, '0b071d7f573bd949268302ee58f7df58', 'Yes', '5f5527458dd12f591c1e2a02070f9533', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(40, 'Indu V Nair', NULL, NULL, NULL, 'Test address.', '7994990426', NULL, 'vimalmultimedia@gmail.com', '$2y$10$1To5bIKfY3AMNt7dELAbB.GO2QQhxCLVHsqqY7tQGIrdM1i403n/W', '4ecjsImHy2yN3Wnm5J6C7ZMGEOpl214FSFiPWW60thAem9LZQxY69Qxy3KcP', '2020-02-26 09:50:18', '2020-02-26 09:50:18', 0, 0, 'c4371a3f591c1c87d67de4aad42c9379', 'No', 'a625b142e83b2f98f65838dbc3c05a95', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(41, 'Richin', NULL, NULL, NULL, 'vamanapuram', '8281505609', NULL, 'richinr@gmail.com', '$2y$10$9BIWpL/4SoRha9g0hKZHROgsd1g3mHoZnHFVxcoL48yel/TiPNUFC', 'p0zhfrhBc7ccA1l1Zr9cKIVd2p8QdEvNGKMoUi7Jq6JFKLBuc4wnv5axEvjH', '2020-02-28 12:07:45', '2020-02-28 12:07:45', 0, 0, '6c67c305b56a66e5389f57a1c7eb14ee', 'No', 'ae390c1860d15303eba00328eb65fbf2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(43, 'Vimal', NULL, NULL, NULL, 'test address', '99999999', NULL, 'inviewtechnologies@gmail.com', '$2y$10$aco6UxraAdWdYF6EBqC1neh9M0DyP8gCMzvuXyZiHs5.SdWuOo7uO', NULL, '2020-02-28 12:18:03', '2020-02-28 12:18:03', 0, 0, '9da043af719b027116622acfb96bef49', 'No', '2d1a9d46249934b1088421f757557b3a', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(44, 'test', NULL, NULL, NULL, 'tyyy', '4495846212', NULL, 'karthik@yopmail.com', '$2y$10$iWEqdKq9Cf2OYBNwjRMW6elpqHxXNjrNQRfXgBZqZU1mhbJ.O5k12', 'fpciguTfsEwlNCstZKHKQCQvuW83oi4XMC7PBjPEIF8yrf6dGDNDTVG5z7zn', '2020-03-01 00:20:57', '2020-03-01 00:20:57', 0, 0, '058b4ad5ef93a606e4e3c8b27e53a366', 'No', '37b13ee68fd38c95456422bf91f34eac', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(45, 'delightgallery', NULL, NULL, NULL, 'tyyy', '4495846212', NULL, 'karthiksk@yopmail.com', '$2y$10$5oMnxv7P7xNPG1jegdhDP.rom.ERdYlXbP5TSt.DCYxQx7R65vIg6', NULL, '2020-03-01 00:24:54', '2020-03-01 00:24:54', 0, 0, '7679b5742caf933d0130096b544f39ce', 'No', '3aa9465d21d68a384d039d81ba4ade3b', 0, 'teste', 'testee', '147', '456,test rteqqd', '159', 'asghhjjhk hfhjmhjkjk', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(46, 'delightgallery', NULL, NULL, NULL, 'tyyy', '4495846212', NULL, 'karthiksk1@yopmail.com', '$2y$10$5FtprtlQeuGvp9rHSsLlW.Nnc2w.Mo9//HjlSPmhBMBpGQ5vZGHNO', 'EXvMrwBVqc6OxOWOPF3tS3VfRHYTqJKfdvtumpsHhmx3d88RIQp5xKGTawpD', '2020-03-01 00:25:57', '2020-03-01 00:25:57', 0, 0, '2f2e506c762c9f043f2c81c73bff8f67', 'No', 'a56c1e670bd5ff8c653d5f32bb843583', 0, 'teste', 'testee', '147', '456,test rteqqd', '159', 'asghhjjhk hfhjmhjkjk', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL),
(47, 'delightgallery', NULL, NULL, NULL, 'tyyy', '4495846212', NULL, 'skkarthik00622@gmail.com', '$2y$10$DhULa/mH2fa0pkyVuvaHkeALFVnOhtSEkvBH.hployvjGDb5xUh4G', NULL, '2020-03-01 00:27:51', '2020-03-01 00:27:51', 0, 0, '91a621a1cc644e222d64601b622b0f32', 'No', 'df101ae96bd6f482a9e0f12b442b7e00', 0, 'teste', 'testee', '147', '456,test rteqqd', '159', 'asghhjjhk hfhjmhjkjk', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `order_number`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 13, 'g8I51581265911', 1, '2020-02-09 22:31:51', '2020-02-09 22:45:53'),
(2, 13, 'aMIl1581266003', 1, '2020-02-09 22:33:23', '2020-02-09 22:45:53'),
(3, 13, 'zWI81581266352', 1, '2020-02-09 22:39:12', '2020-02-09 22:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `subscription_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subscription_id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`, `method`, `txnid`, `charge_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 26, 1, 'Basic', '$', 'USD', 0, 30, 1, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Free', NULL, NULL, '2019-12-10 22:11:28', '2019-12-10 22:11:28', 1),
(2, 28, 1, 'Basic', 'INR', 'INR', 0, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Free', NULL, NULL, '2019-12-27 17:09:07', '2019-12-27 17:09:07', 1),
(3, 30, 1, 'Basic', 'INR', 'INR', 0, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Free', NULL, NULL, '2019-12-28 21:08:49', '2019-12-28 21:08:49', 1),
(4, 37, 1, 'Basic', 'INR', 'INR', 0, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Free', NULL, NULL, '2020-02-18 00:26:42', '2020-02-18 00:26:42', 1),
(5, 38, 1, 'Basic', 'INR', 'INR', 0, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Free', NULL, NULL, '2020-02-21 10:26:49', '2020-02-21 10:26:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor_orders`
--

INSERT INTO `vendor_orders` (`id`, `user_id`, `order_id`, `qty`, `price`, `order_number`, `status`) VALUES
(1, 13, 13, 5, 812.5, 'g8I51581265911', 'pending'),
(2, 13, 14, 2, 325, 'aMIl1581266003', 'completed'),
(3, 13, 15, 1, 162.5, 'zWI81581266352', 'completed'),
(4, 13, 15, 4, 2120, 'zWI81581266352', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(191) UNSIGNED NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`) VALUES
(1, 29, 63),
(2, 29, 71);

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(191) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `user_id`, `method`, `acc_email`, `iban`, `country`, `acc_name`, `address`, `swift`, `reference`, `amount`, `fee`, `created_at`, `updated_at`, `status`, `type`) VALUES
(1, 13, 'Bank', NULL, '232131231221', NULL, '213132123', '123321', '21321', NULL, 4745, 255, '2020-01-23 10:18:15', '2020-01-23 10:18:15', 'pending', 'user'),
(2, 13, 'Skrill', 'vendor@gmail.com', NULL, NULL, NULL, NULL, NULL, 'TEST', 470, 30, '2020-02-22 09:38:21', '2020-02-22 09:39:09', 'completed', 'vendor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2254;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
