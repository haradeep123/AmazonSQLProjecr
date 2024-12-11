SELECT
    p.product_name,
    (
        SELECT
            COUNT(oin.product_id)
        FROM
            order_items_new oin
        WHERE
            oin.product_id = p.product_id
    ) AS product_count
FROM
    productsnew p;
