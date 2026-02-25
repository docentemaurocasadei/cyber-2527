USE gestione_corsi;
DELIMITER $$

-- Funzione che ritorna il nome completo (cognome + nome) del corsista in maiuscolo
CREATE FUNCTION fn_nome_completo (p_corsista_id INT) RETURNS VARCHAR(150)
DETERMINISTIC
BEGIN
    DECLARE nome_comp VARCHAR(150);
    SELECT UPPER(CONCAT(cognome, ' ', nome))
      INTO nome_comp
    FROM corsisti
    WHERE id = p_corsista_id;
    RETURN nome_comp;
END$$

DELIMITER ;
