USE gestione_corsi;

-- Transazione con commit e rollback
START TRANSACTION;
  -- Aggiorna il costo del corso con id = 3
  UPDATE corsi 
  SET costo = costo * 1.05 
  WHERE id = 3;

COMMIT;