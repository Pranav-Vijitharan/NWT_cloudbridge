select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select supplierID
from NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_products
where supplierID is null



      
    ) dbt_internal_test