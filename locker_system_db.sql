-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 21, 2025 at 01:49 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `locker_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_title` varchar(100) NOT NULL,
  `activity_description` text,
  `activity_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `admin_id` int(11) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT 'admin',
  PRIMARY KEY (`activity_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`activity_id`, `activity_title`, `activity_description`, `activity_date`, `admin_id`, `user_type`) VALUES
(1, 'System Update', 'Locker booking system updated to version 2.0', '2025-08-10 03:20:46', 1, 'admin'),
(2, 'New Locker Added', 'Added 5 new lockers to the system', '2025-08-10 03:20:46', 1, 'admin'),
(3, 'Maintenance', 'Performed routine maintenance on locker system', '2025-08-10 03:20:46', 1, 'admin'),
(4, 'New Locker Added', 'Locker 17 added at Block A, Ground Floor (Medium) with status: Available', '2025-10-18 12:44:46', 1, 'admin'),
(5, 'Locker assignment confirmed', 'Locker 5 assigned to student Alice Wilson', '2025-10-20 18:06:24', 1, 'admin'),
(6, 'Locker assignment confirmed', 'Locker 7 assigned to student Liam Smith', '2025-10-20 18:20:45', 1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AdminID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Name`, `Email`, `Password`) VALUES
(1, 'Admin', 'admin@locker.com', '$2y$10$cmap2Wb1T.txFNssKdz.reATNahjXmF0YRLzKLK12x8kVxktmBIQ2');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `BookingID` int(11) NOT NULL AUTO_INCREMENT,
  `StudentID` varchar(10) DEFAULT NULL,
  `LockerID` int(11) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `StudentID` (`StudentID`),
  KEY `LockerID` (`LockerID`),
  KEY `idx_booking_status` (`Status`),
  KEY `idx_booking_student` (`StudentID`,`Status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `StudentID`, `LockerID`, `BookingDate`, `Status`) VALUES
