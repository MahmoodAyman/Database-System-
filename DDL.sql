use Examination

--Create Datatype for Password 
Create type Password from nvarchar(8) not null
Go
Create rule PasswordRule as len(@password) = 8
Go
sp_bindrule PasswordRule , 'Password' 
Go
--Create datatype for phone
Create type Tel from varchar(11) not null 
Go
Create rule TelRule as len(@phone) = 11
Go
sp_bindrule TelRule , 'Tel' 
GO
Create rule NationalIdRule as len(@Id) = 14
Go
sp_bindrule NationalIdRule , 'Student.NationalId'
Go
--Create Instructor table
Create Table Instructor
(
	Ins_ID int identity(1,1),
	Ins_Name nvarchar(20) not null,
	Ins_Salary decimal not null,
	Taxes decimal not null,
	NetSalary as (Ins_Salary - Taxes) persisted,
	Ins_UserName nvarchar(15) not null,
	Ins_Password Password not null,
	IsTrainingManager bit not null,
	constraint PK_Instructor primary Key(Ins_ID)
)

--Create Student Table
Create Table Student
(
	NationalID char(14) NOT NULL,
	Std_Name nvarchar(15) not null,
	Phone Tel ,
	Std_Username nvarchar(15) not null,
	Std_Password Password ,
	BirthDate date ,
	Age as year(Getdate())- year(BirthDate)
	
	Constraint PK_Student Primary Key(NationalID)
)

GO

--Create Course Table
Create Table Course 
(
	Crs_Code nvarchar(6),	
	Crs_Name nvarchar(30) not null,
	MinDegree int not null,
	MaxDegree int not null

	Constraint PK_Course Primary Key(Crs_Code)
)

-- Create Branch Table 
Create table Branch 
(
	Brn_Id int identity(1,1),
	Brn_Name nvarchar(20) not null
	Constraint PK_Branch Primary Key(Brn_Id)
)

--Create Department table
Create table Department
(
	Dept_Id int identity(1,1),
	Dept_Name nvarchar(20) not null
	Constraint PK_Department Primary Key(Dept_Id)
)

--Create Track table 
Create table Track
(
	Track_Id int identity(1,1),
	Track_Name nvarchar(30) not null,
	Dept_Id int not null
	Constraint PK_Track Primary Key(Track_Id)
	Constraint FK_Track_Department Foreign Key references Department(Dept_Id)
)

--Create Intake Table
Create table Intake 
(
	Ink_Id int identity(1,1),
	Ink_Name nvarchar(20) not null
	Constraint PK_Intake Primary Key(Ink_Id)
)

--Create Exam Table
Create Table Exam 
(
	Exm_Id int identity(1,1),
	TotalTime int not null,
	Type varchar(10) not null default 'Exam',
	Crs_Code nvarchar(6) not null,
	Ins_Id int not null

	Constraint PK_Exam Primary Key (Exm_Id),
	Constraint Ck_ExamType check (Type in ('Exam' ,'Corrective')),
	Constraint FK_Exam_Course Foreign Key (Crs_Code) references Course(Crs_Code),
	Constraint FK_Exam_Instructor Foreign Key (Ins_Id) references Instructor(Ins_ID)
)

--Table from relation between Instructor & Course & Intake
Create Table Instructor_Course_Intake
(
	Crs_Code nvarchar(6) not null,
	Ins_Id int not null,
	Ink_Id int not null 

	Constraint PK_Instructor_Course_Intake Primary Key(Crs_Code, Ins_Id,Ink_Id),
	Constraint FK_Instructor_Course_Intake_Course Foreign Key (Crs_Code) references Course(Crs_Code),
	Constraint FK_Instructor_Course_Intake_Instructor Foreign Key (Ins_Id) references Instructor(Ins_ID),
	Constraint FK_Instructor_Course_Intake_Intake Foreign Key (Ink_Id) references Intake(Ink_Id)
)

--table from relation Track-Intake-Exam-Branch
Create Table TrackIntakeExamBranch
(
	Ink_Id int not null ,
	Track_Id int not null,
	Exm_Id int not null,
	Brn_Id int not null,
	StartTime Time not null default '12:00:00',
	EndTime Time not null default '1:00:00',
	Year int not null

	Constraint PK_Track_Intake_Exam_Branch Primary Key(Ink_Id,Track_Id , Brn_Id,Exm_Id),
	Constraint FK_Track_Intake_Exam_Branch_Track Foreign Key (Track_Id) references Track(Track_Id),
	Constraint FK_Track_Intake_Exam_Branch_Branch Foreign Key (Brn_Id) references Branch(Brn_Id),
	Constraint FK_Track_Intake_Exam_Branch_Intake Foreign Key (Ink_Id) references Intake(Ink_Id),
	Constraint FK_Track_Intake_Exam_Branch_Exam Foreign Key (Exm_Id) references Exam(Exm_Id)
)

