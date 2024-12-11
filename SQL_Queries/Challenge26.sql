WITH COMPLETE_TABLE AS(
SELECT
oin.order_id,
oin.product_id,
o.seller_id,
p.product_name,
s.seller_name
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
)
SELECT
DISTINCT seller_name
FROM
COMPLETE_TABLE
WHERE product_name LIKE '%Apple%'