sercizio: Calcolo dello sconto con Stored Procedure

Scrivere una stored procedure in MySQL chiamata calcola_sconto che permetta di calcolare il prezzo finale di un prodotto dopo aver applicato uno sconto percentuale.

🔹 Requisiti:
La procedura deve accettare:
un parametro di input prezzo (DECIMAL), che rappresenta il prezzo iniziale del prodotto
un parametro di input sconto (DECIMAL), che rappresenta la percentuale di sconto da applicare
un parametro di output risultato (DECIMAL), che conterrà il prezzo finale scontato

La procedura deve calcolare il prezzo finale utilizzando la formula:

prezzo finale = prezzo - (prezzo * sconto / 100)
Dopo aver creato la procedura:
dichiarare una variabile utente
richiamare la procedura passando un prezzo di 100 e uno sconto del 20%
visualizzare il risultato ottenuto