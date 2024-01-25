select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      WITH
orders AS (
    SELECT * FROM NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_orders
)

SELECT OrderDate, ShippedDate, RequiredDate
FROM orders
WHERE OrderDate <= RequiredDate
      
    ) dbt_internal_test