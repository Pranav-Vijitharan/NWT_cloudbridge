
  create or replace   view NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_customer
  
   as (
    

select *
from NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_customer
  );

