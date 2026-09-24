/******************************************************************************
Author: Ximena Flores
Date:09/23/2026
Course: IT143
Assignment: W4.2 Final Project

Question:
How many students are in each education level?

Purpose:
Create a view that counts students by education level.
******************************************************************************/

CREATE VIEW dbo.v_education_level_count
AS

SELECT
      education_level
    , COUNT(*) AS Student_Count
FROM dbo.student_exam_performance
GROUP BY
      education_level;
GO

-- Test the view

SELECT *
FROM dbo.v_education_level_count;
GO