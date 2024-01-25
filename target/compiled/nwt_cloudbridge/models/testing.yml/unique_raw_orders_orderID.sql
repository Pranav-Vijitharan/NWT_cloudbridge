
    
    

select
    orderID as unique_field,
    count(*) as n_records

from NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_orders
where orderID is not null
group by orderID
having count(*) > 1


