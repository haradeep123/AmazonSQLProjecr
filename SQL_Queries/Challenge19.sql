WITH Complete_Table AS(
SELECT 
oin.order_id,
ROUND(SUM(oin.price_per_unit * oin.quantity),2) AS total_price,
oin.product_id,
p.category_id,
c.category_name
FROM
order_items_new oin
LEFT JOIN
productsnew p
ON
oin.product_id = p.product_id
left JOIN
category c
ON
p.category_id = c.category_id
WHERE
c.category_id IS NOT NULL AND c.category_name IS NOT NULL
GROUP BY
oin.order_id,
oin.product_id,
p.category_id,
c.category_name
)
SELECT 
category_id,
category_name,
ROUND(SUM(total_price),2) AS Total_Revenue
FROM Complete_Table
GROUP BY
category_id,
category_name