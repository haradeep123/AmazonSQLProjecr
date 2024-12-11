WITH Complete_Table AS(
SELECT
oin.order_id,
oin.product_id,
p.product_name
FROM
order_items_new oin
LEFT JOIN
productsnew p
ON
oin.product_id = p.product_id
WHERE
p.product_name IS NOT NULL
)
SELECT
product_id,
product_name,
COUNT(product_id) AS product_count
FROM
Complete_Table
GROUP BY 
product_id,
product_name