Use Examination
--insert data in Instructor Table
Insert into Instructor 
Values 
('Ahmed Mohamed', 15000.00, 1500.00, 'ahmedm', 'Pass@123', 0),
('Sara Ali', 18000.00, 1800.00, 'saraa', 'Pass@456', 1),
('Mohamed Ibrahim', 12000.00, 1200.00, 'mohamedi', 'Pass@789', 0),
('Noor Hussien', 20000.00, 2000.00, 'noorh', 'Pass@101', 1),
('Khaled Mahmoud', 10000.00, 1000.00, 'khaledm', 'Pass@102', 0),
('Mona AdbElrahman', 17000.00, 1700.00, 'monaa', 'Pass@112', 0),
('Ibrahim Ali', 19000.00, 1900.00, 'ibrahims', 'Pass@113', 1),
('Hoda Mostafa', 16000.00, 1600.00, 'hudam', 'Pass@114', 0),
('Yousif Hassan', 14000.00, 1400.00, 'yousefh', 'Pass@115', 0),
('Layla Ahmaed', 21000.00, 2100.00, 'leilaa', 'Pass@116', 0),
('Mahmoud Omar', 13000.00, 1300.00, 'mahmoudo', 'Pass@117', 0),
('Ali Hassan', 18000.00, 1800.00, 'alih', 'Pass@118', 1),
('Fatma Yousif', 15500.00, 1550.00, 'fatmay', 'Pass@119', 0),
('Nadia Khaled', 22000.00, 2200.00, 'nadiak', 'Pass@121', 1);


--insert data into Student Table
Insert into Student
Values 
('29807010123456', N'Ahmed Ali', '01001234567', 'ahmeda', 'Pass@123', '1998-07-01'),
('30102230123456', N'Menna Hussien', '01104567890', 'menna', 'Pass@124', '2001-02-23'),
('29505030123456', N'Mohamed Ibrahim', '01009876543', 'mohamedi', 'Pass@125', '1995-05-03'),
('30210120123456', N'Sara Mahmoud', '01207894567', 'saram', 'Pass@126', '2002-10-12'),
('29912010123456', N'Yousif Khaled', '01506543210', 'yousefk', 'Pass@127', '1999-12-01'),
('29603050123456', N'Noor Ahmed', '01006547890', 'noura', 'Pass@128', '1996-03-05'),
('30308150123456', N'Laila Mostafa', '01103214567', 'leilam', 'Pass@129', '2003-08-15'),
('29707040123456', N'Mahmoud Omar', '01007654321', 'mahmoudo', 'Pass@130', '1997-07-04'),
('30001230123456', N'Hoda Hassan', '01201239876', 'hudah', 'Pass@131', '2000-01-23'),
('30404150123456', N'Fatma ALi', '01009832145', 'fatmaa', 'Pass@133', '2004-04-15'),
('29909230123456', N'Ali Mahmoud', '01105678901', 'alim', 'Pass@134', '1999-09-23'),
('29506120123456', N'Nadia Khaled', '01001209876', 'nadiak', 'Pass@135', '1995-06-12'),
('30003310123456', N'Khaled ALi', '01209832165', 'khaleda', 'Pass@136', '2000-03-31'),
('30112230123456', N'Noora Ahmed', '01507890123', 'nourah', 'Pass@137', '2001-12-23'),
('29804120123456', N'Amr Ali', '01001245678', 'amroa', 'Pass@138', '1998-04-12'),
('30306220123456', N'Menna ALi', '01106547890', 'mennaali', 'Pass@139', '2003-06-22'),
('29710120123456', N'Ashraf Hassan', '01506547892', 'ashrafa', 'Pass@142', '1997-10-12');

