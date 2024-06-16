CREATE PROCEDURE usp_SearchByGenre(@genreName NVARCHAR(30)) 
AS
BEGIN
	SELECT 
	b.Title,
	b.YearPublished AS [Year],
	b.ISBN,
	a.[Name] AS Author,
	g.[Name] AS Genre
	FROM Genres AS g
	JOIN Books AS b ON g.Id = b.GenreId
	JOIN Authors AS a ON a.Id = b.AuthorId
	WHERE g.[Name] = @genreName
	ORDER BY b.Title 
END