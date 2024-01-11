select
--suppliertable
    s.supplierid,
    od.productid,
    od.orderid,
    s.companyname as suppliername,
    contactname,
    contacttitle,
    country,
    s.region,
    city,
    address,
    postalcode,
    s.phone as supplier_phone,
    shippeddate,
    ontimestatus,
--shippertable
    sh.shipperid,
    sh.companyname as shippername,
    sh.phone as shipper_phone,
--producttable
    sum(totalordervalue) as Product_cost,
    sum(freight) as Shipping_cost
from {{ ref('stg_supplier') }} as s
left join {{ ref('stg_products')}} as p
on s.supplierid=p.supplierid
left join {{ ref('stg_orderdetails')}} as od
on p.productid=od.productid
left join {{ref('stg_orders')}} as o
on o.orderid=od.orderid
left join {{ref('stg_shipper')}} as sh
on o.shipvia=sh.shipperid
group by s.supplierid,
    od.productid,
    od.orderid,
    s.companyname,
    contactname,
    contacttitle,
    country,
    s.region,
    city,
    address,
    postalcode,
    s.phone,
    sh.shipperid,
    sh.companyname,
    sh.phone,
    shippeddate,
    ontimestatus
