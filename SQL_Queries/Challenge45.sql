SELECT
c.customer_id,
CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM
customersnew c
LEFT JOIN
ordersnew o
ON
c.customer_id = o.customer_id
AND o.order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
WHERE
o.order_id IS NULL
