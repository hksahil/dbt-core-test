WITH ORDERS AS 
(
SELECT * FROM {{source('First Ecomm Pipeline','FACT_ORDERS_2023')}}
UNION ALL
SELECT * FROM {{source('First Ecomm Pipeline','FACT_ORDERS_2024')}}
)


SELECT a.* FROM ORDERS a
LEFT JOIN {{source('First Ecomm Pipeline','DIM_PRODUCT_DETAILS')}} b
ON a.PRODUCT_ID=b.PRODUCT_ID
LEFT JOIN {{source('First Ecomm Pipeline','DIM_PRODUCTS')}} c
ON a.PRODUCT_ID=c.PRODUCT_ID
LEFT JOIN {{source('First Ecomm Pipeline','DIM_CUST')}} d 
ON c.CUSTOMER_ID=d.CUSTOMER_ID