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
MONTH(o.order_date) = MONTH(CURRENT_DATE())
AND YEAR(o.order_date) = YEAR(CURRENT_DATE())
ORDER BY
o.order_date ASC;
