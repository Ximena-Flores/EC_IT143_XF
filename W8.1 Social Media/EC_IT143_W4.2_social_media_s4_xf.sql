DROP VIEW IF EXISTS dbo.v_social_media_platform_count;
GO

/*****************************************************************************************************************
NAME:    My Script Name
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     09/23/2026  Ximena Flores     Create a view that summarizes the number of students by primary social media
platform.


RUNTIME: 
Xm Xs

NOTES: 
This is 
******************************************************************************************************************/

-- Q1: How many students use each social media platform?
CREATE VIEW dbo.v_social_media_platform_count
AS
SELECT
    Primary_Platform,
    COUNT(*) AS Student_Count
FROM dbo.Social_media_impact_on_life
GROUP BY Primary_Platform;
GO

SELECT *
FROM dbo.v_social_media_platform_count;