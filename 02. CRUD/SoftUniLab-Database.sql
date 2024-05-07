SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE DepartmentID =1;

-- свързване на две таблици по обща колона DepartmentID
SELECT FirstName, LastName, Salary, d.[Name]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1;

-- изписване на имената на колоните на български език
SELECT 
	FirstName AS [Име]
	,LastName AS [Фамилия]
	,Salary AS [Заплата]
	,d.[Name] AS [Отдел]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1;

-- сортиране на данните от таблицата по големината на заплатата
SELECT 
	FirstName AS [Име]
	,LastName AS [Фамилия]
	,Salary AS [Заплата]
	,d.[Name] AS [Отдел]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
ORDER BY Salary DESC;

-- избиране на човека с най-високата заплата
SELECT TOP 1
	FirstName AS [Име]
	,LastName AS [Фамилия]
	,Salary AS [Заплата]
	,d.[Name] AS [Отдел]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
ORDER BY Salary DESC;

-- сливаме името, презимето и фамилията на човека в една колона
SELECT 
	CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [Име]
--  FirstName + ' ' + MiddleName + ' ' + LastName AS [Име]   - може и по този начин, но тук може да се случат грешки, по-правилно е да се използва CONCAT_WS
--  CONCAT_WS(FirstName, ' ', MiddleName, ' ', LastName) AS [Име]   - и така може, но горния вариант е по-правилен
	,Salary AS [Заплата]
	,d.[Name] AS [Отдел]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
ORDER BY Salary DESC;

-- свързваме още една таблица Towns и изписваме колоната с името на града
SELECT 
	CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [Име]
	,Salary AS [Заплата]
	,d.[Name] AS [Отдел]
	,t.[Name] AS [Град]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
JOIN Addresses AS a ON e.AddressID = a.AddressID
JOIN Towns AS t ON a.TownID = t.TownID
WHERE d.[Name] = 'Engineering'
ORDER BY Salary DESC;

-- записваме кода със заявката под името v_EngineeringEmployeesBySalary, за да може да го преизползваме 
CREATE VIEW v_EngineeringEmployeesBySalary AS SELECT 
	CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [Име]
	,Salary AS [Заплата]
	,d.[Name] AS [Отдел]
	,t.[Name] AS [Град]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
JOIN Addresses AS a ON e.AddressID = a.AddressID
JOIN Towns AS t ON a.TownID = t.TownID
WHERE d.[Name] = 'Engineering';

SELECT * FROM v_EngineeringEmployeesBySalary
ORDER BY [Заплата];