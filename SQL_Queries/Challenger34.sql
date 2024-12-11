WITH Complete_Table AS (
    SELECT
        o.customer_id,
        ROUND(SUM(oin.quantity * oin.price_per_unit), 2) AS amount_spent,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name
    FROM
        ordersnew o
    LEFT JOIN
        order_items_new oin
        ON o.order_id = oin.order_id
    LEFT JOIN
        customersnew c
        ON o.customer_id = c.customer_id
    GROUP BY
        o.customer_id,
        c.first_name,
        c.last_name
)
SELECT
    customer_id,
    customer_name,
    amount_spent,
    NTILE(4) OVER (ORDER BY amount_spent DESC) AS quartile
FROM
    Complete_Table;
