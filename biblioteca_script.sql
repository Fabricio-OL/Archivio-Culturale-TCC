-- MySQL Script generated by MySQL Workbench
-- Mon May 27 19:29:48 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`Autor` (
  `idAutor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `end` VARCHAR(100) NOT NULL,
  `dn` DATE NOT NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `biblioteca`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`Livro` (
  `idLivro` INT NOT NULL AUTO_INCREMENT,
  `isbn` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLivro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `biblioteca`.`Autor_Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`Autor_Livro` (
  `idAutor` INT NOT NULL,
  `idLivro` INT NOT NULL,
  PRIMARY KEY (`idAutor`, `idLivro`),
  INDEX `fk_Autor_has_Livro_Livro1_idx` (`idLivro` ASC) VISIBLE,
  INDEX `fk_Autor_has_Livro_Autor1_idx` (`idAutor` ASC) VISIBLE,
  CONSTRAINT `fk_Autor_has_Livro_Autor1`
    FOREIGN KEY (`idAutor`)
    REFERENCES `biblioteca`.`Autor` (`idAutor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Autor_has_Livro_Livro1`
    FOREIGN KEY (`idLivro`)
    REFERENCES `biblioteca`.`Livro` (`idLivro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `biblioteca`.`Bibliotecario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`Bibliotecario` (
  `idBibliotecario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `dn` DATE NOT NULL,
  `end` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idBibliotecario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `biblioteca`.`Editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`Editora` (
  `idEditora` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `end` VARCHAR(100) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `Livro_idLivro` INT NOT NULL,
  PRIMARY KEY (`idEditora`),
  INDEX `fk_Editora_Livro1_idx` (`Livro_idLivro` ASC) VISIBLE,
  CONSTRAINT `fk_Editora_Livro1`
    FOREIGN KEY (`Livro_idLivro`)
    REFERENCES `biblioteca`.`Livro` (`idLivro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `biblioteca`.`Leitor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`Leitor` (
  `idLeitor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `dn` DATE NOT NULL,
  `end` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idLeitor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `biblioteca`.`Emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`Emprestimo` (
  `idEmp` INT NOT NULL AUTO_INCREMENT,
  `dataEmp` DATE NOT NULL,
  `dataDev` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `Leitor_idLeitor` INT NOT NULL,
  `condicao` VARCHAR(45) NOT NULL,
  `Livro_idLivro` INT NOT NULL,
  `Bibliotecario_idBibliotecario` INT NOT NULL,
  PRIMARY KEY (`idEmp`),
  INDEX `fk_Emprestimo_Leitor1_idx` (`Leitor_idLeitor` ASC) VISIBLE,
  INDEX `fk_Emprestimo_Livro1_idx` (`Livro_idLivro` ASC) VISIBLE,
  INDEX `fk_Emprestimo_Bibliotecario1_idx` (`Bibliotecario_idBibliotecario` ASC) VISIBLE,
  CONSTRAINT `fk_Emprestimo_Leitor1`
    FOREIGN KEY (`Leitor_idLeitor`)
    REFERENCES `biblioteca`.`Leitor` (`idLeitor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Emprestimo_Livro1`
    FOREIGN KEY (`Livro_idLivro`)
    REFERENCES `biblioteca`.`Livro` (`idLivro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Emprestimo_Bibliotecario1`
    FOREIGN KEY (`Bibliotecario_idBibliotecario`)
    REFERENCES `biblioteca`.`Bibliotecario` (`idBibliotecario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
