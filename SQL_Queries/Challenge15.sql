WITH complete_table AS(
SELECT
o.order_id,
SUM(oin.quantity * oin.price_per_unit) AS total_price,
o.seller_id,
p.category_id,
oin.product_id,
c.category_name,
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
category c
ON
p.category_id = c.category_id
LEFT JOIN
sellersnew s
ON
o.seller_id = s.seller_id
GROUP BY
o.order_id,
o.seller_id,
p.category_id,
oin.product_id,
c.category_name,
s.seller_name
)
SELECT 
SUM(total_price) AS total_revenue,
category_name,
seller_name
FROM complete_table
GROUP BY
category_name,
seller_name
ORDER BY seller_name,
category_name;






SELECT 
    s.seller_name,
    c.category_name,
    SUM(oin.quantity * oin.price_per_unit) AS total_revenue
FROM 
    ordersnew o
LEFT JOIN 
    order_items_new oin ON o.order_id = oin.order_id
LEFT JOIN 
    productsnew p ON oin.product_id = p.product_id
LEFT JOIN 
    category c ON p.category_id = c.category_id
LEFT JOIN 
    sellersnew s ON o.seller_id = s.seller_id
GROUP BY 
    s.seller_name, c.category_name
ORDER BY 
    s.seller_name, c.category_name;

