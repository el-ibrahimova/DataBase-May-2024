    SELECT TOP 5
	       e.EmployeeID,
           e.JobTitle,
           e.AddressID,
           a.AddressText
      FROM Employees 
	    AS e 
 LEFT JOIN Addresses -- използваме LEFT JOIN, защото в таблицата Employees в колоната AddressID е зададено NULL 
                     -- и е възможно да изпуснем работник, който не е въвел адрес
	    AS a 
	    ON e.AddressID = a.AddressID
  ORDER BY e.AddressID
	  