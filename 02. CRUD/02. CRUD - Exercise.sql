USE [SoftUniLab]

GO

-- 02. Find All the Information About Departments
SELECT * FROM Departments;

-- 03. Find all Department Names
SELECT [Name] FROM Departments;

-- 04. Find Salary of Each Employee
SELECT 
	FirstName, 
	LastName, 
	Salary 
FROM Employees

-- 05. Find Full Name of Each Employee
SELECT 
	FirstName + ' '+ LastName 
FROM Employees