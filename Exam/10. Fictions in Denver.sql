SELECT 
a.[Name] AS Author,
b.Title,
l.[Name] AS [Library],
c.PostAddress AS [Library Address]
FROM Books AS b
JOIN Genres AS g ON b.GenreId = g.Id
JOIN LibrariesBooks AS lb ON lb.BookId = b.Id
JOIN Libraries AS l ON l.Id=lb.LibraryId
JOIN Contacts AS c ON c.Id= l.ContactId
JOIN Authors AS a ON b.AuthorId= a.Id
WHERE g.[Name] LIKE 'Fiction%'
AND c.PostAddress LIKE '%Denver%'
ORDER BY b.Title