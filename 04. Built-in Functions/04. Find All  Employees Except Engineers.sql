-- method 1
SELECT 
	 FirstName,  
	 LastName
FROM Employees
WHERE CHARINDEX ('engineer', JobTitle) =0;

--method 2
SELECT 
	 FirstName,  
	 LastName
FROM Employees
WHERE JobTitle NOT LIKE  '%engineer%';