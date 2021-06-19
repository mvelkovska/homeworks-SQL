USE [SEDCHome]


--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student


CREATE VIEW vv_StudentGrades
AS
SELECT StudentID AS [Student's ID], COUNT(Grade) AS [COUNT_OF_GRADES]
FROM [Grade]
GROUP BY StudentID
GO

SELECT * FROM vv_StudentGrades
GO

--Change the view to show Student First and Last Names instead of StudentID

ALTER VIEW vv_StudentGrades
AS
SELECT S.FirstName + ' ' + S.LastName as [Full Name], COUNT(Grade) AS [Count of grades]
FROM [Grade] G
INNER JOIN Student S on S.ID = G.StudentID
GROUP BY S.FirstName, S.LastName
GO

SELECT * FROM vv_StudentGrades
GO

--List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades
ORDER BY [Count of grades] DESC
GO

--Create new view (vv_StudentGradeDetails)
--that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit)

CREATE VIEW vv_StudentGradeDetails
AS
SELECT S.FirstName + ' ' + S.LastName as [Full Name], COUNT(CourseID) AS [Courses passed]
FROM [Grade] G
INNER JOIN Student S on S.ID = G.StudentID
GROUP BY S.FirstName, S.LastName
GO


SELECT * FROM vv_StudentGradeDetails
ORDER BY [Courses passed] DESC
GO