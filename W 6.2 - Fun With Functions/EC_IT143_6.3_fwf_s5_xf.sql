/*******************************************************
Name: dbo.ufn_GetFirstName
Purpose: Get the first name from combined name

MODIFICATION LOG:
Ver          Date             Author         Descrption
------      ---------      -----------      -------------------
1.0         10/07/2026      Ximena Flores    1. Built this script for EC IT
********************************************************/
--to avoid errors:
DROP FUNCTION dbo.ufn_GetFirstName;
GO


--Create
CREATE FUNCTION dbo.ufn_GetFirstName
(
    @ContactName VARCHAR(100)
)
RETURNS VARCHAR(50)
AS
BEGIN

    RETURN
    (
        CASE
            WHEN CHARINDEX(' ', @ContactName) > 0
                THEN LEFT(
                        @ContactName,
                        CHARINDEX(' ', @ContactName) - 1
                     )
            ELSE @ContactName
        END
    );

END;


/*Test:
SELECT
    ContactName,
    dbo.ufn_GetFirstName(ContactName) AS FirstName
FROM dbo.t_w3_schools_customers;
GO

/*