SELECT 
    c.category_id,
    c.category_name,
    s.seller_id,
    s.seller_name
FROM 
    category c
CROSS JOIN 
    sellersnew s;
