--SELECT * FROM VolunteersDepartments 
--WHERE DepartmentName = 'Education program assistant' -- =>2

--SELECT * FROM Volunteers
--WHERE DepartmentId =2  --=>  (1, 7, 15, 18, 19, 22)

DELETE 
FROM Volunteers
WHERE Id IN (1, 7, 15, 18, 19, 22)

DELETE 
FROM VolunteersDepartments
WHERE Id =2;