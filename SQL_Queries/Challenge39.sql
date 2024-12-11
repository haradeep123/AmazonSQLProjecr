WITH OrderTotals AS (
SELECT
s.seller_id,
s.seller_name,
o.order_id,
ROUND(SUM(oin.quantity * oin.price_per_unit), 2) AS order_total
FROM
ordersnew o
LEFT JOIN
order_items_new oin
ON
o.order_id = oin.order_id
LEFT JOIN
sellersnew s
ON
o.seller_id = s.seller_id
GROUP BY
s.seller_id,
s.seller_name,
o.order_id
)
SELECT
seller_id,
seller_name,
order_id,
order_total,
SUM(order_total) OVER (PARTITION BY seller_id ORDER BY order_id) AS cumulative_sales
FROM
OrderTotals
ORDER BY
seller_id, order_id
