--Total Order

SELECT 
COUNT(Order_ID)
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]

--Avg Delivery Time

SELECT 
AVG(DATEDIFF(DAY,Order_Date,Actual_Delivery_Date))
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]


--Late Delivery

SELECT 
SUM(CASE
WHEN Delivery_Status = 'Late Delivery' THEN 1
ELSE 0 
END)
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]


--Customer Rating

SELECT 
ROUND(AVG(Customer_Rating),0)
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]

--On Time Delivery

SELECT 
SUM(CASE 
WHEN Delivery_Status = 'Delivered' THEN 1 ELSE 0
END) [On_Time Delivery] 
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]

--Late Deliveries by Shipping

SELECT 
SUM(CASE 
WHEN Delivery_Status = 'Late Delivery' THEN 1
ELSE 0 
END) Late_delivery,
Shipping_Method
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]
GROUP BY Shipping_Method
ORDER BY Late_delivery DESC

--Late delivery by warehouse

SELECT 
Warehouse_Location,
SUM(CASE
WHEN Delivery_Status = 'Late Delivery' THEN 1
ELSE 0
END) Late_delivery
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]
WHERE Warehouse_Location IS NOT NULL
GROUP BY Warehouse_Location
ORDER BY Late_delivery DESC

--Monthly late delivery trend

SELECT 
FORMAT(Order_Date, 'yyyy-MMM') AS Month_year, 
COUNT(Order_ID) Total_Order,
SUM(CASE
WHEN Delivery_Status = 'Late Delivery' THEN 1
ELSE 0
END) AS Late_delivery
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]
GROUP BY FORMAT(Order_Date, 'yyyy-MMM') ,
YEAR(Order_Date),
MONTH(Order_Date) 
ORDER BY 
YEAR(Order_Date),
MONTH(Order_Date) 

--Late Delivery by product category

SELECT
Product_Category,
SUM(CASE
WHEN Delivery_Status = 'Late Delivery' THEN 1
ELSE 0
END) Late_delivery
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]
GROUP BY Product_Category
ORDER BY Late_delivery DESC

--Late delivery by region

SELECT 
Customer_State,
SUM(CASE WHEN Delivery_Status = 'Late Delivery' THEN 1
ELSE 0
END) Late_delivery
FROM [Amazon Delivery Dataset.xlsx - Late Delivery Dataset]
GROUP BY Customer_State
ORDER BY Late_delivery DESC

