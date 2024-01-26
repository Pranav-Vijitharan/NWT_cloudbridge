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
    et.TerritoryID,
    te.TerritoryDescription,
    te.RegionID,
    r.RegionDescription
FROM {{ ref('stg_employee') }} as e
INNER JOIN {{ ref('stg_employeeterritories') }} as et
ON e.EmployeeID = et.EmployeeID
INNER JOIN {{ ref('stg_territory') }} as te
ON te.TerritoryID = et.TerritoryID
INNER JOIN {{ ref('stg_region') }} as r
ON r.RegionID = te.RegionID
