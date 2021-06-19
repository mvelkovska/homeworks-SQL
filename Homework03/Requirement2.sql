USE [SEDCHome]

--Calculate the count of all grades per Teacher in the system and 
--filter only grade count greater than 200

SELECT TeacherId, COUNT(Grade) AS [COUNT_OF_GRADES > 200]
FROM Grade
GROUP BY TeacherID
HAVING COUNT(Grade) > 200
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students 
--(ID < 100) and filter teachers with more than 50 Grade count

SELECT TeacherId, COUNT(Grade) AS [COUNT_OF_GRADES_FIRST_100]
FROM Grade
WHERE StudentID < 100
GROUP BY TeacherID
HAVING COUNT(Grade) > 50
GO

--Find the Grade Count, Maximal Grade, and the Average Grade per Student
--on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT StudentID, COUNT(Grade) AS [STUDENT_GRADE_COUNT], AVG(GRADE) AS [STUDENT_AVERAGE_GRADE], 
MAX(GRADE) AS [STUDENT_MAX_GRADE]
FROM Grade
GROUP BY StudentID
HAVING MAX(GRADE) = AVG(GRADE)
GO


--List Student First Name and Last Name next to the other details from previous query



SELECT StudentID,S.FirstName + ' ' + S.LastName as [Full Name], COUNT(Grade) AS [STUDENT_GRADE_COUNT], AVG(GRADE) AS [STUDENT_AVERAGE_GRADE], 
MAX(GRADE) AS [STUDENT_MAX_GRADE]
FROM Grade G
INNER JOIN Student S on S.ID = G.StudentID
GROUP BY StudentID,S.FirstName,S.LastName
HAVING MAX(GRADE) = AVG(GRADE)
GO



