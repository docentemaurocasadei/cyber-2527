select count(*) into @numero_corsisti from corsisti;
select @numero_corsisti;

#creare una stored procedure calcola_iva 
# in: costo_corso, aliquota_corso
# out: costo_corso_ivato
DELIMITER //
CREATE PROCEDURE calcola_iva (
    IN costo_corso DECIMAL(10,2),
    IN aliquota_corso DECIMAL(5,2), 
    OUT costo_corso_ivato DECIMAL(10,2))
BEGIN
    SET costo_corso_ivato = costo_corso + (costo_corso * aliquota_corso / 100);
END //
DELIMITER ;

CALL calcola_iva(100.00, 22.00, @costo_corso_ivato);

# creare una function calcola_costo_ivato che prende in input 
costo_corso e aliquota_corso e restituisce il costo ivato
#per comodità il nume della funzione inizierà con "fun_" per indicare che è una function
DELIMITER //
CREATE FUNCTION fun_calcola_costo_ivato (
    costo_corso DECIMAL(10,2),
    aliquota_corso DECIMAL(5,2)
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN costo_corso + (costo_corso * aliquota_corso / 100);
END //
DELIMITER ;
SELECT nome, costo,
 fun_calcola_costo_ivato(costo, 22.00) as costo_ivato from corsi;

#CREARE UNA TABELLA di log per tenere traccia delle operazioni
i campi della tabella saranno: 
nome tabella: log_operazioni
id INT AUTO_INCREMENT PRIMARY KEY, 
tipo_operazione VARCHAR(50), 
data_operazione DATETIME,
tabella_coinvolta VARCHAR(50),
id_record_coinvolto INT

CREATE TABLE log_operazioni (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_operazione VARCHAR(50),
    data_operazione DATETIME,
    tabella_coinvolta VARCHAR(50),
    id_record_coinvolto INT
);

DELIMITER //
CREATE TRIGGER trg_after_corso_insert
AFTER INSERT ON corsi
FOR EACH ROW
BEGIN
    INSERT INTO log_operazioni (
        tipo_operazione, 
        data_operazione, 
        tabella_coinvolta, 
        id_record_coinvolto)
    VALUES (
        'INSERT',
        NOW(), 
        'corsi', 
        NEW.id);
END//

CREATE TRIGGER trg_after_corsista_insert
AFTER INSERT ON corsisti    
FOR EACH ROW
BEGIN   
    INSERT INTO log_operazioni (tipo_operazione, data_operazione, tabella_coinvolta, id_record_coinvolto)    
    VALUES ('INSERT', NOW(), 'corsisti', NEW.id); 
END//

DELIMITER ;
INSERT INTO corsi (nome, durata_ore, costo, data_inizio) 
VALUES ('Corso SQL Avanzato', 20, 200.00, '2026-03-01');
INSERT INTO corsisti (nome, cognome, data_nascita, email) 
VALUES ('Luca', 'Bianchi', '1990-03-15', 'luca.bianchi@example.com');
SELECT * FROM log_operazioni;


