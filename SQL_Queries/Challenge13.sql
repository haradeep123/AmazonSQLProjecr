SELECT
product_id,
product_name,
AVG(price) as average_price
FROM
productsnew
GROUP BY
product_id,product_name;

SELECT AVG(price) as average_price FROM productsnew