--insert data into Course table
insert into Course 
Values
('CS101', N'Introduction to CS', 50, 100),('IT202', N'Information Systems', 60, 100),
('DB303', N'Database Systems', 55, 100),('WD404', N'Web Development', 65, 100),
('AI505', N'Artificial Intelligence', 70, 100),('SE606', N'Software Engineering', 60, 100),
('ML707', N'Machine Learning', 75, 100),('CN808', N'Computer Networks', 65, 100),
('DM909', N'Data Mining', 70, 100),('CS111', N'Algorithms', 55, 100),
('IT222', N'Cyber Security', 60, 100),('DB333', N'Advanced Databases', 65, 100),
('WD444', N'Frontend Development', 60, 100),('AI555', N'Deep Learning', 80, 100),
('SE666', N'Agile Methods', 50, 100),('ML777', N'Big Data Analytics', 75, 100),
('CN888', N'Network Security', 65, 100),('DM999', N'Business Intelligence', 70, 100),
('CS121', N'Operating Systems', 55, 100),('IT232', N'Cloud Computing', 60, 100);

--insert data into branch 
insert into Branch (Brn_Name)
Values
(N'Cairo'),(N'Alexandria'),(N'Giza'),(N'Mansoura'),
(N'Tanta'),(N'Assiut'),(N'Monufia'),(N'Zagazig'),(N'Luxor'),(N'Aswan'),
(N'Damietta'),(N'Beni Suef'),(N'Qena'),(N'Hurghada'),(N'Sharm El Sheikh'),(N'Port Said'),
(N'Ismailia'),(N'Suez'),(N'Arish'),(N'Matrouh');

--insert data into Department
insert into Department
values 
('SD'),('IT'),('Cs'),('Is'),('Ai');

--insert data into Track
Insert into Track
Values
(N'Artificial Intelligence',5),
(N'Data Science',5),
(N'Cyber Security',5),
(N'Internet of Things (IoT)',3),
(N'Full Stack Development',4),
(N'Game Development',2),
(N'Mobile Development',4),
(N'Business Intelligence',5),
(N'Embedded Systems',5),
(N'Cloud Computing',3),
(N'UI/UX Design',4),
(N'Machine Learning',5),
(N'Computer Vision',2),
(N'Big Data',1),
(N'Quality Assurance',1),
(N'Network Engineering',4),
(N'Blockchain',1),
(N'Robotics',5),
(N'Digital Marketing',3),
(N'IT Management',2);

--insert data into intake
insert into Intake 
values
(N'Intake 41'),(N'Intake 42'),(N'Intake 43'),(N'Intake 44'),(N'Intake 45'),(N'Intake 46'),(N'Intake 47'),(N'Intake 48'),
(N'Intake 49'),(N'Intake 50'),(N'Intake 51'),(N'Intake 52'),(N'Intake 53'),(N'Intake 54'),(N'Intake 55'),(N'Intake 56'),
(N'Intake 57'),(N'Intake 58'),(N'Intake 59'),(N'Intake 60');


--insert data into Exam
Insert into Exam 
Values
(120, 100, '09:00', '11:00', 'Exam', 'CS101', 1),
(90, 80, '10:00', '11:30', 'Corrective', 'IT202', 2),
(150, 100, '14:00', '16:30', 'Exam', 'DB303', 3),
(120, 100, '11:00', '13:00', 'Exam', 'WD404', 4),
(60, 50, '08:00', '09:00', 'Corrective', 'AI505', 5),
(180, 100, '12:00', '15:00', 'Exam', 'SE606', 6),
(120, 100, '09:30', '11:30', 'Corrective', 'ML707', 7),
(150, 100, '10:30', '13:00', 'Exam', 'CN808', 8),
(90, 75, '15:00', '16:30', 'Corrective', 'DM909', 9),
(120, 100, '09:00', '11:00', 'Exam', 'CS111', 10),
(60, 60, '13:00', '14:00', 'Corrective', 'IT222', 11),
(180, 100, '11:00', '14:00', 'Exam', 'DB333', 12),
(120, 100, '10:00', '12:00', 'Corrective', 'WD444', 13),
(90, 75, '14:30', '16:00', 'Exam', 'AI555', 14),
(150, 100, '08:30', '11:00', 'Exam', 'SE666', 9),
(120, 100, '10:00', '12:00', 'Corrective', 'ML777', 11),
(90, 80, '13:30', '15:00', 'Exam', 'CN888', 12),
(60, 50, '08:00', '09:00', 'Corrective', 'DM999', 10);


