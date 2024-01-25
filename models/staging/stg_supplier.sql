{{ config (materialized='view')}}

SELECT *
FROM {{ ref ('raw_supplier') }}