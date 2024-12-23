{{ config(materialized = 'table') }}

SELECT
o.ORDERID,
p.PRODUCTID,
cust.CUSTOMERID,
cust.COMPANYNAME,
cust.CONTACTTITLE,
cust.CITY,
cust.REGION,
cust.COUNTRY,
o.ORDERDATE,
cat.CATEGORYNAME,
p.PRODUCTNAME,
od.UNITPRICE,
od.NETSALES,
p.UNITCOST,
od.QUANTITY,
od.DISCOUNT,
od.DISCOUNTAMOUNT,
od.GROSSSALES,
{{ profit_profitmargin('o', 'od', 'p') }}

-- ORDERS CONNECTION
FROM {{ref('stg_orders') }} AS o
-- ORDER DETAILS CONNECTION
INNER JOIN {{ref('stg_orderdetails')}} AS od ON o.ORDERID = od.ORDERID
-- PRODUCT CONNECTION
INNER JOIN {{ref('stg_products')}} AS p ON od.PRODUCTID = p.PRODUCTID
-- CATEGORY CONNECTION
INNER JOIN {{ref('stg_category')}} AS cat ON p.CATEGORYID = cat.CATEGORYID
-- CUSTOMER CONNECTION
INNER JOIN {{ref('stg_customer')}} AS cust ON o.CUSTOMERID = cust.CUSTOMERID