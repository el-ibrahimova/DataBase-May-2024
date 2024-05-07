SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE DepartmentID =1

SELECT FirstName, LastName, Salary, d.[Name]
FROM Employees AS e JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
WHERE e.DepartmentID =1
