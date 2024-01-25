{{ config(materialized = 'table') }}

SELECT
-- Profit column
-- (od.REVENUE - od.DISCOUNTAMOUNT - o.FREIGHT - p.UNITCOST) AS profit,
-- (od.REVENUE - od.DISCOUNTAMOUNT - o.FREIGHT - p.UNITCOST) / od.REVENUE * 100 AS profitMargin,

o.ORDERID,
p.PRODUCTID,
cust.CUSTOMERID,
cust.COMPANYNAME,
cust.CONTACTTITLE,
cust.CITY,
cust.REGION,
cust.COUNTRY
o.ORDERDATE,
cat.CATEGORYNAME,
p.PRODUCTNAME,
p.UNITPRICE,
p.DISCONTINUED,
p.TOTALVALUE,
o.FREIGHT,
od.QUANTITY,
od.DISCOUNT,
od.DISCOUNTAMOUNT,
od.NETPRICE,
od.REVENUE,
{{ calculate_profit('o', 'od', 'p') }}

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
