 
 -- method 1
 SELECT
      FirstName,
	  LastName
 FROM Employees
 WHERE LastName LIKE '%ei%';

  -- method 2
 SELECT
      FirstName,
	  LastName
 FROM Employees
 WHERE CHARINDEX('ei', LastName) >0