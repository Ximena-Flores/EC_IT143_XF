--Create the query 
SELECT
    Primary_Platform,
    COUNT(*) AS Student_Count
FROM dbo.Social_media_impact_on_life
GROUP BY Primary_Platform
ORDER BY Student_Count DESC;