{{ config(materialized = 'table') }}

SELECT
-- Profit column
-- (od.REVENUE - od.DISCOUNTAMOUNT - o.FREIGHT - p.UNITCOST) AS profit,
-- (od.REVENUE - od.DISCOUNTAMOUNT - o.FREIGHT - p.UNITCOST) / od.REVENUE * 100 AS profitMargin,
-- Orders table
o.ORDERID,
o.ORDERDATE,
o.FREIGHT,
-- Order details table
od.QUANTITY,
od.DISCOUNT,
od.NETPRICE,
od.REVENUE,
od.DISCOUNTAMOUNT,
-- Product Table
p.PRODUCTID,
p.UNITPRICE,
p.PRODUCTNAME,
p.DISCONTINUED,
p.TOTALVALUE,
-- Category Table
cat.CATEGORYNAME,
-- Customer Table
cust.CUSTOMERID,
cust.COMPANYNAME,
cust.CONTACTTITLE,
cust.CITY,
cust.REGION,
cust.COUNTRY
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
