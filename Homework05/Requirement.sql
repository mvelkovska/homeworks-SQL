USE [SEDCHome]
GO

DROP FUNCTION IF EXISTS dbo.fn_StudentsDetails;
GO


CREATE FUNCTION dbo.fn_StudentsDetails(@TeacherId INT, @CourseId INT)
RETURNS @RESULTS TABLE (FirstName NVARCHAR(50),LastName NVARCHAR(50), Grade INT, CreatedDate DATETIME)
AS
BEGIN

INSERT INTO @RESULTS
SELECT S.FirstName AS StudentFirstName, S.LastName AS StudentLastName,G.Grade AS GRADE,G.CreatedDate AS CreatedDate
FROM [dbo].[Grade] G
INNER JOIN [dbo].[Student] S ON S.ID = G.StudentID
INNER JOIN [dbo].[Course] C ON C.ID = G.CourseID
INNER JOIN [dbo].[GradeDetails] GD ON G.ID = GD.GradeID
INNER JOIN [dbo].[AchievementType] AT ON AT.ID = GD.AchievementTypeID
WHERE AT.Name = 'ispit' AND GD.AchievementPoints > 50 AND G.CourseID = @CourseId AND  G.TeacherID = @TeacherId
GROUP BY S.FirstName,S.LastName, G.Grade, G.CreatedDate
RETURN
END
GO

DECLARE @TeacherId int = 1
DECLARE @CourseId int = 1

SELECT *
FROM dbo.fn_StudentsDetails(@TeacherId,@CourseId)