/*
Question:
How can I extract the first name from ContactName?

Author: Ximena Flores

Step 7

0 Results Expected Test

https://learn.microsoft.com/en-us/sql/t-sql/queries/with-common-table-expression-transact-sql?view=sql-server-ver16

Purpose:
Verify that the user-defined function returns
the same results as the ad hoc query.
*/

WITH cte_test AS
(
    SELECT
        ContactName,

        CASE
            WHEN CHARINDEX(' ', ContactName) > 0
                THEN LEFT(
                        ContactName,
                        CHARINDEX(' ', ContactName) - 1
                     )
            ELSE ContactName
        END AS AdHocResult,

        dbo.ufn_GetFirstName(ContactName) AS FunctionResult

    FROM dbo.t_w3_schools_customers
)

SELECT *
FROM cte_test
WHERE AdHocResult <> FunctionResult;