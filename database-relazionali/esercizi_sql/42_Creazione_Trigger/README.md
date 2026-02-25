### Esercizio 41: Creazione di un trigger nel database

# Obiettivo
L'obiettivo di questa esercitazione è creare un trigger nel database `gestione_corsi` per registrare le modifiche apportate alla tabella `corsisti`.

# Requisiti
1. Assicurati di avere un database MySQL in esecuzione e accessibile.
2. Assicurati di avere i privilegi necessari per creare trigger nel database.
3. Assicurati di aver creato il database `gestione_corsi` come specificato nell'esercizio 1.
4. Assicurati di aver inserito i dati nella tabella `corsisti` come specificato negli esercizi precedenti.

# Istruzioni
Scrivere un file SQL che:
1. Crea una tabella `log_corsisti_modifiche` per registrare le modifiche apportate alla tabella `corsisti`
2. Crea un trigger `trg_log_corsisti_update` che si attiva dopo ogni UPDATE sulla tabella `corsisti`
3. Modifica un elemento della tabella `corsisti`
