CREATE PROCEDURE usp_DeleteEmployeesFromDepartment (@departmentId INT)
			  AS
           BEGIN  -- създаваме таблица, в която ще съхраним Id-тата на всички работници, които ще изтрием
				DECLARE @employeesToDelete TABLE (Id INT)

				INSERT INTO @employeesToDelete 				
			    	        SELECT EmployeeId
				              FROM Employees
				             WHERE DepartmentID = @departmentId

			-- работниците, които се каним да изтрием, могат да работят по някакви проекти = > трябва да откачим
			-- релациите от Employees към EmployeesProjects

			   DELETE 
			   FROM EmployeesProjects
			   WHERE EmployeeID IN ( SELECT Id FROM @employeesToDelete)
				
				-- работниците, които искаме да изтрием, могат да са мениджъри на някои отдели, затова 
				-- трябва да задедем NULL на ManagerID във всички отдели, в които ще трием
				-- 1. Редактираме колоната ManagerID с ALTER 

				ALTER TABLE Departments
				ALTER COLUMN ManagerID INT 

				UPDATE Departments
				SET ManagerID = NULL
				WHERE ManagerID IN (SELECT Id FROM @employeesToDelete)

				-- работник, който искаме да изтрием, може ад бъде мениджър на друг работник. Затова 
				-- трябва да зададем NULL на ManagerID на всички работници с изтрити мениджъри

				UPDATE Employees
				SET ManagerID = NULL
				WHERE ManagerID IN (SELECT Id FROM @employeesToDelete)

				-- вече сме откачили всички релации и можем да трием записите от таблицата Employees

				DELETE 
				FROM Employees
				WHERE DepartmentID = @departmentId

				-- изтриваме и отдела
				DELETE 
				FROM Departments
				WHERE DepartmentID = @departmentId

				-- Правим заявка, която показва колко са останалите записи в отдела => 0, защото сме изтрили целия отдел 
				SELECT COUNT(*) 
				FROM Departments
				WHERE DepartmentID = @departmentId
             END

	EXEC dbo.usp_DeleteEmployeesFromDepartment 5