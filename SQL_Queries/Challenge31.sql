WITH Complete_Table As(
SELECT
oin.product_id,
p.product_name,
ROUND(SUM(oin.quantity * oin.price_per_unit),2)AS revenue_products,
c.category_id,
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
GROUP BY
oin.product_id,
p.product_name,
c.category_id,
c.category_name
)
SELECT 
product_id,
product_name,
revenue_products,
category_name,
RANK() OVER(partition by category_name ORDER BY revenue_products DESC) AS ranking_revenue
FROM Complete_Table
WHERE product_name IS NOT NULL