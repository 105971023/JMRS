-- MySQL Script generated by MySQL Workbench
-- Wed Dec  7 12:13:44 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema jmrs
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `jmrs` ;

-- -----------------------------------------------------
-- Schema jmrs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jmrs` DEFAULT CHARACTER SET utf8 ;
USE `jmrs` ;

-- -----------------------------------------------------
-- Table `jmrs`.`user_`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jmrs`.`user_` ;

CREATE TABLE IF NOT EXISTS `jmrs`.`user_` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `status` INT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `name_UNIQUE` ON `jmrs`.`user_` (`name` ASC);


-- -----------------------------------------------------
-- Table `jmrs`.`region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jmrs`.`region` ;

CREATE TABLE IF NOT EXISTS `jmrs`.`region` (
  `region_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jmrs`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jmrs`.`country` ;

CREATE TABLE IF NOT EXISTS `jmrs`.`country` (
  `country_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `region_id` INT NULL,
  PRIMARY KEY (`country_id`),
  CONSTRAINT `country_region_id`
    FOREIGN KEY (`region_id`)
    REFERENCES `jmrs`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `country_region_id_idx` ON `jmrs`.`country` (`region_id` ASC);


-- -----------------------------------------------------
-- Table `jmrs`.`room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jmrs`.`room` ;

CREATE TABLE IF NOT EXISTS `jmrs`.`room` (
  `room_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `comment` VARCHAR(300) NULL,
  `region_id` INT NULL,
  `country_id` INT NULL,
  `status` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`room_id`),
  CONSTRAINT `room_region_id`
    FOREIGN KEY (`region_id`)
    REFERENCES `jmrs`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `room_country_id`
    FOREIGN KEY (`country_id`)
    REFERENCES `jmrs`.`country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `room_region_id_idx` ON `jmrs`.`room` (`region_id` ASC);

CREATE INDEX `room_country_id_idx` ON `jmrs`.`room` (`country_id` ASC);


-- -----------------------------------------------------
-- Table `jmrs`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jmrs`.`book` ;

CREATE TABLE IF NOT EXISTS `jmrs`.`book` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `book_user_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  `book_date` DATE NULL,
  `start_time` TIME(0) NOT NULL,
  `end_time` TIME(0) NOT NULL,
  `name` VARCHAR(200) NULL,
  `comment` VARCHAR(1000) NULL,
  `minutes` INT NULL COMMENT '會議總共幾分鐘',
  `hours` DECIMAL(5,2) NULL COMMENT '會議總共幾小時',
  PRIMARY KEY (`book_id`),
  CONSTRAINT `book_user_id`
    FOREIGN KEY (`book_user_id`)
    REFERENCES `jmrs`.`user_` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `book_room_id`
    FOREIGN KEY (`room_id`)
    REFERENCES `jmrs`.`room` (`room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `book_user_id_idx` ON `jmrs`.`book` (`book_user_id` ASC);

CREATE INDEX `book_room_id_idx` ON `jmrs`.`book` (`room_id` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `jmrs`.`user_`
-- -----------------------------------------------------
START TRANSACTION;
USE `jmrs`;
INSERT INTO `jmrs`.`user_` (`user_id`, `name`, `password`, `role`, `status`) VALUES (1, 'guest', '84983c60f7daadc1cb8698621f802c0d9f9a3c3c295c810748fb048115c186ec', 'GUEST', 1);
INSERT INTO `jmrs`.`user_` (`user_id`, `name`, `password`, `role`, `status`) VALUES (2, 'user', '04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 'USER', 1);
INSERT INTO `jmrs`.`user_` (`user_id`, `name`, `password`, `role`, `status`) VALUES (3, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'ADMIN', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `jmrs`.`room`
-- -----------------------------------------------------
START TRANSACTION;
USE `jmrs`;
INSERT INTO `jmrs`.`room` (`room_id`, `name`, `comment`, `region_id`, `country_id`, `status`) VALUES (1, 'Room ABC', 'test room abc', NULL, NULL, 1);
INSERT INTO `jmrs`.`room` (`room_id`, `name`, `comment`, `region_id`, `country_id`, `status`) VALUES (2, 'Room Test', 'try test', NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `jmrs`.`book`
-- -----------------------------------------------------
START TRANSACTION;
USE `jmrs`;
INSERT INTO `jmrs`.`book` (`book_id`, `book_user_id`, `room_id`, `book_date`, `start_time`, `end_time`, `name`, `comment`, `minutes`, `hours`) VALUES (1, 2, 1, '2016-11-26', '09:30:00', '11:30:00', 'test book', 'just test', 120, 2);

COMMIT;

