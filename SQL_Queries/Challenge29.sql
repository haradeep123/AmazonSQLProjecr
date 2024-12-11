SELECT
s.seller_id,
s.seller_name,
AVG(p.price) AS avg_price
FROM
ordersnew o
LEFT JOIN 
order_items_new oin
ON
o.order_id = oin.order_id
LEFT JOIN
productsnew p
ON
oin.product_id = p.product_id
LEFT JOIN
sellersnew s
ON
o.seller_id = s.seller_id
GROUP BY
s.seller_id,
s.seller_name
HAVING
AVG(p.price) > 300

