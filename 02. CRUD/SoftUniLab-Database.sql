SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE DepartmentID =1;

-- ��������� �� ��� ������� �� ���� ������ DepartmentID
SELECT FirstName, LastName, Salary, d.[Name]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1;

-- ��������� �� ������� �� �������� �� ��������� ����
SELECT 
	FirstName AS [���]
	,LastName AS [�������]
	,Salary AS [�������]
	,d.[Name] AS [�����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1;

-- ��������� �� ������� �� ��������� �� ���������� �� ���������
SELECT 
	FirstName AS [���]
	,LastName AS [�������]
	,Salary AS [�������]
	,d.[Name] AS [�����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
ORDER BY Salary DESC;

-- �������� �� ������ � ���-�������� �������
SELECT TOP 1
	FirstName AS [���]
	,LastName AS [�������]
	,Salary AS [�������]
	,d.[Name] AS [�����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
ORDER BY Salary DESC;

-- ������� �����, ��������� � ��������� �� ������ � ���� ������
SELECT 
	CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [���]
--  FirstName + ' ' + MiddleName + ' ' + LastName AS [���]   - ���� � �� ���� �����, �� ��� ���� �� �� ������ ������, ��-�������� � �� �� �������� CONCAT_WS
--  CONCAT_WS(FirstName, ' ', MiddleName, ' ', LastName) AS [���]   - � ���� ����, �� ������ ������� � ��-��������
	,Salary AS [�������]
	,d.[Name] AS [�����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
ORDER BY Salary DESC;

-- ��������� ��� ���� ������� Towns � ��������� �������� � ����� �� �����
SELECT 
	CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [���]
	,Salary AS [�������]
	,d.[Name] AS [�����]
	,t.[Name] AS [����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
JOIN Addresses AS a ON e.AddressID = a.AddressID
JOIN Towns AS t ON a.TownID = t.TownID
WHERE d.[Name] = 'Engineering'
ORDER BY Salary DESC;

-- ��������� ���� ��� �������� ��� ����� v_EngineeringEmployeesBySalary, �� �� ���� �� �� ������������� 
CREATE VIEW v_EngineeringEmployeesBySalary AS SELECT 
	CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [���]
	,Salary AS [�������]
	,d.[Name] AS [�����]
	,t.[Name] AS [����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
JOIN Addresses AS a ON e.AddressID = a.AddressID
JOIN Towns AS t ON a.TownID = t.TownID
WHERE d.[Name] = 'Engineering';

SELECT * FROM v_EngineeringEmployeesBySalary
ORDER BY [�������];