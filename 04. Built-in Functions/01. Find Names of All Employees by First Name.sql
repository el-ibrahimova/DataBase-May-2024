USE SoftUniLab
GO

 -- method 1
SELECT
	  FirstName,
	  LastName
 FROM Employees
WHERE LEFT(FirstName, 2) = 'Sa';

 -- method 2
 SELECT
      FirstName,
	  LastName
 FROM Employees
 WHERE	 FirstName LIKE 'Sa%';