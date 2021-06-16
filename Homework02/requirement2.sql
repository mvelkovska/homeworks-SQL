USE [SEDCHome]
GO

--Find all Students with FirstName = Antonio ordered by Last Name
SELECT * FROM Student
WHERE FirstName = 'Antonio'
ORDER BY LastName ASC
GO

--List all Students ordered by FirstName
SELECT * FROM Student
ORDER BY FirstName ASC
GO

--Find all Male students ordered by EnrolledDate, starting from the last enrolled

SELECT * FROM Student
WHERE Gender='M'
ORDER BY EnrolledDate DESC
GO

