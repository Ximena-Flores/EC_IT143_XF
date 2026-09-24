/******************************************************************************
Author: Ximena Flores
Course: IT143
Assignment: W4.2 Final Project

Question:
How many students are in each education level?

Purpose:
Load the table from the view.
******************************************************************************/

TRUNCATE TABLE dbo.t_education_level_count;
GO

INSERT INTO dbo.t_education_level_count
            (  education_level,
                Student_Count
                         )

SELECT
    education_level,
    Student_Count
FROM dbo.v_education_level_count;
GO

SELECT *
FROM dbo.t_education_level_count;
GO
