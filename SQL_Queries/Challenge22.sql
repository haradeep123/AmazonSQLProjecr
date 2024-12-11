SELECT 
*
FROM
productsnew p1
WHERE
price >
(
SELECT
AVG(p2.price)
FROM
productsnew p2
WHERE
p2.category_id = p1.category_id
)

