#quali corsi sono svolti nel lab (id=2)
select nome,id from corsi where aula_id=2;

#quanti corsi sono svolti nel lab (id=2)
select count(*) as numero_corsi from corsi where aula_id=2;

select count(*) as numero_corsi, 
aule.nome from corsi
join aule on corsi.aula_id=aule.id
group by aule.nome;

#quanto economincamente (costo) ha prodotto 
un corso in base agli iscritti

select sum(costo) as totale_incassato, corsi.nome from corsi
join corsi_frequentati on corsi.id=corsi_frequentati.corso_id
group by corsi.nome;

#0. quanti corsi forniscono la certificazione Certificazione SQL (id=1)
select count(*) as numero_corsi from corsi where certificazione_id=1;
numero_corsi
2

#1. mostrare l'elenco delle certificazioni e a fianco quale corso fornisce 
#quella certificazione
Certificazione SQL      SQL Base
Certificazione SQL      MySQL Avanzato
Certificazione MySQL    null
Certificazione PHP      Programmazione PHP
select certificazioni.nome as nome_certificazione, 
corsi.nome as nome_corso from certificazioni
left join corsi on certificazioni.id=corsi.certificazione_id;

#2. mostrare l'elenco delle certificazioni e a fianco il numero dei corsi 
#che forniscono quella certificazione 
Certificazione SQL      2
Certificazione MySQL    0
Certificazione PHP      1
select certificazioni.nome as nome_certificazione, 
count(corsi.id) as numero_corsi from certificazioni
left join corsi on certificazioni.id=corsi.certificazione_id
group by certificazioni.nome;

#mysql functions su stringhe
#concat
select concat(nome,' ',cognome) as nome_completo from corsisti;

#length
select length(nome) as lunghezza_nome from corsisti;

#length vs char_length
select length('giosuè') as lunghezza_nome_byte;
select char_length('giosuè') as lunghezza_nome_caratteri;

#substring
select substring(nome,1,3) as nome_troncato from corsisti;

#locate
select locate('work', 'workbench') as posizione_substringa;

#replace
select replace('workbench', 'work', 'tool') as stringa_sostituita;

#concat_ws
select concat_ws(' ', nome, cognome, data_nascita) as nome_completo from corsisti;

#upper e lower
select upper(nome) as nome_maiuscolo from corsisti;
select lower(nome) as nome_minuscolo from corsisti;

#estrarre un codice generato da: 
prime 3 lettere del nome + prime 3 lettere del cognome + id separati da un trattino (-)
tutto in maiuscolo

select upper(concat_ws(
    '-', 
    substring(nome,1,3), 
    substring(cognome,1,3), 
    id)
    ) as codice_corsista from corsisti;


#mysql functions su date
#now
select now() as data_ora_corrente;
#2026-03-13 12:33:45

#curdate
select curdate() as data_corrente;
#2026-03-13

#curtime
select curtime() as ora_corrente;
#12:33:45

#date_format
select date_format(data_nascita, '%d/%m/%Y') as data_nascita_formattata from corsisti;
#'%d/%m/%Y' giorno/mese/anno

#date_add
select date_add(curdate(), interval 7 day) as data_futura;
#2026-03-20
select date_add(curdate(), interval 1 month) as data_futura;
#2026-04-13

#datediff
select datediff('2026-04-13', curdate()) as giorni_tra_date;
#31

#date_sub
select date_sub(curdate(), interval 7 day) as data_passata;
#2026-03-06

#adddate
select adddate(curdate(), interval 7 day) as data_futura;
#2026-03-20

#1. calcolare l'età dei corsisti in anni
select nome, cognome, data_nascita,
datediff(curdate(), data_nascita)/365 as eta_in_anni from corsisti;
OPPURE
select corsisti.nome, corsisti.cognome,
timestampdiff(year, corsisti.data_nascita, curdate()) as eta_in_anni from corsisti

#2 calcolare la differenza in giorni dalla data di iscrizione al corso ad oggi
select corsisti.nome, corsisti.cognome, corsi.nome as nome_corso,
datediff(curdate(), corsi_frequentati.data_inizio) as giorni_dal_inizio_corso from corsisti
join corsi_frequentati on corsisti.id=corsi_frequentati.corsista_id
join corsi on corsi.id=corsi_frequentati.corso_id;

oppure riferito al corso
select corsi.nome as nome_corso, datediff(curdate(), corsi.data_inizio) 
as giorni_da_inizio_corso from corsi;

# MYSQL FUNCTIONS SU NUMERI
#floor
select nome, cognome, data_nascita,
floor(datediff(curdate(), data_nascita)/365) as eta_in_anni from corsisti;

#round
select nome,costo, round(costo, 1) as costo_arrotondato from corsi;

#ceil
select nome,costo, ceil(costo) as costo_arrotondato_superiore from corsi;

#mod
#pago con 400 euro
select nome, costo, mod(400, costo) as resto from corsi where id=1;
//SQL Base	300.00	100.00

#estrazione del lotto: estrai un numero casuale da 1 a 90
select floor(1 + rand() * 90) as numero_lotto;

select floor(rand() * 90) + 1 as numero_lotto;

#disctinct
select distinct nome from corsisti;