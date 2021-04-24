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
-- Table `mydb`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesor` (
  `idProfesor` INT NOT NULL,
  `NombreProf` VARCHAR(45) NULL,
  `ApellidoProf` VARCHAR(45) NULL,
  `emailProf` VARCHAR(45) NULL,
  `TelfProf` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumnos` (
  `idAlumnos` INT NOT NULL,
  `NombreAlu` VARCHAR(45) NULL,
  `ApellidoAlu` VARCHAR(45) NULL,
  `emailAlu` VARCHAR(45) NULL,
  `TelfAlu` VARCHAR(45) NULL,
  PRIMARY KEY (`idAlumnos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuarios` (
  `idUsuarios` INT NOT NULL,
  `NombreUs` VARCHAR(45) NULL,
  `Profesor_idProfesor` INT NOT NULL,
  `Alumnos_idAlumnos` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fk_Usuarios_Profesor_idx` (`Profesor_idProfesor` ASC) VISIBLE,
  INDEX `fk_Usuarios_Alumnos1_idx` (`Alumnos_idAlumnos` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Profesor`
    FOREIGN KEY (`Profesor_idProfesor`)
    REFERENCES `mydb`.`Profesor` (`idProfesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_Alumnos1`
    FOREIGN KEY (`Alumnos_idAlumnos`)
    REFERENCES `mydb`.`Alumnos` (`idAlumnos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contenido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contenido` (
  `idContenido` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idContenido`),
  INDEX `fk_Contenido_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Contenido_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `mydb`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lecciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lecciones` (
  `idLecciones` INT NOT NULL,
  `NombreLec` VARCHAR(45) NULL,
  `FechaIniLec` DATE NULL,
  PRIMARY KEY (`idLecciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Videos` (
  `idVideos` INT NOT NULL,
  `NombreVideo` VARCHAR(45) NULL,
  `FechaPVideo` VARCHAR(45) NULL,
  `Videoscol` DATE NULL,
  PRIMARY KEY (`idVideos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `idAdministrador` INT NOT NULL,
  `Lecciones_idLecciones` INT NOT NULL,
  `Videos_idVideos` INT NOT NULL,
  `Contenido_idContenido` INT NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  INDEX `fk_Administrador_Lecciones1_idx` (`Lecciones_idLecciones` ASC) VISIBLE,
  INDEX `fk_Administrador_Videos1_idx` (`Videos_idVideos` ASC) VISIBLE,
  INDEX `fk_Administrador_Contenido1_idx` (`Contenido_idContenido` ASC) VISIBLE,
  CONSTRAINT `fk_Administrador_Lecciones1`
    FOREIGN KEY (`Lecciones_idLecciones`)
    REFERENCES `mydb`.`Lecciones` (`idLecciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrador_Videos1`
    FOREIGN KEY (`Videos_idVideos`)
    REFERENCES `mydb`.`Videos` (`idVideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrador_Contenido1`
    FOREIGN KEY (`Contenido_idContenido`)
    REFERENCES `mydb`.`Contenido` (`idContenido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
