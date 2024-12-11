SELECT
product_id,
product_name,
price,
ROW_NUMBER() OVER(ORDER BY price DESC) AS row_numbers
FROM
productsnew