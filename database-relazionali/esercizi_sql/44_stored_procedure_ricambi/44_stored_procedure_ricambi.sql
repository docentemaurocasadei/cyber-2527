

#SOLUZIONE 1a
DELIMITER $$
DROP PROCEDURE IF EXISTS pc_get_workshop_order_count $$
CREATE PROCEDURE pc_get_workshop_order_count(IN p_workshop_id INT, OUT p_order_count INT)
BEGIN
    SELECT COUNT(*) INTO p_order_count FROM orders 
    WHERE workshop_id = p_workshop_id;
END $$

DELIMITER ;

CALL pc_get_workshop_order_count(4, @order_count);
SELECT @order_count;

#SOLUZIONE 2a
DELIMITER $$
DROP PROCEDURE IF EXISTS pc_get_workshop_order_count_by_date $$
CREATE PROCEDURE pc_get_workshop_order_count_by_date(
    IN p_workshop_id INT, 
    IN p_start_date DATE, 
    IN p_end_date DATE, 
    OUT p_order_count INT)
BEGIN
    SELECT COUNT(*) INTO p_order_count FROM orders 
    WHERE workshop_id = p_workshop_id
    AND order_date BETWEEN p_start_date AND p_end_date;
END $$

DELIMITER ;

CALL pc_get_workshop_order_count_by_date(4, '2026-02-01', '2026-02-10', @order_count);
SELECT @order_count;