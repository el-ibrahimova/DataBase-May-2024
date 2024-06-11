SELECT 
		c.Id,
		CONCAT(c.FirstName, ' ', c.LastName) AS CreatorName,
		c.Email
FROM Creators AS c
LEFT JOIN CreatorsBoardgames AS cb ON c.Id = cb.CreatorId 
LEFT JOIN Boardgames AS b ON cb.BoardgameId = b.Id
WHERE b.Id IS NULL
ORDER BY c.FirstName