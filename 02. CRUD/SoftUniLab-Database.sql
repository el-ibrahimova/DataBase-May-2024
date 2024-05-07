SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE DepartmentID =1

-- ��������� �� ��� ������� �� ���� ������ DepartmentID
SELECT FirstName, LastName, Salary, d.[Name]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1

-- ��������� �� ������� �� �������� �� ��������� ����
SELECT 
	FirstName AS [���]
	,LastName AS [�������]
	,Salary AS [�������]
	,d.[Name] AS [�����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1

-- ��������� �� ������� �� ��������� �� ���������� �� ���������
SELECT 
	FirstName AS [���]
	,LastName AS [�������]
	,Salary AS [�������]
	,d.[Name] AS [�����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
ORDER BY Salary DESC

-- �������� �� ������ � ���-�������� �������
SELECT TOP 1
	FirstName AS [���]
	,LastName AS [�������]
	,Salary AS [�������]
	,d.[Name] AS [�����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
ORDER BY Salary DESC

-- ������� �����, ��������� � ��������� �� ������ � ���� ������
SELECT 
	CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [���]
--  FirstName + ' ' + MiddleName + ' ' + LastName AS [���]   - ���� � �� ���� �����, �� ��� ���� �� �� ������ ������, ��-�������� � �� �� �������� CONCAT_WS
--  CONCAT_WS(FirstName, ' ', MiddleName, ' ', LastName) AS [���]   - � ���� ����, �� ������ ������� � ��-��������
	,Salary AS [�������]
	,d.[Name] AS [�����]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
ORDER BY Salary DESC