SELECT
o.order_id,
o.order_date,
p.payment_status,
DATE_ADD(o.order_date, INTERVAL 30 DAY) AS payment_due_date
FROM
ordersnew o
LEFT JOIN paymentsnew p
ON
o.order_id = p.order_id
WHERE
    p.payment_status = 'Payment Failed'
    AND DATE_ADD(o.order_date, INTERVAL 30 DAY) < CURDATE()
ORDER BY
    o.order_date ASC;