(2, '647927', 5, '2025-10-19', 'confirmed'),
(3, '910983', 6, '2025-10-20', 'provisional'),
(4, '558556', 7, '2025-10-20', 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
CREATE TABLE IF NOT EXISTS `email_log` (
  `EmailLogID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `Message` text,
  `SentDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`EmailLogID`),
  KEY `ParentID` (`ParentID`),
  KEY `SentDate` (`SentDate`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_log`
--

INSERT INTO `email_log` (`EmailLogID`, `ParentID`, `Email`, `Subject`, `Message`, `SentDate`) VALUES
(1, '1008113111123', 'ethan.wilson@gmail.com', 'Provisional Locker Assignment', 'Your student has been provisionally assigned locker 5 at Block B, Ground Floor. Please make payment of R100 to confirm the assignment.', '2025-10-19 17:11:47'),
(2, '4109137427178', 'james.thomas@gmail.com', 'Provisional Locker Assignment', 'Your student has been provisionally assigned locker 6 at Block B, First Floor. Please make payment of R100 to confirm the assignment.', '2025-10-20 18:14:32'),
(3, '4207012946087', 'emma.smith@gmail.com', 'Provisional Locker Assignment', 'Your student has been provisionally assigned locker 7 at Near Gym. Please make payment of R100 to confirm the assignment.', '2025-10-20 18:16:11');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE IF NOT EXISTS `grade` (
  `GradeNo` varchar(10) NOT NULL,
  PRIMARY KEY (`GradeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`GradeNo`) VALUES
('Grade1'),
('Grade10'),
('Grade11'),
('Grade12'),
('Grade8'),
('Grade9');

-- --------------------------------------------------------

--
-- Table structure for table `locker`
--

DROP TABLE IF EXISTS `locker`;
CREATE TABLE IF NOT EXISTS `locker` (
  `LockerID` int(11) NOT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `Size` varchar(20) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LockerID`),
  KEY `LockerID` (`LockerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `locker`
--

INSERT INTO `locker` (`LockerID`, `Location`, `Size`, `Status`) VALUES
(1, 'Block A, Ground Floor', 'Small', 'Assigned'),
(2, 'Block A, Ground Floor', 'Medium', 'Assigned'),
(3, 'Block A, First Floor', 'Large', 'Assigned'),
(4, 'Block B, Ground Floor', 'Small', 'Maintenance'),
(5, 'Block B, Ground Floor', 'Medium', 'Assigned'),
(6, 'Block B, First Floor', 'Large', 'reserved'),
(7, 'Near Gym', 'Small', 'Assigned'),
(8, 'Near Gym', 'Medium', 'Maintenance'),
(9, 'Near Library', 'Large', 'Available'),
(10, 'Near Library', 'Small', 'Available'),
(11, 'Block C, Ground Floor', 'Small', 'Available'),
(12, 'Block C, Ground Floor', 'Medium', 'Available'),
(14, 'Block D, Ground Floor', 'Small', 'Available'),
(15, 'Block D, Ground Floor', 'Medium', 'Available'),
(16, 'Block A, Ground Floor', 'Small', 'Available'),
(17, 'Block A, Ground Floor', 'Medium', 'Available');

-- --------------------------------------------------------

--
-- Stand-in structure for view `locker_usage_by_grade`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `locker_usage_by_grade`;
CREATE TABLE IF NOT EXISTS `locker_usage_by_grade` (
`GradeNo` varchar(10)
,`LockersAssigned` bigint(21)
,`TotalLockers` bigint(21)
,`PercentageUsed` varchar(29)
);

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
CREATE TABLE IF NOT EXISTS `parent` (
  `ParentID` varchar(20) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `MobileNo` varchar(15) DEFAULT NULL,
  `Address` text,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`ParentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`ParentID`, `Name`, `Surname`, `Email`, `MobileNo`, `Address`, `password`) VALUES
('1008113111123', 'Ethan', 'Wilson', 'ethan.wilson@gmail.com', '0737248373', '636 Cedar Street', '$2y$10$TMeVex3eodMOv9/cmK5Tk.IanH51p6H9tkzEkYaY4BNTFIO2J4ki.'),
('202019503196', 'Jane', 'Taylor', 'jane.taylor@gmail.com', '0781998910', '911 Ash Street', '$2y$10$hLQphTgdI4roeex3cHubpu3I68MlbhLRoNsm1uNupDQ1lnYat/HNi'),
('3018701182', 'Mary', 'Johnson', 'mary.j@gmail.com', '0832345678', '456 Oak Ave', '$2y$10$7OoOUp9frd1rDptlr8x7Dev4hzcD54FH1k5uZ6hnN1S52S7XkkiFu'),
('306052541142', 'Emma', 'Anderson', 'emma.anderson@gmail.com', '0721206388', '704 Willow Street', '$2y$10$MfnYJ6nm1670r6HB9xjuBO0RbhwFfFlYduPlwlOFMGGysdrwDpfwW'),
('4108192658003', 'Olivia', 'Anderson', 'olivia.anderson@gmail.com', '0714962168', '404 Cedar Street', '$2y$10$rARs6NNwoaGRfz2S2t.RruBWEkPJp.yrQFCJLejjq2k4ruQ1JPGlC'),
('4109137427178', 'James', 'Thomas', 'james.thomas@gmail.com', '0789012345', '246 Redwood Court', '$2y$10$3I7K1fW.m5d0t0qfPEyGZ..t3hltB5fcaPQVjyV3XfiaJ8j83IQ8G'),
('4204287904104', 'Liam', 'Nkosi', 'liam.nkosi@gmail.com', '0744083306', '433 Birch Street', '$2y$10$nxbfhucJ5GjzDkDZya4OWuK5zpJEMW2uv90TQ6agx..FbD1lO5Evi'),
('4207012946087', 'Emma', 'Smith', 'emma.smith@gmail.com', '0749100605', '718 Ash Street', '$2y$10$IXYPK1Wf0IcQT3zgORvmCuJRP9MdELT2ehCdGHnG/Xe3uWFyGTCdm'),
('4409125431129', 'John', 'Nkosi', 'john.nkosi@gmail.com', '0799536039', '436 Elm Street', '$2y$10$MYSU4FtodJztaGtCeDdpSOAbZGblsZW65jPbKgPrZwtU4/PohhlFi'),
('4510283636054', 'Noah', 'White', 'noah.white@gmail.com', '0777393801', '604 Pine Street', '$2y$10$.vbl1LH0gcYq3E1j9/q2RegZ1rFDy0W.Qh7biwWDpK7I0sm8zP4Fa'),
('4608148192183', 'John', 'Anderson', 'john.anderson@gmail.com', '0777769694', '789 Willow Street', '$2y$10$.Tdrdg9BCF.m0obKYK4cf.SVSNTsnBFnKsPorYqdGSIHdpwOhdYhq'),
('4609139102037', 'Olivia', 'Smith', 'olivia.smith@gmail.com', '0763380717', '216 Oak Street', '$2y$10$RMZHCfuGlYA9/6tvt8ErxOFcHJQ8jpbdCwmboxLS8Ti1ynM1OXzW6'),
('4708037500102', 'Ethan', 'Wilson', 'ethan.wilson@gmail.com', '0718425293', '500 Birch Street', '$2y$10$TsK3LL5ACUewne5s9OBknOggNzEhblQRTbuAUhGkj0YudoZ3FIlXK'),
('4803233540087', 'Ethan', 'Nkosi', 'ethan.nkosi@gmail.com', '0722944641', '336 Willow Street', '$2y$10$r6fEStDTiwhxCQQwGmcN6eGyq8jaWYOcZTI6Sqn6GNUedw9Tpb09S'),
('4809018674075', 'Robert', 'Taylor', 'robert.taylor@gmail.com', '0743877000', '162 Ash Street', '$2y$10$tQcX1jYSFW71l042Bx5MmOMPpVTMADBbVM11j99a5PcpBlVDWppDy'),
('4809209872196', 'Robert', 'Smith', 'robert.smith@gmail.com', '0768346836', '757 Cedar Street', '$2y$10$vipcrIzHduGEcnx8SDP8xu8V5dM83oQliobjRXG01hpODF9qirzuO'),
('4901218928125', 'Michael', 'Thomas', 'michael.thomas@gmail.com', '0711790361', '104 Elm Street', '$2y$10$p/ZSjLuSoGfmQI7uZWLQrO57lCnpL2/ZLWqXztF6XpTkVG4UGz0q.'),
('5004038523192', 'Linda', 'Anderson', 'linda.anderson@gmail.com', '0778901234', '135 Spruce Street', '$2y$10$HTyQ0q08NBd1/HsUNPKGhuqwdUZMJe9YrJIS40IN9HMHStBR4HEm6'),
('5106123937064', 'Alice', 'Smith', 'alice.smith@gmail.com', '7597640', '447 Birch Street', '$2y$10$TTLp7nl6.nUwfoMzI.Euh.D/tgKpjMnZbEm3tMKmc0UBBfEz9sDAO'),
('5206163043195', 'David', 'Taylor', 'david.taylor@gmail.com', '0749909129', '744 Maple Street', '$2y$10$PheHNlyRtLZYx96NkPJVnO95UnUJVqJ6c3nFCh1VwGbqgMQfBflke'),
('5512102556093', 'Liam', 'Wilson', 'liam.wilson@gmail.com', '0748585981', '413 Ash Street', '$2y$10$V6iYKUQCPefKNAGZUv7gzOLyTr053LpN90jqQDQlmCQVlIRN61K26'),
('5612226663035', 'Robert', 'Wilson', 'robert.wilson@gmail.com', '0735460310', '189 Pine Street', '$2y$10$GbbYLxZ5EXMHg.FfVuRcJOcVmpJbwPYHROcqiDAm8N1QmtgkG5xs2'),
('5707284141112', 'Liam', 'Anderson', 'liam.anderson@gmail.com', '0796115093', '327 Redwood Street', '$2y$10$rdwsJZYNPQutdnCqygfJPuBxJNwicA8ScXVRSMFxidmaDIxzxio/y'),
('5912127358130', 'Michael', 'White', 'michael.white@gmail.com', '0743043868', '238 Oak Street', '$2y$10$g.CfUH4jMRK/2mbXIF36S.0CD1kxZFWhLhvUWu2pzQy8f9ucUTrku'),
('6012217265129', 'John', 'Nkosi', 'john.nkosi@gmail.com', '0728680821', '600 Elm Street', '$2y$10$kQMYGiqbft0rPE8ZgKhTbu5FX5dLv.mEzjwqDdWKljPwgeN84JF/O'),
('6104301288034', 'Emily', 'Brown', 'emily.brown@gmail.com', '0719919743', '906', '$2y$10$X9/otS/ZUFylO.Br4uuLOeGnZz0AmkVqyjz1Mxe6nPxNkKHE3BZZi'),
('612064343182', 'Ethan', 'Nkosi', 'ethan.nkosi@gmail.com', '0752005034', '852 Cedar Street', '$2y$10$YBJVd0tJh00YOthn0Yf5NeSJADtYvNpBVYgyT5GPPWQgiKDHAUcNa'),
('6204032653193', 'Michael', 'Taylor', 'michael.taylor@gmail.com', '0721216884', '701 Spruce Street', '$2y$10$T1HoLJyCLSVZydejGfW.eeP4DHzbDuL0/VlA6pN31FxOMS2vc/7BO'),
('6301209154077', 'Olivia', 'Hall', 'olivia.hall@gmail.com', '0717403055', '864 Cedar Street', '$2y$10$G91zfwUOhvI2.bvJ4bkUMu0ntsHshVgaVwmfo6BPlSuDePtYLOFOi'),
('6305123394192', 'Emma', 'Johnson', 'emma.johnson@gmail.com', '0763177499', '715 Birch Street', '$2y$10$nm/4ou3EXSqqQHu/ppSV3OJCwVejRL9eO/Gtmcu1h3GO28gwirdiC'),
('6602050571067', 'Liam', 'White', 'liam.white@gmail.com', '0737988829', '842 Birch Street', '$2y$10$4.qmwSgjRg4/Qb.Glw0G5./ertAvrVFfTjT5RfiwKdUlwIu5G64ki'),
('6603287420165', 'Sophia', 'Hall', 'sophia.hall@gmail.com', '0778621486', '776 Cedar Street', '$2y$10$rFvLDnipMoGw0xRHfk9YqOk6etNfq15GoU.oUvTJ3KagbuWIcxIzK'),
('6705260699127', 'David', 'Johnson', 'david.johnson@gmail.com', '0784780625', '473 Birch Street', '$2y$10$QRJUC7BWLlp17pc43QXHTu0j.2rIVobQLk1fTlqJ82ITl3xGi9LTO'),
('6711189204048', 'Ethan', 'Nkosi', 'ethan.nkosi@gmail.com', '0738510987', '382 Elm Street', '$2y$10$BN.1icDjkSHD6dPZOdP1se62DwAn4.pknzl5z3sn5b8amj.eVShw2'),
('6806020888197', 'Michael', 'Nkosi', 'michael.nkosi@gmail.com', '0798801632', '897 Cedar Street', '$2y$10$3HDOl9J9hXBZt2ZV2oP6R.2ftzJiCe3v.Z1O3tpfqVBgjRIYLXeCO'),
('7009119979038', 'Ava', 'Wilson', 'ava.wilson@gmail.com', '0764281373', '911 Birch Street', '$2y$10$6Vtxklx8vXhdkA.fxdU.Mu3MB0dDrv/DmdiCyaZFPFAtl8OO2ynjy'),
('7110115033116', 'John', 'Smith', 'john.smith@gmail.com', '0821234567', '123 Maple St', '$2y$10$XKiSM/nmiijyeQ9BandEb.19KvFqKPZSu6kHWqOlsm0cB2SzfoWDm'),
('7303154126003', 'Ethan', 'Taylor', 'ethan.taylor@gmail.com', '0799314784', '404 Oak Street', '$2y$10$9LITFDZ3bsKx0OT6s8ygfetC3RqXh.eKg6iGREzuekze6VLkRBKVS'),
('7807275046086', 'Liam', 'Brown', 'liam.brown@gmail.com', '0786828544', '492 Spruce Street', '$2y$10$abVzQvt.2dHPYubA5JaqKeuvGEoYZHlD6uoTN7khOhB1zkw0M.1Hu'),
('7811225151184', 'Emma', 'Johnson', 'emma.johnson@gmail.com', '0787978403', '483 Oak Street', '$2y$10$gRhzm4nmurhM5saeYT8qFuNbbcRXpSb5dZS2QT.AsOOONbezq8Z.a'),
('809035978098', 'John', 'Smith', 'john.smith@gmail.com', '0775223322', '140 Maple Street', '$2y$10$JHEmBMzJ.WxdpJ57hdzIPO8MGqFd8.YvMYWwopIwNbsHODmrzm0U.'),
('8305068147131', 'Ava', 'Smith', 'ava.smith@gmail.com', '0783072551', '599 Spruce Street', '$2y$10$DWgmEnboHsLlCZjbAmR96uD4lVhDPosqyO9emSBBY8HwT4J1.ssM6'),
('8502022675077', 'Jane', 'Anderson', 'jane.anderson@gmail.com', '0758356276', '431 Spruce Street', '$2y$10$fsbWxLHYXlAJEADqt6KmWe59L/V.xwN65M.ON.iP/.XJmeuDl05sa'),
('8612145459128', 'Robert', 'Anderson', 'robert.anderson@gmail.com', '0764100813', '991 Redwood Street', '$2y$10$3QhZ8JQc1TG286oEwmBRFei3ufyGWcmDsqFyZL9IV/ME7mZmFv4Qu'),
('9012129123195', 'Noah', 'Hall', 'noah.hall@gmail.com', '0743682129', '190 Willow Street', '$2y$10$nwiCrT/N6pV9P7JBTf6gKOpdP5rvYKibQ5xd09cJBOpao2bSH98sG'),
('910173547175', 'Michael', 'Anderson', 'michael.anderson@gmail.com', '0775510858', '702 Maple Street', '$2y$10$/SEE3xuqoZztZheVDRetZOXZGwxP/ndv9llJ/2D2MQrAobC7gf4Si'),
('9108286769008', 'Noah', 'Taylor', 'noah.taylor@gmail.com', '0787273081', '566 Ash Street', '$2y$10$M8E6u864XRHqtp68lCTF3OAXM4wfq8M6nx.nBEX7VF4inK15oD4RO'),
('912266784015', 'Noah', 'Nkosi', 'noah.nkosi@gmail.com', '0763407066', '353 Oak Street', '$2y$10$ZK.m9.3thK6YBfqlBzSZ9OkbimSEoEGbEN2t0iIzoqvjRZsIYnPTa'),
('9212011817041', 'Robert', 'Taylor', 'robert.taylor@gmail.com', '0767890123', '987 Birch Boulevard', '$2y$10$5hufFsIpuwgLTnovwelExeAQEt47sNgGVbQJhmwrnCcuGwQYaDH8a'),
('9298654199', 'Emma', 'Wilson', 'emma.wilson@gmail.com', '0756789012', '654 Cedar Drive', '$2y$10$wBT7pcZfdfz9Ki82Gb3Aw.E3RlP7dqyweVKW7tiFTKDl.l4RKFdN2'),
('9309202925129', 'Liam', 'Smith', 'liam.smith@gmail.com', '0742749180', '310 Maple Street', '$2y$10$4b0sU4mn04rfQE5nBzGzyer7gzKYM6GkA0X3QBClvWHLP60E/Kh.2'),
('9411277787016', 'David', 'Johnson', 'david.johnson@gmail.com', '0745678901', '321 Maple Lane', '$2y$10$bWolHeFe9PIdm4zv2N2Uv./CyGbw8PLsKfwV5ZybTRYAXiu84hLAm'),
('9501303848045', 'Ava', 'Wilson', 'ava.wilson@gmail', '0714946067', '487 Spruce Street', '$2y$10$dyHe7/VrGzJZQ0ZbLITKWuHO5VOM25KlFicmOf0mRpRfPS1X4SCQa'),
('9504200125035', 'Linda', 'Brown', 'linda.brown@gmail.com', '0843456789', '789 Pine Rd', '$2y$10$pB36RTgESc.xogNBtVuNfuDGUmpQwWw7MWyWK3x6FAOLpPKZgM7Bi'),
('9505017498148', 'Ava', 'Hall', 'ava.hall@gmail.com', '0791798774', '332 Maple Street', '$2y$10$MVxq9vAXl0yqxJ2AFjBm6uoKbrHGPf.Z8fXTq9XRJ/r4R/5g5i4S.'),
('9507203452020', 'Robert', 'Anderson', 'robert.anderson@gmail.com', '0739094911', '875 Maple Street', '$2y$10$U1px7EysajIBPfj4QG8KdO0qyl0LE4aZ7YVdqFhqD1aZScFnJ5fb.'),
('9602046538016', 'Ava', 'Thomas', 'ava.thomas@gmail.com', '0711846135', '446 Redwood Street', '$2y$10$6gq75Nmmonexk2xv8Eb9peI0tTfvqfnt2oYxD5coCROERJSrXFurm'),
('9912089374198', 'Sophia', 'Hall', 'sophia.hall@gmail.com', '0777667807', '661 Maple Street', '$2y$10$xPZ.zA3Zsaj/qkMl7z//Oe67Ue0EDYNycacJXazHnArXAS3QHw4cq');

-- --------------------------------------------------------

--
-- Table structure for table `parent_student`
--

DROP TABLE IF EXISTS `parent_student`;
CREATE TABLE IF NOT EXISTS `parent_student` (
  `ParentID` varchar(20) NOT NULL,
  `StudentNo` varchar(10) NOT NULL,
  PRIMARY KEY (`ParentID`,`StudentNo`),
  KEY `StudentNo` (`StudentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parent_student`
--

INSERT INTO `parent_student` (`ParentID`, `StudentNo`) VALUES
('9298654199', '110216'),
('9501303848045', '163680'),
('9507203452020', '173463'),
('5004038523192', '200443'),
('9411277787016', '217985'),
('5206163043195', '221375'),
('6711189204048', '248256'),
('9602046538016', '264399'),
('4809209872196', '271520'),
('912266784015', '277788'),
('6806020888197', '287868'),
('4708037500102', '309568'),
('5106123937064', '312754'),
('8305068147131', '317750'),
('3018701182', '357874'),
('4108192658003', '366289'),
('4803233540087', '382254'),
('5612226663035', '390412'),
('5707284141112', '407505'),
('9505017498148', '453633'),
('809035978098', '508534'),
('7303154126003', '509342'),
('306052541142', '528034'),
('9108286769008', '540787'),
('9504200125035', '550037'),
('4207012946087', '558556'),
('7811225151184', '567866'),
('6301209154077', '582349'),
('9012129123195', '582349'),
('6603287420165', '611591'),
('6602050571067', '611784'),
('6705260699127', '617741'),
('9309202925129', '628670'),
('1008113111123', '647927'),
('7009119979038', '652308'),
('8612145459128', '694925'),
('4204287904104', '720053'),
('4409125431129', '739637'),
('5912127358130', '749847'),
('612064343182', '761953'),
('6204032653193', '762563'),
('9212011817041', '764982'),
('9912089374198', '773539'),
('4510283636054', '801075'),
('4609139102037', '801734'),
('8502022675077', '825753'),
('5512102556093', '828859'),
('6104301288034', '868018'),
('910173547175', '878977'),
('202019503196', '895067'),
('6012217265129', '899951'),
('6305123394192', '902543'),
('7807275046086', '908979'),
('4109137427178', '910983'),
('4809018674075', '916977'),
('4901218928125', '922628'),
('4608148192183', '977032'),
('7110115033116', 'S1001');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` varchar(20) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `PaymentDate` date DEFAULT NULL,
  `ProofOfPayment` varchar(255) DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'pending',
  PRIMARY KEY (`PaymentID`),
  KEY `ParentID` (`ParentID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `ParentID`, `Amount`, `PaymentDate`, `ProofOfPayment`, `Status`) VALUES
(3, '1008113111123', '100.00', '2025-10-20', '68f63d5974c4c_647927.JPG', 'confirmed'),
(4, '4207012946087', '100.00', '2025-10-20', '68f6607fae9b9_558556.png', 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentNo` varchar(10) NOT NULL,
  `GradeNo` varchar(10) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `LockerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`StudentNo`),
  KEY `GradeNo` (`GradeNo`),
  KEY `LockerID` (`LockerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentNo`, `GradeNo`, `Name`, `Surname`, `LockerID`) VALUES
('110216', 'Grade11', 'Olivia', 'Wilson', 1),
('163680', 'Grade11', 'Emma', 'Wilson', 2),
('173463', 'Grade11', 'Michael', 'Anderson', 3),
('200443', 'Grade11', 'Ava', 'Anderson', NULL),
('217985', 'Grade10', 'Liam', 'Johnson', NULL),
('221375', 'Grade11', 'Ava', 'Taylor', NULL),
('248256', 'Grade10', 'Liam', 'Nkosi', NULL),
('264399', 'Grade8', 'Robert', 'Thomas', NULL),
('271520', 'Grade8', 'Alice', 'Smith', NULL),
('277788', 'Grade10', 'Olivia', 'Nkosi', NULL),
('287868', 'Grade8', 'David', 'Nkosi', NULL),
('309568', 'Grade9', 'Jane', 'Wilson', NULL),
('312754', 'Grade10', 'Liam', 'Smith', NULL),
('317750', 'Grade10', 'Ava', 'Smith', NULL),
('357874', 'Grade8', 'Liam', 'Johnson', NULL),
('366289', 'Grade9', 'Liam', 'Anderson', NULL),
('382254', 'Grade8', 'Michael', 'Nkosi', NULL),
('390412', 'Grade9', 'James', 'Wilson', NULL),
('407505', 'Grade9', 'Emily', 'Anderson', NULL),
('453633', 'Grade1', 'Emily', 'Hall', NULL),
('508534', 'Grade10', 'Emma', 'Smith', NULL),
('509342', 'Grade8', 'Olivia', 'Taylor', NULL),
('528034', 'Grade11', 'Jane', 'Anderson', NULL),
('540787', 'Grade8', 'Sophia', 'Taylor', NULL),
('550037', 'Grade10', 'Olivia', 'Brown', NULL),
('558556', 'Grade10', 'Liam', 'Smith', 7),
('567866', 'Grade9', 'Olivia', 'Johnson', NULL),
('582349', 'Grade10', 'John', 'Hall', NULL),
('611591', 'Grade8', 'Liam', 'Hall', NULL),
('611784', 'Grade8', 'Jane', 'White', NULL),
('617741', 'Grade12', 'Olivia', 'Johnson', NULL),
('628670', 'Grade10', 'Ethan', 'Smith', NULL),
('647927', 'Grade12', 'Alice', 'Wilson', 5),
('652308', 'Grade10', 'Michael', 'Wilson', NULL),
('694925', 'Grade11', 'Ava', 'Anderson', NULL),
('720053', 'Grade10', 'Jane', 'Nkosi', NULL),
('739637', 'Grade9', 'John', 'Nkosi', NULL),
('749847', 'Grade9', 'Robert', 'White', NULL),
('761953', 'Grade10', 'Sophia', 'Nkosi', NULL),
('762563', 'Grade11', 'John', 'Taylor', NULL),
('764982', 'Grade8', 'Noah', 'Taylor', NULL),
('773539', 'Grade8', 'John', 'Hall', NULL),
('801075', 'Grade11', 'Ava', 'White', NULL),
('801734', 'Grade12', 'Olivia', 'Smith', NULL),
('825753', 'Grade8', 'Ethan', 'Anderson', NULL),
('828859', 'Grade12', 'Ethan', 'Wilson', NULL),
('868018', 'Grade10', 'James', 'Brown', NULL),
('878977', 'Grade9', 'Noah', 'Anderson', NULL),
('895067', 'Grade9', 'Alice', 'Taylor', NULL),
('899951', 'Grade8', 'Liam', 'Nkosi', NULL),
('902543', 'Grade11', 'Alice', 'Johnson', NULL),
('908979', 'Grade10', 'Emily', 'Brown', NULL),
('910983', 'Grade10', 'Ethan', 'Thomas', NULL),
('916977', 'Grade9', 'James', 'Taylor', NULL),
('922628', 'Grade9', 'Sophia', 'Thomas', NULL),
('977032', 'Grade11', 'James', 'Anderson', NULL),
('S1001', 'Grade9', 'Emma', 'Smith', NULL);

-- --------------------------------------------------------

--
-- Structure for view `locker_usage_by_grade`
--
DROP TABLE IF EXISTS `locker_usage_by_grade`;

DROP VIEW IF EXISTS `locker_usage_by_grade`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `locker_usage_by_grade`  AS  select `s`.`GradeNo` AS `GradeNo`,count(`l`.`LockerID`) AS `LockersAssigned`,(select count(0) from `locker`) AS `TotalLockers`,concat(round(((count(`l`.`LockerID`) / (select count(0) from `locker`)) * 100),2),'%') AS `PercentageUsed` from (`student` `s` left join `locker` `l` on((`s`.`LockerID` = `l`.`LockerID`))) group by `s`.`GradeNo` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentNo`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`LockerID`) REFERENCES `locker` (`LockerID`);

--
-- Constraints for table `email_log`
--
ALTER TABLE `email_log`
  ADD CONSTRAINT `email_log_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `parent` (`ParentID`);

--
-- Constraints for table `parent_student`
--
ALTER TABLE `parent_student`
  ADD CONSTRAINT `parent_student_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `parent` (`ParentID`),
  ADD CONSTRAINT `parent_student_ibfk_2` FOREIGN KEY (`StudentNo`) REFERENCES `student` (`StudentNo`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ParentID`) REFERENCES `parent` (`ParentID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`GradeNo`) REFERENCES `grade` (`GradeNo`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`LockerID`) REFERENCES `locker` (`LockerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
