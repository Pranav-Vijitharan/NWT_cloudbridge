select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select productID
from NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_orderdetails
where productID is null



      
    ) dbt_internal_test