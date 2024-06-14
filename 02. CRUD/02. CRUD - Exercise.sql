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
SELECT
	FirstName,
	LastName, 
	JobTitle
FROM Employees
WHERE Salary BETWEEN 20000 AND 30000;

--10. Find Names of All Employees
SELECT CONCAT(FirstName, ' ', MiddleName, ' ', LastName)
-- CONCAT_WS(' ', FirstName, MiddleName, LastName) - може и по този начин Concat_WithSeparator, като първо казваме с какво ще разделяме, после пишем колоните
AS [Full Name]
FROM Employees
WHERE Salary IN (25000, 14000, 12500, 23600);  -- стойността на заплатата е една от тези в скобите

-- 11. Find All Employees Without a Manager
SELECT 
FirstName
,LastName
FROM Employees
WHERE ManagerID IS NULL -- сравнението се извършва с IS и IS NOT

--12. Find All Employees with a Salary More Than 50000
SELECT 
	FirstName
	,LastName
	,Salary
FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC;

--13. Find 5 Best Paid Employees
SELECT TOP (5)
	FirstName
	,LastName
FROM Employees
ORDER BY Salary DESC;

-- 14. Find All Employees Except Marketing
SELECT 
	FirstName
	,LastName
FROM Employees
WHERE DepartmentID <> 4;

--15. Sort Employees Table
   SELECT 
      * 
   FROM  Employees
ORDER BY Salary DESC,
		 FirstName,
	  	 LastNAme DESC,
		 MiddleName;
		 -- със запетайка изреждаме кои колони да се сортират и по какъв начин

-- 16. Create View Employees with Salaries
CREATE VIEW V_EmployeesSalaries
AS 
(
 SELECT FirstName, LastName, Salary
 FROM Employees
);

--17. Create View Employees with Job Titles
CREATE VIEW V_EmployeeNameJobTitle
	AS 
		(
		SELECT CONCAT (FirstName,' ', MiddleName, ' ', LastName)
		AS [Full Name]
		,[JobTitle]
		FROM Employees
		)		

--17. Create View Employees with Job Titles - without CONCAT
CREATE VIEW V_EmployeeNameJobTitle
	AS 
		(
		SELECT FirstName +' '+ ISNULL( MiddleName, ' ') + ' '+ LastName)
		AS [Full Name]
		,[JobTitle]
		FROM Employees;
		)
		--  в този случай ако MiddleName не е NULL, то взимаме неговата стойност, ako e NULL заместваме с ' '

--18. Distinct Job Titles
SELECT DISTINCT JobTitle
FROM Employees;

--19. Find First 10 Started Projects
  SELECT 
     TOP (10) *
    FROM Projects
ORDER BY StartDate,
         [Name];

-- 20. Last 7 Hired Employees
  SELECT
    TOP (7) FirstName,
        LastName,
        HireDate
   FROM Employees
ORDER BY HireDate DESC;

--21. Increase Salaries
SELECT *
FROM Employees;

SELECT DepartmentID
  FROM Departments
 WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services');
     -- с тази заявка намираме на кои ID-та са тези професии - 1, 2, 4, 11

	 -- горните са помощни заявки
	 -- в Judge качваме само долните 2

UPDATE Employees
   SET Salary += 0.12 * Salary
 WHERE DepartmentID IN (1,2,4,11);

SELECT Salary 
  FROM Employees;

  -- Advanced solution (subqueries)
  UPDATE Employees
     SET Salary += 0.12 * Salary
   WHERE DepartmentID IN ( 
							 SELECT DepartmentID
							   FROM Departments
							  WHERE [Name] IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services'
					   )

--22. All Mountain Peaks
USE Geography
GO

  SELECT PeakName
    FROM Peaks
ORDER BY PeakName

-- 23. Biggest Countries by Population
SELECT ContinentCode
  FROM Countries
-- първо проверяваме на кой код отговаря Европа

  SELECT 
     TOP (30) CountryName, [Population]
    FROM Countries
   WHERE ContinentCode = 'EU'
ORDER BY [Population] DESC,
         CountryName;

-- 24. *Countries and Currency (Euro / Not Euro)
-- CASE WHEN -> If CurrencyCode = 'EUR' then display 'Euro'
--				else display 'Not Euro'

  SELECT CountryName,
	     CountryCode,
	     CASE CurrencyCode
         WHEN 'EUR' THEN 'Euro'
         ELSE 'Not Euro'
         END
      AS Currency
    FROM Countries
ORDER BY CountryName;

--25. All Diablo Characters
USE Diablo
GO
 
   SELECT [Name]
     FROM Characters
 ORDER BY [Name];