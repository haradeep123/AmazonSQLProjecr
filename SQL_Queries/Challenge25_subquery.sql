SELECT
    c.customer_id,
    c.first_name,
    c.last_name
FROM
    customersnew c
WHERE
    EXISTS (
        SELECT
            1
        FROM
            ordersnew o
        WHERE
            o.customer_id = c.customer_id
    );
