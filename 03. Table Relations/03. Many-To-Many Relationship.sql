-- 03. Many-To-Many Relationship

CREATE TABLE Students
(
	StudentID INT PRIMARY KEY IDENTITY ,
	[Name] NVARCHAR (50) NOT NULL
)

CREATE TABLE Exams
(
	ExamID INT PRIMARY KEY IDENTITY (101, 1) ,
	[Name] VARCHAR (100) NOT NULL
)

-- създаваме Mapping таблица = със композитен ключ, съдържащ и двете колони = Many-To-Many релация
CREATE TABLE StudentsExams
(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
	ExamID INT FOREIGN KEY REFERENCES Exams(ExamID) NOT NULL
	--- може да има и други колкони, но завършва винаги с компзитния ключ
	PRIMARY KEY (StudentID, ExamID)
)

INSERT INTO Students([Name])
     VALUES 
			('Mila'),
			('Toni'),
			('Ron');

INSERT INTO Exams([Name])
	 VALUES 
			('SpringMVC'),
			('Neo4j'),
			('Oracle 11g');

INSERT INTO StudentsExams(StudentID, ExamID)
	 VALUES 
			(1, 101),
			(1, 102),
			(2, 101);

INSERT INTO StudentsExams(StudentID, ExamID)
	 VALUES 
			(3, 103),
			(2, 102),
			(2, 103);


SELECT * FROM StudentsExams