-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema GoldingCST171SP18Exam3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GoldingCST171SP18Exam3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GoldingCST171SP18Exam3` ;
USE `GoldingCST171SP18Exam3` ;

-- -----------------------------------------------------
-- Table `GoldingCST171SP18Exam3`.`Vocabulary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GoldingCST171SP18Exam3`.`Vocabulary` (
  `QuestionNumberKey` INT NOT NULL,
  `Term` VARCHAR(50) NOT NULL,
  `MatchingDefinition` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`QuestionNumberKey`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
