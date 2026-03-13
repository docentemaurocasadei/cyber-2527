CREATE TABLE `gestione_corsi`.`corsi_docenti` (
  `corso_id` INT NOT NULL,
  `docente_id` INT NOT NULL,
  PRIMARY KEY (`corso_id`, `docente_id`),
  INDEX `fk_docenti_docente_id_idx` (`docente_id` ASC) VISIBLE,
  CONSTRAINT `fk_corsi_corso_id`
    FOREIGN KEY (`corso_id`)
    REFERENCES `gestione_corsi`.`corsi` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_docenti_docente_id`
    FOREIGN KEY (`docente_id`)
    REFERENCES `gestione_corsi`.`docenti` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `gestione_corsi`.`corsi` 
ADD COLUMN `certificazione_id` INT NULL AFTER `data_fine`,
ADD INDEX `fk_certificazioni_certificazione_id_idx` (`certificazione_id` ASC) VISIBLE;
;
ALTER TABLE `gestione_corsi`.`corsi` 
ADD CONSTRAINT `fk_certificazioni_certificazione_id`
  FOREIGN KEY (`certificazione_id`)
  REFERENCES `gestione_corsi`.`certificazioni` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

  ALTER TABLE `gestione_corsi`.`corsi` 
ADD COLUMN `aula_id` INT NULL AFTER `certificazione_id`,
ADD INDEX `fk_aule_aula_id` (`aula_id` ASC) VISIBLE;
;
ALTER TABLE `gestione_corsi`.`corsi` 
ADD CONSTRAINT `fk_aule_aula_id`
  FOREIGN KEY (`aula_id`)
  REFERENCES `gestione_corsi`.`aule` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

