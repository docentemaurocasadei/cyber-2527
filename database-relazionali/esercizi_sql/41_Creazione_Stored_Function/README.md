### Esercizio 41: Creazione di una stored function nel database

# Obiettivo
L'obiettivo di questa esercitazione è creare una stored function nel database `gestione_corsi` per ritornare il nome completo di un corsista in maiuscolo dato il suo id.

# Requisiti
1. Assicurati di avere un database MySQL in esecuzione e accessibile.
2. Assicurati di avere i privilegi necessari per creare stored function nel database.
3. Assicurati di aver creato il database `gestione_corsi` come specificato nell'esercizio 1.
4. Assicurati di aver inserito i dati nella tabella `corsisti` come specificato negli esercizi precedenti.

# Istruzioni
Scrivere un file SQL che:
1. Crea una stored function `fn_nome_completo` che ritorna il nome completo (cognome + nome) del corsista in maiuscolo dato il suo id