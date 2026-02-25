USE gestione_corsi;

-- Concedi inoltre il privilegio di DELETE su una specifica tabella, ad esempio 'corsisti'
GRANT DELETE ON gestione_corsi.corsisti TO 'user_corso'@'localhost';
FLUSH PRIVILEGES;