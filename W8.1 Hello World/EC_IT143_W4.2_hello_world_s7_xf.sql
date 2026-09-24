CREATE PROCEDURE dbo.usp_hello_world_load
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
This script exist to help me learn step 7 of 8 in the Answer Focused Approach
for T_SQL Data Manipulation
******************************************************************************************************************/
 
  BEGIN 

   --1)Reload date 
    TRUNCATE TABLE dbo.t_hello_world;

    INSERT INTO dbo.t_hello_world
           SELECT v.my_message
           , v.current_date_time
              FROM dbo.v_hello_world_load AS v;

    --2) Review results

    SELECT t.*
       FROM dbo.t_hello_world AS t;

    END;
GO