	-- method 1
	SELECT TOP 10
	       e.FirstName,
	       e.LastName,
		   e.DepartmentID		  
	  FROM Employees
	    AS e
	 WHERE e.Salary >
			(	
			      SELECT 
					     AVG(Salary) AS AverageSalary
					FROM Employees
					  AS eSub
				   WHERE eSub.DepartmentID = e.DepartmentID
				GROUP BY DepartmentID
				)
   ORDER BY e.DepartmentID


   -- method 2
   WITH a AS
   (
     SELECT 
			DepartmentID,
			AVG(Salary) AS AverageSalaryPerDepartment
	   FROM Employees
   GROUP BY DepartmentID
	)
   
     SELECT TOP 10
		    b.FirstName,
		    b.LastName,
		    b.DepartmentID
       FROM Employees AS b
       JOIN a ON a.DepartmentID = b.DepartmentID
      WHERE b.Salary > a.AverageSalaryPerDepartment
   ORDER BY a.DepartmentID
	