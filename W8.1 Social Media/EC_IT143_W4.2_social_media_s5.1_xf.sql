--To avoid errors
DROP TABLE IF EXISTS dbo.t_social_media_platform_count;
GO

--Create the view into a table 
SELECT *
INTO dbo.t_social_media_platform_count
FROM dbo.v_social_media_platform_count;
GO
--It´s already created

SELECT *
FROM dbo.t_social_media_platform_count;
GO
-- Our table has 7 rows



