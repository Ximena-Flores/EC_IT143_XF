/*
Question:
How can I extract the first name from ContactName?
Author: Ximena Flores

Step 6

Compare ad hoc query results to user-defined function results.
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
    END AS AdHocResult,

    dbo.ufn_GetFirstName(ContactName) AS FunctionResult

FROM dbo.t_w3_schools_customers;