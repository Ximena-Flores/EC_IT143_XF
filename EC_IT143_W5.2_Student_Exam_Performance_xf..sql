/*****************************************************************************************************************
NAME: Student Exam Performance Analysis
PURPOSE: Analyze factors that may influence student academic performance,
including study habits, attendance, parent education level, and geographic location.

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     09/29/2026   Ximena Flores      1. Built this script for EC IT143 5.2.


RUNTIME: 
Xm Xs

NOTES: 
This script was created for IT143 Final Project 5.2. 
The queries analyze data from the student_exam_performance table.
Two questions were provided by classmates and two questions were
created by the author. The results are used to identify patterns
and relationships that may impact exam performance.
 
******************************************************************************************************************/
-- Author: Veronica Ramatu Thomas
/* Q1: How do study hours per week and attendance percentages impact the final exam scores of students across different school types?

A1: Private schools had the highest average exam score (62.06), followed by Charter schools (61.63) and Public schools (61.94).
Private schools also showed slightly higher attendance rates. Study hours were very similar across all school types, suggesting
that attendance may have a stronger influence than study hours
in this dataset. */

SELECT GETDATE() AS my_date;
GO 

SELECT
    school_type,
    AVG(study_hours_per_day) AS AvgStudyHours,
    AVG(attendance_percentage) AS AvgAttendance,
    AVG(exam_score) AS AvgExamScore
FROM dbo.student_exam_performance
GROUP BY school_type
ORDER BY AvgExamScore DESC;
GO

/******************************************************************************************************************/
--Author: Ive Prince Oghosa Eriabie:
/* Q2: Could we use a SQL JOIN to determine whether students with higher study hours per week also tend to have higher final exam scores?
   Q2: Do students who study more hours tend to have higher exam scores?

A2: Students with higher study time achieved significantly higher average exam scores than students with medium or low study time.
 The High Study Time group had an average exam score of 81.17, compared to 69.45 for the Medium Study Time group and 59.42 for
 the Low Study Time group. This indicates a strong positive relationship between study time and academic performance.*/

SELECT
    CASE
        WHEN study_hours_per_day < 4 THEN 'Low Study Time'
        WHEN study_hours_per_day BETWEEN 4 AND 8 THEN 'Medium Study Time'
        ELSE 'High Study Time'
    END AS StudyGroup,
    AVG(exam_score) AS AvgExamScore,
    COUNT(*) AS TotalStudents
FROM dbo.student_exam_performance
GROUP BY
    CASE
        WHEN study_hours_per_day < 4 THEN 'Low Study Time'
        WHEN study_hours_per_day BETWEEN 4 AND 8 THEN 'Medium Study Time'
        ELSE 'High Study Time'
    END
ORDER BY AvgExamScore DESC;
GO

/******************************************************************************************************************/
--Author: Ximena Flores
/* Q3: Which parent education level is associated with the highest average exam score?

 A3:
 Students whose parents had a Doctorate degree achieved one of the highest average exam scores (62.13). However, the differences among
 education levels were very small, suggesting that parent education level alone does not have a strong impact on exam performance in
 this dataset. */

SELECT
    parent_education,
    AVG(exam_score) AS AvgExamScore,
    COUNT(*) AS TotalStudents
FROM dbo.student_exam_performance
GROUP BY parent_education
ORDER BY AvgExamScore DESC;
GO

/******************************************************************************************************************/
--Author: Ximena Flores
/*Q4: Do students from urban or rural areas achieve higher average exam scores?

 A4: Students from suburban areas achieved the highest average exam score (61.99), followed closely by urban students (61.97) and rural students
 (61.84). The differences were very small, suggesting that geographic location had little impact on exam performance in this dataset. */

 SELECT
    urban_rural,
    AVG(exam_score) AS AvgExamScore,
    COUNT(*) AS TotalStudents
FROM dbo.student_exam_performance
GROUP BY urban_rural
ORDER BY AvgExamScore DESC;