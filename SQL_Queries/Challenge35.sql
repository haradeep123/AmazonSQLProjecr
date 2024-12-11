WITH OrderTotals AS (
    SELECT
        o.order_id,
        o.customer_id,
        ROUND(SUM(oin.quantity * oin.price_per_unit), 2) AS order_total
    FROM
        ordersnew o
    LEFT JOIN
        order_items_new oin
    ON
        o.order_id = oin.order_id
    GROUP BY
        o.order_id,
        o.customer_id
)
SELECT
    order_id,
    customer_id,
    order_total,
    SUM(order_total) OVER (PARTITION BY customer_id ORDER BY order_id) AS running_total
FROM
    OrderTotals
ORDER BY
    customer_id, order_id;
