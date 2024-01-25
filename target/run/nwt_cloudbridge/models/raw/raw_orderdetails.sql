-- back compat for old kwarg name
  
  begin;
    
        
            
            
        
    

    

    merge into NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_orderdetails as DBT_INTERNAL_DEST
        using NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_orderdetails__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.orderID = DBT_INTERNAL_DEST.orderID
            )

    
    when matched then update set
        "ORDERID" = DBT_INTERNAL_SOURCE."ORDERID","PRODUCTID" = DBT_INTERNAL_SOURCE."PRODUCTID","UNITPRICE" = DBT_INTERNAL_SOURCE."UNITPRICE","QUANTITY" = DBT_INTERNAL_SOURCE."QUANTITY","DISCOUNT" = DBT_INTERNAL_SOURCE."DISCOUNT"
    

    when not matched then insert
        ("ORDERID", "PRODUCTID", "UNITPRICE", "QUANTITY", "DISCOUNT")
    values
        ("ORDERID", "PRODUCTID", "UNITPRICE", "QUANTITY", "DISCOUNT")

;
    commit;