WITH complete_table AS(
SELECT
oin.order_id,
p.product_id,
p.product_name,
p.category_id,
c.category_name
FROM
order_items_new oin
LEFT JOIN
productsnew p
ON
oin.product_id = p.product_id
LEFT JOIN
category c
ON
p.category_id = c.category_id
)
SELECT 
COUNT(DISTINCT product_id) AS Count_num,
category_name
FROM complete_table
GROUP BY category_name