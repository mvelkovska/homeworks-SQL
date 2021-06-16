
USE [SEDCHome]
GO

--Find all Students with FirstName = Antonio
SELECT * FROM Student
WHERE FirstName = 'Antonio'
GO


--Find all Students with DateOfBirth greater than ‘01.01.1999
SELECT * FROM Student 
WHERE DateOfBirth > '1999-01-01';
GO


--Find all Male students
SELECT * FROM Student 
WHERE Gender = 'M'
GO

--Find all Students with LastName starting With ‘T’
SELECT * FROM Student 
WHERE LastName LIKE 'T%'
GO

--Find all Students Enrolled in January/1998
SELECT * FROM Student 
WHERE EnrolledDate >= '1998-01-01' AND EnrolledDate <= '1998-01-31'
GO

--Find all Students with LastNamestarting With ‘J’ enrolled in January/1998
SELECT * FROM Student
WHERE LastName LIKE '%J' AND EnrolledDate >= '1998-01-01' AND EnrolledDate <= '1998-01-31'