USE [SEDCHome]


--Homework requirement 1a/2
CREATE PROCEDURE dbo.CreateGrade(@StudentID INT, @CourseID INT, @TeacherID INT,@CreatedDate DATE,@Grade INT)
AS
BEGIN

INSERT INTO dbo.Grade(StudentID, CourseID, TeacherID, CreatedDate,Grade)
	VALUES (@StudentID, @CourseID, @TeacherID, @CreatedDate,@Grade)

	
	SELECT COUNT(*) as TotalNumOfGrades
	FROM dbo.Grade G
	WHERE StudentID=@StudentID

	SELECT MAX(Grade) as MaximalGrade
	FROM dbo.Grade G
	WHERE StudentID=@StudentID AND
	WHERE TeacherID = @TeacherID

END
GO

EXEC dbo.CreateGrade @CreatedDate = '2004.07.06', @Grade = 9, @StudentID = 313, @TeacherID=12, @CourseID=22

SELECT * FROM GRADE

--Homework requirement 1b/2

CREATE PROCEDURE dbo.CreateGradeDetail (@GradeID INT, @AchievementTypeID INT, @AchievementPoints INT,@AchievementMaxPoints INT, @AchievementDate DATE)
AS
BEGIN

    SELECT SUM(GD.AchievementPoints/GD.AchievementMaxPoints * PR.ParticipationRate) as SumOfGradePoints
    FROM Grade G
    INNER JOIN [dbo].[GradeDetails] GD on GD.GradeID = G.ID
    INNER JOIN [dbo].[AchievementType] PR on PR.ID = GD.AchievementTypeID
    WHERE G.GradeID = @GradeID

END
GO

EXEC dbo.CreateGradeDetail @Grade=9, @AchievementTypeId = 2, @Points = 50, @MaxPoints =100, @Date ='1999-03-05'
EXEC dbo.CreateGradeDetail @Grade=8, @AchievementTypeId = 5, @Points = 60, @MaxPoints =100, @Date ='1989-08-08'

SELECT * FROM [dbo].[GradeDetails]
WHERE ID = 5