-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ricambi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ricambi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ricambi` DEFAULT CHARACTER SET utf8 ;
USE `ricambi` ;

-- -----------------------------------------------------
-- Table `ricambi`.`workshops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ricambi`.`workshops` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `business_name` VARCHAR(80) NOT NULL,
  `vat_number` VARCHAR(13) NOT NULL,
  `street_address` VARCHAR(45) NULL,
  `street_number` VARCHAR(20) NULL,
  `city` VARCHAR(50) NULL,
  `province` VARCHAR(2) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `vat_number_UNIQUE` (`vat_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ricambi`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ricambi`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ricambi`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ricambi`.`suppliers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(80) NOT NULL,
  `vat_number` VARCHAR(13) NOT NULL,
  `street_address` VARCHAR(45) NULL,
  `street_number` VARCHAR(20) NULL,
  `city` VARCHAR(50) NULL,
  `province` VARCHAR(2) NULL,
  `phone` VARCHAR(20) NULL,
  `email` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `vat_number_UNIQUE` (`vat_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ricambi`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ricambi`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NOT NULL,
  `sku` VARCHAR(13) NOT NULL,
  `name` VARCHAR(45) NULL,
  `sell_price` DECIMAL(10,2) NULL,
  `description` TEXT NULL,
  `stock_quantity` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `sku_UNIQUE` (`sku` ASC) VISIBLE,
  INDEX `fk_products_categories_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `ricambi`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ricambi`.`product_supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ricambi`.`product_supplier` (
  `product_id` INT NOT NULL,
  `supplier_id` INT NOT NULL,
  `supply_cost` DECIMAL(10,2) NULL,
  PRIMARY KEY (`product_id`, `supplier_id`),
  INDEX `fk_products_has_suppliers_suppliers1_idx` (`supplier_id` ASC) VISIBLE,
  INDEX `fk_products_has_suppliers_products1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_has_suppliers_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `ricambi`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_suppliers_suppliers1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `ricambi`.`suppliers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ricambi`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ricambi`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `workshops_id` INT NOT NULL,
  `order_date` DATE NULL,
  `status` VARCHAR(20) NULL,
  PRIMARY KEY (`id`, `workshops_id`),
  INDEX `fk_orders_workshops1_idx` (`workshops_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_workshops1`
    FOREIGN KEY (`workshops_id`)
    REFERENCES `ricambi`.`workshops` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ricambi`.`order_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ricambi`.`order_item` (
  `orders_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  `quantity` INT NULL,
  `unit_price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`orders_id`, `products_id`),
  INDEX `fk_orders_has_products_products1_idx` (`products_id` ASC) VISIBLE,
  INDEX `fk_orders_has_products_orders1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_has_products_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `ricambi`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_products_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `ricambi`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
