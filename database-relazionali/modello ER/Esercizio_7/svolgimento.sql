### Soluzione: Progettazione Database per un Evento Musicale

### Diagramma ER

-- 1. eventi (evento_id, nome_evento, data_evento, luogo)
-- 2. gruppi_musicali (gruppo_id, nome_gruppo, contatto)
-- 3. generi_musicali (genere_id, nome_genere)
-- 4. palinsesti (palinsesto_id, evento_id, gruppo_id, orario_inizio, orario_fine)
-- 5. appartenenze_generi (gruppo_id, genere_id)

### Struttura del Database (DDL)

CREATE TABLE eventi (
    evento_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_evento VARCHAR(100),
    data_evento DATE,
    luogo VARCHAR(100)
);

CREATE TABLE gruppi_musicali (
    gruppo_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_gruppo VARCHAR(100),
    contatto VARCHAR(100)
);

CREATE TABLE generi_musicali (
    genere_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_genere VARCHAR(50)
);

CREATE TABLE palinsesti (
    palinsesto_id INT PRIMARY KEY AUTO_INCREMENT,
    evento_id INT,
    gruppo_id INT,
    orario_inizio TIME,
    orario_fine TIME,
    FOREIGN KEY (evento_id) REFERENCES eventi(evento_id),
    FOREIGN KEY (gruppo_id) REFERENCES gruppi_musicali(gruppo_id)
);

CREATE TABLE appartenenze_generi (
    gruppo_id INT,
    genere_id INT,
    PRIMARY KEY (gruppo_id, genere_id),
    FOREIGN KEY (gruppo_id) REFERENCES gruppi_musicali(gruppo_id),
    FOREIGN KEY (genere_id) REFERENCES generi_musicali(genere_id)
);

### Popolamento del Database (DML)

INSERT INTO eventi (nome_evento, data_evento, luogo) VALUES ('Festival Rock', '2025-06-20', 'Parco Centrale');

INSERT INTO gruppi_musicali (nome_gruppo, contatto) VALUES ('The Rockers', 'rockers@example.com');
INSERT INTO gruppi_musicali (nome_gruppo, contatto) VALUES ('Jazz Fusion', 'jazzfusion@example.com');

INSERT INTO generi_musicali (nome_genere) VALUES ('Rock');
INSERT INTO generi_musicali (nome_genere) VALUES ('Jazz');

INSERT INTO appartenenze_generi (gruppo_id, genere_id) VALUES (1, 1);
INSERT INTO appartenenze_generi (gruppo_id, genere_id) VALUES (2, 2);

INSERT INTO palinsesti (evento_id, gruppo_id, orario_inizio, orario_fine) VALUES (1, 1, '18:00:00', '19:30:00');
INSERT INTO palinsesti (evento_id, gruppo_id, orario_inizio, orario_fine) VALUES (1, 2, '20:00:00', '21:30:00');

### Query di Interrogazione

-- Chi contattare per un gruppo specifico:
SELECT nome_gruppo, contatto 
FROM gruppi_musicali 
WHERE nome_gruppo = 'The Rockers';

-- Chi suona in un determinato orario:
SELECT gm.nome_gruppo, p.orario_inizio, p.orario_fine 
FROM palinsesti p
JOIN gruppi_musicali gm ON p.gruppo_id = gm.gruppo_id
WHERE '19:00:00' BETWEEN p.orario_inizio AND p.orario_fine;

-- Elenco dei gruppi con il relativo genere musicale:
SELECT gm.nome_gruppo, g.nome_genere
FROM gruppi_musicali gm
JOIN appartenenze_generi ag ON gm.gruppo_id = ag.gruppo_id
JOIN generi_musicali g ON ag.genere_id = g.genere_id;

-- Trovare l'orario di esibizione di un gruppo specifico:
SELECT p.orario_inizio, p.orario_fine
FROM palinsesti p
JOIN gruppi_musicali gm ON p.gruppo_id = gm.gruppo_id
WHERE gm.nome_gruppo = 'Jazz Fusion';

