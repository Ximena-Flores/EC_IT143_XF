DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

CREATE VIEW dbo.v_hello_world_load
AS

/*****************************************************************************************************************
NAME:    dbo.v_hello_world_load
PURPOSE: Create the Helllo World - Load view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     09/23/2026   Ximena Flores       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This script exist to help me learn step 4 of 8 in the Answer Focused Approach
for T_SQL Data Manipulation
******************************************************************************************************************/

SELECT 'Hello World' AS my_message
, GETDATE() AS current_date_time;