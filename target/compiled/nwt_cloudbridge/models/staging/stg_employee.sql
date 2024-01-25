
SELECT *,
       CONCAT(firstName, ' ', lastName) AS fullName,
       YEAR(CURRENT_DATE) - YEAR(birthDate) AS age,
       YEAR(CURRENT_DATE) - YEAR(hireDate) AS employeeTenure
FROM NWT_DATA_GRP1.ADO_GRP1_ASG2.raw_employee