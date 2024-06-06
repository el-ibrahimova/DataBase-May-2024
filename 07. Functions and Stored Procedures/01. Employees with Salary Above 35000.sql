USE SoftUniLab
GO

-- � Judge �� ����� CREATE OR ALTER, ������ �� �� ������, ����� ���� CREATE PROCEDURE
CREATE OR ALTER PROCEDURE usp_GetEmployeesSalaryAbove35000
              AS
		   BEGIN
				SELECT
				       FirstName,
					   LastName
				  FROM Employees
				 WHERE Salary > 35000		  
		     END

EXEC dbo.usp_GetEmployeesSalaryAbove35000  -- �� ���� ����� ��������� ������������ �� �����������