SELECT 
i.product_id,
i.stock,
p.product_name
FROM
inventorynew i
LEFT JOIN
productsnew p
ON
i.product_id = p.product_id
WHERE i.stock = 0;

