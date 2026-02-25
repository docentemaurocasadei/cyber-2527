📚 Esercizio Completo sul Database Corsi
L'obiettivo è creare una base dati per la gestione di un catalogo di corsi e corsisti, e poi usare le funzioni MySQL per calcoli e aggregazioni.

1. 🏗️ DDL (Data Definition Language)
Ecco le istruzioni per creare il database e le tabelle, con le chiavi primarie e foreign key necessarie.

SQL

-- Creazione del Database (opzionale, se non esiste)
CREATE DATABASE IF NOT EXISTS GestioneCorsi;
USE GestioneCorsi;

-- Tabella UnitaFormative (Contenitori dei Moduli)
CREATE TABLE `unita_formative` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL UNIQUE
);

-- Tabella Corsisti
CREATE TABLE `corsisti` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(50) NOT NULL,
  `cognome` VARCHAR(50) NOT NULL,
  `codice_fiscale` CHAR(16) NOT NULL UNIQUE,
  `data_di_nascita` DATE,
  `email` VARCHAR(100) UNIQUE,
  `telefono` VARCHAR(20),
  `indirizzo_residenza` VARCHAR(150),
  `localita_residenza` VARCHAR(100),
  `provincia_residenza` CHAR(2),
  `cap_residenza` CHAR(5),
  `genere` ENUM('M', 'F')
);

-- Tabella Moduli (con l'aggiunta di costo_orario come richiesto)
CREATE TABLE `moduli` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `unita_formativa_id` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `numero_ore` INT NOT NULL,
  `costo_orario` DECIMAL(5, 2) NOT NULL, -- Aggiunto il costo orario
  FOREIGN KEY (`unita_formativa_id`) REFERENCES `unita_formative`(`id`)
);

-- Tabella Iscrizioni (Relazione Molti-a-Molti tra Corsisti e Moduli)
CREATE TABLE `iscrizioni` (
  `corsista_id` INT NOT NULL,
  `modulo_id` INT NOT NULL,
  PRIMARY KEY (`corsista_id`, `modulo_id`),
  FOREIGN KEY (`corsista_id`) REFERENCES `corsisti`(`id`),
  FOREIGN KEY (`modulo_id`) REFERENCES `moduli`(`id`)
);
2. 📝 INSERT (Data Manipulation Language)
Qui inseriamo i dati, inclusi quelli che hai fornito, e aggiungiamo il campo costo_orario nella tabella moduli.

SQL

-- Inserimento Unità Formative
INSERT INTO `unita_formative` (`id`, `nome`) VALUES
(1, 'Database e SQL'),
(2, 'Web Development'),
(3, 'Soft Skills');

-- Inserimento Corsisti
INSERT INTO `corsisti` (`nome`, `cognome`, `codice_fiscale`, `data_di_nascita`, `email`, `telefono`, `indirizzo_residenza`, `localita_residenza`, `provincia_residenza`, `cap_residenza`, `genere`) VALUES
('Laura', 'Esposito', 'ESPLRA85A01F205H', '1985-01-01', 'laura.esposito@mail.it', '3331112233', 'Via Roma 10', 'Milano', 'MI', '20121', 'F'),
('Marco', 'Rizzo', 'RZZMRC78H23A794T', '1978-08-23', 'marco.rizzo@mail.it', '3334445566', 'Piazza Italia 5', 'Torino', 'TO', '10123', 'M'),
('Giulia', 'Conti', 'CNTGLI95D15H501K', '1995-04-15', 'giulia.conti@mail.it', '3337778899', 'Corso Francia 30', 'Napoli', 'NA', '80121', 'F'),
('Andrea', 'Gallo', 'GLLNDR80T01B157A', '1980-12-01', 'andrea.gallo@mail.it', '3330001122', 'Viale Trieste 8', 'Bari', 'BA', '70121', 'M'),
('Sara', 'Ferrari', 'FRRSRA98R10L219S', '1998-10-10', 'sara.ferrari@mail.it', '3333334455', 'Via Milano 22', 'Roma', 'RM', '00100', 'F');

