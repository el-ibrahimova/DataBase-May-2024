 SELECT TOP 3
		  e.EmployeeID,
		  e.FirstName
     FROM Employees AS e
LEFT JOIN EmployeesProjects AS ep 
       ON e.EmployeeID = ep.EmployeeID
    WHERE ep.ProjectID IS NULL
 ORDER BY e.EmployeeID

 -- използваме LEFT JOIN с идеята, че ако работника няма проект, в дясната таблица
 -- за номер на проект ще се изпише NULL, дори по условие да е зададено,
 -- че там е NOT NULL. С LEFT JOIN се показва, че там няма запис, който да има връза с лявата таблица