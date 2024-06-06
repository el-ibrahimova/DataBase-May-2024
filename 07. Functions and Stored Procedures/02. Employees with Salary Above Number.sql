CREATE OR ALTER PROCEDURE usp_GetEmployeesSalaryAboveNumber @minSalary DECIMAL (18,4)
			  AS
	       BEGIN
				SELECT
				   FirstName,
				   LastName
				   FROM Employees
				   WHERE Salary >= @minSalary			
			 END

	-- ��������� ����������� ��� ������� ��������� @minSalary = 48100
EXEC dbo.usp_GetEmployeesSalaryAboveNumber 48100