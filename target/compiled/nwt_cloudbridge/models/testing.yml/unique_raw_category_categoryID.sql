
    
    

select
    categoryID as unique_field,
    count(*) as n_records

from NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_category
where categoryID is not null
group by categoryID
having count(*) > 1


