USE gestione_corsi;

-- Creazione di una tabella log per registrare le modifiche apportate alla tabella 'corsisti'
CREATE TABLE log_corsisti_modifiche (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_modifica DATETIME NOT NULL DEFAULT NOW(),
    tabella VARCHAR(50) NOT NULL,
    record_id INT NOT NULL,
    operazione VARCHAR(10) NOT NULL
);

DELIMITER $$

-- Trigger che si attiva dopo ogni UPDATE sulla tabella 'corsisti'
CREATE TRIGGER trg_log_corsisti_update
AFTER UPDATE ON corsisti
FOR EACH ROW
BEGIN
    INSERT INTO log_corsisti_modifiche (data_modifica, tabella, record_id, operazione)
    VALUES (NOW(), 'corsisti', NEW.id, 'UPDATE');
END$$

DELIMITER ;

-- Esempio di utilizzo del trigger
UPDATE corsisti SET nome = 'Luigi' WHERE id = 1;