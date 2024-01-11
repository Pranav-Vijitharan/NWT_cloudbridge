SELECT
--from order_details

od.orderID,
od.productID,
od.unitPrice,
quantity,
discount,
netPrice,
revenue,
discountAmount,

--from orders

orderDate,
requiredDate,
shippedDate,
shipVia,
freight,
shipName,
shipCity AS city,
shipRegion AS region,
shipCountry AS country,
onTimeStatus,
orderDuration,
shippingDelay,
shippingTime,
-- Profit & Profit Margin Calculation
(od.revenue - od.discountAmount - o.freight) AS profit,
(od.revenue - od.discountAmount - o.freight) / od.revenue * 100 AS profitMargin,

--from products

productName,
pro.categoryID,
pro.supplierID,
unitsinStock,
unitsOnOrder,
reorderLevel,
discontinued,
totalStockValue,
totalOrderValue,
totalValue,
valuePerUnit,
reorderCheck,

--from category

categoryName,
description AS categoryDescription,
picture AS categoryPicture,

-- from supplier

companyName AS supplierCompany

FROM {{ ref('stg_orderdetails') }} AS od
INNER JOIN {{ ref('stg_orders') }} AS o 
ON od.orderID = o.orderID
INNER JOIN {{ ref('stg_products') }} AS pro
ON od.productID = pro.productID
INNER JOIN {{ ref('stg_category') }} AS cat 
ON pro.categoryID = cat.categoryID
INNER JOIN {{ ref('stg_supplier') }} AS sup 
ON pro.supplierID = sup.supplierID

