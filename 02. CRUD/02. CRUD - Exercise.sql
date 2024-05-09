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

-- 06. Find Email Address of Each Employee  - ���� � ��-���������� �����, �� �� �������� ����� �������� ��� ������ �����, ����� � NULL, ��� ���� �� ����� ��������� � NULL
SELECT CONCAT(FirstName, '.', LastName, '@', 'softuni.bg')
AS [Full Email Address]
FROM Employees;

-- 06. Find Email Address of Each Employee - with + operator
SELECT FirstName + '.' + LastName + '@' + 'softuni.bg'
AS [Full Email Address]
FROM Employees;

--07. Find All Different Employees' Salaries
		--DISTINCT - ����� ���� �������� ���������
SELECT DISTINCT Salary
FROM Employees;

--08. Find All Information About Employees
SELECT 
* 
FROM Employees
WHERE JobTitle = 'Sales Representative';

--09. Find Names of All Employees by Salary in Range
SELECT
	FirstName,
	LastName, 
	JobTitle
FROM Employees
WHERE Salary BETWEEN 20000 AND 30000;

--10. Find Names of All Employees
SELECT CONCAT(FirstName, ' ', MiddleName, ' ', LastName)
-- SELECT_WS(' ', FirstName, MiddleName, LastName) - ���� � �� ���� ����� Select_WithSeparator, ���� ����� ������� � ����� �� ���������, ����� ����� ��������
AS [Full Name]
FROM Employees
WHERE Salary IN (25000, 14000, 12500, 23600);  -- ���������� �� ��������� � ���� �� ���� � �������

-- 11. Find All Employees Without a Manager
SELECT 
FirstName
,LastName
FROM Employees
WHERE ManagerID IS NULL -- ����������� �� �������� � IS � IS NOT

--12. Find All Employees with a Salary More Than 50000
SELECT 
	FirstName
	,LastName
	,Salary
FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC;

--13. Find 5 Best Paid Employees.