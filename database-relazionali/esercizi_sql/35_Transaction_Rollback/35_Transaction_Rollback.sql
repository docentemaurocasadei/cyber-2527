USE gestione_corsi;

-- Transazione semplice con commit
START TRANSACTION;
  -- Elimina una certificazione obsoleta
  DELETE FROM certificazioni WHERE id = 1;
ROLLBACK;