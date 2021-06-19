USE [SEDCHome]

--Calculate the count of all grades in the system
SELECT COUNT(*) AS [TOTAL_NUMBER_OF_GRADES]
FROM Grade
GO

--Calculate the count of all grades per Teacher in the system
SELECT TeacherId, COUNT(Grade) AS [COUNT_OF_GRADES]
FROM Grade
GROUP BY TeacherID
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT TeacherId, COUNT(Grade) AS [COUNT_OF_GRADES_FIRST_100]
FROM Grade
WHERE StudentID < 100
GROUP BY TeacherID
GO


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT StudentID, MAX(Grade) AS [MAXIMAL_GRADE], AVG(GRADE) AS [AVERAGE_GRADE]
FROM Grade
GROUP BY StudentID
GO
