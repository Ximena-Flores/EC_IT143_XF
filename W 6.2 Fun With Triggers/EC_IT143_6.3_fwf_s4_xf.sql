-- To avoid errors
/*
ALTER TABLE dbo.t_hello_world
ADD last_modified_date DATETIME;
GO

ALTER TABLE dbo.t_hello_world
ADD last_modified_by VARCHAR(100);
GO
*/


GO

CREATE TRIGGER trg_hello_world_last_mod
ON dbo.t_hello_world
AFTER UPDATE
AS
/*
   
    Author: Ximena Flres
    Date: 2026-10-07

    Purpose:
    Automatically updates the date and user whenever
    a record is modified.
*/

BEGIN

    SET NOCOUNT ON;

    UPDATE t
    SET
        last_modified_date = GETDATE(),
        last_modified_by = SYSTEM_USER
    FROM dbo.t_hello_world t
        INNER JOIN inserted i
            ON t.my_message = i.my_message;

END
GO