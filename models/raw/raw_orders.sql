{{config (materialized='incremental', unique_key='orderID')}}

SELECT *
FROM {{ ref ('fresh_orders') }}
{% if is_incremental() %}
WHERE CAST(orderID AS BIGINT) > (SELECT MAX(CAST(orderID AS BIGINT)) 
FROM {{this}})
{% endif %}