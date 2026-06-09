-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CLIENTE` (
  `id_CLIENTE` INT NOT NULL AUTO_INCREMENT,
  `nome_cliente` VARCHAR(45) NOT NULL,
  `endereco_cliente` VARCHAR(45) NOT NULL,
  `altura_cliente` FLOAT NULL,
  PRIMARY KEY (`id_CLIENTE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ESPECIALIDADE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ESPECIALIDADE` (
  `id_ESPECIALIDADE` INT NOT NULL AUTO_INCREMENT,
  `nome_especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_ESPECIALIDADE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEDICO` (
  `id_MEDICO` INT NOT NULL AUTO_INCREMENT,
  `nome_medico` VARCHAR(45) NOT NULL,
  `crm_medico` VARCHAR(45) NOT NULL,
  `altura_medico` FLOAT NULL,
  `ESPECIALIDADE_id_ESPECIALIDADE` INT NOT NULL,
  PRIMARY KEY (`id_MEDICO`),
  INDEX `fk_MEDICO_ESPECIALIDADE1_idx` (`ESPECIALIDADE_id_ESPECIALIDADE` ASC) VISIBLE,
  CONSTRAINT `fk_MEDICO_ESPECIALIDADE1`
    FOREIGN KEY (`ESPECIALIDADE_id_ESPECIALIDADE`)
    REFERENCES `mydb`.`ESPECIALIDADE` (`id_ESPECIALIDADE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONSULTA` (
  `MEDICO_id_MEDICO` INT NOT NULL,
  `CLIENTE_id_CLIENTE` INT NOT NULL,
  `id_consulta` INT NOT NULL AUTO_INCREMENT,
  INDEX `fk_CLIENTE_has_MEDICO_MEDICO1_idx` (`MEDICO_id_MEDICO` ASC) VISIBLE,
  INDEX `fk_CLIENTE_has_MEDICO_CLIENTE_idx` (`CLIENTE_id_CLIENTE` ASC) VISIBLE,
  PRIMARY KEY (`id_consulta`),
  CONSTRAINT `fk_CLIENTE_has_MEDICO_CLIENTE`
    FOREIGN KEY (`CLIENTE_id_CLIENTE`)
    REFERENCES `mydb`.`CLIENTE` (`id_CLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_has_MEDICO_MEDICO1`
    FOREIGN KEY (`MEDICO_id_MEDICO`)
    REFERENCES `mydb`.`MEDICO` (`id_MEDICO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIPO_ESPECIALIDADE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIPO_ESPECIALIDADE` (
  `id_TIPO_ESPECIALIDADE` INT NOT NULL AUTO_INCREMENT,
  `nome_tipo_especialidade` VARCHAR(45) NOT NULL,
  `ESPECIALIDADE_id_ESPECIALIDADE` INT NOT NULL,
  PRIMARY KEY (`id_TIPO_ESPECIALIDADE`),
  INDEX `fk_TIPO_ESPECIALIDADE_ESPECIALIDADE1_idx` (`ESPECIALIDADE_id_ESPECIALIDADE` ASC) VISIBLE,
  UNIQUE INDEX `ESPECIALIDADE_id_ESPECIALIDADE_UNIQUE` (`ESPECIALIDADE_id_ESPECIALIDADE` ASC) VISIBLE,
  CONSTRAINT `fk_TIPO_ESPECIALIDADE_ESPECIALIDADE1`
    FOREIGN KEY (`ESPECIALIDADE_id_ESPECIALIDADE`)
    REFERENCES `mydb`.`ESPECIALIDADE` (`id_ESPECIALIDADE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
