USE gestione_corsi;

-- Revoca il privilegio di INSERT sulla tabella 'corsisti' per lo stesso utente
REVOKE INSERT ON gestione_corsi.corsisti FROM 'user_corso'@'localhost';
FLUSH PRIVILEGES;