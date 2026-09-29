/*****************************************************************************************************************
NAME: Social Media Impact on Life Analysis
PURPOSE: Analyze the relationship between social media usage habits,
sleep patterns, stress levels, and academic performance.

MODIFICATION LOG:
Ver         Date         Author         Description
-----    ----------   -----------    -------------------------------------------------------------------------------
1.0      09/29/2026   Ximena Flores    1. Built this script for EC IT143
RUNTIME:
Xm Xs

NOTES:
This script analyzes data from the Social_media_impact_on_life dataset. The goal is to identify patterns between social media
usage, sleep, stress, and academic performance. The script contains four analytical questions and answers based on query
results.
******************************************************************************************************************/
--Author: Ximena Flores
/* Q1: Which social media platform is associated with the highest average academic performance GPA?

 A1: TikTok users had the highest average academic performance GPA (3.43),
 followed closely by LinkedIn (3.43) and Reddit (3.43). YouTube users had the lowest average GPA (3.42). However, the differences among
 platforms were very small, suggesting that social media platform preference had little impact on academic performance in this dataset.*/

SELECT
    Primary_Platform,
    AVG(Academic_Performance_GPA) AS AvgGPA,
    COUNT(*) AS TotalStudents
FROM dbo.Social_media_impact_on_life
GROUP BY Primary_Platform
ORDER BY AvgGPA DESC;
GO

/******************************************************************************************************************/
--Author: Ximena Flores
/* Q2: Does late-night social media usage affect academic performance?

 A2: Students who did not use social media late at night had a higher average GPA (3.55) than students who used social media late at night
 (3.35). These results suggest that late-night social media usage may be associated with lower academic performance.
 0=No 1=Yes */

 SELECT
    Late_Night_Usage,
    AVG(Academic_Performance_GPA) AS 'Avg GPA',
    COUNT(*) AS 'Total Students'
FROM dbo.Social_media_impact_on_life
GROUP BY Late_Night_Usage
ORDER BY 'Avg GPA' DESC;
GO

/******************************************************************************************************************/
--Author: Ximena Flores
/* Q3: How does sleep quality relate to academic performance?

 A3: Students with higher sleep quality scores achieved higher average GPAs. Students with a sleep quality score of 5 had the highest
 average GPA (3.75), while students with a score of 1 had the lowest average GPA (3.05). These results suggest a positive
relationship between sleep quality and academic performance. */

 SELECT
    Sleep_Quality_Score,
    AVG(Academic_Performance_GPA) AS 'Avg GPA',
    COUNT(*) AS 'Total Students'
FROM dbo.Social_media_impact_on_life
GROUP BY Sleep_Quality_Score
ORDER BY Sleep_Quality_Score;
GO

/******************************************************************************************************************/
--Author: Ximena Flores
/* Q4: Which social media platform is associated with the highest perceived stress level?

 A4:LinkedIn users had the highest average perceived stress score (14.06), followed by Snapchat users (13.97). X (Twitter) users had the lowest
 average stress score (12.46). While some differences exist among platforms, the overall variation in stress levels was relatively small. */

SELECT
    Primary_Platform,
    AVG(Perceived_Stress_Score) AS 'Avg Stress Score',
    COUNT(*) AS 'Total Students'
FROM dbo.Social_media_impact_on_life
GROUP BY Primary_Platform
ORDER BY 'Avg Stress Score' DESC;
GO
