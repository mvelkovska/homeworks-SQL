USE [SEDCHome]

SELECT * FROM AchievementType
SELECT * FROM Course
SELECT * FROM Grade
SELECT * FROM GradeDetails
SELECT * FROM Student
SELECT * FROM Teacher

--student has grades
ALTER TABLE [Grade] ADD CONSTRAINT [FK_Student_Grades] FOREIGN KEY ([StudentID]) REFERENCES [Student]([ID]); 

--grades have grades details
ALTER TABLE [GradeDetails] ADD CONSTRAINT [FK_Grade_Details] FOREIGN KEY ([GradeID]) REFERENCES [Grade]([ID]);

--student learns course
ALTER TABLE [Course] ADD CONSTRAINT [FK_Courses_Student] FOREIGN KEY ([Name]) REFERENCES [Student]([StudentCardNumber]);

--teacher teaches specific courses
ALTER TABLE [Course] ADD CONSTRAINT [FK_Courses_Teacher] FOREIGN KEY ([Name]) REFERENCES [Teacher]([ID]);

--teacher teaches specific students?

--teacher has access to grades?

--each course has its grade(for the student)?

--grade details and achievement type?

