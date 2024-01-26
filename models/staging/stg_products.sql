{{ config (materialized='view')}}

SELECT *,
    -- 1. TotalStockValue
    unitsInStock * unitPrice AS totalStockValue,

    -- 2. TotalOrderValue
    unitsOnOrder * unitPrice AS totalOrderValue,

    -- 3. TotalValue
    totalStockValue + totalOrderValue AS totalValue,

    -- 4. ReorderCheck
    CASE
        WHEN unitsInStock <= reorderLevel THEN TRUE
        ELSE FALSE
    END AS reorderCheck

FROM {{ ref ('raw_products')}}