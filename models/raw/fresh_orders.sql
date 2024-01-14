{{ config (materialized='table')}}

SELECT *
From {{ source('NWT', 'FRESH_ORDERS') }}

-- {{ config (materialized='table')}}

-- select *
-- from 
-- NWT_DATA_GRP1.ADO_GRP1_ASG2.FRESH_ORDERS