{{config (materialized='view')}}
SELECT *,
    quantity * unitprice as grossSales,
    ROUND(quantity * unitprice * discount,2) AS discountAmount,
    ROUND((quantity * unitprice) * (1-discount),2) AS netSales
FROM {{ref ('raw_orderdetails')}}