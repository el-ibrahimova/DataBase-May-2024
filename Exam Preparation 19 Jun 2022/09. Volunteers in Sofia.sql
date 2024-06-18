  SELECT 
         v.[Name],
         v.PhoneNumber,
         TRIM(REPLACE(REPLACE(v.[Address], 'Sofia', ''), ',', '')) AS [Address]
    FROM Volunteers AS v
    JOIN VolunteersDepartments AS d ON v.DepartmentId = d.Id
   WHERE d.DepartmentName = 'Education program assistant' 
     AND v.[Address] LIKE '%Sofia%'
ORDER BY v.[Name]