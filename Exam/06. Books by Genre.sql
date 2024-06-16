SELECT 
b.Id, 
b.Title,
b.ISBN,
g.[Name]
FROM Books AS b
JOIN Genres AS g ON b.GenreId = g.Id
WHERE g.[Name] IN ('Biography', 'Historical Fiction' )
ORDER BY g.[Name], b.Title