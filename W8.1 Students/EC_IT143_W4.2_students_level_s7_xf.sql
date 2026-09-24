/******************************************************************************
Author: Ximena
Course: IT143
Assignment: W4.2 Final Project

Question:
How many students are in each education level?

Purpose:
Create a stored procedure to refresh the education level count table
from the view.
******************************************************************************/

-- Q1: How many students are in each education level?

SELECT GETDATE() AS my_date;
GO

CREATE PROCEDURE dbo.load_education_level_count
AS
BEGIN

    TRUNCATE TABLE dbo.t_education_level_count;

    INSERT INTO dbo.t_education_level_count
    (
          education_level
        , Student_Count
    )
    SELECT
          education_level
        , Student_Count
    FROM dbo.v_education_level_count;

END;
GO