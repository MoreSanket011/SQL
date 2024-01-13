CREATE DATABASE Customers_Orders_Products 
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(50),
  Email VARCHAR(100)
);
INSERT INTO Customers (CustomerID, Name, Email)
VALUES
  (1, 'John Doe', 'johndoe@example.com'),
  (2, 'Jane Smith', 'janesmith@example.com'),
  (3, 'Robert Johnson', 'robertjohnson@example.com'),
  (4, 'Emily Brown', 'emilybrown@example.com'),
  (5, 'Michael Davis', 'michaeldavis@example.com'),
  (6, 'Sarah Wilson', 'sarahwilson@example.com'),
  (7, 'David Thompson', 'davidthompson@example.com'),
  (8, 'Jessica Lee', 'jessicalee@example.com'),
  (9, 'William Turner', 'williamturner@example.com'),
  (10, 'Olivia Martinez', 'oliviamartinez@example.com');

  SELECT * FROM Customers
----------------------------------------------------------------------------

  CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  ProductName VARCHAR(50),
  OrderDate DATE,
  Quantity INT
);

INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
  (1, 1, 'Product A', '2023-07-01', 5),
  (2, 2, 'Product B', '2023-07-02', 3),
  (3, 3, 'Product C', '2023-07-03', 2),
  (4, 4, 'Product A', '2023-07-04', 1),
  (5, 5, 'Product B', '2023-07-05', 4),
  (6, 6, 'Product C', '2023-07-06', 2),
  (7, 7, 'Product A', '2023-07-07', 3),
  (8, 8, 'Product B', '2023-07-08', 2),
  (9, 9, 'Product C', '2023-07-09', 5),
  (10, 10, 'Product A', '2023-07-10', 1);

  SELECT * FROM Orders
---------------------------------------------------------
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Product A', 10.99),
  (2, 'Product B', 8.99),
  (3, 'Product C', 5.99),
  (4, 'Product D', 12.99),
  (5, 'Product E', 7.99),
  (6, 'Product F', 6.99),
  (7, 'Product G', 9.99),
  (8, 'Product H', 11.99),
  (9, 'Product I', 14.99),
  (10, 'Product J', 4.99);

    SELECT * FROM Products
	--------------------------------------------------------------------
	--Q1)1.	Write a query to retrieve all records from the Customers table..
	SELECT * FROM Customers
	-----------------------------------
	--Q2)2.	Write a query to retrieve the names and email addresses of customers whose names start with 'J'.
	SELECT * FROM Customers WHERE Name  LIKE 'J%';
	------------------------------------------
	--Q3)3.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for all orders..
	SELECT OrderID,ProductName,Quantity FROM Orders
	---------------------------------------------
	--Q4)4.	Write a query to calculate the total quantity of products ordered.
	SELECT SUM (Quantity)
	FROM Orders
	-------------------------------------
	--Q5)5.	Write a query to retrieve the names of customers who have placed an order.
	SELECT Customers.Name
	FROM Orders , Customers where  Customers.CustomerID=Orders.CustomerID
	-------------------------------------------------------
	--Q6)6.	Write a query to retrieve the products with a price greater than $10.00.
	SELECT * FROM Products
	SELECT Price FROM Products WHERE Price >10
	---------------------------------
	--Q7)7.	Write a query to retrieve the customer name and order date for all orders placed on or after '2023-07-05'.

	SELECT * FROM Customers
	SELECT * FROM Orders

	SELECT Customers.Name,Orders.OrderDate FROM Customers,Orders 
	WHERE Customers.CustomerID=Orders.CustomerID AND OrderDate>'2023-07-05'
	--------------------------------------------------------------
	--8)8.	Write a query to calculate the average price of all products.
	  SELECT AVG (Price) FROM Products
	----------------------------------------
	--Q9)9.	Write a query to retrieve the customer names along with the total quantity of products they have ordered.
	SELECT * FROM Customers
	SELECT * FROM Orders
	SELECT Customers.Name,Orders.Quantity FROM Customers,Orders WHERE Customers.CustomerID=Orders.CustomerID
	-------------------------------------------------
	--Q10)10.	Write a query to retrieve the products that have not been ordered.
	SELECT Products.ProductName FROM Products
	LEFT JOIN Orders ON Products.ProductName =Orders.ProductName
	WHERE Orders.ProductName IS NULL;

	SELECT * FROM Products
	SELECT * FROM Orders
--/////////////////////////////////////TASK_1_COMPLETED////////////////////////////////////////





