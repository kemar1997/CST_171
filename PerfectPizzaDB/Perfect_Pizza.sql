-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Perfect_Pizza
-- -----------------------------------------------------
-- Perfect Pizza is a pizza delivery shop. They make pizzas only for home delivery. They have recently designed a new database to track their sales. They use the customer’s tele phone number for a Key column in the Customer table. They are interested in households, not individuals. They need the street address and zip code for the delivery.

-- -----------------------------------------------------
-- Schema Perfect_Pizza
--
-- Perfect Pizza is a pizza delivery shop. They make pizzas only for home delivery. They have recently designed a new database to track their sales. They use the customer’s tele phone number for a Key column in the Customer table. They are interested in households, not individuals. They need the street address and zip code for the delivery.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Perfect_Pizza` ;
USE `Perfect_Pizza` ;

-- -----------------------------------------------------
-- Table `Perfect_Pizza`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Perfect_Pizza`.`Customer` (
  `CustomerPhoneKey` NCHAR(10) NOT NULL,
  `CustomerLastName` NVARCHAR(255) NOT NULL,
  `CustomerFirstName` NVARCHAR(255) NULL,
  `CustomerAddress1` NVARCHAR(255) NULL,
  `CustomerAddress2` NVARCHAR(255) NOT NULL,
  `CustomerCity` NVARCHAR(255) NULL,
  `CustomerState` NVARCHAR(255) NULL,
  `CustomerZip` NCHAR(5) NOT NULL,
  PRIMARY KEY (`CustomerPhoneKey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Perfect_Pizza`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Perfect_Pizza`.`Employee` (
  `EmployeeKey` NCHAR(10) NOT NULL,
  `EmployeeLastName` NVARCHAR(255) NOT NULL,
  `EmployeeFirstName` NVARCHAR(255) NULL,
  `EmployeeHireDate` DATE NOT NULL,
  PRIMARY KEY (`EmployeeKey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Perfect_Pizza`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Perfect_Pizza`.`Product` (
  `ProductKey` NCHAR(10) NOT NULL,
  `ProductName` NVARCHAR(255) NOT NULL,
  `ProductUnitSize` NVARCHAR(255) NOT NULL,
  `ProductUnitPrice` DECIMAL NOT NULL,
  PRIMARY KEY (`ProductKey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Perfect_Pizza`.`CustomerOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Perfect_Pizza`.`CustomerOrder` (
  `OrderKey` NCHAR(10) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `OrderTime` TIME(6) NOT NULL,
  `CustomerPhoneKey` NCHAR(10) NOT NULL,
  `EmployeeKey` NCHAR(10) NOT NULL,
  PRIMARY KEY (`OrderKey`),
  INDEX `fk_CustomerOrder_Customer_idx` (`CustomerPhoneKey` ASC),
  INDEX `fk_CustomerOrder_Employee1_idx` (`EmployeeKey` ASC),
  CONSTRAINT `fk_CustomerOrder_Customer`
    FOREIGN KEY (`CustomerPhoneKey`)
    REFERENCES `Perfect_Pizza`.`Customer` (`CustomerPhoneKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CustomerOrder_Employee1`
    FOREIGN KEY (`EmployeeKey`)
    REFERENCES `Perfect_Pizza`.`Employee` (`EmployeeKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Perfect_Pizza`.`OrderDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Perfect_Pizza`.`OrderDetail` (
  `OrderDetailKey` NCHAR(10) NOT NULL,
  `OrderKey` NCHAR(10) NOT NULL,
  `ProductKey` NCHAR(10) NOT NULL,
  `OrderDetailQuantity` INT NOT NULL,
  `OrderDetailPriceChanged` DECIMAL NOT NULL,
  PRIMARY KEY (`OrderDetailKey`),
  INDEX `fk_OrderDetail_CustomerOrder1_idx` (`OrderKey` ASC),
  INDEX `fk_OrderDetail_Product1_idx` (`ProductKey` ASC),
  CONSTRAINT `fk_OrderDetail_CustomerOrder1`
    FOREIGN KEY (`OrderKey`)
    REFERENCES `Perfect_Pizza`.`CustomerOrder` (`OrderKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetail_Product1`
    FOREIGN KEY (`ProductKey`)
    REFERENCES `Perfect_Pizza`.`Product` (`ProductKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
