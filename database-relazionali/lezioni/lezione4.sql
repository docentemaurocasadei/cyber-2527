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
