SELECT
oin.product_id,
ROUND(SUM(oin.quantity * oin.price_per_unit),2) AS revenue,
p.product_name
FROM
order_items_new oin
LEFT JOIN
productsnew p
ON
oin.product_id = p.product_id
GROUP BY
oin.product_id,
p.product_name
ORDER BY revenue DESC
LIMIT 1