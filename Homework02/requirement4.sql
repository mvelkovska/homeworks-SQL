
USE [SEDCHome]
GO
--Change GradeDetails table always to insert value 100 in
--AchievementMaxPointscolumn if no value is provided on insert

ALTER TABLE GradeDetails
ADD CONSTRAINT DF_AchievementMaxPoints
DEFAULT 100 FOR [AchievementMaxPoints]
GO

--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints

ALTER TABLE GradeDetails WITH CHECK
ADD CONSTRAINT CHK_AchievementMaxPoints
CHECK (AchievementMaxPoints >= AchievementPoints);
GO

--Change AchievementType table to guarantee unique names across the Achievement types
ALTER TABLE AchievementType WITH CHECK
ADD CONSTRAINT UC_Name UNIQUE (Name)
GO

