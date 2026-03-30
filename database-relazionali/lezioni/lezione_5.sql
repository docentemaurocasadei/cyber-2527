SELECT nome, IF(durata_ore>50,'lungo','breve') FROM gestione_corsi.corsi;

{"nome": "Mario","cognome": "Rossi","email": "mariorossi@gmail.com" }

SELECT JSON_OBJECT('nome', nome, 'durata', durata_ore, 'costo', costo) from corsi where costo > 300;

[
    {"nome": "mysql", "costo": 350.00, "durata": 50},
    {"nome": "python", "costo": 420.00, "durata": 80},
    {"nome": "javascript", "costo": 580.00, "durata": 75}
]

SELECT JSON_EXTRACT('{"nome": "Mario","cognome": "Rossi","email": "mariorossi@gmail.com" }',
'$.nome') as nome;

SELECT JSON_EXTRACT('{
    "cliente":{"nome": "Mario","cognome": "Rossi","email": "mariorossi@gmail.com" }, 
    "fornitore":{"nome": "Giuseppe","cognome": "Bianchi","email": "giuseppebianchi@gmail.com" }
    }',
'$.fornitore.nome') as nome;


SELECT JSON_UNQUOTE(JSON_EXTRACT('{"cliente":{"nome": "Mario","cognome": "Rossi","email": "mariorossi@gmail.com" }, "fornitore":{"nome": "Giuseppe","cognome": "Bianchi","email": "giuseppebianchi@gmail.com" }}',
'$.fornitore.nome')) as nome;

#MYSQL FUNCTIONS TESTI
SELECT upper(nome) as u_nome, lower(descrizione) as l_descrizione from corsi;

SELECT trim(' excel è un tool ') as testo_trimmato, ' excel è un tool ';

#REGEX
SELECT REGEXP_LIKE('mag/124','\w{3}\/\d{1,}') as codice_corretto

SELECT REGEXP_LIKE('MAG/124','\\w{3}\/\\d{1,}') as codice_corretto

\\= backslashes si raddoppia

SELECT nome,cognome from corsisti where REGEXP_LIKE(email, '\\w{1,}@\\w{1,}.\\w{2,}')=0;

select user();
select database();
select version();

#order by
select * from corsi order by durata_ore asc, costo desc

#union
select nome from corsisti
union
select nome from docenti

insert into docenti (nome,cognome, data_assunzione, stipendio) values ('Anna', 'Franchini', '2020-05-01', 1200.00);

#having
select corsista_id, nome, cognome, count(*) as numero_corsi from corsi_frequentati 
JOIN corsisti on corsisti.id = corsi_frequentati.corsista_id
group by corsista_id, nome, cognome having numero_corsi >3

#subquery
select nome from corsi join corsi_frequentati on corsi.id= corsi_frequentati.corso_id
where corsi_frequentati.corsista_id IN (
SELECT id FROM gestione_corsi.corsisti where provincia='PU'
)

#estrarre tutti i corsisti che non hanno frequentato alcun corso iniziato nel 2024
select nome,cognome from corsisti where NOT EXIST (
    select 1 from corsi_frequentati where data_inizio between '2024-01-01' and '2024-12-31' and corsisti.id = corsi_frequentati.corsista_id
)

#limit: estrae i 3 corsisti più giovani
SELECT * FROM gestione_corsi.corsisti order by data_nascita desc limit 3;

#cast
select IF(cast('150.00' as decimal(8,2)) > 95,'maggiore','minore');
select IF('150.00' > '95','maggiore','minore');

#delete e update
delete from aule;

update aule set capienza = capienza + 5 where id > 0;

#GRANT
GRANT select,insert on gestione_corsi.corsisti to 'root'@'localhost';   

#transaction

start transaction;
update aule set capienza = capienza + 5 where id > 0;
#verifica che l'utente abbia confermato la mail
#verifica che il pagamento sia andato a buon fine

#verifica ok: commit
#verifica ko: rollback

#rollback | commit
rollback;

