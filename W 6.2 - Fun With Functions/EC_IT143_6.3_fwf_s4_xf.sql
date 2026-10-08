/*
Question:
How can I extract the first name from ContactName?
Research Source:
How to extract only the first name from combined name File?

https://learn.microsoft.com/en-us/sql/t-sql/functions/charindex-transact-sql

Purpose:
Locate the first space within ContactName.
*/

SELECT
    ContactName,
    CASE
        WHEN CHARINDEX(' ', ContactName) > 0
        THEN LEFT(
                ContactName,
                CHARINDEX(' ', ContactName) - 1
             )
        ELSE ContactName
    END AS FirstName
FROM dbo.t_w3_schools_customers;
