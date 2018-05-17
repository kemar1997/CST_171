-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Golding-CST171SP18-Chapter4ModelAndERDiagram
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema CST171Example
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CST171Example
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CST171Example` ;
USE `CST171Example` ;

-- -----------------------------------------------------
-- Table `CST171Example`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CST171Example`.`Course` (
  `CourseNumber` VARCHAR(6) NOT NULL,
  `CourseTitle` VARCHAR(50) NOT NULL,
  `CourseDescription` VARCHAR(255) NOT NULL,
  `Credits` INT NOT NULL,
  PRIMARY KEY (`CourseNumber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CST171Example`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CST171Example`.`Student` (
  `StudentID` CHAR(6) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NULL,
  PRIMARY KEY (`StudentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CST171Example`.`StudentSchedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CST171Example`.`StudentSchedule` (
  `ScheduleKey` CHAR(10) NOT NULL,
  `StudentID` CHAR(6) NOT NULL,
  `Semester` CHAR(4) NOT NULL,
  `Status` VARCHAR(10) NULL,
  PRIMARY KEY (`ScheduleKey`),
  INDEX `fk_StudentSchedule_Student_idx` (`StudentID` ASC),
  CONSTRAINT `fk_StudentSchedule_Student`
    FOREIGN KEY (`StudentID`)
    REFERENCES `CST171Example`.`Student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CST171Example`.`CRN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CST171Example`.`CRN` (
  `CRNKey` CHAR(10) NOT NULL,
  `CRN` CHAR(5) NOT NULL,
  `Semester` CHAR(4) NOT NULL,
  `Location` VARCHAR(10) NULL,
  `CourseNumber` CHAR(6) NOT NULL,
  `MeetingDays` VARCHAR(5) NOT NULL,
  `MeetingTimes` VARCHAR(20) NOT NULL,
  `SeatLimit` INT NOT NULL,
  PRIMARY KEY (`CRNKey`),
  INDEX `fk_CRN_Course1_idx` (`CourseNumber` ASC),
  CONSTRAINT `fk_CRN_Course1`
    FOREIGN KEY (`CourseNumber`)
    REFERENCES `CST171Example`.`Course` (`CourseNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CST171Example`.`ScheduleCourseList`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CST171Example`.`ScheduleCourseList` (
  `ScheduleCourseListKey` INT NOT NULL,
  `ScheduleKey` CHAR(10) NOT NULL,
  `CRNKey` CHAR(10) NOT NULL,
  PRIMARY KEY (`ScheduleCourseListKey`),
  INDEX `fk_ScheduleCourseList_StudentSchedule1_idx` (`ScheduleKey` ASC),
  INDEX `fk_ScheduleCourseList_CRN1_idx` (`CRNKey` ASC),
  CONSTRAINT `fk_ScheduleCourseList_StudentSchedule1`
    FOREIGN KEY (`ScheduleKey`)
    REFERENCES `CST171Example`.`StudentSchedule` (`ScheduleKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ScheduleCourseList_CRN1`
    FOREIGN KEY (`CRNKey`)
    REFERENCES `CST171Example`.`CRN` (`CRNKey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
