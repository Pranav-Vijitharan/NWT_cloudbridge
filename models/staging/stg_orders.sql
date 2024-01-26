{{ config (materialized='view') }}

WITH ShipmentStatus AS (
  SELECT *,
    CASE
      WHEN shippedDate IS NULL THEN 'Not Shipped'
      WHEN shippedDate < requiredDate THEN 'Early'
      WHEN shippedDate = requiredDate THEN 'On-Time'
      ELSE 'Late'
    END AS onTimeStatus
  FROM {{ref ('raw_orders')}}
)

SELECT *,
    CASE WHEN shippedDate IS NOT NULL THEN DATEDIFF('day', orderDate, shippedDate) END AS ShippingTime,
    CASE 
        WHEN shippedDate IS NOT NULL THEN 
            CASE 
                WHEN DATEDIFF('day', requiredDate, shippedDate) < 0 THEN 0 
                ELSE DATEDIFF('day', requiredDate, shippedDate) 
            END 
    END AS shippingDelay
FROM ShipmentStatus
