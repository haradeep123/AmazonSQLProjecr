SELECT DISTINCT
    DISTINCT c.first_name
FROM
    customersnew c
WHERE
    c.customer_id IN (
        SELECT
            o.customer_id
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
            category ca
        ON
            p.category_id = ca.category_id
        WHERE
            ca.category_name = 'Pet Supplies'
    );
