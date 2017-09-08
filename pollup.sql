-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2017 at 08:48 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pollup`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE IF NOT EXISTS `answer` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text NOT NULL,
  `qid` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `qid` (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`aid`, `answer`, `qid`, `count`) VALUES
(34, 'Marvel', 30, 2),
(35, 'DC', 30, 3);

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
CREATE TABLE IF NOT EXISTS `interests` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `iname` text NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `asker` varchar(255) NOT NULL,
  `type` text NOT NULL,
  `expire` datetime NOT NULL,
  `askedon` datetime NOT NULL,
  `answered` int(11) NOT NULL DEFAULT '0',
  `up` int(11) NOT NULL DEFAULT '0',
  `down` int(11) NOT NULL DEFAULT '0',
  `keyword` text,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`qid`, `question`, `asker`, `type`, `expire`, `askedon`, `answered`, `up`, `down`, `keyword`, `status`) VALUES
(30, 'Marvel Or DC', 'vigneet', 'movies', '2015-05-17 09:09:00', '2015-05-05 16:41:23', 9, 2, 1, 'comic,superhero', 'expired');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `uname` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` text NOT NULL,
  `birthdate` date NOT NULL,
  `token` text,
  `ans` int(11) NOT NULL DEFAULT '0',
  `maj` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uname`, `password`, `name`, `email`, `birthdate`, `token`, `ans`, `maj`) VALUES
('dhvanish17', 'badhuworking', 'Dhvanish', 'dhvanish17@gmail.com', '2012-02-01', '', 0, 0),
('Dhvanish1705', 'dhvanish', 'Dhvanish Patel', 'dhvanish17@gmail.com', '1995-05-17', '', 0, 0),
('dsfsf', 'aa', 'sdfsdf', 'dfsdfsd@gmail.com', '2014-10-30', NULL, 0, 0),
('nigam', 'aa', 'nigam', 'nigam_namah@yahoo.com', '1984-12-02', NULL, 0, 0),
('ultron', 'iron', 'TonyStark', 'vigneetsompura@gmail.com', '1965-04-04', '', 0, 0),
('v1', 'aa', 'vigneet', 'viki@veni.sompura', '2014-03-15', NULL, 0, 0),
('v2', 'd', 'vigneet', 'vigneetsompura@gmail.com', '2011-11-30', NULL, 0, 0),
('vigneet', 'aa', 'vigneet', 'vigneetsompura@gmail.com', '2014-11-30', NULL, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userint`
--

DROP TABLE IF EXISTS `userint`;
CREATE TABLE IF NOT EXISTS `userint` (
  `iid` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  KEY `iid` (`iid`,`uname`),
  KEY `uname` (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `question` (`qid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userint`
--
ALTER TABLE `userint`
  ADD CONSTRAINT `userint_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `interests` (`iid`),
  ADD CONSTRAINT `userint_ibfk_2` FOREIGN KEY (`uname`) REFERENCES `user` (`uname`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
