CREATE PROCEDURE usp_DeleteEmployeesFromDepartment (@departmentId INT)
			  AS
           BEGIN  -- ��������� �������, � ����� �� �������� Id-���� �� ������ ���������, ����� �� �������
				DECLARE @employeesToDelete TABLE (Id INT)

				INSERT INTO @employeesToDelete 				
			    	        SELECT EmployeeId
				              FROM Employees
				             WHERE DepartmentID = @departmentId

			-- �����������, ����� �� ����� �� �������, ����� �� ������� �� ������� ������� = > ������ �� �������
			-- ��������� �� Employees ��� EmployeesProjects

			   DELETE 
			   FROM EmployeesProjects
			   WHERE EmployeeID IN ( SELECT Id FROM @employeesToDelete)
				
				-- �����������, ����� ������ �� �������, ����� �� �� ��������� �� ����� ������, ������ 
				-- ������ �� ������� NULL �� ManagerID ��� ������ ������, � ����� �� �����
				-- 1. ����������� �������� ManagerID � ALTER 

				ALTER TABLE Departments
				ALTER COLUMN ManagerID INT 

				UPDATE Departments
				SET ManagerID = NULL
				WHERE ManagerID IN (SELECT Id FROM @employeesToDelete)

				-- ��������, ����� ������ �� �������, ���� �� ���� �������� �� ���� ��������. ������ 
				-- ������ �� ������� NULL �� ManagerID �� ������ ��������� � ������� ���������

				UPDATE Employees
				SET ManagerID = NULL
				WHERE ManagerID IN (SELECT Id FROM @employeesToDelete)

				-- ���� ��� �������� ������ ������� � ����� �� ����� �������� �� ��������� Employees

				DELETE 
				FROM Employees
				WHERE DepartmentID = @departmentId

				-- ��������� � ������
				DELETE 
				FROM Departments
				WHERE DepartmentID = @departmentId

				-- ������ ������, ����� ������� ����� �� ���������� ������ � ������ => 0, ������ ��� ������� ����� ����� 
				SELECT COUNT(*) 
				FROM Departments
				WHERE DepartmentID = @departmentId
             END

	EXEC dbo.usp_DeleteEmployeesFromDepartment 5