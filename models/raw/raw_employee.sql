{{ config (materialized='table')}}

SELECT 
    employeeID,
    lastName,
    firstName,
    title,
    titleOfCourtesy,
    birthDate,
    hireDate,
    address,
    city,
    REPLACE(region, 'NULL', '') AS region,
    postalcode,
    country,
    homePhone,
    extension,
    photo,
    notes,
    CASE 
        WHEN REPLACE(reportsTo, 'NULL', '') = '' THEN NULL
        ELSE CAST(REPLACE(reportsTo, 'NULL', '') AS INT)
    END AS reportsTo,
    photoPath
FROM 
NWT_DATA_GRP1.ADO_GRP1_ASG2.employee