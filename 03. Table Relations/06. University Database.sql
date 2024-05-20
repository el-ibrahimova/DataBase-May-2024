CREATE DATABASE UniversityDatabase
GO

USE UniversityDatabase

CREATE TABLE Majors
(
	MajorID INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR (50) NOT NULL
)

CREATE TABLE Subjects
(
	SubjectID INT PRIMARY KEY IDENTITY,
	SubjectName NVARCHAR (100) NOT NULL
)

CREATE TABLE Students
(
	StudentID INT PRIMARY KEY IDENTITY,
	StudentNumber VARCHAR(20) NOT NULL,
	StudentName NVARCHAR(50) NOT NULL,
	MajorID INT NOT NULL FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Agenda
(
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
	SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
	PRIMARY KEY (StudentID, SubjectID)
) 

CREATE TABLE Payments 
(
	PaimentID INT PRIMARY KEY IDENTITY, -- в реален проект е добре да използваме тип данни GUID
	PaymentDate DATETIME2 NOT NULL,
	PaymentAmount DECIMAL (8,2) NOT NULL,
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)