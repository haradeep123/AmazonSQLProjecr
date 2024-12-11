WITH Total_Table AS(
SELECT
o.order_id,
oin.product_id,
SUM(oin.quantity) as total_quantity,
o.seller_id,
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
o.order_id,
oin.product_id,
o.seller_id,
s.seller_name
)
SELECT 
SUM(total_quantity) AS total_sales_By_Seller,
seller_name
FROM Total_Table
GROUP BY
seller_name
HAVING 
total_sales_By_Seller > 500