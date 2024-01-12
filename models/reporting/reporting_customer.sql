{{ config (materialized='table')}}

SELECT 
c.customerID,
c.companyName,
c.contactName,
c.contactTitle,
c.country,
c.region,
c.city,
o.freight,
o.ontimestatus,
o.shippingdelay,
o.shippingtime,
o.orderDate,
s.companyName AS shippingCompanyName,
od.totalPrice,
od.quantity,
od.discountAmount,
od.netPrice,
p.productName,
c.categoryName
FROM {{ ref('stg_customer') }} AS c
INNER JOIN {{ ref('stg_orders') }} AS o ON c.customerID = o.customerID
INNER JOIN {{ ref('stg_shipper') }} AS s ON o.shipVia = s.shipperID
INNER JOIN {{ ref('stg_orderdetails') }} AS od ON o.orderID = od.orderID
INNER JOIN {{ ref('stg_products') }} AS p ON od.productID = p.productID
INNER JOIN {{ ref('stg_category') }} AS c ON p.categoryID = c.categoryID;