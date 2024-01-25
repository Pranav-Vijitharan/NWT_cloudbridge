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
    REPLACE(region, 'NULL', '') AS region,
    REPLACE(fax, 'NULL', '') AS fax
FROM 
NWT_DATA_GRP1.ADO_GRP1_ASG2.CUSTOMER