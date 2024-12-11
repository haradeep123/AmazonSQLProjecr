SELECT
#pn.product_id,
pn.product_name,
#pn.price,
#pn.category_id,
#oin.order_id,
#oin.product_id,
#o.seller_id,
s.seller_name
#s.origin
FROM
productsnew pn
JOIN
order_items_new oin ON pn.product_id = oin.product_id
JOIN
ordersnew o ON o.order_id = oin.order_id
JOIN
sellersnew s ON o.seller_id = s.seller_id
WHERE origin = 'USA'