--Q1)1.	Write a query to retrieve the top 5 customers who have placed the highest total quantity of orders.

	SELECT TOP 5 Customers.Name,SUM (ORDERS.QUANTITY) AS HIGHEST_QUANTITY  FROM Customers
	JOIN Orders ON Customers.CustomerID=Orders.CustomerID
	GROUP BY Customers.Name
	ORDER BY HIGHEST_QUANTITY DESC
	--------------------------------------------------
	--Q2)2.	Write a query to calculate the average price of products for each product category.
	SELECT * FROM Products
	
	SELECT P.ProductName, AVG(Q.PRICE)  AS AVGPRICE
	FROM Products P
	JOIN Products Q ON P.ProductID = Q.ProductID
	GROUP BY P.ProductName
	---------------------------------------------------------------
	--Q4)4.	Write a query to retrieve the order details (OrderID, ProductName, Quantity) for orders 
	          --placed by customers whose names start with 'M'.
			  SELECT * FROM Customers
			  SELECT * FROM Orders
SELECT P.OrderID,P.ProductName,P.Quantity FROM Orders P
JOIN Customers C ON P.CustomerID=C.CustomerID
WHERE C.Name LIKE 'M%'
-----------------------------------
--Q5)5.	Write a query to calculate the total revenue generated from all orders.
SELECT SUM (O.Quantity * P.Price  ) AS TOTALREVENUE FROM Orders O
JOIN Products P ON O.OrderID = P.ProductID
------------------------------------------
--Q6)6.	Write a query to retrieve the customer names along with the total revenue generated from their orders.
SELECT C.Name ,SUM (O.QUANTITY * P.PRICE) AS TOTAREV
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN Products P ON O.OrderID = P.ProductID
GROUP BY C.Name
-------------------------------------------
--Q7)7.	Write a query to retrieve the customers who have placed at least one order for each product category.
SELECT * FROM Customers

SELECT * FROM Orders
-----------------------------------------------------------
--Q8)Write a query to retrieve the customers who have placed on orders on consecutive days

select c.Name from Customers c
where exists (
select 1
from Orders o1
where c.CustomerID = o1.CustomerID
and exists (
select 1
from Orders o2
where c.CustomerID = o2.CustomerID
and o1.OrderDate = DATEADD (day,1,o2.OrderDate)
)
)
-------------------------------------------------
--Q9) write a query to retrive the top 3 products with the highest average quantity ordered

select TOP 3 ProductName, AVG(Quantity) as avg_quantity  from Orders
group by ProductName
order by avg_quantity DESC
 
 
 SELECT * FROM Orders
 --------------------------------------------------------------------
 --Q10) write a query to  calculate percentage	of orders that have  a quantity  greater  than the  aveage  quantity

 select (count ( case when Quantity > avg_quantity then 1 else null end) / count (*))* 100 as percentage
 from Orders o
 cross join (
  select avg (Quantity) as avg_quantity from Orders) as avg_table;

--////////////////////////////////TASK 2 IS COMPLETED//////////////////////////-----------------------------------------------------

--Q1)WRITE A QUERY TO RETRIVE THE CUSTOMERS HAVE PLACED ORDERS FOR ALL PRODUCTS
SELECT CustomerID FROM [Orders] 
GROUP BY CustomerID
HAVING COUNT (DISTINCT ProductName )= (SELECT COUNT (DISTINCT ProductName)FROM [Orders])
SELECT * FROM Orders
------------------------------------------------------------------------------------------------------
--Q2) WRITE A QUERY TO RETRIVE THE PRODUCTS THAT HAVE BEEN OREDERD  BY ALL CUSTOMERS 
SELECT ProductName FROM Orders
GROUP BY ProductName
HAVING COUNT(DISTINCT CustomerID) = (SELECT COUNT (DISTINCT CustomerID) FROM Orders)
-----------------------------------------------------
--Q3)WRITE A QUERY TO CALCULATE THE TOTAL  REVENUE GENERATED FROM ORDER PLACED IN EACH MONTH
SELECT DATEPART (YEAR FROM [OrderDate] ) AS [YEAR],
 DATEPART (MONTH FROM [OrderDate]  ) AS [MONTH],
