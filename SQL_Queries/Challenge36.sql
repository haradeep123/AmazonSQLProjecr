WITH Complete_Table AS(
SELECT
    s.seller_id,
    s.seller_name,
    YEAR(o.order_date) AS order_year,
    ROUND(SUM(oin.quantity * oin.price_per_unit), 2) AS total_revenue

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
    s.seller_id,
    s.seller_name,
    YEAR(o.order_date)
ORDER BY
    s.seller_id,
    order_year
)
SELECT
seller_id,
seller_name,
order_year,
total_revenue,
SUM(ROUND(total_revenue, 2)) 
        OVER (PARTITION BY seller_id, order_year) AS yearly_revenue
FROM
Complete_Table