SELECT
CASE
WHEN order_status = 'Inprogress' THEN 'IN Progress'
WHEN order_status = 'Completed' THEN 'Completed'
WHEN order_status = 'Cancelled' THEN 'Cancelled'
WHEN order_status = 'Returned' THEN 'Returneed'
END AS Order_Status_Category,
COUNT(order_id) AS Number_of_Orders
FROM
ordersnew
GROUP BY
Order_Status_Category