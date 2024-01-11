SELECT
--from order_details

od.OrderID,
od.ProductID,
od.UnitPrice,
Quantity,
Discount,
netPrice,
revenue,
discountAmount,

--from orders

OrderDate,
RequiredDate,
ShippedDate,
ShipVia,
Freight,
ShipName,
ShipCity AS city,
ShipRegion AS region,
ShipCountry AS country,
onTimeStatus,
orderDuration,
shippingDelay,
shippingTime,
-- Profit & Profit Margin Calculation
(od.REVENUE - od.DISCOUNTAMOUNT - o.FREIGHT) AS profit,
(od.REVENUE - od.DISCOUNTAMOUNT - o.FREIGHT) / od.REVENUE * 100 AS profitMargin,

--from products

ProductName,
pro.CategoryID,
pro.supplierID,
UnitsinStock,
UnitsOnOrder,
ReorderLevel,
Discontinued,
TotalStockValue,
TotalOrderValue,
TotalValue,
ValuePerUnit,
ReorderCheck,

--from category

CategoryName,
Description AS categoryDescription,
Picture AS categoryPicture,

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

