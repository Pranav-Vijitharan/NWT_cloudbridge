
  create or replace   view NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_orders
  
   as (
    

WITH ShipmentStatus AS (
  SELECT *,
    CASE
      WHEN shippedDate IS NULL THEN 'Not Shipped'
      WHEN shippedDate < requiredDate THEN 'Early'
      WHEN shippedDate = requiredDate THEN 'On-Time'
      ELSE 'Late'
    END AS onTimeStatus
  FROM NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_orders
)

SELECT *,
    CASE WHEN shippedDate IS NOT NULL THEN DATEDIFF('day', orderDate, shippedDate) END AS OrderDuration,
    CASE 
        WHEN shippedDate IS NOT NULL THEN 
            CASE 
                WHEN DATEDIFF('day', requiredDate, shippedDate) < 0 THEN 0 
                ELSE DATEDIFF('day', requiredDate, shippedDate) 
            END 
    END AS shippingDelay,
    CASE WHEN shippedDate IS NOT NULL THEN DATEDIFF('day', orderDate, requiredDate) END AS shippingTime
FROM ShipmentStatus
  );

