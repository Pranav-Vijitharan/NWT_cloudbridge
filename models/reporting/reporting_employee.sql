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
    e.PostalCode AS EmployeePostalCode,
    e.Country AS EmployeeCountry,
    et.TerritoryID,
    te.TerritoryDescription,
    te.RegionID,
    r.RegionDescription,
    e.Notes,
    e.ReportsTo,
    o.OrderID,
    o.OrderDate,
    o.RequiredDate,
    o.ShippedDate,
    o.Freight,
    o.ShipName,
    o.ShipAddress AS OrderShipAddress,
    o.ShipCity AS OrderShipCity,
    o.ShipRegion AS OrderShipRegion,
    o.ShipPostalCode AS OrderShipPostalCode,
    o.ShipCountry AS OrderShipCountry,
    od.UnitPrice,
	od.Quantity,
	od.Discount,
	od.NetPrice,
	od.Revenue,
	od.DiscountAmount
FROM {{ ref('stg_orders') }} as o
INNER JOIN {{ ref('stg_employee') }} as e
ON e.EmployeeID = o.EmployeeID
INNER JOIN {{ ref('stg_employeeterritories') }} as et
ON e.EmployeeID = et.EmployeeID
INNER JOIN {{ ref('stg_territory') }} as te
ON te.TerritoryID = et.TerritoryID
INNER JOIN {{ ref('stg_region') }} as r
ON r.RegionID = te.RegionID
INNER JOIN {{ ref('stg_orderdetails') }} as od
ON o.OrderID = od.OrderID
