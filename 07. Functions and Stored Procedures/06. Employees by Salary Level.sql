USE SoftUniLab
GO

CREATE PROC usp_EmployeesBySalaryLevel @salaryLevel VARCHAR (8)
		 AS
	  BEGIN
		  	 SELECT 
					FirstName AS [First Name],
					LastName AS [Last Name]
			   FROM Employees 
			   WHERE dbo.ufn_GetSalaryLevel(Salary)= @salaryLevel	   
	   END

	EXEC dbo.usp_EmployeesBySalaryLevel 'High'