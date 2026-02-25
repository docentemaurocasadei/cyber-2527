-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fioraio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fioraio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fioraio` DEFAULT CHARACTER SET utf8 ;
USE `fioraio` ;

-- -----------------------------------------------------
-- Table `fioraio`.`clienti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fioraio`.`clienti` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NULL,
  `cognome` VARCHAR(30) NULL COMMENT 'è il cognome del cliente',
  `indirizzo` VARCHAR(50) NULL,
  `telefono` VARCHAR(20) NULL,
  `localita` VARCHAR(40) NULL,
  `codice_fiscale` CHAR(16) NULL,
  `email` TINYTEXT NULL,
  `data_di_nascita` DATE NULL,
  PRIMARY KEY (`cliente_id`),
  INDEX `telefono_idx` () VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fioraio`.`fiori`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fioraio`.`fiori` (
  `fiore_id` INT NOT NULL AUTO_INCREMENT,
  `famiglia` VARCHAR(50) NULL COMMENT 'meglio una relazione esterna?',
  `nome` VARCHAR(30) NOT NULL,
  `prezzo` DECIMAL(12,2) NULL DEFAULT 0.00,
  `giacenza` INT NULL DEFAULT 0,
  PRIMARY KEY (`fiore_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fioraio`.`ordini`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fioraio`.`ordini` (
  `ordine_id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `data` DATE NULL,
  `totale` DECIMAL(12,2) NULL DEFAULT 0.00,
  `stato_pagamento` ENUM('sospeso', 'rifiutato', 'concluso') NULL DEFAULT 'sospeso',
  `stato_spedizione` ENUM('spedito', 'da spedire', 'reso') NULL DEFAULT 'da spedire',
  PRIMARY KEY (`ordine_id`),
  INDEX `fk_ordini_clienti_idx` (`cliente_id` ASC) VISIBLE,
  CONSTRAINT `fk_ordini_clienti`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `fioraio`.`clienti` (`cliente_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fioraio`.`dettaglio_ordini`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fioraio`.`dettaglio_ordini` (
  `ordine_id` INT NOT NULL,
  `fiore_id` INT NOT NULL,
  `quantita` INT NULL DEFAULT 0,
  PRIMARY KEY (`ordine_id`, `fiore_id`),
  INDEX `fk_dettaglio_ordini_fiori1_idx` (`fiore_id` ASC) VISIBLE,
  INDEX `fk_dettaglio_ordini_ordini1_idx` (`ordine_id` ASC) VISIBLE,
  CONSTRAINT `fk_dettaglio_ordini_ordini1`
    FOREIGN KEY (`ordine_id`)
    REFERENCES `fioraio`.`ordini` (`ordine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dettaglio_ordini_fiori1`
    FOREIGN KEY (`fiore_id`)
    REFERENCES `fioraio`.`fiori` (`fiore_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
