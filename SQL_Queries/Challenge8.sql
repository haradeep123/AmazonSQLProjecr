SELECT
o.order_id,
o.order_date,
oin.price_per_unit,
oin.quantity,
SUM(oin.quantity * oin.price_per_unit) as Total_Price,
p.payment_id,
p.payment_date,
p.payment_status
FROM
ordersnew o
JOIN
order_items_new oin ON o.order_id = oin.order_id
JOIN
paymentsnew p ON o.order_id = p.order_id
GROUP BY 
o.order_id,
o.order_date,
oin.price_per_unit,
oin.quantity,
p.payment_id,
p.payment_date,
p.payment_status