-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_schema1` ;
USE `new_schema1` ;

-- -----------------------------------------------------
-- Table `new_schema1`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`customer` (
  `id` INT NOT NULL,
  `customer_name` VARCHAR(255) NOT NULL,
  `customer_adress` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`order` (
  `id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `order-customer_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `order-customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `new_schema1`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`product` (
  `id` INT NOT NULL,
  `product_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`order_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema1`.`order_detail` (
  `id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `detail-order_idx` (`order_id` ASC) VISIBLE,
  INDEX `detail-product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `detail-order`
    FOREIGN KEY (`order_id`)
    REFERENCES `new_schema1`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `detail-product`
    FOREIGN KEY (`product_id`)
    REFERENCES `new_schema1`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