-- Inserimento Moduli (con costo_orario aggiunto: es. 30€/h, 45€/h, 25€/h)
INSERT INTO `moduli` (`unita_formativa_id`, `nome`, `numero_ore`, `costo_orario`) VALUES
(1, 'Introduzione a SQL', 20, 30.00),
(1, 'Database Avanzati', 35, 45.00),
(2, 'Programmazione Web Base', 40, 35.00),
(3, 'Gestione Progetto', 15, 25.00),
(2, 'Sviluppo Frontend', 50, 40.00);

-- Inserimento Iscrizioni
INSERT INTO `iscrizioni` (`corsista_id`, `modulo_id`) VALUES
(1, 1), -- Laura - Introduzione a SQL
(1, 3), -- Laura - Programmazione Web Base
(2, 1), -- Marco - Introduzione a SQL
(2, 2), -- Marco - Database Avanzati
(3, 4), -- Giulia - Gestione Progetto
(4, 2), -- Andrea - Database Avanzati
(4, 5), -- Andrea - Sviluppo Frontend
(5, 3), -- Sara - Programmazione Web Base
(5, 4); -- Sara - Gestione Progetto
3. 🎯 Esercizi Richiesti
Testo dell'Esercizio
Calcolo Lezioni e Assenze: Considerato che tutte le lezioni hanno una durata fissa di 3 ore e che l'assenza massima consentita è del 20% delle ore totali del modulo, genera una lista contenente il Nome del Modulo, il Numero di Lezioni (arrotondato per eccesso) e le Ore Massime di Assenza (arrotondate per difetto).

Costo Totale del Modulo: Genera una lista contenente il Nome del Modulo, il Numero di Ore e il Costo Totale (ottenuto da numero_ore * costo_orario).

Corsisti e Moduli Totali: Visualizza la lista dei Corsisti (Nome e Cognome) e per ognuno il Numero Totale di Moduli a cui è iscritto.

4. ✅ Soluzione con Funzioni MySQL
Soluzione Esercizio 1: Calcolo Lezioni e Assenze (Uso di CEIL e FLOOR)
Per il numero di lezioni, usiamo la funzione CEIL() (Ceiling) per arrotondare per eccesso, assicurando che l'ultima lezione sia sempre inclusa anche se non completa. Per le ore di assenza, usiamo la funzione FLOOR() per arrotondare per difetto.

SQL

SELECT
    nome,
    -- (numero_ore / 3) arrotondato per eccesso
    CEIL(numero_ore / 3) AS numero_lezioni,
    -- (numero_ore * 0.20) arrotondato per difetto
    FLOOR(numero_ore * 0.20) AS max_ore_assenza
FROM
    moduli;
Soluzione Esercizio 2: Costo Totale del Modulo (Uso di Funzioni Aritmetiche)
Utilizziamo una semplice moltiplicazione (*) per il calcolo del costo.

SQL

SELECT
    nome,
    numero_ore,
    costo_orario,
    -- Moltiplicazione diretta
    (numero_ore * costo_orario) AS costo_totale
FROM
    moduli;
Soluzione Esercizio 3: Corsisti e Moduli Totali (Uso di COUNT e JOIN)
Usiamo la funzione di aggregazione COUNT() e la clausola GROUP BY per contare i moduli per ogni corsista.

SQL

SELECT
    c.nome,
    c.cognome,
    -- Conteggio delle iscrizioni raggruppate per corsista
    COUNT(i.modulo_id) AS numero_moduli_totali
FROM
    corsisti AS c
INNER JOIN
    iscrizioni AS i ON c.id = i.corsista_id
GROUP BY
    c.id, c.nome, c.cognome
ORDER BY
    c.cognome;