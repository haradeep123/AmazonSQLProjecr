WITH OrderTotals AS (
SELECT
o.customer_id,
o.order_id,
ROUND(SUM(oin.quantity * oin.price_per_unit), 2) AS order_total
FROM
ordersnew o
LEFT JOIN
order_items_new oin
ON
o.order_id = oin.order_id
GROUP BY
o.customer_id,
o.order_id
)
SELECT
customer_id,
order_id,
order_total,
ROUND(AVG(order_total) OVER (PARTITION BY customer_id), 2) AS average_order_amount,
ROUND(order_total - AVG(order_total) OVER (PARTITION BY customer_id), 2) AS difference_from_avg
FROM
OrderTotals
ORDER BY
customer_id, order_id;
