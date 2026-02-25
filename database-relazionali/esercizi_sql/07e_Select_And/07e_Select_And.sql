#richiesta 1
#estrarre tutti gli ordini 
#dell'officina 'Autofficina Bianchi'
#mostrando worshops.id, business_name, order_date
SELECT w.id, w.business_name, o.order_date
FROM workshops w
JOIN orders o ON w.id = o.workshop_id
WHERE w.business_name = 'Autofficina Bianchi';


#richiesta 2
#estrarre tutte le officine che hanno
#comprato il prodotto con sku 'FRN-002'
SELECT w.business_name FROM workshops w
JOIN orders o ON w.id = o.workshop_id
JOIN order_item oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.sku = 'FRN-002';


#richiesta 3
#estrarre tutte le officine che hanno
#comprato almeno un prodotto del fornitore 'Supplier Two Spa'
SELECT w.business_name FROM workshops w
JOIN orders o ON w.id = o.workshop_id
JOIN order_item oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
JOIN product_supplier ps ON p.id = ps.product_id
JOIN suppliers s ON ps.supplier_id = s.id
WHERE s.company_name = 'Supplier Two Spa'