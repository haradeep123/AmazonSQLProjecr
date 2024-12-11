WITH Complete_Table AS(
SELECT
o.order_id,
c.customer_id,
c.first_name,
c.last_name
FROM
customersnew c
LEFT JOIN
ordersnew o
ON
c.customer_id = o.customer_id
)
SELECT 
customer_id,
first_name,
last_name
FROM Complete_Table
GROUP BY
customer_id,
first_name,
last_name
HAVING COUNT(order_id) >=1 