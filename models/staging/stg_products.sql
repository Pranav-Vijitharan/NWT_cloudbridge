{{ config (materialized='view')}}

SELECT *,
    -- 1. TotalStockValue
    UnitsInStock * UnitPrice AS TotalStockValue,

    -- 2. TotalOrderValue
    UnitsOnOrder * UnitPrice AS TotalOrderValue,

    -- 3. TotalValue
    TotalStockValue + TotalOrderValue AS TotalValue,

    -- 4. ValuePerUnit
    CASE
        WHEN UnitsInStock + UnitsOnOrder = 0 THEN 0 -- Check for division by zero
        ELSE TotalValue / (UnitsInStock + UnitsOnOrder)
    END AS ValuePerUnit,

    -- 5. ReorderCheck
    CASE
        WHEN UnitsInStock <= ReorderLevel THEN TRUE
        ELSE FALSE
    END AS ReorderCheck

FROM {{ ref ('raw_products')}}