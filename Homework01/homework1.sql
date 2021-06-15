USE [master]
GO

USE CLASS01 
GO

CREATE TABLE Teacher (
[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[AcademicRank] [nvarchar](50) NOT NULL,
	[HireDate] [date] NOT NULL
)
GO

CREATE TABLE Student
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[EnrolledDate] [date] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[NationalIDNumber] [nvarchar](50) NOT NULL,
	[StudentCardNumber] [nvarchar](50) NOT NULL
	)
GO

CREATE TABLE Course
(
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Credit] [tinyint] NOT NULL,
	[AcademicYear] [tinyint] NOT NULL,
	[Semester] [tinyint] NOT NULL,
	)
GO

CREATE TABLE AchievementType
(
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[ParticipationRate] [tinyint] NOT NULL,
)
GO

CREATE TABLE Grade
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [smallint] NOT NULL,
	[TeacherID] [smallint] NOT NULL,
	[Grade] [tinyint] NOT NULL,
	[Comment] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
)
GO
 
CREATE TABLE GradeDetails
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[AchievementTypeID] [tinyint] NOT NULL,
	[AchievementPoints] [tinyint] NOT NULL,
	[AchievementMaxPoints] [tinyint] NOT NULL,
	[AchievementDate] [datetime] NOT NULL,
)
GO