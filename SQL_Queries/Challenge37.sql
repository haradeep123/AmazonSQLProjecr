SELECT
    p.product_id,
    p.product_name,
    p.category_id,
    p.price AS current_price,
    LEAD(p.price) OVER (PARTITION BY p.category_id ORDER BY p.price ASC) AS next_higher_price,
    LEAD(p.product_name) OVER (PARTITION BY p.category_id ORDER BY p.price ASC) AS next_higher_priced_product
FROM
    productsnew p
ORDER BY
    p.category_id, p.price ASC;
