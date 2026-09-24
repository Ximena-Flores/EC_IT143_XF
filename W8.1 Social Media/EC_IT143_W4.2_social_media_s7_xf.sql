/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s7_XF.sql
PURPOSE: Create a stored procedure that refreshes the table from the view.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     09/23/2026   Ximena Flores       1. Built this script for EC IT143 W4.2


RUNTIME: 
Xm Xs

NOTES: 
Create a view that summarizes the number of students using each primary social media platform.

Tables Used:
dbo.Social_media_impact_on_life
******************************************************************************************************************/

-- Q1: How many students use each social media platform?

CREATE PROCEDURE dbo.load_social_media_platform_count
AS
BEGIN

    TRUNCATE TABLE dbo.t_social_media_platform_count;

    INSERT INTO dbo.t_social_media_platform_count
    (
        Primary_Platform,
        Student_Count
    )
    SELECT
        Primary_Platform,
        Student_Count
    FROM dbo.v_social_media_platform_count;

END;
GO