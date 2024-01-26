{{ config (materialized='table')}}

SELECT
    e.EmployeeID,
    e.FullName,
    e.Title,
    e.Age,
    e.EmployeeTenure,
    e.Address AS EmployeeAddress,
    e.City AS EmployeeCity,
    e.Region AS EmployeeRegion,
    e.Country AS EmployeeCountry,
    -- et.TerritoryID,
    -- te.TerritoryDescription,
    -- te.RegionID,
    -- r.RegionDescription,
    e.ReportsTo,
    o.OrderID,
    o.OrderDate,
    o.RequiredDate,
    o.ShippedDate,
    o.ShipCountry AS OrderShipCountry,
    od.UnitPrice,
	od.Quantity,
	od.Discount,
	od.GrossSales,
	od.DiscountAmount,
    cat.categoryName,
    cat.description AS categoryDescription,
    {{ profit_profitmargin('o', 'od', 'p') }} -- Macro to calculate profit & profit margin

FROM {{ ref('stg_orders') }} as o
INNER JOIN {{ ref('stg_employee') }} as e
ON e.EmployeeID = o.EmployeeID
-- INNER JOIN {{ ref('stg_employeeterritories') }} as et
-- ON e.EmployeeID = et.EmployeeID
-- INNER JOIN {{ ref('stg_territory') }} as te
-- ON te.TerritoryID = et.TerritoryID
-- INNER JOIN {{ ref('stg_region') }} as r
-- ON r.RegionID = te.RegionID
INNER JOIN {{ ref('stg_orderdetails') }} as od
ON o.OrderID = od.OrderID
INNER JOIN {{ ref('stg_products') }} AS p
ON od.productID = p.productID
INNER JOIN {{ ref('stg_category') }} AS cat 
ON p.categoryID = cat.categoryID