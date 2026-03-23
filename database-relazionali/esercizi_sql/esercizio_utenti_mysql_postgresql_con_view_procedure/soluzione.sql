Database
CREATE DATABASE gestione_email_aziendale;
USE gestione_email_aziendale;
🧱 Tabelle
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    ruolo VARCHAR(50),
    attivo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE email_accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    dominio VARCHAR(100),
    attiva BOOLEAN DEFAULT TRUE
);

CREATE TABLE user_emails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    email_id INT,
    principale BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (email_id) REFERENCES email_accounts(id)
);

CREATE TABLE access_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    data_accesso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
📥 INSERT
INSERT INTO users (nome, cognome, ruolo) VALUES
('Mario', 'Rossi', 'Admin'),
('Luigi', 'Verdi', 'Dipendente'),
('Anna', 'Bianchi', 'Manager');

INSERT INTO email_accounts (email, dominio) VALUES
('mario.rossi@azienda.it', 'azienda.it'),
('luigi.verdi@azienda.it', 'azienda.it'),
('anna.bianchi@azienda.it', 'azienda.it');

INSERT INTO user_emails (user_id, email_id, principale) VALUES
(1,1,TRUE),
(2,2,TRUE),
(3,3,TRUE);
🔍 SELECT
SELECT * FROM users;

SELECT nome, cognome FROM users WHERE attivo = TRUE;

SELECT * FROM email_accounts;
🔗 JOIN
SELECT u.nome, u.cognome, e.email
FROM users u
JOIN user_emails ue ON u.id = ue.user_id
JOIN email_accounts e ON ue.email_id = e.id;
SELECT u.nome, e.email
FROM users u
JOIN user_emails ue ON u.id = ue.user_id
JOIN email_accounts e ON ue.email_id = e.id
WHERE ue.principale = TRUE;
🧠 Query avanzate
SELECT u.*
FROM users u
LEFT JOIN user_emails ue ON u.id = ue.user_id
WHERE ue.id IS NULL;
SELECT u.nome, COUNT(ue.email_id) AS totale_email
FROM users u
LEFT JOIN user_emails ue ON u.id = ue.user_id
GROUP BY u.id;
SELECT u.nome, COUNT(*) as num_email
FROM users u
JOIN user_emails ue ON u.id = ue.user_id
GROUP BY u.id
HAVING COUNT(*) > 1;
✏️ UPDATE
UPDATE users
SET ruolo = 'Super Admin'
WHERE id = 1;
❌ DELETE
DELETE FROM user_emails WHERE user_id = 2;
👁️ VIEW
CREATE VIEW vista_utenti_email AS
SELECT u.nome, u.cognome, e.email, ue.principale
FROM users u
JOIN user_emails ue ON u.id = ue.user_id
JOIN email_accounts e ON ue.email_id = e.id;
🔄 TRANSACTION
START TRANSACTION;

INSERT INTO users (nome, cognome, ruolo)
VALUES ('Paolo', 'Neri', 'Dipendente');

SET @user_id = LAST_INSERT_ID();

INSERT INTO email_accounts (email, dominio)
VALUES ('paolo.neri@azienda.it', 'azienda.it');

SET @email_id = LAST_INSERT_ID();

INSERT INTO user_emails (user_id, email_id, principale)
VALUES (@user_id, @email_id, TRUE);

COMMIT;

🔥 BONUS
SELECT u.*
FROM users u
LEFT JOIN access_logs a ON u.id = a.user_id
WHERE a.id IS NULL;
CREATE VIEW vista_completa AS
SELECT 
    u.nome,
    u.cognome,
    e.email,
    COUNT(a.id) AS accessi
FROM users u
JOIN user_emails ue ON u.id = ue.user_id AND ue.principale = TRUE
JOIN email_accounts e ON ue.email_id = e.id
LEFT JOIN access_logs a ON u.id = a.user_id
GROUP BY u.id;