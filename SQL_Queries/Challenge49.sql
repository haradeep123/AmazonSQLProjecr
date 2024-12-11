SELECT
o.order_id,
o.order_date,
CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM
ordersnew o
LEFT JOIN
customersnew c
ON
o.customer_id = c.customer_id
WHERE
DAYOFWEEK(o.order_date) IN (1, 7)
ORDER BY
o.order_date 