--ExamAllowanceOptions
Create table ExmAllowanceOptions
(
	Exm_Id int not null,
	AllowanceOptions nvarchar(150) not null
	Constraint PK_ExmAllowanceOptions Primary Key(Exm_Id,AllowanceOptions),
	Constraint FK_ExmAllowanceOptions_Exam Foreign Key (Exm_Id) references Exam(Exm_ID)
)

--Student Course Result
Create Table Student_Course 
(
	NationalId char(14) not null,
	Crs_Code nvarchar(6) not null,
	FinalResult int not null

	Constraint PK_Student_Course Primary Key (NationalId,Crs_Code,FinalResult),
	Constraint FK_Student_Course_Course Foreign Key (Crs_Code) references Course(Crs_Code),
	Constraint FK_Student_Course_Student Foreign Key (NationalId) references Student(NationalId)
)

-- relation between Branch & intake & Track
Create table Class 
(
	Ink_Id int not null ,
	Track_Id int not null,
	Brn_Id int not null,

	Constraint PK_Class Primary Key(Ink_Id,Track_Id , Brn_Id),
	Constraint FK_Class_Track Foreign Key (Track_Id) references Track(Track_Id),
	Constraint FK_Class_Branch Foreign Key (Brn_Id) references Branch(Brn_Id),
	Constraint FK_Class_Intake Foreign Key (Ink_Id) references Intake(Ink_Id),
)

--Question table
Create table Question
(
	Q_Id int identity(1,1),
	Q_Text nvarchar(400) not null,
	Type nvarchar(20) not null,
	Degree int not null default 2,
	Constraint PK_Question Primary Key(Q_Id),
	Constraint Ck_QuestionType check (Type in ('Text' ,'True & False','Multiple choice')),
)

--Multi Choice Correct
Create table CorrectChoice
(
	Q_Id int not null,
	CorrectAnswer nvarchar(200) not null

	Constraint PK_CorrectChoice Primary Key(Q_Id,CorrectAnswer),
	Constraint FK_CorrectChoice_Question Foreign Key(Q_Id) references Question(Q_Id),
)

--Multi Choice Wrong
Create table WrongChoice
(
	Q_Id int not null,
	WrongAnswer nvarchar(200) not null

	Constraint PK_WrongChoice Primary Key(Q_Id,WrongAnswer),
	Constraint FK_WrongChoice_Question Foreign Key(Q_Id) references Question(Q_Id),
)
--True or false
Create table TrueOrFalse
(
	Q_Id int not null,
	Answer bit not null

	Constraint PK_TrueOrFalse Primary Key(Q_Id,Answer),
	Constraint FK_TrueOrFalse_Question Foreign Key(Q_Id) references Question(Q_Id),
)
--Text
Create table TextQuestion
(
	Q_Id int not null,
	Answer nvarchar(700) not null

	Constraint PK_TextQuestion Primary Key(Q_Id,Answer),
	Constraint FK_TextQuestion_Question Foreign Key(Q_Id) references Question(Q_Id),
)

--Question Exam
Create table Question_Exam
(
	Q_Id int not null,
	Exm_Id int not null

	Constraint PK_Question_Exam Primary Key(Q_Id,Exm_Id),
	Constraint FK_Question_Exam_Question Foreign Key(Q_Id) references Question(Q_Id),
	Constraint FK_Question_Exam_Exam Foreign Key(Exm_Id) references Exam(Exm_Id)

)

-- Answer
Create Table Answer 
(
	Ans_Id int identity(1,1) ,
	IsCorrect bit not null ,
	Degree int not null,  
	Q_Id int not null,
	NationalId char(14) not null,
	Exm_Id int not null
	Constraint PK_Answer Primary Key (Ans_Id),
	Constraint FK_Answer_Question Foreign Key(Q_Id) references Question(Q_Id),
	Constraint FK_Answer_Exam_Exam Foreign Key(Exm_Id) references Exam(Exm_Id),
Constraint FK_Answer_Student Foreign Key(NationalId) references Student(NationalId)
)


