select
--suppliertable
    s.Supplierid,
    s.Companyname as Suppliername,
    Contactname,
    Contacttitle,
    Country as Supplier_country,
    s.Region as Supplier_Region,
    City as Supplier_city,
    Address as Supplier_Address,
    Postalcode as Supplier_Postalcode,
    s.Phone as Supplier_phone,
--orderdetails
    od.Productid,
    p.productName,
    od.Orderid,
    od.netsales,
    od.quantity,
--product
    p.unitPrice,
    p.unitCost,
    p.unitsOnOrder,
    p.totalOrderValue,
    p.totalOrderCost,
--category
    c.Categoryname,
    c.description,
    c.picture,
--shippertable
    sh.Shipperid,
    sh.Companyname as Shippedvia,
    sh.Phone as Shipper_phone,
--order
   o.orderDate,
   o.requiredDate,
   o.shippedDate,
   o.shipRegion,
   o.shipCountry,
   o.shipCity,
   o.shipAddress,
   o.shippingTime,
   o.shippingDelay,
   o.onTimeStatus,
   {{ profit_profitmargin('o', 'od', 'p') }}
from {{ ref('stg_supplier') }} as s
left join {{ ref('stg_products')}} as p
on s.Supplierid=p.Supplierid
left join {{ref('stg_category')}} as c
on c.Categoryid=p.Categoryid
left join {{ ref('stg_orderdetails')}} as od
on p.Productid=od.Productid
left join {{ref('stg_orders')}} as o
on o.Orderid=od.Orderid
left join {{ref('stg_shipper')}} as sh
on o.Shipvia=sh.Shipperid

