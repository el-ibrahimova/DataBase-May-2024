CREATE PROCEDURE usp_SearchByCategory(@category VARCHAR(50))
AS
BEGIN
	SELECT 
	         b.[Name],
	         b.YearPublished,
	         b.Rating,
	         c.[Name] AS CategoryName,
	         p.[Name] AS PublisherName, 
             CONCAT(pr.PlayersMin, ' people') AS MinPlayers,
	         CONCAT(pr.PlayersMax, ' people') AS MaxPlayers
	    FROM Categories AS c
	    JOIN Boardgames AS B ON c.Id = b.CategoryId
	    JOIN Publishers AS p ON p.Id = b.PublisherId
	    JOIN PlayersRanges AS pr ON b.PlayersRangeId = pr.Id
	   WHERE c.[Name] = @category
	ORDER BY p.[Name],
			 b.YearPublished DESC
END