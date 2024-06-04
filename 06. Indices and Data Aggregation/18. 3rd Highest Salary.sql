  SELECT 
DISTINCT DepartmentID,  -- използваме DISTINCT, за да изберем само уникални стойности (за да няма повтаряне на данни) 
		 Salary AS ThirdHighestSalary
    FROM 
		   (
			SELECT 
				   DepartmentID,
				   Salary,
				   DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) 
				AS SalaryRank
			  FROM Employees
			)
      AS SalaryRankingSubquery
   WHERE SalaryRank =3
