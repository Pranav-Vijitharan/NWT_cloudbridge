
  
    

        create or replace transient table NWT_DATA_GRP1.ADO_GRP1_ASG2.reporting_customer
         as
        (

SELECT 
c.customerID,
c.companyName,
c.contactName,
c.contactTitle,
c.country,
c.region,
c.city,
o.freight,
o.ontimestatus,
o.shippingdelay,
o.shippingtime,
o.orderDate,
s.companyName AS shippingCompanyName,
od.revenue,
od.quantity,
od.discountAmount,
od.netPrice,
p.productName,
ca.categoryName
FROM NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_customer AS c
INNER JOIN NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_orders AS o ON c.customerID = o.customerID
INNER JOIN NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_shipper AS s ON o.shipVia = s.shipperID
INNER JOIN NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_orderdetails AS od ON o.orderID = od.orderID
INNER JOIN NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_products AS p ON od.productID = p.productID
INNER JOIN NWT_DATA_GRP1.ADO_GRP1_ASG2.stg_category AS ca ON p.categoryID = ca.categoryID
        );
      
  