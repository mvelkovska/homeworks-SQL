USE [SEDCHome]
GO

--List all possible combinations of Courses names and AchievementType names that can be passed by student

SELECT C.Name AS Course, A.Name AS AchievementType
FROM Course C
CROSS JOIN AchievementType A
GO

--List all Teachers that has any exam Grade
SELECT DISTINCT T.FirstName
FROM Teacher T --all teachers 
inner join Grade G ON T.ID = G.TeacherID --any exam grade
GO

--List all Teachers without exam Grade

SELECT DISTINCT T.FirstName
FROM Grade G
RIGHT JOIN Teacher T ON T.ID = G.TeacherID
WHERE G.TeacherID IS NULL
GO

--List all Students without exam Grade (using Right Join)

SELECT S.*
FROM Grade G
RIGHT JOIN Student S ON G.StudentID = S.ID
WHERE G.StudentID IS NULL
GO