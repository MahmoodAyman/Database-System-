CREATE LOGIN Instructor WITH PASSWORD = 'Password123';
CREATE LOGIN TrainingManager WITH PASSWORD = 'Password123';
CREATE LOGIN Student WITH PASSWORD = 'Password123';

CREATE USER Instructor FOR LOGIN Instructor
CREATE USER TrainingManager FOR LOGIN TrainingManager
CREATE USER Student FOR LOGIN Student
SELECT * FROM sys.database_principals WHERE type = 'R';

CREATE ROLE Instructor 
CREATE ROLE TrainingManager
CREATE ROLE Student

ALTER ROLE Instructor ADD MEMBER Instructor;
ALTER ROLE TrainingManager ADD MEMBER TrainingManagerUser;



GRANT SELECT, INSERT, UPDATE, DELETE ON Branch TO TrainingManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Track TO TrainingManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Intake TO TrainingManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Student TO TrainingManager;

GRANT SELECT ON Student TO Instructor;
GRANT SELECT ON Course TO Instructor;

GRANT SELECT, INSERT ON Exam TO Instructor;

SELECT dp.name AS UserName, dp.type_desc AS UserType, dr.name AS RoleName
FROM sys.database_principals dp
JOIN sys.database_role_members drm ON dp.principal_id = drm.member_principal_id
JOIN sys.database_principals dr ON drm.role_principal_id = dr.principal_id;

GO
CREATE TRIGGER trg_GradeStudentAnswers
ON Answer
AFTER INSERT
AS
BEGIN
    DECLARE @StudentId CHAR(14);
    DECLARE @ExmId INT;
    DECLARE @QId INT;
    DECLARE @IsCorrect BIT;
    DECLARE @Grade INT;
    DECLARE @Degree INT;
    DECLARE @TotalDegree INT = 0;

    -- Loop through the inserted answers to grade them
    DECLARE answer_cursor CURSOR FOR
    SELECT NationalId, Exm_Id, Q_Id, IsCorrect
    FROM inserted;

    OPEN answer_cursor;
    FETCH NEXT FROM answer_cursor INTO @StudentId, @ExmId, @QId, @IsCorrect;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Get the degree for the current question
        SELECT @Degree = Degree FROM Question WHERE Q_Id = @QId;

        -- If the answer is correct, grade the answer
        IF @IsCorrect = 1
        BEGIN
            SET @Grade = @Degree;
        END
        ELSE
        BEGIN
            SET @Grade = 0;
        END

        -- Update the student's final result for the course
        UPDATE Student_Course
        SET FinalResult = (SELECT SUM(Degree) FROM Answer a
                           JOIN Question q ON a.Q_Id = q.Q_Id
                           WHERE a.NationalId = @StudentId AND a.Exm_Id = @ExmId)
        WHERE NationalId = @StudentId AND Crs_Code = (SELECT Crs_Code FROM Exam WHERE Exm_Id = @ExmId);

        -- Fetch the next answer from the cursor
        FETCH NEXT FROM answer_cursor INTO @StudentId, @ExmId, @QId, @IsCorrect;
    END

    CLOSE answer_cursor;
    DEALLOCATE answer_cursor;
END;

GO

Create or alter Trigger ExamCorrection
on Answer
After Insert
as 
begin
	declare @Q_Id int = (Select Q_Id from inserted)
	declare @AnswerText varchar(400) = (select AnswerText from inserted )
	declare @CorrectOptions table (
	C_Option nvarchar(100)) 

	insert into @CorrectOptions
	select CorrectAnswer from CorrectChoice where Q_Id = @Q_Id


	if exists (Select C_Option from @CorrectOptions where C_Option = @AnswerText)
    begin
        Update Answer  
		set IsCorrect = 1
		where Ans_Id = (select Ans_Id from inserted)
    end
    else
    begin
		Update Answer  
		set IsCorrect = 0
		where Ans_Id = (select Ans_Id from inserted)	
	end
end

GO
CREATE SCHEMA Student
GO
ALTER SCHEMA Student TRANSFER Student
ALTER SCHEMA Student TRANSFER Student_Course