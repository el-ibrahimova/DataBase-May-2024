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
FROM Employees;

-- 05. Find Full Name of Each Employee
SELECT 
	FirstName,
	MiddleName,
	LastName 
FROM Employees;

-- 06. Find Email Address of Each Employee  - този е по-правилният начин, за да избернем двоен интервал или двойни точки, както и NULL, ако една от двете стойности е NULL
SELECT CONCAT(FirstName, '.', LastName, '@', 'softuni.bg')
AS [Full Email Address]
FROM Employees;

-- 06. Find Email Address of Each Employee - with + operator
SELECT FirstName + '.' + LastName + '@' + 'softuni.bg'
AS [Full Email Address]
FROM Employees;

--07. Find All Different Employees' Salaries
		--DISTINCT - връща само уникални стойности
SELECT DISTINCT Salary
FROM Employees;

--08. Find All Information About Employees
SELECT 
* 
FROM Employees
WHERE JobTitle = 'Sales Representative';

--09. Find Names of All Employees by Salary in Range