SUM (Quantity) AS TOTAL_REVENUE
FROM Orders 
GROUP BY DATEPART (YEAR FROM [OrderDate] ),  DATEPART (MONTH FROM [OrderDate])
ORDER BY [YEAR],[MONTH]
------------------------------------------------
--Q4)WRITE A QUERY TO RETRIVE THE PRODUCT THAT HAVE BEEN ORDERED BY MORE THAN 50%  OF THE CUSTOMERS
SELECT ProductName FROM Orders
GROUP BY ProductName
HAVING COUNT(DISTINCT CustomerID) > (SELECT COUNT (DISTINCT CustomerID) * 0.5 FROM Orders)
----------------------------------------------------------------
--Q5) WRITE A QUERY TO RETRIVE TOP 5 CUSTOMERS  WHO HAVE SPENT THE HIGHEST AMOUNT OF MONEY ON ORDERS
SELECT TOP 5 C.Name,C.CustomerID , SUM(O.Quantity) AS TOP5 FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID,C.Name
------------------------------------------------------------
--Q6 WRITE A QUERY TO CALCULATE  THE RUNNING TOTAL  OF ORDER QUANTITES FOR EACH  CUSTOMER
SELECT C.CustomerID,SUM(O.Quantity) OVER (PARTITION BY O.CustomerID ) AS RUNNING_TOTAL FROM Customers C
JOIN Orders O ON C.CustomerID=  O.CustomerID
ORDER BY C.CustomerID
---------------------------------------------------------
--Q7)WRITE A QUERY TO RETRIVE THE TOP 3 MOST RECENT ORDERS FOR EACH CUSTOMERS
WITH RankedOrders AS ( SELECT o.customerid,o.orderid,o.orderdate,ROW_NUMBER() OVER (PARTITION BY o.customerid ORDER BY o.orderdate DESC) AS row_num
FROM Customers c
JOIN "Orders" o ON c.customerid = o.customerid
)
SELECT ro.customerid,ro.orderid,ro.orderdate FROM RankedOrders ro
WHERE ro.row_num <= 3
ORDER BY ro.customerid, ro.orderdate DESC;
---------------------------------------------------------------------------
--Q8)WRITE A QUERY TO CALCULATE THE TOTAL REVENUE  GENERATED BY EACH CUSTOMER BY LAST 30 DAYS 
SELECT c.customerid,c.name, SUM(o.Quantity) AS total_revenue
FROM Customers c
JOIN Orders o
ON c.customerid = o.CustomerID
WHERE o.orderdate >= DATEADD(day, -30, GETDATE())  
GROUP BY c.customerid, c.name
ORDER BY total_revenue DESC;
----------------------------------------------------------
--Q9)WRITE A QUERY TO RETRIVE THE CUSTOMERS WHO HAVE PLACED ORDERS FOR AT LEAST TWO DIFFRENT PRODUCT CATEGORIES
SELECT DISTINCT c.customerid, c.name
FROM Customers c
WHERE (
  SELECT COUNT(DISTINCT p.ProductName)
  FROM Orders o
  JOIN Products p ON o.OrderID = p.productid
  WHERE o.customerid = c.customerid
) >= 2;
------------------------------------------------------------------------------
--Q10) WRITE A QUERY TO CALCULATE AVERAGE REVENUE PER ORDER  FOR EACH CUSTOMER
SELECT c.customerid, c.name,AVG(o.Quantity) AS average_revenue_per_order
FROM customers c
JOIN
orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.name;
--------------------------------------------------------------
--Q11)Write a query to retrive the customers who have placed orders for every month of specific year
DECLARE @year INT = 2023
SELECT c.customerid, c.Name
FROM customers c
WHERE   NOT EXISTS (SELECT DISTINCT DATEPART(MONTH, o.orderdate) FROM orders o  WHERE c.customerid = o.customerid
 AND YEAR(o.orderdate) = @year
 EXCEPT
 SELECT DISTINCT month_number FROM ( VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12)) AS all_months(month_number)
 );
 -------------------------------------------------------------------
 --Q12) write  a query to retrive the customers  who have placed  for a specific product 
 --in cosecutive month
SELECT DISTINCT c.customerid, c.name
FROM customers c
INNER JOIN orders o1 ON c.customerid = o1.customerid
WHERE o1.ProductName = 'your_productname'
AND EXISTS (
    SELECT 1
    FROM orders o2
    WHERE o2.customerid = c.customerid
    AND o2.ProductName = 'your_productname'
    AND DATEADD(MONTH, 1, o1.OrderDate) = o2.orderdate
)
------------------------------------------------------------
--Q13)Write query to retrieve the product that have been ordered a specific customer at least twice
SELECT ProductName FROM Orders
GROUP BY ProductName
HAVING COUNT(*) >=2
---------------------------------------------------
-->>>>>>>>>>>>>>>>>>>>PROJECT COMPLETED>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>




