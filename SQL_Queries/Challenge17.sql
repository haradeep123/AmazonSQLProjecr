WITH Complete_Table AS(
SELECT
o.customer_id,
CONCAT(c.first_name,'',c.last_name) AS Full_Name,
o.order_id,
SUM(oin.quantity * oin.price_per_unit) AS revenue_per_order
FROM
ordersnew o
LEFT JOIN
order_items_new oin
ON
o.order_id = oin.order_id
LEFT JOIN
customersnew c
ON
o.customer_id = c.customer_id
GROUP BY
o.customer_id,
o.order_id,
c.first_name,
c.last_name
)

SELECT 
customer_id,
Full_Name,
COUNT(DISTINCT order_id) AS total_orders_per_customer,
SUM(revenue_per_order) AS total_revenue_per_customer
FROM Complete_Table
GROUP BY
customer_id,Full_name
