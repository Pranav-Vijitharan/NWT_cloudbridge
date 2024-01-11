SELECT
    e.EmployeeID,
    e.fullName,
    e.Title,
    e.age,
    e.employeeTenure AS EmployeeTenure,
    e.Address AS EmployeeAddress,
    e.City AS EmployeeCity,
    e.Region AS EmployeeRegion,
    e.PostalCode AS EmployeePostalCode,
    e.Country AS EmployeeCountry,
    et.territoryid,
    e.HomePhone,
    e.Extension,
    e.Photo,
    e.Notes,
    e.ReportsTo,
    e.PhotoPath,
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
    o.ShipCountry AS OrderShipCountry
FROM {{ ref('stg_orders') }} as o
LEFT JOIN {{ ref('stg_employee') }} as e
ON e.EmployeeID = o.EmployeeID
LEFT JOIN {{ ref('stg_employeeterritories') }} as et
ON e.EmployeeID = et.EmployeeID