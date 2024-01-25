{{config (materialized='incremental', unique_key='orderID')}}

SELECT 
    orderID,
    customerID,
    employeeID,
    orderDate,
    requiredDate,
    shippedDate,
    shipVia,
    freight,
    shipName,
    shipAddress,
    shipCity,
    REPLACE(shipRegion, 'NULL', NULL) AS shipRegion,
    REPLACE(shipPostalCode, 'NULL', NULL) AS shipPostalCode,
    shipCountry
FROM {{ ref ('fresh_orders') }}
{% if is_incremental() %}
WHERE CAST(orderID AS BIGINT) > (SELECT MAX(CAST(orderID AS BIGINT)) 
FROM {{this}})
{% endif %}