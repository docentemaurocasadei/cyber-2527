USE gestione_corsi;
DELIMITER $$

-- Stored procedure che calcola quanti corsi ha frequentato un corsista dato il suo id
CREATE PROCEDURE sp_conta_corsi (IN p_corsista_id INT, OUT p_count INT)
BEGIN
    SELECT COUNT(*) INTO p_count
    FROM corsi_frequentati
    WHERE corsista_id = p_corsista_id;
END$$

DELIMITER ;

-- Esempio di utilizzo della stored procedure
CALL gestione_corsi.sp_conta_corsi(1, @p_count);
SELECT @p_count;
