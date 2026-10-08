/*
    EC_IT143_6.3_fwt_s2_xx.sql
    Author: Ximena Flores
    Date: 2026-10-07

    ALTER TABLE dbo.t_hello_world
ADD last_modified_date DATETIME DEFAULT GETDATE ();

    Current understanding:
    I need a way to automatically update a column whenever a record is modified.

    Next logical step:
    Research SQL Server triggers and determine how an AFTER UPDATE trigger
    can update a LastModifiedDate column.
*/