-- -----------------------------------------------------
-- Schema cinema
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cinema` ;


-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cinema` DEFAULT CHARACTER SET utf8 ;
USE `cinema` ;

-- -----------------------------------------------------
-- Table `cinema`.`cinema`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinema`.`cinema` ;

CREATE TABLE IF NOT EXISTS `cinema`.`cinema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`films`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinema`.`films` ;

CREATE TABLE IF NOT EXISTS `cinema`.`films` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `duration` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`film_session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinema`.`film_session` ;

CREATE TABLE IF NOT EXISTS `cinema`.`film_session` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `time` TIME NOT NULL,
  `cinema_id` INT unsigned NOT NULL,
  `films_id` INT unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_film_session_cinema`
    FOREIGN KEY (`cinema_id`)
    REFERENCES `cinema`.`cinema` (`id`),
  CONSTRAINT `fk_film_session_films1`
    FOREIGN KEY (`films_id`)
    REFERENCES `cinema`.`films` (`id`)
    )
ENGINE = InnoDB;

CREATE INDEX `fk_film_session_cinema_idx` ON `cinema`.`film_session` (`cinema_id` ASC) VISIBLE;

CREATE INDEX `fk_film_session_films1_idx` ON `cinema`.`film_session` (`films_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cinema`.`tickets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinema`.`tickets` ;

CREATE TABLE IF NOT EXISTS `cinema`.`tickets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinema`.`film_session_has_tickets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cinema`.`film_session_has_tickets` ;

CREATE TABLE IF NOT EXISTS `cinema`.`film_session_has_tickets` (
  `film_session_id` INT unsigned NOT NULL,
  `tickets_id` INT unsigned NOT NULL,
  PRIMARY KEY (`film_session_id`, `tickets_id`),
  CONSTRAINT `fk_film_session_has_tickets_film_session1`
    FOREIGN KEY (`film_session_id`)
    REFERENCES `cinema`.`film_session` (`id`),
  CONSTRAINT `fk_film_session_has_tickets_tickets1`
    FOREIGN KEY (`tickets_id`)
    REFERENCES `cinema`.`tickets` (`id`))
ENGINE = InnoDB;

CREATE INDEX `fk_film_session_has_tickets_tickets1_idx` ON `cinema`.`film_session_has_tickets` (`tickets_id` ASC) VISIBLE;

CREATE INDEX `fk_film_session_has_tickets_film_session1_idx` ON `cinema`.`film_session_has_tickets` (`film_session_id` ASC) VISIBLE;
