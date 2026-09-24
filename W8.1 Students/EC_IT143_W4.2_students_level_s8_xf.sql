/******************************************************************************
Author: Ximena
Course: IT143
Assignment: W4.2 Final Project

Question:
How many students are in each education level?

Purpose:
Execute the stored procedure and verify the results.
******************************************************************************/

-- Q1: How many students are in each education level?

SELECT GETDATE() AS my_date;
GO

EXEC dbo.load_education_level_count;
GO

SELECT *
FROM dbo.t_education_level_count;
GO