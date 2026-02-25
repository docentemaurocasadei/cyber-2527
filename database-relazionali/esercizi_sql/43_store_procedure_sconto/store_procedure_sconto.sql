DELIMITER $$

create PROCEDURE calcola_sconto( IN prezzo decimal(15,2), IN sconto  decimal(15,2), OUT risultato  decimal(15,2))
BEGIN
	SELECT prezzo - prezzo * sconto / 100 into risultato;
END $$

delimiter ;

set @prezzo = 0;
call calcola_sconto(100,20,@prezzo);
SELECT @prezzo;
