{{ config (materialized='table')}}

SELECT 
    supplierID,
    CompanyName,
    contactName,
    contactTitle,
    address,
    city,
    REPLACE(region, 'NULL', NULL) AS region,
    postalcode,
    country,
    phone,
    REPLACE(fax, 'NULL', NULL) AS fax,
    REPLACE(homePage, 'NULL', NULL) AS homePage
FROM 
NWT_DATA_GRP1.ADO_GRP1_ASG2.SUPPLIER