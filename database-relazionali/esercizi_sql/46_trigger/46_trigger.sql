CREATE TRIGGER tr_order_status_create
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (order_id, action, message) 
    VALUES (NEW.id, 'CREATED',CONCAT('Ordine creato da: ', USER()));
END $$
DELIMITER ;