SELECT
o.order_id,
o.order_date,
DATE_FORMAT(o.order_date, '%Y/%m/%d') AS formatted_order_date
FROM
ordersnew o
ORDER BY
o.order_id
