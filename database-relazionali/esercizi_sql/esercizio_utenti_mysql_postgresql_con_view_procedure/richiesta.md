🎯 Obiettivo

Realizzare un database per la gestione utenti aziendali e caselle email, includendo operazioni CRUD, query avanzate, join, view e transazioni.

🏗️ 1. Creazione database
Creare un database chiamato gestione_email_aziendale

🧱 2. Creazione tabelle
Creare le seguenti tabelle:
👤 users
id (PK)
nome
cognome
ruolo
attivo (boolean)
created_at
📧 email_accounts
id (PK)
email (univoca)
dominio
attiva
🔗 user_emails
id (PK)
user_id (FK)
email_id (FK)
principale (boolean)
📝 access_logs
id (PK)
user_id (FK)
data_accesso
ip_address

📥 3. Inserimento dati
Inserire almeno:
3 utenti
3 email
associare ogni utente a una email

🔍 4. Query SELECT
Scrivere query per:
Visualizzare tutti gli utenti
Visualizzare nome e cognome degli utenti attivi
Visualizzare tutte le email

🔗 5. JOIN
Scrivere query per:

Visualizzare utenti con le loro email
Visualizzare solo le email principali

🧠 6. Query avanzate
Scrivere query per:

Trovare utenti senza email
Contare il numero di email per ogni utente
Trovare utenti con più di una email

✏️ 7. UPDATE
Modificare il ruolo di un utente

❌ 8. DELETE
Eliminare una associazione email-utente

👁️ 9. VIEW
Creare una view che mostri:
nome
cognome
email
se è principale

🔄 10. TRANSACTION
Scrivere una transazione che:

Inserisce un nuovo utente
Inserisce una email
Collega utente ed email
Conferma con COMMIT

11. creare un trigger per tenere traccia delle modifiche nella tabella users

🔥 BONUS (facoltativo)
Trovare utenti senza accessi
Creare una view con:
nome completo
email principale
numero accessi