--insert data into Istructor_Course_Intake
Insert into Instructor_Course_Intake
Values
('CS101', 1, 1),
('IT202', 2, 2),
('DB303', 3, 3),
('WD404', 4, 4),
('AI505', 5, 5),
('SE606', 6, 6),
('ML707', 7, 7),
('CN808', 8, 8),
('DM909', 9, 9),
('CS111', 10, 10),
('IT222', 11, 11),
('DB333', 10, 12),
('WD444', 13, 13),
('AI555', 14, 14),
('SE666', 12, 15),
('ML777', 5, 16),
('CN888', 9, 17),
('DM999', 4, 18);


--insert data into Track Intake Exam Branch
Insert Into TrackIntakeExamBranch
Values
(1, 3, 2, 1, 2022),
(5, 21, 3, 2, 2025),
(10, 18,10, 3, 2024),
(2, 2, 5, 4, 2024),
(4, 3, 17, 5, 2022),
(3, 3, 10, 6, 2023),
(1, 7, 9, 7, 2022),
(8, 9, 18, 8, 2021),
(7,10, 1, 9, 2023),
(11, 11, 11, 10, 2020),
(5, 19, 14, 11, 2021),
(12, 20, 13, 12, 2020),
(13, 16, 10, 13, 2022),
(6, 5, 6, 14, 2023),
(3, 6, 7, 15, 2024),
(8, 16, 15, 16, 2025),
(14, 12, 11, 17, 2025);


--insert data into ExamAllowanceOptions
insert into ExmAllowanceOptions
Values
(1, N'Extra Time: 15 minutes'),
(2, N'Extra Time: 30 minutes'),
(1, N'Permission for Breaks'),
(2, N'Use of Calculator'),
(1, N'Extended Exam Duration'),
(1, N'Additional Reading Time'),
(3, N'Use of Notes'),
(3, N'Permission for Breaks'),
(2, N'Extended Exam Duration'),
(4, N'Extra Time: 10 minutes'),
(4, N'Use of Computer'),
(3, N'Additional Reading Time'),
(5, N'Use of Online Resources'),
(6, N'Extra Time: 20 minutes'),
(6, N'Use of Notes'),
(7, N'Permission for Breaks'),
(7, N'Extra Time: 15 minutes'),
(6, N'Use of Calculator');

--insert data into Student_Course
insert into Student_Course (NationalId, Crs_Code, FinalResult)
Values
('29505030123456', 'CS101', 90),
('29804120123456', 'IT202', 85),
('29505030123456', 'DB303', 88),
('30112230123456', 'WD404', 92),
('30404150123456', 'AI505', 78),
('29912010123456', 'SE606', 95),
('30112230123456', 'ML707', 89),
('29804120123456', 'CN808', 83),
('30001230123456', 'DM909', 91),
('29909230123456', 'CS111', 80),
('29909230123456', 'IT222', 76),
('29804120123456', 'DB333', 87),
('30102230123456', 'WD444', 90),
('29506120123456', 'AI555', 79),
('29909230123456', 'SE666', 94),
('30001230123456', 'ML777', 85),
('30306220123456', 'CN888', 88),
('29909230123456', 'DM999', 93);

--insert data into Class table
insert into Class
Values
(1, 2, 1),
(1, 2, 2),
(2, 3, 2),
(2, 3, 3),
(3, 5, 5),
(4, 6, 6),
(7, 6, 7),
(8, 3, 3),
(4, 5, 9),
(4, 10, 1),
(11, 7, 11),
(12, 21, 4),
(13, 8, 7),
(14, 10, 14),
(15, 5, 10),
(16, 11, 6),
(17, 20, 17),
(18, 20, 18);


