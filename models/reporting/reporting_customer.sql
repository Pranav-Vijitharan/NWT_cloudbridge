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
o.onTimeStatus,
o.shippingDelay,
o.shippingTime,
o.orderDate,
o.orderID,
s.companyName AS shippingCompanyName,
od.grossSales,
od.netSales,
od.quantity,
od.discountAmount,
p.productName,
ca.categoryName,
{{ profit_profitmargin('o', 'od', 'p') }}

FROM {{ ref('stg_customer') }} AS c
INNER JOIN {{ ref('stg_orders') }} AS o ON c.customerID = o.customerID
INNER JOIN {{ ref('stg_shipper') }} AS s ON o.shipVia = s.shipperID
INNER JOIN {{ ref('stg_orderdetails') }} AS od ON o.orderID = od.orderID
INNER JOIN {{ ref('stg_products') }} AS p ON od.productID = p.productID
INNER JOIN {{ ref('stg_category') }} AS ca ON p.categoryID = ca.categoryID