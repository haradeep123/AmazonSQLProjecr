SELECT
cn.customer_id,
CONCAT(cn.first_name,'', cn.last_name) AS full_name
FROM
customersnew cn
JOIN
ordersnew o
ON
cn.customer_id = o.customer_id
JOIN
order_items_new oin
ON
o.order_id = oin.order_id
JOIN
productsnew p
ON
oin.product_id = p.product_id
WHERE category_id = 1
GROUP BY cn.customer_id,cn.first_name,cn.last_name


