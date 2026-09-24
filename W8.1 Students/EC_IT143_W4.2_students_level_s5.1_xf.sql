DROP TABLE IF EXISTS dbo.t_education_level_count;
GO

/******************************************************************************
Author: Ximena Flores
Date: 09/23/2026
Course: IT143
Assignment: W4.2 Final Project
******************************************************************************/

SELECT *
INTO dbo.t_education_level_count
FROM dbo.v_education_level_count;
GO
SELECT *
FROM dbo.t_education_level_count;
GO