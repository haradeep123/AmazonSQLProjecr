SELECT
*
FROM
productsnew
WHERE price =
(
SELECT
MAX(price)
FROM
productsnew
)