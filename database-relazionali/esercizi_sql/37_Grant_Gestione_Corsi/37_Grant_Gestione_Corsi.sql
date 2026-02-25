USE gestione_corsi;

-- Concedi a un utente (es. 'user_corso') i privilegi di SELECT, INSERT e UPDATE su tutte le tabelle del database
GRANT SELECT, INSERT, UPDATE ON gestione_corsi.* TO 'user_corso'@'localhost';
FLUSH PRIVILEGES;