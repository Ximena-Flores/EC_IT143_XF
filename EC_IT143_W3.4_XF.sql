/*****************************************************************************************************************
NAME:    3.4 Adventure Works—Create Answers
PURPOSE: Create answer and practice how manage data

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     09/18/2026   Ximena Flores     1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
I'm developing this script as part of a school assignment. I will answer several questions 
related to data management and business information in the AdventureWorks company.
******************************************************************************************************************/

-- Q1: Marginal complexity: Which product ID has the highest total quantity sold? 
--Author: Gabriel Espolong Rodriguez
-- A1: ProductID 712	Total Quantity Sold 8311
--Just to see the tables
SELECT *
FROM[Sales].[SalesOrderDetail]; 

--To obtain the result
SELECT TOP 1
   ProductID,
  SUM(OrderQty) AS "Total Quantity Sold"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY "Total Quantity Sold" 
DESC;

/* Q2 Marginal complexity:  How many employees currently work for AdventureWorks?
Author: Boutoto Godsend
 A2: Current Employees 290 */
 --First just to see the table info
 SELECT *
FROM[HumanResources].[Employee];

-- To obtain the response
SELECT COUNT(*) AS "Current Employees"
FROM HumanResources.Employee;

/* Q3 Moderate complexity: AdventureWorks wants to understand its product portfolio.
Which product subcategory contains the most products, and how many products does it contain?
Author: Boutoto Godsend
 A3:The product subcategory with the most products is
 Road Bikes, containing 43 products. */

 SELECT TOP 1
    ps.ProductSubcategoryID,
    ps.Name AS "SubCategory With Most Products",
    COUNT(p.ProductID) AS Units
FROM Production.Product p
INNER JOIN Production.ProductSubcategory ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY
    ps.ProductSubcategoryID,
    ps.Name
ORDER BY Units DESC;

/* Q4 Moderate complexity: Which customers placed the most sales orders? 
Can you show each customer's name and total number of orders?
Author: Daniel Asuquo
 A4: Note:Some clients of AdventureWorks are Stores not persons. */

 SELECT 
    c.CustomerID,
    CONCAT(p.FirstName, ' ', p.LastName) AS "Customer Name",
    COUNT(soh.SalesOrderID) AS "Total Sales"
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
INNER JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
GROUP BY
    c.CustomerID,
    p.FirstName,
    p.LastName
ORDER BY "Total Sales" 
DESC;

/* Q5 Increased complexity:The company would like to thank you for your purchases by offering 
a special discount to our top three customers.
Which 3 customers placed the most orders during 2014?
Author: Ximena Flores
 A5: Ashley Henderson, Nancy Chapman, Jennifer Simmons*/
 SELECT TOP 3
    c.CustomerID,
    CONCAT(p.FirstName, ' ', p.LastName) AS "Customer Name",
    COUNT(soh.SalesOrderID) AS "Total Orders"
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
INNER JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
WHERE YEAR(soh.OrderDate) = 2014
GROUP BY
    c.CustomerID,
    p.FirstName,
    p.LastName
ORDER BY "Total Orders" 
DESC;

/* Q6 Increased complexity:The executive team is analyzing touring bike
performance across calendar year 2012. We need a summary detailing 
total units sold and total revenue for each red touring bike model sold that year.
Please group the output by product name and sort from highest to lowest revenue.
Author: Wisdom Sawer
 A6: There are no touring bike models sold that year*/

 SELECT
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalUnitsSold,
    SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail AS sod
    ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS ps
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE YEAR(soh.OrderDate) = 2012
    AND ps.Name = 'Touring Bikes'
    AND p.Color = 'Red'
GROUP BY
    p.Name
ORDER BY
    TotalRevenue DESC;

  /* Q7 MetaData Quest:How many tables exist in the AdventureWorks 
database according to the INFORMATION_SCHEMA.TABLES system information schema view?
View: INFORMATION_SCHEMA.TABLES.
Author: Wisdom Sawer
 A6: 71 tables */  

 SELECT COUNT(*) AS TotalTables
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

 /* Q8 MetaData Quest: Which tables include columns related to customer information, such as CustomerID?
Author: Ximena Flores
 A6: Customer and SalesOrderHeader */
 
 SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME LIKE '%Customer%'
ORDER BY TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME;

SELECT GETDATE() AS my_date;