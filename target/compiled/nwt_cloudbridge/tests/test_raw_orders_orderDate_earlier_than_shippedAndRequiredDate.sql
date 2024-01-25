WITH
orders AS (
    SELECT * FROM NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_orders
)

SELECT OrderDate, ShippedDate, RequiredDate
FROM orders
WHERE OrderDate <= RequiredDate