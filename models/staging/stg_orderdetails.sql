{{config (materialized='view')}}
SELECT *,
    --    ((unitPrice * quantity) - (unitPrice * quantity * discount)) / (unitPrice * quantity) * 100 AS ProfitMargin,
    (unitPrice * quantity) - (unitPrice * quantity * discount) as netPrice,
    quantity * netPrice as revenue,
    --    (unitPrice * quantity * (1 - discount)) AS DiscountedPrice,
        -- CASE
        --     WHEN discount > 0 THEN (unitPrice * quantity) * (1 - discount)
        --     ELSE (unitPrice * quantity)
        -- END AS DiscountedPrice,
    --    (unitPrice * quantity * (1 - discount)) AS DiscountedPrice,
       unitprice * quantity * discount AS discountAmount
FROM {{ref ('raw_orderdetails')}}