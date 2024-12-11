SELECT DISTINCT
    s.seller_name
FROM
    sellersnew s
WHERE
    s.seller_id IN (
        SELECT DISTINCT
            o.seller_id
        FROM
            ordersnew o
        JOIN
            order_items_new oin
        ON
            o.order_id = oin.order_id
        JOIN
            productsnew p
        ON
            oin.product_id = p.product_id
        WHERE
            p.product_name LIKE '%Apple%'
    );
