SELECT cn.customer_id, 
       CONCAT(cn.first_name, ' ', cn.last_name) AS fullname,
       cn.state,
       o.order_id,
       o.order_date,
       o.seller_id,
       o.order_status,
       oin.order_item_id,
       oin.product_id,
       oin.quantity,
       oin.price_per_unit
FROM customersnew cn
INNER JOIN
ordersnew o
ON
cn.customer_id = o.customer_id
INNER JOIN
order_items_new oin
ON
o.order_id = oin.order_id
