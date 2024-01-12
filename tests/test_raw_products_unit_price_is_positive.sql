WITH
products AS (
    SELECT * FROM {{ ref('raw_products') }}
)

SELECT
    productID,
    sum(unitPrice) AS total_up
FROM products
GROUP BY productID
HAVING total_up < 0