
  
    

        create or replace transient table NWT_DATA_GRP1.ADO_GRP1_ASG2.reporting_employee
         as
        (

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
FROM NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_orders as o
LEFT JOIN NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_employee as e
ON e.EmployeeID = o.EmployeeID
LEFT JOIN NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_employeeterritories as et
ON e.EmployeeID = et.EmployeeID
        );
      
  