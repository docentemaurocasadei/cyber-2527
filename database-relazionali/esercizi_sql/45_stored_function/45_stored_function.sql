DELIMITER $$
DROP FUNCTION IF EXISTS fn_supplier_product_count $$
CREATE FUNCTION fn_supplier_product_count(p_supplier_id int)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE product_count INT;
    SELECT COUNT(*) INTO product_count FROM product_supplier WHERE supplier_id = p_supplier_id;
    RETURN product_count;
END $$

DELIMITER ;
SELECT fn_supplier_product_count(1);
SELECT fn_supplier_product_count(2);
SELECT fn_supplier_product_count(3);
SELECT fn_supplier_product_count(4);