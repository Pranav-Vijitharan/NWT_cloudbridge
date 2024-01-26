SELECT
--from order_details

od.orderID,
od.productID,
od.unitPrice,
quantity,
discount,
grossSales,
discountAmount,
netSales,

--from orders

orderDate,
requiredDate,
shippedDate,
freight,
shipCity AS city,
shipRegion AS region,
shipCountry AS country,
{{ profit_profitmargin('o', 'od', 'p') }}, -- Macro to calculate profit & profit margin


--from products

productName,
p.categoryID,
p.supplierID,
unitsinStock,
unitsOnOrder,
reorderLevel,
discontinued,
unitCost,
totalStockValue,
totalOrderValue,
totalProductInventoryValue,
totalStockCost,
totalOrderCost,
totalProductInventoryCost,
reorderCheck,

--from category

categoryName,
description AS categoryDescription,

-- from supplier

companyName AS supplierCompany

FROM {{ ref('stg_orderdetails') }} AS od
INNER JOIN {{ ref('stg_orders') }} AS o 
ON od.orderID = o.orderID
INNER JOIN {{ ref('stg_products') }} AS p
ON od.productID = p.productID
INNER JOIN {{ ref('stg_category') }} AS cat 
ON p.categoryID = cat.categoryID
INNER JOIN {{ ref('stg_supplier') }} AS sup 
ON p.supplierID = sup.supplierID

