WITH complete_table AS(
SELECT
o.order_id,
o.customer_id,
p.category_id,
c.first_name,
ca.category_name
FROM ordersnew o
LEFT JOIN
order_items_new oin
ON
o.order_id = oin.order_id
LEFT JOIN
productsnew p
ON
oin.product_id = p.product_id
LEFT JOIN
customersnew c
ON
o.customer_id = c.customer_id
LEFT JOIN
category ca
ON
p.category_id = ca.category_id
WHERE
category_name = 'Pet Supplies'
)
SELECT
DISTINCT first_name
FROM
complete_table