{{ config (materialized='view')}}

SELECT *,
    -- 1. TotalStockValue
    unitsInStock * unitPrice AS totalStockValue,

    -- 2. TotalOrderValue
    unitsOnOrder * unitPrice AS totalOrderValue,

    -- 3. TotalValue
    totalStockValue + totalOrderValue AS totalValue,
    -- 4. TotalStockCost
    unitsInStock * unitCost AS TotalStockCost,

    -- 5. TotalOrderCost
    unitsOnOrder * unitCost AS totalOrderCost,

    -- 6. TotalCost
    totalStockCost + totalOrderCost AS totalCost,
    -- 7. ReorderCheck
    CASE
        WHEN unitsInStock <= reorderLevel THEN TRUE
        ELSE FALSE
    END AS reorderCheck

FROM {{ ref ('raw_products')}}