{{ config (materialized='table')}}

SELECT 
    customerID,
    companyName,
    contactName,
    contactTitle,
    address,
    city,
    postalcode,
    country,
    phone,
    REPLACE(region, 'NULL', NULL) AS region,
    REPLACE(fax, 'NULL', NULL) AS fax
FROM 
NWT_DATA_GRP1.ADO_GRP1_ASG2.CUSTOMER