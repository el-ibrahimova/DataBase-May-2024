CREATE PROCEDURE usp_GetEmployeesFromTown @townName VARCHAR(50)
			  AS
		   BEGIN
				SELECT 
					   FirstName AS [First Name],
					   LastName AS [Last Name]
				  FROM Employees AS e
			      JOIN Addresses AS a ON e.AddressID = a.AddressID
				  JOIN Towns AS t ON a.TownID = t.TownID							  
			     WHERE t.[Name] = @townName		
			 END

EXEC dbo.usp_GetEmployeesFromTown 'Sofia'

