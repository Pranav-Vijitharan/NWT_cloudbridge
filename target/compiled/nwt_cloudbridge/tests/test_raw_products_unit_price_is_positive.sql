WITH
products AS (
    SELECT * FROM NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_products
)

SELECT
    productID,
    sum(unitPrice) AS total_up
FROM products
GROUP BY productID
HAVING total_up < 0