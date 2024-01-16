{{ config (materialized='table')}}

SELECT *
From {{ source('NWT', 'FRESH_ORDERDETAILS') }}