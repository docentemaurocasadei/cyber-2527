USE gestione_corsi;

-- Seleziona corsisti che hanno frequentato più di 1 corso
SELECT * 
FROM corsisti 
WHERE NOT (nome = 'Mario');