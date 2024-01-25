
  
    

        create or replace transient table NWT_DATA_GRP1.ADO_GRP1_ASG2.reporting_supplier
         as
        (select
--suppliertable
    s.Supplierid,
    od.Productid,
    od.Orderid,
    s.Companyname as Suppliername,
    Contactname,
    Contacttitle,
    Country,
    s.Region,
    City,
    Address,
    Postalcode,
    s.Phone as Supplier_phone,
    Shippeddate,
    Ontimestatus,
--shippertable
    sh.Shipperid,
    sh.Companyname as Shippername,
    sh.Phone as Shipper_phone,
--producttable
    sum(totalordervalue) as Product_cost,
    sum(freight) as Shipping_cost
from NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_supplier as s
left join NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_products as p
on s.Supplierid=p.Supplierid
left join NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_orderdetails as od
on p.Productid=od.Productid
left join NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_orders as o
on o.Orderid=od.Orderid
left join NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_shipper as sh
on o.Shipvia=sh.Shipperid
group by s.Supplierid,
    od.Productid,
    od.Orderid,
    s.Companyname,
    Contactname,
    Contacttitle,
    Country,
    s.Region,
    City,
    Address,
    Postalcode,
    s.Phone,
    sh.Shipperid,
    sh.Companyname,
    sh.Phone,
    Shippeddate,
    Ontimestatus
        );
      
  