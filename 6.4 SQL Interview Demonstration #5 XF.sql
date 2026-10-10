USE AdventureWorks2022;
GO

/* ============================================================
   INNER JOIN
   Returns only the rows that have matching values in both tables.

   Example:
   Retrieve customers who have placed at least one order.
   Only records with matching CustomerID values in both
   tables will be returned.
   ============================================================ */

SELECT
    c.CustomerID,
    soh.SalesOrderID,
    soh.OrderDate
FROM Sales.Customer AS c
INNER JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID;
GO


/* ============================================================
   LEFT OUTER JOIN
   Returns all rows from the left table and the matching rows
   from the right table.

   If no match exists in the right table, NULL values are returned.

   Example:
   Identify customers who have not placed any orders by filtering
   for NULL values in SalesOrderID.
   ============================================================ */

SELECT
    c.CustomerID,
    soh.SalesOrderID
FROM Sales.Customer AS c
LEFT JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID;
GO


/* ============================================================
   RIGHT OUTER JOIN
   Returns all rows from the right table and the matching rows
   from the left table.

   If no match exists in the left table, NULL values are returned.

   Example:
   Ensure that all sales orders are included in the result set,
   even if a related customer record is missing.
   ============================================================ */

SELECT
    c.CustomerID,
    soh.SalesOrderID
FROM Sales.Customer AS c
RIGHT JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID;
GO


/* ============================================================
   FULL OUTER JOIN
   Returns all rows from both tables.

   Matching rows are combined, while non-matching rows from
   either table are returned with NULL values for the missing side.

   Example:
   Compare two datasets and identify both matching and
   non-matching records.
   ============================================================ */

SELECT
    c.CustomerID,
    soh.SalesOrderID
FROM Sales.Customer AS c
FULL OUTER JOIN Sales.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID;
GO


/* ============================================================
   CROSS JOIN
   Returns the Cartesian product of both tables.

   Every row from the first table is combined with every row
   from the second table. No join condition is used.

   Example:
   Generate all possible combinations between two datasets,
   such as products and measurement units.

   Important Warning:
   Sometimes cross joins can return a very large number of rows.
   ============================================================ */

SELECT
    p.Name AS ProductName,
    u.Name AS UnitMeasure
FROM Production.Product AS p
CROSS JOIN Production.UnitMeasure AS u;
GO


/* ============================================================
   SELF JOIN
   A table is joined to itself using aliases.

   Example:
   Display hierarchical relationships such as employees
   and their managers.

   In this example, each employee is matched with the manager
   represented by the parent node in the organizational hierarchy.
   ============================================================ */

SELECT
    emp.BusinessEntityID AS EmployeeID,
    mgr.BusinessEntityID AS ManagerID
FROM HumanResources.Employee AS emp
LEFT JOIN HumanResources.Employee AS mgr
    ON emp.OrganizationNode.GetAncestor(1) = mgr.OrganizationNode;
GO