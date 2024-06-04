 SELECT *
   INTO EmployeesWithSalaryOver30000 -- ��������� ���� �������
   FROM Employees
  WHERE Salary > 30000

  DELETE 
    FROM EmployeesWithSalaryOver30000 
   WHERE ManagerId = 42;

   UPDATE EmployeesWithSalaryOver30000
      SET Salary +=5000
    WHERE DepartmentID =1

   SELECT 
	      DepartmentID,
		  AVG (Salary) AS AverageSalary
	 FROM EmployeesWithSalaryOver30000
 GROUP BY DepartmentID

-- ��� ������ �� ������� ����� � ������ ������, �� ����� �� ���� �� �������� ������, � ����� �� ��������� � 0 ��� 1 ���� ������ � ��������� ������ ��� ��. �� � ����� ��������� �� �� �������� ������� �����.
-- ����� �� �������� ���� �� ������� �����

-- Instead of delete in real world
ALTER TABLE EmployeesWithSalaryOver30000
        ADD IsDeleted BIT DEFAULT (0) NOT NULL

-- Select all non-deleted employees
SELECT *
  FROM EmployeesWithSalaryOver30000
 WHERE IsDeleted =0

-- Delete all with ManagerID =3
UPDATE EmployeesWithSalaryOver30000
   SET IsDeleted =1
 WHERE ManagerID =3