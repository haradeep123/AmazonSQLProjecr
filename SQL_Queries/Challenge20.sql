SELECT
SUM(CASE WHEN payment_status = 'Payment Successed' THEN 1 ELSE 0 END) AS Success_Count,
SUM(CASE WHEN payment_status = 'Payment Failed' THEN 1 ELSE 0 END) AS Failure_Count
FROM
paymentsnew



