SELECT distinct
l.[Name] AS [Library],
c.Email
FROM Libraries AS l
JOIN LibrariesBooks AS lb ON l.Id = lb.LibraryId
JOIN Books AS b ON lb.BookId= b.Id
JOIN Contacts AS c ON c.Id = l.ContactId
GROUP BY l.[Name], c.Email
HAVING SUM (CASE WHEN b.GenreId=1 THEN 1 ELSE 0 END) =0
ORDER BY l.[Name]