select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    productID as unique_field,
    count(*) as n_records

from NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_products
where productID is not null
group by productID
having count(*) > 1



      
    ) dbt_internal_test