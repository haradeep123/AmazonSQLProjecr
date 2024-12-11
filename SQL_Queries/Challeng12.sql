SELECT
SUM(oin.quantity * oin.price_per_unit) as total_revenue,
s.seller_name
FROM
ordersnew o
LEFT JOIN
order_items_new oin
ON
o.order_id = oin.order_id
LEFT JOIN
sellersnew s
ON
o.seller_id = s.seller_id
GROUP BY
o.seller_id,
s.seller_name
