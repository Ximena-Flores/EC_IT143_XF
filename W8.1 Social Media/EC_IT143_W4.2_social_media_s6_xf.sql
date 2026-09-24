/*
Question:
How many students use each social media platform?

Purpose:
Load the table from the view.
*/
--Empty the table
TRUNCATE TABLE dbo.t_social_media_platform_count;
GO

--Refill from the view
INSERT INTO dbo.t_social_media_platform_count
(
    Primary_Platform,
    Student_Count
)
--Finally we can saw the 7 rows
SELECT
    Primary_Platform,
    Student_Count
FROM dbo.v_social_media_platform_count;
GO

SELECT *
FROM dbo.t_social_media_platform_count;
GO