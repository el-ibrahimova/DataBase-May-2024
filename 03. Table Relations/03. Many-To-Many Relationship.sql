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

-- ��������� Mapping ������� = ��� ���������� ����, �������� � ����� ������ = Many-To-Many �������
CREATE TABLE StudentsExams
(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID) NOT NULL,
	ExamID INT FOREIGN KEY REFERENCES Exams(ExamID) NOT NULL
	--- ���� �� ��� � ����� �������, �� �������� ������ � ���������� ����
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