--Call the stored procedure
--Q:How many students use each social media platform?

EXEC dbo.load_social_media_platform_count;
GO
 
-- Verify results
 
SELECT *
FROM dbo.t_social_media_platform_count;
GO