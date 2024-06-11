
WITH GamesRankedByCreator AS
(
	SELECT 
	       CONCAT(c.FirstName, ' ', c.LastName)AS FullName,
	       c.Email,
	       b.Rating, 
	       RANK() OVER (PARTITION BY c.Email ORDER BY b.Rating DESC) AS GameRank
	  FROM Creators AS c
	  JOIN CreatorsBoardgames AS cb ON c.Id = cb.CreatorId
	  JOIN Boardgames AS b ON cb.BoardgameId = b.Id
	 WHERE c.Email LIKE '%.com' 
)

SELECT 
	     FullName, 
	     Email,
     	 Rating
    FROM GamesRankedByCreator
   WHERE GameRank = 1
ORDER BY FullName