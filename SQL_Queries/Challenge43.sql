SELECT
ROUND(AVG(DATEDIFF(s.shipping_date, o.order_date)), 2) AS avg_delivery_time
FROM
ordersnew o
LEFT JOIN
shippingnew s
ON
o.order_id = s.order_id
WHERE
o.order_status = 'Completed';
