
--Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students  having FirstName  same as the variable

DECLARE @FirstName NVARCHAR(50)
SET @FirstName = 'Antonio'

SELECT * FROM STUDENT 
WHERE FirstName = @FirstName
GO

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the  table variable with all Female  students

DECLARE @FemaleStudents_ TABLE 
(ID INT, FirstName NVARCHAR(50), LastName NVARCHAR(50),DateOfBirth date);


INSERT INTO @FemaleStudents_(ID, FirstName,LastName, DateOfBirth)
SELECT ID, FirstName,LastName, DateOfBirth
FROM Student
WHERE Gender = 'F'

SELECT * FROM @FemaleStudents_
GO

--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve  the students  from the table which last name  is with 7 characters


CREATE TABLE #MaleStudents
(LastName NVARCHAR(50), EnrolledDate date);

INSERT INTO #MaleStudents (LastName, EnrolledDate)
SELECT LastName,EnrolledDate
FROM Student
WHERE FirstName LIKE '%A'

SELECT * FROM #MaleStudents
WHERE LEN(LastName) = 7
GO

--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName  and LastName are the same

CREATE TABLE #Teachers
(FirstName NVARCHAR(50),LastName NVARCHAR(50));

INSERT INTO #Teachers (FirstName, LastName)
SELECT FirstName,LastName
FROM Teacher
WHERE LEN(FirstName) < 5 AND SUBSTRING(FirstName,1,3) = SUBSTRING(LastName,1,3)
GO

SELECT * FROM #Teachers
GO

--Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId
--StudentCardNumber without “sc-”
	--“ – “
	--First character  of student  FirstName
	--“.”
	--Student LastName


	CREATE FUNCTION dbo.fn____FormatStudentName(@TheId int)
	RETURNS NVARCHAR(100)
	AS
	BEGIN
		
		DECLARE @TheResult NVARCHAR(100)

			SELECT @TheResult = RIGHT(StudentCardNumber,5) + '-' + LEFT(FirstName,1) + '.' + LastName
			 
			FROM Student
			WHERE ID = @TheId

		RETURN @TheResult
	END

	SELECT *,dbo.fn____FormatStudentName (ID) as FUNCTIONOUTPUT
	from STUDENT
