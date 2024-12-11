SELECT
EXTRACT(YEAR FROM o.order_date) AS order_year,
COUNT(o.order_id) AS total_orders
FROM
ordersnew o
GROUP BY
EXTRACT(YEAR FROM o.order_date)
ORDER BY
order_year ASC;
