# 🧮 Esercizio: Calcolo dello sconto con Stored Procedure

## 📌 Obiettivo
Creare una stored procedure in MySQL che calcoli il prezzo finale di un prodotto dopo aver applicato uno sconto percentuale.

---

## 🔹 Traccia

Scrivere una stored procedure chiamata `calcola_sconto` che:

- accetta un parametro `prezzo` (DECIMAL) → prezzo iniziale
- accetta un parametro `sconto` (DECIMAL) → percentuale di sconto
- restituisce un parametro `risultato` (DECIMAL) → prezzo finale scontato

---

## 🧾 Formula da utilizzare
prezzo finale = prezzo - (prezzo * sconto / 100)


---

## ⚙️ Richieste

1. Creare la stored procedure
2. Dichiarare una variabile utente
3. Chiamare la procedura con:
   - prezzo = 100
   - sconto = 20
4. Visualizzare il risultato

---

## ▶️ Output atteso
80.00

---

## 💡 Suggerimento

Utilizzare:
- `IN` per i parametri di input
- `OUT` per il parametro di output
- `CALL` per eseguire la procedura