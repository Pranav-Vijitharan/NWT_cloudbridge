select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select customerID
from NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_orders
where customerID is null



      
    ) dbt_internal_test