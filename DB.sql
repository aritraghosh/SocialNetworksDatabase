-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2013 at 12:21 PM
-- Server version: 5.5.34
-- PHP Version: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `FriendEvent`( EventName varchar(20))
select f.UserID,f.FriendID,e.Name from Attend as attends,Friend as f,Event as e  where e.Name = EventName and e.EventID = attends.EventID and attends.UserID = f.UserID and exists(select * from Attend as a where a.UserID = f.FriendID and attends.EventID = a.EventID) order by e.Name,f.UserID$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Album`
--

CREATE TABLE IF NOT EXISTS `Album` (
  `AlbumID` int(11) NOT NULL DEFAULT '0',
  `UploadedBy` int(11) DEFAULT NULL,
  `AlbumName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`AlbumID`),
  KEY `UploadedBy` (`UploadedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Album`
--

INSERT INTO `Album` (`AlbumID`, `UploadedBy`, `AlbumName`) VALUES
(1, 1, 'Album1'),
(2, 1, 'Album1'),
(3, 2, 'Album3'),
(4, 2, 'Album4'),
(5, 2, 'Album5'),
(6, 3, 'Album5'),
(7, 3, 'Album7'),
(8, 4, 'Album8'),
(9, 4, 'Album9'),
(10, 5, 'Album9'),
(11, 6, 'Album5'),
(12, 6, 'Album6'),
(13, 8, 'Album8'),
(14, 15, 'Album7'),
(15, 15, 'Album10'),
(16, 17, 'Album11'),
(17, 20, 'Album11'),
(18, 20, 'Album12'),
(19, 20, 'Album13'),
(20, 20, 'Album2'),
(21, 10, 'Album14'),
(22, 11, 'Album15'),
(23, 10, 'Album14'),
(24, 18, 'Album11'),
(25, 14, 'album7');

-- --------------------------------------------------------

--
-- Table structure for table `AlbumPhoto`
--

CREATE TABLE IF NOT EXISTS `AlbumPhoto` (
  `PhotoID` int(11) NOT NULL DEFAULT '0',
  `AlbumID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PhotoID`,`AlbumID`),
  KEY `AlbumID` (`AlbumID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AlbumPhoto`
--

INSERT INTO `AlbumPhoto` (`PhotoID`, `AlbumID`) VALUES
(1, 1),
(2, 1),
(11, 1),
(4, 2),
(3, 3),
(3, 4),
(6, 5),
(5, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 9),
(4, 10),
(11, 11),
(12, 12),
(13, 13),
(13, 14),
(3, 15),
(14, 15),
(15, 15);

-- --------------------------------------------------------

--
-- Table structure for table `AlbumVideo`
--

CREATE TABLE IF NOT EXISTS `AlbumVideo` (
  `VideoID` int(11) NOT NULL DEFAULT '0',
  `AlbumID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`VideoID`,`AlbumID`),
  KEY `AlbumID` (`AlbumID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `AlbumVideo`
--

INSERT INTO `AlbumVideo` (`VideoID`, `AlbumID`) VALUES
(1, 1),
(3, 3),
(15, 5),
(6, 6),
(12, 6),
(8, 8),
(5, 9),
(9, 9),
(11, 11),
(7, 13),
(13, 13),
(4, 14),
(14, 14),
(2, 22),
(10, 23);

-- --------------------------------------------------------

--
-- Table structure for table `Attend`
--

CREATE TABLE IF NOT EXISTS `Attend` (
  `EventID` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventID`,`UserID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Attend`
--

INSERT INTO `Attend` (`EventID`, `UserID`) VALUES
(2, 1),
(17, 1),
(20, 1),
(13, 2),
(19, 2),
(1, 3),
(4, 3),
(14, 3),
(20, 3),
(6, 4),
(15, 4),
(8, 5),
(11, 5),
(20, 5),
(1, 6),
(8, 6),
(17, 6),
(13, 7),
(13, 8),
(6, 9),
(20, 11),
(20, 13),
(20, 17),
(20, 18),
(20, 20);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ChoiceCount`
--
CREATE TABLE IF NOT EXISTS `ChoiceCount` (
`UserID` int(11)
,`FName` varchar(15)
,`MName` varchar(15)
,`LName` varchar(15)
,`NumberOfFriends` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `ChoiceCount1`
--
CREATE TABLE IF NOT EXISTS `ChoiceCount1` (
`UserID` int(11)
,`FName` varchar(15)
,`MName` varchar(15)
,`LName` varchar(15)
);
-- --------------------------------------------------------

--
-- Table structure for table `Comment`
--

CREATE TABLE IF NOT EXISTS `Comment` (
  `CommentID` int(11) NOT NULL DEFAULT '0',
  `Text` varchar(100) DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL,
  `PostComment` int(11) DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `PostComment` (`PostComment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Comment`
--

INSERT INTO `Comment` (`CommentID`, `Text`, `Likes`, `PostComment`) VALUES
(1, 'Raj: Why so glum chum?', 100, 1),
(2, 'Sachin retires! End of an era..', 32, 1),
(3, 'Hi guys! Party at my place.', 12, 2),
(4, 'And the Nobel Prize goes to .. !! ', 0, 3),
(5, 'I got a PPO at Samsung...', 34, 5),
(6, 'Barca into final 16.', 51, 6),
(7, 'Mission to Mars.. a milestone crossed', 1003, 7),
(8, 'Happy Christmas to everyone..', 20, 11),
(9, '450 crore for collecting dust! Not even two square meals a day', 556, 7),
(10, 'This is Spartaaa!', 7, 9),
(11, 'What is deadline for DBMS project submission', 0, 10),
(12, 'Someone''s maggi got burnt.', 172, 4),
(13, '177 on debut. Go Rohit', 310, 4),
(14, 'No entry for Aritra', 555, 2),
(15, 'Congos.', 10, 5),
(16, 'Hello', 78, 1),
(17, 'Hello2', 34, 1),
(18, 'Hello5', 3, 4),
(19, 'Hello6', 23, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Credentials`
--

CREATE TABLE IF NOT EXISTS `Credentials` (
  `UserID` int(11) DEFAULT NULL,
  `LoginID` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Credentials`
--

INSERT INTO `Credentials` (`UserID`, `LoginID`, `Password`) VALUES
(1, 'Sasidhar', 'Sasidhar'),
(2, 'Aritra', 'Password2'),
(3, 'Surendra', 'Password3'),
(4, 'Kiriti', 'Password4'),
(5, 'Kiran', 'Password5'),
(6, 'Samantha', 'Samantha'),
(7, 'Venu', 'Password7'),
(8, 'Rohit', 'Password8'),
(9, 'Shivanvitha', 'Password9'),
(10, 'Erdos', 'Erdos'),
(11, 'Messi', 'Password11'),
(12, 'Ramez', 'Password12'),
(13, 'Valdes', 'Password13'),
(14, 'Swathi', 'Password14'),
(15, 'Thiago', 'Password15'),
(16, 'Sachin', 'Password16'),
(17, 'Ashwini', 'Ashwini'),
(18, 'Nambair', 'Password18'),
(19, 'Preeti', 'Preeti'),
(20, 'Priya', 'Password20');

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE IF NOT EXISTS `Event` (
  `EventID` int(11) NOT NULL DEFAULT '0',
  `CreatorID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(20) DEFAULT NULL,
  `Place` varchar(20) DEFAULT NULL,
  `EventDate` date DEFAULT NULL,
  PRIMARY KEY (`EventID`,`CreatorID`),
  KEY `CreatorID` (`CreatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Event`
--

INSERT INTO `Event` (`EventID`, `CreatorID`, `Name`, `Place`, `EventDate`) VALUES
(1, 4, 'Btreat', 'Gurunath', '2013-11-14'),
(2, 5, 'Intern treat', 'Ascendas', '2010-11-19'),
(3, 3, 'Btreat', 'CCD', '2001-01-20'),
(4, 2, 'Lab Class', 'Lab', '2012-06-01'),
(6, 6, 'Aritra', 'Quadi', '2011-04-26'),
(7, 11, 'cord meeting', 'Gurunath', '2014-01-05'),
(8, 14, 'Reverse coding', 'PLT', '2014-02-04'),
(9, 16, 'Welcome Party', 'ITC Grand chola', '2014-01-11'),
(10, 12, 'Terry fox run', 'Gajendra circle', '2012-02-05'),
(11, 7, 'Eureka run', 'Marina Beach', '2013-05-05'),
(12, 6, 'scrabble fundaes', 'Common Room', '2009-10-23'),
(13, 15, 'Festival celebration', 'Temple', '2011-12-27'),
(14, 19, 'Pro Show', 'OAT', '2003-10-31'),
(15, 18, 'NSS meeting', 'CRC 102', '2010-04-03'),
(16, 2, 'Extra lecture', 'CLT', '2011-09-24'),
(17, 3, 'Quiz', 'CRC', '2012-06-20'),
(18, 1, 'Puzzle champ', 'PLT', '2011-01-21'),
(19, 19, 'Ice cream night', 'Quadi', '2014-02-24'),
(20, 11, 'New year party', 'OAT', '2014-01-01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `EventFriendPerson`
--
CREATE TABLE IF NOT EXISTS `EventFriendPerson` (
`Name` varchar(20)
,`Place` varchar(20)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventFriendPerson2`
--
CREATE TABLE IF NOT EXISTS `EventFriendPerson2` (
`UserID` int(11)
,`FriendID` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventFriendPerson3`
--
CREATE TABLE IF NOT EXISTS `EventFriendPerson3` (
`Name` varchar(20)
,`Place` varchar(20)
,`FriendID` int(11)
,`EventID` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventFriendPerson4`
--
CREATE TABLE IF NOT EXISTS `EventFriendPerson4` (
`UserID` int(11)
,`FriendID` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventFriendPerson5`
--
CREATE TABLE IF NOT EXISTS `EventFriendPerson5` (
`UserID` int(11)
,`FriendID` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventInfo`
--
CREATE TABLE IF NOT EXISTS `EventInfo` (
`LoginID` varchar(20)
,`Fname` varchar(15)
,`Lname` varchar(15)
,`Name` varchar(20)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventInfo1`
--
CREATE TABLE IF NOT EXISTS `EventInfo1` (
`LoginID` varchar(20)
,`Fname` varchar(15)
,`Lname` varchar(15)
,`NULL` varchar(4)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventInfo2`
--
CREATE TABLE IF NOT EXISTS `EventInfo2` (
`LoginID` varchar(20)
,`Fname` varchar(15)
,`Lname` varchar(15)
,`NULL` varchar(4)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventInfo3`
--
CREATE TABLE IF NOT EXISTS `EventInfo3` (
`LoginID` varchar(20)
,`Fname` varchar(15)
,`Lname` varchar(15)
,`NULL` varchar(4)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventInfoa`
--
CREATE TABLE IF NOT EXISTS `EventInfoa` (
`LoginID` varchar(20)
,`Fname` varchar(15)
,`Lname` varchar(15)
,`Name` varchar(20)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `EventsPeople`
--
CREATE TABLE IF NOT EXISTS `EventsPeople` (
`EventID` int(11)
,`PeopleCount` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `f`
--
CREATE TABLE IF NOT EXISTS `f` (
`Name` varchar(20)
,`UserID` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `Final`
--
CREATE TABLE IF NOT EXISTS `Final` (
`PostComment` int(11)
,`CommentCount` bigint(21)
);
-- --------------------------------------------------------

--
-- Table structure for table `Following`
--

CREATE TABLE IF NOT EXISTS `Following` (
  `UserID` int(11) NOT NULL DEFAULT '0',
  `PageName` varchar(20) NOT NULL DEFAULT '',
  `Likes` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`,`PageName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Following`
--

INSERT INTO `Following` (`UserID`, `PageName`, `Likes`) VALUES
(1, 'Twitter', 1),
(3, 'Acads', 1),
(3, 'BarcelonaFC', 1),
(4, 'ISRO', 0),
(5, 'Acads', 1),
(6, 'Movies', 0),
(9, 'BarcelonaFC', 0),
(11, 'Cricket', 1),
(12, 'MyMemories', 1),
(18, 'MyMemories', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `FOUR`
--
CREATE TABLE IF NOT EXISTS `FOUR` (
`PostComment` int(11)
,`CommentCount` bigint(21)
);
-- --------------------------------------------------------

--
-- Table structure for table `Friend`
--

CREATE TABLE IF NOT EXISTS `Friend` (
  `UserID` int(11) NOT NULL DEFAULT '0',
  `FriendID` int(11) NOT NULL DEFAULT '0',
  `Poke` int(11) DEFAULT NULL,
  `FDate` date DEFAULT NULL,
  PRIMARY KEY (`UserID`,`FriendID`),
  KEY `FriendID` (`FriendID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Friend`
--

INSERT INTO `Friend` (`UserID`, `FriendID`, `Poke`, `FDate`) VALUES
(1, 2, 0, '2002-07-25'),
(1, 3, 1, '2005-10-14'),
(1, 4, 1, '2001-01-20'),
(2, 1, 0, '2002-07-25'),
(2, 3, 1, '2010-11-19'),
(2, 4, 1, '2004-06-04'),
(2, 5, 1, '2006-08-17'),
(3, 1, 1, '2005-10-14'),
(3, 2, 1, '2010-11-19'),
(3, 4, 0, '2012-06-01'),
(3, 5, 1, '2002-05-24'),
(3, 10, 1, '2005-11-09'),
(3, 18, 1, '2011-09-24'),
(4, 1, 1, '2001-01-20'),
(4, 2, 1, '2004-06-04'),
(4, 3, 0, '2012-06-01'),
(4, 5, 1, '2010-04-03'),
(4, 7, 1, '2011-07-13'),
(5, 2, 1, '2006-08-17'),
(5, 3, 1, '2002-05-24'),
(5, 4, 1, '2010-04-03'),
(5, 17, 1, '2005-03-05'),
(5, 19, 1, '2002-06-20'),
(6, 7, 1, '2003-06-29'),
(6, 8, 1, '2009-10-23'),
(7, 4, 1, '2011-07-13'),
(7, 6, 1, '2003-06-29'),
(7, 17, 1, '2003-10-31'),
(8, 6, 1, '2009-10-23'),
(8, 9, 0, '2011-04-26'),
(8, 20, 1, '2001-11-21'),
(9, 8, 0, '2011-04-26'),
(10, 3, 1, '2005-11-09'),
(10, 19, 1, '2005-09-16'),
(11, 13, 0, '2011-12-27'),
(11, 16, 1, '2002-02-26'),
(13, 11, 1, '2011-12-27'),
(16, 11, 1, '2002-02-26'),
(17, 5, 0, '2005-03-05'),
(17, 7, 1, '2003-10-31'),
(18, 3, 1, '2011-09-24'),
(18, 20, 1, '2013-05-05'),
(19, 5, 1, '2002-06-20'),
(19, 10, 0, '2005-09-16'),
(19, 20, 0, '2012-02-05'),
(20, 8, 0, '2001-11-21'),
(20, 18, 1, '2013-05-05'),
(20, 19, 1, '2012-02-05');

-- --------------------------------------------------------

--
-- Stand-in structure for view `FriendCount`
--
CREATE TABLE IF NOT EXISTS `FriendCount` (
`UserID` int(11)
,`FName` varchar(15)
,`MName` varchar(15)
,`LName` varchar(15)
,`NumberOfFriends` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `FriendsDate`
--
CREATE TABLE IF NOT EXISTS `FriendsDate` (
`FirstName1` varchar(15)
,`LastName1` varchar(15)
,`FirstName2` varchar(15)
,`LastName2` varchar(15)
,`FDate` date
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `LIKECRICKET`
--
CREATE TABLE IF NOT EXISTS `LIKECRICKET` (
`UserID` int(11)
,`FName` varchar(15)
,`MName` varchar(15)
,`LName` varchar(15)
,`Gender` char(1)
,`Age` smallint(6)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `MaxEvents`
--
CREATE TABLE IF NOT EXISTS `MaxEvents` (
`Name` varchar(20)
,`PeopleCount` bigint(21)
,`Place` varchar(20)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `MaxLikesComment`
--
CREATE TABLE IF NOT EXISTS `MaxLikesComment` (
`PostComment` int(11)
,`Likes` int(11)
,`Text` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `MaxLikesComment1`
--
CREATE TABLE IF NOT EXISTS `MaxLikesComment1` (
`PostComment` int(11)
,`Likes` int(11)
,`Text` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `one`
--
CREATE TABLE IF NOT EXISTS `one` (
`PostComment` int(11)
,`CommentCount` bigint(21)
);
-- --------------------------------------------------------

--
-- Table structure for table `Page`
--

CREATE TABLE IF NOT EXISTS `Page` (
  `Name` varchar(20) NOT NULL DEFAULT '',
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Page`
--

INSERT INTO `Page` (`Name`, `Description`) VALUES
('Acads', 'Page for discussions on courses for CSE students'),
('BarcelonaFC', 'News for Football club Barcelona'),
('Cricket', 'Official page of ICC'),
('ISRO', 'Official Page of Indian Space Research Organizatio'),
('Movies', 'News for upcoming Releases and Collections'),
('MyMemories', 'Hi  I am Aritra Ghosh. I like politics coding.'),
('NobelPrize', 'Official Page of Nobel Prize winners'),
('Twitter', 'Most tweeted posts');

-- --------------------------------------------------------

--
-- Stand-in structure for view `PersonMaxLikes`
--
CREATE TABLE IF NOT EXISTS `PersonMaxLikes` (
`FName` varchar(15)
,`LName` varchar(15)
,`Text` varchar(100)
,`Likes` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `Photo`
--

CREATE TABLE IF NOT EXISTS `Photo` (
  `PhotoID` int(11) NOT NULL DEFAULT '0',
  `Time` time DEFAULT NULL,
  `Place` varchar(15) DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL,
  PRIMARY KEY (`PhotoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Photo`
--

INSERT INTO `Photo` (`PhotoID`, `Time`, `Place`, `Likes`) VALUES
(1, '14:30:32', 'Hyderabad', 100),
(2, '21:09:11', 'Bangalore', 200),
(3, '20:54:45', 'Chennai', 500),
(4, '06:23:42', 'Chennai', 12),
(5, '10:01:13', 'Santiago', 110),
(6, '02:53:23', 'Berlin', 123),
(7, '09:25:59', 'Munich', 177),
(8, '23:12:34', 'Barcelona', 250),
(9, '18:12:43', 'Tiruvananthapur', 330),
(10, '22:02:33', 'cochin', 321),
(11, '17:38:21', 'Hyderabad', 134),
(12, '19:22:12', 'kadapa', 122),
(13, '12:30:00', 'Santiago', 14),
(14, '00:23:47', 'Milan', 28),
(15, '22:08:13', 'cochin', 90);

-- --------------------------------------------------------

--
-- Table structure for table `PhotoComment`
--

CREATE TABLE IF NOT EXISTS `PhotoComment` (
  `PhotoID` int(11) NOT NULL DEFAULT '0',
  `CommentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PhotoID`,`CommentID`),
  KEY `CommentID` (`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PhotoComment`
--

INSERT INTO `PhotoComment` (`PhotoID`, `CommentID`) VALUES
(11, 1),
(9, 2),
(12, 3),
(13, 3),
(4, 6),
(8, 7),
(15, 7),
(12, 8),
(5, 9),
(1, 11),
(13, 11),
(1, 12),
(3, 12),
(8, 12),
(10, 12);

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE IF NOT EXISTS `Post` (
  `PostID` int(11) NOT NULL DEFAULT '0',
  `Likes` int(11) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Owner` int(11) DEFAULT NULL,
  `PostOnPage` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PostID`),
  KEY `Owner` (`Owner`),
  KEY `PostOnPage` (`PostOnPage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`PostID`, `Likes`, `Status`, `Owner`, `PostOnPage`) VALUES
(1, 99, 'Sachin announces his retirement from TestCricket', 1, 'Cricket'),
(2, 15, 'My birthday :)', 13, 'MyMemories'),
(3, 123, 'Nobel Prize for Medicine will be announced tomorro', 5, 'NobelPrize'),
(4, 4, 'Rohit smashes in his debut.', 3, 'Cricket'),
(5, 24, 'I am happy.. Feeling accomplished', 13, 'MyMemories'),
(6, 6, 'La Liga :  Barca enters final', 3, 'BarcelonaFC'),
(7, 13, 'ISRO annnounces its first mission to MARS', 5, 'ISRO'),
(8, 11, 'Twitter to release its first IPO in early December', 2, 'Twitter'),
(9, 15, '300 does well at Box Office', 4, 'Movies'),
(10, 10, 'DBMS Project announced', 1, 'Acads'),
(11, 15, 'Happy Diwali.. Be careful with crackers', 13, 'MyMemories');

-- --------------------------------------------------------

--
-- Stand-in structure for view `RemoveMaxLikes`
--
CREATE TABLE IF NOT EXISTS `RemoveMaxLikes` (
`PostComment` int(11)
,`Likes` int(11)
,`Text` varchar(100)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `REMOVEMAXLIKESCOMMENT`
--
CREATE TABLE IF NOT EXISTS `REMOVEMAXLIKESCOMMENT` (
`Text` varchar(100)
,`Likes` int(11)
,`PostComment` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `REMOVEMAXLIKESCOMMENT2`
--
CREATE TABLE IF NOT EXISTS `REMOVEMAXLIKESCOMMENT2` (
`Text` varchar(100)
,`Likes` int(11)
,`PostComment` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `SecondMaxLikes`
--
CREATE TABLE IF NOT EXISTS `SecondMaxLikes` (
`Text` varchar(100)
,`SecondMaxLikes` int(11)
,`Status` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `SecondMaxLikes2`
--
CREATE TABLE IF NOT EXISTS `SecondMaxLikes2` (
`Text` varchar(100)
,`SecondMaxLikes` int(11)
,`Status` varchar(50)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `SECURITY`
--
CREATE TABLE IF NOT EXISTS `SECURITY` (
`Fname` varchar(15)
,`LName` varchar(15)
);
-- --------------------------------------------------------

--
-- Table structure for table `Tags`
--

CREATE TABLE IF NOT EXISTS `Tags` (
  `PhotoID` int(11) NOT NULL DEFAULT '0',
  `UserID` int(11) NOT NULL DEFAULT '0',
  `FName` varchar(15) DEFAULT NULL,
  `LName` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`PhotoID`,`UserID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Tags`
--

INSERT INTO `Tags` (`PhotoID`, `UserID`, `FName`, `LName`) VALUES
(1, 1, 'Badam', 'Kiriti'),
(1, 5, 'Venu', 'Vangala'),
(1, 14, 'Priya', 'Darshini'),
(2, 3, 'Lionel', 'Messi'),
(2, 4, 'Thiago', 'Messi'),
(3, 7, 'Ramez', 'Elmasri'),
(3, 20, 'Shivanvitha', 'Lammata'),
(4, 12, 'Victor', 'Valdes'),
(5, 16, 'Lionel', 'Messi'),
(7, 1, 'Preeti', 'Kaur'),
(7, 2, 'Priya', 'Darshini'),
(7, 3, 'Ashwini', 'Chidambareshwar'),
(7, 12, 'Swathi', 'Reddy'),
(7, 20, 'Addanki', 'Kiran'),
(8, 3, 'Rohit', 'Sharma'),
(10, 18, 'Shivanvitha', 'Lammata'),
(11, 14, 'Aritra', 'Ghosh'),
(12, 1, 'Swathi', 'Reddy'),
(12, 5, 'Addanki', 'Kiran'),
(15, 12, 'Samantha', 'Prabhu');

-- --------------------------------------------------------

--
-- Stand-in structure for view `three`
--
CREATE TABLE IF NOT EXISTS `three` (
`PostComment` int(11)
,`CommentCount` bigint(21)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `two`
--
CREATE TABLE IF NOT EXISTS `two` (
`PostComment` int(11)
,`CommentCount` bigint(21)
);
-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `UserID` int(11) NOT NULL DEFAULT '0',
  `FName` varchar(15) DEFAULT NULL,
  `MName` varchar(15) DEFAULT NULL,
  `LName` varchar(15) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Age` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserID`, `FName`, `MName`, `LName`, `BirthDate`, `Gender`, `Age`) VALUES
(1, 'Sasidhar ', '', 'Sanapala', '1994-06-30', 'M', 19),
(2, 'Aritra', '', 'Ghosh', '1950-05-05', 'M', 63),
(3, 'Sai', 'Surendra', 'Reddy', '1992-12-29', 'M', 21),
(4, 'Badam', 'Sai', 'Kiriti', '1993-12-28', 'M', 19),
(5, 'Addanki', 'Raghavendra', 'Kiran', '1993-09-09', 'M', 20),
(6, 'Samantha ', 'Ruth', 'Prabhu', '1987-12-12', 'F', 25),
(7, 'Venu', 'Gopal', 'Vangala', '1992-09-15', 'F', 21),
(8, 'Rohit', '', 'Sharma', '1987-04-30', 'M', 26),
(9, 'Shivanvitha', '', 'Lammata', '1989-11-11', 'F', 24),
(10, 'Paul ', '', 'Erdos', '1931-04-04', 'M', 82),
(11, 'Lionel', 'Andres', 'Messi', '1987-06-23', 'M', 26),
(12, 'Ramez', '', 'Elmasri', '1945-06-23', 'M', 68),
(13, 'Victor', '', 'Valdes', '1978-10-22', 'M', 35),
(14, 'Swathi', '', 'Reddy', '1987-09-12', 'F', 26),
(15, 'Thiago', '', 'Messi', '2012-02-11', 'M', 1),
(16, 'Sachin ', 'Ramesh', 'Tendulkar', '1973-04-24', 'M', 40),
(17, 'Ashwini', '', ' Chidambareshwa', '1980-01-12', 'F', 33),
(18, 'Swathi', '', 'Nambiar', '1985-08-12', 'F', 26),
(19, 'Preeti', '', 'Kaur', '1970-11-11', 'F', 43),
(20, 'Priya', '', 'Darshini', '2001-10-19', 'F', 12);

-- --------------------------------------------------------

--
-- Table structure for table `Video`
--

CREATE TABLE IF NOT EXISTS `Video` (
  `VideoID` int(11) NOT NULL DEFAULT '0',
  `VideoName` varchar(20) DEFAULT NULL,
  `Likes` int(11) DEFAULT NULL,
  PRIMARY KEY (`VideoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Video`
--

INSERT INTO `Video` (`VideoID`, `VideoName`, `Likes`) VALUES
(1, 'Video1', 17),
(2, 'Video2', 2),
(3, 'Video3', 53),
(4, 'Video4', 499),
(5, 'Video5', 52),
(6, 'Video6', 61),
(7, 'Video7', 7),
(8, 'Video8', 81),
(9, 'Video9', 19),
(10, 'Video10', 0),
(11, 'Video11', 89),
(12, 'Video12', 1),
(13, 'Video13', 100),
(14, 'Video14', 14),
(15, 'Video15', 151);

-- --------------------------------------------------------

--
-- Table structure for table `VideoComment`
--

CREATE TABLE IF NOT EXISTS `VideoComment` (
  `VideoID` int(11) NOT NULL DEFAULT '0',
  `CommentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`VideoID`,`CommentID`),
  KEY `CommentID` (`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `VideoComment`
--

INSERT INTO `VideoComment` (`VideoID`, `CommentID`) VALUES
(11, 1),
(9, 2),
(12, 3),
(13, 3),
(4, 6),
(8, 7),
(15, 7),
(12, 8),
(5, 9),
(1, 11),
(13, 11),
(1, 12),
(3, 12),
(8, 12),
(10, 12);

-- --------------------------------------------------------

--
-- Structure for view `ChoiceCount`
--
DROP TABLE IF EXISTS `ChoiceCount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ChoiceCount` AS (select `u`.`UserID` AS `UserID`,`u`.`FName` AS `FName`,`u`.`MName` AS `MName`,`u`.`LName` AS `LName`,count(0) AS `NumberOfFriends` from ((`User` `u` join `Friend` `f`) join `Following` `F`) where ((`f`.`UserID` = `u`.`UserID`) and (`F`.`PageName` = 'Acads') and (`F`.`UserID` = `f`.`UserID`)) group by `f`.`UserID`);

-- --------------------------------------------------------

--
-- Structure for view `ChoiceCount1`
--
DROP TABLE IF EXISTS `ChoiceCount1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ChoiceCount1` AS (select distinct `u`.`UserID` AS `UserID`,`u`.`FName` AS `FName`,`u`.`MName` AS `MName`,`u`.`LName` AS `LName` from ((`User` `u` join `Friend` `f`) join `Following` `F`) where ((`f`.`FriendID` = `u`.`UserID`) and (`F`.`PageName` = 'Acads') and (`F`.`UserID` = `f`.`UserID`)));

-- --------------------------------------------------------

--
-- Structure for view `EventFriendPerson`
--
DROP TABLE IF EXISTS `EventFriendPerson`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventFriendPerson` AS (select distinct `e`.`Name` AS `Name`,`e`.`Place` AS `Place` from ((`Friend` `f` join `Attend` `a`) join `Event` `e`) where ((`a`.`UserID` = `f`.`UserID`) and `f`.`FriendID` in (select `at`.`UserID` from `Attend` `at` where (`a`.`EventID` = `at`.`EventID`)) and (`e`.`EventID` = `a`.`EventID`)));

-- --------------------------------------------------------

--
-- Structure for view `EventFriendPerson2`
--
DROP TABLE IF EXISTS `EventFriendPerson2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventFriendPerson2` AS (select distinct `u`.`UserID` AS `UserID`,`f`.`FriendID` AS `FriendID` from (((`EventFriendPerson3` `e` join `User` `u`) join `Friend` `f`) join `Attend` `a`) where ((`f`.`FriendID` = `u`.`UserID`) and (`e`.`FriendID` = `f`.`FriendID`) and (`e`.`EventID` = `a`.`EventID`) and (`a`.`UserID` = `u`.`UserID`)));

-- --------------------------------------------------------

--
-- Structure for view `EventFriendPerson3`
--
DROP TABLE IF EXISTS `EventFriendPerson3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventFriendPerson3` AS (select distinct `e`.`Name` AS `Name`,`e`.`Place` AS `Place`,`f`.`FriendID` AS `FriendID`,`e`.`EventID` AS `EventID` from (((`Friend` `f` join `Attend` `a`) join `Event` `e`) join `User` `u`) where ((`a`.`UserID` = `f`.`UserID`) and `f`.`FriendID` in (select `at`.`UserID` from `Attend` `at` where (`a`.`EventID` = `at`.`EventID`)) and (`e`.`EventID` = `a`.`EventID`)));

-- --------------------------------------------------------

--
-- Structure for view `EventFriendPerson4`
--
DROP TABLE IF EXISTS `EventFriendPerson4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventFriendPerson4` AS (select distinct `u`.`UserID` AS `UserID`,`f`.`FriendID` AS `FriendID` from (((`EventFriendPerson3` `e` join `User` `u`) join `Friend` `f`) join `Attend` `a`) where ((`f`.`FriendID` = `u`.`UserID`) and (`e`.`FriendID` = `f`.`UserID`) and (`e`.`EventID` = `a`.`EventID`) and (`a`.`UserID` = `u`.`UserID`)));

-- --------------------------------------------------------

--
-- Structure for view `EventFriendPerson5`
--
DROP TABLE IF EXISTS `EventFriendPerson5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventFriendPerson5` AS (select distinct `u`.`UserID` AS `UserID`,`f`.`FriendID` AS `FriendID` from (((`EventFriendPerson3` `e` join `User` `u`) join `Friend` `f`) join `Attend` `a`) where ((`f`.`UserID` = `u`.`UserID`) and (`e`.`FriendID` = `f`.`UserID`) and (`e`.`EventID` = `a`.`EventID`) and (`a`.`UserID` = `u`.`UserID`)));

-- --------------------------------------------------------

--
-- Structure for view `EventInfo`
--
DROP TABLE IF EXISTS `EventInfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventInfo` AS (select distinct `c`.`LoginID` AS `LoginID`,`u`.`FName` AS `Fname`,`u`.`LName` AS `Lname`,`e`.`Name` AS `Name` from (((`Credentials` `c` join `User` `u`) join `Attend` `a`) join `Event` `e`) where ((`c`.`UserID` = `u`.`UserID`) and (`e`.`EventID` = `a`.`EventID`) and `u`.`UserID` in (select `a1`.`UserID` from `Attend` `a1` where (`a1`.`EventID` = `a`.`EventID`))));

-- --------------------------------------------------------

--
-- Structure for view `EventInfo1`
--
DROP TABLE IF EXISTS `EventInfo1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventInfo1` AS (select distinct `c`.`LoginID` AS `LoginID`,`u`.`FName` AS `Fname`,`u`.`LName` AS `Lname`,'NULL' AS `NULL` from ((`Credentials` `c` join `User` `u`) join `Attend` `a`) where ((not(exists(select `a1`.`UserID` from `Attend` `a1` where ((`a1`.`EventID` = `a`.`EventID`) and (`u`.`UserID` <> `a1`.`UserID`))))) and (`c`.`UserID` = `u`.`UserID`)));

-- --------------------------------------------------------

--
-- Structure for view `EventInfo2`
--
DROP TABLE IF EXISTS `EventInfo2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventInfo2` AS (select distinct `c`.`LoginID` AS `LoginID`,`u`.`FName` AS `Fname`,`u`.`LName` AS `Lname`,'NULL' AS `NULL` from (((`Credentials` `c` join `User` `u`) join `Attend` `a`) join `EventInfo` `e`) where ((`c`.`UserID` = `u`.`UserID`) and (`e`.`LoginID` <> `c`.`LoginID`)));

-- --------------------------------------------------------

--
-- Structure for view `EventInfo3`
--
DROP TABLE IF EXISTS `EventInfo3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventInfo3` AS (select distinct `c`.`LoginID` AS `LoginID`,`u`.`FName` AS `Fname`,`u`.`LName` AS `Lname`,'NULL' AS `NULL` from (((`Credentials` `c` join `User` `u`) join `Attend` `a`) join `EventInfo` `e`) where ((not(exists(select `e1`.`LoginID` from `EventInfo1` `e1` where (`e1`.`LoginID` = `c`.`UserID`)))) and (`c`.`UserID` = `u`.`UserID`)));

-- --------------------------------------------------------

--
-- Structure for view `EventInfoa`
--
DROP TABLE IF EXISTS `EventInfoa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventInfoa` AS (select distinct `e`.`LoginID` AS `LoginID`,`e`.`Fname` AS `Fname`,`e`.`Lname` AS `Lname`,`e`.`Name` AS `Name` from `EventInfo` `e` group by `e`.`LoginID`);

-- --------------------------------------------------------

--
-- Structure for view `EventsPeople`
--
DROP TABLE IF EXISTS `EventsPeople`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `EventsPeople` AS (select `Attend`.`EventID` AS `EventID`,count(0) AS `PeopleCount` from `Attend` group by `Attend`.`EventID` having (`PeopleCount` > 2));

-- --------------------------------------------------------

--
-- Structure for view `f`
--
DROP TABLE IF EXISTS `f`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `f` AS select distinct `e`.`Name` AS `Name`,`u`.`UserID` AS `UserID` from (((`Friend` `f` join `Attend` `y`) join `User` `u`) join `Event` `e`) where ((`y`.`EventID` = `e`.`EventID`) and (`f`.`UserID` = `u`.`UserID`) and (`y`.`UserID` = `f`.`FriendID`));

-- --------------------------------------------------------

--
-- Structure for view `Final`
--
DROP TABLE IF EXISTS `Final`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `Final` AS (select `t`.`PostComment` AS `PostComment`,`t`.`CommentCount` AS `CommentCount` from ((`three` `t` join `Post` `p`) join `FOUR` `f`) where ((`t`.`CommentCount` = `f`.`CommentCount`) and (`t`.`PostComment` = `p`.`PostID`)));

-- --------------------------------------------------------

--
-- Structure for view `FOUR`
--
DROP TABLE IF EXISTS `FOUR`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `FOUR` AS (select `o`.`PostComment` AS `PostComment`,max(`o`.`CommentCount`) AS `CommentCount` from `three` `o`);

-- --------------------------------------------------------

--
-- Structure for view `FriendCount`
--
DROP TABLE IF EXISTS `FriendCount`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `FriendCount` AS (select `u`.`UserID` AS `UserID`,`u`.`FName` AS `FName`,`u`.`MName` AS `MName`,`u`.`LName` AS `LName`,count(0) AS `NumberOfFriends` from (`User` `u` join `Friend` `f`) where (`f`.`UserID` = `u`.`UserID`) group by `f`.`UserID` order by count(0));

-- --------------------------------------------------------

--
-- Structure for view `FriendsDate`
--
DROP TABLE IF EXISTS `FriendsDate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `FriendsDate` AS (select distinct `u`.`FName` AS `FirstName1`,`u`.`LName` AS `LastName1`,`u1`.`FName` AS `FirstName2`,`u1`.`LName` AS `LastName2`,`f`.`FDate` AS `FDate` from ((`User` `u` join `Friend` `f`) join `User` `u1`) where ((`f`.`FriendID` = `u`.`UserID`) and (`f`.`UserID` = `u1`.`UserID`) and (`f`.`FDate` > '2005-12-31')));

-- --------------------------------------------------------

--
-- Structure for view `LIKECRICKET`
--
DROP TABLE IF EXISTS `LIKECRICKET`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `LIKECRICKET` AS (select `u`.`UserID` AS `UserID`,`u`.`FName` AS `FName`,`u`.`MName` AS `MName`,`u`.`LName` AS `LName`,`u`.`Gender` AS `Gender`,`u`.`Age` AS `Age` from (`User` `u` join `Post` `p`) where ((`p`.`PostOnPage` = 'Cricket') and (`p`.`Owner` = `u`.`UserID`)));

-- --------------------------------------------------------

--
-- Structure for view `MaxEvents`
--
DROP TABLE IF EXISTS `MaxEvents`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `MaxEvents` AS (select `e2`.`Name` AS `Name`,`e1`.`PeopleCount` AS `PeopleCount`,`e2`.`Place` AS `Place` from (`EventsPeople` `e1` join `Event` `e2`) where (`e1`.`EventID` = `e2`.`EventID`));

-- --------------------------------------------------------

--
-- Structure for view `MaxLikesComment`
--
DROP TABLE IF EXISTS `MaxLikesComment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `MaxLikesComment` AS (select `Comment`.`PostComment` AS `PostComment`,max(`Comment`.`Likes`) AS `Likes`,`Comment`.`Text` AS `Text` from `Comment`);

-- --------------------------------------------------------

--
-- Structure for view `MaxLikesComment1`
--
DROP TABLE IF EXISTS `MaxLikesComment1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `MaxLikesComment1` AS (select `Comment`.`PostComment` AS `PostComment`,max(`Comment`.`Likes`) AS `Likes`,`Comment`.`Text` AS `Text` from `Comment` group by `Comment`.`PostComment`);

-- --------------------------------------------------------

--
-- Structure for view `one`
--
DROP TABLE IF EXISTS `one`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `one` AS (select `Comment`.`PostComment` AS `PostComment`,count(0) AS `CommentCount` from `Comment` group by `Comment`.`PostComment`);

-- --------------------------------------------------------

--
-- Structure for view `PersonMaxLikes`
--
DROP TABLE IF EXISTS `PersonMaxLikes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `PersonMaxLikes` AS (select `User`.`FName` AS `FName`,`User`.`LName` AS `LName`,`MaxLikesComment`.`Text` AS `Text`,`MaxLikesComment`.`Likes` AS `Likes` from (`User` join `MaxLikesComment`) where (`User`.`UserID` = `MaxLikesComment`.`PostComment`));

-- --------------------------------------------------------

--
-- Structure for view `RemoveMaxLikes`
--
DROP TABLE IF EXISTS `RemoveMaxLikes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `RemoveMaxLikes` AS (select `MaxLikesComment1`.`PostComment` AS `PostComment`,max(`MaxLikesComment1`.`Likes`) AS `Likes`,`MaxLikesComment1`.`Text` AS `Text` from `MaxLikesComment1`);

-- --------------------------------------------------------

--
-- Structure for view `REMOVEMAXLIKESCOMMENT`
--
DROP TABLE IF EXISTS `REMOVEMAXLIKESCOMMENT`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `REMOVEMAXLIKESCOMMENT` AS (select `c`.`Text` AS `Text`,`c`.`Likes` AS `Likes`,`c`.`PostComment` AS `PostComment` from (`Comment` `c` join `MaxLikesComment` `M`) where (`c`.`Likes` < `M`.`Likes`));

-- --------------------------------------------------------

--
-- Structure for view `REMOVEMAXLIKESCOMMENT2`
--
DROP TABLE IF EXISTS `REMOVEMAXLIKESCOMMENT2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `REMOVEMAXLIKESCOMMENT2` AS (select `c`.`Text` AS `Text`,`c`.`Likes` AS `Likes`,`c`.`PostComment` AS `PostComment` from (`MaxLikesComment1` `c` join `RemoveMaxLikes` `M`) where (`c`.`Likes` < `M`.`Likes`));

-- --------------------------------------------------------

--
-- Structure for view `SecondMaxLikes`
--
DROP TABLE IF EXISTS `SecondMaxLikes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SecondMaxLikes` AS (select `r`.`Text` AS `Text`,max(`r`.`Likes`) AS `SecondMaxLikes`,`p`.`Status` AS `Status` from (`REMOVEMAXLIKESCOMMENT` `r` join `Post` `p`) where (`p`.`PostID` = `r`.`PostComment`));

-- --------------------------------------------------------

--
-- Structure for view `SecondMaxLikes2`
--
DROP TABLE IF EXISTS `SecondMaxLikes2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SecondMaxLikes2` AS (select `r`.`Text` AS `Text`,max(`r`.`Likes`) AS `SecondMaxLikes`,`p`.`Status` AS `Status` from (`REMOVEMAXLIKESCOMMENT2` `r` join `Post` `p`) where (`p`.`PostID` = `r`.`PostComment`));

-- --------------------------------------------------------

--
-- Structure for view `SECURITY`
--
DROP TABLE IF EXISTS `SECURITY`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SECURITY` AS (select `u`.`FName` AS `Fname`,`u`.`LName` AS `LName` from (`User` `u` join `Credentials` `C`) where ((`C`.`UserID` = `u`.`UserID`) and ((`C`.`Password` = `u`.`FName`) or (`C`.`Password` = `u`.`LName`) or (`C`.`Password` = `C`.`LoginID`))));

-- --------------------------------------------------------

--
-- Structure for view `three`
--
DROP TABLE IF EXISTS `three`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `three` AS (select `o`.`PostComment` AS `PostComment`,`o`.`CommentCount` AS `CommentCount` from (`two` `t` join `one` `o`) where (`o`.`CommentCount` < `t`.`CommentCount`));

-- --------------------------------------------------------

--
-- Structure for view `two`
--
DROP TABLE IF EXISTS `two`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `two` AS (select `one`.`PostComment` AS `PostComment`,max(`one`.`CommentCount`) AS `CommentCount` from `one`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Album`
--
ALTER TABLE `Album`
  ADD CONSTRAINT `Album_ibfk_1` FOREIGN KEY (`UploadedBy`) REFERENCES `User` (`UserID`) ON DELETE SET NULL;

--
-- Constraints for table `AlbumPhoto`
--
ALTER TABLE `AlbumPhoto`
  ADD CONSTRAINT `AlbumPhoto_ibfk_1` FOREIGN KEY (`PhotoID`) REFERENCES `Photo` (`PhotoID`) ON DELETE CASCADE,
  ADD CONSTRAINT `AlbumPhoto_ibfk_2` FOREIGN KEY (`AlbumID`) REFERENCES `Album` (`AlbumID`);

--
-- Constraints for table `AlbumVideo`
--
ALTER TABLE `AlbumVideo`
  ADD CONSTRAINT `AlbumVideo_ibfk_1` FOREIGN KEY (`VideoID`) REFERENCES `Video` (`VideoID`) ON DELETE CASCADE,
  ADD CONSTRAINT `AlbumVideo_ibfk_2` FOREIGN KEY (`AlbumID`) REFERENCES `Album` (`AlbumID`);

--
-- Constraints for table `Attend`
--
ALTER TABLE `Attend`
  ADD CONSTRAINT `Attend_ibfk_1` FOREIGN KEY (`EventID`) REFERENCES `Event` (`EventID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Attend_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`);

--
-- Constraints for table `Comment`
--
ALTER TABLE `Comment`
  ADD CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`PostComment`) REFERENCES `Post` (`PostID`);

--
-- Constraints for table `Event`
--
ALTER TABLE `Event`
  ADD CONSTRAINT `Event_ibfk_1` FOREIGN KEY (`CreatorID`) REFERENCES `User` (`UserID`);

--
-- Constraints for table `Friend`
--
ALTER TABLE `Friend`
  ADD CONSTRAINT `Friend_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Friend_ibfk_2` FOREIGN KEY (`FriendID`) REFERENCES `User` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `PhotoComment`
--
ALTER TABLE `PhotoComment`
  ADD CONSTRAINT `PhotoComment_ibfk_1` FOREIGN KEY (`PhotoID`) REFERENCES `Photo` (`PhotoID`) ON DELETE CASCADE,
  ADD CONSTRAINT `PhotoComment_ibfk_2` FOREIGN KEY (`CommentID`) REFERENCES `Comment` (`CommentID`);

--
-- Constraints for table `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `Post_ibfk_1` FOREIGN KEY (`Owner`) REFERENCES `User` (`UserID`),
  ADD CONSTRAINT `Post_ibfk_2` FOREIGN KEY (`PostOnPage`) REFERENCES `Page` (`Name`) ON DELETE CASCADE;

--
-- Constraints for table `Tags`
--
ALTER TABLE `Tags`
  ADD CONSTRAINT `Tags_ibfk_1` FOREIGN KEY (`PhotoID`) REFERENCES `Photo` (`PhotoID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Tags_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`);

--
-- Constraints for table `VideoComment`
--
ALTER TABLE `VideoComment`
  ADD CONSTRAINT `VideoComment_ibfk_1` FOREIGN KEY (`VideoID`) REFERENCES `Video` (`VideoID`) ON DELETE CASCADE,
  ADD CONSTRAINT `VideoComment_ibfk_2` FOREIGN KEY (`CommentID`) REFERENCES `Comment` (`CommentID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
