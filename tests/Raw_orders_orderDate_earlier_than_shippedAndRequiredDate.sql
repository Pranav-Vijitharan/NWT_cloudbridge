WITH
orders AS (
    SELECT * FROM {{ ref('raw_orders') }}
)

SELECT OrderDate, ShippedDate, RequiredDate
FROM orders
WHERE OrderDate < RequiredDate
