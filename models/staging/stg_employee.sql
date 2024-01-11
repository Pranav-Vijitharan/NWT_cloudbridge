{{ config (materialized='view')}}
SELECT *,
       CONCAT(firstName, ' ', lastName) AS fullName,
       YEAR(CURRENT_DATE) - YEAR(birthDate) AS age,
       YEAR(CURRENT_DATE) - YEAR(hireDate) AS employeeTenure
FROM {{ ref ('raw_employee')}}