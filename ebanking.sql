CREATE DATABASE  IF NOT EXISTS `ebanking` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ebanking`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ebanking
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atm`
--

DROP TABLE IF EXISTS `atm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atm` (
  `idATM` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(45) NOT NULL,
  `idBank` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`idATM`),
  KEY `fk_ATM_Bank1_idx` (`idBank`),
  CONSTRAINT `fk_ATM_Bank1` FOREIGN KEY (`idBank`) REFERENCES `bank` (`idBank`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atm`
--

LOCK TABLES `atm` WRITE;
/*!40000 ALTER TABLE `atm` DISABLE KEYS */;
INSERT INTO `atm` VALUES (5,'190 Nguyễn Trãi',1,1),(6,'1 Giải Phóng',1,1),(7,'72 Phạm HÙng',2,1),(8,'1 Mỹ ĐÌnh',2,0);
/*!40000 ALTER TABLE `atm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `idBank` int(11) NOT NULL AUTO_INCREMENT,
  `bankName` varchar(100) NOT NULL,
  `bankAddress` varchar(100) NOT NULL,
  `bankMail` char(45) NOT NULL,
  `bankPhone` char(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`idBank`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'BkerBank','Tầng 20','bkerbank@gmail.com','1900000000',1),(2,'FPTBank','Tầng 22','fptbank@fpt.com.vn','0430000000',1);
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankaccount`
--

DROP TABLE IF EXISTS `bankaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankaccount` (
  `idBankAccount` int(11) NOT NULL AUTO_INCREMENT,
  `accountNumber` varchar(45) NOT NULL,
  `cardNumber` char(20) NOT NULL,
  `openedDate` date NOT NULL,
  `balance` double NOT NULL,
  `ebanking` tinyint(1) NOT NULL,
  `idMoneyType` int(11) NOT NULL,
  `idCustomerAccount` int(11) NOT NULL,
  `idBankAccountType` int(11) NOT NULL,
  `idBank` int(11) NOT NULL,
  PRIMARY KEY (`idBankAccount`),
  KEY `fk_BankAccount_CustomerAccount_idx` (`idCustomerAccount`),
  KEY `fk_BankAccount_BankAccountType1_idx` (`idBankAccountType`),
  KEY `fk_BankAccount_Bank1_idx` (`idBank`),
  KEY `fk_BankAccount_MoneyType1_idx` (`idMoneyType`),
  CONSTRAINT `fk_BankAccount_Bank1` FOREIGN KEY (`idBank`) REFERENCES `bank` (`idBank`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_BankAccount_BankAccountType1` FOREIGN KEY (`idBankAccountType`) REFERENCES `bankaccounttype` (`idBankAccountType`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_BankAccount_CustomerAccount` FOREIGN KEY (`idCustomerAccount`) REFERENCES `customeraccount` (`idCustomerAccount`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_BankAccount_MoneyType1` FOREIGN KEY (`idMoneyType`) REFERENCES `currency` (`idCurrency`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccount`
--

LOCK TABLES `bankaccount` WRITE;
/*!40000 ALTER TABLE `bankaccount` DISABLE KEYS */;
INSERT INTO `bankaccount` VALUES (1,'711A','3123123','2015-10-10',950000,1,1,1,1,1),(2,'711B','123123','2015-10-10',950000,1,1,1,2,1),(3,'711C','1112122','2015-10-10',510000,1,1,3,1,1),(4,'711D','123123123','2015-10-10',1000000,1,1,4,1,1),(5,'711E','123123123123','2015-10-10',500000,1,1,5,2,1);
/*!40000 ALTER TABLE `bankaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankaccounttype`
--

DROP TABLE IF EXISTS `bankaccounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bankaccounttype` (
  `idBankAccountType` int(11) NOT NULL AUTO_INCREMENT,
  `BankAccountType` varchar(45) NOT NULL,
  `limitedBorrow` double NOT NULL,
  PRIMARY KEY (`idBankAccountType`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankaccounttype`
--

LOCK TABLES `bankaccounttype` WRITE;
/*!40000 ALTER TABLE `bankaccounttype` DISABLE KEYS */;
INSERT INTO `bankaccounttype` VALUES (1,'Gold',50000),(2,'Sliver',20000);
/*!40000 ALTER TABLE `bankaccounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `idCurrency` int(11) NOT NULL,
  `currencyName` varchar(45) NOT NULL,
  `rate` double NOT NULL COMMENT 'rate so với việt nam đồng',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`idCurrency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'Đồng',1,1),(2,'Dollar',20000,1);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customeraccount`
--

DROP TABLE IF EXISTS `customeraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customeraccount` (
  `idCustomerAccount` int(11) NOT NULL AUTO_INCREMENT,
  `userName` char(20) NOT NULL,
  `password` char(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `idCard` char(12) NOT NULL,
  `birthDay` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` char(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`idCustomerAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customeraccount`
--

LOCK TABLES `customeraccount` WRITE;
/*!40000 ALTER TABLE `customeraccount` DISABLE KEYS */;
INSERT INTO `customeraccount` VALUES (1,'tinhpt5','1','Phạm Trung Tính','135662780','1994-12-30','190 Nguyễn Trãi','0972426521',1),(2,'tinhpt94','1','Phạm Trung Tính','135662781','1994-12-30','Vĩnh Phúc','0972426521',1),(3,'fis','1','FPT IS','12312312','2015-01-01','Hà Nội','0439999999',1),(4,'h2o','12','Xí nghiệp nước','12312311','2015-01-01','Hà Nội','0438888888',1),(5,'SEVN','123','Điện lực quốc gia','98798797','2015-01-01','Hà Nội','0437777777',1);
/*!40000 ALTER TABLE `customeraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onlineborrow`
--

DROP TABLE IF EXISTS `onlineborrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `onlineborrow` (
  `idOnlineBorrow` int(11) NOT NULL AUTO_INCREMENT,
  `term` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `idTransaction` int(11) NOT NULL,
  PRIMARY KEY (`idOnlineBorrow`),
  KEY `fk_onlineborrow_transaction1_idx` (`idTransaction`),
  CONSTRAINT `fk_onlineborrow_transaction1` FOREIGN KEY (`idTransaction`) REFERENCES `transaction` (`idTransaction`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onlineborrow`
--

LOCK TABLES `onlineborrow` WRITE;
/*!40000 ALTER TABLE `onlineborrow` DISABLE KEYS */;
INSERT INTO `onlineborrow` VALUES (2,1,1,6);
/*!40000 ALTER TABLE `onlineborrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savingsbook`
--

DROP TABLE IF EXISTS `savingsbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `savingsbook` (
  `idsavingsbook` int(11) NOT NULL AUTO_INCREMENT,
  `term` int(11) NOT NULL,
  `idTransaction` int(11) NOT NULL,
  PRIMARY KEY (`idsavingsbook`),
  KEY `fk_savingsbook_transaction1_idx` (`idTransaction`),
  CONSTRAINT `fk_savingsbook_transaction1` FOREIGN KEY (`idTransaction`) REFERENCES `transaction` (`idTransaction`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savingsbook`
--

LOCK TABLES `savingsbook` WRITE;
/*!40000 ALTER TABLE `savingsbook` DISABLE KEYS */;
INSERT INTO `savingsbook` VALUES (2,24,3),(3,6,4);
/*!40000 ALTER TABLE `savingsbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `idTransaction` int(11) NOT NULL AUTO_INCREMENT,
  `transactionDate` date NOT NULL,
  `transactionContent` varchar(45) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(20) NOT NULL,
  `idTransactionType` int(11) NOT NULL,
  `idBankAccount` int(11) NOT NULL,
  `idReceiverAccount` int(11) NOT NULL,
  PRIMARY KEY (`idTransaction`),
  KEY `fk_Transaction_TransactionType1_idx` (`idTransactionType`),
  KEY `fk_transaction_bankaccount1_idx` (`idBankAccount`),
  KEY `fk_transaction_bankaccount2_idx` (`idReceiverAccount`),
  CONSTRAINT `fk_Transaction_TransactionType1` FOREIGN KEY (`idTransactionType`) REFERENCES `transactiontype` (`idTransactionType`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_bankaccount1` FOREIGN KEY (`idBankAccount`) REFERENCES `bankaccount` (`idBankAccount`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_transaction_bankaccount2` FOREIGN KEY (`idReceiverAccount`) REFERENCES `bankaccount` (`idBankAccount`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (3,'2015-12-06','G?i ti?t ki?m',50000,'success',6,2,2),(4,'2015-12-06','G?i ti?t ki?m',90000,'success',6,1,1),(6,'2015-12-06','Vay ti?n',50000,'success',7,1,1);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontype`
--

DROP TABLE IF EXISTS `transactiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactiontype` (
  `idTransactionType` int(11) NOT NULL AUTO_INCREMENT,
  `transactionType` varchar(45) NOT NULL,
  `transferType` tinyint(1) NOT NULL,
  `idServiceAccount` int(11) NOT NULL,
  PRIMARY KEY (`idTransactionType`),
  KEY `fk_transactiontype_bankaccount1_idx` (`idServiceAccount`),
  CONSTRAINT `fk_transactiontype_bankaccount1` FOREIGN KEY (`idServiceAccount`) REFERENCES `bankaccount` (`idBankAccount`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontype`
--

LOCK TABLES `transactiontype` WRITE;
/*!40000 ALTER TABLE `transactiontype` DISABLE KEYS */;
INSERT INTO `transactiontype` VALUES (1,'Chuyển khoản trong ngân hàng',0,1),(2,'Chuyển khoản ngoài ngân hàng',0,1),(3,'Điện',1,5),(4,'Nước',1,4),(5,'ADSL',1,3),(6,'Gửi tiết kiệm',0,1),(7,'Vay tiền',0,1);
/*!40000 ALTER TABLE `transactiontype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-06 16:53:31
