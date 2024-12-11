SELECT
DATE_TRUNC('month', o.order_date) AS month_start,
ROUND(SUM(oin.quantity * oin.price_per_unit), 2) AS total_sales
FROM
ordersnew o
LEFT JOIN
order_items_new oin
ON
o.order_id = oin.order_id
WHERE
EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY
DATE_TRUNC('month', o.order_date)
ORDER BY
month_start ASC;


-- NOT SUPPORTED IN MYSQL