--insert data into Question
Insert into Question
Values
('What is the syntax to declare a variable in C#?', 'Text'),
('In Java, a method can have more than one return statement. (True/False)', 'True & False'),
('Which of the following is the correct way to declare an array in Python?', 'Multiple choice'),
('What is the keyword used to create a class in Java?', 'Text'),
('In C#, which of the following is used to handle exceptions?', 'Multiple choice'),
('Is Python case-sensitive? (True/False)', 'True & False'),
('Which data type is used to represent text in C#?', 'Multiple choice'),
('Which of these is a valid variable name in JavaScript?', 'Multiple choice'),
('What does the `break` statement do in a loop?', 'Text'),
('Is it possible to call a method before it is defined in Java? (True/False)', 'True & False'),
('Which of these is the correct syntax for a `for` loop in C++?', 'Multiple choice'),
('What is the main difference between `==` and `===` in JavaScript?', 'Text'),
('Which of the following is the correct syntax to create a function in Python?', 'Multiple choice'),
('In SQL, which command is used to retrieve data from a database?', 'Multiple choice'),
('Which of the following keywords is used to define a constant in C#?', 'Multiple choice'),
('In Java, what is the return type of the `main` method?', 'Text'),
('What does the `continue` statement do in a loop?', 'Text'),
('Which of the following is used to comment a single line in JavaScript?', 'Multiple choice'),
('What is the output of the following code in C#: int x = 5; Console.WriteLine(x++);', 'Multiple choice'),
('In Java, can an abstract class have a constructor? (True/False)', 'True & False'),
('Which of the following is a valid function declaration in JavaScript?', 'Multiple choice'),
('What is the correct syntax to create an object in Java?', 'Multiple choice'),
('Which of the following is the correct syntax for an if statement in C++?', 'Multiple choice'),
('In Python, what will the `print` function output for the following code: print(3 * 2)?', 'Text'),
('What is the default value of a boolean variable in C#?', 'Text'),
('Can an interface in C# contain method implementations? (True/False)', 'True & False'),
('Which of the following is used to import a module in Python?', 'Multiple choice'),
('What is the difference between `var` and `let` in JavaScript?', 'Text'),
('In C++, what is the purpose of the `cin` object?', 'Text'),
('Which of these statements correctly defines a constant in C#?', 'Multiple choice'),
('Which of the following data types can be used to represent a decimal value in Java?', 'Multiple choice'),
('In SQL, which command is used to modify an existing record in a table?', 'Multiple choice'),
('In C#, what does the `static` keyword mean when applied to a method?', 'Text'),
('Which of the following is the correct way to declare a function in PHP?', 'Multiple choice'),
('In Java, which of these is the correct way to handle exceptions using try-catch?', 'Multiple choice'),
('What does the `void` keyword mean in C#?', 'Text');

--insert data into CorrectAnswer table
Insert into CorrectChoice
Values
(3,'arr = [1, 2, 3, 4]'),
(3,'import array as arr_module; arr = arr_module.array(i, [1, 2, 3, 4])'),
(3,'import numpy as np; arr = np.array([1, 2, 3, 4])'),
(5,'try-catch block'),
(5,'try-Finally block'),
(5,'try-catch-finally block'),
(5,'throw statement'),
(7,'string'),
(7,'char'),
(8,'var'),
(8,'const'),
(8,'let'),
(14, 'select'),
(15,'const');


--insert data into WrongChoice
Insert into WrongChoice
Values
(3,'arr = array(i, [1, 2, 3, 4])'),
(3,'arr = (1, 2, 3, 4)'),
(5,'on error resume next'),
(5,'try-catch-resume block'),
(7,'int'),
(7,'float'),
(7, 'double'),
(8, 'string'),
(8, 'nvarchar'),
(14,'insert'),
(14,'Update'),
(14,'Delete'),
(15,'int'),
(15,'var'),
(15,'static');

--insert data into TrueOrFalse table
Insert into TrueOrFalse
values
(2,1),
(6,1),
(10,1),
(20,1),
(26,1);

--insert data into Q_Exam
insert into Question_Exam
values 
(1,1),(5,1),(7,1),(15,1),(17,1),(19,1),(25,1),(26,1),(30,1),(33,1),(36,1),
(2,2),(4,2),(10,2),(16,2),(20,2),(22,2),(31,2)
