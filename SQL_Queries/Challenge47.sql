SELECT
o.order_id,
o.order_date,
s.shipping_date,
DATEDIFF(s.shipping_date, o.order_date) AS days_between
FROM
ordersnew o
LEFT JOIN
shippingnew s
ON
o.order_id = s.order_id
WHERE
s.shipping_date IS NOT NULL
ORDER BY
o.order_id 
