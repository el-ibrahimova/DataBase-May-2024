  SELECT 
         CONCAT(o.[Name], '-', a.[Name]) AS OwnersAnimals,
         o.PhoneNumber,
         c.CageId AS CageId
    FROM Animals AS a
    JOIN Owners AS o ON o.Id = a.OwnerId
    JOIN AnimalTypes AS t ON a.AnimalTypeId = t.Id 
    JOIN AnimalsCages AS c ON a.Id = c.AnimalId
   WHERE t.Id = 1 
ORDER BY o.[Name], 
         a.[Name] DESC
