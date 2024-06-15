  SELECT DISTINCT
         TRIM(SUBSTRING(t.[Name], CHARINDEX(' ',t.[Name]), 20))AS LastName,
         t.Nationality,
         t.Age,
         t.PhoneNumber
    FROM Tourists AS t
    JOIN SitesTourists AS st ON st.TouristId=t.Id
    JOIN Sites AS s ON s.Id=st.SiteId
    JOIN Categories AS c ON s.CategoryId = c.Id
   WHERE c.[Name] = 'History and archaeology'
ORDER BY LastName