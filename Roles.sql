CREATE TABLE Role (
	roleID INT IDENTITY(1,1),
	roleName NVARCHAR(20) NOT NULL,
	CONSTRAINT PKRole PRIMARY KEY (roleID)
)


INSERT INTO Role (roleName) 
VALUES('Admin'),('TrainingManager') ,('Instructor'), ('Student')

ALTER TABLE Instructor
ADD roleID INT NOT NULL DEFAULT 3
CONSTRAINT FKInstructorRole FOREIGN KEY (roleID) REFERENCES Role(roleID)

ALTER TABLE Student
ADD roleID INT NOT NULL DEFAULT 4
CONSTRAINT FKStudentRole FOREIGN KEY (roleID) REFERENCES Role(roleID)



CREATE TABLE Permission(
	permissionID INT IDENTITY (1,1),
	permissionName NVARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT PKPermission PRIMARY KEY (permissionID)
	)

INSERT INTO Permission (permissionName)
VALUES 
('Add Branch'), ('Update Branch') , ('Delete Branch') , 
('Add Intake'), ('Update Intake') , ('Delete Intake') , 
('Add Student'), ('Update Student') , ('Delete Student') , 
('Create Exam'), ('View Courses') , ('View Questions'), 
('View Students') , ('View Exam Result');


insert into Branch (Brn_Name)
Values
(N'Cairo'),(N'Alexandria'),(N'Giza'),(N'Mansoura'),
(N'Tanta'),(N'Assiut'),(N'Monufia'),(N'Zagazig'),(N'Luxor'),(N'Aswan'),
(N'Damietta'),(N'Beni Suef'),(N'Qena'),(N'Hurghada'),(N'Sharm El Sheikh'),(N'Port Said'),
(N'Ismailia'),(N'Suez'),(N'Arish'),(N'Matrouh');

CREATE TABLE rolePermissions (
	roleID INT NOT NULL,
	permissionID INT NOT NULL,
	CONSTRAINT PKRolePermission PRIMARY KEY (roleID, permissionID),
	CONSTRAINT FKroleID FOREIGN KEY (roleID) REFERENCES Role(roleID),
	CONSTRAINT FKpermissionID FOREIGN KEY (permissionID) REFERENCES Permission(permissionID)
)



SELECT roleID FROM Instructor WHERE Ins_ID = 3



GO

CREATE PROCEDURE sp_AddBranch (@UserID INT , @BranchName NVARCHAR(20))
AS 
BEGIN 
	DECLARE @X INT 
	SELECT @X = roleID FROM Instructor WHERE Ins_ID = @UserID
	IF (@X = 2) 
		BEGIN
			INSERT INTO Branch VALUES(@BranchName)
		END
	ELSE 
		BEGIN 
			PRINT 'You are not allowed to Add Branches'
		END
END


GO

CREATE PROCEDURE sp_DeleteBranch (@UserID INT, @BranchID INT)
AS 
BEGIN 
	DECLARE @X INT 
	SELECT @X = roleID FROM Instructor WHERE Ins_ID = @UserID
	IF (@X = 2) 
		BEGIN
			DELETE FROM Branch WHERE Brn_ID = @BranchID 
		END
	ELSE 
		BEGIN 
			PRINT 'You are not allowed to Delete Branches'
		END
END

GO

CREATE PROCEDURE sp_AddIntake (@UserID INT, @IntakeName NVARCHAR(20))
AS 
BEGIN 
	DECLARE @X INT
	SELECT @X = roleID FROM Instructor WHERE Ins_ID = @UserID
	IF (@X = 2) 
		BEGIN 
			INSERT INTO Intake VALUES (@IntakeName)
		END
	ELSE 
		PRINT 'You are not allowed to Add Intakes'
END

GO 

CREATE PROCEDURE sp_DeleteIntake (@UserID INT, @IntakeID INT)
AS 
BEGIN 
	DECLARE @X INT 
	SELECT @X = roleID FROM Instructor WHERE Ins_ID = @UserID
	IF (@X = 2) 
		BEGIN
			DELETE FROM Branch WHERE Brn_ID = @IntakeID 
		END
	ELSE 
		BEGIN 
			PRINT 'You are not allowed to Delete Intakes'
		END
END





INSERT INTO rolePermissions(roleID , permissionID) 
SELECT 1 , permissionID FROM Permission

INSERT INTO rolePermissions(roleID , permissionID) 
SELECT 2 , permissionID FROM Permission


INSERT INTO rolePermissions(roleID, permissionID)
VALUES (3 , 10) , (3, 11) , (3,12),(3,13)

INSERT INTO rolePermissions(roleID , permissionID)
VALUES (4 , 14)

Insert into Instructor 
Values 
('Ahmed Mohamed', 15000.00, 1500.00, 'ahmedm', 'Pass@123', 0,2),
('Sara Ali', 18000.00, 1800.00, 'saraa', 'Pass@456', 1,3),
('Mohamed Ibrahim', 12000.00, 1200.00, 'mohamedi', 'Pass@789', 0,2),
('Noor Hussien', 20000.00, 2000.00, 'noorh', 'Pass@101', 1,3),
('Khaled Mahmoud', 10000.00, 1000.00, 'khaledm', 'Pass@102', 0,2),
('Mona AdbElrahman', 17000.00, 1700.00, 'monaa', 'Pass@112', 0,2),
('Ibrahim Ali', 19000.00, 1900.00, 'ibrahims', 'Pass@113', 1,3),
('Hoda Mostafa', 16000.00, 1600.00, 'hudam', 'Pass@114', 0,2),
('Yousif Hassan', 14000.00, 1400.00, 'yousefh', 'Pass@115', 0,2),
('Layla Ahmaed', 21000.00, 2100.00, 'leilaa', 'Pass@116', 0,2),
('Mahmoud Omar', 13000.00, 1300.00, 'mahmoudo', 'Pass@117', 0,2),
('Ali Hassan', 18000.00, 1800.00, 'alih', 'Pass@118', 1,3),
('Fatma Yousif', 15500.00, 1550.00, 'fatmay', 'Pass@119', 0,2),
('Nadia Khaled', 22000.00, 2200.00, 'nadiak', 'Pass@121', 1,3);

