SELECT
DISTINCT 
c.customer_id,
c.first_name,
c.last_name
FROM
customersnew c
WHERE 
c.customer_id NOT IN 
(
SELECT DISTINCT
o.customer_id
FROM
ordersnew o
)