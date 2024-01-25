
  create or replace   view NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_products
  
   as (
    

SELECT *,
    -- 1. TotalStockValue
    unitsInStock * unitPrice AS totalStockValue,

    -- 2. TotalOrderValue
    unitsOnOrder * unitPrice AS totalOrderValue,

    -- 3. TotalValue
    totalStockValue + totalOrderValue AS totalValue,

    -- 4. ValuePerUnit
    CASE
        WHEN unitsInStock + unitsOnOrder = 0 THEN 0 -- Check for division by zero
        ELSE totalValue / (unitsInStock + unitsOnOrder)
    END AS valuePerUnit,

    -- 5. ReorderCheck
    CASE
        WHEN unitsInStock <= reorderLevel THEN TRUE
        ELSE FALSE
    END AS reorderCheck

FROM NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_products
  );

