--solution:

SELECT
    education_level,
    COUNT(*) AS Student_Count
FROM dbo.student_exam_performance
GROUP BY education_level
ORDER BY Student_Count DESC;
GO