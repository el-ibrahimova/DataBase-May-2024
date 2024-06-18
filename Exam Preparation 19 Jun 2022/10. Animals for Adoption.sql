   SELECT
          a.[Name],
          DATEPART(YEAR, a.BirthDate) AS BirthYear,
          t.AnimalType
     FROM Animals AS a
     JOIN AnimalTypes AS t ON a.AnimalTypeId = t.Id
    WHERE a.OwnerId IS NULL
      AND (DATEDIFF(YEAR, a.BirthDate, '01/01/2022' ))<5
      AND t.AnimalType <> 'Birds'
ORDER BY a.[Name]


